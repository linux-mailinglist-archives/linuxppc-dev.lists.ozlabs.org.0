Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A26666507
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 05:34:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lJSt5g8qzDqLb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 13:34:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.alibaba.com
 (client-ip=115.124.30.131; helo=out30-131.freemail.mail.aliyun.com;
 envelope-from=alex.shi@linux.alibaba.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.alibaba.com
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lGqg6kdDzDqlw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 12:20:41 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=alex.shi@linux.alibaba.com; NM=1;
 PH=DS; RN=23; SR=0; TI=SMTPD_---0TWfTwyQ_1562898030; 
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com
 fp:SMTPD_---0TWfTwyQ_1562898030) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 12 Jul 2019 10:20:30 +0800
From: Alex Shi <alex.shi@linux.alibaba.com>
To: linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 02/12] Documentation/arm: repointer docs to
 Documentation/arch/arm
Date: Fri, 12 Jul 2019 10:20:08 +0800
Message-Id: <20190712022018.27989-2-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
In-Reply-To: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
References: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 12 Jul 2019 13:28:54 +1000
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-s390@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-mips@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Kukjin Kim <kgene@kernel.org>, kvm@vger.kernel.org,
 linux-input@vger.kernel.org, linux-riscv@lists.infradead.org,
 Alex Shi <alex.shi@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since we move 'arm/arm64' docs to Documentation/arch/{arm,arm64} dir,
redirect the doc pointer to them.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-serial@vger.kernel.org
---
 Documentation/arch/arm/Samsung-S3C24XX/GPIO.txt    |  2 +-
 .../arch/arm/Samsung-S3C24XX/Overview.txt          |  6 +++---
 Documentation/arch/arm/Samsung/GPIO.txt            |  2 +-
 Documentation/arch/arm/Samsung/Overview.txt        |  4 ++--
 Documentation/devicetree/bindings/arm/xen.txt      |  2 +-
 Documentation/devicetree/booting-without-of.txt    |  4 ++--
 Documentation/translations/zh_CN/arm/Booting       |  4 ++--
 .../translations/zh_CN/arm/kernel_user_helpers.txt |  4 ++--
 MAINTAINERS                                        |  6 +++---
 arch/arm/Kconfig                                   |  2 +-
 arch/arm/common/mcpm_entry.c                       |  2 +-
 arch/arm/common/mcpm_head.S                        |  2 +-
 arch/arm/common/vlock.S                            |  2 +-
 arch/arm/include/asm/setup.h                       |  2 +-
 arch/arm/include/uapi/asm/setup.h                  |  2 +-
 arch/arm/kernel/entry-armv.S                       |  2 +-
 arch/arm/mach-exynos/common.h                      |  2 +-
 arch/arm/mach-ixp4xx/Kconfig                       | 14 +++++++-------
 arch/arm/mach-s3c24xx/pm.c                         |  2 +-
 arch/arm/mach-sti/Kconfig                          |  2 +-
 arch/arm/mm/Kconfig                                |  4 ++--
 arch/arm/plat-samsung/Kconfig                      |  6 +++---
 arch/arm/tools/mach-types                          |  2 +-
 arch/arm64/Kconfig                                 |  2 +-
 arch/arm64/kernel/kuser32.S                        |  2 +-
 arch/mips/bmips/setup.c                            |  2 +-
 drivers/crypto/sunxi-ss/sun4i-ss-cipher.c          |  2 +-
 drivers/crypto/sunxi-ss/sun4i-ss-core.c            |  2 +-
 drivers/crypto/sunxi-ss/sun4i-ss-hash.c            |  2 +-
 drivers/crypto/sunxi-ss/sun4i-ss.h                 |  2 +-
 drivers/input/touchscreen/sun4i-ts.c               |  2 +-
 drivers/tty/serial/Kconfig                         |  2 +-
 32 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/Documentation/arch/arm/Samsung-S3C24XX/GPIO.txt b/Documentation/arch/arm/Samsung-S3C24XX/GPIO.txt
