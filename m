Return-Path: <linuxppc-dev+bounces-4525-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 241F69FE452
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2024 10:10:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YM9Kv6Jzvz2ynn;
	Mon, 30 Dec 2024 20:10:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735549811;
	cv=none; b=mmAoNW0BN+JlIIjMvqMVjAkz7ggd77yR9HQXaP/9bVuRD7+G56IJw4IExFd57njgqAKRDvd1mT+wPvyzEsAR+hgizUq7pexC9ONRZYmBKhSDC060drOxC02LsPWna7s8naFlEzFBssx+Cde83U4Ed6KMWHAFRFipXoX3AMMmf1OasUh3yLzczI3HsVHk/Pfg0C4D/EZEvKr/lrFr+z6j8Ti+Pj5kFM9Hsa7yIePV01r1EkUv37nuljO4Qmc4zUE63AK/IWgyWe1vJmlKu0tljjdwz6TnT/GJ4T9JeCiOkLFyTV5vv+h+5hmi8fIau9tE+4YOs8hixzJsZf5z5/hpsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735549811; c=relaxed/relaxed;
	bh=if0a5qgfKyLZEs2UFcbOJ2pRLoezhNdJsDQpJdHhbkw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gCbREeKdsbfRUmyzBzMNQc+/2FRzYkyWSvTzlMGwDYlBLUXEOwsAUdLQITDJ7SdicSpB4TRgXb4PYr1EZayVgDjaVdaRr1SEqfqhMYQ2ocu0BKdDBh610wXQi6kD71nKlFmYIBv95eYHCWnhNgpZ/l/5sJIBchau1+OsafJZCW6YaAGziBJDAt0Yn5dA1UT3+upHDpWb34SoNnOUGIBJnBN9FMGqX03odeeonMD7g5WR1T8vEGHxgeDIJ05j/YxsFSLVYeVryYi25gEywcg9ZLS3nF7m9LPRTC5xzOL+qV84SK8QYGLNdyxdGQUXOAe047JBC7ZjQjbwiO+m/6g2+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TM3Askce; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TM3Askce;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YM9Kt4rhsz2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 20:10:10 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2156e078563so101236545ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 01:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549808; x=1736154608; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=if0a5qgfKyLZEs2UFcbOJ2pRLoezhNdJsDQpJdHhbkw=;
        b=TM3AskcebHzJE7y6uDqL9ieEehGYYH/xxRVepQsM+YT7jhbti5ZHuY6lPloucUW9rm
         IUWpMw0HMD5fZsYzYm8fzvXGZ0iNkRg58hokuoRDayIQa04WBowyXPx8sAuXeh7weNg/
         63t0aCu+NaIuiDS/JRFF4JYwMyz47XI1QG+US9iC3fNsNS+ayCtSAspgSCWopvqwMAxr
         w52X2WXXB95dGNpxs6BHlUvrjAm3n3iiAkL/+oGKNesXk1EMd72iHKoWs0cjikIO1NMD
         TKksChKZISZFnoMXeYS8dJxfRSCcwaJbONNlRTayxZjrWN64hUwSA/Sz+7taYFiCHrzN
         VI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549808; x=1736154608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=if0a5qgfKyLZEs2UFcbOJ2pRLoezhNdJsDQpJdHhbkw=;
        b=i+8/38JcLNoS75q9bjT7U3FNI9BfwUoQdQQoadEC1gfkGeX8bsY64ay0sTOwoT7VbP
         +sdAz8PHHpUb/GKXUh1Qf7vRD0Yd7o/Rv8yMOhvcmd6p7QlPtIM21KzmOFo9bl+LE9kR
         FAxkKqte2zgPqKJyuV68TSUCfzpCVyJzpg5PgqE2gwg7NFR9bOoHzYPs1Wb2aLvyUrr0
         UcsY++1qTfehiuUNEJ/b6+bXlTGuw5mvv9Hpn3L6IA3E4YQt+SYgPsbNU1RIoLTl//2l
         zhylyBPPiwLCmBu6tNhaArrH8cWAaJGELR5YB15g3qTa5PD4aYpM9adq99WgZ/kIES5W
         Icrg==
