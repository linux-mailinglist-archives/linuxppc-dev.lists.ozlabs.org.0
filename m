Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D72CD5AA85
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 13:39:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45bWrB1xLhzDqxG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 21:39:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45bWpV2V51zDqQR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 21:37:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45bWpV1jWCz9s5c; Sat, 29 Jun 2019 21:37:54 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: e13e7cd4c0c1cc9984d9b6a8663e10d76b53f2aa
X-Patchwork-Hint: ignore
In-Reply-To: <20190621225554.1913-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s/exception: Fix machine check early corrupting
 AMR
Message-Id: <45bWpV1jWCz9s5c@ozlabs.org>
Date: Sat, 29 Jun 2019 21:37:54 +1000 (AEST)
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

On Fri, 2019-06-21 at 22:55:54 UTC, Nicholas Piggin wrote:
> The early machine check runs in real mode, so locking is unnecessary.
> Worse, the windup does not restore AMR, so this can result in a false
> KUAP fault after a recoverable machine check hits inside a user copy
> operation.
> 
> Fix this similarly to HMI by just avoiding the kuap lock in the
> early machine check handler (it will be set by the late handler that
> runs in virtual mode if that runs). If the virtual mode handler is
> reached, it will lock and restore the AMR.
> 
> Fixes: 890274c2dc4c0 ("powerpc/64s: Implement KUAP for Radix MMU")
> Cc: Russell Currey <ruscur@russell.cc>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/e13e7cd4c0c1cc9984d9b6a8663e10d76b53f2aa

cheers