index e8f918b96123..542a95cd82e7 100644
--- a/Documentation/arch/arm/Samsung-S3C24XX/GPIO.txt
+++ b/Documentation/arch/arm/Samsung-S3C24XX/GPIO.txt
@@ -12,7 +12,7 @@ Introduction
   of the s3c2410 GPIO system, please read the Samsung provided
   data-sheet/users manual to find out the complete list.
 
-  See Documentation/arm/Samsung/GPIO.txt for the core implementation.
+  See Documentation/arch/arm/Samsung/GPIO.txt for the core implementation.
 
 
 GPIOLIB
diff --git a/Documentation/arch/arm/Samsung-S3C24XX/Overview.txt b/Documentation/arch/arm/Samsung-S3C24XX/Overview.txt
index 00d3c3141e21..8d84a1c6216d 100644
--- a/Documentation/arch/arm/Samsung-S3C24XX/Overview.txt
+++ b/Documentation/arch/arm/Samsung-S3C24XX/Overview.txt
@@ -182,7 +182,7 @@ NAND
   controller. If there are any problems the latest linux-mtd
   code can be found from http://www.linux-mtd.infradead.org/
 
-  For more information see Documentation/arm/Samsung-S3C24XX/NAND.txt
+  For more information see Documentation/arch/arm/Samsung-S3C24XX/NAND.txt
 
 
 SD/MMC
@@ -221,8 +221,8 @@ GPIO
   As of v2.6.34, the move towards using gpiolib support is almost
   complete, and very little of the old calls are left.
 
-  See Documentation/arm/Samsung-S3C24XX/GPIO.txt for the S3C24XX specific
-  support and Documentation/arm/Samsung/GPIO.txt for the core Samsung
+  See Documentation/arch/arm/Samsung-S3C24XX/GPIO.txt for the S3C24XX specific
+  support and Documentation/arch/arm/Samsung/GPIO.txt for the core Samsung
   implementation.
 
 
diff --git a/Documentation/arch/arm/Samsung/GPIO.txt b/Documentation/arch/arm/Samsung/GPIO.txt
index 795adfd88081..e693603f38af 100644
--- a/Documentation/arch/arm/Samsung/GPIO.txt
+++ b/Documentation/arch/arm/Samsung/GPIO.txt
@@ -11,7 +11,7 @@ specific calls provided alongside the drivers/gpio core.
 S3C24XX (Legacy)
 ----------------
 
-See Documentation/arm/Samsung-S3C24XX/GPIO.txt for more information
+See Documentation/arch/arm/Samsung-S3C24XX/GPIO.txt for more information
 about these devices. Their implementation has been brought into line
 with the core samsung implementation described in this document.
 
diff --git a/Documentation/arch/arm/Samsung/Overview.txt b/Documentation/arch/arm/Samsung/Overview.txt
index 8f7309bad460..93091054a215 100644
--- a/Documentation/arch/arm/Samsung/Overview.txt
+++ b/Documentation/arch/arm/Samsung/Overview.txt
@@ -11,7 +11,7 @@ Introduction
 
   The currently supported SoCs are:
 
-  - S3C24XX: See Documentation/arm/Samsung-S3C24XX/Overview.txt for full list
+  - S3C24XX: See Documentation/arch/arm/Samsung-S3C24XX/Overview.txt for full list
   - S3C64XX: S3C6400 and S3C6410
   - S5PC110 / S5PV210
 
@@ -22,7 +22,7 @@ S3C24XX Systems
   There is still documentation in Documnetation/arm/Samsung-S3C24XX/ which
   deals with the architecture and drivers specific to these devices.
 
-  See Documentation/arm/Samsung-S3C24XX/Overview.txt for more information
+  See Documentation/arch/arm/Samsung-S3C24XX/Overview.txt for more information
   on the implementation details and specific support.
 
 
