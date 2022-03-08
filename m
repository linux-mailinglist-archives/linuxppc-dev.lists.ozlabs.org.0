Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E174D171F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 13:19:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCZBK420hz3c2s
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 23:19:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCZ923zVxz3bWM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 23:17:58 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KCZ913Gzyz4xy0;
 Tue,  8 Mar 2022 23:17:57 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220223015821.473097-1-mpe@ellerman.id.au>
References: <20220223015821.473097-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/code-patching: Pre-map patch area
Message-Id: <164674126664.3322453.2623564151161334844.b4-ty@ellerman.id.au>
Date: Tue, 08 Mar 2022 23:07:46 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: peterz@infradead.org, pmenzel@molgen.mpg.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 23 Feb 2022 12:58:21 +1100, Michael Ellerman wrote:
> Paul reported a warning with DEBUG_ATOMIC_SLEEP=y:
> 
>   BUG: sleeping function called from invalid context at include/linux/sched/mm.h:256
>   in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 1, name: swapper/0
>   preempt_count: 0, expected: 0
>   ...
>   Call Trace:
>     dump_stack_lvl+0xa0/0xec (unreliable)
>     __might_resched+0x2f4/0x310
>     kmem_cache_alloc+0x220/0x4b0
>     __pud_alloc+0x74/0x1d0
>     hash__map_kernel_page+0x2cc/0x390
>     do_patch_instruction+0x134/0x4a0
>     arch_jump_label_transform+0x64/0x78
>     __jump_label_update+0x148/0x180
>     static_key_enable_cpuslocked+0xd0/0x120
>     static_key_enable+0x30/0x50
>     check_kvm_guest+0x60/0x88
>     pSeries_smp_probe+0x54/0xb0
>     smp_prepare_cpus+0x3e0/0x430
>     kernel_init_freeable+0x20c/0x43c
>     kernel_init+0x30/0x1a0
>     ret_from_kernel_thread+0x5c/0x64
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/code-patching: Pre-map patch area
      https://git.kernel.org/powerpc/c/591b4b268435f00d2f0b81f786c2c7bd5ef66416

cheers
