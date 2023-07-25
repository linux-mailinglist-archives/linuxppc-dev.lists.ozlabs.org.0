Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7B37608E4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 06:49:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=syg9IyMH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R94MT2MdLz3dH0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 14:49:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=syg9IyMH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R94B54xtrz3fjn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 14:41:48 +1000 (AEST)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d0b597e7ac1so2729928276.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 21:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690260106; x=1690864906;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4tFc7lI8l/TAp6N4SH/RnjHMrhDjcjpOS0NvhRjK3tI=;
        b=syg9IyMH/gqJY1k4LT3S6JMx0fSLcgE37Cs+8KWCUO35fKCYg0MuLIIi0nsu37jtyV
         JWnNbNndjflxoqEknhV3drMoPO1rLP5Mf2NwuEGG3uNqc6WCc3lC70F16ZnEeLC+MDXA
         tlBtkvCExRePxNsWSrYSlIqtWo9fJaFXM7OzUrScUdzQ6XIpjZwJMknKg/XaSKKfA+Pp
         NHjPm93xL9xpQDR+q+3gjlysNDu5FD2n2xMli6SN590GUy6WkS3ghg4fMC/PcVORHv0z
         7pZwaHoSCWcs0DC0U/7aDMkjw3lDyZjRkGaSMnnCoKZ6Eh2nJ1AJW7AcIEll2MImoPAy
         2Dhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690260106; x=1690864906;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4tFc7lI8l/TAp6N4SH/RnjHMrhDjcjpOS0NvhRjK3tI=;
        b=bV9sN+WG/nGwuUxnOC5l17m2PsN3NjKFIXbjFsLUIji3JHqUhOg3LB1L4IG5+UP+tI
         CRw+LXO5962L58WGt+KT2cecwR68Tj8AGGsCPoZ1yWNoP4puMsQlNybsAxiwjYw0xNoE
         mva2CfWxj6E8d8ScVotbXHmWxpEEZYs4dzEBGTzW7SBbKbBSpENkfuwelAgIc+tNgDIg
         pvN07+JgGDEDbEZwrzHsp04tO8H7XajkRzE5ibrefzBmZKjANOcb3yzWlkPJZuZcz0n5
         9Fbmk75EMIYoQEC1wYw5XfDEfF85N+kp4vcGEXeH0apzXZ0ZYx3gi+DOaqFkUppt3UzZ
         2sDQ==
X-Gm-Message-State: ABy/qLbAzDp+jdoZ3Ox4RZlloOs6Ih2h0eIHJTp+GObOZTn0I/eoTzMj
	/9j36nuPr2VcUXDVfhnBv7Cjjw==
X-Google-Smtp-Source: APBJJlHQLTh3cgEYO+DVAD/fw8XSxxaq77z0mK7JibK/JjnN3wjA/kyDdlXYpJW7FLCpf9E01rW5SQ==
X-Received: by 2002:a25:2342:0:b0:d0d:2d17:3f11 with SMTP id j63-20020a252342000000b00d0d2d173f11mr5304231ybj.17.1690260106082;
        Mon, 24 Jul 2023 21:41:46 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id z16-20020a25e310000000b00c71e4833957sm2656725ybd.63.2023.07.24.21.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 21:41:45 -0700 (PDT)
Date: Mon, 24 Jul 2023 21:41:36 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: Re: [PATCH mm-unstable v7 00/31] Split ptdesc from struct page
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
Message-ID: <5296514f-cdd1-9526-2e83-a21e76e86e5@google.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: kvm@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, linux-openrisc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, xen-devel@lists.xenproject.org, Jonas Bonn <jonas@southpole.se>, Arnd Bergmann <arnd@arndb.de>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mm@kvack.org, linux-mips@vger.kernel.org, Dinh Nguyen <
 dinguyen@kernel.org>, Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 24 Jul 2023, Vishal Moola (Oracle) wrote:

> The MM subsystem is trying to shrink struct page. This patchset
> introduces a memory descriptor for page table tracking - struct ptdesc.
> 
> This patchset introduces ptdesc, splits ptdesc from struct page, and
> converts many callers of page table constructor/destructors to use ptdescs.
> 
> Ptdesc is a foundation to further standardize page tables, and eventually
> allow for dynamic allocation of page tables independent of struct page.
> However, the use of pages for page table tracking is quite deeply
> ingrained and varied across archictectures, so there is still a lot of
> work to be done before that can happen.

Others may differ, but it remains the case that I see no point to this
patchset, until the minimal descriptor that replaces struct page is
working, and struct page then becomes just overhead.  Until that time,
let architectures continue to use struct page as they do - whyever not?

Hugh

