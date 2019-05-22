Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 303CB25CDD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 06:30:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45806q3t9gzDqNJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 14:30:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45805T07cKzDqLG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 14:29:15 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4M4NDk9017068
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 00:29:12 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2smtp70b22-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 00:29:12 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Wed, 22 May 2019 05:29:10 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 22 May 2019 05:29:07 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4M4T5Ae57278636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 May 2019 04:29:05 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 890F4A4051;
 Wed, 22 May 2019 04:29:05 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DDB2A404D;
 Wed, 22 May 2019 04:29:05 +0000 (GMT)
Received: from pic2.home (unknown [9.145.21.204])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 22 May 2019 04:29:05 +0000 (GMT)
Subject: Re: [PATCH] misc: remove redundant 'default n' from Kconfig-s
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <CGME20190520141047eucas1p2c6006d1ecfc3eb287b6b33d131f66180@eucas1p2.samsung.com>
 <1ab818ae-4d9f-d17a-f11f-7caaa5bf98bc@samsung.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Wed, 22 May 2019 06:29:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1ab818ae-4d9f-d17a-f11f-7caaa5bf98bc@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-MC
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19052204-0020-0000-0000-0000033F295D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052204-0021-0000-0000-000021920BEB
Message-Id: <54415f18-223e-17a8-faaa-c1ffcc99e7eb@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-22_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905220030
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
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 20/05/2019 à 16:10, Bartlomiej Zolnierkiewicz a écrit :
> 'default n' is the default value for any bool or tristate Kconfig
> setting so there is no need to write it explicitly.
> 
> Also since commit f467c5640c29 ("kconfig: only write '# CONFIG_FOO
> is not set' for visible symbols") the Kconfig behavior is the same
> regardless of 'default n' being present or not:
> 
>      ...
>      One side effect of (and the main motivation for) this change is making
>      the following two definitions behave exactly the same:
>      
>          config FOO
>                  bool
>      
>          config FOO
>                  bool
>                  default n
>      
>      With this change, neither of these will generate a
>      '# CONFIG_FOO is not set' line (assuming FOO isn't selected/implied).
>      That might make it clearer to people that a bare 'default n' is
>      redundant.
>      ...
> 
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---

for cxl and ocxl:
Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>


>   drivers/misc/Kconfig              |   10 ----------
>   drivers/misc/altera-stapl/Kconfig |    1 -
>   drivers/misc/c2port/Kconfig       |    2 --
>   drivers/misc/cb710/Kconfig        |    1 -
>   drivers/misc/cxl/Kconfig          |    3 ---
>   drivers/misc/echo/Kconfig         |    1 -
>   drivers/misc/genwqe/Kconfig       |    1 -
>   drivers/misc/lis3lv02d/Kconfig    |    2 --
>   drivers/misc/ocxl/Kconfig         |    1 -
>   9 files changed, 22 deletions(-)
> 
> Index: b/drivers/misc/Kconfig
> ===================================================================
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -8,7 +8,6 @@ config SENSORS_LIS3LV02D
>   	tristate
>   	depends on INPUT
>   	select INPUT_POLLDEV
> -	default n
>   
>   config AD525X_DPOT
>   	tristate "Analog Devices Digital Potentiometers"
> @@ -61,7 +60,6 @@ config ATMEL_TCLIB
>   
>   config DUMMY_IRQ
>   	tristate "Dummy IRQ handler"
> -	default n
>   	---help---
>   	  This module accepts a single 'irq' parameter, which it should register for.
>   	  The sole purpose of this module is to help with debugging of systems on
> @@ -117,7 +115,6 @@ config PHANTOM
>   config INTEL_MID_PTI
>   	tristate "Parallel Trace Interface for MIPI P1149.7 cJTAG standard"
>   	depends on PCI && TTY && (X86_INTEL_MID || COMPILE_TEST)
> -	default n
>   	help
>   	  The PTI (Parallel Trace Interface) driver directs
>   	  trace data routed from various parts in the system out
> @@ -193,7 +190,6 @@ config ATMEL_SSC
>   
>   config ENCLOSURE_SERVICES
>   	tristate "Enclosure Services"
> -	default n
>   	help
>   	  Provides support for intelligent enclosures (bays which
>   	  contain storage devices).  You also need either a host
> @@ -217,7 +213,6 @@ config SGI_XP
>   config CS5535_MFGPT
>   	tristate "CS5535/CS5536 Geode Multi-Function General Purpose Timer (MFGPT) support"
>   	depends on MFD_CS5535
> -	default n
>   	help
>   	  This driver provides access to MFGPT functionality for other
>   	  drivers that need timers.  MFGPTs are available in the CS5535 and
> @@ -250,7 +245,6 @@ config CS5535_CLOCK_EVENT_SRC
>   config HP_ILO
>   	tristate "Channel interface driver for the HP iLO processor"
>   	depends on PCI
> -	default n
>   	help
>   	  The channel interface driver allows applications to communicate
>   	  with iLO management processors present on HP ProLiant servers.
> @@ -285,7 +279,6 @@ config QCOM_FASTRPC
>   config SGI_GRU
>   	tristate "SGI GRU driver"
>   	depends on X86_UV && SMP
> -	default n
>   	select MMU_NOTIFIER
>   	---help---
>   	The GRU is a hardware resource located in the system chipset. The GRU
> @@ -300,7 +293,6 @@ config SGI_GRU
>   config SGI_GRU_DEBUG
>   	bool  "SGI GRU driver debug"
>   	depends on SGI_GRU
> -	default n
>   	---help---
>   	This option enables additional debugging code for the SGI GRU driver.
>   	If you are unsure, say N.
> @@ -358,7 +350,6 @@ config SENSORS_BH1770
>   config SENSORS_APDS990X
>   	 tristate "APDS990X combined als and proximity sensors"
>   	 depends on I2C
> -	 default n
>   	 ---help---
>   	   Say Y here if you want to build a driver for Avago APDS990x
>   	   combined ambient light and proximity sensor chip.
> @@ -386,7 +377,6 @@ config DS1682
>   config SPEAR13XX_PCIE_GADGET
>   	bool "PCIe gadget support for SPEAr13XX platform"
>   	depends on ARCH_SPEAR13XX && BROKEN
> -	default n
>   	help
>   	 This option enables gadget support for PCIe controller. If
>   	 board file defines any controller as PCIe endpoint then a sysfs
> Index: b/drivers/misc/altera-stapl/Kconfig
> ===================================================================
> --- a/drivers/misc/altera-stapl/Kconfig
> +++ b/drivers/misc/altera-stapl/Kconfig
> @@ -4,6 +4,5 @@ comment "Altera FPGA firmware download m
>   config ALTERA_STAPL
>   	tristate "Altera FPGA firmware download module"
>   	depends on I2C
> -	default n
>   	help
>   	  An Altera FPGA module. Say Y when you want to support this tool.
> Index: b/drivers/misc/c2port/Kconfig
> ===================================================================
> --- a/drivers/misc/c2port/Kconfig
> +++ b/drivers/misc/c2port/Kconfig
> @@ -4,7 +4,6 @@
>   
>   menuconfig C2PORT
>   	tristate "Silicon Labs C2 port support"
> -	default n
>   	help
>   	  This option enables support for Silicon Labs C2 port used to
>   	  program Silicon micro controller chips (and other 8051 compatible).
> @@ -23,7 +22,6 @@ if C2PORT
>   config C2PORT_DURAMAR_2150
>   	tristate "C2 port support for Eurotech's Duramar 2150"
>   	depends on X86
> -	default n
>   	help
>   	  This option enables C2 support for the Eurotech's Duramar 2150
>   	  on board micro controller.
> Index: b/drivers/misc/cb710/Kconfig
> ===================================================================
> --- a/drivers/misc/cb710/Kconfig
> +++ b/drivers/misc/cb710/Kconfig
> @@ -14,7 +14,6 @@ config CB710_CORE
>   config CB710_DEBUG
>   	bool "Enable driver debugging"
>   	depends on CB710_CORE != n
> -	default n
>   	help
>   	  This is an option for use by developers; most people should
>   	  say N here.  This adds a lot of debugging output to dmesg.
> Index: b/drivers/misc/cxl/Kconfig
> ===================================================================
> --- a/drivers/misc/cxl/Kconfig
> +++ b/drivers/misc/cxl/Kconfig
> @@ -4,16 +4,13 @@
>   
>   config CXL_BASE
>   	bool
> -	default n
>   	select PPC_COPRO_BASE
>   
>   config CXL_AFU_DRIVER_OPS
>   	bool
> -	default n
>   
>   config CXL_LIB
>   	bool
> -	default n
>   
>   config CXL
>   	tristate "Support for IBM Coherent Accelerators (CXL)"
> Index: b/drivers/misc/echo/Kconfig
> ===================================================================
> --- a/drivers/misc/echo/Kconfig
> +++ b/drivers/misc/echo/Kconfig
> @@ -1,6 +1,5 @@
>   config ECHO
>   	tristate "Line Echo Canceller support"
> -	default n
>   	---help---
>   	  This driver provides line echo cancelling support for mISDN and
>   	  Zaptel drivers.
> Index: b/drivers/misc/genwqe/Kconfig
> ===================================================================
> --- a/drivers/misc/genwqe/Kconfig
> +++ b/drivers/misc/genwqe/Kconfig
> @@ -6,7 +6,6 @@ menuconfig GENWQE
>   	tristate "GenWQE PCIe Accelerator"
>   	depends on PCI && 64BIT
>   	select CRC_ITU_T
> -	default n
>   	help
>   	  Enables PCIe card driver for IBM GenWQE accelerators.
>   	  The user-space interface is described in
> Index: b/drivers/misc/lis3lv02d/Kconfig
> ===================================================================
> --- a/drivers/misc/lis3lv02d/Kconfig
> +++ b/drivers/misc/lis3lv02d/Kconfig
> @@ -6,7 +6,6 @@ config SENSORS_LIS3_SPI
>   	tristate "STMicroeletronics LIS3LV02Dx three-axis digital accelerometer (SPI)"
>   	depends on !ACPI && SPI_MASTER && INPUT
>   	select SENSORS_LIS3LV02D
> -	default n
>   	help
>   	  This driver provides support for the LIS3LV02Dx accelerometer connected
>   	  via SPI. The accelerometer data is readable via
> @@ -23,7 +22,6 @@ config SENSORS_LIS3_I2C
>   	tristate "STMicroeletronics LIS3LV02Dx three-axis digital accelerometer (I2C)"
>   	depends on I2C && INPUT
>   	select SENSORS_LIS3LV02D
> -	default n
>   	help
>   	  This driver provides support for the LIS3LV02Dx accelerometer connected
>   	  via I2C. The accelerometer data is readable via
> Index: b/drivers/misc/ocxl/Kconfig
> ===================================================================
> --- a/drivers/misc/ocxl/Kconfig
> +++ b/drivers/misc/ocxl/Kconfig
> @@ -4,7 +4,6 @@
>   
>   config OCXL_BASE
>   	bool
> -	default n
>   	select PPC_COPRO_BASE
>   
>   config OCXL
> 