diff --git a/Documentation/devicetree/bindings/arm/xen.txt b/Documentation/devicetree/bindings/arm/xen.txt
index c9b9321434ea..2533cd4f5d79 100644
--- a/Documentation/devicetree/bindings/arm/xen.txt
+++ b/Documentation/devicetree/bindings/arm/xen.txt
@@ -54,7 +54,7 @@ hypervisor {
 };
 
 The format and meaning of the "xen,uefi-*" parameters are similar to those in
-Documentation/arm/uefi.txt, which are provided by the regular UEFI stub. However
+Documentation/arch/arm/uefi.txt, which are provided by the regular UEFI stub. However
 they differ because they are provided by the Xen hypervisor, together with a set
 of UEFI runtime services implemented via hypercalls, see
 http://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,platform.h.html.
diff --git a/Documentation/devicetree/booting-without-of.txt b/Documentation/devicetree/booting-without-of.txt
index 60f8640f2b2f..58d606fca7eb 100644
--- a/Documentation/devicetree/booting-without-of.txt
+++ b/Documentation/devicetree/booting-without-of.txt
@@ -160,7 +160,7 @@ it with special cases.
    of the kernel image. That entry point supports two calling
    conventions.  A summary of the interface is described here.  A full
    description of the boot requirements is documented in
-   Documentation/arm/Booting
+   Documentation/arch/arm/Booting
 
         a) ATAGS interface.  Minimal information is passed from firmware
         to the kernel with a tagged list of predefined parameters.
@@ -174,7 +174,7 @@ it with special cases.
         b) Entry with a flattened device-tree block.  Firmware loads the
         physical address of the flattened device tree block (dtb) into r2,
         r1 is not used, but it is considered good practice to use a valid
-        machine number as described in Documentation/arm/Booting.
+	machine number as described in Documentation/arch/arm/Booting.
 
                 r0 : 0
 
diff --git a/Documentation/translations/zh_CN/arm/Booting b/Documentation/translations/zh_CN/arm/Booting
index 1fe866f8218f..8bcad25099b3 100644
--- a/Documentation/translations/zh_CN/arm/Booting
+++ b/Documentation/translations/zh_CN/arm/Booting
@@ -1,4 +1,4 @@
-Chinese translated version of Documentation/arm/Booting
+Chinese translated version of Documentation/arch/arm/Booting
 
 If you have any comment or update to the content, please contact the
 original document maintainer directly.  However, if you have a problem
@@ -9,7 +9,7 @@ or if there is a problem with the translation.
 Maintainer: Russell King <linux@arm.linux.org.uk>
 Chinese maintainer: Fu Wei <tekkamanninja@gmail.com>
 ---------------------------------------------------------------------
-Documentation/arm/Booting 的中文翻译
+Documentation/arch/arm/Booting 的中文翻译
 
 如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
 交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
diff --git a/Documentation/translations/zh_CN/arm/kernel_user_helpers.txt b/Documentation/translations/zh_CN/arm/kernel_user_helpers.txt
index cd7fc8f34cf9..ed7083e7e43d 100644
--- a/Documentation/translations/zh_CN/arm/kernel_user_helpers.txt
+++ b/Documentation/translations/zh_CN/arm/kernel_user_helpers.txt
@@ -1,4 +1,4 @@
-Chinese translated version of Documentation/arm/kernel_user_helpers.txt
+Chinese translated version of Documentation/arch/arm/kernel_user_helpers.txt
 
 If you have any comment or update to the content, please contact the
 original document maintainer directly.  However, if you have a problem
@@ -10,7 +10,7 @@ Maintainer: Nicolas Pitre <nicolas.pitre@linaro.org>
 		Dave Martin <dave.martin@linaro.org>
 Chinese maintainer: Fu Wei <tekkamanninja@gmail.com>
 ---------------------------------------------------------------------
-Documentation/arm/kernel_user_helpers.txt 的中文翻译
+Documentation/arch/arm/kernel_user_helpers.txt 的中文翻译
 
 如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
 交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
