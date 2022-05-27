Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 939FE536837
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 22:48:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8xhZ2wMjz3bmL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 06:47:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JAV1pG1Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JAV1pG1Z;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8xgs2q9Jz3blg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 06:47:20 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24RJscPF005148
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 20:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=+hwCDVfX6CX7JPJrQdRs2mCHUuYl/WnJE//Aj344bK4=;
 b=JAV1pG1ZSwAq+ABs4Wwt+36UiPDnvwHQhwpy3Ow2GLoixkL2o39EoB3nijhr4ExuQsvy
 CgY6mj5tbU+ZOVxR03z+A41XRm7gsGm8M6tyerj3kjBmNCDa24ni72E7FNZ+69+2YQVg
 R+tE4BxrKvTLx8IE2MNkx3LsqPfdcxxorRCCGdWm2tRMnmXrfed0cW7UXzv70YwyYrci
 R6Ep/ASf3I9oCR8XSSh0mcJGENQA7w5APMG8J7ahos0z6zlz1q9kQTL31yqmxTJ81cWa
 L1b9Zp/+Y3kYZgIWKeWv8K0DlOPSBeK4OYhk/uXTG5NZ4CeLnuRBObuTtsyDVTy6fGoY Lw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gb57c0rp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 20:47:17 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24RKXnVW020890
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 20:47:17 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gb57c0rp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 May 2022 20:47:17 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24RKjPXX030219;
	Fri, 27 May 2022 20:47:16 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
	by ppma01wdc.us.ibm.com with ESMTP id 3gaas1hnhd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 May 2022 20:47:16 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24RKlGjR36897120
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 May 2022 20:47:16 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 63928AC05E;
	Fri, 27 May 2022 20:47:16 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CEF55AC059;
	Fri, 27 May 2022 20:47:15 +0000 (GMT)
Received: from localhost (unknown [9.77.139.3])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
	Fri, 27 May 2022 20:47:15 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/4] powerpc/pseries: Implement
 CONFIG_PARAVIRT_TIME_ACCOUNTING
In-Reply-To: <20220518133935.3878954-4-npiggin@gmail.com>
References: <20220518133935.3878954-1-npiggin@gmail.com>
 <20220518133935.3878954-4-npiggin@gmail.com>
Date: Fri, 27 May 2022 17:47:14 -0300
Message-ID: <87czfyln3h.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JAGFbHAfugeKwgXXkxCBvFiMXglnCzEU
X-Proofpoint-ORIG-GUID: kWs4FbcUCbK22tNTkK1Kk2m-ynjsZFwg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-27_06,2022-05-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205270099
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> CONFIG_VIRT_CPU_ACCOUNTING_GEN under pseries does not implement
> stolen time accounting. Implement it with the paravirt time
> accounting option.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  .../admin-guide/kernel-parameters.txt         |  6 +++---
>  arch/powerpc/include/asm/paravirt.h           | 12 ++++++++++++
>  arch/powerpc/platforms/pseries/Kconfig        |  8 ++++++++
>  arch/powerpc/platforms/pseries/lpar.c         | 11 +++++++++++
>  arch/powerpc/platforms/pseries/setup.c        | 19 +++++++++++++++++++
>  5 files changed, 53 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 3f1cc5e317ed..855fc7b02261 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3604,9 +3604,9 @@
>  			[X86,PV_OPS] Disable paravirtualized VMware scheduler
>  			clock and use the default one.
>
> -	no-steal-acc	[X86,PV_OPS,ARM64] Disable paravirtualized steal time
> -			accounting. steal time is computed, but won't
> -			influence scheduler behaviour
> +	no-steal-acc	[X86,PV_OPS,ARM64,PPC/PSERIES] Disable paravirtualized
> +			steal time accounting. steal time is computed, but
> +			won't influence scheduler behaviour
>
>  	nolapic		[X86-32,APIC] Do not enable or use the local APIC.
>
> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
> index eb7df559ae74..f5ba1a3c41f8 100644
> --- a/arch/powerpc/include/asm/paravirt.h
> +++ b/arch/powerpc/include/asm/paravirt.h
> @@ -21,6 +21,18 @@ static inline bool is_shared_processor(void)
>  	return static_branch_unlikely(&shared_processor);
>  }
>
> +#ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
> +extern struct static_key paravirt_steal_enabled;
> +extern struct static_key paravirt_steal_rq_enabled;
> +
> +u64 pseries_paravirt_steal_clock(int cpu);
> +
> +static inline u64 paravirt_steal_clock(int cpu)
> +{
> +	return pseries_paravirt_steal_clock(cpu);
> +}
> +#endif
> +
>  /* If bit 0 is set, the cpu has been ceded, conferred, or preempted */
>  static inline u32 yield_count_of(int cpu)
>  {
> diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
> index f7fd91d153a4..d4306ebdca5e 100644
> --- a/arch/powerpc/platforms/pseries/Kconfig
> +++ b/arch/powerpc/platforms/pseries/Kconfig
> @@ -24,13 +24,21 @@ config PPC_PSERIES
>  	select SWIOTLB
>  	default y
>
> +config PARAVIRT
> +	bool
> +

In file included from ../kernel/sched/build_utility.c:53:
../kernel/sched/sched.h:87:11: fatal error: asm/paravirt_api_clock.h: No such file or directory
   87 | # include <asm/paravirt_api_clock.h>

$ find . -name paravirt_api_clock.h
./arch/arm64/include/asm/paravirt_api_clock.h
./arch/x86/include/asm/paravirt_api_clock.h
./arch/arm/include/asm/paravirt_api_clock.h

>  config PARAVIRT_SPINLOCKS
>  	bool
>
> +config PARAVIRT_TIME_ACCOUNTING
> +	select PARAVIRT
> +	bool
> +
>  config PPC_SPLPAR
>  	bool "Support for shared-processor logical partitions"
>  	depends on PPC_PSERIES
>  	select PARAVIRT_SPINLOCKS if PPC_QUEUED_SPINLOCKS
> +	select PARAVIRT_TIME_ACCOUNTING if VIRT_CPU_ACCOUNTING_GEN
>  	default y
>  	help
>  	  Enabling this option will make the kernel run more efficiently
