Return-Path: <linuxppc-dev+bounces-14129-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9DFC52D7D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 15:56:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d661P2Zk3z2yvJ;
	Thu, 13 Nov 2025 01:56:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762959401;
	cv=none; b=Bd++njKPrG3u8Q5hev2AH+6c4YGgQcXHFEsmLvmP6B1fFBATf+HomEr4OYYz2+biBzbrLrzKlmsoFDihiIN25DW44LrO1vgF3UH1JJtPMnzoCwHNjnVMvse5XJgDifHejCCmxfojwdBHyluyp5VNnWkMtNsf5yaMtl8CNtQ0PQ3NaHf6Na22WXMJ/kvS8Ke9NFKRRGHAWtmYsu+mRKSIj2B9AxUU96y6RVO9Dniv0XxVzhat6Fj8yJBWJUjuXz0i6XujCrEm1j0EZHJD2n4nWA3A6EU7bh0HLnpR5LCctfv9CRIAEf7iXws47FIqTUL5hhHifhBhnCKOqG0q84FKTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762959401; c=relaxed/relaxed;
	bh=ryP1wiJVw9aw+DpTbMpV/h0UEZ8NMcdOc+GlItX0uJI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nYan4ds7d4D6PQYaUQnGehll3N0O7xdt9BW1UVi8Ml7lpMDlXiAkONMYLymebRADpGQ3GIC/5JHxLdGGQnW6/uZL3G2wnItTtTvn5yYJx0EBgV69H5NdMi0DTbGbwf9ZXXiRCXnJTfEKKF1QjMK3fUP0SCRod/wzFPTxYkWXqmLJ07bN1WflAVJSwJPEXzHrYLfgU/Vg8ElJxgYUZnWerbNtgiDeVADAucZE7oeR2AqvDCaitH9g0IAM+B7KCFwAInnl/5fp1C1eODvvwTSzwE5pJfWc+iZx6pnHCzec8LV7t6AkLjDmCNVXMFa4lis/yNca3Dv3BxWMxNci0LZYNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D79khSQs; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D79khSQs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d661N3Cqrz2yhD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 01:56:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 37CDE60219;
	Wed, 12 Nov 2025 14:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55BD2C113D0;
	Wed, 12 Nov 2025 14:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762959397;
	bh=/i5+uzL0Oqs6gEV3AXY8bbYwafp63UToQF5glVJFuPc=;
	h=From:To:Cc:Subject:Date:From;
	b=D79khSQsyM2jtSumiC6G+0g59BNd6JFWbzNVlgUIR79tiGlaliyAjTfh8cVo+sovs
	 Zf0qtjUtxNdE+enBHdx/SoUjg4XTdWhKo1E9Cw3JDQqa2QNqbP6roWSveZcgbKByYY
	 u1kGW4HkXHsIbz364QHPma0yJrxgNJqgw8txrHtMUGMzq8CzEpmTvJIcUflZesjOQO
	 hMjrnKaZxEfOSo72qJpGUddcPsp6Rag5IxCIIyWNvAORAhmC8jp0NveqasSz6ceZti
	 cKLJCFHmP8tgM/qYXGge3d1hQBnhVyLPZ/IqOkQKjj41GF0X1ZkvlsbfDMYi42+4mk
	 Ygc6eYKKTpabw==
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
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v1] mm: fix MAX_FOLIO_ORDER on powerpc configs with hugetlb
Date: Wed, 12 Nov 2025 15:56:32 +0100
Message-ID: <20251112145632.508687-1-david@kernel.org>
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
GiB (possible on arm64 and powerpc). Note that on some powerpc
configurations, whether we actually have gigantic pages
depends on the setting of CONFIG_ARCH_FORCE_MAX_ORDER, but there is
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
of tail pages of such gigantic folios correctly), it doesn't relevant
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
Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
 arch/powerpc/Kconfig |  1 +
 include/linux/mm.h   | 12 +++++++++---
 mm/Kconfig           |  7 +++++++
 3 files changed, 17 insertions(+), 3 deletions(-)

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
diff --git a/include/linux/mm.h b/include/linux/mm.h
index d16b33bacc32b..63aea4b3fb5d9 100644
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
@@ -2087,10 +2087,16 @@ static inline unsigned long folio_nr_pages(const struct folio *folio)
  * pages are guaranteed to be contiguous.
  */
 #define MAX_FOLIO_ORDER		PFN_SECTION_SHIFT
-#else
+#elif defined(CONFIG_HUGETLB_PAGE)
 /*
  * There is no real limit on the folio size. We limit them to the maximum we
- * currently expect (e.g., hugetlb, dax).
+ * currently expect: with hugetlb, we expect no folios larger than 16 GiB.
+ */
+#define MAX_FOLIO_ORDER		get_order(SZ_16G)
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
-- 
2.51.0


