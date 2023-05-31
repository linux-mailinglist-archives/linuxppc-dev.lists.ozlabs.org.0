Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03513718A39
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 21:33:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWfZQ4c5Kz3f87
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 05:33:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=DqMU+tzE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=DqMU+tzE;
	dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWfYb6t5Yz2ym7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 05:32:51 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-53f70f7c2d2so21697a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 12:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1685561568; x=1688153568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K1b4BZmA9xJj4k+yX9G1OpwN8zaCq1YL9w8UMx2HW8U=;
        b=DqMU+tzEkEG/KBm/Eq8c50aBcNpCYLCDfIfu2qjwwcPg0L4B3pyIohHBAzyR1rV0BP
         V/m/A6VPjh2V/gAf1InQamkLfVKnTZy+tS4G8D7G9FxBmlJSwxxYbjh8ZmupHNl0eevX
         lPbMy/Tw/ElEj/9T2zLclMOTikXMCoO4zi4Jz/K3dXTMzCQPf+al0bdolspqKcUBZ42g
         y7dXf745BGesGzWYp54442rTbaeMerKhc5X4qohTsEn7zGpNGB/zvD6xbsbfEfu2Zlu+
         WM86IzoR72al1oCugiwWriFtaYbSkEqg9fqkAfaWIDuLcOZimNJeIf/7vhUEyBMi3En6
         l4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685561568; x=1688153568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1b4BZmA9xJj4k+yX9G1OpwN8zaCq1YL9w8UMx2HW8U=;
        b=UknR4AkAU+tj3fgybK5IflYQt0wWrRBNuMtzBD+pdX23gwR7A/vK5A5wjuVpJ3htAh
         TSW7mHbf85GSfYcLWTnabHMTIUG4x2fXt/iG9AtGyMBP47ipZ9apwe3nwucklyCar4eI
         qJRj9/9c7TyeUP0/eYH/OtGHjgLhu98mLeUCyy44td2IMf/FcmoKwEgmxHeygguGlCPx
         L0BBjmpMU/l+6xp+P8am7P+yTL4D9Ux3B/bcT6A578b/n5U7d/b7DBFkrVAQ4IEE4o3T
         tVzW10fMYjqtAUw3XirHSPEIxYeYkoM7OEnqzqJbBCD91GZgz6vt/vOusxZEnIpWwUZ6
         Ne7Q==
X-Gm-Message-State: AC+VfDzXiZd3/EPm/huIR4Re9ECYKfKQLV8ToK4+BtwzdSy4eB6KjwFf
	6TvLIghq46gZndWZDMfyRi+ysQ==
X-Google-Smtp-Source: ACHHUZ7lcXE9sadSW9Rrzl5BAk50j1XTwgJx3egzhx6uSXmvo9XJdNso/P+uf7WiDgNFtlx4kiddiQ==
X-Received: by 2002:a17:902:c3ca:b0:1b1:714a:335b with SMTP id j10-20020a170902c3ca00b001b1714a335bmr1984367plj.6.1685561568342;
        Wed, 31 May 2023 12:32:48 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id i12-20020a170902c94c00b001b034faf49csm1733132pla.285.2023.05.31.12.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 12:32:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1q4RYs-0017pL-AV;
	Wed, 31 May 2023 16:32:46 -0300
Date: Wed, 31 May 2023 16:32:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH 02/12] mm/pgtable: add PAE safety to __pte_offset_map()
Message-ID: <ZHeg3oRljRn6wlLX@ziepe.ca>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
 <923480d5-35ab-7cac-79d0-343d16e29318@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <923480d5-35ab-7cac-79d0-343d16e29318@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Z
 heng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Zack Rusin <zackr@vmware.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 28, 2023 at 11:16:16PM -0700, Hugh Dickins wrote:
> There is a faint risk that __pte_offset_map(), on a 32-bit architecture
> with a 64-bit pmd_t e.g. x86-32 with CONFIG_X86_PAE=y, would succeed on
> a pmdval assembled from a pmd_low and a pmd_high which never belonged
> together: their combination not pointing to a page table at all, perhaps
> not even a valid pfn.  pmdp_get_lockless() is not enough to prevent that.
> 
> Guard against that (on such configs) by local_irq_save() blocking TLB
> flush between present updates, as linux/pgtable.h suggests.  It's only
> needed around the pmdp_get_lockless() in __pte_offset_map(): a race when
> __pte_offset_map_lock() repeats the pmdp_get_lockless() after getting the
> lock, would just send it back to __pte_offset_map() again.

What about the other places calling pmdp_get_lockless ? It seems like
this is quietly making it part of the API that the caller must hold
the IPIs off.

And Jann had a note that this approach used by the lockless functions
doesn't work anyhow:

https://lore.kernel.org/linux-mm/CAG48ez3h-mnp9ZFC10v+-BW_8NQvxbwBsMYJFP8JX31o0B17Pg@mail.gmail.com/

Though we never fixed it, AFAIK..

Jason