X-Forwarded-Encrypted: i=1; AJvYcCXIHBc7ZgJsPOdwpGSUv1b1pE3TEkp2mRlxzkUfkSE4NIZdk1IqKkLzFeHOWfRzTvK9JaYmfJ83RU4Br9A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwMAltZhlx5FrMmN6Tg4t5FRISEO73gCWxuxCXfKyHIGqrCL1Xk
	DBww2Vwa7aBLPurH9CUD3C4aBaY+hd3QLkVzVW8LVMsN+mVPW8ASAt21ZH+Z4DM=
X-Gm-Gg: ASbGnctfuqzhkbzcjAZkXSnXEk1Ov3WHwpX5XAZ76T/o/Tc79GmjIGBGWDX8hVdhMT6
	dDpgFB7RuB3D0WRIADrK/pVEag4Sn5xn9OCd7Hx+QZ9c+jiFMu78hbfHGwpLpqdpkfe9uRVL46s
	cojujtGxUBKAnzvpVxkroad2xn7qxla3fdH+jgc0YvMtZw2jktLEVJ7tL3inLJZBUfuj8illa8H
	ydh3a0RN0/EdGmim5FbKiJF54B3QQ6Vk+E8Q4rJcbzuuo91f+wJtq/F7X9adj8Ln/SKjFvkQWEI
	DOcuhEmq7j4uii+vCIPSoA==
X-Google-Smtp-Source: AGHT+IG+hQGJZEvqJjf0GGYYEDMNOYDO3VKGK36HZYKhi78RAlEt/pRApnM1X9rb4tsPHPP4epGREg==
X-Received: by 2002:a05:6a20:431d:b0:1e1:bf3d:a190 with SMTP id adf61e73a8af0-1e5e080c83fmr53344548637.30.1735549807869;
        Mon, 30 Dec 2024 01:10:07 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:10:07 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
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
Subject: [PATCH v4 07/15] mm: pgtable: introduce pagetable_dtor()
Date: Mon, 30 Dec 2024 17:07:42 +0800
Message-Id: <8ada95453180c71b7fca92b9a9f11fa0f92d45a6.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
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

The pagetable_p*_dtor() are exactly the same except for the handling of
ptlock. If we make ptlock_free() handle the case where ptdesc->ptl is
NULL and remove VM_BUG_ON_PAGE() from pmd_ptlock_free(), we can unify
pagetable_p*_dtor() into one function. Let's introduce pagetable_dtor()
to do this.

Later, pagetable_dtor() will be moved to tlb_remove_ptdesc(), so that
ptlock and page table pages can be freed together (regardless of whether
RCU is used). This prevents the use-after-free problem where the ptlock
is freed immediately but the page table pages is freed later via RCU.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 Documentation/mm/split_page_table_lock.rst |  4 +-
 arch/arm/include/asm/tlb.h                 |  4 +-
 arch/arm64/include/asm/tlb.h               |  8 ++--
 arch/csky/include/asm/pgalloc.h            |  2 +-
 arch/hexagon/include/asm/pgalloc.h         |  2 +-
 arch/loongarch/include/asm/pgalloc.h       |  2 +-
 arch/m68k/include/asm/mcf_pgalloc.h        |  4 +-
 arch/m68k/include/asm/sun3_pgalloc.h       |  2 +-
 arch/m68k/mm/motorola.c                    |  2 +-
 arch/mips/include/asm/pgalloc.h            |  2 +-
 arch/nios2/include/asm/pgalloc.h           |  2 +-
 arch/openrisc/include/asm/pgalloc.h        |  2 +-
 arch/powerpc/mm/book3s64/mmu_context.c     |  2 +-
 arch/powerpc/mm/book3s64/pgtable.c         |  2 +-
 arch/powerpc/mm/pgtable-frag.c             |  4 +-
 arch/riscv/include/asm/pgalloc.h           |  8 ++--
 arch/riscv/mm/init.c                       |  4 +-
 arch/s390/include/asm/pgalloc.h            |  6 +--
 arch/s390/include/asm/tlb.h                |  6 +--
 arch/s390/mm/pgalloc.c                     |  2 +-
 arch/sh/include/asm/pgalloc.h              |  2 +-
 arch/sparc/mm/init_64.c                    |  2 +-
 arch/sparc/mm/srmmu.c                      |  2 +-
 arch/um/include/asm/pgalloc.h              |  6 +--
 arch/x86/mm/pgtable.c                      | 12 ++---
 include/asm-generic/pgalloc.h              |  8 ++--
 include/linux/mm.h                         | 52 ++++------------------
 mm/memory.c                                |  3 +-
 28 files changed, 62 insertions(+), 95 deletions(-)

