Return-Path: <linuxppc-dev+bounces-4803-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0DEA0537C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 07:59:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSf0n2hWPz2xHl;
	Wed,  8 Jan 2025 17:59:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1032"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736319561;
	cv=none; b=AjTF4jIWX3PPMIh87m7VszeM1ZzmmnpqfO9zCqcOPUv1pS4dhKh2LjdsLcZcfxWRgzE6gZfLHMH4UqosbMzfx9kQwtL6GAbx+6K77vNsWY3Be8BGJLE8/nYDz9wkVNbZePCJ0xuUm/i1bRgMNKxpyWVt3IZoT6FgQw6R7v0q/kMCTEYVgmTanmnrXgO+ovu7JjoObGZfes6LBUxE9jJ00ZjcGfsmOZO3CU8Epe+Be9jqXfbKAlGbhEIfk3c19XcSMTvy1ehatjvmHez3/A1g4NWN7L6tE+4KgGxT3mmpxRTiqKywoCvtAtklKnuu+SvL4OpM6OMjAVEzU+qW5b5i/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736319561; c=relaxed/relaxed;
	bh=+oUJziA+3SIeve9hH8p/SUshEWFM4XR7pFGccDfjKoA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X+LJDuHPUHwGpZmqPss5U9Crmtm0F48P809mdnl3CYqBSbFQOFqyI27uJL21iyEd7eVpfQOBARCKgCg8YEjRksp/JxHrAksU6+Jc5OwaC+8iOvgLf/hI2LoKNAvZ9gCj1+p7Xtt3JcgUC3PP2SqmwG+7gLaS9qRS9ZANmdO4Th9gqo/wyQB9Y1D6giMNH99PUEHf4VfbV9SfUtVNv4zSnADq38v+3dolwGOMde5JtAOwT4+ANv7C6n5EJ/NtW0WXdDqaZ4RFeXqqRP7YZ5dCJ/7W+0d9KOrMGPuD5Ln5OwGYTv1j38pKEWR4j8S8boCYI7V3Syn57qOdOTqPW3cJcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=W5ApThJi; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=W5ApThJi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSf0l3r1Bz2xnS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 17:59:17 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ee709715d9so19468740a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 22:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319555; x=1736924355; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+oUJziA+3SIeve9hH8p/SUshEWFM4XR7pFGccDfjKoA=;
        b=W5ApThJiMS198RzffOOuLEHo5DSNPJ20xQN2F0S6qwIcFCdqwBLxr4z41eL6+mU4r6
         5U3lOrD+hvPe3pge0ZI+J9v8DI1q1FkEMRBr054w35ByTWgLjZfav389sdMr7/1DCHQv
         H3GQ59z/UeqOJja2VaNVuH7szaA78Gzw+A9cLhCFu1g+Q6epdNL4cU0kBhQIGUgiahnA
         ggufbYLL5RGFOCsl3T6xwkL3qa86WpmHrqe3Vw720dzkd3/I0Jut1ji6f55Nv8WiF1Qx
         1gT5iwqkyyzL5MAkmFZgYAj3HJc6O7s1pMa7F98ozX1s7z0HpdxR7qRk2ckh9CVT3gjr
         XZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319555; x=1736924355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+oUJziA+3SIeve9hH8p/SUshEWFM4XR7pFGccDfjKoA=;
        b=hMrQZUwfH4K7dfirrfDSjyaf20rF6R1Y8vXGOno4b8Z0K804gpzurSLDMxIJg97aVa
         aOYtwc/5/LbQ9GcjIetduGui19sGdeJlf6ttOENvV1Hbb0T8RlSq1atkXUR8+OYr4+vk
         iVaScWyYRtqTX9ARIEgxfhAZ3AleKcscJw1GOaniQ9PsdLt2TjHiuZ1iHhYOcNNQ9OSq
         OCXlYzh/aKHZHd/3Lsjt85XD5QZjizF+Txhbbdl2P6WzhLxMkBKM/2fmcOcpq//8iPmV
         m9dvgMar+wwGCXQITYm2xxMOl/+MzSmRfiGGaBdAHYVoXlZ6ydfXRO8Ndxx7NlWYejgE
         xmMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8DWyLrJ9k+dxEiqdasrUMMqLekxEMdBxAvMiLqZp1srE3+lP1k5zIeOvGEqEN+1hgHcP5TePQjOs2lRw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyxp+VooD/JkU+cLXEWaiQp74Zq+bA2qyw3kVCmfQMGIdAjj8SD
	aIBYHUyLK+F+SDB2SNx5kXZCW6cqjU3a0GF9fTIWSx2/28pTRtUMXTfy4Uskbdc=
