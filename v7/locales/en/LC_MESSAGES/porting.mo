��    �      T              �
     �
     �
      �
  �   �
  R   C    �     �  �   �  A   �     �  l   �  a   F     �  �   �     c  �   w     Q     `     o  �   �           .     6    <     >  p  G     �  `   �  	   &     0  +   @  T   l  �   �  k   H  �  �  �   W  p     y   v  �   �      �  !   
  3   ,  �   `     �          %  K   <  
   �     �  N   �  4   �  9   *  <   d  '   �  '   �  A   �  /   3  1   c  @   �  '   �  &   �  =   %  P   c  2   �  U   �  �   =  \      (   p   	   �      �      �      �     �   Z   �!  f   @"  �   �"  %  S#     y$     �$     �$     �$     �$  ;   �$  o   %     |%     �%  �   �%  =   #&     a&     q&     ~&  Y   �&  j   �&  �   U'  �   �'  �   h(  T   �(  y   H)  _   �)  >   "*  $   a*  �   �*     Q+  �   `+  f   ,  j   x,  1   �,  )   -  }   ?-  �   �-  Y   �.  K   �.  1   0/     b/  S   |/  w   �/  b   H0     �0  I  �0  	   2  
   2  �  )2  {  �3     v5     5  i   �5       6  A   !6  R   c6  @   �6  $   �6  \   7  t   y7  �   �7  $   �8  u   �8     59  Z   M9  8   �9     �9  D   a:  M   �:  Z   �:  4   O;  /   �;  Y   �;  V   <  J   e<  �   �<  +   �=  3   �=  m   �=  �   N>  U   ?  /   s?  �   �?  w   @  �   �@  �   �A  y   �B  �  (C  >   �D     �D  Q   E  W   ZE     �E  |  �E     KG     OG      XG  �   yG  R   H    TH     ]I  �   dI  A   EJ     �J  l   �J  a   K     fK  �   yK     !L  �   5L     M     M     -M  �   ?M      �M     �M     �M    �M     �N  p  O     vP  `   �P  	   �P     �P  +   �P  T   *Q  �   Q  k   R  �  rR  �   T  p   �T  y   4U  �   �U      �V  !   �V  3   �V  �   W     �W     �W     �W  K   �W  
   FX     QX  N   dX  4   �X  9   �X  <   "Y  '   _Y  '   �Y  A   �Y  /   �Y  1   !Z  @   SZ  '   �Z  &   �Z  =   �Z  P   ![  2   r[  U   �[  �   �[  \   �\  (   .]  	   W]     a]     i]     }]    �]  Z   �^  f   �^  �   e_  %  `     7a     Wa     fa     na     a  ;   �a  o   �a     :b     Kb  �   \b  =   �b     c     /c     <c  Y   Nc  j   �c  �   d  �   �d  �   &e  T   �e  y   f  _   �f  >   �f  $   g  �   Dg     h  �   h  f   �h  j   6i  1   �i  )   �i  }   �i  �   {j  Y   Hk  K   �k  1   �k      l  S   :l  w   �l  b   m     im  I  �m  	   �n  
   �n  �  �n  {  �p     4r     =r  i   Tr      �r  A   �r  R   !s  @   ts  $   �s  \   �s  t   7t  �   �t  $   Xu  u   }u     �u  Z   v  8   fv     �v  D   w  M   dw  Z   �w  4   x  /   Bx  Y   rx  V   �x  J   #y  �   ny  +   >z  3   jz  m   �z  �   {  U   �{  /   1|  �   a|  w   =}  �   �}  �   �~  y   l  �  �  >   {�     ��  Q   Ɓ  W   �     p�   API Add logs All together it looks like this: An object group has to be created: lv_group_t * g = lv_group_create()  and objects have to be added to it with lv_group_add_obj(g, obj) Application Your application which creates the GUI and handles the specific tasks. Besides read_cb a feedback_cb callback can be also specified in lv_indev_drv_t. feedback_cb is called when any type of event is sent by the input devices. (independently from its type). It allows making feedback for the user e.g. to play a sound on LV_EVENT_CLICK. Button Buttons mean external "hardware" buttons next to the screen which are assigned to specific coordinates of the screen. If a button is pressed it will simulate the pressing on the assigned coordinate. (Similarly to a touchpad) By turning the encoder you can focus on the next/previous object. Call lv_init(). Call lv_task_handler() periodically in every few milliseconds to handle LittlevGL related tasks. Learn more. Call lv_tick_inc(x) in every x milliseconds in an interrupt to tell the elapsed time. Learn more. Configuration file Copy lvgl/lv_conf_template.h next to the lvgl directory and rename it to lv_conf.h. Open the file and change the #if 0 at the beginning to #if 1 to enable its content. Custom log function Depending on the MCU, there are two typical hardware set-ups. One with built-in LCD/TFT driver periphery and another without it. In both cases, a frame buffer will be required to store the current image of the screen. Display buffer Display driver Display interface Driver Besides your specific drivers, it contains functions to drive your display, optionally to a GPU and to read the touchpad or buttons. Enable LV_USE_GROUP in lv_conf.h Encoder Enums Every Input device is associated with a display. By default, a new input device is added to the lastly created or the explicitly selected (using lv_disp_set_default()) display. The associated display is stored and can be changed in disp field of the driver. Example: External display controller If the MCU doesn't have TFT/LCD driver interface then an external display controller (E.g. SSD1963, SSD1306, ILI9341) has to be used. In this case, the MCU can communicate with the display controller via Parallel port, SPI or sometimes I2C. The frame buffer is usually located in the display controller which saves a lot of RAM for the MCU. For example: Full keyboards with all the letters or simple keypads with a few navigation buttons belong here. Functions Get the library Here some simple examples of the callbacks: However, in the following conditions it's valid to call LittlevGL related functions: If you can't use printf or want to use a custom function to log, you can register a "logger" callback with lv_log_register_print_cb(). If you hold the keys it will simulate encoder click with period specified in indev_drv.long_press_rep_time. If you need to use real tasks or threads, you need a mutex which should be invoked before the call of lv_task_handler and released after it. Also, you have to use the same mutex in other tasks and threads around every LittlevGL (lv_...) related function calls and codes. This way you can use LittlevGL in a real multitasking environment. Just make use of a mutex to avoid the concurrent calling of LittlevGL functions. If you press the encoder on a complex object (like a list, message box, etc.) the object will go to edit mode whereby turning the encoder you can navigate inside the object. If your system supports printf, you just need to enable LV_LOG_PRINTF in lv_conf.h to send the logs with printf. In addition to lv_disp_get_inactive_time() you can check lv_anim_count_running() to see if every animations are finished. In addition to standar encoder behavior, you can also utilise its logic to navigate(focus) and edit widgets using buttons. This is especialy handy if you have only few buttons avalible, or you want to use other buttons in addition to encoder wheel. In events. Learn more in Events. In lv_tasks. Learn more in Tasks. In short, the Encoder input devices work like this: In the config file comments explain the meaning of the options. Check at least these three configuration options and modify them according to your hardware: Initialization Initialize your drivers. Input device interface Input devices which can click points of the screen belong to this category. Interrupts Keypad or keyboard LV_COLOR_DEPTH 8 for (RG332), 16 for (RGB565) or 32 for (RGB888 and ARGB8888). LV_HOR_RES_MAX Your display's horizontal resolution. LV_INDEV_TYPE_BUTTON external buttons pressing the screen LV_INDEV_TYPE_ENCODER encoder with left, right, push options LV_INDEV_TYPE_KEYPAD keyboard or keypad LV_INDEV_TYPE_POINTER touchpad or mouse LV_KEY_ENTER will simulate press or pushing of the encoder button LV_KEY_LEFT will simulate turnuing encoder left LV_KEY_RIGHT will simulate turnuing encoder right LV_LOG_LEVEL_ERROR Only critical issue, when the system may fail LV_LOG_LEVEL_INFO  Log important events LV_LOG_LEVEL_NONE  Do not log anything LV_LOG_LEVEL_TRACE A lot of logs to give detailed information LV_LOG_LEVEL_WARN  Log if something unwanted happened but didn't cause a problem LV_VER_RES_MAX Your display's vertical resolution. LittlevGL Graphics Library is available on GitHub: https://github.com/littlevgl/lvgl. LittlevGL The graphics library itself. Your application can communicate with the library to create a GUI. It contains a HAL (Hardware Abstraction Layer) interface to register your display and input device drivers. LittlevGL has built-in log module to inform the user about what is happening in the library. LittlevGL is not thread-safe by default. Log level Logging Logging with printf Long-press its button MCU with TFT/LCD driver If your MCU has a TFT/LCD driver periphery then you can connect a display directly via RGB interface. In this case, the frame buffer can be in the internal RAM (if the MCU has enough RAM) or in the external RAM (if the MCU has a memory interface). Note that, these functions need to draw to the memory (RAM) and not your display directly. On Linux based operating system (e.g. on Raspberry Pi) lv_tick_inc can be called in a thread as below: Once the buffer initialization is ready the display drivers need to be initialized. In the most simple case only the following two fields of lv_disp_drv_t needs to be set: One buffer LittlevGL draws the content of the screen into a buffer and sends it to the display. The buffer can be smaller than the screen. In this case, the larger areas will be redrawn in multiple parts. If only small areas changes (e.g. button press) then only those areas will be refreshed. Operating system and interrupts Other features Porting Press its button Public Members Register a read_cb function with LV_INDEV_TYPE_KEYPAD type. Register the display and input devices drivers in LittlevGL.  More about Display and Input device registration. Set-up a project Sleep management Some other optional callbacks to make easier and more optimal to work with monochrome, grayscale or other non-standard RGB displays: System architecture with Littlev Graphics Library (LittlevGL) System overview Task Handler Tasks and threads The LittlevGL needs a system tick to know the elapsed time for animation and other tasks. The MCU can go to sleep when no user input happens. In this case, the main while(1) should look like this: The created group has to be assigned to an input device: lv_indev_set_group(my_indev, g) (my_indev is the return value of lv_indev_drv_register) The default value of the following parameters can be set in lv_conf.h but the default value can be overwritten in lv_indev_drv_t: The events which have a higher level than the set log level will be logged too. E.g. if you LV_LOG_LEVEL_WARN, errors will be also logged. The graphics library is the lvgl directory which should be copied into your project. The points_array can't go out of scope. Either declare it as a global variable or as a static variable inside a function. The timing is not critical but it should be about 5 milliseconds to keep the system responsive. There are 3 possible configurations regarding the buffer size: There are some optional data fields: There is a configuration header file for LittlevGL called lv_conf.h. It sets the library's basic behaviour, disables unused modules and features, adjusts the size of memory buffers in compile-time, etc. Tick interface To assign buttons to coordinates use lv_indev_set_button_points(my_indev, points_array).points_array should look like const lv_point_t points_array[] =  { {12,30},{60,90}, ...} To enable logging, set LV_USE_LOG  1 in lv_conf.h and set LV_LOG_LEVEL to one of the following values: To handle the tasks of LittlevGL you need to call lv_task_handler() periodically in one of the followings: To learn more about task visit the Tasks section. To leave edit mode press long the button. To set a mouse cursor use lv_indev_set_cursor(my_indev, &img_cursor). (my_indev is the return value of lv_indev_drv_register) To set the fields of lv_disp_drv_t variable it needs to be initialized with lv_disp_drv_init(&disp_drv). And finally to register a display for LittlevGL lv_disp_drv_register(&disp_drv) needs to be called. To set up a display an lv_disp_buf_t and an lv_disp_drv_t variable has to be initialized. To set up an input device an lv_indev_drv_t variable has to be initialized: To use a GPU the following callbacks can be used: To use a keyboard/keypad: To use an Encoder (similarly to the Keypads) the objects should be added to groups. To use the graphics library you have to initialize it and the other components too. The order of the initialization is: Touchpad drivers must return the last X/Y coordinates even when the state is *LV_INDEV_STATE_REL*. Touchpad, mouse or any pointer Try to avoid calling LittlevGL functions from the interrupts (except lv_tick_inc() and lv_disp_flush_ready()). But, if you need to do this you have to disable the interrupt which uses LittlevGL functions while lv_task_handler is running. It's a better approach to set a flag or some value and periodically check it in an lv_task. Turn left Turn right Two non-screen-sized buffers having two buffers LittlevGL can draw into one buffer while the content of the other buffer is sent to display in the background. DMA or other hardware should be used to transfer the data to the display to let the CPU draw meanwhile. This way the rendering and refreshing of the display become parallel. Similarly to the One buffer, LittlevGL will draw the display's content in chunks if the buffer is smaller than the area to refresh. Two screen-sized buffers. In contrast to Two non-screen-sized buffers LittlevGL will always provide the whole screen's content not only chunks. This way the driver can simply change the address of the frame buffer to the buffer received from LittlevGL. Therefore this method works the best when the MCU has an LCD/TFT interface and the frame buffer is just a location in the RAM. Typedefs Types of input devices Use LV_KEY_... to navigate among the objects in the group. See lv_core/lv_group.h for the available keys. Using buttons with Encoder logic Visit Input devices to learn more about input devices in general. When you press the encoder on a simple object (like a button), it will be clicked. With FreeRTOS lv_tick_inc can be called in vApplicationTickHook. With an encoder you can do 4 things: You can also use the log module via the LV_LOG_TRACE/INFO/WARN/ERROR(description) functions. You can clone it or download the latest version of the library from GitHub or you can use the Download page as well. You need to call the lv_tick_inc(tick_period) function periodically and tell the call period in milliseconds. For example, lv_tick_inc(1) for calling in every millisecond. You need to have 3 buttons avalible: You should also add below lines to your input device read function if a wake-up (press, touch or click etc.) happens: an OS task periodically anti-aliasing use anti-aliasing (edge smoothing). LV_ANTIALIAS by default  from lv_conf.h. buffer pointer to an initialized lv_disp_buf_t variable. color_chroma_key a color which will be drawn as transparent on chrome keyed images. LV_COLOR_TRANSP by default from lv_conf.h). drag_limit Number of pixels to slide before actually drag the object drag_throw  Drag throw slow-down in [%]. Greater value means faster slow-down flush_cb a callback function to copy a buffer's content to a specific area of the display. gpu_blend_cb blend two memory buffers using opacity. gpu_fill_cb fill an area in memory with colors. hor_res horizontal resolution of the display. (LV_HOR_RES_MAX by default from lv_conf.h). long_press_rep_time Interval of sending LV_EVENT_LONG_PRESSED_REPEAT (in milliseconds) long_press_time Press time to send LV_EVENT_LONG_PRESSED (in milliseconds) lv_conf.h can be copied other places as well but then you should add LV_CONF_INCLUDE_SIMPLE define to your compiler options (e.g. -DLV_CONF_INCLUDE_SIMPLE for gcc compiler) and set the include path manually. lv_disp_buf_t can be initialized like this: lv_disp_buf_t contains internal graphics buffer(s). lv_disp_drv_t contains callback functions to interact with the display and manipulate drawing related things. lv_tick_inc should be called in a higher priority routine than lv_task_handler() (e.g. in an interrupt) to precisely know the elapsed milliseconds even if the execution of lv_task_handler takes longer time. monitor_cb a callback function tells how many pixels were refreshed in how much time. other keys will be passed to the focused widget read_cb is a function pointer which will be called periodically to report the current state of an input device. It can also buffer data and return false when no more data to be read or true when the buffer is not empty. read_task pointer to the lv_task which reads the input device. Its parameters can be changed by lv_task_...() functions rotated if 1 swap hor_res and ver_res. LittlevGL draws in the same direction in both cases (in lines from top to bottom) so the driver also needs to be reconfigured to change the display's fill direction. rounder_cb round the coordinates of areas to redraw. E.g. a 2x2 px can be converted to 2x8. It can be used if the display controller can refresh only areas with specific height or width (usually 8 px height with monochrome displays). screen_transp if 1 the screen can have transparent or opaque style. LV_COLOR_SCREEN_TRANSP needs to enabled in lv_conf.h. set_px_cb a custom function to write the display buffer. It can be used to store the pixels more compactly if the display has a special color format. (e.g. 1-bit monochrome, 2-bit grayscale etc.) This way the buffers used in lv_disp_buf_t can be smaller to hold only the required number of bits for the given area size. set_px_cb is not working with Two screen-sized buffers display buffer configuration. timer interrupt periodically (low priority then lv_tick_inc()) type can be user_data custom user data for the driver. Its type can be modified in lv_conf.h. ver_res vertical resolution of the display. (LV_VER_RES_MAX by default from lv_conf.h). while(1) of main() function Project-Id-Version: LVGL v7.0.1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2020-06-16 08:40+0200
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: en
Language-Team: en <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.4.0
 API Add logs All together it looks like this: An object group has to be created: lv_group_t * g = lv_group_create()  and objects have to be added to it with lv_group_add_obj(g, obj) Application Your application which creates the GUI and handles the specific tasks. Besides read_cb a feedback_cb callback can be also specified in lv_indev_drv_t. feedback_cb is called when any type of event is sent by the input devices. (independently from its type). It allows making feedback for the user e.g. to play a sound on LV_EVENT_CLICK. Button Buttons mean external "hardware" buttons next to the screen which are assigned to specific coordinates of the screen. If a button is pressed it will simulate the pressing on the assigned coordinate. (Similarly to a touchpad) By turning the encoder you can focus on the next/previous object. Call lv_init(). Call lv_task_handler() periodically in every few milliseconds to handle LittlevGL related tasks. Learn more. Call lv_tick_inc(x) in every x milliseconds in an interrupt to tell the elapsed time. Learn more. Configuration file Copy lvgl/lv_conf_template.h next to the lvgl directory and rename it to lv_conf.h. Open the file and change the #if 0 at the beginning to #if 1 to enable its content. Custom log function Depending on the MCU, there are two typical hardware set-ups. One with built-in LCD/TFT driver periphery and another without it. In both cases, a frame buffer will be required to store the current image of the screen. Display buffer Display driver Display interface Driver Besides your specific drivers, it contains functions to drive your display, optionally to a GPU and to read the touchpad or buttons. Enable LV_USE_GROUP in lv_conf.h Encoder Enums Every Input device is associated with a display. By default, a new input device is added to the lastly created or the explicitly selected (using lv_disp_set_default()) display. The associated display is stored and can be changed in disp field of the driver. Example: External display controller If the MCU doesn't have TFT/LCD driver interface then an external display controller (E.g. SSD1963, SSD1306, ILI9341) has to be used. In this case, the MCU can communicate with the display controller via Parallel port, SPI or sometimes I2C. The frame buffer is usually located in the display controller which saves a lot of RAM for the MCU. For example: Full keyboards with all the letters or simple keypads with a few navigation buttons belong here. Functions Get the library Here some simple examples of the callbacks: However, in the following conditions it's valid to call LittlevGL related functions: If you can't use printf or want to use a custom function to log, you can register a "logger" callback with lv_log_register_print_cb(). If you hold the keys it will simulate encoder click with period specified in indev_drv.long_press_rep_time. If you need to use real tasks or threads, you need a mutex which should be invoked before the call of lv_task_handler and released after it. Also, you have to use the same mutex in other tasks and threads around every LittlevGL (lv_...) related function calls and codes. This way you can use LittlevGL in a real multitasking environment. Just make use of a mutex to avoid the concurrent calling of LittlevGL functions. If you press the encoder on a complex object (like a list, message box, etc.) the object will go to edit mode whereby turning the encoder you can navigate inside the object. If your system supports printf, you just need to enable LV_LOG_PRINTF in lv_conf.h to send the logs with printf. In addition to lv_disp_get_inactive_time() you can check lv_anim_count_running() to see if every animations are finished. In addition to standar encoder behavior, you can also utilise its logic to navigate(focus) and edit widgets using buttons. This is especialy handy if you have only few buttons avalible, or you want to use other buttons in addition to encoder wheel. In events. Learn more in Events. In lv_tasks. Learn more in Tasks. In short, the Encoder input devices work like this: In the config file comments explain the meaning of the options. Check at least these three configuration options and modify them according to your hardware: Initialization Initialize your drivers. Input device interface Input devices which can click points of the screen belong to this category. Interrupts Keypad or keyboard LV_COLOR_DEPTH 8 for (RG332), 16 for (RGB565) or 32 for (RGB888 and ARGB8888). LV_HOR_RES_MAX Your display's horizontal resolution. LV_INDEV_TYPE_BUTTON external buttons pressing the screen LV_INDEV_TYPE_ENCODER encoder with left, right, push options LV_INDEV_TYPE_KEYPAD keyboard or keypad LV_INDEV_TYPE_POINTER touchpad or mouse LV_KEY_ENTER will simulate press or pushing of the encoder button LV_KEY_LEFT will simulate turnuing encoder left LV_KEY_RIGHT will simulate turnuing encoder right LV_LOG_LEVEL_ERROR Only critical issue, when the system may fail LV_LOG_LEVEL_INFO  Log important events LV_LOG_LEVEL_NONE  Do not log anything LV_LOG_LEVEL_TRACE A lot of logs to give detailed information LV_LOG_LEVEL_WARN  Log if something unwanted happened but didn't cause a problem LV_VER_RES_MAX Your display's vertical resolution. LittlevGL Graphics Library is available on GitHub: https://github.com/littlevgl/lvgl. LittlevGL The graphics library itself. Your application can communicate with the library to create a GUI. It contains a HAL (Hardware Abstraction Layer) interface to register your display and input device drivers. LittlevGL has built-in log module to inform the user about what is happening in the library. LittlevGL is not thread-safe by default. Log level Logging Logging with printf Long-press its button MCU with TFT/LCD driver If your MCU has a TFT/LCD driver periphery then you can connect a display directly via RGB interface. In this case, the frame buffer can be in the internal RAM (if the MCU has enough RAM) or in the external RAM (if the MCU has a memory interface). Note that, these functions need to draw to the memory (RAM) and not your display directly. On Linux based operating system (e.g. on Raspberry Pi) lv_tick_inc can be called in a thread as below: Once the buffer initialization is ready the display drivers need to be initialized. In the most simple case only the following two fields of lv_disp_drv_t needs to be set: One buffer LittlevGL draws the content of the screen into a buffer and sends it to the display. The buffer can be smaller than the screen. In this case, the larger areas will be redrawn in multiple parts. If only small areas changes (e.g. button press) then only those areas will be refreshed. Operating system and interrupts Other features Porting Press its button Public Members Register a read_cb function with LV_INDEV_TYPE_KEYPAD type. Register the display and input devices drivers in LittlevGL.  More about Display and Input device registration. Set-up a project Sleep management Some other optional callbacks to make easier and more optimal to work with monochrome, grayscale or other non-standard RGB displays: System architecture with Littlev Graphics Library (LittlevGL) System overview Task Handler Tasks and threads The LittlevGL needs a system tick to know the elapsed time for animation and other tasks. The MCU can go to sleep when no user input happens. In this case, the main while(1) should look like this: The created group has to be assigned to an input device: lv_indev_set_group(my_indev, g) (my_indev is the return value of lv_indev_drv_register) The default value of the following parameters can be set in lv_conf.h but the default value can be overwritten in lv_indev_drv_t: The events which have a higher level than the set log level will be logged too. E.g. if you LV_LOG_LEVEL_WARN, errors will be also logged. The graphics library is the lvgl directory which should be copied into your project. The points_array can't go out of scope. Either declare it as a global variable or as a static variable inside a function. The timing is not critical but it should be about 5 milliseconds to keep the system responsive. There are 3 possible configurations regarding the buffer size: There are some optional data fields: There is a configuration header file for LittlevGL called lv_conf.h. It sets the library's basic behaviour, disables unused modules and features, adjusts the size of memory buffers in compile-time, etc. Tick interface To assign buttons to coordinates use lv_indev_set_button_points(my_indev, points_array).points_array should look like const lv_point_t points_array[] =  { {12,30},{60,90}, ...} To enable logging, set LV_USE_LOG  1 in lv_conf.h and set LV_LOG_LEVEL to one of the following values: To handle the tasks of LittlevGL you need to call lv_task_handler() periodically in one of the followings: To learn more about task visit the Tasks section. To leave edit mode press long the button. To set a mouse cursor use lv_indev_set_cursor(my_indev, &img_cursor). (my_indev is the return value of lv_indev_drv_register) To set the fields of lv_disp_drv_t variable it needs to be initialized with lv_disp_drv_init(&disp_drv). And finally to register a display for LittlevGL lv_disp_drv_register(&disp_drv) needs to be called. To set up a display an lv_disp_buf_t and an lv_disp_drv_t variable has to be initialized. To set up an input device an lv_indev_drv_t variable has to be initialized: To use a GPU the following callbacks can be used: To use a keyboard/keypad: To use an Encoder (similarly to the Keypads) the objects should be added to groups. To use the graphics library you have to initialize it and the other components too. The order of the initialization is: Touchpad drivers must return the last X/Y coordinates even when the state is *LV_INDEV_STATE_REL*. Touchpad, mouse or any pointer Try to avoid calling LittlevGL functions from the interrupts (except lv_tick_inc() and lv_disp_flush_ready()). But, if you need to do this you have to disable the interrupt which uses LittlevGL functions while lv_task_handler is running. It's a better approach to set a flag or some value and periodically check it in an lv_task. Turn left Turn right Two non-screen-sized buffers having two buffers LittlevGL can draw into one buffer while the content of the other buffer is sent to display in the background. DMA or other hardware should be used to transfer the data to the display to let the CPU draw meanwhile. This way the rendering and refreshing of the display become parallel. Similarly to the One buffer, LittlevGL will draw the display's content in chunks if the buffer is smaller than the area to refresh. Two screen-sized buffers. In contrast to Two non-screen-sized buffers LittlevGL will always provide the whole screen's content not only chunks. This way the driver can simply change the address of the frame buffer to the buffer received from LittlevGL. Therefore this method works the best when the MCU has an LCD/TFT interface and the frame buffer is just a location in the RAM. Typedefs Types of input devices Use LV_KEY_... to navigate among the objects in the group. See lv_core/lv_group.h for the available keys. Using buttons with Encoder logic Visit Input devices to learn more about input devices in general. When you press the encoder on a simple object (like a button), it will be clicked. With FreeRTOS lv_tick_inc can be called in vApplicationTickHook. With an encoder you can do 4 things: You can also use the log module via the LV_LOG_TRACE/INFO/WARN/ERROR(description) functions. You can clone it or download the latest version of the library from GitHub or you can use the Download page as well. You need to call the lv_tick_inc(tick_period) function periodically and tell the call period in milliseconds. For example, lv_tick_inc(1) for calling in every millisecond. You need to have 3 buttons avalible: You should also add below lines to your input device read function if a wake-up (press, touch or click etc.) happens: an OS task periodically anti-aliasing use anti-aliasing (edge smoothing). LV_ANTIALIAS by default  from lv_conf.h. buffer pointer to an initialized lv_disp_buf_t variable. color_chroma_key a color which will be drawn as transparent on chrome keyed images. LV_COLOR_TRANSP by default from lv_conf.h). drag_limit Number of pixels to slide before actually drag the object drag_throw  Drag throw slow-down in [%]. Greater value means faster slow-down flush_cb a callback function to copy a buffer's content to a specific area of the display. gpu_blend_cb blend two memory buffers using opacity. gpu_fill_cb fill an area in memory with colors. hor_res horizontal resolution of the display. (LV_HOR_RES_MAX by default from lv_conf.h). long_press_rep_time Interval of sending LV_EVENT_LONG_PRESSED_REPEAT (in milliseconds) long_press_time Press time to send LV_EVENT_LONG_PRESSED (in milliseconds) lv_conf.h can be copied other places as well but then you should add LV_CONF_INCLUDE_SIMPLE define to your compiler options (e.g. -DLV_CONF_INCLUDE_SIMPLE for gcc compiler) and set the include path manually. lv_disp_buf_t can be initialized like this: lv_disp_buf_t contains internal graphics buffer(s). lv_disp_drv_t contains callback functions to interact with the display and manipulate drawing related things. lv_tick_inc should be called in a higher priority routine than lv_task_handler() (e.g. in an interrupt) to precisely know the elapsed milliseconds even if the execution of lv_task_handler takes longer time. monitor_cb a callback function tells how many pixels were refreshed in how much time. other keys will be passed to the focused widget read_cb is a function pointer which will be called periodically to report the current state of an input device. It can also buffer data and return false when no more data to be read or true when the buffer is not empty. read_task pointer to the lv_task which reads the input device. Its parameters can be changed by lv_task_...() functions rotated if 1 swap hor_res and ver_res. LittlevGL draws in the same direction in both cases (in lines from top to bottom) so the driver also needs to be reconfigured to change the display's fill direction. rounder_cb round the coordinates of areas to redraw. E.g. a 2x2 px can be converted to 2x8. It can be used if the display controller can refresh only areas with specific height or width (usually 8 px height with monochrome displays). screen_transp if 1 the screen can have transparent or opaque style. LV_COLOR_SCREEN_TRANSP needs to enabled in lv_conf.h. set_px_cb a custom function to write the display buffer. It can be used to store the pixels more compactly if the display has a special color format. (e.g. 1-bit monochrome, 2-bit grayscale etc.) This way the buffers used in lv_disp_buf_t can be smaller to hold only the required number of bits for the given area size. set_px_cb is not working with Two screen-sized buffers display buffer configuration. timer interrupt periodically (low priority then lv_tick_inc()) type can be user_data custom user data for the driver. Its type can be modified in lv_conf.h. ver_res vertical resolution of the display. (LV_VER_RES_MAX by default from lv_conf.h). while(1) of main() function 