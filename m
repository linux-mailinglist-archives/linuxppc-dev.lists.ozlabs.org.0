Return-Path: <linuxppc-dev+bounces-11339-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8511B37139
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 19:20:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBDvV6gXjz3dW4;
	Wed, 27 Aug 2025 03:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756228838;
	cv=none; b=Eg+LAA2+5oLowdnic9ot02zMszTvDj07iJW9uFAqinWA/C+Ijz7mHoh+1SGlkPm9DP4khG53US1S5YwllIWQK5nec7TyDq/kNcBPQH2s2ixecnGUuZqIurMZjAs81bCogD0sb4xGuWCnmx5IwVS3zPeEu8g9f4J3vnnTNdQ2tBtKi2zYvJyWCitK6j87OarKYlSWZk5wWCzZEf6KwzcFai0Wrbf+GSMTr8YSu71zP+MIOuuYtmUatB13LKbYirDzwdppREDLG14v5PHmSwqXPgUaWRxY5RdMhc473Xd2/v27wGWfAhmDDHQY3//A9A2axY6xeuObwFIbP7wkquhQxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756228838; c=relaxed/relaxed;
	bh=kLAoIWxfXXWp18UmYU7Vgd4EKnPZ48N8OZ8j2I0nv7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kB3xMLdG2us676HjUfBgAfrSHYHEMaRKK1pQJrQnDk+AKz6MQFS8f7DFjwxFAVcT5OB/Xs6qp14pe3ltdBi06wm+CwObnuF7sRzJWojKv00z4tOaoSyNm4vVAVFAsT+MMcpHUVO7BnEYNq3XA3fVzh7QX4lXGK4NHV1YryzFrEOx/Xb/9ejP33AQYqfIBse2Nfrho56D5aRSy3nTrQ6l47HLsbx3yXSdadHrjYYa/MdDAGmN/JgOcIS+Qt1eDj5flwrf9YYka0fl4rWdo5xH9IfQBORUsuUwLpJf+uz0kVYMSfzOAuz/bY9zQ8RpS1EtufJnzZBJnY+ri4OBw2mHKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBDvT6X9Vz3dW3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 03:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c9wm35hHkz9sSW;
	Tue, 26 Aug 2025 07:13:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L3zqoWmt2kyq; Tue, 26 Aug 2025 07:13:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c9wm34Kgtz9sSV;
	Tue, 26 Aug 2025 07:13:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 755518B764;
	Tue, 26 Aug 2025 07:13:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id db8ZhuQxPbOU; Tue, 26 Aug 2025 07:13:07 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 760E08B763;
	Tue, 26 Aug 2025 07:13:05 +0200 (CEST)
Message-ID: <d2ccc708-ab0e-4d25-8fc9-f989cdd0ae55@csgroup.eu>
Date: Tue, 26 Aug 2025 07:13:05 +0200
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
Subject: Re: [PATCH v7 5/8] sched/topology: Unify tl_smt_mask() across core
 and all arch
To: K Prateek Nayak <kprateek.nayak@amd.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
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
 Andrea Righi <arighi@nvidia.com>, Yicong Yang <yangyicong@hisilicon.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Tim Chen <tim.c.chen@linux.intel.com>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>
References: <20250826041319.1284-1-kprateek.nayak@amd.com>
 <20250826041319.1284-6-kprateek.nayak@amd.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250826041319.1284-6-kprateek.nayak@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 26/08/2025 à 06:13, K Prateek Nayak a écrit :