diff --git a/MAINTAINERS b/MAINTAINERS
index 43ca94856944..c21d5464c86f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2192,7 +2192,7 @@ F:	drivers/*/*s3c64xx*
 F:	drivers/*/*s5pv210*
 F:	drivers/memory/samsung/*
 F:	drivers/soc/samsung/*
-F:	Documentation/arm/Samsung/
+F:	Documentation/arch/arm/Samsung/
 F:	Documentation/devicetree/bindings/arm/samsung/
 F:	Documentation/devicetree/bindings/sram/samsung-sram.txt
 F:	Documentation/devicetree/bindings/power/pd-samsung.txt
@@ -2569,7 +2569,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 S:	Maintained
 F:	arch/arm64/
 X:	arch/arm64/boot/dts/
-F:	Documentation/arm64/
+F:	Documentation/arch/arm64/
 
 AS3645A LED FLASH CONTROLLER DRIVER
 M:	Sakari Ailus <sakari.ailus@iki.fi>
@@ -11470,7 +11470,7 @@ L:	linux-omap@vger.kernel.org
 L:	linux-fbdev@vger.kernel.org
 S:	Orphan
 F:	drivers/video/fbdev/omap2/
-F:	Documentation/arm/OMAP/DSS
+F:	Documentation/arch/arm/OMAP/DSS
 
 OMAP FRAMEBUFFER SUPPORT
 L:	linux-fbdev@vger.kernel.org
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ad00e17d6988..1b276dda837d 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -2146,7 +2146,7 @@ config VFP
 	  Say Y to include VFP support code in the kernel. This is needed
 	  if your hardware includes a VFP unit.
 
-	  Please see <file:Documentation/arm/VFP/release-notes.txt> for
+	  Please see <file:Documentation/arch/arm/VFP/release-notes.txt> for
 	  release notes and additional status information.
 
 	  Say N if your target does not have VFP hardware.
diff --git a/arch/arm/common/mcpm_entry.c b/arch/arm/common/mcpm_entry.c
index e24ad60891b2..0ed7d19e0fbe 100644
--- a/arch/arm/common/mcpm_entry.c
+++ b/arch/arm/common/mcpm_entry.c
@@ -21,7 +21,7 @@
 /*
  * The public API for this code is documented in arch/arm/include/asm/mcpm.h.
  * For a comprehensive description of the main algorithm used here, please
- * see Documentation/arm/cluster-pm-race-avoidance.txt.
+ * see Documentation/arch/arm/cluster-pm-race-avoidance.txt.
  */
 
 struct sync_struct mcpm_sync;
diff --git a/arch/arm/common/mcpm_head.S b/arch/arm/common/mcpm_head.S
index d5bd75dd576d..c7071314ad76 100644
--- a/arch/arm/common/mcpm_head.S
+++ b/arch/arm/common/mcpm_head.S
@@ -5,7 +5,7 @@
  * Created by:  Nicolas Pitre, March 2012
  * Copyright:   (C) 2012-2013  Linaro Limited
  *
- * Refer to Documentation/arm/cluster-pm-race-avoidance.txt
+ * Refer to Documentation/arch/arm/cluster-pm-race-avoidance.txt
  * for details of the synchronisation algorithms used here.
  */
 
diff --git a/arch/arm/common/vlock.S b/arch/arm/common/vlock.S
index 9675cc15d0c4..cfb6db2053f7 100644
--- a/arch/arm/common/vlock.S
+++ b/arch/arm/common/vlock.S
@@ -6,7 +6,7 @@
  * Copyright:	(C) 2012-2013  Linaro Limited
  *
  * This algorithm is described in more detail in
- * Documentation/arm/vlocks.txt.
+ * Documentation/arch/arm/vlocks.txt.
  */
 
 #include <linux/linkage.h>
diff --git a/arch/arm/include/asm/setup.h b/arch/arm/include/asm/setup.h
index 77e5582c2259..483f9f29170a 100644
--- a/arch/arm/include/asm/setup.h
+++ b/arch/arm/include/asm/setup.h
@@ -5,7 +5,7 @@
  *  Copyright (C) 1997-1999 Russell King
  *
  *  Structure passed to kernel to tell it about the
