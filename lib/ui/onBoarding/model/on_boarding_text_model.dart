import 'package:scan_docs/global/utils/app_images.dart';

class OnBoardingModel {

  List<Map<String, String>> onboardingData = [
    {
      "image":GlobalImages.onBoardingOne,
      "heading": 'Convenient',
      "subHeading":
          'Scan and share in minutes',
          "description": 'Scan anywhere with ease, share PDFs on the go.' 
    },
    {
      "image": GlobalImages.onBoardingTwo,
     "heading": 'Organized',
      "subHeading":
          'Sort through scattered things',
          "description": 'Manage invoices and receipts or collect phrases, quotes and sketches.' 
    },
    {
      "image": GlobalImages.onBoardingThree,
      "heading": 'Practical',
      "subHeading":
          '1:1 ratio',
          "description": 'Easil scan and print your ID Card, license at 1:1 ratio with security ensured.' 
    },
     {
      "image": GlobalImages.onBoardingFour,
     "heading": 'Sharp',
      "subHeading":
          'Scan slides and screens for crystal-clear, ripple-free images.',
          "description": 'By patented telephoto algorithm, capture notes & slides clearly in lectures & meeting.' 
    },
  ];
}