Return-Path: <linuxppc-dev+bounces-7246-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00738A6B3F0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 06:14:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJrGX72R3z3091;
	Fri, 21 Mar 2025 16:14:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742534068;
	cv=none; b=PElP29+ydUDvg4rVHBywGGEQDcHJkhXoRSCCjdUEIg8wLP0IqQNueb1erXsJfSA6gT3dt9V/xqN9Xc8FLAxLhMBIIQnvxZLEVB3X6xhIHl0rx7Sl3wrxAqW9Fdpv7PnSP/I9slvsIyJzaRygSKoPKJZVcSFW3eIArYa1qZ6r9MaGwI/5lufOgajMee8R5h8jkSy+mM4A6n0YJ83GqVoNvevDC59TvsAwzgeIQUCFpIKtCCMoD/TSdHFRujxSK1L6i+FOd5M2gYt67jOor7DJRGPjr3D46AwPqG4wag+y2Jl1iOEr+oVHUrmdQ+aH9HIQq0jYOoGC9FRHO1f+/CBwBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742534068; c=relaxed/relaxed;
	bh=rUyXpJNwMUhzMPk5QM3GkvuJrE/4O7e8Ynsm2+/B6s8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dnjb1gjvDQ+n3XQyCNcah444dayxdXZTHuctjwOWgsarhUj/ET3qeqcAYMZ+7aHf9+g0oNH7hi6Yj93cOHjo9BdpfqN+cyuMFtQer+Z4178QfjfqZW1K+vdJdQTAB2HmRaYFy5MT/PCHzr5tapm+P23ZBBYofj9hmOm43QOC67Al/bvsawuvOCImw3WnK2OrJTkWFBRopJZxoAveAxz0dAfe49mKbbx2UyxaRrf7Gy1P3XSpnOfqIS5VKU9cQfZ3cgJDyoFy7HkTMqYkbUtPziS+5y4vte9WFBFkCHTLfLbevn1soEBssrU0W1eY4Qf7JlYYRLIQ4Hr5hIzvnqasvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+29b50c529b9140e130ad+7880+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+29b50c529b9140e130ad+7880+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJrGM4fLRz2yf0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 16:14:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rUyXpJNwMUhzMPk5QM3GkvuJrE/4O7e8Ynsm2+/B6s8=; b=Kf2KvaaYATGpCtxdSKU5/6rPCA
	KAkFT3eZmQAkfjf5zy7uXXS82wFhob4doB/KA+43X3dISEqyPawWkrNyBlpoZtdgWVXEmob7h9A2T
	INmhKDoOOCjOrjW4ZSjUvWB03s3OSD+vre15oic0+OgKkwp14Sr/g6/gqSwlMApZNHX6IiM17Op0A
	0pdaXp0Ty2kdgJI3qfEyUskbjjdfeoRtb2GuSsZ2qkpEpR0MO0Y/g0FonmFmXlySGE0zWNjOhaN18
	6K+0taEVWg/lI1bi9TslKaztZnjLhaXpsm7T4I+pdul/sW/3pyTjE0hNQ2c74u6nXUIlDS+1SjHRs
	WTlUT8bw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tvUhg-0000000DsHV-1Vd5;
	Fri, 21 Mar 2025 05:13:56 +0000
Date: Thu, 20 Mar 2025 22:13:56 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@redhat.com,
	vbabka@suse.cz, lorenzo.stoakes@oracle.com, liam.howlett@oracle.com,
	alexandru.elisei@arm.com, peterx@redhat.com, hannes@cmpxchg.org,
	mhocko@kernel.org, m.szyprowski@samsung.com, iamjoonsoo.kim@lge.com,
	mina86@mina86.com, axboe@kernel.dk, viro@zeniv.linux.org.uk,
	brauner@kernel.org, hch@infradead.org, jack@suse.cz,
	hbathini@linux.ibm.com, sourabhjain@linux.ibm.com,
	ritesh.list@gmail.com, aneesh.kumar@kernel.org, bhelgaas@google.com,
	sj@kernel.org, fvdl@google.com, ziy@nvidia.com, yuzhao@google.com,
	minchan@kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Minchan Kim <minchan@google.com>
Subject: Re: [RFC 1/3] mm: implement cleancache
Message-ID: <Z9z1lC9ppphUhDjk@infradead.org>
References: <20250320173931.1583800-1-surenb@google.com>
 <20250320173931.1583800-2-surenb@google.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320173931.1583800-2-surenb@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Mar 20, 2025 at 10:39:29AM -0700, Suren Baghdasaryan wrote:
> Cleancache can be thought of as a page-granularity victim cache for clean

Please implement your semantics directly instea of with a single user
abstraction.  If we ever need an abstraction we can add it once we have
multiple consumers and know what they need.


