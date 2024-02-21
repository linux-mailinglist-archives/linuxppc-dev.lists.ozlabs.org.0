Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5935F85E495
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 18:31:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vq1c/uTz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg3GL1rfRz3dVS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 04:31:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vq1c/uTz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg3FW2KsZz3cS3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 04:30:22 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41LHQErZ018984;
	Wed, 21 Feb 2024 17:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ssDlj8Gj906RYJ+kd7oHUcLMb8QUhPVR1jtt/Kk46L0=;
 b=Vq1c/uTzgV94liau2prJfYP3wX3LLcqlfNu4V4iDZSGwWMOxReQAZOU6EP3ae7swxkNo
 ZBUONDmTYaq9aczD+0IvfuyuhoHePSP+T1ikLrEdHa7Iz1ieGl+VbZy9Sk4dn1WxxrJV
 ak2SWFp7NB9qUSi4VKGc/FurNKZVjQQXlukC4vbiM8lq++nVTnfWh9GP20kbU3cg9Km2
 QuWAQTp107chup3qGIkNguPIMpt4b3D1OlQDY6RRPEqXGe3DiGhqyZvwmDgy70bjto3t
 J1JxZw4adxZO4iMzU7La/qrzj2nodgJhn++K2ZfU+XMo+/tcZ20/LcFjZlfA5MTUoMPe AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wdmjc1ypq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 17:30:03 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41LHQCCx018881;
	Wed, 21 Feb 2024 17:30:02 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wdmjc1ynu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 17:30:02 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41LGpAjb003596;
	Wed, 21 Feb 2024 17:30:01 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wb74trwc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 17:30:01 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41LHTw9Q27918916
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Feb 2024 17:30:00 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E387B20040;
	Wed, 21 Feb 2024 17:29:57 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CAA8D20043;
	Wed, 21 Feb 2024 17:29:49 +0000 (GMT)
Received: from [9.61.61.120] (unknown [9.61.61.120])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Feb 2024 17:29:49 +0000 (GMT)
Message-ID: <e1bd53c6-ad9a-46d5-9f49-ecdd64d98f61@linux.ibm.com>
Date: Wed, 21 Feb 2024 22:59:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] kexec: split crashkernel reservation code out
 from crash_core.c
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
References: <20240119145241.769622-1-bhe@redhat.com>
 <20240119145241.769622-2-bhe@redhat.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20240119145241.769622-2-bhe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1X7jDKhl1zUKRy2B_adMLzM9iC8HO1cV
X-Proofpoint-ORIG-GUID: Uw2D97QjE83VJR5woF4jbJ6EWAOoQuw_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-21_04,2024-02-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 mlxscore=0 clxscore=1011 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402210135
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
Cc: linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, piliu@redhat.com, linux-sh@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-mips@vger.kernel.org, ebiederm@xmission.com, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, hbathini@linux.ibm.com, viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Baoquan,

Thank you for reorganizing the kexec and kdump code with a well-defined
configuration structure.

While reviewing the patch series, I noticed a few typos.

