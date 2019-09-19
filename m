Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEB6B7811
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 12:59:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Yv4C1d5tzF3bH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 20:59:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YtKh0TPwzF4YP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 20:26:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46YtKd0lYzz9sPf; Thu, 19 Sep 2019 20:25:56 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 92c94dfb69e350471473fd3075c74bc68150879e
In-Reply-To: <20190910225244.25056-1-nathanl@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pseries: correctly track irq state in default idle
Message-Id: <46YtKd0lYzz9sPf@ozlabs.org>
Date: Thu, 19 Sep 2019 20:25:56 +1000 (AEST)
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
Cc: ego@linux.vnet.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-09-10 at 22:52:44 UTC, Nathan Lynch wrote:
> prep_irq_for_idle() is intended to be called before entering
> H_CEDE (and it is used by the pseries cpuidle driver). However the
> default pseries idle routine does not call it, leading to mismanaged
> lazy irq state when the cpuidle driver isn't in use. Manifestations of
> this include:
> 
> * Dropped IPIs in the time immediately after a cpu comes
>   online (before it has installed the cpuidle handler), making the
>   online operation block indefinitely waiting for the new cpu to
>   respond.
> 
> * Hitting this WARN_ON in arch_local_irq_restore():
> 	/*
> 	 * We should already be hard disabled here. We had bugs
> 	 * where that wasn't the case so let's dbl check it and
> 	 * warn if we are wrong. Only do that when IRQ tracing
> 	 * is enabled as mfmsr() can be costly.
> 	 */
> 	if (WARN_ON_ONCE(mfmsr() & MSR_EE))
> 		__hard_irq_disable();
> 
> Call prep_irq_for_idle() from pseries_lpar_idle() and honor its
> result.
> 
> Fixes: 363edbe2614a ("powerpc: Default arch idle could cede processor on pseries")
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/92c94dfb69e350471473fd3075c74bc68150879e

cheers
