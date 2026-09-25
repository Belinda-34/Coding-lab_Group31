
#!/bin/bash
 
 process_vitals()
 {
   mkdir -p reports
   {
     grep "CRITICAL" active_logs/heart_rate_log.log
     grep "CRITICAL" active_logs/temperature_log.log
   }
}

 process_vitals
