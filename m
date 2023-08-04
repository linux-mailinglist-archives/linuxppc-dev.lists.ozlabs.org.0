Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4A076F882
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 05:51:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=UKi7MCXm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHBbM53mPz3cRK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 13:51:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=UKi7MCXm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHBZP3PpSz2yVh
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 13:50:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=F+lJKFltZ+yQxd96NjAiSlGEaIJzdn+HIXjUUFBSS5c=; b=UKi7MCXmu/eFaLtMvBvufRKVdU
	DaCDf7FpNDWKsVmLjSyGc6/yxeFqe3Y81Jv2wMiXxhN/acrrYIe+cLWVA8Ngm3flCWpw67hZ8Cq4h
	8XatmpxPtkcPu+sDGM5Cv6LLrV48z7za5rh77704UnbEhMUUkjRA9o79maxq1G6k7Ln4V5cixK8H2
	a3fsMVVuWgMsVAnQo2mUm+DynVTptf6Dewygne5j2FslBjF8LOOfG+zqFWNk2xZgABdUpXOFJoksb
	QfmLEyGJDj8wEgWRD3ZdYiXVJzfDHWttImP7dp1vRY5vAlUPDEydhyidN3Jx5OrS6NKXkVdN48mXp
	yq8AMDtg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qRlpN-007del-Ap; Fri, 04 Aug 2023 03:50:13 +0000
Date: Fri, 4 Aug 2023 04:50:13 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v6 21/38] powerpc: Implement the new page table range API
Message-ID: <ZMx1daYwvD9EM7Cv@casper.infradead.org>
References: <20230802151406.3735276-1-willy@infradead.org>
 <20230802151406.3735276-22-willy@infradead.org>
 <20230803233814.GA2515372@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803233814.GA2515372@dev-arch.thelio-3990X>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 03, 2023 at 04:38:14PM -0700, Nathan Chancellor wrote:
> > -EXPORT_SYMBOL(flush_dcache_icache_page);
> 
> Apologies if this has already been fixed or reported, I searched lore
> and did not find anything. The dropping of this export in combination
> with the conversion above appears to cause ARCH=powerpc allmodconfig to
> fail with:
> 
>   ERROR: modpost: "flush_dcache_icache_folio" [arch/powerpc/kvm/kvm-pr.ko] undefined!
> 
> I don't know if this should be re-exported or not but that does
> obviously resolve the issue.

Well, that was clumsy of me.  I (and the Intel build bot) did test several
build combos, but clearly didn't manage to find a config that showed
this problem.  Andrew, a fix patch for you to integrate, if you would:

diff --git a/arch/powerpc/mm/cacheflush.c b/arch/powerpc/mm/cacheflush.c
index 8760d2223abe..15189592da09 100644
--- a/arch/powerpc/mm/cacheflush.c
+++ b/arch/powerpc/mm/cacheflush.c
@@ -172,6 +172,7 @@ void flush_dcache_icache_folio(struct folio *folio)
 			flush_dcache_icache_phys((pfn + i) * PAGE_SIZE);
 	}
 }
+EXPORT_SYMBOL(flush_dcache_icache_folio);
 
 void clear_user_page(void *page, unsigned long vaddr, struct page *pg)
 {
