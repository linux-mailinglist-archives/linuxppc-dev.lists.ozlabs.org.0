Return-Path: <linuxppc-dev+bounces-2232-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E18D99D3C1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 17:45:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XS1lF1Q4Sz3bb2;
	Tue, 15 Oct 2024 02:45:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728920713;
	cv=none; b=L/EBbaLhxuSut/gPcZgLPcFX/pUd0CxMbI7MrtRFsuhOJ2xNI5R6AnrnajdkaGYltzE60LId2lgKf3zGkByRFfgPAhZ+C0Df5rTIHLjzQBDv/oJIEIzA+GBkN9AVNdcJ+FKpYyfSaWmh0NJamMvOb6HWcGJelb3SBpOeb5YhhkIESEfaoO10d2GB46nhD6rfmvm3FGWjrTzl/fTExOdMEXBp0nPusjsETbzdkjDThMDskd2OgIepbY/aNKNSe31svx8h0hdaJj+9l7g3W/G7c6sR0hslfPfuDPhv0Va/cJLGosO/ejNb9ppmQLIKcxttOWKJw46YzS9g2lqXx6niAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728920713; c=relaxed/relaxed;
	bh=zhilbwk025Hm6Yq3Ujqd/OsZJFHt3rNwZyaibOZaryU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M+p1Q5UF4VrcoW3JGef52/pCYJnL9LWb9bCbiiKbFVt2iYSke5BMU17YAzrvOsYQ+nJcbp/CgeoHsPSFxhPLP7eFXdBJUxwUf77SRlAn0ttEGsPQ4x3dGOdwVMGQrQ8Egy3wWitaOOSvjEt+swsHd5DS8lTP8ntwu762Jy0o/t3FG+J3sPjUBhwSCJzZRq1LEToJe7t/9mRzMMjP+22+cyJNaDmU6hYJKziEGAmLB4+jWOnQkV0l4EDKk5cm5kNoC2JcLIkkdTh7C9I3m6iAJ5A0m1dxAOuAlKI1xD7+4CvfUlDmnfKawV9y/bw6CmdFOPTwTAsBdmoaKLbzUlqynQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dddT2yXV; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dddT2yXV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XS1lC6ZMvz30gn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 02:45:11 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EFJPLQ032427;
	Mon, 14 Oct 2024 15:44:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=z
	hilbwk025Hm6Yq3Ujqd/OsZJFHt3rNwZyaibOZaryU=; b=dddT2yXV5dDbNlrcS
	yaVtud5F0nTN2IHW4kTRqsbnQnNsUIETM/zQALo3Dcm57pzMHNsWTeBATu/9Z5+6
	HRvHDrfdwuBZgXmyyy997Wshm5x1CoD8xSAmE0sUOepf5qmv7DemA6avUfmUFg5s
	7IIUPL2aVif9XDUIu2FQ840fYFbuYa1n2psxnTXhsPhTZzmRIB7wtcigkVTnhwsB
	xXpHjL00w8g3tRg/MmfhE5NCEz5ZkAtkW9PYUSoCtZC9PbQHYb6dyoAL9c9mmXRK
	DYDGdYrPSfr3+q6NYKg/yNXC14iSHJ0VvU9rYH16SUlZy2HVMd+2BqaKkeyauH+H
	Wz/Ew==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4295ub83u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 15:44:13 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49EFiCE9029867;
	Mon, 14 Oct 2024 15:44:12 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4295ub83ty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 15:44:12 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49EFXi1H005377;
	Mon, 14 Oct 2024 15:44:11 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4285nhy245-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 15:44:11 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49EFiAAG41025992
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Oct 2024 15:44:10 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1114358045;
	Mon, 14 Oct 2024 15:44:10 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4BFCF58050;
	Mon, 14 Oct 2024 15:43:47 +0000 (GMT)
Received: from [9.43.6.16] (unknown [9.43.6.16])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 14 Oct 2024 15:43:46 +0000 (GMT)
Message-ID: <0dec796a-c09c-4519-849a-c1ed109aa096@linux.ibm.com>
Date: Mon, 14 Oct 2024 21:13:44 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] perf: Hoist perf_instruction_pointer() and
 perf_misc_flags()
To: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org
Cc: Oliver Upton <oliver.upton@linux.dev>,
        Sean Christopherson <seanjc@google.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Kan Liang <kan.liang@linux.intel.com>, Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev
 <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, linux-perf-users@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
References: <20240920174740.781614-1-coltonlewis@google.com>
 <20240920174740.781614-3-coltonlewis@google.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20240920174740.781614-3-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mGabIs1RiOyX8IMhjJtDVlL0LHhkIjDf
X-Proofpoint-GUID: QYhFbRnEribDfCSwDIKMVgJn9oKPMr7j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-14_10,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 clxscore=1011 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410140113
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 9/20/24 11:17 PM, Colton Lewis wrote:
> For clarity, rename the arch-specific definitions of these functions
> to perf_arch_* to denote they are arch-specifc. Define the
> generic-named functions in one place where they can call the
> arch-specific ones as needed.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>

