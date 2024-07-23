Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4078E939AB2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 08:47:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LWkFKSq6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSnlY1HkFz3cjS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 16:47:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LWkFKSq6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSnfh423Fz3cXQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 16:43:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 23612CE0DFA;
	Tue, 23 Jul 2024 06:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4FBC4AF0B;
	Tue, 23 Jul 2024 06:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721717018;
	bh=KMUHd3pa3/sGl5j0P1xwN5TvNIt/JcquxvbUe/9/m24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LWkFKSq6/pd3Gz6zgozY8S3W7YN4XbwG3Jb+Xk1cnC7gLl9AmB1RBeBbxRXvm10mo
	 9bPr1wCujAi72DOi3ZZ6MxSR662xYGaP/kzvSESqPfaz1lvZuDUlpNyX5dy0tZ3lAx
	 vz+FWcxLgBq3UZrFr48M/v7opiixPXJGVSfeeBAwDCwB2EKwm/q6Ap7lwJBWSb6Ng5
	 jnpe/p1tJ4ATxte1nyJpzrRcOlfhLY+Hu2RL+8RHtYPodmwgh7+5jPEPXLaZj05dRa
	 DhWm6z0Df650Ih1lo97lRpDW1J7ogEdU4fxwaf5/0kt8pUV2Fa2hUe97zXFTJbJXes
	 bhLJjXOhO3S/w==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/25] mm: drop CONFIG_HAVE_ARCH_NODEDATA_EXTENSION
Date: Tue, 23 Jul 2024 09:41:38 +0300
Message-ID: <20240723064156.4009477-8-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240723064156.4009477-1-rppt@kernel.org>
References: <20240723064156.4009477-1-rppt@kernel.org>
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Vasily Gorbik <gor@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

There are no users of HAVE_ARCH_NODEDATA_EXTENSION left, so
arch_alloc_nodedata() and arch_refresh_nodedata() are not needed
anymore.

Replace the call to arch_alloc_nodedata() in free_area_init() with
memblock_alloc(), remove arch_refresh_nodedata() and cleanup
include/linux/memory_hotplug.h from the associated ifdefery.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/memory_hotplug.h | 48 ----------------------------------
 mm/mm_init.c                   |  3 +--
 2 files changed, 1 insertion(+), 50 deletions(-)

diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index 7a9ff464608d..978c0dfb64a1 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -16,54 +16,6 @@ struct resource;
 struct vmem_altmap;
 struct dev_pagemap;
 
-#ifdef CONFIG_HAVE_ARCH_NODEDATA_EXTENSION
-/*
- * For supporting node-hotadd, we have to allocate a new pgdat.
- *
- * If an arch has generic style NODE_DATA(),
- * node_data[nid] = kzalloc() works well. But it depends on the architecture.
- *
- * In general, generic_alloc_nodedata() is used.
- *
- */
-extern pg_data_t *arch_alloc_nodedata(int nid);
-extern void arch_refresh_nodedata(int nid, pg_data_t *pgdat);
-
-#else /* CONFIG_HAVE_ARCH_NODEDATA_EXTENSION */
-
-#define arch_alloc_nodedata(nid)	generic_alloc_nodedata(nid)
-
-#ifdef CONFIG_NUMA
-/*
- * XXX: node aware allocation can't work well to get new node's memory at this time.
- *	Because, pgdat for the new node is not allocated/initialized yet itself.
- *	To use new node's memory, more consideration will be necessary.
- */
-#define generic_alloc_nodedata(nid)				\
-({								\
-	memblock_alloc(sizeof(*pgdat), SMP_CACHE_BYTES);	\
-})
-
-extern pg_data_t *node_data[];
-static inline void arch_refresh_nodedata(int nid, pg_data_t *pgdat)
-{
-	node_data[nid] = pgdat;
-}
-
-#else /* !CONFIG_NUMA */
-
-/* never called */
-static inline pg_data_t *generic_alloc_nodedata(int nid)
-{
-	BUG();
-	return NULL;
-}
-static inline void arch_refresh_nodedata(int nid, pg_data_t *pgdat)
-{
-}
-#endif /* CONFIG_NUMA */
-#endif /* CONFIG_HAVE_ARCH_NODEDATA_EXTENSION */
-
 #ifdef CONFIG_MEMORY_HOTPLUG
 struct page *pfn_to_online_page(unsigned long pfn);
 
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 3ec04933f7fd..e1b3ea0523bd 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1831,11 +1831,10 @@ void __init free_area_init(unsigned long *max_zone_pfn)
 
 		if (!node_online(nid)) {
 			/* Allocator not initialized yet */
-			pgdat = arch_alloc_nodedata(nid);
+			pgdat = memblock_alloc(sizeof(*pgdat), SMP_CACHE_BYTES);
 			if (!pgdat)
 				panic("Cannot allocate %zuB for node %d.\n",
 				       sizeof(*pgdat), nid);
-			arch_refresh_nodedata(nid, pgdat);
 		}
 
 		pgdat = NODE_DATA(nid);
-- 
2.43.0

