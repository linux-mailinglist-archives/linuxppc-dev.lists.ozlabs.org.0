Return-Path: <linuxppc-dev+bounces-7247-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF098A6B3F3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 06:14:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJrH22qShz30BG;
	Fri, 21 Mar 2025 16:14:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742534094;
	cv=none; b=mAkeooisGudIT8UmyZqSYIwe17iS0uCtYt7IUKaC3SZ0zt2L2R142v7265Jyp7tikSb38QqmCP2yMn05S6/5JeYlDLgKFnuiIluUynNQ1wgcO9vBBEUfrvga91ZImaYdxKdV9fIy1W7A4lsgHhL4saAPyI9Xw4xi/LM7eb/M2+bmW5NEBk3F7qRyHrCSEi8ruXKNyqXCbKJtITkvHmxfnLw9n4VNX+SNniI9IvBStlZdaoZyYVDtNVr+RucNm5ujwUpdUo/tILsE4AvC6JPiNTyEtJizu6/HeP3PdjtT7q0+ZZnbYEont0bq8xU7f0FQjj/XHHRDsQBXFnawy6JYQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742534094; c=relaxed/relaxed;
	bh=fIC/SAXuaviF4kGty41Kn3ZZ26v8zIm5FHzMRtfkfFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lh+BzcKHSVl+/MIngYVIl2bnIKK1gqFwuL1yfOgKXCzAN+f7nibENypoxUWIW+jLJXsIUvEQzR1v6dh136seMI6IQaLqGhE/rsDJ9Vxl1NFQhvCZfN3bTl2BYCXiKWT57GKh+IozTkr1wfLacFpBsowzFs1/S/MwMBqzRDWPp2eC5+oRXiM4rOtPhRRPiu5udnhYxKZZLuoz+VuZAe7NAaVkx4PtcG58PKhLjfFvZ+ynEJB3UoECKJ2/rXG9PHmEFwlIZDLB1cnifvjqkVLIDSsCkp1BHSA8bnJoUD7d4uH2hQ1w4mFvbw01BoWggX53yKGyeQs8bpJfvhSk69oLAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1wmiI9+V; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+29b50c529b9140e130ad+7880+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1wmiI9+V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+29b50c529b9140e130ad+7880+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJrH15tTZz2yf0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 16:14:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fIC/SAXuaviF4kGty41Kn3ZZ26v8zIm5FHzMRtfkfFc=; b=1wmiI9+VZjGjXVJSYgYQgrg6N1
	t5dpCQ9cWL8kFMKwc19IlHoDP7CaQdDWJhrB8p7UjT/s0y+sKqjIWWZfy/VHNp3CoCXALSc7yKnbR
	iI3qfxX9AFYNvdMABaL+ZQ3Wq94cBUX/4ZGjDQpEEqxbCkNaBG9X47Lx3OXVA+GBnEAhNjC+DC1lS
	9h4zNL/fx2G2f6uOLH+8ehqAH5Byvo0FHJOm32VV0yA8YncZ/7GRtxSoOJwwDOOogrYawcbuA9HrH
	c90vZ+beiRPDIl915nDJC97Vd1M1BlHuVnb/zBYhDVi4KK80b5b+/UQQCW5v/Dysa3Uuq8pCi69Sc
	s79lkjwA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tvUiR-0000000DsQw-3ibf;
	Fri, 21 Mar 2025 05:14:43 +0000
Date: Thu, 20 Mar 2025 22:14:43 -0700
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
Subject: Re: [RFC 2/3] mm: introduce GCMA
Message-ID: <Z9z1w2vHfJrwSgWW@infradead.org>
References: <20250320173931.1583800-1-surenb@google.com>
 <20250320173931.1583800-3-surenb@google.com>
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
In-Reply-To: <20250320173931.1583800-3-surenb@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Mar 20, 2025 at 10:39:30AM -0700, Suren Baghdasaryan wrote:
> From: Minchan Kim <minchan@google.com>
> 
> This patch introduces GCMA (Guaranteed Contiguous Memory Allocator)
> cleacache backend which reserves some amount of memory at the boot
> and then donates it to store clean file-backed pages in the cleancache.
> GCMA aims to guarantee contiguous memory allocation success as well as
> low and deterministic allocation latency.
> 
> Notes:
> Originally, the idea was posted by SeongJae Park and Minchan Kim [1].
> Later Minchan reworked it to be used in Android as a reference for
> Android vendors to use [2].

That is not a very good summay.  It needs to explain how you ensure
that the pages do stay clean forever.


