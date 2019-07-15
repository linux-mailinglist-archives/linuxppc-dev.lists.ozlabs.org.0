Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC84F68343
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 07:26:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nBpQ6S6MzDqTn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 15:26:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nBmW1HGvzDqJ5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 15:24:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45nBmW0N43z9sNF; Mon, 15 Jul 2019 15:24:43 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: f5a9e488d62360c91c5770bd55a0b40e419a71ce
In-Reply-To: <20190702105836.26695-1-maddy@linux.vnet.ibm.com>
To: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/powernv/idle: Fix restore of SPRN_LDBAR for
 POWER9 stop state.
Message-Id: <45nBmW0N43z9sNF@ozlabs.org>
Date: Mon, 15 Jul 2019 15:24:43 +1000 (AEST)
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
Cc: ego@linux.vnet.ibm.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-07-02 at 10:58:36 UTC, Madhavan Srinivasan wrote:
> From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> 
> commit 10d91611f426 ("powerpc/64s: Reimplement book3s idle code in C")
> reimplemented book3S code to pltform/powernv/idle.c. But when doing so
> missed to add the per-thread LDBAR update in the core_woken path of
> the power9_idle_stop(). Patch fixes the same.
> 
> Fixes: 10d91611f426 ("powerpc/64s: Reimplement book3s idle code in C")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/f5a9e488d62360c91c5770bd55a0b40e419a71ce

cheers
