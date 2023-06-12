Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A590F72D17C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 23:05:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=AczjUHTx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg43C3Xbzz30fG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 07:05:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=AczjUHTx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg42F3fwWz2yKy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 07:04:51 +1000 (AEST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-56d2b7a9465so15626517b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 14:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603886; x=1689195886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/6pdu881MOfYV84y7VWiKcwnRMuA78CxiUeG+tta1a0=;
        b=AczjUHTxusxNkOV7VOEz6qxIWLPwqleq1d3zEUXquo3Fhsoe1KG76B/gUTqOv/33pt
         hkZpJlkJ76KcjlL6x+InhPSbBDifa6NLLiEoUNkBXYArrGr7STcImjuc2VoeU9NxvC54
         lebWddx8WzULKd+NI5c/Uram1goESu9pTxdzE6eH38FehdYYICJ+bMuQn+ugw7AsVbL/
         Ov7eTgdYCG1Jz6kQBnoPdVHFrSKaQB695zJO8R2Ai20iELWwDV05kAAdjc5zIkHXp/c4
         vxfy2MDQ46mM15p8VfpaN3wDCzp8jtDUPX+KA7Bdo1ZYDTCwrfTMRa5pYDNMk4zv//aF
         toWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603886; x=1689195886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/6pdu881MOfYV84y7VWiKcwnRMuA78CxiUeG+tta1a0=;
        b=ct19uwmzS4eFEp9LOPv0d3zbywPbNs5EneZwwvQxWa/5YhXW0q0JftXHPqO8dreEvU
         pbVVA9+hTJigeV//+w9oJ8FICP4ljw+WzClXE5iazDj7s9TVMbaiVAg/kLLY3oryPLrL
         gywyNVlC07/oCIK/SE9i4Qs3C4HHOwmT4uJBa/JhSmUVZDJPFN1rZ36dDcmSjX8RWOgn
         uTwj1YaV/2I3NSB32lHR7rnm/H5rODh2RfUMM9fr6xyJeBmf47+f9eMQw16FuRFK4l7E
         i/bnnjWsaxDglz+hJPPw4Hc4wuQA/CW6ECEMB8UVT4o4IHYbriKL/XHJMczmplALY/gE
         r+Ow==
X-Gm-Message-State: AC+VfDyeUKfrFsMBx6K4W9dsgQyc288oJ/fLOs47/e27cG8tYGTmsp8I
	8NCBRdFgfcVLkfxqT/DDr3M=
X-Google-Smtp-Source: ACHHUZ4D/9qj+eGd5vw1y9G2WYuQd6/SQmHuMHA9sQRxkw6xMG4/k6MTzo+MEXSeyQMTFJpwz0FYww==
X-Received: by 2002:a0d:cb83:0:b0:56d:4b3:c1cd with SMTP id n125-20020a0dcb83000000b0056d04b3c1cdmr6860688ywd.40.1686603885891;
        Mon, 12 Jun 2023 14:04:45 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:04:45 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v4 00/34] Split ptdesc from struct page
Date: Mon, 12 Jun 2023 14:03:49 -0700
Message-Id: <20230612210423.18611-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
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
Cc: kvm@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, xen-devel@lists.xenproject.org, Jonas Bonn <jonas@southpole.se>, Arnd Bergmann <arnd@arndb.de>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mm@kvack.org, linux-mips@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>,
  Dinh Nguyen <dinguyen@kernel.org>, Richard Weinberger <richard@nod.at>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The MM subsystem is trying to shrink struct page. This patchset
introduces a memory descriptor for page table tracking - struct ptdesc.

This patchset introduces ptdesc, splits ptdesc from struct page, and
converts many callers of page table constructor/destructors to use ptdescs.

Ptdesc is a foundation to further standardize page tables, and eventually
allow for dynamic allocation of page tables independent of struct page.
However, the use of pages for page table tracking is quite deeply
ingrained and varied across archictectures, so there is still a lot of
work to be done before that can happen.

This is rebased on next-20230609.

v4:
  Got more Acked-bys
  Fixed m68k compilation issue
  Dropped unnecessary casts
  Cleanup some fields in struct ptdesc

