Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C587A930A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 11:26:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rrqlr2m30z3c4r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 19:26:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrqlH5XLRz3c12
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 19:26:03 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RrqlH4FQsz4x5k;
	Thu, 21 Sep 2023 19:26:03 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Benjamin Gray <bgray@linux.ibm.com>
In-Reply-To: <20230915034604.45393-1-bgray@linux.ibm.com>
References: <20230915034604.45393-1-bgray@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/dexcr: Move HASHCHK trap handler
Message-Id: <169528828845.872767.1528439942470482809.b4-ty@ellerman.id.au>
Date: Thu, 21 Sep 2023 19:24:48 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 15 Sep 2023 13:46:04 +1000, Benjamin Gray wrote:
> Syzkaller reported a sleep in atomic context bug relating to the HASHCHK
> handler logic
> 
>   BUG: sleeping function called from invalid context at arch/powerpc/kernel/traps.c:1518
>   in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 25040, name: syz-executor
>   preempt_count: 0, expected: 0
>   RCU nest depth: 0, expected: 0
>   no locks held by syz-executor/25040.
>   irq event stamp: 34
>   hardirqs last  enabled at (33): [<c000000000048b38>] prep_irq_for_enabled_exit arch/powerpc/kernel/interrupt.c:56 [inline]
>   hardirqs last  enabled at (33): [<c000000000048b38>] interrupt_exit_user_prepare_main+0x148/0x600 arch/powerpc/kernel/interrupt.c:230
>   hardirqs last disabled at (34): [<c00000000003e6a4>] interrupt_enter_prepare+0x144/0x4f0 arch/powerpc/include/asm/interrupt.h:176
>   softirqs last  enabled at (0): [<c000000000281954>] copy_process+0x16e4/0x4750 kernel/fork.c:2436
>   softirqs last disabled at (0): [<0000000000000000>] 0x0
>   CPU: 15 PID: 25040 Comm: syz-executor Not tainted 6.5.0-rc5-00001-g3ccdff6bb06d #3
>   Hardware name: IBM,9105-22A POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1040.00 (NL1040_021) hv:phyp pSeries
>   Call Trace:
>   [c0000000a8247ce0] [c00000000032b0e4] __might_resched+0x3b4/0x400 kernel/sched/core.c:10189
>   [c0000000a8247d80] [c0000000008c7dc8] __might_fault+0xa8/0x170 mm/memory.c:5853
>   [c0000000a8247dc0] [c00000000004160c] do_program_check+0x32c/0xb20 arch/powerpc/kernel/traps.c:1518
>   [c0000000a8247e50] [c000000000009b2c] program_check_common_virt+0x3bc/0x3c0
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/dexcr: Move HASHCHK trap handler
      https://git.kernel.org/powerpc/c/c3f4309693758b13fbb34b3741c2e2801ad28769

cheers
