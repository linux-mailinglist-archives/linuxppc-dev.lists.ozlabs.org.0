Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E1DD78F3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 16:43:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46syq34CjLzDr5N
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 01:43:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="AtgdjehM"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46symy2FRNzDqnc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 01:41:51 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id v52so30870799qtb.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 07:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KOthtKc750ha5x4f9O1nDtFHxGzvuirdOiPTMzSqTsk=;
 b=AtgdjehMIW2BLhP3jeK/qmKXq2+AXxzyWeIH6bKw4O3o0bC6XJQt+cAWIC0yMh6wiP
 SupmvGOupyWxPBHXOSFIRoapYlzZ1hYO8VI7pDOCxTY/Dx1Dgrvi2XOEp2yl+LhIOEHT
 u2tYUEb7UC7Y+OmoO377QG3dWxUE+13skl13Dwf1FBQ4rIPA/dbKnr+HRCDUS7FZtcdV
 L3b45BZgHc50mOaywiqTTOXCkKt7paRreX5ny4ScY/osK3vBY9jN0JO82EN8FpMzG1Nn
 DuZelOJa5PuYyzq9v5gfHBe8i4OKeqTjui1sMrU6aselqYDmxj1po/GPeKBXBAMZGEJa
 1g3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KOthtKc750ha5x4f9O1nDtFHxGzvuirdOiPTMzSqTsk=;
 b=RqSz8rMeXQRFeFGM5d42IpttYIEF/Ts/8jEV+4oUwUUSEmJG2rZRXJfRwG1lHNrvog
 zQ/4sRPgZq63MfoN4+YjPTF8f8cAdocMGJb8C12Ak47dEU043+UBOGhz69/uo3XzYfcc
 Z4GmrkB0g10ulq+y9RX3TTFrQzNByciusGwFk2AeA05RKr7rj/e9c5qCu3g/qHPGZKCk
 5emxl2zWJ8zkqXcl7gWVks85SUZVm+4LWTGJzA4HogQKpJAcs++zYqU82e2OCAWh4s6P
 GmycNDrF81jOF6TmHYhrj8qTzMApFccvkA5JNpgODWJ2/j8dy5uMX8pCiIE1duOoZfZA
 XCJw==
X-Gm-Message-State: APjAAAXCDv82KHBWQaUdSv7nmcRp3hf0uKoZkw00PM8TNv2jjeDZSVBI
 f0Fnj/eHNAT1trGSYP19x9SYCg==
X-Google-Smtp-Source: APXvYqz1jaDLsZXCujEQqKw2NmGGpxtStBi3XubJKmoqx4STHaHJWThY1IvGZuOPXBVemA+XaCvAzg==
X-Received: by 2002:ac8:6ede:: with SMTP id f30mr38381128qtv.205.1571150507816; 
 Tue, 15 Oct 2019 07:41:47 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id z200sm10605390qkb.5.2019.10.15.07.41.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Oct 2019 07:41:47 -0700 (PDT)
Message-ID: <1571150502.5937.39.camel@lca.pw>
Subject: Re: [PATCH V6 0/2] mm/debug: Add tests validating architecture page
 table helpers
From: Qian Cai <cai@lca.pw>
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Date: Tue, 15 Oct 2019 10:41:42 -0400
In-Reply-To: <1571131302-32290-1-git-send-email-anshuman.khandual@arm.com>
References: <1571131302-32290-1-git-send-email-anshuman.khandual@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Michal Hocko <mhocko@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The x86 will crash with linux-next during boot due to this series (v5) with the
config below plus CONFIG_DEBUG_VM_PGTABLE=y. I am not sure if v6 would address
it.

https://raw.githubusercontent.com/cailca/linux-mm/master/x86.config

[   33.862600][    T1] page:ffffea0009000000 is uninitialized and poisoned
[   33.862608][    T1] raw: ffffffffffffffff ffffffffffffffff ffffffffffffffff
ffffff871140][    T1]  ? _raw_spin_unlock_irq+0x27/0x40
[   33.871140][    T1]  ? rest_init+0x307/0x307
[   33.871140][    T1]  kernel_init+0x11/0x139
[   33.871140][    T1]  ? rest_init+0x307/0x307
[   33.871140][    T1]  ret_from_fork+0x27/0x50
[   33.871140][    T1] Modules linked in:
[   33.871140][    T1] ---[ end trace e99d392b0f7befbd ]---
[   33.871140][    T1] RIP: 0010:alloc_gigantic_page_order+0x3fe/0x490

