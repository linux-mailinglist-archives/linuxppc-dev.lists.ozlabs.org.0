Return-Path: <linuxppc-dev+bounces-11428-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF29B3A27A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 16:45:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCPMl1lzvz2yGM;
	Fri, 29 Aug 2025 00:45:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756392339;
	cv=none; b=eV/L2CjmQ3D4SLBlArH376eCktyMbGgJdnnFsiuHGbg16sFha4ur4v5A40qtR/CGxhWYNjzwjvBBtbG0pRz++KzFDcF/d7GmGgs8DjZp9tRL+foNsGmSNFR9rEVFkzqpK2IKTdc5Q7WBayXg5m4Wx/sr+8Ld3c+gLKUbEQz7Li7PGIP9CunVc3TGt8L1I3iUo4yeiRzsJBvTeEEssscw8Ouz67RCW0ZxTbk+Pi+SDh6KagxdpVODuv85nnQyCVpU3gWtS34D5rRLtlXAAaC64P67S4GSgB3/6ttW42obEcbiACjVRoLafYP5rae3Iotsxvx8FJka9szOL2hQcwWYyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756392339; c=relaxed/relaxed;
	bh=l5ZeL/raDI0rhTchy0xy3EBGbgqzyJ/sBYXDHV6YFdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nM6pbJG6r+E2kGGEVRYTjglQrox6VEAm2s5sJu22VeEV2TR8MH0cgBRFipGxq1nsFnBq1Lp2IzcbCK2reo2s6MTiEeaGkiBNfaSpD7xUhZUKpD4NeZMPojyH9Ijk7Dessq7RbAjnRPJlNN6WXVdujghTe+vG41nbYZLuTwlV9cTAKuhwzzNWpy9L0bOpZndA9qMF/1e4pynqbZUn7fiFPmEoBEuSyUBhm9tXrUdXyhOVDQKoejH6SBUYCadXPC4JXgr4HXEFOeUaIpxJzS1fOwDkzVZwkm1P4natfVDkOKotgEfYI6r7FLoFNJZwj51fbHjisQwEtw/AGGlg6FFGNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UgzrXWnb; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UgzrXWnb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCPMk1vjQz2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 00:45:37 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S7YGTW012769;
	Thu, 28 Aug 2025 14:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=l5ZeL/
	raDI0rhTchy0xy3EBGbgqzyJ/sBYXDHV6YFdU=; b=UgzrXWnbQ+Bzy0bpVXkBnA
	78JlUpH+fnEQfP8B86RKMdkNxO+gUSY8Ro5B/mc95q9M/J9/8cYIdt5Pzomz2HaW
	Y/Cj2IXnOiboXKKa4tF7kXAlAdOwlf7um7UZok0ax2om8KiCuRb37e51JWBUrQd3
	wtbBKxRcmzZaxulNHc0t2cERVNSzaAPJa/GdSYdIYVqNiyVnq3QOD4H2Q1B9mDW+
	yXrinGpqsiYvQhLyZLS6SqAI9M5fxKqIBjGzyHQ2zwCAOHI6qjsCPljJseTuiHMy
	Swd92aqln21eHEsyYnMypnDtliEIni4iJNn5s11fyCeOuOAOmJ9uKkjZ7+1JXY1w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5hqa7wm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 14:44:08 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57SEDYA3028578;
	Thu, 28 Aug 2025 14:44:07 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5hqa7wf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 14:44:07 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57SDdTTg002531;
	Thu, 28 Aug 2025 14:44:06 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48qrypwdnu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 14:44:06 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57SEi2gh30867830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Aug 2025 14:44:02 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D7D620043;
	Thu, 28 Aug 2025 14:44:02 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A85F20040;
	Thu, 28 Aug 2025 14:43:52 +0000 (GMT)
Received: from [9.39.25.132] (unknown [9.39.25.132])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Aug 2025 14:43:51 +0000 (GMT)
Message-ID: <7137972e-bc7a-432c-94be-755ba9029d8c@linux.ibm.com>
Date: Thu, 28 Aug 2025 20:13:51 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/8] powerpc/smp: Introduce CONFIG_SCHED_MC to guard MC
 scheduling bits