diff --git a/Documentation/mm/split_page_table_lock.rst b/Documentation/mm/split_page_table_lock.rst
index 581446d4a4eba..8e1ceb0a6619a 100644
--- a/Documentation/mm/split_page_table_lock.rst
+++ b/Documentation/mm/split_page_table_lock.rst
@@ -62,7 +62,7 @@ Support of split page table lock by an architecture
 ===================================================
 
 There's no need in special enabling of PTE split page table lock: everything
-required is done by pagetable_pte_ctor() and pagetable_pte_dtor(), which
+required is done by pagetable_pte_ctor() and pagetable_dtor(), which
 must be called on PTE table allocation / freeing.
 
 Make sure the architecture doesn't use slab allocator for page table
@@ -73,7 +73,7 @@ PMD split lock only makes sense if you have more than two page table
 levels.
 
 PMD split lock enabling requires pagetable_pmd_ctor() call on PMD table
-allocation and pagetable_pmd_dtor() on freeing.
+allocation and pagetable_dtor() on freeing.
 
 Allocation usually happens in pmd_alloc_one(), freeing in pmd_free() and
 pmd_free_tlb(), but make sure you cover all PMD table allocation / freeing
diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index f40d06ad5d2a3..ef79bf1e8563f 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -41,7 +41,7 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
-	pagetable_pte_dtor(ptdesc);
+	pagetable_dtor(ptdesc);
 
 #ifndef CONFIG_ARM_LPAE
 	/*
@@ -61,7 +61,7 @@ __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp, unsigned long addr)
 #ifdef CONFIG_ARM_LPAE
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pagetable_pmd_dtor(ptdesc);
+	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 #endif
 }
diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index 445282cde9afb..408d0f36a8a8f 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -82,7 +82,7 @@ static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
-	pagetable_pte_dtor(ptdesc);
+	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 
@@ -92,7 +92,7 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp,
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pagetable_pmd_dtor(ptdesc);
+	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
@@ -106,7 +106,7 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
 	if (!pgtable_l4_enabled())
 		return;
 
-	pagetable_pud_dtor(ptdesc);
+	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
@@ -120,7 +120,7 @@ static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4dp,
 	if (!pgtable_l5_enabled())
 		return;
 
-	pagetable_p4d_dtor(ptdesc);
+	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
index 9c84c9012e534..f1ce5b7b28f22 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -63,7 +63,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #define __pte_free_tlb(tlb, pte, address)		\
 do {							\
-	pagetable_pte_dtor(page_ptdesc(pte));		\
+	pagetable_dtor(page_ptdesc(pte));		\
 	tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));	\
 } while (0)
 
diff --git a/arch/hexagon/include/asm/pgalloc.h b/arch/hexagon/include/asm/pgalloc.h
index 55988625e6fbc..40e42a0e71673 100644
--- a/arch/hexagon/include/asm/pgalloc.h
+++ b/arch/hexagon/include/asm/pgalloc.h
@@ -89,7 +89,7 @@ static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
 
 #define __pte_free_tlb(tlb, pte, addr)				\
 do {								\
-	pagetable_pte_dtor((page_ptdesc(pte)));			\
+	pagetable_dtor((page_ptdesc(pte)));			\
 	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index a7b9c9e73593d..7211dff8c969e 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -57,7 +57,7 @@ static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 
 #define __pte_free_tlb(tlb, pte, address)			\
 do {								\
-	pagetable_pte_dtor(page_ptdesc(pte));			\
+	pagetable_dtor(page_ptdesc(pte));			\
 	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
 } while (0)
 
diff --git a/arch/m68k/include/asm/mcf_pgalloc.h b/arch/m68k/include/asm/mcf_pgalloc.h
index 302c5bf67179e..22d6c1fcabfb4 100644
--- a/arch/m68k/include/asm/mcf_pgalloc.h
+++ b/arch/m68k/include/asm/mcf_pgalloc.h
@@ -37,7 +37,7 @@ static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pgtable,
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(pgtable);
 
-	pagetable_pte_dtor(ptdesc);
+	pagetable_dtor(ptdesc);
 	pagetable_free(ptdesc);
 }
 
@@ -61,7 +61,7 @@ static inline void pte_free(struct mm_struct *mm, pgtable_t pgtable)
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(pgtable);
 
-	pagetable_pte_dtor(ptdesc);
+	pagetable_dtor(ptdesc);
 	pagetable_free(ptdesc);
 }
 
diff --git a/arch/m68k/include/asm/sun3_pgalloc.h b/arch/m68k/include/asm/sun3_pgalloc.h
index 4a137eecb6fe4..2b626cb3ad0ae 100644
--- a/arch/m68k/include/asm/sun3_pgalloc.h
+++ b/arch/m68k/include/asm/sun3_pgalloc.h
@@ -19,7 +19,7 @@ extern const char bad_pmd_string[];
 
 #define __pte_free_tlb(tlb, pte, addr)				\
 do {								\
-	pagetable_pte_dtor(page_ptdesc(pte));			\
+	pagetable_dtor(page_ptdesc(pte));			\
 	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
 } while (0)
 
diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index c1761d309fc61..81715cece70c6 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -201,7 +201,7 @@ int free_pointer_table(void *table, int type)
 		list_del(dp);
 		mmu_page_dtor((void *)page);
 		if (type == TABLE_PTE)
-			pagetable_pte_dtor(virt_to_ptdesc((void *)page));
+			pagetable_dtor(virt_to_ptdesc((void *)page));
 		free_page (page);
 		return 1;
 	} else if (ptable_list[type].next != dp) {
diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index f4440edcd8fe2..36d9805033c4b 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -56,7 +56,7 @@ static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 
 #define __pte_free_tlb(tlb, pte, address)			\
 do {								\
-	pagetable_pte_dtor(page_ptdesc(pte));			\
+	pagetable_dtor(page_ptdesc(pte));			\
 	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
 } while (0)
 
diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
index ce6bb8e74271f..12a536b7bfbd4 100644
--- a/arch/nios2/include/asm/pgalloc.h
+++ b/arch/nios2/include/asm/pgalloc.h
@@ -30,7 +30,7 @@ extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
 #define __pte_free_tlb(tlb, pte, addr)					\
 	do {								\
-		pagetable_pte_dtor(page_ptdesc(pte));			\
+		pagetable_dtor(page_ptdesc(pte));			\
 		tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 	} while (0)
 
diff --git a/arch/openrisc/include/asm/pgalloc.h b/arch/openrisc/include/asm/pgalloc.h
index c6a73772a5466..596e2355824e3 100644
--- a/arch/openrisc/include/asm/pgalloc.h
+++ b/arch/openrisc/include/asm/pgalloc.h
@@ -68,7 +68,7 @@ extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
 
 #define __pte_free_tlb(tlb, pte, addr)				\
 do {								\
-	pagetable_pte_dtor(page_ptdesc(pte));			\
+	pagetable_dtor(page_ptdesc(pte));			\
 	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
index 1715b07c630c9..4e1e45420bd49 100644
--- a/arch/powerpc/mm/book3s64/mmu_context.c
+++ b/arch/powerpc/mm/book3s64/mmu_context.c
@@ -253,7 +253,7 @@ static void pmd_frag_destroy(void *pmd_frag)
 	count = ((unsigned long)pmd_frag & ~PAGE_MASK) >> PMD_FRAG_SIZE_SHIFT;
 	/* We allow PTE_FRAG_NR fragments from a PTE page */
 	if (atomic_sub_and_test(PMD_FRAG_NR - count, &ptdesc->pt_frag_refcount)) {
-		pagetable_pmd_dtor(ptdesc);
+		pagetable_dtor(ptdesc);
 		pagetable_free(ptdesc);
 	}
 }
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 3745425280808..3f28e4acd920b 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -477,7 +477,7 @@ void pmd_fragment_free(unsigned long *pmd)
 
 	BUG_ON(atomic_read(&ptdesc->pt_frag_refcount) <= 0);
 	if (atomic_dec_and_test(&ptdesc->pt_frag_refcount)) {
-		pagetable_pmd_dtor(ptdesc);
+		pagetable_dtor(ptdesc);
 		pagetable_free(ptdesc);
 	}
 }
diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
index e89f64a0f24ae..713268ccb1a0e 100644
--- a/arch/powerpc/mm/pgtable-frag.c
+++ b/arch/powerpc/mm/pgtable-frag.c
@@ -25,7 +25,7 @@ void pte_frag_destroy(void *pte_frag)
 	count = ((unsigned long)pte_frag & ~PAGE_MASK) >> PTE_FRAG_SIZE_SHIFT;
 	/* We allow PTE_FRAG_NR fragments from a PTE page */
 	if (atomic_sub_and_test(PTE_FRAG_NR - count, &ptdesc->pt_frag_refcount)) {
-		pagetable_pte_dtor(ptdesc);
+		pagetable_dtor(ptdesc);
 		pagetable_free(ptdesc);
 	}
 }
@@ -111,7 +111,7 @@ static void pte_free_now(struct rcu_head *head)
 	struct ptdesc *ptdesc;
 
 	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
-	pagetable_pte_dtor(ptdesc);
+	pagetable_dtor(ptdesc);
 	pagetable_free(ptdesc);
 }
 
diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 3466fbe2e508d..b6793c5c99296 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -100,7 +100,7 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 	if (pgtable_l4_enabled) {
 		struct ptdesc *ptdesc = virt_to_ptdesc(pud);
 
-		pagetable_pud_dtor(ptdesc);
+		pagetable_dtor(ptdesc);
 		riscv_tlb_remove_ptdesc(tlb, ptdesc);
 	}
 }
