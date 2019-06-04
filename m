Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8D233CF8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 04:02:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HwDb68wJzDqLC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 12:02:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HwC86V6rzDqMd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 12:01:40 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x541pnkg107995
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 3 Jun 2019 22:01:37 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2swdumbea3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2019 22:01:36 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Tue, 4 Jun 2019 03:01:34 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 4 Jun 2019 03:01:31 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5421UoR53805072
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 Jun 2019 02:01:30 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75A6D4204F
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 02:01:30 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBBFC42042
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 02:01:29 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 02:01:29 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 567DAA01BD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 12:01:28 +1000 (AEST)
Subject: Re: [PATCH v2 1/5] powerpc/powernv: Move SCOM access code into
 powernv platform
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
References: <20190509051119.7694-1-ajd@linux.ibm.com>
Date: Tue, 4 Jun 2019 12:01:22 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190509051119.7694-1-ajd@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19060402-0012-0000-0000-00000322AA99
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060402-0013-0000-0000-0000215B8711
Message-Id: <166d8f54-50b8-648d-f839-bee788e68abf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-04_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906040009
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/5/19 3:11 pm, Andrew Donnellan wrote:
> The powernv platform is the only one that directly accesses SCOMs. Move the
> support code to platforms/powernv, and get rid of the PPC_SCOM Kconfig
> option, as SCOM support is always selected when compiling for powernv.
> 
> This also means that the Kconfig item for CONFIG_SCOM_DEBUGFS will actually
> show up in menuconfig, as previously it was the only labelled option in
> sysdev/Kconfig and wasn't actually in a menu.

As I've just realised, this isn't actually correct - the option does 
indeed show up... in the root menu, where I've just been trained to 
ignore it, and where you won't get a menu location if you try to search 
for it using / in menuconfig.

I think moving it to the platform menu is obviously a better location. 
mpe would you be able to fix up the commit message in merge?


Andrew