On Tue, 2019-10-15 at 14:51 +0530, Anshuman Khandual wrote:
> This series adds a test validation for architecture exported page table
> helpers. Patch in the series adds basic transformation tests at various
> levels of the page table. Before that it exports gigantic page allocation
> function from HugeTLB.
> 
> This test was originally suggested by Catalin during arm64 THP migration
> RFC discussion earlier. Going forward it can include more specific tests
> with respect to various generic MM functions like THP, HugeTLB etc and
> platform specific tests.
> 
> https://lore.kernel.org/linux-mm/20190628102003.GA56463@arrakis.emea.arm.com/
> 
> Changes in V6:
> 
> - Moved alloc_gigantic_page_order() into mm/page_alloc.c per Michal
> - Moved alloc_gigantic_page_order() within CONFIG_CONTIG_ALLOC in the test
> - Folded Andrew's include/asm-generic/pgtable.h fix into the test patch 2/2
> 
> Changes in V5: (https://patchwork.kernel.org/project/linux-mm/list/?series=185991)
> 
> - Redefined and moved X86 mm_p4d_folded() into a different header per Kirill/Ingo
> - Updated the config option comment per Ingo and dropped 'kernel module' reference
> - Updated the commit message and dropped 'kernel module' reference
> - Changed DEBUG_ARCH_PGTABLE_TEST into DEBUG_VM_PGTABLE per Ingo
> - Moved config option from mm/Kconfig.debug into lib/Kconfig.debug
> - Renamed core test function arch_pgtable_tests() as debug_vm_pgtable()
> - Renamed mm/arch_pgtable_test.c as mm/debug_vm_pgtable.c
> - debug_vm_pgtable() gets called from kernel_init_freeable() after init_mm_internals()
> - Added an entry in Documentation/features/debug/ per Ingo
> - Enabled the test on arm64 and x86 platforms for now
> 
> Changes in V4: (https://patchwork.kernel.org/project/linux-mm/list/?series=183465)
> 
> - Disable DEBUG_ARCH_PGTABLE_TEST for ARM and IA64 platforms
> 
> Changes in V3: (https://lore.kernel.org/patchwork/project/lkml/list/?series=411216)
> 
> - Changed test trigger from module format into late_initcall()
> - Marked all functions with __init to be freed after completion
> - Changed all __PGTABLE_PXX_FOLDED checks as mm_pxx_folded()
> - Folded in PPC32 fixes from Christophe
> 
> Changes in V2:
> 
> https://lore.kernel.org/linux-mm/1568268173-31302-1-git-send-email-anshuman.khandual@arm.com/T/#t
> 
> - Fixed small typo error in MODULE_DESCRIPTION()
> - Fixed m64k build problems for lvalue concerns in pmd_xxx_tests()
> - Fixed dynamic page table level folding problems on x86 as per Kirril
> - Fixed second pointers during pxx_populate_tests() per Kirill and Gerald
> - Allocate and free pte table with pte_alloc_one/pte_free per Kirill
> - Modified pxx_clear_tests() to accommodate s390 lower 12 bits situation
> - Changed RANDOM_NZVALUE value from 0xbe to 0xff
> - Changed allocation, usage, free sequence for saved_ptep
> - Renamed VMA_FLAGS as VMFLAGS
> - Implemented a new method for random vaddr generation
> - Implemented some other cleanups
> - Dropped extern reference to mm_alloc()
> - Created and exported new alloc_gigantic_page_order()
> - Dropped the custom allocator and used new alloc_gigantic_page_order()
> 
> Changes in V1:
> 
> https://lore.kernel.org/linux-mm/1567497706-8649-1-git-send-email-anshuman.khandual@arm.com/
> 
> - Added fallback mechanism for PMD aligned memory allocation failure
> 
> Changes in RFC V2:
> 
> https://lore.kernel.org/linux-mm/1565335998-22553-1-git-send-email-anshuman.khandual@arm.com/T/#u
> 
> - Moved test module and it's config from lib/ to mm/
> - Renamed config TEST_ARCH_PGTABLE as DEBUG_ARCH_PGTABLE_TEST
> - Renamed file from test_arch_pgtable.c to arch_pgtable_test.c
> - Added relevant MODULE_DESCRIPTION() and MODULE_AUTHOR() details
> - Dropped loadable module config option
> - Basic tests now use memory blocks with required size and alignment
> - PUD aligned memory block gets allocated with alloc_contig_range()
> - If PUD aligned memory could not be allocated it falls back on PMD aligned
>   memory block from page allocator and pud_* tests are skipped
> - Clear and populate tests now operate on real in memory page table entries
> - Dummy mm_struct gets allocated with mm_alloc()
> - Dummy page table entries get allocated with [pud|pmd|pte]_alloc_[map]()
> - Simplified [p4d|pgd]_basic_tests(), now has random values in the entries
> 
> Original RFC V1:
> 
> https://lore.kernel.org/linux-mm/1564037723-26676-1-git-send-email-anshuman.khandual@arm.com/
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Steven Price <Steven.Price@arm.com>
> Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Sri Krishna chowdary <schowdary@nvidia.com>
> Cc: Dave Hansen <dave.hansen@intel.com>
> Cc: Russell King - ARM Linux <linux@armlinux.org.uk>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: James Hogan <jhogan@kernel.org>
> Cc: Paul Burton <paul.burton@mips.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Kirill A. Shutemov <kirill@shutemov.name>
> Cc: Gerald Schaefer <gerald.schaefer@de.ibm.com>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-ia64@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: x86@kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> 
> Anshuman Khandual (2):
>   mm/page_alloc: Make alloc_gigantic_page() available for general use
>   mm/debug: Add tests validating architecture page table helpers
> 
>  .../debug/debug-vm-pgtable/arch-support.txt   |  34 ++
>  arch/arm64/Kconfig                            |   1 +
>  arch/x86/Kconfig                              |   1 +
>  arch/x86/include/asm/pgtable_64.h             |   6 +
>  include/asm-generic/pgtable.h                 |   6 +
>  include/linux/gfp.h                           |   3 +
>  init/main.c                                   |   1 +
>  lib/Kconfig.debug                             |  21 +
>  mm/Makefile                                   |   1 +
>  mm/debug_vm_pgtable.c                         | 450 ++++++++++++++++++
>  mm/hugetlb.c                                  |  76 +--
>  mm/page_alloc.c                               |  98 ++++
>  12 files changed, 623 insertions(+), 75 deletions(-)
>  create mode 100644 Documentation/features/debug/debug-vm-pgtable/arch-support.txt
>  create mode 100644 mm/debug_vm_pgtable.c
> 