To: Peter Zijlstra <peterz@infradead.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        thomas.weissschuh@linutronix.de, Li Chen <chenl311@chinatelecom.cn>,
        Bibo Mao <maobibo@loongson.cn>, Mete Durlu <meted@linux.ibm.com>,
        Tobias Huschle <huschle@linux.ibm.com>,
        Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
        Guo Weikang <guoweikang.kernel@gmail.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Brian Gerst <brgerst@gmail.com>,
        Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
        Swapnil Sapkal <swapnil.sapkal@amd.com>,
        "Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andrea Righi <arighi@nvidia.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
        Tim Chen <tim.c.chen@linux.intel.com>,
        Vinicius Costa Gomes <vinicius.gomes@intel.com>
References: <20250826041319.1284-1-kprateek.nayak@amd.com>
 <20250826041319.1284-5-kprateek.nayak@amd.com>
 <609a980b-cbe3-442b-a492-91722870b156@csgroup.eu>
 <20250826080706.GC3245006@noisy.programming.kicks-ass.net>
 <20250826094358.GG3245006@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20250826094358.GG3245006@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfXxHaUcEgiIopR
 w3SGssvF5+46GkuuW1kiijb+ksAP3fpVos2QKqS2bZNii0df7FMCvsrwHpQa+KBf2lAkp0NX3v2
 TcXxOjX5+1ms/PEw9khh30kCV2MVFXV3MAKKzKryiGwTlnyliOMkNZd7yaZz94+GPpCVp57rfVm
 +qRD5/1qQr2Ro6VAUCnAtQcHLulJPLoW0Sb+OfEz4rf7XTN1VhyR0mzc7LSG6wU14iWntemzG0s
 KC01BU+eJw/E2CHuuIqElAZyoDfS2Ms3JnotgCdTd9Yr7rWhqyHXSkKAXrN5Vo6GfJck8Dy2BAK
 hqv1xkHJJUzLoXLHMJrgELCH0D8nJGApFbI24c1hA0QjDFdol8hjkDI2SaQxdWJ+zVSp1ciraKw
 APfSYIPs
X-Proofpoint-ORIG-GUID: r3rzZYCoCt6eycWI1LlHixY6AiWUY6AU
X-Proofpoint-GUID: vE42g1xHqTSrMAwXyL2e0mrM5IIIoNhY
X-Authority-Analysis: v=2.4 cv=Ndbm13D4 c=1 sm=1 tr=0 ts=68b06b38 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=rIPao2PkHK7o8sxEuf0A:9
 a=_HYOEJHHcvG5C4SK:21 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


Hi Peter.

Looking at this,
https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?h=sched/core&id=9d710c5b2bb37cedf5f09ce988884fb5795e1a76

