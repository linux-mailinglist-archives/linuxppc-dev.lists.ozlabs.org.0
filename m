Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D27239BE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 16:22:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4571LR1BCRzDqFB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 00:22:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=samsung.com
 (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com;
 envelope-from=b.zolnierkie@samsung.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=samsung.com header.i=@samsung.com header.b="JgTjQXuB"; 
 dkim-atps=neutral
X-Greylist: delayed 551 seconds by postgrey-1.36 at bilbo;
 Tue, 21 May 2019 00:20:06 AEST
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4571J65GYdzDqCF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 00:20:04 +1000 (AEST)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190520141049euoutp02d23ac8c865eb9e1b8373b56b220c3898~gaXtJE35f1941019410euoutp02X
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 14:10:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190520141049euoutp02d23ac8c865eb9e1b8373b56b220c3898~gaXtJE35f1941019410euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1558361449;
 bh=ztZxQiy5snHcIRSug4O8b3KM0Ryq/Oaqo4hrWb/28l0=;
 h=To:Cc:From:Subject:Date:References:From;
 b=JgTjQXuB3kKpGX5eF+vO/+UdczFHaTqdrV9t3bNWCY2ayrAI8my8nEZ9HDtZprnZt
 yzNK7IF4n8xkqxvQK7ASuUr7/jX5TopBEI0FGTK1PvtzTRiGifcDzdZlx3f1zco3Lg
 kOi1saP8KMX31i24gVvuDioCK1OwKfQnenBupdxk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190520141048eucas1p24dfb9080f557e4872a674883cd1c36ee~gaXscPbUl1793417934eucas1p26;
 Mon, 20 May 2019 14:10:48 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id FF.FB.04325.865B2EC5; Mon, 20
 May 2019 15:10:48 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190520141047eucas1p2c6006d1ecfc3eb287b6b33d131f66180~gaXrqv1Bz1793417934eucas1p24;
 Mon, 20 May 2019 14:10:47 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190520141047eusmtrp2eab44ba721b56720dbabf6cd3a7d6977~gaXrcpmtN2432424324eusmtrp2R;
 Mon, 20 May 2019 14:10:47 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-62-5ce2b568f2e1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id BF.C0.04140.765B2EC5; Mon, 20
 May 2019 15:10:47 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190520141047eusmtip2f5ddece065d6a28547c93bcca598f7c3~gaXrDmOJA3180431804eusmtip2U;
 Mon, 20 May 2019 14:10:47 +0000 (GMT)
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] misc: remove redundant 'default n' from Kconfig-s
Message-ID: <1ab818ae-4d9f-d17a-f11f-7caaa5bf98bc@samsung.com>
Date: Mon, 20 May 2019 16:10:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRjtt3t3d13NrtPwwzJrVGaQ5gO8VNqD/rgEYVR/mAl1y6uTfLH5
 TAhRMbECH5k6ZuYqTROd03xRKk5mJqZphiim2EQNh5KPrKXmvEr+d77vO4dzDnwkJm0ROpCh
 EdGcIoINkxFivM7wu+e4/O144IkkvQ0989KA0SvZBhGtX+nD6cqUIoJOeVFF0BPLwwK6v0lN
 0OZfq0J6afIjOmvFmP9kIyZT04qYlsIKEdOTX4wYVVozwfSm7mTmdfsviwLEp4O4sNBYTuHm
 e0ssL2noJqL6z8RrdNeT0BuPDGRFAuUFA+/bBRlITEqp1whqRnoxflhAULmkw/lhHsH042pi
 S6JPNQn5QymC4ao5gh9MCBpmzJiFZUddg2dZ5g05Rr0SQHKKSmA5ENRJyHpQjizYljoPmolB
 kQVLKF8Y7f62YYFThyGjpXiDs4fyh1GDVshzbKCzwIhbMEbZw5CxSMBjJ6g3qTeCA1UngrJ3
 Uxif9QIMPcrdzG0LPzpqRTzeB2uNRQJeUIlgJX1qU12PoDRndVNxCvQdn9etyXULF6hqcuPX
 5yD/6QSyrIGyhkGTDR/CGrLr8jB+LYH0NCnPPgLaEi2xZZvRWLYZjYE+4zKeiQ6qtlVTbaum
 2lZN9T/Dc4SXI3suRhkewik9I7g4VyUbroyJCHG9ExmuQ+tv1bXasdiAmv/ebkMUiWS7JPIn
 44FSIRurTAhvQ0BiMjuJp/NooFQSxCbc4xSRNxUxYZyyDe0lcZm9JHHH2A0pFcJGc3c5LopT
 bF0FpJVDEoprPuQj7qlIjm8fq/erbfYKvTLpabxqDHMMONBdPB3Unfc1N3PNtBDsfFTtoa0s
 9Q41+uA9P7UO44zHp90DwXNRwT5furxZJ12O7fTI/YAAT68Zd41DrEf/7Molvw90YkH0nLrf
 xfyw0DqktSVvcbbzoqOG/e7P6tU1moJL1e0yXCln3Y9hCiX7DxB5LdpSAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRmVeSWpSXmKPExsVy+t/xe7rpWx/FGHxYLG3xZskxZou/k46x
 Wxz+e4nFYl3zfDaL5sXr2Sye/rjNZHF51xw2i9/f/7FafHt+itGB0+P3r0mMHhMWHWD02D93
 DbvH+RkLGT1mte1j87jQwu3xeZNcAHuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5
 rJWRqZK+nU1Kak5mWWqRvl2CXsayHWfZCi7bVyzaFNnAuNqoi5GTQ0LAROJwy1vWLkYuDiGB
 pYwSj5/dB3I4gBIyEsfXl0HUCEv8udbFBlHzmlHi9f7jTCA1IgIhEvsPqYDEmQWWMkn8mTeZ
 CaSBTcBKYmL7KkYQW1jASWLR0xvsIDavgJ3E/bP32EBsFgFVia79C8FqRAUiJM68X8ECUSMo
 cXLmEzCbWUAdaOYlZghbXOLWk/lMELa8xPa3c5gnMArMQtIyC0nLLCQts5C0LGBkWcUoklpa
 nJueW2ykV5yYW1yal66XnJ+7iREYZ9uO/dyyg7HrXfAhRgEORiUe3owpj2KEWBPLiitzDzFK
 cDArifAaq9+PEeJNSaysSi3Kjy8qzUktPsRoCvTQRGYp0eR8YArIK4k3NDU0t7A0NDc2Nzaz
 UBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXAWNZcVHtoRsQflyeGta8bamuT7f/zL+1eEFVz
 Xca298L2eQv0K5ZtyHtfqnvGNU3js8Il14ZtRzPv7N7j47OV4dtMxlWT08u8KvQb5rxXU2z0
 EA3V/v1mUes3lX2+2rqPbZeu2VF1dL99bc1bh1dPGB7Lqx2buWnb2h6zXysnOrt1HctnqlB/
 qMRSnJFoqMVcVJwIAEMUAUvJAgAA
