Return-Path: <linuxppc-dev+bounces-4478-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B93419FC96F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Dec 2024 08:19:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YJg4Q2rvnz306x;
	Thu, 26 Dec 2024 18:19:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735197590;
	cv=none; b=bdLuE8eezz+SjP5Q/Kff+ocMBloPfiRMA7IMvD5uCR34UnCFAIOet1qB3CoJKR/YnMkxagKmKodDBB7NnF19Y8F9RLfn5CdWwVGIBFaQf1Nfx5m8dafnMy/g0827YwOa8IyZ13DM44w5JFuXIyNO8g9gukNN/INyUbdX18uj5x0kzuueOJZZ1cWDk9BEnnesCazWMuCkIlBE+O2diFLJdTyI84tbdDlr728QPJ5xZKzpidN8/EPsPn8xQllpAz5/0stT2fdC28WCmcU1uhW1Y9jUmXOBfvtTUcolmxYHH+uej5g5YyISxamJKcYLyCkw3WSKc+UlsmYs9S+LBlchdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735197590; c=relaxed/relaxed;
	bh=PsGmik0b3kAu5BJK4vHKPRzb/9fZM/R7E7deKoSUc4E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=k0PXbVNkwkEE4U+zYfAh9aS3X1idE/FBLTdUC4lb0YXOhar2J0UDj71hdWE6X6q1O1rHwKOarzccGX9TNY7Cmy3Q1M8flfXCV8bvthVGOR98gyVnf0Mn0UI74/7SUwwHRSjq5vaUexfIDiEVfJgI8FaeT2/7eMg1IJsboh7T5aaCULVUnV93pkCz1LILo5kYUGZJLHkmAUPTIJprBYcxVkli7yg7I3YeoCXjlnmFiJjsX3WOyeWpqAXaKeMJPPObUd+Kdo+SrNb5Ip41AYbEBr5fUbipB2aDj2EVZO7eGHHUsiCfu+sSXVh/UkqzRU1n7n+1KzUnaO158XSyd/hszA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GUeoftKs; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GUeoftKs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YJg4P10Jrz306J
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Dec 2024 18:19:48 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BPLHQrr028180;
	Thu, 26 Dec 2024 07:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=PsGmik
	0b3kAu5BJK4vHKPRzb/9fZM/R7E7deKoSUc4E=; b=GUeoftKsaDjs059dTxGviK
	8J7A2DvjZzcQAQ0LSrGeptA8Q/BywaNR5qmqLB4lZor+O3Sr1m964ZHmaFfcMryI
	41LJS6RiOIAI664s81tk+ceQyx69X72TDpNFhQ2JKVQppzcksVHAeZVAncD3S07j
	O5rUfyURSRiP+Z/pjfR1OLE7/zzoVV4BPDqqdm27tgZFS7MW7gES3QpWpwwTTIQk
	ntCuLm7uXG0ecNckLgHM9rzAe6Vyc8MnpqwnFQlEi0iNQN15nk3yfEjZ9+YuIRq5
	KCqAunFjXLfouJ5ui1PctNg3I89+QCZIJQU34gLjmbzVjjNJkDKl8kJfQ9MbpCpw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43rkh4jdyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 07:18:33 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ5xwku002065;
	Thu, 26 Dec 2024 07:18:32 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43pa7k0vrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 07:18:32 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BQ7IUHV56754506
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Dec 2024 07:18:30 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD6CC2004D;
	Thu, 26 Dec 2024 07:18:30 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8046E20040;
	Thu, 26 Dec 2024 07:18:25 +0000 (GMT)
