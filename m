Return-Path: <linuxppc-dev+bounces-7554-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DF7A81291
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 18:39:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZXBcj38vbz30TM;
	Wed,  9 Apr 2025 02:39:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744130373;
	cv=none; b=hFzKaf4RFKrfA4+9cleQJswuv/VGKHX0/jQMMnJPrfQF1yb9eMoTylthP9cjZpZAQwssSc6yc+YbWXThtRWF5OjzXtJtAxo7hHOdGdKc2mjFEevnX8mUSeJ8pZVAWmcQiwsJUH7KgS80CBs59h9/Bt0v9vju1wCOjDkXnYwJt4fbWzB755XFjUmESDCdeCrk8wAkYcLxw2a/i/H7WxC5wrkOHmVS8o8Rjdu+7RlzDZWK6T9oKYdjnw+OADXLRC5sfz7mj5p5SX0YA/euvlr3WpnOkDtc4AkWV+ogGGM4NI5aT5m/qGM8itlrkn1QhVG5rqIQCPHxt82AGMfaQgSAqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744130373; c=relaxed/relaxed;
	bh=q8c5kGuEjzUrixCQz8SJfmiMTtSSZ6M/pup07QMbIZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3DWvEZ22GQwwi7g3YuaHz5bJjoeEAFIALdgkB904YouKKymEO1/xPF7wwmC4sgKRa4jGxkrMdSXRP6nMk/S3RhbnKt8YXanninGehmAqflVFacwT9up6BWYNUtUyxWs2mZSEXXaP2Z1F9u22cMt6gto0aj++m18VjdbP7n3BD0yFv3UA+vxVBQg1ZbPUtOffBXR6HcmWA9O/5VqQOM66Ys/8iFX5K/1Rd7fF7sdEMi3bxl72VXz4olWjJw1sdIcRqjY41Il7QMo9wqw8uf3PX9XmNXVm6AqXJtQNSlldb1RngFNWbTW2ygTZF0EmtEp8DBcCvThswRam7OJGDtRWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZXBcX0svNz30RK
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Apr 2025 02:39:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=q8c5kGuEjzUrixCQz8SJfmiMTtSSZ6M/pup07QMbIZo=; b=t9QSCPFKWRX+IEXLLTG7nFPvtv
	qDrwtyW8ndHz9ADtdBvDwK9R1/b7GawfLb9Ry+HoJokPfkHZsWEY8kmm+jpBlq6UtOttGJYiUw7RR
	YQcU45qxxKziWZ2wo5RrV8K7L++OSyA0Pg6W4VCgKFlOrXroMKnLYbVxn6C0iXMlaNBqc55NZ+7ry
	DAQLC5cv7ugIBp7R5NUNcrnkv6P4QXcnyZrwaQNIPaFmW3FgZted7FwYDS5UBdqKAJDVf5IQeUvr3
	Gezyf9Lp+/2LMaVmh9DL4kYQDtD4GOp47bbpeRMV5gu/qNM87gpbm6R4yQ33Abl/XS2ElP+tzf6AO
	XyawnGVw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2Bx2-0000000GpOB-0hye;
	Tue, 08 Apr 2025 16:37:28 +0000
Date: Tue, 8 Apr 2025 17:37:27 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v2 02/12] x86: pgtable: Always use pte_free_kernel()
Message-ID: <Z_VQxyqkU8DV7QGy@casper.infradead.org>
References: <20250408095222.860601-1-kevin.brodsky@arm.com>
 <20250408095222.860601-3-kevin.brodsky@arm.com>
 <409d2019-a409-4e97-a16f-6b345b0f5a38@intel.com>
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
In-Reply-To: <409d2019-a409-4e97-a16f-6b345b0f5a38@intel.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 08, 2025 at 08:22:47AM -0700, Dave Hansen wrote:
> Are there any tests for folio_test_pgtable() at free_page() time? If we
> had that, it would make it less likely that another free_page() user
> could sneak in without calling the destructor.

It's hidden, but yes:

static inline bool page_expected_state(struct page *page,
                                        unsigned long check_flags)
{
        if (unlikely(atomic_read(&page->_mapcount) != -1))
                return false;

PageTable uses page_type which aliases with mapcount, so this check
covers "PageTable is still set when the last refcount to it is put".

I don't think we really use the page refcount when allocating/freeing
page tables.  Anyone want to try switching it over to using
alloc_frozen_pages() / free_frozen_pages()?  Might need to move that API
out of mm/internal.h ...

