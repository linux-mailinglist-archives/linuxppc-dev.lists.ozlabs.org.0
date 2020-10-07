Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8E3285FC7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 15:09:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5vmV59k6zDqNw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 00:08:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=cai@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=FMMNOY2d; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=FMMNOY2d; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5vhy2JzyzDqNF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 00:05:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602075951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fzzYwvnRkrY3q9cauoayqyN5TYt/xYOuYyfAOguTrUY=;
 b=FMMNOY2dGVuzqIWQEY3QPkQNB/BxtYqXsGkfLmECu2ucPuqRbO8JerlSpiLGJb6ClvThkz
 27nY3gZqI0y6cAn1NzXjLUZiB4BvWq4x+lmLUA5YSAfv3DWmZn7naVsw3Ra/PteH86cMDK
 MCK91JQzsedoc9nTh14BvpHiLgwaHRY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602075951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fzzYwvnRkrY3q9cauoayqyN5TYt/xYOuYyfAOguTrUY=;
 b=FMMNOY2dGVuzqIWQEY3QPkQNB/BxtYqXsGkfLmECu2ucPuqRbO8JerlSpiLGJb6ClvThkz
 27nY3gZqI0y6cAn1NzXjLUZiB4BvWq4x+lmLUA5YSAfv3DWmZn7naVsw3Ra/PteH86cMDK
 MCK91JQzsedoc9nTh14BvpHiLgwaHRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-xBoHtIPSM3a9S4XvbTk6nw-1; Wed, 07 Oct 2020 09:05:47 -0400
X-MC-Unique: xBoHtIPSM3a9S4XvbTk6nw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B98A108BD06;
 Wed,  7 Oct 2020 13:05:45 +0000 (UTC)