@@ -111,7 +111,7 @@ static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 	if (pgtable_l5_enabled) {
 		struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
 
-		pagetable_p4d_dtor(ptdesc);
+		pagetable_dtor(ptdesc);
 		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
 	}
 }
@@ -144,7 +144,7 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
 
-	pagetable_pmd_dtor(ptdesc);
+	pagetable_dtor(ptdesc);
 	riscv_tlb_remove_ptdesc(tlb, ptdesc);
 }
 
@@ -155,7 +155,7 @@ static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
-	pagetable_pte_dtor(ptdesc);
+	pagetable_dtor(ptdesc);
 	riscv_tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif /* CONFIG_MMU */
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index fc53ce748c804..8d703fb51b1dc 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1558,7 +1558,7 @@ static void __meminit free_pte_table(pte_t *pte_start, pmd_t *pmd)
 			return;
 	}
 
-	pagetable_pte_dtor(ptdesc);
+	pagetable_dtor(ptdesc);
 	if (PageReserved(page))
 		free_reserved_page(page);
 	else
@@ -1580,7 +1580,7 @@ static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud, bool is_vmemm
 	}
 
 	if (!is_vmemmap)
-		pagetable_pmd_dtor(ptdesc);
+		pagetable_dtor(ptdesc);
 	if (PageReserved(page))
 		free_reserved_page(page);
 	else
diff --git a/arch/s390/include/asm/pgalloc.h b/arch/s390/include/asm/pgalloc.h
index a0c1ca5d8423c..5fced6d3c36b0 100644
--- a/arch/s390/include/asm/pgalloc.h
+++ b/arch/s390/include/asm/pgalloc.h
@@ -66,7 +66,7 @@ static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
 	if (mm_p4d_folded(mm))
 		return;
 