> 
> WDYT?
> 
> ---
>   Kconfig           |   38 ++++++++++++++++++++++++++++++++++++++
>   arm/Kconfig       |   18 ++----------------
>   arm64/Kconfig     |   26 +++-----------------------
>   loongarch/Kconfig |   19 ++-----------------
>   mips/Kconfig      |   16 ++--------------
>   parisc/Kconfig    |    9 +--------
>   powerpc/Kconfig   |   15 +++------------
>   riscv/Kconfig     |    9 +--------
>   s390/Kconfig      |    8 ++------
>   sparc/Kconfig     |   20 ++------------------
>   x86/Kconfig       |   27 ++++-----------------------
>   11 files changed, 60 insertions(+), 145 deletions(-)
> 
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -41,6 +41,44 @@ config HOTPLUG_SMT
>   config SMT_NUM_THREADS_DYNAMIC
>   	bool
>   
> +config ARCH_SUPPORTS_SCHED_SMT
> +	bool
> +
> +config ARCH_SUPPORTS_SCHED_CLUSTER
> +	bool
> +
> +config ARCH_SUPPORTS_SCHED_MC
> +	bool
> +
> +config SCHED_SMT
> +	bool "SMT (Hyperthreading) scheduler support"
> +	depends on ARCH_SUPPORTS_SCHED_SMT
> +	default y
> +	help
> +	  Improves the CPU scheduler's decision making when dealing with
> +	  MultiThreading at a cost of slightly increased overhead in some
> +	  places. If unsure say N here.
> +
> +config SCHED_CLUSTER
> +	bool "Cluster scheduler support"
> +	depends on ARCH_SUPPORTS_SCHED_CLUSTER
> +	default y
> +	help
> +	  Cluster scheduler support improves the CPU scheduler's decision
> +	  making when dealing with machines that have clusters of CPUs.
> +	  Cluster usually means a couple of CPUs which are placed closely
> +	  by sharing mid-level caches, last-level cache tags or internal
> +	  busses.
> +
> +config SCHED_MC
> +	bool "Multi-Core Cache (MC) scheduler support"
> +	depends on ARCH_SUPPORTS_SCHED_MC
> +	default y
> +	help
> +	  Multi-core scheduler support improves the CPU scheduler's decision
> +	  making when dealing with multi-core CPU chips at a cost of slightly
> +	  increased overhead in some places. If unsure say N here.
> +
>   # Selected by HOTPLUG_CORE_SYNC_DEAD or HOTPLUG_CORE_SYNC_FULL
>   config HOTPLUG_CORE_SYNC

...

> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -170,6 +170,9 @@ config PPC
>   	select ARCH_STACKWALK
>   	select ARCH_SUPPORTS_ATOMIC_RMW
>   	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC_BOOK3S || PPC_8xx
> +	select ARCH_SUPPORTS_SCHED_SMT		if PPC64 && SMP
> +	select ARCH_SUPPORTS_SCHED_MC		if PPC64 && SMP
> +	select SCHED_MC				if ARCH_SUPPORTS_SCHED_MC

Wondering if this SCHED_MC is necessary here? shouldn't it be set by arch/Kconfig?

nit: Also, can we have so they are still sorted?
	select ARCH_SUPPORTS_SCHED_MC		if PPC64 && SMP
	select ARCH_SUPPORTS_SCHED_SMT		if PPC64 && SMP

>   	select ARCH_USE_BUILTIN_BSWAP
>   	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
>   	select ARCH_USE_MEMTEST
> @@ -963,18 +966,6 @@ config PPC_PROT_SAO_LPAR
>   config PPC_COPRO_BASE
>   	bool
>   
> -config SCHED_SMT
> -	bool "SMT (Hyperthreading) scheduler support"
> -	depends on PPC64 && SMP
> -	help
> -	  SMT scheduler support improves the CPU scheduler's decision making
> -	  when dealing with POWER5 cpus at a cost of slightly increased
> -	  overhead in some places. If unsure say N here.
> -
> -config SCHED_MC
> -	def_bool y
> -	depends on PPC64 && SMP
> -
>   config PPC_DENORMALISATION
>   	bool "PowerPC denormalisation exception handling"
>   	depends on PPC_BOOK3S_64
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -72,6 +72,7 @@ config RISCV
>   	select ARCH_SUPPORTS_PER_VMA_LOCK if MMU
>   	select ARCH_SUPPORTS_RT
>   	select ARCH_SUPPORTS_SHADOW_CALL_STACK if HAVE_SHADOW_CALL_STACK
> +	select ARCH_SUPPORTS_SCHED_MC if SMP
>   	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
>   	select ARCH_USE_MEMTEST
>   	select ARCH_USE_QUEUED_RWLOCKS
> @@ -453,14 +454,6 @@ config SMP
>   
>   	  If you don't know what to do here, say N.
>   
> -config SCHED_MC
> -	bool "Multi-core scheduler support"
> -	depends on SMP
> -	help
> -	  Multi-core scheduler support improves the CPU scheduler's decision
> -	  making when dealing with multi-core CPU chips at a cost of slightly
> -	  increased overhead in some places. If unsure say N here.
> -
>   config NR_CPUS
>   	int "Maximum number of CPUs (2-512)"
>   	depends on SMP
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -547,15 +547,11 @@ config NODES_SHIFT
>   	depends on NUMA
>   	default "1"
>   
> -config SCHED_SMT
> -	def_bool n
> -
> -config SCHED_MC
> -	def_bool n
> -
>   config SCHED_TOPOLOGY
>   	def_bool y
>   	prompt "Topology scheduler support"
> +	select ARCH_SUPPORTS_SCHED_SMT
> +	select ARCH_SUPPORTS_SCHED_MC
>   	select SCHED_SMT
>   	select SCHED_MC
Same here. Above two are needed?

