Return-Path: <linuxppc-dev+bounces-14187-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F40AC5F6CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Nov 2025 22:49:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7W4q4HCPz2yFT;
	Sat, 15 Nov 2025 08:49:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763156971;
	cv=none; b=P5U03TzsLcD8O6GYPEnnWE2J0pbBS27arSi0mQEoHY9AojQ7iJG9mA9IqOMUx0ZwX8+LixjCNhI/c8MeUpB6rmPu6tdjGbsVyI2PsGv/SyxG9KIe6UFIoBu3+qitYuuW5jKIP9qhxYnuS6f4fHaqC9ukcPFuDDYCmXyDaFrxCWIqpkIRfeCGeQix04OI2GYX5EclkN/Jc7qeR2OSNUJhzx1+vgNz1lmuTIQv/WL++yvLx9JG5+C4lAsRUkqi68MmlNztpaXKjwzz6uTECGM9wkN4pY/uWQo1+s2GHQcb2U928tam7r980sT1OcONaKrQppxzPEEJ4DbLNwuCjjW5tg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763156971; c=relaxed/relaxed;
	bh=5BkAeGjFAR37zBADHAlvlRHppK4yl8/KxkL2I6oi6/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N6yzzbUDYMeqUfUvY8+R5kpkS2CvqLI1D/GyAJUE7gRFFIrPiSuhxkir7MyQr4bz1ix9Z7DY1CkzY4qhMTk4Vmdd27WeHW6THIFiaNZgCnXOc8rSX0q4po68DeaGdO9KHTJEEwdueq8Klk3wxLnDVi49KZqT2ULwyKGiV7X1h14xft1Sn80z09q7onhnF9e7cHgspLCVH+wh/j9E9pbtvSmX8ewQVtN4IO1JlG0Tez09SS/tn+avay5GJMt5t2YWSk+Dq9Us86ptQ4upnEH03n0v8TLlaTl7RrcOyZIsl7ZLO70JhMLRQZ5LYqKXxJ+8cZvWDc//X8ng7bwNMUqewQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q2o6DD7H; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q2o6DD7H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d7W4p3j8vz2xqt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Nov 2025 08:49:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ADBEA6018A;
	Fri, 14 Nov 2025 21:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102D9C4CEF5;
	Fri, 14 Nov 2025 21:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763156967;
	bh=ySvSzShrg1v70DOhLwUfjU/Do8dZ0r5nlYPKicAzxRc=;
	h=From:To:Cc:Subject:Date:From;
	b=q2o6DD7HnK+jCwD2HWc9iJCezb5y4hbOkGor8kefy1DNjvE6Py/4DkEgl+hTrpcuh
	 DWyvUbH3iGSe7RA879sOTFAyyK9q8qsLhPaAhpTnLxmUthlwEfXItYxYkasuMRpuzb
	 /6rBf+BtkIcAKnJ2KJYJjkjI8fM2AUw5q+4FzNP+mdMiAjH325qlVL1kl1PJ9ixOaQ
	 kozEZ2hcq1T+GjWbTF/wHT+jUmg3nhLOn0wIvpRViFwGPyqTjP3di8ZtFymIlU5B3Q
	 bLxKh9VpAor6zH8i8aMpSBVT5R69Pcnf9fBDNhxZX/M5vTb7Tr7iI9lEbNCaZEwA7u
	 UO7rfB9yfE6pA==
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	"David Hildenbrand (Red Hat)" <david@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Donet Tom <donettom@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2] mm: fix MAX_FOLIO_ORDER on powerpc configs with hugetlb
Date: Fri, 14 Nov 2025 22:49:20 +0100
Message-ID: <20251114214920.2550676-1-david@kernel.org>
X-Mailer: git-send-email 2.51.0
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In the past, CONFIG_ARCH_HAS_GIGANTIC_PAGE indicated that we support
runtime allocation of gigantic hugetlb folios. In the meantime it evolved
into a generic way for the architecture to state that it supports
gigantic hugetlb folios.

In commit fae7d834c43c ("mm: add __dump_folio()") we started using
CONFIG_ARCH_HAS_GIGANTIC_PAGE to decide MAX_FOLIO_ORDER: whether we could
have folios larger than what the buddy can handle. In the context of
that commit, we started using MAX_FOLIO_ORDER to detect page corruptions
when dumping tail pages of folios. Before that commit, we assumed that
we cannot have folios larger than the highest buddy order, which was
obviously wrong.

