Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 767286F789
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 04:52:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sR3p6NtyzDqQt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 12:52:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45sQyl3srJzDqM5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 12:48:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45sQyl0Vglz9sBZ; Mon, 22 Jul 2019 12:48:15 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: b4fc36e60f25cf22bf8b7b015a701015740c3743
In-Reply-To: <20190717235437.12908-1-shawn@anastas.io>
To: Shawn Anastasio <shawn@anastas.io>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/dma: Fix invalid DMA mmap behavior
Message-Id: <45sQyl0Vglz9sBZ@ozlabs.org>
Date: Mon, 22 Jul 2019 12:48:15 +1000 (AEST)
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
Cc: aik@ozlabs.ru, sbobroff@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-07-17 at 23:54:37 UTC, Shawn Anastasio wrote:
> The refactor of powerpc DMA functions in commit 6666cc17d780
> ("powerpc/dma: remove dma_nommu_mmap_coherent") incorrectly
> changes the way DMA mappings are handled on powerpc.
> Since this change, all mapped pages are marked as cache-inhibited
> through the default implementation of arch_dma_mmap_pgprot.
> This differs from the previous behavior of only marking pages
> in noncoherent mappings as cache-inhibited and has resulted in
> sporadic system crashes in certain hardware configurations and
> workloads (see Bugzilla).
> 
> This commit restores the previous correct behavior by providing
> an implementation of arch_dma_mmap_pgprot that only marks
> pages in noncoherent mappings as cache-inhibited. As this behavior
> should be universal for all powerpc platforms a new file,
> dma-generic.c, was created to store it.
> 
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=204145
> Fixes: 6666cc17d780 ("powerpc/dma: remove dma_nommu_mmap_coherent")
> Signed-off-by: Shawn Anastasio <shawn@anastas.io>
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/b4fc36e60f25cf22bf8b7b015a701015740c3743

cheers
