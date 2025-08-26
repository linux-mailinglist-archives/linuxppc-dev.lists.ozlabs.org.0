Return-Path: <linuxppc-dev+bounces-11340-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3645B37211
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 20:20:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBGDj08VYz3dHC;
	Wed, 27 Aug 2025 04:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756232436;
	cv=none; b=EKihEs6O3HNFVXwNwHZ2AVfQ7f7OUqcGrfziV/xaeOoNRQ4Gcr8H3i38nMj6whbdj4yQ0LYHqo+JX0aMfKGO42X97/GwN8400qTM+QOJk15RmkyYgL7Pkxw2snKjUGrnSBmU8HdPPQA0w36qzhn/gMVzS6B2K8SxOrwZd91BfQ/hJOZ9Y/dwPBoxvPVO9gTHIQHLu5P795MEhlVLqf/clwa8E2K2/AhRojGATHYzRT84pS+Jm+6Qk1sCa3MsS6pXYPdphpNbmoZltyjrWdy6/iElDcK639SlTPejWGV2jxTYQuVn4Hnm3KLWn1qTHZyNecXoBGzKNYdpXt3luiw7VA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756232436; c=relaxed/relaxed;
	bh=4KEH2u08nM+KrNB8eUu36NxHIacVWyf4V1Cuy0P/MTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IpqezaCYvxoQSlj+1cYv5UWM3kI5xNtfRqClGI/C2vj5Cr8L0v5itdlnpQuBuQQScyi4zfaXAMKpd7xkDH/4BG30b3MpcQKFcVlDua++obDWXwy2zLrttWTlW4IBero6STy0aOT7XS9v3DBpvgl+X1jjH8sbFpzgfh9q/Q7bM0OJqx4to+dRq6WbpYm+RYvovFtlPfpF8kilmXe9054pJ6tctzJ6I4g1deKUowZPd5jW5A/YF366YvbYyIYLWdXklSePlG9g9f6NB8Wijxuf4bIZ7Aq7xl5VsmYQTEh8i0VGp8iwNWJBARwfKBYroGhdqBnMTsUrIxReGobvqZ7dxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBGDh1Bxnz3dGt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 04:20:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c9wLb6DMvz9sSL;
	Tue, 26 Aug 2025 06:54:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NrvWrUS7BScP; Tue, 26 Aug 2025 06:54:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c9wLb4cWgz9sSK;
	Tue, 26 Aug 2025 06:54:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 75E4E8B764;
	Tue, 26 Aug 2025 06:54:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id F2eraKjHbKgo; Tue, 26 Aug 2025 06:54:31 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 93E148B763;
	Tue, 26 Aug 2025 06:54:29 +0200 (CEST)
Message-ID: <1c8392b8-ea7b-48ef-8932-02f41e1233a3@csgroup.eu>
Date: Tue, 26 Aug 2025 06:54:29 +0200
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
Subject: Re: [PATCH v7 3/8] powerpc/smp: Export cpu_coregroup_mask()
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
 <20250826041319.1284-4-kprateek.nayak@amd.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250826041319.1284-4-kprateek.nayak@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 26/08/2025 à 06:13, K Prateek Nayak a écrit :
> Deine cpu_coregroup_mask() to export the per-cpu cpu_corgrp_map when
> coregroups are supported(). When has_coregroup_support() returns false,
> cpu_coregroup_mask() returns the mask used by the PKG domain.
> 
> Since this will only be used after CONFIG_SCHED_MC is added for PowerPC,
> no functional changes are intended at this point.
> 
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
>   arch/powerpc/include/asm/smp.h | 2 ++
>   arch/powerpc/kernel/smp.c      | 8 ++++++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
> index b77927ccb0ab..86de4d0dd0aa 100644
> --- a/arch/powerpc/include/asm/smp.h
> +++ b/arch/powerpc/include/asm/smp.h
> @@ -148,6 +148,8 @@ static inline const struct cpumask *cpu_smt_mask(int cpu)
>   }
>   #endif /* CONFIG_SCHED_SMT */
>   
> +extern const struct cpumask *cpu_coregroup_mask(int cpu);

'extern' keyword is pointless for function prototypes, remove it.

See report from checkpatch:

$ ./scripts/checkpatch.pl --strict -g a064a30c52a5
CHECK: extern prototypes should be avoided in .h files
#28: FILE: arch/powerpc/include/asm/smp.h:151:
+extern const struct cpumask *cpu_coregroup_mask(int cpu);

total: 0 errors, 0 warnings, 1 checks, 22 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or 
--fix-inplace.

Commit a064a30c52a5 ("powerpc/smp: Export cpu_coregroup_mask()") has 
style problems, please review.

NOTE: If any of the errors are false positives, please report
       them to the maintainer, see CHECKPATCH in MAINTAINERS.



> +
>   /* Since OpenPIC has only 4 IPIs, we use slightly different message numbers.
>    *
>    * Make sure this matches openpic_request_IPIs in open_pic.c, or what shows up
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 4f48262658cc..e623f2864dc4 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1059,6 +1059,14 @@ static bool has_coregroup_support(void)
>   	return coregroup_enabled;
>   }
>   
> +const struct cpumask *cpu_coregroup_mask(int cpu)
> +{
> +	if (has_coregroup_support())
> +		return per_cpu(cpu_corgrp_map, cpu);
> +
> +	return cpu_node_mask(cpu);
> +}
> +
>   static const struct cpumask *cpu_mc_mask(struct sched_domain_topology_level *tl, int cpu)
>   {
>   	return cpu_corgrp_mask(cpu);


