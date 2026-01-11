Return-Path: <linuxppc-dev+bounces-15520-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3158D0E546
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jan 2026 09:29:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dppZN6qRVz2ypk;
	Sun, 11 Jan 2026 19:29:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768120140;
	cv=none; b=osuAPwNKi23KoMU/hBvSREozyeHSdhRlVou6nh/GcIYHQWNHE/JMsuhfFuS/vBzAmn9vPqPqIImpuNJpBBCHGLxhXl45E/J/Kznw0k4/KRe0o3akLXUuXmmoxSj/FF6PCmDV1bvF51i8cM3RkrA7PxcfHD6pBn+zwkZaLunztyEjyO7H1obdIdgOfUPwybU0c+Z2jOcFWvw0GeDW4Z1d4NIXU+ldBUNty5QvPrQVdbybpGi2WSJ2RFC6fnKVPMBFMhBiHDJo6CdF/i5vbxM1JrtPmf1qgULvlrWrGx1ZuQK3HWs0dEbOOg7t//qtx8QIsMccoc1k2IcWoKYI34a9+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768120140; c=relaxed/relaxed;
	bh=0d/fgmJzUuC3jidaBzidx264jdRyo/z9z8uWc0qcsnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XC2j1MZTxSz//N1zKg5sM+aW5eM3cIu9Zvj7W+vqzSLwXEd6JZFabWga+ZjaacMOChBvfMtcdiqEUpYNcYWHKEqhpONj1ezAR6m29u3kiYK8m+grL3uxyCAau2ez6sk9F5n5kQg8gl+/pbu0/RHImDO+ABU2Lvi0Z0/Stmk/+Q1nQipLNpvsUQvfxHyqSfM5sVT+KBLFU76bzT0ngdKav8dJr9Ifv+OmOkEwUq6qBmNwRhYc68FVFncSCMmj/wpxfcpp27dDEKT9PuDCuMCFE2CaCsng+GwyTP3jCWCkvVGQL5fw7FMUfNqBwhtstdM+SIF5Sg6s5DVyaGmu2GHaPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VYPj9b0f; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VYPj9b0f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dppZN0Y4jz2yVB
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jan 2026 19:29:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E777D60122;
	Sun, 11 Jan 2026 08:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098BDC4CEF7;
	Sun, 11 Jan 2026 08:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768120107;
	bh=kMKUIBkqL1O4S3ZKa4SfOsA0W3WTf/VpmW+w2Z3QAsw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VYPj9b0fMhtgyRG3tBVmUyXLPKxdmg5x150SQusjLBH6QHSmY1li0V6oPCPL6xqZU
	 MEH229e0ZoAbJmeWNRLP1sB8qDlLHorYQdPuaHyK4EVKvweaUln12AkVcyJwjAVueU
	 jQgOmVx+665lxbPQD+mKBi6zrOHJcbjSgzO6VzA/F64XeumQv5zG8ZIrvb2xtg/sTh
	 4EeqXNUXciJtl4cNlL7m6I36LbPHvL3zM8JoGAdiJetJld4sNjuiGSfNmtjBYZ+NOJ
	 CUQK3WJ9+t9B/g7SLLj+wsdLaKXwdPiOjft1xYqs5eoseVy+W6YpOc1XzTcKIp3R/g
	 2XT1tnE6x3bwA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Klara Modin <klarasmodin@gmail.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org
Subject: [PATCH v3 28/29] mm/hugetlb: drop hugetlb_cma_check()
Date: Sun, 11 Jan 2026 10:21:02 +0200
Message-ID: <20260111082105.290734-29-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260111082105.290734-1-rppt@kernel.org>
References: <20260111082105.290734-1-rppt@kernel.org>
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

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

hugetlb_cma_check() was required when the ordering of hugetlb_cma_reserve()
and hugetlb_bootmem_alloc() was architecture depended.

Since hugetlb_cma_reserve() is always called before hugetlb_bootmem_alloc()
there is no need to check whether hugetlb_cma_reserve() was already called.

Drop unneeded hugetlb_cma_check() function.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Muchun Song <muchun.song@linux.dev>
---
 mm/hugetlb.c     |  1 -
 mm/hugetlb_cma.c | 16 +++-------------
 mm/hugetlb_cma.h |  5 -----
 3 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 51273baec9e5..82b322ae3fdc 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4159,7 +4159,6 @@ static int __init hugetlb_init(void)
 		}
 	}
 
-	hugetlb_cma_check();
 	hugetlb_init_hstates();
 	gather_bootmem_prealloc();
 	report_hugepages();
diff --git a/mm/hugetlb_cma.c b/mm/hugetlb_cma.c
index b1eb5998282c..f5e79103e110 100644
--- a/mm/hugetlb_cma.c
+++ b/mm/hugetlb_cma.c
@@ -85,9 +85,6 @@ hugetlb_cma_alloc_bootmem(struct hstate *h, int *nid, bool node_exact)
 	return m;
 }
 
-
-static bool cma_reserve_called __initdata;
-
 static int __init cmdline_parse_hugetlb_cma(char *p)
 {
 	int nid, count = 0;
@@ -149,8 +146,10 @@ void __init hugetlb_cma_reserve(void)
 		return;
 
 	order = arch_hugetlb_cma_order();
-	if (!order)
+	if (!order) {
+		pr_warn("hugetlb_cma: the option isn't supported by current arch\n");
 		return;
+	}
 
 	/*
 	 * HugeTLB CMA reservation is required for gigantic
@@ -159,7 +158,6 @@ void __init hugetlb_cma_reserve(void)
 	 * breaking this assumption.
 	 */
 	VM_WARN_ON(order <= MAX_PAGE_ORDER);
-	cma_reserve_called = true;
 
 	hugetlb_bootmem_set_nodes();
 
@@ -253,14 +251,6 @@ void __init hugetlb_cma_reserve(void)
 		hugetlb_cma_size = 0;
 }
 
-void __init hugetlb_cma_check(void)
-{
-	if (!hugetlb_cma_size || cma_reserve_called)
-		return;
-
-	pr_warn("hugetlb_cma: the option isn't supported by current arch\n");
-}
-
 bool hugetlb_cma_exclusive_alloc(void)
 {
 	return hugetlb_cma_only;
diff --git a/mm/hugetlb_cma.h b/mm/hugetlb_cma.h
index 2c2ec8a7e134..78186839df3a 100644
--- a/mm/hugetlb_cma.h
+++ b/mm/hugetlb_cma.h
@@ -8,7 +8,6 @@ struct folio *hugetlb_cma_alloc_folio(int order, gfp_t gfp_mask,
 				      int nid, nodemask_t *nodemask);
 struct huge_bootmem_page *hugetlb_cma_alloc_bootmem(struct hstate *h, int *nid,
 						    bool node_exact);
-void hugetlb_cma_check(void);
 bool hugetlb_cma_exclusive_alloc(void);
 unsigned long hugetlb_cma_total_size(void);
 void hugetlb_cma_validate_params(void);
@@ -31,10 +30,6 @@ struct huge_bootmem_page *hugetlb_cma_alloc_bootmem(struct hstate *h, int *nid,
 	return NULL;
 }
 
-static inline void hugetlb_cma_check(void)
-{
-}
-
 static inline bool hugetlb_cma_exclusive_alloc(void)
 {
 	return false;
-- 
2.51.0


