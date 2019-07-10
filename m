Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 841026496B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 17:16:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kN824cWmzDq7k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 01:16:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kMv02g79zDqLx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 01:05:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 45kMty4JD6z9sPp; Thu, 11 Jul 2019 01:05:30 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45kMty2sWcz9sP3; Thu, 11 Jul 2019 01:05:30 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 0fc12c022ad25532b66bf6f6c818ee1c1d63e702
In-Reply-To: <20190708061046.7075-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/irq: Don't WARN continuously in
 arch_local_irq_restore()
Message-Id: <45kMty2sWcz9sP3@ozlabs.org>
Date: Thu, 11 Jul 2019 01:05:30 +1000 (AEST)
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

On Mon, 2019-07-08 at 06:10:46 UTC, Michael Ellerman wrote:
> When CONFIG_PPC_IRQ_SOFT_MASK_DEBUG is enabled (uncommon), we have a
> series of WARN_ON's in arch_local_irq_restore().
> 
> These are "should never happen" conditions, but if they do happen they
> can flood the console and render the system unusable. So switch them
> to WARN_ON_ONCE().
> 
> Fixes: e2b36d591720 ("powerpc/64: Don't trace code that runs with the soft irq mask unreconciled")
> Fixes: 9b81c0211c24 ("powerpc/64s: make PACA_IRQ_HARD_DIS track MSR[EE] closely")
> Fixes: 7c0482e3d055 ("powerpc/irq: Fix another case of lazy IRQ state getting out of sync")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to powerpc next.

https://git.kernel.org/powerpc/c/0fc12c022ad25532b66bf6f6c818ee1c1d63e702

cheers