> Unify the tl_smt_mask() wrapper around cpu_smt_mask() across core, x86,
> ppc, and s390.
> 
> On s390, include/linux/topology.c defines an explicit cpu_smt_mask()
> wrapper around topology_sibling_cpumask() when cpu_smt_mask() is not
> defined by the arch/ bits and topology_sibling_cpumask() on s390 returns
> &cpu_topology[cpu].thread_mask.
> 
> No functional changes intended.
> 
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
>   arch/powerpc/kernel/smp.c      | 5 -----
>   arch/s390/kernel/topology.c    | 8 +-------
>   arch/x86/kernel/smpboot.c      | 5 -----
>   include/linux/sched/topology.h | 8 +++++++-
>   kernel/sched/topology.c        | 7 -------
>   5 files changed, 8 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 7f79b853b221..c58ddf84fe63 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1038,11 +1038,6 @@ static const struct cpumask *smallcore_smt_mask(struct sched_domain_topology_lev
>   {
>   	return cpu_smallcore_mask(cpu);
>   }
> -
> -static const struct cpumask *tl_smt_mask(struct sched_domain_topology_level *tl, int cpu)
> -{
> -	return cpu_smt_mask(cpu);
> -}
>   #endif
>   
>   static struct cpumask *cpu_corgrp_mask(int cpu)
> diff --git a/arch/s390/kernel/topology.c b/arch/s390/kernel/topology.c
> index 5129e3ffa7f5..c88eda847309 100644
> --- a/arch/s390/kernel/topology.c
> +++ b/arch/s390/kernel/topology.c
> @@ -509,12 +509,6 @@ int topology_cpu_init(struct cpu *cpu)
>   	return rc;
>   }
>   
> -static const struct cpumask *cpu_thread_mask(struct sched_domain_topology_level *tl, int cpu)
> -{
> -	return &cpu_topology[cpu].thread_mask;
> -}
> -
> -
>   const struct cpumask *cpu_coregroup_mask(int cpu)
>   {
>   	return &cpu_topology[cpu].core_mask;
> @@ -541,7 +535,7 @@ static const struct cpumask *cpu_pkg_mask(struct sched_domain_topology_level *tl
>   }
>   
>   static struct sched_domain_topology_level s390_topology[] = {
> -	SDTL_INIT(cpu_thread_mask, cpu_smt_flags, SMT),
> +	SDTL_INIT(tl_smt_mask, cpu_smt_flags, SMT),
>   	SDTL_INIT(cpu_mc_mask, cpu_core_flags, MC),
>   	SDTL_INIT(cpu_book_mask, NULL, BOOK),
>   	SDTL_INIT(cpu_drawer_mask, NULL, DRAWER),
> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> index 4cd3d69741cf..03ff6270966a 100644
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -463,11 +463,6 @@ static int x86_core_flags(void)
>   {
>   	return cpu_core_flags() | x86_sched_itmt_flags();
>   }
> -
> -static const struct cpumask *tl_smt_mask(struct sched_domain_topology_level *tl, int cpu)
> -{
> -	return cpu_smt_mask(cpu);
> -}
>   #endif
>   
>   #ifdef CONFIG_SCHED_CLUSTER
> diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
> index 602508130c8a..d75fbb7d9667 100644
> --- a/include/linux/sched/topology.h
> +++ b/include/linux/sched/topology.h
> @@ -37,7 +37,13 @@ static inline int cpu_smt_flags(void)
>   {
>   	return SD_SHARE_CPUCAPACITY | SD_SHARE_LLC;
>   }
> -#endif
> +
> +static const __maybe_unused
> +struct cpumask *tl_smt_mask(struct sched_domain_topology_level *tl, int cpu)

__maybe_unused hides the dust under the carpet.

Leave the function in kernel/sched/topology.c and make it non-static 
with a prototype in linux/sched/topology.h

> +{
> +	return cpu_smt_mask(cpu);
> +}
> +#endif /* CONFIG_SCHED_SMT */
>   
>   #ifdef CONFIG_SCHED_CLUSTER
>   static inline int cpu_cluster_flags(void)
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index dfc754e0668c..92165fe56a2d 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -1724,13 +1724,6 @@ sd_init(struct sched_domain_topology_level *tl,
>   	return sd;
>   }
>   
> -#ifdef CONFIG_SCHED_SMT
> -static const struct cpumask *tl_smt_mask(struct sched_domain_topology_level *tl, int cpu)
> -{
> -	return cpu_smt_mask(cpu);
> -}
> -#endif
> -
>   #ifdef CONFIG_SCHED_CLUSTER
>   static const struct cpumask *tl_cls_mask(struct sched_domain_topology_level *tl, int cpu)
>   {


