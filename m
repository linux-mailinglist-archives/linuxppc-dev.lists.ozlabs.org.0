Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DE894A082
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 08:47:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Du37ztns;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wf12d0cLmz3d89
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 16:47:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Du37ztns;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wf0xB2yC1z3cfB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 16:43:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1BF50CE0FBB;
	Wed,  7 Aug 2024 06:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13981C4AF0E;
	Wed,  7 Aug 2024 06:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723012988;
	bh=e2bRBXW1tVG35BfXPznN2F4VBaEe2hanvO4z/dzE1s4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Du37ztnse1Ii8FvthWxnQmQGrffnOCM7CijKaU8GwxbNiaKrxeHgT5CcgcRvQX0d4
	 7HnSOfSXHdLWNTud3qgp0veIEysIAEAuZkoTNTPOKfdgleEPMEJRWikkynQIyRe1yI
	 PYkEynGrNkSreZ/8nN7vqwwZumQyHZ+V85KYkY8NpS0OoDkgzVRgDCVOVEnjaLxTpC
	 NlbrppOOSqutT7CXORlXHtDvIrsHJ6ofqFyxmrbuD95Ad1BMf+KVt//l0Z09zmyqus
	 0mvuhylxy2Cjmkln1PiqBSMUnGadwLQb6YB/RQtwdpQgl1NqlwtNMT2mp4rUFQxaqM
	 Bh/E5qKQvDtew==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/26] mm: drop CONFIG_HAVE_ARCH_NODEDATA_EXTENSION
Date: Wed,  7 Aug 2024 09:40:52 +0300
Message-ID: <20240807064110.1003856-9-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807064110.1003856-1-rppt@kernel.org>
References: <20240807064110.1003856-1-rppt@kernel.org>
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

Replace the call to arch_alloc_nodedata() in free_area_init() with a
new helper alloc_offline_node_data(), remove arch_refresh_nodedata()
and cleanup include/linux/memory_hotplug.h from the associated
ifdefery.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Tested-by: Zi Yan <ziy@nvidia.com> # for x86_64 and arm64
Acked-by: Dan Williams <dan.j.williams@intel.com>
---
 include/linux/memory_hotplug.h | 48 ----------------------------------
 include/linux/numa.h           |  4 +++
 mm/mm_init.c                   | 10 ++-----
 mm/numa.c                      | 12 +++++++++
 4 files changed, 18 insertions(+), 56 deletions(-)

diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index ebe876930e78..b27ddce5d324 100644
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
 
diff --git a/include/linux/numa.h b/include/linux/numa.h
index e5841d4057ab..b41b1569781b 100644
--- a/include/linux/numa.h
+++ b/include/linux/numa.h
@@ -33,6 +33,8 @@ static inline bool numa_valid_node(int nid)
 extern struct pglist_data *node_data[];
 #define NODE_DATA(nid)	(node_data[nid])
 
+void __init alloc_offline_node_data(int nid);
+
 /* Generic implementation available */
 int numa_nearest_node(int node, unsigned int state);
 
@@ -60,6 +62,8 @@ static inline int phys_to_target_node(u64 start)
 {
 	return 0;
 }
+
+static inline void alloc_offline_node_data(int nid) {}
 #endif
 
 #define numa_map_to_online_node(node) numa_nearest_node(node, N_ONLINE)
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 75c3bd42799b..2785be04e7bb 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1836,14 +1836,8 @@ void __init free_area_init(unsigned long *max_zone_pfn)
 	for_each_node(nid) {
 		pg_data_t *pgdat;
 
-		if (!node_online(nid)) {
-			/* Allocator not initialized yet */
-			pgdat = arch_alloc_nodedata(nid);
-			if (!pgdat)
-				panic("Cannot allocate %zuB for node %d.\n",
-				       sizeof(*pgdat), nid);
-			arch_refresh_nodedata(nid, pgdat);
-		}
+		if (!node_online(nid))
+			alloc_offline_node_data(nid);
 
 		pgdat = NODE_DATA(nid);
 		free_area_init_node(nid);
diff --git a/mm/numa.c b/mm/numa.c
index 8c157d41c026..64e1b7d2c1ee 100644
--- a/mm/numa.c
+++ b/mm/numa.c
@@ -6,6 +6,18 @@
 struct pglist_data *node_data[MAX_NUMNODES];
 EXPORT_SYMBOL(node_data);
 
+void __init alloc_offline_node_data(int nid)
+{
+	pg_data_t *pgdat;
+
+	pgdat = memblock_alloc(sizeof(*pgdat), SMP_CACHE_BYTES);
+	if (!pgdat)
+		panic("Cannot allocate %zuB for node %d.\n",
+		      sizeof(*pgdat), nid);
+
+	node_data[nid] = pgdat;
+}
+
 /* Stub functions: */
 
 #ifndef memory_add_physaddr_to_nid
-- 
2.43.0