- *  hardware it's running on.  See Documentation/arm/Setup
+ *  hardware it's running on.  See Documentation/arch/arm/Setup
  *  for more info.
  */
 #ifndef __ASMARM_SETUP_H
diff --git a/arch/arm/include/uapi/asm/setup.h b/arch/arm/include/uapi/asm/setup.h
index 6b335a9ff8c8..3691ac2a00b9 100644
--- a/arch/arm/include/uapi/asm/setup.h
+++ b/arch/arm/include/uapi/asm/setup.h
@@ -9,7 +9,7 @@
  * published by the Free Software Foundation.
  *
  *  Structure passed to kernel to tell it about the
- *  hardware it's running on.  See Documentation/arm/Setup
+ *  hardware it's running on.  See Documentation/arch/arm/Setup
  *  for more info.
  */
 #ifndef _UAPI__ASMARM_SETUP_H
diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index 0b8cfdd60b90..929f6332438e 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -826,7 +826,7 @@ ENDPROC(__switch_to)
  * existing ones.  This mechanism should be used only for things that are
  * really small and justified, and not be abused freely.
  *
- * See Documentation/arm/kernel_user_helpers.txt for formal definitions.
+ * See Documentation/arch/arm/kernel_user_helpers.txt for formal definitions.
  */
  THUMB(	.arm	)
 
diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index c93356a8d662..cd0878c5614f 100644
--- a/arch/arm/mach-exynos/common.h
+++ b/arch/arm/mach-exynos/common.h
@@ -106,7 +106,7 @@ void exynos_firmware_init(void);
 #define C2_STATE	(1 << 3)
 /*
  * Magic values for bootloader indicating chosen low power mode.
- * See also Documentation/arm/Samsung/Bootloader-interface.txt
+ * See also Documentation/arch/arm/Samsung/Bootloader-interface.txt
  */
 #define EXYNOS_SLEEP_MAGIC	0x00000bad
 #define EXYNOS_AFTR_MAGIC	0xfcba0d10
diff --git a/arch/arm/mach-ixp4xx/Kconfig b/arch/arm/mach-ixp4xx/Kconfig
index fc5378b00f3d..dd9c8009dffd 100644
--- a/arch/arm/mach-ixp4xx/Kconfig
+++ b/arch/arm/mach-ixp4xx/Kconfig
@@ -33,7 +33,7 @@ config MACH_AVILA
 	help
 	  Say 'Y' here if you want your kernel to support the Gateworks
 	  Avila Network Platform. For more information on this platform,
-	  see <file:Documentation/arm/IXP4xx>.
+	  see <file:Documentation/arch/arm/IXP4xx>.
 
 config MACH_LOFT
     bool "Loft"
@@ -49,7 +49,7 @@ config ARCH_ADI_COYOTE
 	help
 	  Say 'Y' here if you want your kernel to support the ADI 
 	  Engineering Coyote Gateway Reference Platform. For more
-	  information on this platform, see <file:Documentation/arm/IXP4xx>.
+	  information on this platform, see <file:Documentation/arch/arm/IXP4xx>.
 
 config MACH_GATEWAY7001
 	bool "Gateway 7001"
@@ -72,21 +72,21 @@ config ARCH_IXDP425
 	help
 	  Say 'Y' here if you want your kernel to support Intel's 
 	  IXDP425 Development Platform (Also known as Richfield).  
-	  For more information on this platform, see <file:Documentation/arm/IXP4xx>.
+	  For more information on this platform, see <file:Documentation/arch/arm/IXP4xx>.
 
 config MACH_IXDPG425
 	bool "IXDPG425"
 	help
 	  Say 'Y' here if you want your kernel to support Intel's
 	  IXDPG425 Development Platform (Also known as Montajade).
