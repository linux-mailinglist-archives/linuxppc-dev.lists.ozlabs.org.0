Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 185775AF80
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2019 10:54:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45c47L2PGSzDqvH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2019 18:54:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45c3lv2hLLzDqhl
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2019 18:37:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45c3lv0rTwz9sND; Sun, 30 Jun 2019 18:37:30 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 8d0f1e05ab16c4bd628ddaefd20b94ffb36d799c
X-Patchwork-Hint: ignore
In-Reply-To: <1560806698-26651-1-git-send-email-gromero@linux.vnet.ibm.com>
To: Gustavo Romero <gromero@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] selftests/powerpc: Fix earlyclobber in tm-vmxcopy
Message-Id: <45c3lv0rTwz9sND@ozlabs.org>
Date: Sun, 30 Jun 2019 18:37:30 +1000 (AEST)
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
Cc: mikey@neuling.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-06-17 at 21:24:58 UTC, Gustavo Romero wrote:
> In some cases, compiler can allocate the same register for operand 'res'
> and 'vecoutptr', resulting in segfault at 'stxvd2x 40,0,%[vecoutptr]'
> because base register will contain 1, yielding a false-positive.
> 
> This is because output 'res' must be marked as an earlyclobber operand so
> it may not overlap an input operand ('vecoutptr').
> 
> Signed-off-by: Gustavo Romero <gromero@linux.vnet.ibm.com>
> Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/8d0f1e05ab16c4bd628ddaefd20b94ffb36d799c

cheers