On 19/01/24 20:22, Baoquan He wrote:
> Both kdump and fa_dump of ppc rely on crashkernel reservation. Move the
> relevant codes into separate files:
> crash_reserve.c, include/linux/crash_reserve.h.
>
> And also add config item CRASH_RESERVE to control its enabling of the
> codes. And update config items which has relationship with crashkernel
> reservation.
>
> And also change ifdeffery from CONFIG_CRASH_CORE to CONFIG_CRASH_RESERVE
> when those scopes are only crashkernel reservation related.
>
> And also rename arch/XXX/include/asm/{crash_core.h => crash_reserve.h}
> on arm64, x86 and risc-v because those architectures' crash_core.h
> is only related to crashkernel reservation.
>
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>   arch/arm64/Kconfig                            |   2 +-
>   .../asm/{crash_core.h => crash_reserve.h}     |   4 +-
>   arch/powerpc/Kconfig                          |   1 +
>   arch/powerpc/mm/nohash/kaslr_booke.c          |   4 +-
>   arch/riscv/Kconfig                            |   2 +-
>   .../asm/{crash_core.h => crash_reserve.h}     |   4 +-
>   arch/x86/Kconfig                              |   2 +-
>   .../asm/{crash_core.h => crash_reserve.h}     |   6 +-
>   include/linux/crash_core.h                    |  40 --
>   include/linux/crash_reserve.h                 |  48 ++
>   include/linux/kexec.h                         |   1 +
>   kernel/Kconfig.kexec                          |   5 +-
>   kernel/Makefile                               |   1 +
>   kernel/crash_core.c                           | 438 -----------------
>   kernel/crash_reserve.c                        | 464 ++++++++++++++++++
>   15 files changed, 531 insertions(+), 491 deletions(-)
>   rename arch/arm64/include/asm/{crash_core.h => crash_reserve.h} (81%)
>   rename arch/riscv/include/asm/{crash_core.h => crash_reserve.h} (78%)
>   rename arch/x86/include/asm/{crash_core.h => crash_reserve.h} (92%)
>   create mode 100644 include/linux/crash_reserve.h
>   create mode 100644 kernel/crash_reserve.c
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index ea01a2c43efa..d96bc3c67ec6 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1501,7 +1501,7 @@ config ARCH_SUPPORTS_CRASH_DUMP
>   	def_bool y
>   
>   config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
> -	def_bool CRASH_CORE
> +	def_bool CRASH_RESERVE
>   
>   config TRANS_TABLE
>   	def_bool y
> diff --git a/arch/arm64/include/asm/crash_core.h b/arch/arm64/include/asm/crash_reserve.h
> similarity index 81%
> rename from arch/arm64/include/asm/crash_core.h
> rename to arch/arm64/include/asm/crash_reserve.h
> index 9f5c8d339f44..4afe027a4e7b 100644
> --- a/arch/arm64/include/asm/crash_core.h
> +++ b/arch/arm64/include/asm/crash_reserve.h
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
> -#ifndef _ARM64_CRASH_CORE_H
> -#define _ARM64_CRASH_CORE_H
> +#ifndef _ARM64_CRASH_RESERVE_H
> +#define _ARM64_CRASH_RESERVE_H
>   
>   /* Current arm64 boot protocol requires 2MB alignment */
>   #define CRASH_ALIGN                     SZ_2M
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 414b978b8010..6aeab95f0edd 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -691,6 +691,7 @@ config FA_DUMP
>   	bool "Firmware-assisted dump"
>   	depends on PPC64 && (PPC_RTAS || PPC_POWERNV)
>   	select CRASH_CORE
> +	select CRASH_RESERVE
>   	select CRASH_DUMP
>   	help
>   	  A robust mechanism to get reliable kernel crash dump with
> diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/nohash/kaslr_booke.c
> index b4f2786a7d2b..cdff129abb14 100644
> --- a/arch/powerpc/mm/nohash/kaslr_booke.c
> +++ b/arch/powerpc/mm/nohash/kaslr_booke.c
> @@ -13,7 +13,7 @@
>   #include <linux/delay.h>
>   #include <linux/memblock.h>
>   #include <linux/libfdt.h>
> -#include <linux/crash_core.h>
> +#include <linux/crash_reserve.h>
>   #include <linux/of.h>
>   #include <linux/of_fdt.h>
>   #include <asm/cacheflush.h>
> @@ -173,7 +173,7 @@ static __init bool overlaps_region(const void *fdt, u32 start,
>   
>   static void __init get_crash_kernel(void *fdt, unsigned long size)
>   {
> -#ifdef CONFIG_CRASH_CORE
> +#ifdef CONFIG_CRASH_RESERVE
>   	unsigned long long crash_size, crash_base;
>   	int ret;
>   
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index b549499eb363..37a438c23deb 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -712,7 +712,7 @@ config ARCH_SUPPORTS_CRASH_DUMP
>   	def_bool y
>   
>   config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
> -	def_bool CRASH_CORE
> +	def_bool CRASH_RESERVE
>   
>   config COMPAT
>   	bool "Kernel support for 32-bit U-mode"
> diff --git a/arch/riscv/include/asm/crash_core.h b/arch/riscv/include/asm/crash_reserve.h
> similarity index 78%
> rename from arch/riscv/include/asm/crash_core.h
> rename to arch/riscv/include/asm/crash_reserve.h
> index e1874b23feaf..013962e63587 100644
> --- a/arch/riscv/include/asm/crash_core.h
> +++ b/arch/riscv/include/asm/crash_reserve.h
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
> -#ifndef _RISCV_CRASH_CORE_H
> -#define _RISCV_CRASH_CORE_H
> +#ifndef _RISCV_CRASH_RESERVE_H
> +#define _RISCV_CRASH_RESERVE_H
>   
>   #define CRASH_ALIGN			PMD_SIZE
>   
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 5edec175b9bf..71417c5b228c 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -2106,7 +2106,7 @@ config ARCH_SUPPORTS_CRASH_HOTPLUG
>   	def_bool y
>   
>   config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
> -	def_bool CRASH_CORE
> +	def_bool CRASH_RESEERVE

%s/CRASH_RESEERVE/CRASH_RESERVE? - Sourabh