> 
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
> v1->v2:
> - move scom.h as well (mpe)
> - add all the other patches in this series
> ---
>   arch/powerpc/platforms/powernv/Kconfig              |  5 ++++-
>   arch/powerpc/platforms/powernv/Makefile             |  2 +-
>   arch/powerpc/platforms/powernv/opal-xscom.c         |  3 ++-
>   arch/powerpc/{sysdev => platforms/powernv}/scom.c   |  3 ++-
>   .../{include/asm => platforms/powernv}/scom.h       | 13 +++----------
>   arch/powerpc/sysdev/Kconfig                         |  7 -------
>   arch/powerpc/sysdev/Makefile                        |  2 --
>   7 files changed, 12 insertions(+), 23 deletions(-)
>   rename arch/powerpc/{sysdev => platforms/powernv}/scom.c (99%)
>   rename arch/powerpc/{include/asm => platforms/powernv}/scom.h (95%)
> 
> diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
> index 850eee860cf2..938803eab0ad 100644
> --- a/arch/powerpc/platforms/powernv/Kconfig
> +++ b/arch/powerpc/platforms/powernv/Kconfig
> @@ -12,7 +12,6 @@ config PPC_POWERNV
>   	select EPAPR_BOOT
>   	select PPC_INDIRECT_PIO
>   	select PPC_UDBG_16550
> -	select PPC_SCOM
>   	select ARCH_RANDOM
>   	select CPU_FREQ
>   	select PPC_DOORBELL
> @@ -47,3 +46,7 @@ config PPC_VAS
>   	  VAS adapters are found in POWER9 based systems.
>   
>   	  If unsure, say N.
> +
> +config SCOM_DEBUGFS
> +	bool "Expose SCOM controllers via debugfs"
> +	depends on DEBUG_FS
> diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
> index da2e99efbd04..4b1644150135 100644
> --- a/arch/powerpc/platforms/powernv/Makefile
> +++ b/arch/powerpc/platforms/powernv/Makefile
> @@ -4,12 +4,12 @@ obj-y			+= idle.o opal-rtc.o opal-nvram.o opal-lpc.o opal-flash.o
>   obj-y			+= rng.o opal-elog.o opal-dump.o opal-sysparam.o opal-sensor.o
>   obj-y			+= opal-msglog.o opal-hmi.o opal-power.o opal-irqchip.o
>   obj-y			+= opal-kmsg.o opal-powercap.o opal-psr.o opal-sensor-groups.o
> +obj-y			+= opal-xscom.o scom.o
>   
>   obj-$(CONFIG_SMP)	+= smp.o subcore.o subcore-asm.o
>   obj-$(CONFIG_PCI)	+= pci.o pci-ioda.o npu-dma.o pci-ioda-tce.o
>   obj-$(CONFIG_CXL_BASE)	+= pci-cxl.o
>   obj-$(CONFIG_EEH)	+= eeh-powernv.o
> -obj-$(CONFIG_PPC_SCOM)	+= opal-xscom.o
>   obj-$(CONFIG_MEMORY_FAILURE)	+= opal-memory-errors.o
>   obj-$(CONFIG_OPAL_PRD)	+= opal-prd.o
>   obj-$(CONFIG_PERF_EVENTS) += opal-imc.o
> diff --git a/arch/powerpc/platforms/powernv/opal-xscom.c b/arch/powerpc/platforms/powernv/opal-xscom.c
> index 22d5e1110dbb..66337d92cb63 100644
> --- a/arch/powerpc/platforms/powernv/opal-xscom.c
> +++ b/arch/powerpc/platforms/powernv/opal-xscom.c
> @@ -18,7 +18,8 @@
>   #include <asm/machdep.h>
>   #include <asm/firmware.h>
>   #include <asm/opal.h>
> -#include <asm/scom.h>
> +
> +#include "scom.h"
>   
>   /*
>    * We could probably fit that inside the scom_map_t
> diff --git a/arch/powerpc/sysdev/scom.c b/arch/powerpc/platforms/powernv/scom.c
> similarity index 99%
> rename from arch/powerpc/sysdev/scom.c
> rename to arch/powerpc/platforms/powernv/scom.c
> index a707b24a7ddb..50c019d2ef45 100644
> --- a/arch/powerpc/sysdev/scom.c
> +++ b/arch/powerpc/platforms/powernv/scom.c
> @@ -23,9 +23,10 @@
>   #include <linux/export.h>
>   #include <asm/debugfs.h>
>   #include <asm/prom.h>
> -#include <asm/scom.h>
>   #include <linux/uaccess.h>
>   
> +#include "scom.h"
> +
>   const struct scom_controller *scom_controller;
>   EXPORT_SYMBOL_GPL(scom_controller);
>   
> diff --git a/arch/powerpc/include/asm/scom.h b/arch/powerpc/platforms/powernv/scom.h
> similarity index 95%
> rename from arch/powerpc/include/asm/scom.h
> rename to arch/powerpc/platforms/powernv/scom.h
> index f5cde45b1161..b14fe0edf95b 100644
> --- a/arch/powerpc/include/asm/scom.h
> +++ b/arch/powerpc/platforms/powernv/scom.h
> @@ -18,12 +18,8 @@
>    *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
>    */
>   
> -#ifndef _ASM_POWERPC_SCOM_H
> -#define _ASM_POWERPC_SCOM_H
> -
> -#ifdef __KERNEL__
> -#ifndef __ASSEMBLY__
> -#ifdef CONFIG_PPC_SCOM
> +#ifndef _SCOM_H
> +#define _SCOM_H
>   
>   /*
>    * The SCOM bus is a sideband bus used for accessing various internal
> @@ -161,7 +157,4 @@ static inline int scom_write(scom_map_t map, u64 reg, u64 value)
>   }
>   
>   
> -#endif /* CONFIG_PPC_SCOM */
> -#endif /* __ASSEMBLY__ */
> -#endif /* __KERNEL__ */
> -#endif /* _ASM_POWERPC_SCOM_H */
> +#endif /* _SCOM_H */
> diff --git a/arch/powerpc/sysdev/Kconfig b/arch/powerpc/sysdev/Kconfig
> index e0dbec780fe9..7808d279ff1d 100644
> --- a/arch/powerpc/sysdev/Kconfig
> +++ b/arch/powerpc/sysdev/Kconfig
> @@ -28,13 +28,6 @@ config PPC_MSI_BITMAP
>   source "arch/powerpc/sysdev/xics/Kconfig"
>   source "arch/powerpc/sysdev/xive/Kconfig"
>   
> -config PPC_SCOM
> -	bool
> -
> -config SCOM_DEBUGFS
> -	bool "Expose SCOM controllers via debugfs"
> -	depends on PPC_SCOM && DEBUG_FS
> -
>   config GE_FPGA
>   	bool
>   
> diff --git a/arch/powerpc/sysdev/Makefile b/arch/powerpc/sysdev/Makefile
> index aaf23283ba0c..35d52d1d2fc0 100644
> --- a/arch/powerpc/sysdev/Makefile
> +++ b/arch/powerpc/sysdev/Makefile
> @@ -51,8 +51,6 @@ ifdef CONFIG_SUSPEND
>   obj-$(CONFIG_PPC_BOOK3S_32)	+= 6xx-suspend.o
>   endif
>   
> -obj-$(CONFIG_PPC_SCOM)		+= scom.o
> -
>   obj-$(CONFIG_PPC_EARLY_DEBUG_MEMCONS)	+= udbg_memcons.o
>   
>   obj-$(CONFIG_PPC_XICS)		+= xics/
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

