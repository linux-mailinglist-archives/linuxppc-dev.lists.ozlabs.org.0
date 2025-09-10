Return-Path: <linuxppc-dev+bounces-11980-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C56D1B50A71
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 03:46:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cM3T642n1z3cZt;
	Wed, 10 Sep 2025 11:46:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757468810;
	cv=none; b=IL8z/duJVkUVWd8Cje81G1N6hpH+W+OOBlvTf/oj3OR5tA4ANnLsdvFE7NgizDTjqRDgodcQyqcZVyEmS1DL0A2duoX8UCdbsENxZboZAjFEtYCXopBT5LINt7+F35mxCSMZsSMRqvJEh2qdet4f/bJNmg5qwymtmpUnwykUoimdXD/iZyu8XJ1UIgfNvg9Y3jGfvl798dk3kY5VtTDRV3tk+rrw6MgQbCuUQTr857oz0+l5ttZZ6ECef/hH+JPD6B9xmKcp39mcj/pKNcwDzyF0R5myz0ll/1JUWvbRTglRJr/Ssj4oOSSKefh4giQp/2KqELBNjl0+eUv4yprMuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757468810; c=relaxed/relaxed;
	bh=iVZDanYB1GEfuIgx7b8oUnFAcvHUmEEb2jsYYOOe4vA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=no2RIUc8gwxge06fMrrA9IdJvDZCs93mXrebxfqQ62GnSqYb7fXIOtvIuIVjdaZ9AENFdZ71d48r+VF6NvyrOCv5hZ7DKxeZf5TVV7jwW8iJdUecJB+kJZDdPYlxzsBP/VylS/cxTWIlDl6w5xwp8IFQ5YikrQIlS4Vou5RiW+sFBvhu+GlL4NQdTPKQqwIMAnUOYSQuPuMuiPOX+m8sEBowJ0XtzCfHEtA6lY5mUveWQIV+TLzdDLqQD3fwKT0H4XTyLaTWJElBNzIWZ4GzgyjNsJtr9qgIaYVeAEsoLpvIIWXG6RZWb60UEcT7NI/bWoA2GaYnnm+ixYOdPSTSOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=f0FcUSZZ; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=f0FcUSZZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cM3T00LNvz2ynf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 11:46:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iVZDanYB1GEfuIgx7b8oUnFAcvHUmEEb2jsYYOOe4vA=; b=f0FcUSZZjVJBUU1eRiHtLrYC8B
	fX8ygyKP47lN6S0QCXn5v2gT9H3CAbs8IRUKYD4o4ahPPQW9SC1LbIjyzIFy5IpYnJc/Zi35KMKl6
	GdUlF1LCy0kzBtNQT9ZzXDOjZmQlcu+Xai7VaAjWD7/8ywjnmbm5Ol0aHh6nNDZ+nK+u02Mi2LTbP
	KkIhdzSbwdYhFuN6+BCgg6md5Cbqr9Wtb/OQnYkHd+LUsIIIrFqJgd3p4eVkD/vtGMjJRJWTj736c
	yd2K/AZ2RcClBL8DLGKuOfEPa42TkTPx7o/71xbtDzWPW6D8jMVCQK4Hk2xdsrLnqU6R/xPghQ5S7
	5PHe08Rw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw9uo-00000000UeR-417j;
	Wed, 10 Sep 2025 01:46:31 +0000
Date: Wed, 10 Sep 2025 02:46:30 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Richard Weinberger <richard@nod.at>,
	Lucas Stach <l.stach@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Andreas Larsson <andreas@gaisler.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Message-ID: <aMDYdp3H-yOHU1Pm@casper.infradead.org>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 09, 2025 at 11:23:37PM +0200, Arnd Bergmann wrote:
> While removing a feature that is actively used is clearly a regression
> and not normally done, I expect removing highmem is going to happen
> at some point anyway when there are few enough users, but the question
> is when that time will be.

I don't mind that the feature remains ... unless it causes us trouble.
Which it currently does.  Perhaps we could start by removing HIGHPTE?
There was a certain amount of complexity introduced into the page fault
path when support for that was introduced.  x86 removed support for it,
so it's just ARM left before we can remove the complexity again.

Most of the other pain points are around storing metadata (directories,
superblocks, etc) in page cache highmem.  I think we can get rid of that
now too.

I don't see any particular need to gt rid of file data stored in highmem,
nor anonymous memory stored in highmem.  And if we're only talking
about hundreds of megabytes of memory, I think anon+ file pagecache is
probably most of the memory in the system already unless you have some
very weird workloads.

Where we may want to be a bit careful is some people have Plans to
reuse the kmap infrastructure to support things like unmapping the
pagecacheto protect against spectre-eqsue attacks.  I know Intel was
working on this when 3dxp was going to be a Thing, but it's recently
been brought back:

https://lore.kernel.org/linux-mm/20250812173109.295750-1-jackmanb@google.com/


