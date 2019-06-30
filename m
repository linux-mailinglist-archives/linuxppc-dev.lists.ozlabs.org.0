Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 376AA5AF7D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2019 10:50:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45c42J2tqNzDqfW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2019 18:50:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45c3lq6n4czDqp7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2019 18:37:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45c3lq3P7hz9sCJ; Sun, 30 Jun 2019 18:37:27 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: f474c28fbcbe42faca4eb415172c07d76adcb819
X-Patchwork-Hint: ignore
In-Reply-To: <20190613033014.17496-1-ravi.bangoria@linux.ibm.com>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] Powerpc/Watchpoint: Restore nvgprs while returning
 from exception
Message-Id: <45c3lq3P7hz9sCJ@ozlabs.org>
Date: Sun, 30 Jun 2019 18:37:27 +1000 (AEST)
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
Cc: ravi.bangoria@linux.ibm.com, mikey@neuling.org, aneesh.kumar@linux.ibm.com,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, paulus@samba.org,
 mahesh@linux.vnet.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-06-13 at 03:30:14 UTC, Ravi Bangoria wrote:
> Powerpc hw triggers watchpoint before executing the instruction. To
> make trigger-after-execute behavior, kernel emulates the instruction.
> If the instruction is 'load something into non-volatile register',
> exception handler should restore emulated register state while
> returning back, otherwise there will be register state corruption.
> Ex, Adding a watchpoint on a list can corrput the list:
> 
>   # cat /proc/kallsyms | grep kthread_create_list
>   c00000000121c8b8 d kthread_create_list
> 
> Add watchpoint on kthread_create_list->prev:
> 
>   # perf record -e mem:0xc00000000121c8c0
> 
> Run some workload such that new kthread gets invoked. Ex, I just
> logged out from console:
> 
>   list_add corruption. next->prev should be prev (c000000001214e00), \
> 	but was c00000000121c8b8. (next=c00000000121c8b8).
>   WARNING: CPU: 59 PID: 309 at lib/list_debug.c:25 __list_add_valid+0xb4/0xc0
>   CPU: 59 PID: 309 Comm: kworker/59:0 Kdump: loaded Not tainted 5.1.0-rc7+ #69
>   ...
>   NIP __list_add_valid+0xb4/0xc0
>   LR __list_add_valid+0xb0/0xc0
>   Call Trace:
>   __list_add_valid+0xb0/0xc0 (unreliable)
>   __kthread_create_on_node+0xe0/0x260
>   kthread_create_on_node+0x34/0x50
>   create_worker+0xe8/0x260
>   worker_thread+0x444/0x560
>   kthread+0x160/0x1a0
>   ret_from_kernel_thread+0x5c/0x70
> 
> List corruption happened because it uses 'load into non-volatile
> register' instruction:
> 
> Snippet from __kthread_create_on_node:
> 
>   c000000000136be8:     addis   r29,r2,-19
>   c000000000136bec:     ld      r29,31424(r29)
>         if (!__list_add_valid(new, prev, next))
>   c000000000136bf0:     mr      r3,r30
>   c000000000136bf4:     mr      r5,r28
>   c000000000136bf8:     mr      r4,r29
>   c000000000136bfc:     bl      c00000000059a2f8 <__list_add_valid+0x8>
> 
> Register state from WARN_ON():
> 
>   GPR00: c00000000059a3a0 c000007ff23afb50 c000000001344e00 0000000000000075
>   GPR04: 0000000000000000 0000000000000000 0000001852af8bc1 0000000000000000
>   GPR08: 0000000000000001 0000000000000007 0000000000000006 00000000000004aa
>   GPR12: 0000000000000000 c000007ffffeb080 c000000000137038 c000005ff62aaa00
>   GPR16: 0000000000000000 0000000000000000 c000007fffbe7600 c000007fffbe7370
>   GPR20: c000007fffbe7320 c000007fffbe7300 c000000001373a00 0000000000000000
>   GPR24: fffffffffffffef7 c00000000012e320 c000007ff23afcb0 c000000000cb8628
>   GPR28: c00000000121c8b8 c000000001214e00 c000007fef5b17e8 c000007fef5b17c0
> 
> Watchpoint hit at 0xc000000000136bec.
> 
>   addis   r29,r2,-19
>    => r29 = 0xc000000001344e00 + (-19 << 16)
>    => r29 = 0xc000000001214e00
> 
>   ld      r29,31424(r29)
>    => r29 = *(0xc000000001214e00 + 31424)
>    => r29 = *(0xc00000000121c8c0)
> 
> 0xc00000000121c8c0 is where we placed a watchpoint and thus this
> instruction was emulated by emulate_step. But because handle_dabr_fault
> did not restore emulated register state, r29 still contains stale
> value in above register state.
> 
> Fixes: 5aae8a5370802 ("powerpc, hw_breakpoints: Implement hw_breakpoints for 64-bit server processors")
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> Cc: stable@vger.kernel.org # 2.6.36+

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/f474c28fbcbe42faca4eb415172c07d76adcb819

cheers
