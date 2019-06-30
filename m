Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8548F5AF86
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2019 10:58:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45c4Db3bB1zDr5R
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2019 18:58:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45c3lz3GMLzDqh2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2019 18:37:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45c3ly4fpfz9sCJ; Sun, 30 Jun 2019 18:37:34 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 3c25ab35fbc8526ac0c9b298e8a78e7ad7a55479
X-Patchwork-Hint: ignore
In-Reply-To: <20190620014651.7645-3-sjitindarsingh@gmail.com>
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 3/3] KVM: PPC: Book3S HV: Clear pending decr exceptions on
 nested guest entry
Message-Id: <45c3ly4fpfz9sCJ@ozlabs.org>
Date: Sun, 30 Jun 2019 18:37:34 +1000 (AEST)
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
Cc: clg@kaod.org, kvm-ppc@vger.kernel.org, sjitindarsingh@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-06-20 at 01:46:51 UTC, Suraj Jitindar Singh wrote:
> If we enter an L1 guest with a pending decrementer exception then this
> is cleared on guest exit if the guest has writtien a positive value into
> the decrementer (indicating that it handled the decrementer exception)
> since there is no other way to detect that the guest has handled the
> pending exception and that it should be dequeued. In the event that the
> L1 guest tries to run a nested (L2) guest immediately after this and the
> L2 guest decrementer is negative (which is loaded by L1 before making
> the H_ENTER_NESTED hcall), then the pending decrementer exception
> isn't cleared and the L2 entry is blocked since L1 has a pending
> exception, even though L1 may have already handled the exception and
> written a positive value for it's decrementer. This results in a loop of
> L1 trying to enter the L2 guest and L0 blocking the entry since L1 has
> an interrupt pending with the outcome being that L2 never gets to run
> and hangs.
> 
> Fix this by clearing any pending decrementer exceptions when L1 makes
> the H_ENTER_NESTED hcall since it won't do this if it's decrementer has
> gone negative, and anyway it's decrementer has been communicated to L0
> in the hdec_expires field and L0 will return control to L1 when this
> goes negative by delivering an H_DECREMENTER exception.
> 
> Fixes: 95a6432ce903 "KVM: PPC: Book3S HV: Streamlined guest entry/exit path on P9 for radix guests"
> 
> Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
> Tested-by: Laurent Vivier <lvivier@redhat.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/3c25ab35fbc8526ac0c9b298e8a78e7ad7a55479

cheers
