Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D1A7137E0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 May 2023 07:49:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QTSQM4sXkz3bhK
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 May 2023 15:48:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R/fA88QD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R/fA88QD;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QTSPX2p9Kz2ym7
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 May 2023 15:48:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A7A4B60B63;
	Sun, 28 May 2023 05:48:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2385C433D2;
	Sun, 28 May 2023 05:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685252892;
	bh=bkuMHroVl9TlOSFo6p59v17X6rAsvGxb3kzfT5vZogM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/fA88QDLAPfI5+3dlnjis0mHISdgNRk033rp1tEp/+Mnh4pdPF6GyqhT2d0f44ZM
	 O9W0HkIZYw4XGrrX1f3tUzE0jNE3oALs8Cn992s+EfmiHsu8hfXhu3DkQX9TcwN2oj
	 7E7N3KWaDItcFkwUQzuLHOiQy27MUurhgxG80g7TkNYefeCpTsWvx1dhgZiE8imgx7
	 3iInnTBsRh7R7es7uW5hUx43VvmKiGSLfYpxMoZFKFBm9CDY8XYAON1aC4gzYndzuk
	 JoH7BurJumWuV7HAw5lKspfn5I/oVTTKuKbhXpKROtOf7xIXSt3aAHLO5P0Ikkt3g7
	 bN8aIuRcKOvMA==
Date: Sun, 28 May 2023 08:47:45 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 05/34] mm: add utility functions for ptdesc
Message-ID: <20230528054745.GI4967@kernel.org>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-6-vishal.moola@gmail.com>
 <20230525090956.GX4967@kernel.org>
 <CAOzc2pxSH6GhBnAoSOjvYJk2VdMDFZi3H_1qGC5Cdyp3j4AzPQ@mail.gmail.com>
 <20230525202537.GA4967@kernel.org>
 <CAOzc2pxD21mxisy-M5b_SDUv0MYwNHqaVDJnJpARuDG_HjCbOg@mail.gmail.com>
 <20230527104144.GH4967@kernel.org>
 <ZHIdK+170XoK2jVe@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHIdK+170XoK2jVe@casper.infradead.org>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, Vishal Moola <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 27, 2023 at 04:09:31PM +0100, Matthew Wilcox wrote:
> On Sat, May 27, 2023 at 01:41:44PM +0300, Mike Rapoport wrote:
> > Sorry if I wasn't clear, by "page table page" I meant the page (or memory
> > for that matter) for actual page table rather than struct page describing
> > that memory.
> > 
> > So what we allocate here is the actual memory for the page tables and not
> > the memory for the metadata. That's why I think the name ptdesc_alloc is
> > confusing.
> 
> But that's going to be the common pattern in the Glorious Future.
> You allocate a folio and that includes both the folio memory descriptor
> and the 2^n pages of memory described by that folio.  Similarly for all
> the other memory descriptors.

I'm not arguing with that, I'm not happy about the naming. IMO, the name
should reflect that we allocate memory for page tables rather than for the
descriptor of that memory, say pgtable_alloc() or page_table_alloc().

-- 
Sincerely yours,
Mike.