> 
> This is rebased on mm-unstable.
> 
> v7:
>   Drop s390 gmap ptdesc conversions - gmap is unecessary complication
>     that can be dealt with later
>   Be more thorough with ptdesc struct sanity checks and comments
>   Rebase onto mm-unstable
> 
> Vishal Moola (Oracle) (31):
>   mm: Add PAGE_TYPE_OP folio functions
>   pgtable: Create struct ptdesc
>   mm: add utility functions for ptdesc
>   mm: Convert pmd_pgtable_page() callers to use pmd_ptdesc()
>   mm: Convert ptlock_alloc() to use ptdescs
>   mm: Convert ptlock_ptr() to use ptdescs
>   mm: Convert pmd_ptlock_init() to use ptdescs
>   mm: Convert ptlock_init() to use ptdescs
>   mm: Convert pmd_ptlock_free() to use ptdescs
>   mm: Convert ptlock_free() to use ptdescs
>   mm: Create ptdesc equivalents for pgtable_{pte,pmd}_page_{ctor,dtor}
>   powerpc: Convert various functions to use ptdescs
>   x86: Convert various functions to use ptdescs
>   s390: Convert various pgalloc functions to use ptdescs
>   mm: Remove page table members from struct page
>   pgalloc: Convert various functions to use ptdescs
>   arm: Convert various functions to use ptdescs
>   arm64: Convert various functions to use ptdescs
>   csky: Convert __pte_free_tlb() to use ptdescs
>   hexagon: Convert __pte_free_tlb() to use ptdescs
>   loongarch: Convert various functions to use ptdescs
>   m68k: Convert various functions to use ptdescs
>   mips: Convert various functions to use ptdescs
>   nios2: Convert __pte_free_tlb() to use ptdescs
>   openrisc: Convert __pte_free_tlb() to use ptdescs
>   riscv: Convert alloc_{pmd, pte}_late() to use ptdescs
>   sh: Convert pte_free_tlb() to use ptdescs
>   sparc64: Convert various functions to use ptdescs
>   sparc: Convert pgtable_pte_page_{ctor, dtor}() to ptdesc equivalents
>   um: Convert {pmd, pte}_free_tlb() to use ptdescs
>   mm: Remove pgtable_{pmd, pte}_page_{ctor, dtor}() wrappers
> 
>  Documentation/mm/split_page_table_lock.rst    |  12 +-
>  .../zh_CN/mm/split_page_table_lock.rst        |  14 +-
>  arch/arm/include/asm/tlb.h                    |  12 +-
>  arch/arm/mm/mmu.c                             |   7 +-
>  arch/arm64/include/asm/tlb.h                  |  14 +-
>  arch/arm64/mm/mmu.c                           |   7 +-
>  arch/csky/include/asm/pgalloc.h               |   4 +-
>  arch/hexagon/include/asm/pgalloc.h            |   8 +-
>  arch/loongarch/include/asm/pgalloc.h          |  27 ++--
>  arch/loongarch/mm/pgtable.c                   |   7 +-
>  arch/m68k/include/asm/mcf_pgalloc.h           |  47 +++---
>  arch/m68k/include/asm/sun3_pgalloc.h          |   8 +-
>  arch/m68k/mm/motorola.c                       |   4 +-
>  arch/mips/include/asm/pgalloc.h               |  32 ++--
>  arch/mips/mm/pgtable.c                        |   8 +-
>  arch/nios2/include/asm/pgalloc.h              |   8 +-
>  arch/openrisc/include/asm/pgalloc.h           |   8 +-
>  arch/powerpc/mm/book3s64/mmu_context.c        |  10 +-
>  arch/powerpc/mm/book3s64/pgtable.c            |  32 ++--
>  arch/powerpc/mm/pgtable-frag.c                |  56 +++----
>  arch/riscv/include/asm/pgalloc.h              |   8 +-
>  arch/riscv/mm/init.c                          |  16 +-
>  arch/s390/include/asm/pgalloc.h               |   4 +-
>  arch/s390/include/asm/tlb.h                   |   4 +-
>  arch/s390/mm/pgalloc.c                        | 128 +++++++--------
>  arch/sh/include/asm/pgalloc.h                 |   9 +-
>  arch/sparc/mm/init_64.c                       |  17 +-
>  arch/sparc/mm/srmmu.c                         |   5 +-
>  arch/um/include/asm/pgalloc.h                 |  18 +--
>  arch/x86/mm/pgtable.c                         |  47 +++---
>  arch/x86/xen/mmu_pv.c                         |   2 +-
>  include/asm-generic/pgalloc.h                 |  88 +++++-----
>  include/asm-generic/tlb.h                     |  11 ++
>  include/linux/mm.h                            | 151 +++++++++++++-----
>  include/linux/mm_types.h                      |  18 ---
>  include/linux/page-flags.h                    |  30 +++-
>  include/linux/pgtable.h                       |  80 ++++++++++
>  mm/memory.c                                   |   8 +-
>  38 files changed, 585 insertions(+), 384 deletions(-)
> 
> -- 
> 2.40.1