X-CMS-MailID: 20190520141047eucas1p2c6006d1ecfc3eb287b6b33d131f66180
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190520141047eucas1p2c6006d1ecfc3eb287b6b33d131f66180
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190520141047eucas1p2c6006d1ecfc3eb287b6b33d131f66180
References: <CGME20190520141047eucas1p2c6006d1ecfc3eb287b6b33d131f66180@eucas1p2.samsung.com>
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
Cc: Eric Piel <eric.piel@tremplin-utc.net>,
 Andrew Donnellan <ajd@linux.ibm.com>, Frank Haverkamp <haver@linux.ibm.com>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

'default n' is the default value for any bool or tristate Kconfig
setting so there is no need to write it explicitly.

Also since commit f467c5640c29 ("kconfig: only write '# CONFIG_FOO
is not set' for visible symbols") the Kconfig behavior is the same
regardless of 'default n' being present or not:

    ...
    One side effect of (and the main motivation for) this change is making
    the following two definitions behave exactly the same:
    
        config FOO
                bool
    
        config FOO
                bool
                default n
    
    With this change, neither of these will generate a
    '# CONFIG_FOO is not set' line (assuming FOO isn't selected/implied).
    That might make it clearer to people that a bare 'default n' is
    redundant.
    ...

Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/misc/Kconfig              |   10 ----------
 drivers/misc/altera-stapl/Kconfig |    1 -
 drivers/misc/c2port/Kconfig       |    2 --
 drivers/misc/cb710/Kconfig        |    1 -
 drivers/misc/cxl/Kconfig          |    3 ---
 drivers/misc/echo/Kconfig         |    1 -
 drivers/misc/genwqe/Kconfig       |    1 -
 drivers/misc/lis3lv02d/Kconfig    |    2 --
 drivers/misc/ocxl/Kconfig         |    1 -
 9 files changed, 22 deletions(-)

Index: b/drivers/misc/Kconfig
===================================================================
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -8,7 +8,6 @@ config SENSORS_LIS3LV02D
 	tristate
 	depends on INPUT
 	select INPUT_POLLDEV
-	default n
 
 config AD525X_DPOT
 	tristate "Analog Devices Digital Potentiometers"
@@ -61,7 +60,6 @@ config ATMEL_TCLIB
 
 config DUMMY_IRQ
 	tristate "Dummy IRQ handler"
-	default n
 	---help---
 	  This module accepts a single 'irq' parameter, which it should register for.
 	  The sole purpose of this module is to help with debugging of systems on
@@ -117,7 +115,6 @@ config PHANTOM
 config INTEL_MID_PTI
 	tristate "Parallel Trace Interface for MIPI P1149.7 cJTAG standard"
 	depends on PCI && TTY && (X86_INTEL_MID || COMPILE_TEST)
-	default n
 	help
 	  The PTI (Parallel Trace Interface) driver directs
 	  trace data routed from various parts in the system out
@@ -193,7 +190,6 @@ config ATMEL_SSC
 
 config ENCLOSURE_SERVICES
 	tristate "Enclosure Services"
-	default n
 	help
 	  Provides support for intelligent enclosures (bays which
 	  contain storage devices).  You also need either a host
@@ -217,7 +213,6 @@ config SGI_XP
 config CS5535_MFGPT
 	tristate "CS5535/CS5536 Geode Multi-Function General Purpose Timer (MFGPT) support"
 	depends on MFD_CS5535
-	default n
 	help
 	  This driver provides access to MFGPT functionality for other
 	  drivers that need timers.  MFGPTs are available in the CS5535 and
@@ -250,7 +245,6 @@ config CS5535_CLOCK_EVENT_SRC
 config HP_ILO
 	tristate "Channel interface driver for the HP iLO processor"
 	depends on PCI
-	default n
 	help
 	  The channel interface driver allows applications to communicate
 	  with iLO management processors present on HP ProLiant servers.
@@ -285,7 +279,6 @@ config QCOM_FASTRPC
 config SGI_GRU
 	tristate "SGI GRU driver"
 	depends on X86_UV && SMP
-	default n
 	select MMU_NOTIFIER
 	---help---
 	The GRU is a hardware resource located in the system chipset. The GRU
@@ -300,7 +293,6 @@ config SGI_GRU
 config SGI_GRU_DEBUG
 	bool  "SGI GRU driver debug"
 	depends on SGI_GRU
-	default n
 	---help---
 	This option enables additional debugging code for the SGI GRU driver.
 	If you are unsure, say N.
@@ -358,7 +350,6 @@ config SENSORS_BH1770
 config SENSORS_APDS990X
 	 tristate "APDS990X combined als and proximity sensors"
 	 depends on I2C
-	 default n
 	 ---help---
 	   Say Y here if you want to build a driver for Avago APDS990x
 	   combined ambient light and proximity sensor chip.
@@ -386,7 +377,6 @@ config DS1682
 config SPEAR13XX_PCIE_GADGET
 	bool "PCIe gadget support for SPEAr13XX platform"
 	depends on ARCH_SPEAR13XX && BROKEN
-	default n
 	help
 	 This option enables gadget support for PCIe controller. If
 	 board file defines any controller as PCIe endpoint then a sysfs
Index: b/drivers/misc/altera-stapl/Kconfig
===================================================================
--- a/drivers/misc/altera-stapl/Kconfig
+++ b/drivers/misc/altera-stapl/Kconfig
@@ -4,6 +4,5 @@ comment "Altera FPGA firmware download m
 config ALTERA_STAPL
 	tristate "Altera FPGA firmware download module"
 	depends on I2C
-	default n
 	help
 	  An Altera FPGA module. Say Y when you want to support this tool.
Index: b/drivers/misc/c2port/Kconfig
===================================================================
--- a/drivers/misc/c2port/Kconfig
+++ b/drivers/misc/c2port/Kconfig
@@ -4,7 +4,6 @@
 
 menuconfig C2PORT
 	tristate "Silicon Labs C2 port support"
-	default n
 	help
 	  This option enables support for Silicon Labs C2 port used to
 	  program Silicon micro controller chips (and other 8051 compatible).
@@ -23,7 +22,6 @@ if C2PORT
 config C2PORT_DURAMAR_2150
 	tristate "C2 port support for Eurotech's Duramar 2150"
 	depends on X86
-	default n
 	help
 	  This option enables C2 support for the Eurotech's Duramar 2150
 	  on board micro controller.
Index: b/drivers/misc/cb710/Kconfig
===================================================================
--- a/drivers/misc/cb710/Kconfig
+++ b/drivers/misc/cb710/Kconfig
@@ -14,7 +14,6 @@ config CB710_CORE
 config CB710_DEBUG
 	bool "Enable driver debugging"
 	depends on CB710_CORE != n
-	default n
 	help
 	  This is an option for use by developers; most people should
 	  say N here.  This adds a lot of debugging output to dmesg.
Index: b/drivers/misc/cxl/Kconfig
===================================================================
--- a/drivers/misc/cxl/Kconfig
+++ b/drivers/misc/cxl/Kconfig
@@ -4,16 +4,13 @@
 
 config CXL_BASE
 	bool
-	default n
 	select PPC_COPRO_BASE
 
 config CXL_AFU_DRIVER_OPS
 	bool
-	default n
 
 config CXL_LIB
 	bool
-	default n
 
 config CXL
 	tristate "Support for IBM Coherent Accelerators (CXL)"
Index: b/drivers/misc/echo/Kconfig
===================================================================
--- a/drivers/misc/echo/Kconfig
+++ b/drivers/misc/echo/Kconfig
@@ -1,6 +1,5 @@
 config ECHO
 	tristate "Line Echo Canceller support"
-	default n
 	---help---
 	  This driver provides line echo cancelling support for mISDN and
 	  Zaptel drivers.
Index: b/drivers/misc/genwqe/Kconfig
===================================================================
--- a/drivers/misc/genwqe/Kconfig
+++ b/drivers/misc/genwqe/Kconfig
@@ -6,7 +6,6 @@ menuconfig GENWQE
 	tristate "GenWQE PCIe Accelerator"
 	depends on PCI && 64BIT
 	select CRC_ITU_T
-	default n
 	help
 	  Enables PCIe card driver for IBM GenWQE accelerators.
 	  The user-space interface is described in
Index: b/drivers/misc/lis3lv02d/Kconfig
===================================================================
--- a/drivers/misc/lis3lv02d/Kconfig
+++ b/drivers/misc/lis3lv02d/Kconfig
@@ -6,7 +6,6 @@ config SENSORS_LIS3_SPI
 	tristate "STMicroeletronics LIS3LV02Dx three-axis digital accelerometer (SPI)"
 	depends on !ACPI && SPI_MASTER && INPUT
 	select SENSORS_LIS3LV02D
-	default n
 	help
 	  This driver provides support for the LIS3LV02Dx accelerometer connected
 	  via SPI. The accelerometer data is readable via
@@ -23,7 +22,6 @@ config SENSORS_LIS3_I2C
 	tristate "STMicroeletronics LIS3LV02Dx three-axis digital accelerometer (I2C)"
 	depends on I2C && INPUT
 	select SENSORS_LIS3LV02D
-	default n
 	help
 	  This driver provides support for the LIS3LV02Dx accelerometer connected
 	  via I2C. The accelerometer data is readable via
Index: b/drivers/misc/ocxl/Kconfig
===================================================================
--- a/drivers/misc/ocxl/Kconfig
+++ b/drivers/misc/ocxl/Kconfig
@@ -4,7 +4,6 @@
 
 config OCXL_BASE
 	bool
-	default n
 	select PPC_COPRO_BASE
 
 config OCXL
