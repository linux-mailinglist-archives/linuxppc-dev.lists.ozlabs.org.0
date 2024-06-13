Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0CA906983
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 11:59:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Eaez8/Kh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0HvC5l0dz3bt2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 19:59:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Eaez8/Kh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=anjalik@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0HtV5ZSfz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 19:58:58 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45D6thG7032539;
	Thu, 13 Jun 2024 09:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	NX5lqMzd73Wf/iScgdKHGy4thD9g/Th8Qnam2M7cSAY=; b=Eaez8/KhrBZy5dIC
	X5oQXBnGT2QIqu6t9aieoimz8c8ARs8NkY2mbJr7pTd49VpFL/j1e0ooj4fL3pWX
	Ek3C0I4d1F7zKNLXCeAqemJXdKFMrzUUKf9IiJjwRwAeGAA8W+WpCtwL9BAMayQ+
	XXelbjgyOdjU10SymMwxtoW7vML3g7dR44fp5o6ilh9sxcgfBu35pVDewVzzM2uN
	5PAw4g8EuIehwgCS+dHfMBD1uHAIoOA631UlgTHA/7TYYGJJ/E6ThozSPxBZp6hB
	ul1LYaUapRh9W7CMCWwTlPUkXC+wv/JMa+H6Mm8JhEEDD0SO0/15XIQWpw5iCKDN
	3vQ8Cg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yqppr14xq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 09:58:52 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45D9ZnaO003881;
	Thu, 13 Jun 2024 09:58:51 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yn2mq651x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 09:58:51 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45D9wjNC42205444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Jun 2024 09:58:48 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFAC120067;
	Thu, 13 Jun 2024 09:58:45 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2405320063;
	Thu, 13 Jun 2024 09:58:44 +0000 (GMT)
Received: from [9.43.110.171] (unknown [9.43.110.171])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 13 Jun 2024 09:58:43 +0000 (GMT)
Message-ID: <aacde694-d3fe-4667-a67a-0472b76d94c9@linux.ibm.com>
Date: Thu, 13 Jun 2024 15:28:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] powerpc/perf: Set cpumode flags using sample address
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
References: <20240528040356.2722275-1-anjalik@linux.ibm.com>
Content-Language: en-US
From: Anjali K <anjalik@linux.ibm.com>
In-Reply-To: <20240528040356.2722275-1-anjalik@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5OVoDIJwulQy_U8MT1Cga53Pnf_oQ7N-
X-Proofpoint-GUID: 5OVoDIJwulQy_U8MT1Cga53Pnf_oQ7N-
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_02,2024-06-13_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406130070
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,
Can you please share your review comments on this patch when you get a chance?

