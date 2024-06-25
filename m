Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B94916897
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 15:07:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=nhr9RXwE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7lVn4KK9z3fss
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 23:07:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=nhr9RXwE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7lV20DJ1z3fpd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 23:07:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uJ7hWaXxJ9nttN5wvvdvZmPC2/6Vfv3y1uigVrqH7Wc=; b=nhr9RXwE9gNy4OxfhLEOHIpamL
	ye0Qbn2AedJX6y4THUoBgdvfvgo9EoOXhpHNkr5KOyNeEYUNfojioKzG53I5Isac2gb3KmmXWr9Zv
	iipNwIsmmgeCD+gjub6Emqg3hsQjwg235rTqbYqIWFgdhFJjNt9D7L8hHkCtC4EGDE1NsQoaJRVfH
	2UD4DYd/tDzYBRypix7EfPaqFY/yCRCa9rvOkywadiqHZIhy5thxRuFNFmmIS/OJ3hZpWX1tYP8+y
	j3kQsfHW6IcNO6ibjv9VsKWHV+24TrZNPzM5JiScsOesw0xXV2GIbpcVqn4b73l4YN/goXk1oYKmQ
	0ZIYEO7Q==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM5sM-0000000B9hI-2XAv;
	Tue, 25 Jun 2024 13:06:22 +0000
Date: Tue, 25 Jun 2024 14:06:22 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v6 18/18] arm64/mm: Automatically fold contpte mappings
Message-ID: <ZnrAzjm5Fqg0d1CL@casper.infradead.org>
References: <20240215103205.2607016-1-ryan.roberts@arm.com>
 <20240215103205.2607016-19-ryan.roberts@arm.com>
 <1285eb59-fcc3-4db8-9dd9-e7c4d82b1be0@huawei.com>
 <8d57ed0d-fdd0-4fc6-b9f1-a6ac11ce93ce@arm.com>
 <018b5e83-789e-480f-82c8-a64515cdd14a@huawei.com>
 <b75aa60d-e058-4b5c-877a-9c0cd295e96f@linux.alibaba.com>
 <b6b485ee-7af0-42b8-b0ca-5a75f76a69e2@arm.com>
 <43a5986a-52ea-4090-9333-90af137a4735@linux.alibaba.com>
 <306874fe-9bc1-4dec-a856-0125e4541971@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <306874fe-9bc1-4dec-a856-0125e4541971@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Borislav Petkov <bp@alien8.de>, Baolin Wang <baolin.wang@linux.alibaba.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, "Yin, Fengwei" <fengwei.yin@intel.com>, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 25, 2024 at 01:41:02PM +0100, Ryan Roberts wrote:
> On 25/06/2024 13:37, Baolin Wang wrote:
> 
> [...]
> 
> >>> For other filesystems, like ext4, I did not found the logic to determin what
> >>> size of folio to allocate in writable mmap() path
> >>
> >> Yes I'd be keen to understand this to. When I was doing contpte, page cache
> >> would only allocate large folios for readahead. So that's why I wouldn't have
> > 
> > You mean non-large folios, right?
> 
> No I mean that at the time I wrote contpte, the policy was to allocate an
> order-0 folio for any writes that missed in the page cache, and allocate large
> folios only when doing readahead from storage into page cache. The test that is
> regressing is doing writes.

mmap() faults also use readahead.

filemap_fault():

        folio = filemap_get_folio(mapping, index);
        if (likely(!IS_ERR(folio))) {
                if (!(vmf->flags & FAULT_FLAG_TRIED))
                        fpin = do_async_mmap_readahead(vmf, folio);
which does:
        if (folio_test_readahead(folio)) {
                fpin = maybe_unlock_mmap_for_io(vmf, fpin);
                page_cache_async_ra(&ractl, folio, ra->ra_pages);

which has been there in one form or another since 2007 (3ea89ee86a82).