X-Gm-Gg: ASbGncstbXGqGuYG4NZhe+DZzfoiXgAX5BRUsdZdeTVk16SSq+9xl5oyu+cexeNFEgK
	ogx/5L3wtJ1ksCFcH895YKXqcZ5dsjAvqp3MV3CLLBbYKvicEIF8vqQFkUfzn33XQXq+i3RpSCe
	zcR22IiYGyIeivMnE2htbx6dh65eKSr4AtqWz5R3YBca2WHKrbHRNBpbJFh8lSa1fz9dJpCyOVt
	J9WOG06abKfpn8XcZZemEQ7VH7HIaWbsvFYtXjWozWx5N3aWiZWwWHUQ3FOweZnehKssIEwyZXS
	wTromnE1+HaZCX14lvZppGn44Vw=
X-Google-Smtp-Source: AGHT+IF0KICf2IpNdbhCgJ/4FLwWodDPqZ+kJ6jQ+m3hTC2SCt6RG6Dd8PQChw/e3cG7DLZH3PR19A==
X-Received: by 2002:a17:90b:4d05:b0:2ee:f80c:6884 with SMTP id 98e67ed59e1d1-2f548f426ccmr2612187a91.33.1736319554907;
        Tue, 07 Jan 2025 22:59:14 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.22.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 22:59:14 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	alex@ghiti.fr,
	andreas@gaisler.com,
	palmer@dabbelt.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v5 00/17] move pagetable_*_dtor() to __tlb_remove_table()
Date: Wed,  8 Jan 2025 14:57:16 +0800
Message-Id: <cover.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Changes in v5:
 - cancel the move of p4d_free_tlb()'s location in [PATCH v4 06/15]
   (Alexander Gordeev)
 - fix the missing pagetable_dtor() in [PATCH v4 08/15] (Kevin Brodsky)
 - change the subject and description in [PATCH v4 12/15]
   (Alexander Gordeev)
 - remove the redundant __HAVE_ARCH_TLB_REMOVE_TABLE definition in [PATCH v4 13/15]
   (Andreas Larsson)
 - add "mm: pgtable: completely move pagetable_dtor() to generic tlb_remove_table()"
   (Kevin Brodsky)
 - add "x86: pgtable: convert __tlb_remove_table() to use struct ptdesc"
 - collect Acked-bys and Reviewed-bys

Changes in v4:
 - remove [PATCH v3 15/17] and [PATCH v3 16/17] (Mike Rapoport)
   (the tlb_remove_page_ptdesc() and tlb_remove_ptdesc() are intermediate
    products of the project: https://kernelnewbies.org/MatthewWilcox/Memdescs,
    so keep them)
 - collect Acked-by

Changes in v3:
 - take patch #5 and #6 from Kevin Brodsky's patch series below.
   Link: https://lore.kernel.org/lkml/20241219164425.2277022-1-kevin.brodsky@arm.com/
 - separate the statistics part from [PATCH v2 02/15] as [PATCH v3 04/17], and
   replace the rest part with Kevin Brodsky's patch #6
   (Alexander Gordeev and Kevin Brodsky)
 - change the commit message of [PATCH v2 10/15] and [PATCH v2 11/15]
   (Alexander Gordeev)
 - fix the bug introduced by [PATCH v2 11/15]
   (Peter Zijlstra)
 - rebase onto the next-20241220

Changes in v2:
 - add [PATCH v2 13|14|15/15] (suggested by Peter Zijlstra)
 - add Originally-bys and Suggested-bys
 - rebase onto the next-20241218

Hi all,

As proposed [1] by Peter Zijlstra below, this patch series aims to move
pagetable_*_dtor() into __tlb_remove_table(). This will cleanup pagetable_*_dtor()
a bit and more gracefully fix the UAF issue [2] reported by syzbot.

```
Notably:

 - s390 pud isn't calling the existing pagetable_pud_[cd]tor()
 - none of the p4d things have pagetable_p4d_[cd]tor() (x86,arm64,s390,riscv)
   and they have inconsistent accounting
 - while much of the _ctor calls are in generic code, many of the _dtor
   calls are in arch code for hysterial raisins, this could easily be
   fixed
 - if we fix ptlock_free() to handle NULL, then all the _dtor()
   functions can use it, and we can observe they're all identical
   and can be folded

after all that cleanup, you can move the _dtor from *_free_tlb() into
tlb_remove_table() -- which for the above case, would then have it
called from __tlb_remove_table_free().
```

