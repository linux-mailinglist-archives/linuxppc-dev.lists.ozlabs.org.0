Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B92AE18D0C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 17:36:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450HW421qTzDqR6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 01:36:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450HTZ0mQMzDqDy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 01:34:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 450HTY6bHSz9s9y; Fri, 10 May 2019 01:34:57 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: f39356261c265a0689d7ee568132d516e8b6cecc
X-Patchwork-Hint: ignore
In-Reply-To: <5ae0401c-a84a-1e59-5d9d-70659f5a85de@linux.vnet.ibm.com>
To: Rick Lindsley <ricklind@linux.vnet.ibm.com>,
 Michael Ellerman <michaele@au1.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/book3s/64: check for NULL pointer in pgd_alloc()
Message-Id: <450HTY6bHSz9s9y@ozlabs.org>
Date: Fri, 10 May 2019 01:34:57 +1000 (AEST)
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

On Mon, 2019-05-06 at 00:20:43 UTC, Rick Lindsley wrote:
> When the memset code was added to pgd_alloc(), it failed to consider that kmem_cache_alloc() can return NULL.  It's uncommon, but not impossible under heavy memory contention.
> 
> Signed-off-by: Rick Lindsley <ricklind@vnet.linux.ibm.com>
> Fixes: cf266dbcd2a7 ("Zero PGD pages on allocation")

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/f39356261c265a0689d7ee568132d516

cheers
