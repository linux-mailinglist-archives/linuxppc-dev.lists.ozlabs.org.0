Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB04383E0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 07:52:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ks9T40JSzDqNg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 15:51:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Ks7l2rxKzDqMX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 15:50:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45Ks7k5hFgz9sNR;
 Fri,  7 Jun 2019 15:50:26 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH] Powerpc/Watchpoint: Restore nvgprs while returning from
 exception
In-Reply-To: <20190606072951.32116-1-ravi.bangoria@linux.ibm.com>
References: <20190606072951.32116-1-ravi.bangoria@linux.ibm.com>
Date: Fri, 07 Jun 2019 15:50:21 +1000
Message-ID: <87ftom0wrm.fsf@concordia.ellerman.id.au>
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mikey@neuling.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, paulus@samba.org,
 mahesh@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ravi Bangoria <ravi.bangoria@linux.ibm.com> writes:

> Powerpc hw triggers watchpoint before executing the instruction.
> To make trigger-after-execute behavior, kernel emulates the
> instruction. If the instruction is 'load something into non-
> volatile register', exception handler should restore emulated
> register state while returning back, otherwise there will be
> register state corruption. Ex, Adding a watchpoint on a list
> can corrput the list:
>
>   # cat /proc/kallsyms | grep kthread_create_list
>   c00000000121c8b8 d kthread_create_list
>
> Add watchpoint on kthread_create_list->next:
>
>   # perf record -e mem:0xc00000000121c8c0
>
> Run some workload such that new kthread gets invoked. Ex, I
> just logged out from console:
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

This all depends on what code the compiler generates for the list
access. Can you include a disassembly of the relevant code in your
kernel so we have an example of the bad case.

> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index 9481a11..96de0d1 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -1753,7 +1753,7 @@ handle_dabr_fault:
>  	ld      r5,_DSISR(r1)
>  	addi    r3,r1,STACK_FRAME_OVERHEAD
>  	bl      do_break
> -12:	b       ret_from_except_lite
> +12:	b       ret_from_except

This probably warrants a comment explaining why we can't use the (badly
named) "lite" version.

cheers
