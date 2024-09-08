import 'package:flutter/material.dart';
// TODO: add flutter_svg package to pubspec.yaml
import 'package:flutter_svg/flutter_svg.dart';

class NoResultsScreen extends StatelessWidget {
  const NoResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
       
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: SvgPicture.string(
                    noResultsIllistration,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
             
            ],
          ),
        
      
    );
  }
}

const noResultsIllistration = '''
<svg width="1080" height="1080" viewBox="0 0 1080 1080" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M235.81 752.37H546.81V829.6C546.807 833.153 545.395 836.56 542.882 839.072C540.37 841.585 536.963 842.997 533.41 843H235.81V752.37Z" fill="#BCBCBC"/>
<path d="M200.57 347.31H235.67C237.593 347.31 239.437 348.074 240.797 349.434C242.156 350.793 242.92 352.637 242.92 354.56V835.75C242.92 837.673 242.156 839.517 240.797 840.877C239.437 842.236 237.593 843 235.67 843H207.67C203.867 843 200.219 841.489 197.53 838.8C194.841 836.111 193.33 832.463 193.33 828.66V354.57C193.329 353.618 193.515 352.675 193.878 351.795C194.241 350.915 194.774 350.115 195.446 349.441C196.119 348.766 196.917 348.231 197.796 347.866C198.676 347.5 199.618 347.311 200.57 347.31Z" fill="#BCBCBC"/>
<path d="M528.06 752.37V807.08C528.055 809.662 527.027 812.136 525.201 813.961C523.376 815.787 520.902 816.815 518.32 816.82H177.21C174.628 816.815 172.154 815.787 170.329 813.961C168.503 812.136 167.475 809.662 167.47 807.08V330.75C167.475 328.168 168.503 325.694 170.329 323.869C172.154 322.043 174.628 321.015 177.21 321.01H242.92" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M892.69 687.85L625.76 603.24C634.684 588.385 641.681 572.453 646.58 555.83L908.58 635.53C910.867 636.241 912.78 637.826 913.904 639.94C915.028 642.054 915.271 644.527 914.58 646.82L903.93 681.82C903.225 684.101 901.651 686.012 899.547 687.141C897.443 688.27 894.98 688.524 892.69 687.85Z" fill="#BCBCBC"/>
<path d="M530.38 261.99L622.05 353.67H530.38V261.99Z" fill="#BCBCBC"/>
<path d="M603.5 632V750C603.497 750.633 603.245 751.239 602.797 751.687C602.349 752.135 601.743 752.387 601.11 752.39H245.31C244.677 752.387 244.07 752.135 243.623 751.687C243.175 751.239 242.923 750.633 242.92 750V259C242.923 258.367 243.175 257.76 243.623 257.313C244.07 256.865 244.677 256.612 245.31 256.61H511.82" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M603.5 348.25V404" stroke="#231F20" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M511.82 256.57L603.5 348.25H511.82V256.57Z" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M492.14 675.92C579.644 675.92 650.58 604.984 650.58 517.48C650.58 429.976 579.644 359.04 492.14 359.04C404.636 359.04 333.7 429.976 333.7 517.48C333.7 604.984 404.636 675.92 492.14 675.92Z" fill="#BCBCBC"/>
<path d="M492.14 675.92C579.644 675.92 650.58 604.984 650.58 517.48C650.58 429.976 579.644 359.04 492.14 359.04C404.636 359.04 333.7 429.976 333.7 517.48C333.7 604.984 404.636 675.92 492.14 675.92Z" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M492.14 646.47C563.379 646.47 621.13 588.719 621.13 517.48C621.13 446.241 563.379 388.49 492.14 388.49C420.901 388.49 363.15 446.241 363.15 517.48C363.15 588.719 420.901 646.47 492.14 646.47Z" fill="#F4F4F4"/>
<path d="M492.14 646.47C563.379 646.47 621.13 588.719 621.13 517.48C621.13 446.241 563.379 388.49 492.14 388.49C420.901 388.49 363.15 446.241 363.15 517.48C363.15 588.719 420.901 646.47 492.14 646.47Z" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M896.69 672.85L632.5 593.15C640.67 575.87 646.84 558.42 649.37 539.63L912.6 620.54C914.887 621.25 916.8 622.835 917.924 624.95C919.048 627.064 919.291 629.537 918.6 631.83L907.95 666.83C907.243 669.113 905.665 671.026 903.557 672.153C901.449 673.28 898.981 673.531 896.69 672.85V672.85Z" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M457.2 530.38C468.693 530.38 478.01 521.063 478.01 509.57C478.01 498.077 468.693 488.76 457.2 488.76C445.707 488.76 436.39 498.077 436.39 509.57C436.39 521.063 445.707 530.38 457.2 530.38Z" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M457.2 524.86C465.644 524.86 472.49 518.014 472.49 509.57C472.49 501.126 465.644 494.28 457.2 494.28C448.755 494.28 441.91 501.126 441.91 509.57C441.91 518.014 448.755 524.86 457.2 524.86Z" fill="#0E0E0E"/>
<path d="M464.08 505.73C465.582 505.73 466.8 504.512 466.8 503.01C466.8 501.508 465.582 500.29 464.08 500.29C462.578 500.29 461.36 501.508 461.36 503.01C461.36 504.512 462.578 505.73 464.08 505.73Z" fill="white"/>
<path d="M560.93 530.38C572.423 530.38 581.74 521.063 581.74 509.57C581.74 498.077 572.423 488.76 560.93 488.76C549.437 488.76 540.12 498.077 540.12 509.57C540.12 521.063 549.437 530.38 560.93 530.38Z" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M560.93 524.86C569.375 524.86 576.22 518.014 576.22 509.57C576.22 501.126 569.375 494.28 560.93 494.28C552.486 494.28 545.64 501.126 545.64 509.57C545.64 518.014 552.486 524.86 560.93 524.86Z" fill="#0E0E0E"/>
<path d="M564.93 505.73C566.432 505.73 567.65 504.512 567.65 503.01C567.65 501.508 566.432 500.29 564.93 500.29C563.428 500.29 562.21 501.508 562.21 503.01C562.21 504.512 563.428 505.73 564.93 505.73Z" fill="white"/>
<path d="M473.73 594.73C499.13 575.95 524.53 575.95 549.93 594.73" stroke="#0E0E0E" stroke-width="7" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M418 480C442.21 474.49 459.07 467.53 466.26 458.64" stroke="#0E0E0E" stroke-width="7" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M551.61 461.78C572.61 475.03 589.45 482.05 600.82 480.86" stroke="#0E0E0E" stroke-width="7" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M395.84 485.46L384.84 508.97C378.09 532.39 413.62 530.97 406.51 508.97L395.84 485.46Z" fill="#BCBCBC"/>
<path d="M391.45 482.74L380.45 506.25C373.7 529.67 409.23 528.25 402.12 506.25L391.45 482.74Z" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M268.39 294H436.39" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M268.39 326.52H361.39" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M268.39 359.05H393.39" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M268.39 721H391.31" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M268.39 687H329.85" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
''';
