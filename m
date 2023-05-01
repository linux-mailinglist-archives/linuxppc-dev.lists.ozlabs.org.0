Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F14CA6F36E6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 21:29:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9CvT4JDpz3cjW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 05:29:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=eztCo5uQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=eztCo5uQ;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9Ctb3PQnz3bdm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 05:28:38 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-63f273b219eso2047801b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 May 2023 12:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969314; x=1685561314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ipls6koA+AeH8J6j2WxgUhcq4mmw5a3NH+J2RY9iS6I=;
        b=eztCo5uQgzZ++c4nibUBiIDXpS2LGO24+qSzaafIbpKx+1BibUdX3vQLCCvqCM9QaK
         k2szVsQtO5BsNtu2gEbwQ2R1Cp8SZWTwumicPfkwsEEQtcvZx+KCA7E9E8yQbBLG/+U1
         YuKydYrLelSrUvEFcJOenbExJISoaZaYCzUq7BQHSqP3uoPFqEPYIMH3FrftdGe1VnOk
         18/QJSaB/qqzmIXnj9u6ae7JwxuEe1M8it5S+Q9K46yajD+0ZkqBf7KewtfRcvygNDOo
         LlI0LPcK+WO/JxG3p9SD85FYmZExm1luEC4PEkLlS1jz538f0/tapw7EjRytIfe2E8ce
         OeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969314; x=1685561314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipls6koA+AeH8J6j2WxgUhcq4mmw5a3NH+J2RY9iS6I=;
        b=Ji0HwTk1x2r3KoXYx0fHN2YYNYcgbLqafwkX2D3SCMDEB7dTtMb9GfQg9RrZMGCaQX
         vuEj0r975f9HAfb+jb5gBtxy/8iIesU1gEmHMUocoo25Gu7gkT/0IaSPTu+3EShJSVQp
         xZQuCYTgWYOaC7RTm0vbWXPDXMLWMyNE43cCgc16f440XxhpoqN/aSC4uDekEaKYxV7H
         n04DbuU0ObyX9P1slZZM/XvEStYF+Nxwv0yAEJwaQDtBhQbC2Q3YOOig1aMRkWur3hFT
         4CGUaLLW+v/GyHSi0lgvpx+ZFQFHlTWNFRBCB+f54evWEVXrHixlymxm6CRjio54a4MK
         KUUA==
X-Gm-Message-State: AC+VfDwCDAsPjQ6uAvtLSNLXVjA2hl3KlmnS1f459+P1gVmlSGMGlK7I
	p5OhNsL3IRzrLBAyYQ0cD/c=
X-Google-Smtp-Source: ACHHUZ4EtcVpfh2GrxC12spi0fGVMtR6JEHjWCZcT25vgipN1a5chaj6S10yX1bBKRrgSrOQ8bpQcQ==
X-Received: by 2002:a17:903:2310:b0:1a6:54ce:4311 with SMTP id d16-20020a170903231000b001a654ce4311mr18428090plh.43.1682969314058;
        Mon, 01 May 2023 12:28:34 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:28:33 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v2 00/34] Split ptdesc from struct page
Date: Mon,  1 May 2023 12:27:55 -0700
Message-Id: <20230501192829.17086-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: kvm@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, linux-csky@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, xen-devel@lists.xenproject.org, Jonas Bonn <jonas@southpole.se>, Arnd Bergmann <arnd@arndb.de>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mm@kvack.org, linux-mips@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, Dinh Nguyen <dinguyen@kernel.org
 >, Richard Weinberger <richard@nod.at>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
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

This is rebased on next-20230428.

v2:
  Fix a lot of compiler warning/errors
  Moved definition of ptdesc to outside CONFIG_MMU
  Revert commit 7e25de77bc5ea which had gmap use pmd_pgtable_page()
  Allow functions to preserve const-ness where applicable
  Define folio equivalents for PAGE_TYPE_OPS page functions

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
 include/linux/mm.h                            | 138 +++++++----
 include/linux/mm_types.h                      |  14 --
 include/linux/page-flags.h                    |  20 +-
 include/linux/pgtable.h                       |  61 +++++
 mm/memory.c                                   |   8 +-
 39 files changed, 648 insertions(+), 449 deletions(-)

-- 
2.39.2

