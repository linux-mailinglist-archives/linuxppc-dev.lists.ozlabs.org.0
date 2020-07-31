Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51698234595
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 14:17:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJ5r65CtTzDqMk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 22:17:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJ5mm0JghzDqSD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 22:14:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=PiZsXOsY; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BJ5ml2LN3z9s1x;
 Fri, 31 Jul 2020 22:14:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596197655;
 bh=zl7Kp+BGNFfBts1EjllIogLiwRs96Vwctn66ZH8tpps=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=PiZsXOsYAL7n272reYQOMNJhDNwWpssZqR1XrI9PcXNOm9miwoQzY7vkbAczMA2mR
 veL4hHCGhckOA1fppwEAIThEN3r5XfV4NKi5jqtuCxcXEIxIe9pvKsKKxYq5TQe8Xv
 gjklhM/2lahd6X83wJ+VLZPJYw8K5WkT4DUqsLFY8YYoTtVt7Vp/g/8EIRDb09/oxS
 ACMesE+gaswVgRyyeOEGG4wYa7xYeQ0gMtl6v+ciaHNN2k1GHilVClzDvKlJDScYOF
 0HiZvfLU7BLTB2wHqH5Pt1uGqRFGNrlMbYn7gLYoIVJdrwm3ZVZxuqh5H53tWqjmQz
 hvqP6f482dgkQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 08/10] powerpc/smp: Allocate cpumask only after
 searching thread group
In-Reply-To: <20200731094938.GA18776@linux.vnet.ibm.com>
References: <20200727053230.19753-1-srikar@linux.vnet.ibm.com>
 <20200727053230.19753-9-srikar@linux.vnet.ibm.com>
 <87zh7g3yvk.fsf@mpe.ellerman.id.au>
 <20200731094938.GA18776@linux.vnet.ibm.com>
Date: Fri, 31 Jul 2020 22:14:11 +1000
Message-ID: <87o8nv51bg.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
 Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> * Michael Ellerman <mpe@ellerman.id.au> [2020-07-31 17:52:15]:
>
>> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
>> > If allocated earlier and the search fails, then cpumask need to be
>> > freed. However cpu_l1_cache_map can be allocated after we search thread
>> > group.
>> 
>> It's not freed anywhere AFAICS?
>
> Yes, its never freed. Infact we are never checking if
> zalloc_cpumask_var_node fails. Its not just this cpumask, but historically
> all the other existing cpumasks in arch/powerpc/kernel/smp.c are never
> freed/checked. I did dig into this a bit and it appears that ..
> (Please do correct me if I am wrong!! )

That's correct.

> Powerpc using cpumask_var_t for all of the percpu variables. And it dont seem
> to enable CONFIG_CPUMASK_OFFSTACK even from the MAXSMP config.

I remember Rusty adding that code, but I don't know if we ever
considered enabling CPUMASK_OFFSTACK.

Probably we meant to but never got around to doing it.

> So from include/linux/cpumask.h
>
> typedef struct cpumask cpumask_var_t[1];
> and
> zalloc_cpumask_var_node ends up being cpumask_clear
>
> So I think we are historically we seem to assume we are always
> !CPUMASK_OFFSTACK and hence we dont need to check for return as well as
> free..

Right.

> I would look forward to your comments on how we should handle this going
> forward. But I would keep this the same for this patchset.

Agreed, just clarify in the change log that it's not freed at the moment
because of CPU_MASK_OFFSTACK=n

> One of the questions that I have is if we most likely are to be in
> !CONFIG_CPUMASK_OFFSTACK, then should be migrate to cpumask_t for percpu
> variables. 

I don't think so, cpumask_t is semi-deprecated AIUI.
  
> The reason being we end up using NR_CPU cpumask for each percpu cpumask
> variable instead of using NR_CPU cpumask_t pointer.

Our current defconfigs have NR_CPUS=2048, which is probably just small
enough to continue using OFFSTACK=n.

But we allow configuring NR_CPUS up to 8192, which surely would need
OFFSTACK=y in order to work.

So I think we need to stick with cpumask_var_t, but we should test with
OFFSTACK=y, and should probably be a bit more careful with checking the
allocations succeed.

And then we should select OFFSTACK=y for NR_CPUS above some threshold.

cheers
