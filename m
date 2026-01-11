Return-Path: <linuxppc-dev+bounces-15523-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E861DD10153
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jan 2026 23:38:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dq9QP4Hwfz2yPR;
	Mon, 12 Jan 2026 09:38:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768171101;
	cv=none; b=N4zQ4hW/TwbN4lunfZR9BYj9kuyldDbDuT6NlnHN/SG9ySYIYTJmks4LkY40IE2ZJvQF/4UcPhsbODvRDx6L8i76T/P0Ogugn1X6bZru+GBzVLjU4ov6rbrpIgJsZ8ME9ORsaa/aKpgVuyJ/5haxw8BAMSPT9YtkxbjpAsatC1qkXx5419+MP1MVeATe4sAas97nLOjpwWjtgFm+OGKD3edyueumP3FzFzok4nz2Kw2m6xDU3tmtFsZa8ZyrzWNSiP+6zSyjbJhyI57UCdngXqAKZX2FNAInyZTzcYyS1euW/xdvyqrOkFeqzJlbdFdOMb2BdgcajfTOvnfDtjLj7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768171101; c=relaxed/relaxed;
	bh=85a7PrT0zgtz96jS4pRWuysfpQ780Eq5/9sjyOwO120=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHtasRQszKabUGsoDuAMaiU0t6ffDCRwvQbayAPeNjbGGTEfAk9bTVAUphM//G9KpuE7ZV0SXiD/QWhBjcTPBTDAefuGi5C4c1twUmjIY45zqg/7sWkEwpuppq+lcvs3dzQJ98jdghuu/FQVRphxcjwFSJtXiomxTbxtK+Vi+AYCQ9/i/NxVEwtdseDs8TI+0qXzzbGFotzNBvIO5HC+zE7sg59x1jrkajmQLicJfpNHCryOlr5q8DCo29sfsa7IFO79ajcT4sehL4VWt1QbbT0Xwgjr2Vnzi+GefI890ja6RtAY5EeMxTdFb9HGBkUHcK/jR+rRc09yUzC6U18mPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=DgDVv7+N; dkim-atps=neutral; spf=none (client-ip=90.155.50.34; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=DgDVv7+N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=90.155.50.34; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dq9QH3q1Jz2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 09:38:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=85a7PrT0zgtz96jS4pRWuysfpQ780Eq5/9sjyOwO120=; b=DgDVv7+Nsz6PtaysJzaqZ6PHpD
	7eUBRGwOGYg9vHMBVIIPRyiBnuK76spGj3oXGGj4wyZX6r9oSGMmnZMYwWnWBiZ1rsCyNHXnn/f2D
	pG9odPnA+wDKBP7AaT6hVx/Qw9COSWSROCEpkSZ7f9xAUG3jNo3/Q8MyXGSwhueXWLlKS1h4mINFP
	tkajdWvGC1JmwhHglaEtAwZA+VRaFUNjOp0M1oggFAASNkZRm0WT5lB4Uyn7kVavnYAkCwaCqq7YL
	sz0+a7OdQLxR4KwcjKCIJTe2EekXRoEuSZH9JJPqycDT5s/znS4lx8ndXQg4tuCRgX8duH0UlsxPa
	j2NF+t2w==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf41z-00000002OPX-35go;
	Sun, 11 Jan 2026 22:35:31 +0000
Date: Sun, 11 Jan 2026 22:35:31 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Francois Dugast <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Matthew Brost <matthew.brost@intel.com>, Zi Yan <ziy@nvidia.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Balbir Singh <balbirs@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alistair Popple <apopple@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-pci@vger.kernel.org, linux-mm@kvack.org,
	linux-cxl@vger.kernel.org
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
Message-ID: <aWQlsyIVVGpCvB3y@casper.infradead.org>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260111205820.830410-2-francois.dugast@intel.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Jan 11, 2026 at 09:55:40PM +0100, Francois Dugast wrote:
> The core MM splits the folio before calling folio_free, restoring the
> zone pages associated with the folio to an initialized state (e.g.,
> non-compound, pgmap valid, etc...). The order argument represents the
> folio’s order prior to the split which can be used driver side to know
> how many pages are being freed.

This really feels like the wrong way to fix this problem.

I think someone from the graphics side really needs to take the lead on
understanding what the MM is doing (both currently and in the future).
I'm happy to work with you, but it feels like there's a lot of churn right
now because there's a lot of people working on this without understanding
the MM side of things (and conversely, I don't think (m)any people on the
MM side really understand what graphics cards are trying to accomplish).

Who is that going to be?  I'm happy to get on the phone with someone.