-	pagetable_p4d_dtor(virt_to_ptdesc(p4d));
+	pagetable_dtor(virt_to_ptdesc(p4d));
 	crst_table_free(mm, (unsigned long *) p4d);
 }
 
@@ -87,7 +87,7 @@ static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 	if (mm_pud_folded(mm))
 		return;
 
-	pagetable_pud_dtor(virt_to_ptdesc(pud));
+	pagetable_dtor(virt_to_ptdesc(pud));
 	crst_table_free(mm, (unsigned long *) pud);
 }
 
@@ -109,7 +109,7 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 {
 	if (mm_pmd_folded(mm))
 		return;
-	pagetable_pmd_dtor(virt_to_ptdesc(pmd));
+	pagetable_dtor(virt_to_ptdesc(pmd));
 	crst_table_free(mm, (unsigned long *) pmd);
 }
 
diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
index b946964afce8e..74b6fba4c2ee3 100644
--- a/arch/s390/include/asm/tlb.h
+++ b/arch/s390/include/asm/tlb.h
@@ -102,7 +102,7 @@ static inline void pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 {
 	if (mm_pmd_folded(tlb->mm))
 		return;
-	pagetable_pmd_dtor(virt_to_ptdesc(pmd));
+	pagetable_dtor(virt_to_ptdesc(pmd));
 	__tlb_adjust_range(tlb, address, PAGE_SIZE);
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
@@ -122,7 +122,7 @@ static inline void pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 {
 	if (mm_pud_folded(tlb->mm))
 		return;
-	pagetable_pud_dtor(virt_to_ptdesc(pud));
+	pagetable_dtor(virt_to_ptdesc(pud));
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
 	tlb->cleared_p4ds = 1;
@@ -141,7 +141,7 @@ static inline void p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 {
 	if (mm_p4d_folded(tlb->mm))
 		return;
-	pagetable_p4d_dtor(virt_to_ptdesc(p4d));
+	pagetable_dtor(virt_to_ptdesc(p4d));
 	__tlb_adjust_range(tlb, address, PAGE_SIZE);
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
index 58696a0c4e4ac..569de24d33761 100644
--- a/arch/s390/mm/pgalloc.c
+++ b/arch/s390/mm/pgalloc.c
@@ -182,7 +182,7 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
 
 static void pagetable_pte_dtor_free(struct ptdesc *ptdesc)
 {
-	pagetable_pte_dtor(ptdesc);
+	pagetable_dtor(ptdesc);
 	pagetable_free(ptdesc);
 }
 
diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgalloc.h
index 5d8577ab15911..96d938fdf2244 100644
--- a/arch/sh/include/asm/pgalloc.h
+++ b/arch/sh/include/asm/pgalloc.h
@@ -34,7 +34,7 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 
 #define __pte_free_tlb(tlb, pte, addr)				\
 do {								\
-	pagetable_pte_dtor(page_ptdesc(pte));			\
+	pagetable_dtor(page_ptdesc(pte));			\
 	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 21f8cbbd0581c..05882bca5b732 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2915,7 +2915,7 @@ static void __pte_free(pgtable_t pte)
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(pte);
 
-	pagetable_pte_dtor(ptdesc);
+	pagetable_dtor(ptdesc);
 	pagetable_free(ptdesc);
 }
 
diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 9df51a62333d6..e3a72c884b867 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -372,7 +372,7 @@ void pte_free(struct mm_struct *mm, pgtable_t ptep)
 	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
 	spin_lock(&mm->page_table_lock);
 	if (page_ref_dec_return(page) == 1)
-		pagetable_pte_dtor(page_ptdesc(page));
+		pagetable_dtor(page_ptdesc(page));
 	spin_unlock(&mm->page_table_lock);
 
 	srmmu_free_nocache(ptep, SRMMU_PTE_TABLE_SIZE);
diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
index 04fb4e6969a46..f0af23c3aeb2b 100644
--- a/arch/um/include/asm/pgalloc.h
+++ b/arch/um/include/asm/pgalloc.h
@@ -27,7 +27,7 @@ extern pgd_t *pgd_alloc(struct mm_struct *);
 
 #define __pte_free_tlb(tlb, pte, address)			\
 do {								\
-	pagetable_pte_dtor(page_ptdesc(pte));			\
+	pagetable_dtor(page_ptdesc(pte));			\
 	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
@@ -35,7 +35,7 @@ do {								\
 
 #define __pmd_free_tlb(tlb, pmd, address)			\
 do {								\
-	pagetable_pmd_dtor(virt_to_ptdesc(pmd));			\
+	pagetable_dtor(virt_to_ptdesc(pmd));			\
 	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
 } while (0)
 
@@ -43,7 +43,7 @@ do {								\
 
 #define __pud_free_tlb(tlb, pud, address)			\
 do {								\
-	pagetable_pud_dtor(virt_to_ptdesc(pud));		\
+	pagetable_dtor(virt_to_ptdesc(pud));		\
 	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pud));	\
 } while (0)
 
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 3d6e84da45b24..a6cd9660e29ec 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -60,7 +60,7 @@ early_param("userpte", setup_userpte);
 
 void ___pte_free_tlb(struct mmu_gather *tlb, struct page *pte)
 {
-	pagetable_pte_dtor(page_ptdesc(pte));
+	pagetable_dtor(page_ptdesc(pte));
 	paravirt_release_pte(page_to_pfn(pte));
 	paravirt_tlb_remove_table(tlb, pte);
 }
@@ -77,7 +77,7 @@ void ___pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd)
 #ifdef CONFIG_X86_PAE
 	tlb->need_flush_all = 1;
 #endif
-	pagetable_pmd_dtor(ptdesc);
+	pagetable_dtor(ptdesc);
 	paravirt_tlb_remove_table(tlb, ptdesc_page(ptdesc));
 }
 
@@ -86,7 +86,7 @@ void ___pud_free_tlb(struct mmu_gather *tlb, pud_t *pud)
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(pud);
 
-	pagetable_pud_dtor(ptdesc);
+	pagetable_dtor(ptdesc);
 	paravirt_release_pud(__pa(pud) >> PAGE_SHIFT);
 	paravirt_tlb_remove_table(tlb, virt_to_page(pud));
 }
@@ -96,7 +96,7 @@ void ___p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d)
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
 
