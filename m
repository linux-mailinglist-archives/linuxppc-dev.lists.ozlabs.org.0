Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC89E9BB3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 13:43:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4737Rc4tYnzF3yk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 23:43:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4736nv34XBzF4BZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 23:14:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4736nt571jz9sPd; Wed, 30 Oct 2019 23:14:26 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4736nr03ZLz9sRM; Wed, 30 Oct 2019 23:14:23 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: eb8e20f89093b64f48975c74ccb114e6775cee22
In-Reply-To: <20191024055932.27940-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pseries: Mark accumulate_stolen_time() as notrace
Message-Id: <4736nr03ZLz9sRM@ozlabs.org>
Date: Wed, 30 Oct 2019 23:14:23 +1100 (AEDT)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-10-24 at 05:59:32 UTC, Michael Ellerman wrote:
> accumulate_stolen_time() is called prior to interrupt state being
> reconciled, which can trip the warning in arch_local_irq_restore():
> 
>   WARNING: CPU: 5 PID: 1017 at arch/powerpc/kernel/irq.c:258 .arch_local_irq_restore+0x9c/0x130
>   ...
>   NIP .arch_local_irq_restore+0x9c/0x130
>   LR  .rb_start_commit+0x38/0x80
>   Call Trace:
>     .ring_buffer_lock_reserve+0xe4/0x620
>     .trace_function+0x44/0x210
>     .function_trace_call+0x148/0x170
>     .ftrace_ops_no_ops+0x180/0x1d0
>     ftrace_call+0x4/0x8
>     .accumulate_stolen_time+0x1c/0xb0
>     decrementer_common+0x124/0x160
> 
> For now just mark it as notrace. We may change the ordering to call it
> after interrupt state has been reconciled, but that is a larger
> change.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to powerpc next.

https://git.kernel.org/powerpc/c/eb8e20f89093b64f48975c74ccb114e6775cee22

cheers
