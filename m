Return-Path: <linuxppc-dev+bounces-7529-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82242A7FA62
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 11:54:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZX1d52c7gz30Pn;
	Tue,  8 Apr 2025 19:54:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744106057;
	cv=none; b=b221yMkrcKE3LUhKVZta3Lgo7xYQPQRCHqymH2fbbvK9rehPI9uM7pjn00sHa9qY2T89tSv2eSiqnhztJpLieTeOG5IPrAxoR6GVDj4awfN9EyrhVOuJJQlir3G4ak51YD5IqlVj/5QuVQrtLWoKUh5j2RSptyWWYaMNrKpA1p4MJeIvdfKt3gKYLRpv1YPzOproHYSo7bqOzzDBptwp85lB41xDVPt5Z9xAskvR+k/KfguB0mYLEwEhN6Kc8dKk7AwFi4+FvtVk2wjgKh7rl9rDMdSEqzrZnsXWg2S0ldivXpdlM5j5ci0BGyJJgdCWxWVTNEn97Q04iFi6YP2MvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744106057; c=relaxed/relaxed;
	bh=AoW5uPcncPp3axMC3OLXSZhaQ2vhQ+ldUmkYdrG/FME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lzlHQqVp3yNZdBZcFx/aY9j9W0pPehg3B+dtCf1B4J4Al0Bb8Fnuo9rDeppq1b3f3eRPRh4ec3h8RCq1tnB9anlfQiJ1GyI2VZawKKyBqC08qR4QZTdzLQCxBKbiGuLEsODFCEH5XZ+ccLlzE+cjII7Knqhu2xG/qpB7adn9ZIaIZDSEAXfuTS1BeHrPE2OKBUKLIiF/c64nlGsiJYIZSyssA2M6EaY9JWZYl8P6mxKp/eZgJrObG75TFndSq7Og+/OeDYqkrs8UaOgMYVUIsNyIkDEFmiu098pgZzYSEwRKAht06RVBXnJ4SwN3UJzJBokToY6Fj1FNso76od7F3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZX1d43zzxz307K
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 19:54:16 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EB2B2328;
	Tue,  8 Apr 2025 02:53:44 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F29D83F6A8;
	Tue,  8 Apr 2025 02:53:38 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 07/12] mm: Skip ptlock_init() for kernel PMDs
Date: Tue,  8 Apr 2025 10:52:17 +0100
Message-ID: <20250408095222.860601-8-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250408095222.860601-1-kevin.brodsky@arm.com>
References: <20250408095222.860601-1-kevin.brodsky@arm.com>
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
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Split page table locks are not used for pgtables associated to
init_mm, at any level. pte_alloc_kernel() does not call
ptlock_init() as a result. There is however no separate alloc/free
functions for kernel PMDs, and pmd_ptlock_init() is called
unconditionally. When ALLOC_SPLIT_PTLOCKS is true (e.g. 32-bit
architectures or if CONFIG_PREEMPT_RT is selected), this results in
unnecessary dynamic memory allocation every time a kernel PMD is
allocated.

Now that pagetable_pmd_ctor() is passed the associated mm, we can
easily remove this overhead by skipping pmd_ptlock_init() if the
pgtable is associated to init_mm. No special-casing is needed on the
dtor path, as ptlock_free() is already called unconditionally for
all levels. (ptlock_free() is a no-op unless a ptlock was allocated
for the given PTP.)

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/linux/mm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 3f48e449574a..ef420f4dc72c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3210,7 +3210,7 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 static inline bool pagetable_pmd_ctor(struct mm_struct *mm,
 				      struct ptdesc *ptdesc)
 {
-	if (!pmd_ptlock_init(ptdesc))
+	if (mm != &init_mm && !pmd_ptlock_init(ptdesc))
 		return false;
 	ptdesc_pmd_pts_init(ptdesc);
 	__pagetable_ctor(ptdesc);
-- 
2.47.0


