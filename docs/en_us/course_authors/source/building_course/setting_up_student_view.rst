.. _Setting up the Student View:

######################################################
Setting up the Student View
######################################################


*******************
Overview
*******************

This chapter describes how you set up your course to be displayed in the course summary page and in a student's dashboard. The information you configure for your course is important for prospective and current students to understand.

See:

* :ref:`The Course Summary Page`
* :ref:`The Student Dashboard`
* :ref:`Set Important Dates for Your Course`
* :ref:`The Course Start Date`
* :ref:`Set the Advertised Start Date`
* :ref:`The Course End Date`
* :ref:`Describe Your Course`
* :ref:`Add a Course Image`
* :ref:`Add a Course Video`
* :ref:`Set Course Requirements`


.. _Edge: http://edge.edx.org
.. _edX.org: http://edx.org

.. _The Course Summary Page:

***********************************
The Course Summary Page
***********************************

The following image shows an example course summary page.  Students can see the course summary page before registering, and may decide to register based on the content of the page. You configure the contents of this page in Studio, as described in this chapter:

.. image:: ../Images/about_page.png
 :alt: An image of the course summary page.




.. _The Student Dashboard:

***********************************
The Student Dashboard
***********************************


If a student registers for your course, the course is then listed on the dashboard, with the course image.  From the dashboard, a student can open a course that has started. If the course has not started, the student can see the start date, as explained in this chapter.

.. image:: ../Images/dashboard.png
 :alt: An image of the dashboard.



.. _Set Important Dates for Your Course:

***********************************
Set Important Dates for Your Course
***********************************
You must set dates and times for enrollment and for the course.

In Studio, from the **Settings** menu, select **Schedule and Details**.  

.. image:: ../Images/schedule.png
  :alt: An image of the course schedule page.

Follow the on-screen text to enter the course and enrollment schedule.

.. note::

    The Time fields on this page reflect the current time zone in your browser, depending on your geography. Course start times for students are shown as UTC.


.. _The Course Start Date:

***********************************
The Course Start Date
***********************************

.. note:: 

    The default **Course Start Date** is set far into the future, to **01/01/2030 GMT**. This is to ensure that your course does not start before you intend it to.  You must change the course start date to the date you want students to begin using the course. 

Students see the course start date on their dashboards and on the course summary page.

The following example shows the course start date on the course summary page:

.. image:: ../Images/about-page-course-start.png
 :alt: An image of the course summary page, with the start date circled.

.. note:: For courses on edX.org_, you must communicate the course start date to your edX Program Manager, to ensure the date is accurate on the course summary page.

In the dashboard, if the course has not yet started, students see the start date as in the following example:

.. image:: ../Images/dashboard-course-to-start.png
 :alt: An image of a course that has not started in the student dashboard, with the start date circled.

If the course has started, students see the start date as in the following example:

.. image:: ../Images/dashboard-course.png
 :alt: An image of a course listing in the student dashboard, with the start date circled.



.. _Set the Advertised Start Date:

***********************************
Set the Advertised Start Date
***********************************

You can set an advertised start date for your course that is different than the course start date you set in the **Schedule and Details** page. You may want to do this if there is uncertainty about the exact start date. For example, you could advertise the start date as **Spring, 2014**.

To set an advertised start date:

#. From the **Settings** menu, select **Advanced Settings**.
#. Find the policy key **advertised_start**. The default value is **null**.
#. Enter the date you want as an advertised start date.  You can use any string, enclosed in double quotation marks. If you format the string as a date (for example, as 02/01/2014), the value is parsed and presented to students as a date.

  .. image:: ../Images/advertised_start.png
   :alt: Image of the advertised start date policy key

4. Click **Save Changes** at the bottom of the page.

The start date shown on the student's dashboard is now the value of the advertised_start policy key:

.. image:: ../Images/dashboard-course_adver_start.png
 :alt: An image of a course listing in the student dashboard, with the advertised start date circled.

If you do not change the default course start date (01/01/2030), and the **advertised_start** policy value is ``null``, then the student dashboard does not list a start date for the course.  Students just see that the course has not yet started:

.. image:: ../Images/dashboard-course_not_started.png
 :alt: Image of a course listing in the student dashboard, with no start date.


.. _The Course End Date:

