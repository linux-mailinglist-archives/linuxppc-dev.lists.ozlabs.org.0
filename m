Return-Path: <linuxppc-dev+bounces-5856-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E68A284E1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2025 08:20:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yns7t11qHz2yNs;
	Wed,  5 Feb 2025 18:20:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738740009;
	cv=none; b=Y9VwsDdT2wtKbJ3mB9NdYM6pYejnRP2tR6pYUMVLg/bNpxOw2xkul+la7ykGuHE8IV3iiVS0K4+BJpGISFM/40dGnw5xOkhmy+jwCtRUgbgC+slovPr/tnIP+QmCB4PGPcsA1en0jgpnAttE2q2OkQw5EFja7Tx9dbR6dHoRtjBRR+GLjI3RAqDdB8OPVDof4rgFV3aBMC6wGxfqRd2DLRMzmTeXGuNBdQzr11mRdnpa+YRTMb+FFmrToazzctIqN/Q3BxuFoRZ5tn6w69x2Ofmc657BF/VQ25wppC5SWevhIO4TPIN+fPbzzCMk3oNbex7ZD0Ippd/bfSt9K5Myig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738740009; c=relaxed/relaxed;
	bh=SqD3gEzs0soKnfFkN3O3KDq24+SbrvOddfxqWu34NfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ebGgasz7Y7C1wu18yYRdHWSSwEnrwA8NZPvDkGxmrMI6P8Pwt6ECnkYuFcO4JPJKOitm4+gDv5zrtTDfHIoImWs5qPC6besHaScKjPhYyZeAb8XK4fzHfdKWWdVmROwpFnJf+lo9YGoiQMkmysPPClhm5rFE2LzWgmzvrllxjWSlzByPdH4I/EyVtmODwWfHf7OugDT1RD1u3587pj2THuVhuPoqMKNWgqfO7zBLwxTZCGxCb/7tvZ9uPx2XB+yCo2CPDJjeIQkVJBGm+RMcCWx4+McqFkwm4nN6gsuOasTxakRb2OlAxuvlX2PDkRQe0ebNlFm3sDZ2Mr/jQWVA0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yns7p5xGVz2yHL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2025 18:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YnrRj3MVVz9sS7;
	Wed,  5 Feb 2025 07:48:49 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id puRhBqOAeMVL; Wed,  5 Feb 2025 07:48:49 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YnrQz089Jz9sPd;
	Wed,  5 Feb 2025 07:48:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E763E8B765;
	Wed,  5 Feb 2025 07:48:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Pe9u4pJlBqwz; Wed,  5 Feb 2025 07:48:10 +0100 (CET)
Received: from [10.25.207.138] (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5EDA48B763;
	Wed,  5 Feb 2025 07:48:10 +0100 (CET)
Message-ID: <cc9f0470-830b-471a-ac8d-33ba2e89dc8c@csgroup.eu>
Date: Wed, 5 Feb 2025 07:48:09 +0100
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
Subject: Re: [PATCH v3 5/9] powerpc: Use preempt_model_str().
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 Ben Segall <bsegall@google.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>, Mel Gorman <mgorman@suse.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Will Deacon <will@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
References: <20250203141632.440554-1-bigeasy@linutronix.de>
 <20250203141632.440554-6-bigeasy@linutronix.de>
 <65c6f60d-bb52-48bd-a02c-87ffd2a915d4@csgroup.eu>
 <20250203160103.9DikC9FJ@linutronix.de>
 <51999b8e-61c0-48b7-b744-c83d39e7f311@csgroup.eu>
 <20250204082223.6iNyq_KR@linutronix.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250204082223.6iNyq_KR@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 04/02/2025 à 09:22, Sebastian Andrzej Siewior a écrit :
> Use preempt_model_str() instead of manually conducting the preemption
> model. Use pr_emerg() instead of printk() to pass a loglevel.
> 
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Naveen N Rao <naveen@kernel.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
> v2…v3:
>    - Use printk() instead of pr_emerg() to remain consistent with the
>      other invocations in terms of printing context.
> 
>   arch/powerpc/kernel/traps.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index edf5cabe5dfdb..d6d77d92b3358 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -263,10 +263,10 @@ static int __die(const char *str, struct pt_regs *regs, long err)
>   {
>   	printk("Oops: %s, sig: %ld [#%d]\n", str, err, ++die_counter);
>   
> -	printk("%s PAGE_SIZE=%luK%s%s%s%s%s%s %s\n",
> +	printk("%s PAGE_SIZE=%luK%s %s %s%s%s%s %s\n",
>   	       IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
>   	       PAGE_SIZE / 1024, get_mmu_str(),
> -	       IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",
> +	       preempt_model_str(),
>   	       IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
>   	       IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=" __stringify(NR_CPUS)) : "",
>   	       debug_pagealloc_enabled() ? " DEBUG_PAGEALLOC" : "",


