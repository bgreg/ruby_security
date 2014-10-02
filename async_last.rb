 def async_last_only(&block)
    # establish a mutually exclusive section for the main logic of this class.
    @last_only_sync_queue.async {
      @counter_queue.async { # NOTE ?? looks broken.
        self.increment
       
        pe_debug "#{self} queue count incremented to #{self.counter}"

        # queue block on the work queue. if jobs build up on the work queue, counter will exceed 1 and the earlier jobs will be skipped.
        @work_queue.async {
          
          # skip if counter > 1, else call the block 
          if self.counter > 1
            pe_log "#{self} counter==#{self.counter}, skipping"
          else
            begin
              pe_debug "#{self} running #{block}"
              block.call
            rescue Exception => e
              pe_debug "#{self} exception running #{block} : #{e.to_s}"
            end
          end

          pe_debug "#{self} queue count pre-decrement: #{self.counter}"
          self.decrement
        }
      }
    }
  end
