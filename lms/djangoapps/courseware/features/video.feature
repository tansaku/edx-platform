@shard_2
Feature: LMS Video component
  As a student, I want to view course videos in LMS

  # BLD-970 Failing currently in master
  # 1
#  Scenario: Video component stores position correctly when page is reloaded
#    Given the course has a Video component in "Youtube" mode
#    When the video has rendered in "Youtube" mode
#    And I click video button "play"
#    Then I seek video to "10" seconds
#    And I click video button "pause"
#    And I reload the page
#    And I click video button "play"
#    Then I see video starts playing from "0:10" position

  # 1
  Scenario: Video component is fully rendered in the LMS in HTML5 mode
    Given the course has a Video component in "HTML5" mode
    When the video has rendered in "HTML5" mode
    And all sources are correct

  # 2
  @skip_firefox
  Scenario: Autoplay is disabled in LMS for a Video component
    Given the course has a Video component in "HTML5" mode
    Then when I view the video it does not have autoplay enabled

  # 3
  # Youtube testing
  Scenario: Video component is fully rendered in the LMS in Youtube mode with HTML5 sources
    Given youtube server is up and response time is 0.4 seconds
    And the course has a Video component in "Youtube_HTML5" mode
    When the video has rendered in "Youtube" mode

  # 4
  Scenario: Video component is not rendered in the LMS in Youtube mode with HTML5 sources
    Given youtube server is up and response time is 2 seconds
    And the course has a Video component in "Youtube_HTML5" mode
    When the video has rendered in "HTML5" mode

  # 5
  Scenario: Video component is not rendered in the LMS in Youtube mode with HTML5 sources when YouTube API is blocked
    Given youtube server is up and response time is 2 seconds
    And youtube stub server blocks YouTube API
    And the course has a Video component in "Youtube_HTML5" mode
    And I wait "3" seconds
    Then the video has rendered in "HTML5" mode

  # 6
  Scenario: Video component is rendered in the LMS in Youtube mode without HTML5 sources
    Given youtube server is up and response time is 2 seconds
    And the course has a Video component in "Youtube" mode
    When the video has rendered in "Youtube" mode

  # 7
  Scenario: Video component is rendered in the LMS in Youtube mode with HTML5 sources that doesn't supported by browser
    Given youtube server is up and response time is 2 seconds
    And the course has a Video component in "Youtube_HTML5_Unsupported_Video" mode
    When the video has rendered in "Youtube" mode

  # 8
  Scenario: Video component is rendered in the LMS in HTML5 mode with HTML5 sources that doesn't supported by browser
    Given the course has a Video component in "HTML5_Unsupported_Video" mode
    Then error message is shown
    And error message has correct text

  # 9
  Scenario: Multiple videos in sequentials all load and work, switching between sequentials
    Given I am registered for the course "test_course"
    And it has videos "A, B" in "Youtube" mode in position "1" of sequential
    And it has videos "C, D" in "Youtube" mode in position "2" of sequential
    And I open the section with videos
    Then video "A" should start playing at speed "1.0"
    And I select the "2.0" speed on video "B"
    When I open video "C"
    Then video "C" should start playing at speed "2.0"
    And I select the "1.0" speed on video "D"
    When I open video "A"
    Then video "A" should start playing at speed "2.0"

  # 10
  Scenario: Video component stores speed correctly when each video is in separate sequence
    Given I am registered for the course "test_course"
    And it has a video "A" in "Youtube" mode in position "1" of sequential
    And a video "B" in "Youtube" mode in position "2" of sequential
    And a video "C" in "HTML5" mode in position "3" of sequential
    And I open the section with videos
    And I select the "2.0" speed on video "A"
    And I select the "0.50" speed on video "B"
    When I open video "C"
    Then video "C" should start playing at speed "0.75"
    When I open video "A"
    Then video "A" should start playing at speed "2.0"
    And I reload the page
    When I open video "A"
    Then video "A" should start playing at speed "2.0"
    And I select the "1.0" speed on video "A"
    When I open video "B"
    Then video "B" should start playing at speed "0.50"
    When I open video "C"
    Then video "C" should start playing at speed "1.0"

  # 11
   Scenario: Language menu works correctly in Video component
    Given I am registered for the course "test_course"
    And I have a "chinese_transcripts.srt" transcript file in assets
    And I have a "subs_OEoXaMPEzfM.srt.sjson" transcript file in assets
    And it has a video in "Youtube" mode:
      | transcripts                       | sub         |
      | {"zh": "chinese_transcripts.srt"} | OEoXaMPEzfM |
    And I make sure captions are closed
    And I see video menu "language" with correct items
    And I select language with code "zh"
    Then I see "好 各位同学" text in the captions
    And I select language with code "en"
    And I see "Hi, welcome to Edx." text in the captions

  # 12
  Scenario: CC button works correctly w/o english transcript in HTML5 mode of Video component
    Given I am registered for the course "test_course"
    And I have a "chinese_transcripts.srt" transcript file in assets
    And it has a video in "HTML5" mode:
      | transcripts                       |
      | {"zh": "chinese_transcripts.srt"} |
    And I make sure captions are opened
    Then I see "好 各位同学" text in the captions

  # 13
  Scenario: CC button works correctly only w/ english transcript in HTML5 mode of Video component
    Given I am registered for the course "test_course"
    And I have a "subs_OEoXaMPEzfM.srt.sjson" transcript file in assets
    And it has a video in "HTML5" mode:
      | sub         |
      | OEoXaMPEzfM |
    And I make sure captions are opened
    Then I see "Hi, welcome to Edx." text in the captions

  # 14
  Scenario: CC button works correctly w/o english transcript in Youtube mode of Video component
    Given I am registered for the course "test_course"
    And I have a "chinese_transcripts.srt" transcript file in assets
    And it has a video in "Youtube" mode:
      | transcripts                       |
      | {"zh": "chinese_transcripts.srt"} |
    And I make sure captions are opened
    Then I see "好 各位同学" text in the captions

  # 15
  Scenario: CC button works correctly if transcripts and sub fields are empty, but transcript file exists in assets (Youtube mode of Video component)
    Given I am registered for the course "test_course"
    And I have a "subs_OEoXaMPEzfM.srt.sjson" transcript file in assets
    And it has a video in "Youtube" mode
    And I make sure captions are opened
    Then I see "Hi, welcome to Edx." text in the captions

  # 16
  Scenario: CC button is hidden if no translations
    Given the course has a Video component in "Youtube" mode
    Then button "CC" is hidden

  # 17
  Scenario: Video is aligned correctly if transcript is visible in fullscreen mode
    Given I am registered for the course "test_course"
    And I have a "subs_OEoXaMPEzfM.srt.sjson" transcript file in assets
    And it has a video in "HTML5" mode:
      | sub         |
      | OEoXaMPEzfM |
    And I make sure captions are opened
    And I click video button "fullscreen"
    Then I see video aligned correctly with enabled transcript

  # 18
  Scenario: Video is aligned correctly if transcript is hidden in fullscreen mode
    Given the course has a Video component in "Youtube" mode
    And I click video button "fullscreen"
    Then I see video aligned correctly without enabled transcript

  # 19
  Scenario: Video is aligned correctly on transcript toggle in fullscreen mode
    Given I am registered for the course "test_course"
    And I have a "subs_OEoXaMPEzfM.srt.sjson" transcript file in assets
    And it has a video in "Youtube" mode:
      | sub         |
      | OEoXaMPEzfM |
    And I make sure captions are opened
    And I click video button "fullscreen"
    Then I see video aligned correctly with enabled transcript
    And I click video button "CC"
    Then I see video aligned correctly without enabled transcript

  # 20
  Scenario: Download Transcript button works correctly in Video component
    Given I am registered for the course "test_course"
    And I have a "subs_OEoXaMPEzfM.srt.sjson" transcript file in assets
    And it has a video "A" in "Youtube" mode in position "1" of sequential:
      | sub         | download_track |
      | OEoXaMPEzfM | true           |
    And a video "B" in "Youtube" mode in position "2" of sequential:
      | sub         | download_track |
      | OEoXaMPEzfM | true           |
    And a video "C" in "Youtube" mode in position "3" of sequential:
      | track               | download_track |
      | http://example.org/ | true           |
    And I open the section with videos
    Then I can download transcript in "srt" format that has text "00:00:00,270"
    And I select the transcript format "txt"
    Then I can download transcript in "txt" format that has text "Hi, welcome to Edx."
    When I open video "B"
    Then I can download transcript in "txt" format that has text "Hi, welcome to Edx."
    When I open video "C"
    Then menu "download_transcript" doesn't exist

  # BLD-971 - Test intermittently failing
  # 20