On 28/05/24 09:33, Anjali K wrote:
> Currently in some cases, when the sampled instruction address register
> latches to a specific address during sampling, the privilege bits captured
> in the sampled event register are incorrect.
> For example, a snippet from the perf report on a power10 system is:
> Overhead  Address             Command       Shared Object      Symbol
> ........  ..................  ............  .................  .......................
>      2.41%  0x7fff9f94a02c      null_syscall  [unknown]          [k] 0x00007fff9f94a02c
>      2.20%  0x7fff9f94a02c      null_syscall  libc.so.6          [.] syscall
>
> perf_get_misc_flags() function looks at the privilege bits to return the
> corresponding flags to be used for the address symbol and these privilege
> bit details are read from the sampled event register. In the above snippet,
> address "0x00007fff9f94a02c" is shown as "k" (kernel) due to the incorrect
> privilege bits captured in the sampled event register.
> To address this case check whether the sampled address is in the kernel
> area. Since this is specific to the latest platform, a new pmu flag is
> added called "PPMU_P10" and is used to contain the proposed fix.
> PPMU_P10_DD1 marked events are also included under PPMU_P10, hence
> remove the code specific to PPMU_P10_DD1 marked events.
>
> Signed-off-by: Anjali K <anjalik@linux.ibm.com>
> ---
> Changelog:
> v2->v3:
> Addressed review comments from Michael Ellerman to change the commit 
> message and update the values of PPMU_P10 and PPMU_HAS_ATTR_CONFIG1 flags
> to move the PPMU_P10 flag near the PPMU_P10_DD1 flag
> Rebased on linux 6.10-rc1
> v2 patch link:
> https://lore.kernel.org/linuxppc-dev/20240517094607.422166-1-anjalik@linux.ibm.com/
>
> v1->v2:
> Fixed the build warning reported by the kernel test bot 
> Added a new flag PPMU_P10 and used it instead of PPMU_ARCH_31 to restrict
> the changes to the current platform (Power10)
> v1 patch link:
> https://lore.kernel.org/linuxppc-dev/20240511075344.1393631-1-anjalik@linux.ibm.com/
>
>  arch/powerpc/include/asm/perf_event_server.h |  3 +-
>  arch/powerpc/perf/core-book3s.c              | 45 +++++++++-----------
>  arch/powerpc/perf/power10-pmu.c              |  3 +-
>  3 files changed, 23 insertions(+), 28 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
> index e2221d29fdf9..5995614e9062 100644
> --- a/arch/powerpc/include/asm/perf_event_server.h
> +++ b/arch/powerpc/include/asm/perf_event_server.h
> @@ -89,7 +89,8 @@ struct power_pmu {
>  #define PPMU_NO_SIAR		0x00000100 /* Do not use SIAR */
>  #define PPMU_ARCH_31		0x00000200 /* Has MMCR3, SIER2 and SIER3 */
>  #define PPMU_P10_DD1		0x00000400 /* Is power10 DD1 processor version */
> -#define PPMU_HAS_ATTR_CONFIG1	0x00000800 /* Using config1 attribute */
> +#define PPMU_P10		0x00000800 /* For power10 pmu */
> +#define PPMU_HAS_ATTR_CONFIG1	0x00001000 /* Using config1 attribute */
>  
>  /*
>   * Values for flags to get_alternatives()
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index 6b5f8a94e7d8..42867469752d 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -266,31 +266,12 @@ static inline u32 perf_flags_from_msr(struct pt_regs *regs)
>  static inline u32 perf_get_misc_flags(struct pt_regs *regs)
>  {
>  	bool use_siar = regs_use_siar(regs);
> -	unsigned long mmcra = regs->dsisr;
> -	int marked = mmcra & MMCRA_SAMPLE_ENABLE;
> +	unsigned long siar;
> +	unsigned long addr;
>  
>  	if (!use_siar)
>  		return perf_flags_from_msr(regs);
>  
> -	/*
> -	 * Check the address in SIAR to identify the
> -	 * privilege levels since the SIER[MSR_HV, MSR_PR]
> -	 * bits are not set for marked events in power10
> -	 * DD1.
> -	 */
> -	if (marked && (ppmu->flags & PPMU_P10_DD1)) {
> -		unsigned long siar = mfspr(SPRN_SIAR);
> -		if (siar) {
> -			if (is_kernel_addr(siar))
> -				return PERF_RECORD_MISC_KERNEL;
> -			return PERF_RECORD_MISC_USER;
> -		} else {
> -			if (is_kernel_addr(regs->nip))
> -				return PERF_RECORD_MISC_KERNEL;
> -			return PERF_RECORD_MISC_USER;
> -		}
> -	}
> -
>  	/*
>  	 * If we don't have flags in MMCRA, rather than using
>  	 * the MSR, we intuit the flags from the address in
> @@ -298,19 +279,31 @@ static inline u32 perf_get_misc_flags(struct pt_regs *regs)
>  	 * results
>  	 */
>  	if (ppmu->flags & PPMU_NO_SIPR) {
> -		unsigned long siar = mfspr(SPRN_SIAR);
> +		siar = mfspr(SPRN_SIAR);
>  		if (is_kernel_addr(siar))
>  			return PERF_RECORD_MISC_KERNEL;
>  		return PERF_RECORD_MISC_USER;
>  	}
>  
>  	/* PR has priority over HV, so order below is important */
> -	if (regs_sipr(regs))
> -		return PERF_RECORD_MISC_USER;
> -
> -	if (regs_sihv(regs) && (freeze_events_kernel != MMCR0_FCHV))
> +	if (regs_sipr(regs)) {
> +		if (!(ppmu->flags & PPMU_P10))
> +			return PERF_RECORD_MISC_USER;
> +	} else if (regs_sihv(regs) && (freeze_events_kernel != MMCR0_FCHV))
>  		return PERF_RECORD_MISC_HYPERVISOR;
>  
> +	/*
> +	 * Check the address in SIAR to identify the
> +	 * privilege levels since the SIER[MSR_HV, MSR_PR]
> +	 * bits are not set correctly in power10 sometimes
> +	 */
> +	if (ppmu->flags & PPMU_P10) {
> +		siar = mfspr(SPRN_SIAR);
> +		addr = siar ? siar : regs->nip;
> +		if (!is_kernel_addr(addr))
> +			return PERF_RECORD_MISC_USER;
> +	}
> +
>  	return PERF_RECORD_MISC_KERNEL;
>  }
>  
> diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
> index 62a68b6b2d4b..bb57b7cfe640 100644
> --- a/arch/powerpc/perf/power10-pmu.c
> +++ b/arch/powerpc/perf/power10-pmu.c
> @@ -593,7 +593,8 @@ static struct power_pmu power10_pmu = {
>  	.get_mem_weight		= isa207_get_mem_weight,
>  	.disable_pmc		= isa207_disable_pmc,
>  	.flags			= PPMU_HAS_SIER | PPMU_ARCH_207S |
> -				  PPMU_ARCH_31 | PPMU_HAS_ATTR_CONFIG1,
> +				  PPMU_ARCH_31 | PPMU_HAS_ATTR_CONFIG1 |
> +				  PPMU_P10,
>  	.n_generic		= ARRAY_SIZE(power10_generic_events),
>  	.generic_events		= power10_generic_events,
>  	.cache_events		= &power10_cache_events,
>
> base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
Thank you,
Anjali K