Received: from [9.124.219.96] (unknown [9.124.219.96])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 26 Dec 2024 07:18:25 +0000 (GMT)
Message-ID: <718d69e0-f145-4393-b571-80e8a0a372f6@linux.ibm.com>
Date: Thu, 26 Dec 2024 12:48:24 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [PATCH v10 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
To: Yicong Yang <yangyicong@huawei.com>
Cc: linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
        linux-kernel@vger.kernel.org, morten.rasmussen@arm.com,
        msuchanek@suse.de, gregkh@linuxfoundation.org, rafael@kernel.org,
        jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
        linuxarm@huawei.com, yangyicong@hisilicon.com, xuwei5@huawei.com,
        guohanjun@huawei.com, catalin.marinas@arm.com, will@kernel.org,
        sudeep.holla@arm.com, tglx@linutronix.de, peterz@infradead.org,
        mpe@ellerman.id.au, linux-arm-kernel@lists.infradead.org,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        pierre.gondois@arm.com, dietmar.eggemann@arm.com
References: <20241220075313.51502-1-yangyicong@huawei.com>
 <20241220075313.51502-2-yangyicong@huawei.com>
Content-Language: en-US
In-Reply-To: <20241220075313.51502-2-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9d6E4UnUrTpmLuaA2EsuZsqPL4YakM-9
X-Proofpoint-GUID: 9d6E4UnUrTpmLuaA2EsuZsqPL4YakM-9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 clxscore=1011 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260060
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 12/20/24 13:23, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Currently if architectures want to support HOTPLUG_SMT they need to
> provide a topology_is_primary_thread() telling the framework which
> thread in the SMT cannot offline. However arm64 doesn't have a
> restriction on which thread in the SMT cannot offline, a simplest
> choice is that just make 1st thread as the "primary" thread. So
> just make this as the default implementation in the framework and
> let architectures like x86 that have special primary thread to
> override this function (which they've already done).
> 
> There's no need to provide a stub function if !CONFIG_SMP or
> !CONFIG_HOTPLUG_SMP. In such case the testing CPU is already

s/CONFIG_HOTPLUG_SMP/CONFIG_HOTPLUG_SMT

> the 1st CPU in the SMT so it's always the primary thread.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
> As questioned in v9 [1] whether this works on architectures not using
> CONFIG_GENERIC_ARCH_TOPOLOGY, hacked on LoongArch VM and this also works.
> Architectures should use this on their own situation.
> [1] https://lore.kernel.org/linux-arm-kernel/427bd639-33c3-47e4-9e83-68c428eb1a7d@arm.com/
> 

sorry to ask this question this late in the series.

I am curious to know why not just add the arch specific 
topology_is_primary_thread? current infra would handle that right?

is there any other arch that is going to enable this soon? or the 
rationale is to add the generic function so that archs that use generic 
topology it is just a kconfig change in case they want to add the support?

> [root@localhost smt]# uname -m
> loongarch64
> [root@localhost smt]# pwd
> /sys/devices/system/cpu/smt
> [root@localhost smt]# cat ../possible
> 0-3
> [root@localhost smt]# cat ../online
> 0-3
> [root@localhost smt]# cat control
> on
> [root@localhost smt]# echo off > control
> [root@localhost smt]# cat control
> off
> [root@localhost smt]# cat ../online
> 0,2
> [root@localhost smt]# echo on > control
> [root@localhost smt]# cat control
> on
> [root@localhost smt]# cat ../online
> 0-3
> 
>   arch/powerpc/include/asm/topology.h |  1 +
>   arch/x86/include/asm/topology.h     |  2 +-
>   include/linux/topology.h            | 22 ++++++++++++++++++++++
>   3 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
> index 16bacfe8c7a2..da15b5efe807 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -152,6 +152,7 @@ static inline bool topology_is_primary_thread(unsigned int cpu)
>   {
>   	return cpu == cpu_first_thread_sibling(cpu);
>   }
> +#define topology_is_primary_thread topology_is_primary_thread
>   
>   static inline bool topology_smt_thread_allowed(unsigned int cpu)
>   {
> diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
> index fd41103ad342..faa0d6334ea4 100644
> --- a/arch/x86/include/asm/topology.h
> +++ b/arch/x86/include/asm/topology.h
> @@ -228,11 +228,11 @@ static inline bool topology_is_primary_thread(unsigned int cpu)
>   {
>   	return cpumask_test_cpu(cpu, cpu_primary_thread_mask);
>   }
> +#define topology_is_primary_thread topology_is_primary_thread
>   
>   #else /* CONFIG_SMP */
>   static inline int topology_phys_to_logical_pkg(unsigned int pkg) { return 0; }
>   static inline int topology_max_smt_threads(void) { return 1; }
> -static inline bool topology_is_primary_thread(unsigned int cpu) { return true; }
>   static inline unsigned int topology_amd_nodes_per_pkg(void) { return 1; }
>   #endif /* !CONFIG_SMP */
>   
> diff --git a/include/linux/topology.h b/include/linux/topology.h
> index 52f5850730b3..b3aba443c4eb 100644
> --- a/include/linux/topology.h
> +++ b/include/linux/topology.h
> @@ -240,6 +240,28 @@ static inline const struct cpumask *cpu_smt_mask(int cpu)
>   }
>   #endif
>   
> +#ifndef topology_is_primary_thread
> +
> +#define topology_is_primary_thread topology_is_primary_thread
> +
> +static inline bool topology_is_primary_thread(unsigned int cpu)
> +{
> +	/*
> +	 * On SMT hotplug the primary thread of the SMT won't be disabled.
> +	 * Architectures do have a special primary thread (e.g. x86) need
> +	 * to override this function. Otherwise just make the first thread
> +	 * in the SMT as the primary thread.
> +	 *
> +	 * The sibling cpumask of an offline CPU contains always the CPU
> +	 * itself for architectures using CONFIG_GENERIC_ARCH_TOPOLOGY.
> +	 * Other architectures should use this depend on their own
> +	 * situation.
> +	 */
> +	return cpu == cpumask_first(topology_sibling_cpumask(cpu));
> +}
> +
> +#endif
> +
>   static inline const struct cpumask *cpu_cpu_mask(int cpu)
>   {
>   	return cpumask_of_node(cpu_to_node(cpu));