-	pagetable_p4d_dtor(ptdesc);
+	pagetable_dtor(ptdesc);
 	paravirt_release_p4d(__pa(p4d) >> PAGE_SHIFT);
 	paravirt_tlb_remove_table(tlb, virt_to_page(p4d));
 }
@@ -233,7 +233,7 @@ static void free_pmds(struct mm_struct *mm, pmd_t *pmds[], int count)
 		if (pmds[i]) {
 			ptdesc = virt_to_ptdesc(pmds[i]);
 
-			pagetable_pmd_dtor(ptdesc);
+			pagetable_dtor(ptdesc);
 			pagetable_free(ptdesc);
 			mm_dec_nr_pmds(mm);
 		}
@@ -867,7 +867,7 @@ int pud_free_pmd_page(pud_t *pud, unsigned long addr)
 
 	free_page((unsigned long)pmd_sv);
 
-	pagetable_pmd_dtor(virt_to_ptdesc(pmd));
+	pagetable_dtor(virt_to_ptdesc(pmd));
 	free_page((unsigned long)pmd);
 
 	return 1;
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index bb482eeca0c3e..4afb346eae255 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -109,7 +109,7 @@ static inline void pte_free(struct mm_struct *mm, struct page *pte_page)
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte_page);
 
-	pagetable_pte_dtor(ptdesc);
+	pagetable_dtor(ptdesc);
 	pagetable_free(ptdesc);
 }
 
@@ -153,7 +153,7 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
 
 	BUG_ON((unsigned long)pmd & (PAGE_SIZE-1));
-	pagetable_pmd_dtor(ptdesc);
+	pagetable_dtor(ptdesc);
 	pagetable_free(ptdesc);
 }
 #endif
