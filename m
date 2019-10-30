Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 156EEE9BF7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 14:02:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4737rj6qMWzF3Pw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 00:01:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4736qq6RXrzF4Br
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 23:16:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4736qq4GvHz9sPw; Wed, 30 Oct 2019 23:16:07 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 7d6475051fb3d9339c5c760ed9883bc0a9048b21
In-Reply-To: <20191022115814.22456-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/powernv: Fix CPU idle to be called with IRQs
 disabled
Message-Id: <4736qq4GvHz9sPw@ozlabs.org>
Date: Wed, 30 Oct 2019 23:16:07 +1100 (AEDT)
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
Cc: Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-10-22 at 11:58:14 UTC, Nicholas Piggin wrote:
> Commit e78a7614f3876 ("idle: Prevent late-arriving interrupts from
> disrupting offline") changes arch_cpu_idle_dead to be called with
> interrupts disabled, which triggers the WARN in pnv_smp_cpu_kill_self.
> 
> Fix this by fixing up irq_happened after hard disabling, rather than
> requiring there are no pending interrupts, similarly to what was done
> done until commit 2525db04d1cc5 ("powerpc/powernv: Simplify lazy IRQ
> handling in CPU offline").
> 
> Fixes: e78a7614f3876 ("idle: Prevent late-arriving interrupts from disrupting offline")
> Reported-by: Paul Mackerras <paulus@samba.org>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/7d6475051fb3d9339c5c760ed9883bc0a9048b21

cheers