-	  For more information on this platform, see <file:Documentation/arm/IXP4xx>.
+	  For more information on this platform, see <file:Documentation/arch/arm/IXP4xx>.
 
 config MACH_IXDP465
 	bool "IXDP465"
 	help
 	  Say 'Y' here if you want your kernel to support Intel's
 	  IXDP465 Development Platform (Also known as BMP).
-	  For more information on this platform, see <file:Documentation/arm/IXP4xx>.
+	  For more information on this platform, see <file:Documentation/arch/arm/IXP4xx>.
 
 config MACH_GORAMO_MLR
 	bool "GORAMO Multi Link Router"
@@ -99,7 +99,7 @@ config MACH_KIXRP435
 	help
 	  Say 'Y' here if you want your kernel to support Intel's
 	  KIXRP435 Reference Platform.
-	  For more information on this platform, see <file:Documentation/arm/IXP4xx>.
+	  For more information on this platform, see <file:Documentation/arch/arm/IXP4xx>.
 
 #
 # IXCDP1100 is the exact same HW as IXDP425, but with a different machine 
@@ -116,7 +116,7 @@ config ARCH_PRPMC1100
 	help
 	  Say 'Y' here if you want your kernel to support the Motorola
 	  PrPCM1100 Processor Mezanine Module. For more information on
-	  this platform, see <file:Documentation/arm/IXP4xx>.
+	  this platform, see <file:Documentation/arch/arm/IXP4xx>.
 
 config MACH_NAS100D
 	bool
diff --git a/arch/arm/mach-s3c24xx/pm.c b/arch/arm/mach-s3c24xx/pm.c
index adcb90645460..ff605c777976 100644
--- a/arch/arm/mach-s3c24xx/pm.c
+++ b/arch/arm/mach-s3c24xx/pm.c
@@ -5,7 +5,7 @@
 //
 // S3C24XX Power Manager (Suspend-To-RAM) support
 //
-// See Documentation/arm/Samsung-S3C24XX/Suspend.txt for more information
+// See Documentation/arch/arm/Samsung-S3C24XX/Suspend.txt for more information
 //
 // Parts based on arch/arm/mach-pxa/pm.c
 //
diff --git a/arch/arm/mach-sti/Kconfig b/arch/arm/mach-sti/Kconfig
index b2d45cf10a3c..b3842c971d31 100644
--- a/arch/arm/mach-sti/Kconfig
+++ b/arch/arm/mach-sti/Kconfig
@@ -21,7 +21,7 @@ menuconfig ARCH_STI
 	help
 	  Include support for STMicroelectronics' STiH415/416, STiH407/10 and
 	  STiH418 family SoCs using the Device Tree for discovery.  More
-	  information can be found in Documentation/arm/sti/ and
+	  information can be found in Documentation/arch/arm/sti/ and
 	  Documentation/devicetree.
 
 if ARCH_STI
diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index cc798115aa9b..3ef82f228947 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -709,7 +709,7 @@ config ARM_VIRT_EXT
 	  assistance.
 
 	  A compliant bootloader is required in order to make maximum
-	  use of this feature.  Refer to Documentation/arm/Booting for
+	  use of this feature.  Refer to Documentation/arch/arm/Booting for
 	  details.
 
 config SWP_EMULATE
@@ -875,7 +875,7 @@ config KUSER_HELPERS
 	  the CPU type fitted to the system.  This permits binaries to be
 	  run on ARMv4 through to ARMv7 without modification.
 
-	  See Documentation/arm/kernel_user_helpers.txt for details.
+	  See Documentation/arch/arm/kernel_user_helpers.txt for details.
 
 	  However, the fixed address nature of these helpers can be used
 	  by ROP (return orientated programming) authors when creating
diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index 53da57fba39c..17b18f2e4b80 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -243,7 +243,7 @@ config SAMSUNG_PM_DEBUG
 	depends on DEBUG_EXYNOS_UART || DEBUG_S3C24XX_UART || DEBUG_S3C2410_UART
 	help
 	  Say Y here if you want verbose debugging from the PM Suspend and
