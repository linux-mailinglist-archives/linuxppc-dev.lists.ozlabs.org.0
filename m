Return-Path: <linuxppc-dev+bounces-11299-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ABAB35448
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 08:20:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9yFx2v9vz3dKq;
	Tue, 26 Aug 2025 16:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756189237;
	cv=none; b=KzfWAaS1n0SX/H58seIxtmJQ/YeechU8I/2calx2yXmMZnuG/0S/PlBQJSQtpViLDesNL7xMG9+BW61nDKXytDtO6bPZT4hOSQI0xQT97MMyOi9F+PTN5fkqr2XyacuHuaoWErbskXr7dPWXJ+b2aGYi7/wr/AunP77exJBf8pE3FxjSPcnVhMOJ8rmV+4icKed0fShXsZEitoYNtr/oiwMlLkxizwtcST6nr/6T90Kr8RUIdWYtElVQPuJGsD150S4EJEl49NQePtnBCcf1Gtd2uRlJtLBgmc79R+CBOLVSPAee8k28epUPJcZr/kCmxHRe9gviDPfnDsV0IlYDvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756189237; c=relaxed/relaxed;
	bh=av5G/K7WalZakJE6AxJgVD7Y0vIdm4CmWgYsSqrkrAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JdTPxeoPeRkzjEM7+STPsVAfDofOqcK8vz5PK1w6c5VvWopa7+PP/nyGSuT2GRnouuFpKvwyEAzuXBB8yD3GoRoYnE6o4aVKKV/d0v6rDsKGTMkEUy9ZVzSMke0g1Jb6p3C4tgXJFsEr5RmlRmnxpsE8JNRPH+y4D1evOgrtfaIvfTZWl21Ui+O+Iyk8Ql6HrTxM/Nf4Lf3ynSD1Z1AmaPePuSpGDnXheXR+gTOUzfaFA8jgboUfQPFWN3pCX3/JEQ2hE9L2d1jqO5CvuP66aYt/zeSzIAObifGW9tjkXbJrZALUq/RSd2E1rZENULDyDwyq9seLp9PA0VRxMGT1Mg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9yFw5MMtz3dJ9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 16:20:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c9wDs5fW7z9sSH;
	Tue, 26 Aug 2025 06:49:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9WAMtYgIKbQJ; Tue, 26 Aug 2025 06:49:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c9wDs4Dc9z9sS8;
	Tue, 26 Aug 2025 06:49:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6B3918B764;
	Tue, 26 Aug 2025 06:49:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id cTXo-oIxDOpC; Tue, 26 Aug 2025 06:49:33 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8219A8B763;
	Tue, 26 Aug 2025 06:49:31 +0200 (CEST)
Message-ID: <609a980b-cbe3-442b-a492-91722870b156@csgroup.eu>
Date: Tue, 26 Aug 2025 06:49:29 +0200
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
 <20250826041319.1284-5-kprateek.nayak@amd.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250826041319.1284-5-kprateek.nayak@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 26/08/2025 à 06:13, K Prateek Nayak a écrit :
> PowerPC enables the MC scheduling domain by default on systems with
> coregroup support without having a SCHED_MC config in Kconfig.
> 
> The scheduler uses CONFIG_SCHED_MC to introduce the MC domain in the
> default topology (core) and to optimize the default CPU selection
> routine (sched-ext).
> 
> Introduce CONFIG_SCHED_MC for powerpc and note that it should be
> preferably enabled given the current default behavior. This also ensures
> PowerPC is tested during future developments that come to depend on
> CONFIG_SCHED_MC.
> 
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
>   arch/powerpc/Kconfig           | 9 +++++++++
>   arch/powerpc/include/asm/smp.h | 2 ++
>   arch/powerpc/kernel/smp.c      | 4 ++++
>   3 files changed, 15 insertions(+)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 93402a1d9c9f..e954ab3f635f 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -971,6 +971,15 @@ config SCHED_SMT
>   	  when dealing with POWER5 cpus at a cost of slightly increased
>   	  overhead in some places. If unsure say N here.
>   
> +config SCHED_MC
> +	bool "Multi-Core Cache (MC) scheduler support"
> +	depends on PPC64 && SMP
> +	default y
> +	help
> +	  MC scheduler support improves the CPU scheduler's decision making
> +	  when dealing with POWER systems that contain multiple Last Level
> +	  Cache instances on the same socket. If unsure say Y here.
> +

You shouldn't duplicate CONFIG_SCHED_MC in every architecture, instead 
you should define a CONFIG_ARCH_HAS_SCHED_MC in arch/Kconfig that gets 
selected by architectures then have CONFIG_SCHED_MC defined in 
init/Kconfig or kernel/Kconfig or so.

>   config PPC_DENORMALISATION
>   	bool "PowerPC denormalisation exception handling"
>   	depends on PPC_BOOK3S_64
> diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
> index 86de4d0dd0aa..9a320d96e891 100644
> --- a/arch/powerpc/include/asm/smp.h
> +++ b/arch/powerpc/include/asm/smp.h
> @@ -148,7 +148,9 @@ static inline const struct cpumask *cpu_smt_mask(int cpu)
>   }
>   #endif /* CONFIG_SCHED_SMT */
>   
> +#ifdef CONFIG_SCHED_MC
>   extern const struct cpumask *cpu_coregroup_mask(int cpu);
> +#endif

Why do you need this ifdef ? Leaving it outside #ifdef allows you to do 
constructs like:

	if (IS_ENABLED(CONFIG_SCHED_MC))
		cpu_coregroup_mask(cpu);

Otherwise you'll need to ensure all calls to cpu_coregroup_mask() are 
also inside #ifdefs, which is not the recommended way nowadays.

>   
>   /* Since OpenPIC has only 4 IPIs, we use slightly different message numbers.
>    *
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index e623f2864dc4..7f79b853b221 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1059,6 +1059,7 @@ static bool has_coregroup_support(void)
>   	return coregroup_enabled;
>   }
>   
> +#ifdef CONFIG_SCHED_MC
>   const struct cpumask *cpu_coregroup_mask(int cpu)
>   {
>   	if (has_coregroup_support())
> @@ -1071,6 +1072,7 @@ static const struct cpumask *cpu_mc_mask(struct sched_domain_topology_level *tl,
>   {
>   	return cpu_corgrp_mask(cpu);
>   }
> +#endif
>   
>   static const struct cpumask *cpu_pkg_mask(struct sched_domain_topology_level *tl, int cpu)
>   {
> @@ -1729,10 +1731,12 @@ static void __init build_sched_topology(void)
>   			SDTL_INIT(shared_cache_mask, powerpc_shared_cache_flags, CACHE);
>   	}
>   
> +#ifdef CONFIG_SCHED_MC

As I said above, define the function prototype at all time in smp.h and 
use IS_ENABLED(CONFIG_SCHED_MC) here instead of a #ifdef

>   	if (has_coregroup_support()) {
>   		powerpc_topology[i++] =
>   			SDTL_INIT(cpu_mc_mask, powerpc_shared_proc_flags, MC);
>   	}
> +#endif
>   
>   	powerpc_topology[i++] = SDTL_INIT(cpu_pkg_mask, powerpc_shared_proc_flags, PKG);
>   