>   	help
> --- a/arch/sparc/Kconfig
> +++ b/arch/sparc/Kconfig
> @@ -110,6 +110,8 @@ config SPARC64
>   	select HAVE_SETUP_PER_CPU_AREA
>   	select NEED_PER_CPU_EMBED_FIRST_CHUNK
>   	select NEED_PER_CPU_PAGE_FIRST_CHUNK
> +	select ARCH_SUPPORTS_SCHED_SMT if SMP
> +	select ARCH_SUPPORTS_SCHED_MC  if SMP
>   
>   config ARCH_PROC_KCORE_TEXT
>   	def_bool y
> @@ -288,24 +290,6 @@ if SPARC64 || COMPILE_TEST
>   source "kernel/power/Kconfig"
>   endif
>   
> -config SCHED_SMT
> -	bool "SMT (Hyperthreading) scheduler support"
> -	depends on SPARC64 && SMP
> -	default y
> -	help
> -	  SMT scheduler support improves the CPU scheduler's decision making
> -	  when dealing with SPARC cpus at a cost of slightly increased overhead
> -	  in some places. If unsure say N here.
> -
> -config SCHED_MC
> -	bool "Multi-core scheduler support"
> -	depends on SPARC64 && SMP
> -	default y
> -	help
> -	  Multi-core scheduler support improves the CPU scheduler's decision
> -	  making when dealing with multi-core CPU chips at a cost of slightly
> -	  increased overhead in some places. If unsure say N here.
> -
>   config CMDLINE_BOOL
>   	bool "Default bootloader kernel arguments"
>   	depends on SPARC64
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -330,6 +330,10 @@ config X86
>   	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
>   	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE
>   	select ARCH_SUPPORTS_PT_RECLAIM		if X86_64
> +	select ARCH_SUPPORTS_SCHED_SMT		if SMP
> +	select SCHED_SMT			if SMP
Is this SCHED_SMT needed here?

> +	select ARCH_SUPPORTS_SCHED_CLUSTER	if SMP
> +	select ARCH_SUPPORTS_SCHED_MC		if SMP
>   
>   config INSTRUCTION_DECODER
>   	def_bool y
> @@ -1036,29 +1040,6 @@ config NR_CPUS
>   	  This is purely to save memory: each supported CPU adds about 8KB
>   	  to the kernel image.
>   
> -config SCHED_CLUSTER
> -	bool "Cluster scheduler support"
> -	depends on SMP
> -	default y
> -	help
> -	  Cluster scheduler support improves the CPU scheduler's decision
> -	  making when dealing with machines that have clusters of CPUs.
> -	  Cluster usually means a couple of CPUs which are placed closely
> -	  by sharing mid-level caches, last-level cache tags or internal
> -	  busses.
> -
> -config SCHED_SMT
> -	def_bool y if SMP
> -
> -config SCHED_MC
> -	def_bool y
> -	prompt "Multi-core scheduler support"
> -	depends on SMP
> -	help
> -	  Multi-core scheduler support improves the CPU scheduler's decision
> -	  making when dealing with multi-core CPU chips at a cost of slightly
> -	  increased overhead in some places. If unsure say N here.
> -
>   config SCHED_MC_PRIO
>   	bool "CPU core priorities scheduler support"
>   	depends on SCHED_MC