-	  Resume code. See <file:Documentation/arm/Samsung-S3C24XX/Suspend.txt>
+	  Resume code. See <file:Documentation/arch/arm/Samsung-S3C24XX/Suspend.txt>
 	  for more information.
 
 config S3C_PM_DEBUG_LED_SMDK
@@ -268,7 +268,7 @@ config SAMSUNG_PM_CHECK
 	  Note, this can take several seconds depending on memory size
 	  and CPU speed.
 
-	  See <file:Documentation/arm/Samsung-S3C24XX/Suspend.txt>
+	  See <file:Documentation/arch/arm/Samsung-S3C24XX/Suspend.txt>
 
 config SAMSUNG_PM_CHECK_CHUNKSIZE
 	int "S3C2410 PM Suspend CRC Chunksize (KiB)"
@@ -280,7 +280,7 @@ config SAMSUNG_PM_CHECK_CHUNKSIZE
 	  the CRC data block will take more memory, but will identify any
 	  faults with better precision.
 
-	  See <file:Documentation/arm/Samsung-S3C24XX/Suspend.txt>
+	  See <file:Documentation/arch/arm/Samsung-S3C24XX/Suspend.txt>
 
 config SAMSUNG_WAKEMASK
 	bool
diff --git a/arch/arm/tools/mach-types b/arch/arm/tools/mach-types
index 4eac94c1eb6f..84f19e0b134b 100644
--- a/arch/arm/tools/mach-types
+++ b/arch/arm/tools/mach-types
@@ -7,7 +7,7 @@
 #   http://www.arm.linux.org.uk/developer/machines/download.php
 #
 # Please do not send patches to this file; it is automatically generated!
-# To add an entry into this database, please see Documentation/arm/README,
+# To add an entry into this database, please see Documentation/arch/arm/README,
 # or visit:
 #
 #   http://www.arm.linux.org.uk/developer/machines/?action=new
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index c085aec9459b..68d3a3af112f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1144,7 +1144,7 @@ config KUSER_HELPERS
 	  the system. This permits binaries to be run on ARMv4 through
 	  to ARMv8 without modification.
 
-	  See Documentation/arm/kernel_user_helpers.txt for details.
+	  See Documentation/arch/arm/kernel_user_helpers.txt for details.
 
 	  However, the fixed address nature of these helpers can be used
 	  by ROP (return orientated programming) authors when creating
diff --git a/arch/arm64/kernel/kuser32.S b/arch/arm64/kernel/kuser32.S
index 49825e9e421e..e828a1577166 100644
--- a/arch/arm64/kernel/kuser32.S
+++ b/arch/arm64/kernel/kuser32.S
@@ -10,7 +10,7 @@
  * aarch32_setup_additional_pages() and are provided for compatibility
  * reasons with 32 bit (aarch32) applications that need them.
  *
- * See Documentation/arm/kernel_user_helpers.txt for formal definitions.
+ * See Documentation/arch/arm/kernel_user_helpers.txt for formal definitions.
  */
 
 #include <asm/unistd.h>
diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index 1738a06396f9..cf6a5d50cf36 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -162,7 +162,7 @@ void __init plat_mem_setup(void)
 	ioport_resource.start = 0;
 	ioport_resource.end = ~0;
 
-	/* intended to somewhat resemble ARM; see Documentation/arm/Booting */
+	/* intended to somewhat resemble ARM; see Documentation/arch/arm/Booting */
 	if (fw_arg0 == 0 && fw_arg1 == 0xffffffff)
 		dtb = phys_to_virt(fw_arg2);
 	else if (fw_passed_dtb) /* UHI interface or appended dtb */