For powerpc changes
Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>

> ---
>  arch/arm64/include/asm/perf_event.h          |  6 +++---
>  arch/arm64/kernel/perf_callchain.c           |  4 ++--
>  arch/powerpc/include/asm/perf_event_server.h |  6 +++---
>  arch/powerpc/perf/core-book3s.c              |  4 ++--
>  arch/s390/include/asm/perf_event.h           |  6 +++---
>  arch/s390/kernel/perf_event.c                |  4 ++--
>  arch/x86/events/core.c                       |  4 ++--
>  arch/x86/include/asm/perf_event.h            | 10 +++++-----
>  include/linux/perf_event.h                   |  9 ++++++---
>  kernel/events/core.c                         | 10 ++++++++++
>  10 files changed, 38 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/perf_event.h b/arch/arm64/include/asm/perf_event.h
> index eb7071c9eb34..31a5584ed423 100644
> --- a/arch/arm64/include/asm/perf_event.h
> +++ b/arch/arm64/include/asm/perf_event.h
> @@ -11,9 +11,9 @@
>  
>  #ifdef CONFIG_PERF_EVENTS
>  struct pt_regs;
> -extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
> -extern unsigned long perf_misc_flags(struct pt_regs *regs);
> -#define perf_misc_flags(regs)	perf_misc_flags(regs)
> +extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
> +extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
> +#define perf_arch_misc_flags(regs)	perf_misc_flags(regs)
>  #define perf_arch_bpf_user_pt_regs(regs) &regs->user_regs
>  #endif
>  
> diff --git a/arch/arm64/kernel/perf_callchain.c b/arch/arm64/kernel/perf_callchain.c
> index e8ed5673f481..01a9d08fc009 100644
> --- a/arch/arm64/kernel/perf_callchain.c
> +++ b/arch/arm64/kernel/perf_callchain.c
> @@ -39,7 +39,7 @@ void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
>  	arch_stack_walk(callchain_trace, entry, current, regs);
>  }
>  
> -unsigned long perf_instruction_pointer(struct pt_regs *regs)
> +unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
>  {
>  	if (perf_guest_state())
>  		return perf_guest_get_ip();
> @@ -47,7 +47,7 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
>  	return instruction_pointer(regs);
>  }
>  
> -unsigned long perf_misc_flags(struct pt_regs *regs)
> +unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>  {
>  	unsigned int guest_state = perf_guest_state();
>  	int misc = 0;
> diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
> index 5995614e9062..af0f46e2373b 100644
> --- a/arch/powerpc/include/asm/perf_event_server.h
> +++ b/arch/powerpc/include/asm/perf_event_server.h
> @@ -102,8 +102,8 @@ struct power_pmu {
>  int __init register_power_pmu(struct power_pmu *pmu);
>  
>  struct pt_regs;
> -extern unsigned long perf_misc_flags(struct pt_regs *regs);
> -extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
> +extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
> +extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
>  extern unsigned long int read_bhrb(int n);
>  
>  /*
> @@ -111,7 +111,7 @@ extern unsigned long int read_bhrb(int n);
>   * if we have hardware PMU support.
>   */
>  #ifdef CONFIG_PPC_PERF_CTRS
> -#define perf_misc_flags(regs)	perf_misc_flags(regs)
> +#define perf_arch_misc_flags(regs)	perf_arch_misc_flags(regs)
>  #endif
>  
>  /*
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index 42867469752d..dc01aa604cc1 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -2332,7 +2332,7 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
>   * Called from generic code to get the misc flags (i.e. processor mode)
>   * for an event_id.
>   */
> -unsigned long perf_misc_flags(struct pt_regs *regs)
> +unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>  {
>  	u32 flags = perf_get_misc_flags(regs);
>  
> @@ -2346,7 +2346,7 @@ unsigned long perf_misc_flags(struct pt_regs *regs)
>   * Called from generic code to get the instruction pointer
>   * for an event_id.
>   */
> -unsigned long perf_instruction_pointer(struct pt_regs *regs)
> +unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
>  {
>  	unsigned long siar = mfspr(SPRN_SIAR);
>  
> diff --git a/arch/s390/include/asm/perf_event.h b/arch/s390/include/asm/perf_event.h
> index 9917e2717b2b..f6c7b611a212 100644
> --- a/arch/s390/include/asm/perf_event.h
> +++ b/arch/s390/include/asm/perf_event.h
> @@ -37,9 +37,9 @@ extern ssize_t cpumf_events_sysfs_show(struct device *dev,
>  
>  /* Perf callbacks */
>  struct pt_regs;
> -extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
> -extern unsigned long perf_misc_flags(struct pt_regs *regs);
> -#define perf_misc_flags(regs) perf_misc_flags(regs)
> +extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
> +extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
> +#define perf_arch_misc_flags(regs) perf_arch_misc_flags(regs)
>  #define perf_arch_bpf_user_pt_regs(regs) &regs->user_regs
>  
>  /* Perf pt_regs extension for sample-data-entry indicators */
> diff --git a/arch/s390/kernel/perf_event.c b/arch/s390/kernel/perf_event.c
> index 5fff629b1a89..f9000ab49f4a 100644
> --- a/arch/s390/kernel/perf_event.c
> +++ b/arch/s390/kernel/perf_event.c
> @@ -57,7 +57,7 @@ static unsigned long instruction_pointer_guest(struct pt_regs *regs)
>  	return sie_block(regs)->gpsw.addr;
>  }
>  
> -unsigned long perf_instruction_pointer(struct pt_regs *regs)
> +unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
>  {
>  	return is_in_guest(regs) ? instruction_pointer_guest(regs)
>  				 : instruction_pointer(regs);
> @@ -84,7 +84,7 @@ static unsigned long perf_misc_flags_sf(struct pt_regs *regs)
>  	return flags;
>  }
>  
> -unsigned long perf_misc_flags(struct pt_regs *regs)
> +unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>  {
>  	/* Check if the cpum_sf PMU has created the pt_regs structure.
>  	 * In this case, perf misc flags can be easily extracted.  Otherwise,
> diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
> index be01823b1bb4..760ad067527c 100644
> --- a/arch/x86/events/core.c
> +++ b/arch/x86/events/core.c
> @@ -2940,7 +2940,7 @@ static unsigned long code_segment_base(struct pt_regs *regs)
>  	return 0;
>  }
>  
> -unsigned long perf_instruction_pointer(struct pt_regs *regs)
> +unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
>  {
>  	if (perf_guest_state())
>  		return perf_guest_get_ip();
> @@ -2948,7 +2948,7 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
>  	return regs->ip + code_segment_base(regs);
>  }
>  
> -unsigned long perf_misc_flags(struct pt_regs *regs)
> +unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>  {
>  	unsigned int guest_state = perf_guest_state();
>  	int misc = 0;
> diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
> index 91b73571412f..feb87bf3d2e9 100644
> --- a/arch/x86/include/asm/perf_event.h
> +++ b/arch/x86/include/asm/perf_event.h
> @@ -536,15 +536,15 @@ struct x86_perf_regs {
>  	u64		*xmm_regs;
>  };
>  
> -extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
> -extern unsigned long perf_misc_flags(struct pt_regs *regs);
> -#define perf_misc_flags(regs)	perf_misc_flags(regs)
> +extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
> +extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
> +#define perf_arch_misc_flags(regs)	perf_arch_misc_flags(regs)
>  
>  #include <asm/stacktrace.h>
>  
>  /*
> - * We abuse bit 3 from flags to pass exact information, see perf_misc_flags
> - * and the comment with PERF_EFLAGS_EXACT.
> + * We abuse bit 3 from flags to pass exact information, see
> + * perf_arch_misc_flags() and the comment with PERF_EFLAGS_EXACT.
>   */
>  #define perf_arch_fetch_caller_regs(regs, __ip)		{	\
>  	(regs)->ip = (__ip);					\
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 1a8942277dda..d061e327ad54 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -1633,10 +1633,13 @@ extern void perf_tp_event(u16 event_type, u64 count, void *record,
>  			  struct task_struct *task);
>  extern void perf_bp_event(struct perf_event *event, void *data);
>  
> -#ifndef perf_misc_flags
> -# define perf_misc_flags(regs) \
> +extern unsigned long perf_misc_flags(struct pt_regs *regs);
> +extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
> +
> +#ifndef perf_arch_misc_flags
> +# define perf_arch_misc_flags(regs) \
>  		(user_mode(regs) ? PERF_RECORD_MISC_USER : PERF_RECORD_MISC_KERNEL)
> -# define perf_instruction_pointer(regs)	instruction_pointer(regs)
> +# define perf_arch_instruction_pointer(regs)	instruction_pointer(regs)
>  #endif
>  #ifndef perf_arch_bpf_user_pt_regs
>  # define perf_arch_bpf_user_pt_regs(regs) regs
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 8a6c6bbcd658..eeabbf791a8c 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -6921,6 +6921,16 @@ void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
>  EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
>  #endif
>  
> +unsigned long perf_misc_flags(struct pt_regs *regs)
> +{
> +	return perf_arch_misc_flags(regs);
> +}
> +
> +unsigned long perf_instruction_pointer(struct pt_regs *regs)
> +{
> +	return perf_arch_instruction_pointer(regs);
> +}
> +
>  static void
>  perf_output_sample_regs(struct perf_output_handle *handle,
>  			struct pt_regs *regs, u64 mask)