***********************************
The Course End Date
***********************************

When your course is completed, students see the course end date on their dashboards.

.. note:: For courses on edX.org_, you must communicate the course end date to your edX Program Manager, to ensure the date is accurate on the course summary page.

If grades and certificates are not yet issued, or if students enroll in an archived course after it has ended, the course appears in the dashboard as in the following example:

.. image:: ../Images/dashboard-wrapping-course.png
 :alt: Image of a course on the student dashboard that has ended, but not been graded

If grades are complete and certificates are issued, students see the course, the end date, and the message as in the following example:

.. image:: ../Images/dashboard-completed-course.png
 :alt: Image of a course on the student dashboard that has ended, but not been graded


.. _Describe Your Course:

************************
Describe Your Course
************************

On Edge_, students that you explicitly invite see the description of your course on the course summary page.

For example, the course description is circled in the following course summary page:

.. image:: ../Images/about-page-course-description.png
 :alt: Image of a course summary with the description circled

.. note:: For courses on edX.org_, you must communicate the course description to your edX Program Manager, to ensure the content is accurate on the course summary page.

#. From the **Settings** menu, select **Schedule & Details**.
#. Scroll down to the **Introducing Your Course** section, then locate the **Course Overview** field.

.. image:: ../Images/course_overview.png
  :width: 800

3. Overwrite the content as needed for your course, following the directions in the boilerplate text. Do not edit HTML tags. For a template that includes placeholders, see :ref:`A Template For Course Overview`.

   .. note:: There is no save button. Studio automatically saves your changes.
 
4. Click **your course summary page** in the text beneath the field to test how the description will appear to students.

.. _Add a Course Image:

************************
Add a Course Image
************************

The course image that you add in Studio appears on the student dashboard. 

On Edge_, the image also appears on the course summary page.

In the following example, the course image that was added in Studio is circled in the student dashboard:

.. image:: ../Images/dashboard-course-image.png
 :alt: Image of the course image in the student dashboard

On edX.org_, the course image you add in Studio does not appear on the course summary page automatically. You must work directly with your edX Program Manager to set up the course summary page.

The course image should be a minimum of 660 pixels in width by 240 pixels in height, and in .JPG or .PNG format.

#. From the **Settings** menu, select **Schedule & Details**.
#. Scroll down to the **Course Image** section.
#. To select an image from your computer, click **Upload Course Image**, then follow the prompts to find and upload your image.
#. View your dashboard to test how the image will appear to students.

.. _Add a Course Video:

*********************************
Add a Course Introduction Video
*********************************

On Edge_, the course introduction video appears on the course summary page that students see. 

.. note:: On edX.org_, you work directly with your Program Manager to set up the course video in the summary page.

In the following example, the course video is circled in the course summary page:

.. image:: ../Images/about-page-course-video.png
 :alt: Image of the course video in the course summary page

The course video should excite and entice potential students to register, and reveal some of the personality the instructors bring to the course. 

The video should answer these key questions:

* Who is teaching the course?
* What university or college is the course affiliated with?
* What topics and concepts are covered in your course?
* Why should a learner register for your course?

The video should deliver your message as concisely as possible and have a run time of less than 2 minutes. 

Ensure your course introduction video follows the same :ref:`Compression Specifications` and :ref:`Video Formats` guidelines as course content videos.

To add a course introduction video:


#. Upload the course video to YouTube. Make note of the code that appears between **watch?v =** and **&feature** in the URL. This code appears in the green box below.

  .. image:: ../Images/image127.png
    :width: 800
    
2. From the **Settings** menu, select **Schedule & Details**.
#. Scroll down to the **Course Introduction Video** section.
#. In the field below the video box, enter the YouTube video ID (the code you copied in step 1). When you add the code, the video automatically loads in the video box. Studio automatically saves your changes.
#. View your course summary page to test how the video will appear to students.

.. _Set Course Requirements:

************************
Set Course Requirements
************************
The estimated Effort per Week appears at the bottom of the course summary page.

#. From the **Settings** menu, select **Schedule & Details**.
#. Scroll down to the **Requirements** section.
#. In the **Hours of Effort per Week** field, enter the number of hours you expect students to work on this course each week.
#. View your course summary page to test how the requirements will appear to students.