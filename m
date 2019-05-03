Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5217A12921
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 09:54:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wPXl6hwCzDqW1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 17:54:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wNKZ6xkgzDqS6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:59:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wNKY504cz9sPZ; Fri,  3 May 2019 16:59:29 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: e2b36d591720d81741f37e047a6f0047e8c89369
X-Patchwork-Hint: ignore
In-Reply-To: <20190502052107.24738-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64: Don't trace code that runs with the soft irq
 mask unreconciled
Message-Id: <44wNKY504cz9sPZ@ozlabs.org>
Date: Fri,  3 May 2019 16:59:29 +1000 (AEST)
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-05-02 at 05:21:07 UTC, Nicholas Piggin wrote:
> "Reconciling" in terms of interrupt handling, is to bring the soft irq
> mask state in to synch with the hardware, after an interrupt causes
> MSR[EE] to be cleared (while the soft mask may be enabled, and hard
> irqs not marked disabled).
> 
> General kernel code should not be called while unreconciled, because
> local_irq_disable, etc. manipulations can cause surprising irq traces,
> and it's fragile because the soft irq code does not really expect to
> be called in this situation.
> 
> When exiting from an interrupt, MSR[EE] is cleared to prevent races,
> but soft irq state is enabled for the returned-to context, so this is
> now an unreconciled state. restore_math is called in this state, and
> that can be ftraced, and the ftrace subsystem disables local irqs.
> 
> Mark restore_math and its callees as notrace. Restore a sanity check
> in the soft irq code that had to be disabled for this case, by commit
> 4da1f79227ad4 ("powerpc/64: Disable irq restore warning for now").
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/e2b36d591720d81741f37e047a6f0047

cheers
