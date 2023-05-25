Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA0171181C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 22:26:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QS02f3NDCz3fD9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 06:26:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SQE8oA8l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SQE8oA8l;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QS01p0KxXz3f7D
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 06:26:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EBF4A600BE;
	Thu, 25 May 2023 20:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 185ECC433D2;
	Thu, 25 May 2023 20:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685046362;
	bh=q0CSXKuNpY/cOn/THS8/5Wy4aJR83TTmgU6zxWwJSXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SQE8oA8lQRwEus253i9PgXAYxS+1hfEWgxQkG8dNMuK5+C2MzFWHC2gCVa/sCTaIh
	 mINB5DgFECw+pGenAIWbq/ant+MDQxcFaxJeNamZqmWfH2SE50ljnoCt5WDkZMFN/y
	 zSsFGUWBnPo7WzVzFj57OnJKTLZv8v06II8J4E2+FMu/J0lzw0cg8/Um5wKRhTuiBz
	 M1a9kePx9hC6/XnF66pTT3tDmfydVWOZ+PUuN61Pd1nQtUDi8l6wozX8HGFWMhSLig
	 QS2F5MDwxfui88OZl1d4xhMuIeMffwSLM7NnRPkICdlmFaTyYVH5nOaWhDuFI01iqL
	 PEjExdKRm1jxQ==
Date: Thu, 25 May 2023 23:25:37 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vishal Moola <vishal.moola@gmail.com>
Subject: Re: [PATCH v2 05/34] mm: add utility functions for ptdesc
Message-ID: <20230525202537.GA4967@kernel.org>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-6-vishal.moola@gmail.com>
 <20230525090956.GX4967@kernel.org>
 <CAOzc2pxSH6GhBnAoSOjvYJk2VdMDFZi3H_1qGC5Cdyp3j4AzPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOzc2pxSH6GhBnAoSOjvYJk2VdMDFZi3H_1qGC5Cdyp3j4AzPQ@mail.gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Matthew Wilcox <willy@infradead.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 25, 2023 at 11:04:28AM -0700, Vishal Moola wrote:
> On Thu, May 25, 2023 at 2:10 AM Mike Rapoport <rppt@kernel.org> wrote:
> > > +
> > > +static inline struct ptdesc *ptdesc_alloc(gfp_t gfp, unsigned int order)
> > > +{
> > > +     struct page *page = alloc_pages(gfp | __GFP_COMP, order);
> > > +
> > > +     return page_ptdesc(page);
> > > +}
> > > +
> > > +static inline void ptdesc_free(struct ptdesc *pt)
> > > +{
> > > +     struct page *page = ptdesc_page(pt);
> > > +
> > > +     __free_pages(page, compound_order(page));
> > > +}
> >
> > The ptdesc_{alloc,free} API does not sound right to me. The name
> > ptdesc_alloc() implies the allocation of the ptdesc itself, rather than
> > allocation of page table page. The same goes for free.
> 
> I'm not sure I see the difference. Could you elaborate?

I read ptdesc_alloc() as "allocate a ptdesc" rather than as "allocate a
page for page table and return ptdesc pointing to that page". Seems very
confusing to me already and it will be even more confusion when we'll start
allocating actual ptdescs.
 
-- 
Sincerely yours,
Mike.
