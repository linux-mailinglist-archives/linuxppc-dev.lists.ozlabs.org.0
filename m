Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E61DC12868
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 09:04:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wNRN24cYzDqYC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 17:04:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wNK63tzNzDqPP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:59:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wNK62Jg8z9sBr; Fri,  3 May 2019 16:59:06 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: e620d45065c7b5b8d6ae11217c09c09380103b83
X-Patchwork-Hint: ignore
In-Reply-To: <1547657264-28761-1-git-send-email-leitao@debian.org>
To: Breno Leitao <leitao@debian.org>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/tm: Avoid machine crash on rt_sigreturn
Message-Id: <44wNK62Jg8z9sBr@ozlabs.org>
Date: Fri,  3 May 2019 16:59:06 +1000 (AEST)
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
Cc: Breno Leitao <leitao@debian.org>, mikey@neuling.org,
 gromero@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-01-16 at 16:47:44 UTC, Breno Leitao wrote:
> There is a kernel crash that happens if rt_sigreturn is called inside a
> transactional block.
> 
> This crash happens if the kernel hits an in-kernel page fault when
> accessing userspace memory, usually through copy_ckvsx_to_user(). A major
> page fault calls might_sleep() function, which can cause a task reschedule.
> A task reschedule (switch_to()) reclaim and recheckpoint the TM states,
> but, in the signal return path, the checkpointed memory was already
> reclaimed, thus the exception stack has MSR that points to MSR[TS]=0.
> 
> When the code returns from might_sleep() and a task reschedule happened,
> then this task is returned with the memory recheckpointed, and
> CPU MSR[TS] = suspended.
> 
> This means that there is a side effect at might_sleep() if it is called
> with CPU MSR[TS] = 0 and the task has regs->msr[TS] != 0.
> 
> This side effect can cause a TM bad thing, since at the exception entrance,
> the stack saves MSR[TS]=0, and this is what will be used at RFID, but,
> the processor has MSR[TS] = Suspended, and this transition will be invalid
> and a TM Bad thing will be raised, causing the following crash:
> 
> 	Unexpected TM Bad Thing exception at c00000000000e9ec (msr 0x8000000302a03031) tm_scratch=800000010280b033
> 	cpu 0xc: Vector: 700 (Program Check) at [c00000003ff1fd70]
> 	    pc: c00000000000e9ec: fast_exception_return+0x100/0x1bc
> 	    lr: c000000000032948: handle_rt_signal64+0xb8/0xaf0
> 	    sp: c0000004263ebc40
> 	   msr: 8000000302a03031
> 	  current = 0xc000000415050300
> 	  paca    = 0xc00000003ffc4080	 irqmask: 0x03	 irq_happened: 0x01
> 	    pid   = 25006, comm = sigfuz
> 	Linux version 5.0.0-rc1-00001-g3bd6e94bec12 (breno@debian) (gcc version 8.2.0 (Debian 8.2.0-3)) #899 SMP Mon Jan 7 11:30:07 EST 2019
> 	WARNING: exception is not recoverable, can't continue
> 	enter ? for help
> 	[c0000004263ebc40] c000000000032948 handle_rt_signal64+0xb8/0xaf0 (unreliable)
> 	[c0000004263ebd30] c000000000022780 do_notify_resume+0x2f0/0x430
> 	[c0000004263ebe20] c00000000000e844 ret_from_except_lite+0x70/0x74
> 	--- Exception: c00 (System Call) at 00007fffbaac400c
> 	SP (7fffeca90f40) is in userspace
> 
> The solution for this problem is running the sigreturn code with
> regs->msr[TS] disabled, thus, avoiding hitting the side effect above. This
> does not seem to be a problem since regs->msr will be replaced by the
> ucontext value, so, it is being flushed already. In this case, it is
> flushed earlier.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> Acked-by: Michael Neuling <mikey@neuling.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/e620d45065c7b5b8d6ae11217c09c093

cheers