Received: from ovpn-66-195.rdu2.redhat.com (unknown [10.10.67.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BE3819C4F;
 Wed,  7 Oct 2020 13:05:43 +0000 (UTC)
Message-ID: <f848a6761de05d655d847130e77b23b2bb39aa26.camel@redhat.com>
Subject: Re: [PATCH v2 09/11] powerpc/smp: Optimize update_mask_by_l2
From: Qian Cai <cai@redhat.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>
Date: Wed, 07 Oct 2020 09:05:42 -0400
In-Reply-To: <20200921095653.9701-10-srikar@linux.vnet.ibm.com>
References: <20200921095653.9701-1-srikar@linux.vnet.ibm.com>
 <20200921095653.9701-10-srikar@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Oliver O'Halloran <oohall@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-09-21 at 15:26 +0530, Srikar Dronamraju wrote:
> All threads of a SMT4 core can either be part of this CPU's l2-cache
> mask or not related to this CPU l2-cache mask. Use this relation to
> reduce the number of iterations needed to find all the CPUs that share
> the same l2-cache.
> 
> Use a temporary mask to iterate through the CPUs that may share l2_cache
> mask. Also instead of setting one CPU at a time into cpu_l2_cache_mask,
> copy the SMT4/sub mask at one shot.
> 
...
>  static bool update_mask_by_l2(int cpu)
>  {
> +	struct cpumask *(*submask_fn)(int) = cpu_sibling_mask;
>  	struct device_node *l2_cache, *np;
> +	cpumask_var_t mask;
>  	int i;
>  
>  	l2_cache = cpu_to_l2cache(cpu);
> @@ -1240,22 +1264,37 @@ static bool update_mask_by_l2(int cpu)
>  		return false;
>  	}
>  
> -	cpumask_set_cpu(cpu, cpu_l2_cache_mask(cpu));
> -	for_each_cpu_and(i, cpu_online_mask, cpu_cpu_mask(cpu)) {
> +	alloc_cpumask_var_node(&mask, GFP_KERNEL, cpu_to_node(cpu));

Shouldn't this be GFP_ATOMIC? Otherwise, during the CPU hotplugging, we have,

(irqs were disabled in do_idle())

[  335.420001][    T0] BUG: sleeping function called from invalid context at mm/slab.h:494
[  335.420003][    T0] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/88
[  335.420005][    T0] no locks held by swapper/88/0.
[  335.420007][    T0] irq event stamp: 18074448
[  335.420015][    T0] hardirqs last  enabled at (18074447): [<c0000000001a2a7c>] tick_nohz_idle_enter+0x9c/0x110
[  335.420019][    T0] hardirqs last disabled at (18074448): [<c000000000106798>] do_idle+0x138/0x3b0
do_idle at kernel/sched/idle.c:253 (discriminator 1)
[  335.420023][    T0] softirqs last  enabled at (18074440): [<c0000000000bbec4>] irq_enter_rcu+0x94/0xa0
[  335.420026][    T0] softirqs last disabled at (18074439): [<c0000000000bbea0>] irq_enter_rcu+0x70/0xa0
[  335.420030][    T0] CPU: 88 PID: 0 Comm: swapper/88 Tainted: G        W         5.9.0-rc8-next-20201007 #1
[  335.420032][    T0] Call Trace:
[  335.420037][    T0] [c00020000a4bfcf0] [c000000000649e98] dump_stack+0xec/0x144 (unreliable)
[  335.420043][    T0] [c00020000a4bfd30] [c0000000000f6c34] ___might_sleep+0x2f4/0x310
[  335.420048][    T0] [c00020000a4bfdb0] [c000000000354f94] slab_pre_alloc_hook.constprop.82+0x124/0x190
[  335.420051][    T0] [c00020000a4bfe00] [c00000000035e9e8] __kmalloc_node+0x88/0x3a0
slab_alloc_node at mm/slub.c:2817
(inlined by) __kmalloc_node at mm/slub.c:4013
[  335.420054][    T0] [c00020000a4bfe80] [c0000000006494d8] alloc_cpumask_var_node+0x38/0x80
kmalloc_node at include/linux/slab.h:577
(inlined by) alloc_cpumask_var_node at lib/cpumask.c:116
[  335.420060][    T0] [c00020000a4bfef0] [c00000000003eedc] start_secondary+0x27c/0x800
update_mask_by_l2 at arch/powerpc/kernel/smp.c:1267
(inlined by) add_cpu_to_masks at arch/powerpc/kernel/smp.c:1387
(inlined by) start_secondary at arch/powerpc/kernel/smp.c:1420
[  335.420063][    T0] [c00020000a4bff90] [c00000000000c468] start_secondary_resume+0x10/0x14

> +	cpumask_and(mask, cpu_online_mask, cpu_cpu_mask(cpu));
> +
> +	if (has_big_cores)
> +		submask_fn = cpu_smallcore_mask;
> +
> +	/* Update l2-cache mask with all the CPUs that are part of submask */
> +	or_cpumasks_related(cpu, cpu, submask_fn, cpu_l2_cache_mask);
> +
> +	/* Skip all CPUs already part of current CPU l2-cache mask */
> +	cpumask_andnot(mask, mask, cpu_l2_cache_mask(cpu));
> +
> +	for_each_cpu(i, mask) {
>  		/*
>  		 * when updating the marks the current CPU has not been marked
>  		 * online, but we need to update the cache masks
>  		 */
>  		np = cpu_to_l2cache(i);
> -		if (!np)
> -			continue;
>  
> -		if (np == l2_cache)
> -			set_cpus_related(cpu, i, cpu_l2_cache_mask);
> +		/* Skip all CPUs already part of current CPU l2-cache */
> +		if (np == l2_cache) {
> +			or_cpumasks_related(cpu, i, submask_fn,
> cpu_l2_cache_mask);
> +			cpumask_andnot(mask, mask, submask_fn(i));
> +		} else {
> +			cpumask_andnot(mask, mask, cpu_l2_cache_mask(i));
> +		}
>  
>  		of_node_put(np);
>  	}
>  	of_node_put(l2_cache);
> +	free_cpumask_var(mask);
>  
>  	return true;
>  }