#  Scenario: Youtube video has correct transcript if fields for other speeds are filled.
#    Given I am registered for the course "test_course"
#    And I have a "subs_OEoXaMPEzfM.srt.sjson" transcript file in assets
#    And I have a "subs_b7xgknqkQk8.srt.sjson" transcript file in assets
#    And it has a video in "Youtube" mode:
#      | sub         | youtube_id_1_5 |
#      | OEoXaMPEzfM | b7xgknqkQk8    |
#    And I make sure captions are opened
#    Then I see "Hi, welcome to Edx." text in the captions
#    And I select the "1.50" speed
#    And I reload the page
#    Then I see "Hi, welcome to Edx." text in the captions
#    And I see duration "1:00"

  # 21
   Scenario: Download button works correctly for non-english transcript in Youtube mode of Video component
    Given I am registered for the course "test_course"
    And I have a "chinese_transcripts.srt" transcript file in assets
    And I have a "subs_OEoXaMPEzfM.srt.sjson" transcript file in assets
    And it has a video in "Youtube" mode:
      | transcripts                       | sub         | download_track |
      | {"zh": "chinese_transcripts.srt"} | OEoXaMPEzfM | true           |
    And I see "Hi, welcome to Edx." text in the captions
    Then I can download transcript in "srt" format that has text "Hi, welcome to Edx."
    And I select language with code "zh"
    And I see "好 各位同学" text in the captions
    Then I can download transcript in "srt" format that has text "好 各位同学"

  # 22
   Scenario: Download button works correctly for non-english transcript in HTML5 mode of Video component
    Given I am registered for the course "test_course"
    And I have a "chinese_transcripts.srt" transcript file in assets
    And I have a "subs_OEoXaMPEzfM.srt.sjson" transcript file in assets
    And it has a video in "HTML5" mode:
      | transcripts                       | sub         | download_track |
      | {"zh": "chinese_transcripts.srt"} | OEoXaMPEzfM | true           |
    And I see "Hi, welcome to Edx." text in the captions
    Then I can download transcript in "srt" format that has text "Hi, welcome to Edx."
    And I select language with code "zh"
    And I see "好 各位同学" text in the captions
    Then I can download transcript in "srt" format that has text "好 各位同学"

  # 23
  Scenario: Download button works correctly w/o english transcript in HTML5 mode of Video component
    Given I am registered for the course "test_course"
    And I have a "chinese_transcripts.srt" transcript file in assets
    And it has a video in "HTML5" mode:
      | transcripts                       | download_track |
      | {"zh": "chinese_transcripts.srt"} | true           |
    And I see "好 各位同学" text in the captions
    Then I can download transcript in "srt" format that has text "好 各位同学"

  # 24
  Scenario: Download button works correctly w/o english transcript in Youtube mode of Video component
    Given I am registered for the course "test_course"
    And I have a "chinese_transcripts.srt" transcript file in assets
    And it has a video in "Youtube" mode:
      | transcripts                       | download_track |
      | {"zh": "chinese_transcripts.srt"} | true           |
    And I see "好 各位同学" text in the captions
    Then I can download transcript in "srt" format that has text "好 各位同学"

  # 25
  Scenario: Verify that each video in each sub-section includes a transcript for non-Youtube countries.
    Given youtube server is up and response time is 2 seconds
    And I am registered for the course "test_course"
    And I have a "subs_OEoXaMPEzfM.srt.sjson" transcript file in assets
    And I have a "subs_b7xgknqkQk8.srt.sjson" transcript file in assets
    And I have a "chinese_transcripts.srt" transcript file in assets
    And it has videos "A, B" in "Youtube_HTML5" mode in position "1" of sequential:
      | sub         |
      | OEoXaMPEzfM |
      | b7xgknqkQk8 |
    And a video "C" in "Youtube_HTML5" mode in position "2" of sequential:
      | transcripts                       |
      | {"zh": "chinese_transcripts.srt"} |
    And a video "D" in "Youtube_HTML5" mode in position "3" of sequential
    And I open the section with videos
    Then videos have rendered in "HTML5" mode
    And I see text in the captions:
      | text                |
      | Hi, welcome to Edx. |
      | Equal transcripts   |
    When I open video "C"
    Then the video has rendered in "HTML5" mode
    And I make sure captions are opened
    And I see "好 各位同学" text in the captions
    When I open video "D"
    Then the video has rendered in "HTML5" mode
    And the video does not show the captions