diff --git a/drivers/crypto/sunxi-ss/sun4i-ss-cipher.c b/drivers/crypto/sunxi-ss/sun4i-ss-cipher.c
index 4ab14d58e85b..333c2c83d52b 100644
--- a/drivers/crypto/sunxi-ss/sun4i-ss-cipher.c
+++ b/drivers/crypto/sunxi-ss/sun4i-ss-cipher.c
@@ -8,7 +8,7 @@
  * keysize in CBC and ECB mode.
  * Add support also for DES and 3DES in CBC and ECB mode.
  *
- * You could find the datasheet in Documentation/arm/sunxi/README
+ * You could find the datasheet in Documentation/arch/arm/sunxi/README
  */
 #include "sun4i-ss.h"
 
diff --git a/drivers/crypto/sunxi-ss/sun4i-ss-core.c b/drivers/crypto/sunxi-ss/sun4i-ss-core.c
index cdcda7f059c8..f0af1847b632 100644
--- a/drivers/crypto/sunxi-ss/sun4i-ss-core.c
+++ b/drivers/crypto/sunxi-ss/sun4i-ss-core.c
@@ -6,7 +6,7 @@
  *
  * Core file which registers crypto algorithms supported by the SS.
  *
- * You could find a link for the datasheet in Documentation/arm/sunxi/README
+ * You could find a link for the datasheet in Documentation/arch/arm/sunxi/README
  */
 #include <linux/clk.h>
 #include <linux/crypto.h>
diff --git a/drivers/crypto/sunxi-ss/sun4i-ss-hash.c b/drivers/crypto/sunxi-ss/sun4i-ss-hash.c
index d2b6d89aad28..93c243aaf66e 100644
--- a/drivers/crypto/sunxi-ss/sun4i-ss-hash.c
+++ b/drivers/crypto/sunxi-ss/sun4i-ss-hash.c
@@ -6,7 +6,7 @@
  *
  * This file add support for MD5 and SHA1.
  *
- * You could find the datasheet in Documentation/arm/sunxi/README
+ * You could find the datasheet in Documentation/arch/arm/sunxi/README
  */
 #include "sun4i-ss.h"
 #include <linux/scatterlist.h>
diff --git a/drivers/crypto/sunxi-ss/sun4i-ss.h b/drivers/crypto/sunxi-ss/sun4i-ss.h
index 68b82d1a6303..0fc0f9580d0c 100644
--- a/drivers/crypto/sunxi-ss/sun4i-ss.h
+++ b/drivers/crypto/sunxi-ss/sun4i-ss.h
@@ -8,7 +8,7 @@
  * Support MD5 and SHA1 hash algorithms.
  * Support DES and 3DES
  *
- * You could find the datasheet in Documentation/arm/sunxi/README
+ * You could find the datasheet in Documentation/arch/arm/sunxi/README
  */
 
 #include <linux/clk.h>
diff --git a/drivers/input/touchscreen/sun4i-ts.c b/drivers/input/touchscreen/sun4i-ts.c
index 92f6e1ae23a2..3a01766a259b 100644
--- a/drivers/input/touchscreen/sun4i-ts.c
+++ b/drivers/input/touchscreen/sun4i-ts.c
@@ -22,7 +22,7 @@
  * in the kernel). So this driver offers straight forward, reliable single
  * touch functionality only.
  *
- * s.a. A20 User Manual "1.15 TP" (Documentation/arm/sunxi/README)
+ * s.a. A20 User Manual "1.15 TP" (Documentation/arch/arm/sunxi/README)
  * (looks like the description in the A20 User Manual v1.3 is better
  * than the one in the A10 User Manual v.1.5)
  */
diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 0d31251e04cc..d6376d38079f 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -514,7 +514,7 @@ config SERIAL_SA1100
 	help
 	  If you have a machine based on a SA1100/SA1110 StrongARM(R) CPU you
 	  can enable its onboard serial port by enabling this option.
-	  Please read <file:Documentation/arm/SA1100/serial_UART> for further
+	  Please read <file:Documentation/arch/arm/SA1100/serial_UART> for further
 	  info.
 
 config SERIAL_SA1100_CONSOLE
-- 
2.19.1.856.g8858448bb