And hi Andrew, I developed the code based on the latest linux-next, so I reverted
the "mm: pgtable: make ptlock be freed by RCU" first. Once the review of this
patch series is completed, the "mm: pgtable: make ptlock be freed by RCU" can be
dropped directly from mm tree, and this revert patch will not be needed.

This series is based on next-20241220. And I tested this patch series on x86 and
only cross-compiled it on arm, arm64, powerpc, riscv, s390 and sparc.

Comments and suggestions are welcome!

Thanks,
Qi

[1]. https://lore.kernel.org/all/20241211133433.GC12500@noisy.programming.kicks-ass.net/
[2]. https://lore.kernel.org/all/67548279.050a0220.a30f1.015b.GAE@google.com/

Kevin Brodsky (2):
  riscv: mm: Skip pgtable level check in {pud,p4d}_alloc_one
  asm-generic: pgalloc: Provide generic p4d_{alloc_one,free}

Qi Zheng (15):
  Revert "mm: pgtable: make ptlock be freed by RCU"
  mm: pgtable: add statistics for P4D level page table
  arm64: pgtable: use mmu gather to free p4d level page table
  s390: pgtable: add statistics for PUD and P4D level page table
  mm: pgtable: introduce pagetable_dtor()
  arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
  arm64: pgtable: move pagetable_dtor() to __tlb_remove_table()
  riscv: pgtable: move pagetable_dtor() to __tlb_remove_table()
  x86: pgtable: convert __tlb_remove_table() to use struct ptdesc
  x86: pgtable: move pagetable_dtor() to __tlb_remove_table()
  s390: pgtable: consolidate PxD and PTE TLB free paths
  mm: pgtable: introduce generic __tlb_remove_table()
  mm: pgtable: completely move pagetable_dtor() to generic
    tlb_remove_table()
  mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
  mm: pgtable: introduce generic pagetable_dtor_free()

 Documentation/mm/split_page_table_lock.rst |  4 +-
 arch/arm/include/asm/tlb.h                 | 10 ----
 arch/arm64/include/asm/pgalloc.h           | 18 ------
 arch/arm64/include/asm/tlb.h               | 21 ++++---
 arch/csky/include/asm/pgalloc.h            |  2 +-
 arch/hexagon/include/asm/pgalloc.h         |  2 +-
 arch/loongarch/include/asm/pgalloc.h       |  2 +-
 arch/m68k/include/asm/mcf_pgalloc.h        |  4 +-
 arch/m68k/include/asm/sun3_pgalloc.h       |  2 +-
 arch/m68k/mm/motorola.c                    |  2 +-
 arch/mips/include/asm/pgalloc.h            |  2 +-
 arch/nios2/include/asm/pgalloc.h           |  2 +-
 arch/openrisc/include/asm/pgalloc.h        |  2 +-
 arch/powerpc/include/asm/tlb.h             |  1 +
 arch/powerpc/mm/book3s64/mmu_context.c     |  2 +-
 arch/powerpc/mm/book3s64/pgtable.c         |  2 +-
 arch/powerpc/mm/pgtable-frag.c             |  4 +-
 arch/riscv/include/asm/pgalloc.h           | 69 +++++-----------------
 arch/riscv/include/asm/tlb.h               | 18 ------
 arch/riscv/mm/init.c                       |  4 +-
 arch/s390/include/asm/pgalloc.h            | 31 +++++++---
 arch/s390/include/asm/tlb.h                | 10 ++--
 arch/s390/mm/pgalloc.c                     | 23 +-------
 arch/sh/include/asm/pgalloc.h              |  2 +-
 arch/sparc/include/asm/tlb_64.h            |  1 +
 arch/sparc/mm/init_64.c                    |  2 +-
 arch/sparc/mm/srmmu.c                      |  2 +-
 arch/um/include/asm/pgalloc.h              |  6 +-
 arch/x86/include/asm/pgalloc.h             | 18 ------
 arch/x86/include/asm/tlb.h                 | 33 -----------
 arch/x86/kernel/paravirt.c                 |  5 +-
 arch/x86/mm/pgtable.c                      | 23 ++++----
 include/asm-generic/pgalloc.h              | 55 +++++++++++++++--
 include/asm-generic/tlb.h                  | 24 ++++++--
 include/linux/mm.h                         | 50 ++++++----------
 include/linux/mm_types.h                   |  9 +--
 mm/memory.c                                | 23 +++-----
 mm/mmu_gather.c                            | 20 ++++++-
 38 files changed, 211 insertions(+), 299 deletions(-)

-- 
2.20.1