In commit 7b4f21f5e038 ("mm/hugetlb: check for unreasonable folio sizes
when registering hstate"), we used MAX_FOLIO_ORDER to detect
inconsistencies, and in fact, we found some now.

Powerpc allows for configs that can allocate gigantic folio during boot
(not at runtime), that do not set CONFIG_ARCH_HAS_GIGANTIC_PAGE and can
exceed PUD_ORDER.

To fix it, let's make powerpc select CONFIG_ARCH_HAS_GIGANTIC_PAGE with
hugetlb on powerpc, and increase the maximum folio size with hugetlb to 16
GiB on 64bit (possible on arm64 and powerpc) and 1 GiB on 32 bit (powerpc).
Note that on some powerpc configurations, whether we actually have gigantic
pages depends on the setting of CONFIG_ARCH_FORCE_MAX_ORDER, but there is
nothing really problematic about setting it unconditionally: we just try to
keep the value small so we can better detect problems in __dump_folio()
and inconsistencies around the expected largest folio in the system.

Ideally, we'd have a better way to obtain the maximum hugetlb folio size
and detect ourselves whether we really end up with gigantic folios. Let's
defer bigger changes and fix the warnings first.

While at it, handle gigantic DAX folios more clearly: DAX can only
end up creating gigantic folios with HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD.

Add a new Kconfig option HAVE_GIGANTIC_FOLIOS to make both cases
clearer. In particular, worry about ARCH_HAS_GIGANTIC_PAGE only with
HUGETLB_PAGE.

Note: with enabling CONFIG_ARCH_HAS_GIGANTIC_PAGE on powerpc, we will now
also allow for runtime allocations of folios in some more powerpc configs.
I don't think this is a problem, but if it is we could handle it through
__HAVE_ARCH_GIGANTIC_PAGE_RUNTIME_SUPPORTED.

While __dump_page()/__dump_folio was also problematic (not handling dumping
of tail pages of such gigantic folios correctly), it doesn't seem
critical enough to mark it as a fix.

Fixes: 7b4f21f5e038 ("mm/hugetlb: check for unreasonable folio sizes when registering hstate")
Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Closes: https://lore.kernel.org/r/3e043453-3f27-48ad-b987-cc39f523060a@csgroup.eu/
Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Closes: https://lore.kernel.org/r/94377f5c-d4f0-4c0f-b0f6-5bf1cd7305b1@linux.ibm.com/
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Donet Tom <donettom@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
---

v1 -> v2:
* Adjust patch description (typo, 16G vs 1G)
* Remove ARCH_HAS_GIGANTIC_PAGE from arch/powerpc/platforms/Kconfig.cputype
* Mention CONFIG_HAVE_GIGANTIC_FOLIOS in comment
* Use 1 GiB on 32bit to avoid unsigned-long capacity issues

I yet have to boot-test this on 32bit powerpc. Something for Monday.

---
 arch/powerpc/Kconfig                   |  1 +
 arch/powerpc/platforms/Kconfig.cputype |  1 -
 include/linux/mm.h                     | 13 ++++++++++---
 mm/Kconfig                             |  7 +++++++
 4 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e24f4d88885ae..9537a61ebae02 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -137,6 +137,7 @@ config PPC
 	select ARCH_HAS_DMA_OPS			if PPC64
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
+	select ARCH_HAS_GIGANTIC_PAGE		if ARCH_SUPPORTS_HUGETLBFS
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_KERNEL_FPU_SUPPORT	if PPC64 && PPC_FPU
 	select ARCH_HAS_MEMBARRIER_CALLBACKS
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 7b527d18aa5ee..4c321a8ea8965 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -423,7 +423,6 @@ config PPC_64S_HASH_MMU
 config PPC_RADIX_MMU
 	bool "Radix MMU Support"
 	depends on PPC_BOOK3S_64
-	select ARCH_HAS_GIGANTIC_PAGE
 	default y
 	help
 	  Enable support for the Power ISA 3.0 Radix style MMU. Currently this
diff --git a/include/linux/mm.h b/include/linux/mm.h
index d16b33bacc32b..7c79b3369b82c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2074,7 +2074,7 @@ static inline unsigned long folio_nr_pages(const struct folio *folio)
 	return folio_large_nr_pages(folio);
 }
 
-#if !defined(CONFIG_ARCH_HAS_GIGANTIC_PAGE)
+#if !defined(CONFIG_HAVE_GIGANTIC_FOLIOS)
 /*
  * We don't expect any folios that exceed buddy sizes (and consequently
  * memory sections).
@@ -2087,10 +2087,17 @@ static inline unsigned long folio_nr_pages(const struct folio *folio)
  * pages are guaranteed to be contiguous.
  */
 #define MAX_FOLIO_ORDER		PFN_SECTION_SHIFT
-#else
+#elif defined(CONFIG_HUGETLB_PAGE)
 /*
  * There is no real limit on the folio size. We limit them to the maximum we
- * currently expect (e.g., hugetlb, dax).
+ * currently expect (see CONFIG_HAVE_GIGANTIC_FOLIOS): with hugetlb, we expect
+ * no folios larger than 16 GiB on 64bit and 1 GiB on 32bit.
+ */
+#define MAX_FOLIO_ORDER		get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G)
+#else
+/*
+ * Without hugetlb, gigantic folios that are bigger than a single PUD are
+ * currently impossible.
  */
 #define MAX_FOLIO_ORDER		PUD_ORDER
 #endif
diff --git a/mm/Kconfig b/mm/Kconfig
index 0e26f4fc8717b..ca3f146bc7053 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -908,6 +908,13 @@ config PAGE_MAPCOUNT
 config PGTABLE_HAS_HUGE_LEAVES
 	def_bool TRANSPARENT_HUGEPAGE || HUGETLB_PAGE
 
+#
+# We can end up creating gigantic folio.
+#
+config HAVE_GIGANTIC_FOLIOS
+	def_bool (HUGETLB_PAGE && ARCH_HAS_GIGANTIC_PAGE) || \
+		 (ZONE_DEVICE && HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
+
 # TODO: Allow to be enabled without THP
 config ARCH_SUPPORTS_HUGE_PFNMAP
 	def_bool n

base-commit: 6146a0f1dfae5d37442a9ddcba012add260bceb0
-- 
2.51.0