Vishal Moola (Oracle) (34):
  mm: Add PAGE_TYPE_OP folio functions
  s390: Use _pt_s390_gaddr for gmap address tracking
  s390: Use pt_frag_refcount for pagetables
  pgtable: Create struct ptdesc
  mm: add utility functions for ptdesc
  mm: Convert pmd_pgtable_page() to pmd_ptdesc()
  mm: Convert ptlock_alloc() to use ptdescs
  mm: Convert ptlock_ptr() to use ptdescs
  mm: Convert pmd_ptlock_init() to use ptdescs
  mm: Convert ptlock_init() to use ptdescs
  mm: Convert pmd_ptlock_free() to use ptdescs
  mm: Convert ptlock_free() to use ptdescs
  mm: Create ptdesc equivalents for pgtable_{pte,pmd}_page_{ctor,dtor}
  powerpc: Convert various functions to use ptdescs
  x86: Convert various functions to use ptdescs
  s390: Convert various gmap functions to use ptdescs
  s390: Convert various pgalloc functions to use ptdescs
  mm: Remove page table members from struct page
  pgalloc: Convert various functions to use ptdescs
  arm: Convert various functions to use ptdescs
  arm64: Convert various functions to use ptdescs
  csky: Convert __pte_free_tlb() to use ptdescs
  hexagon: Convert __pte_free_tlb() to use ptdescs
  loongarch: Convert various functions to use ptdescs
  m68k: Convert various functions to use ptdescs
  mips: Convert various functions to use ptdescs
  nios2: Convert __pte_free_tlb() to use ptdescs
  openrisc: Convert __pte_free_tlb() to use ptdescs
  riscv: Convert alloc_{pmd, pte}_late() to use ptdescs
  sh: Convert pte_free_tlb() to use ptdescs
  sparc64: Convert various functions to use ptdescs
  sparc: Convert pgtable_pte_page_{ctor, dtor}() to ptdesc equivalents
  um: Convert {pmd, pte}_free_tlb() to use ptdescs
  mm: Remove pgtable_{pmd, pte}_page_{ctor, dtor}() wrappers

 Documentation/mm/split_page_table_lock.rst    |  12 +-
 .../zh_CN/mm/split_page_table_lock.rst        |  14 +-
 arch/arm/include/asm/tlb.h                    |  12 +-
 arch/arm/mm/mmu.c                             |   6 +-
 arch/arm64/include/asm/tlb.h                  |  14 +-
 arch/arm64/mm/mmu.c                           |   7 +-
 arch/csky/include/asm/pgalloc.h               |   4 +-
 arch/hexagon/include/asm/pgalloc.h            |   8 +-
 arch/loongarch/include/asm/pgalloc.h          |  27 ++-
 arch/loongarch/mm/pgtable.c                   |   7 +-
 arch/m68k/include/asm/mcf_pgalloc.h           |  41 ++--
 arch/m68k/include/asm/sun3_pgalloc.h          |   8 +-
 arch/m68k/mm/motorola.c                       |   4 +-
 arch/mips/include/asm/pgalloc.h               |  31 +--
 arch/mips/mm/pgtable.c                        |   7 +-
 arch/nios2/include/asm/pgalloc.h              |   8 +-
 arch/openrisc/include/asm/pgalloc.h           |   8 +-
 arch/powerpc/mm/book3s64/mmu_context.c        |  10 +-
 arch/powerpc/mm/book3s64/pgtable.c            |  32 +--
 arch/powerpc/mm/pgtable-frag.c                |  46 ++--
 arch/riscv/include/asm/pgalloc.h              |   8 +-
 arch/riscv/mm/init.c                          |  16 +-
 arch/s390/include/asm/pgalloc.h               |   4 +-
 arch/s390/include/asm/tlb.h                   |   4 +-
 arch/s390/mm/gmap.c                           | 222 +++++++++++-------
 arch/s390/mm/pgalloc.c                        | 126 +++++-----
 arch/sh/include/asm/pgalloc.h                 |   9 +-
 arch/sparc/mm/init_64.c                       |  17 +-
 arch/sparc/mm/srmmu.c                         |   5 +-
 arch/um/include/asm/pgalloc.h                 |  18 +-
 arch/x86/mm/pgtable.c                         |  46 ++--
 arch/x86/xen/mmu_pv.c                         |   2 +-
 include/asm-generic/pgalloc.h                 |  62 +++--
 include/asm-generic/tlb.h                     |  11 +
 include/linux/mm.h                            | 155 ++++++++----
 include/linux/mm_types.h                      |  14 --
 include/linux/page-flags.h                    |  20 +-
 include/linux/pgtable.h                       |  60 +++++
 mm/memory.c                                   |   8 +-
 39 files changed, 664 insertions(+), 449 deletions(-)

-- 
2.40.1

