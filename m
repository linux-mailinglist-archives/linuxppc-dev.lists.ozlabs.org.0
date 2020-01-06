Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 553CC130D24
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 06:25:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rkVV2MfgzDqCD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 16:25:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rkSB6lVyzDq9G
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2020 16:23:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 47rkSB2h9Wz9sQp; Mon,  6 Jan 2020 16:23:22 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47rkSB1FVLz9sR1; Mon,  6 Jan 2020 16:23:21 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 91a063c956084fb21cf2523bce6892514e3f1799
In-Reply-To: <20191221121337.4894-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/mm: Mark get_slice_psize() & slice_addr_is_low()
 as notrace
Message-Id: <47rkSB1FVLz9sR1@ozlabs.org>
Date: Mon,  6 Jan 2020 16:23:21 +1100 (AEDT)
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2019-12-21 at 12:13:37 UTC, Michael Ellerman wrote:
> These slice routines are called from the SLB miss handler, which can
> lead to warnings from the IRQ code, because we have not reconciled the
> IRQ state properly:
> 
>   WARNING: CPU: 72 PID: 30150 at arch/powerpc/kernel/irq.c:258 arch_local_irq_restore.part.0+0xcc/0x100
>   Modules linked in:
>   CPU: 72 PID: 30150 Comm: ftracetest Not tainted 5.5.0-rc2-gcc9x-g7e0165b2f1a9 #1
>   NIP:  c00000000001d83c LR: c00000000029ab90 CTR: c00000000026cf90
>   REGS: c0000007eee3b960 TRAP: 0700   Not tainted  (5.5.0-rc2-gcc9x-g7e0165b2f1a9)
>   MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 22242844  XER: 20000000
>   CFAR: c00000000001d780 IRQMASK: 0
>   ...
>   NIP arch_local_irq_restore.part.0+0xcc/0x100
>   LR  trace_graph_entry+0x270/0x340
>   Call Trace:
>     trace_graph_entry+0x254/0x340 (unreliable)
>     function_graph_enter+0xe4/0x1a0
>     prepare_ftrace_return+0xa0/0x130
>     ftrace_graph_caller+0x44/0x94	# (get_slice_psize())
>     slb_allocate_user+0x7c/0x100
>     do_slb_fault+0xf8/0x300
>     instruction_access_slb_common+0x140/0x180
> 
> Fixes: 48e7b7695745 ("powerpc/64s/hash: Convert SLB miss handlers to C")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to powerpc fixes.

https://git.kernel.org/powerpc/c/91a063c956084fb21cf2523bce6892514e3f1799

cheers