@@ -202,7 +202,7 @@ static inline void __pud_free(struct mm_struct *mm, pud_t *pud)
 	struct ptdesc *ptdesc = virt_to_ptdesc(pud);
 
 	BUG_ON((unsigned long)pud & (PAGE_SIZE-1));
-	pagetable_pud_dtor(ptdesc);
+	pagetable_dtor(ptdesc);
 	pagetable_free(ptdesc);
 }
 
@@ -248,7 +248,7 @@ static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
 	struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
 
 	BUG_ON((unsigned long)p4d & (PAGE_SIZE-1));
-	pagetable_p4d_dtor(ptdesc);
+	pagetable_dtor(ptdesc);
 	pagetable_free(ptdesc);
 }
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 5d82f42ddd5cc..cad11fa10c192 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2992,6 +2992,15 @@ static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* defined(CONFIG_SPLIT_PTE_PTLOCKS) */
 
+static inline void pagetable_dtor(struct ptdesc *ptdesc)
+{
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	ptlock_free(ptdesc);
+	__folio_clear_pgtable(folio);
+	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
+}
+
 static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
 {
 	struct folio *folio = ptdesc_folio(ptdesc);
@@ -3003,15 +3012,6 @@ static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
 	return true;
 }
 
-static inline void pagetable_pte_dtor(struct ptdesc *ptdesc)
-{
-	struct folio *folio = ptdesc_folio(ptdesc);
-
-	ptlock_free(ptdesc);
-	__folio_clear_pgtable(folio);
-	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
-}
-
 pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp);
 static inline pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr,
 			pmd_t *pmdvalp)
@@ -3088,14 +3088,6 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 	return ptlock_init(ptdesc);
 }
 
-static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
-{
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
-#endif
-	ptlock_free(ptdesc);
-}
-
 #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
 
 #else
@@ -3106,7 +3098,6 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 
 static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void pmd_ptlock_free(struct ptdesc *ptdesc) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
 
@@ -3131,15 +3122,6 @@ static inline bool pagetable_pmd_ctor(struct ptdesc *ptdesc)
 	return true;
 }
 
-static inline void pagetable_pmd_dtor(struct ptdesc *ptdesc)
-{
-	struct folio *folio = ptdesc_folio(ptdesc);
-
-	pmd_ptlock_free(ptdesc);
-	__folio_clear_pgtable(folio);
-	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
-}
-
 /*
  * No scalability reason to split PUD locks yet, but follow the same pattern
  * as the PMD locks to make it easier if we decide to.  The VM should not be
@@ -3167,14 +3149,6 @@ static inline void pagetable_pud_ctor(struct ptdesc *ptdesc)
 	lruvec_stat_add_folio(folio, NR_PAGETABLE);
 }
 
-static inline void pagetable_pud_dtor(struct ptdesc *ptdesc)
-{
-	struct folio *folio = ptdesc_folio(ptdesc);
-
-	__folio_clear_pgtable(folio);
-	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
-}
-
 static inline void pagetable_p4d_ctor(struct ptdesc *ptdesc)
 {
 	struct folio *folio = ptdesc_folio(ptdesc);
@@ -3183,14 +3157,6 @@ static inline void pagetable_p4d_ctor(struct ptdesc *ptdesc)
 	lruvec_stat_add_folio(folio, NR_PAGETABLE);
 }
 
-static inline void pagetable_p4d_dtor(struct ptdesc *ptdesc)
-{
-	struct folio *folio = ptdesc_folio(ptdesc);
-
-	__folio_clear_pgtable(folio);
-	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
-}
-
 extern void __init pagecache_init(void);
 extern void free_initmem(void);
 
diff --git a/mm/memory.c b/mm/memory.c
index 9423967b24180..ad871e564568b 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -7051,7 +7051,8 @@ bool ptlock_alloc(struct ptdesc *ptdesc)
 
 void ptlock_free(struct ptdesc *ptdesc)
 {
-	kmem_cache_free(page_ptl_cachep, ptdesc->ptl);
+	if (ptdesc->ptl)
+		kmem_cache_free(page_ptl_cachep, ptdesc->ptl);
 }
 #endif
 
-- 
2.20.1


