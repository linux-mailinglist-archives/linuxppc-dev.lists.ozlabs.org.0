Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BED939B26
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 08:52:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NVxK/dES;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSnsC4kd8z2xLW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 16:52:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NVxK/dES;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSnhG35fqz3cTQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 16:45:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A967360B98;
	Tue, 23 Jul 2024 06:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41369C4AF0B;
	Tue, 23 Jul 2024 06:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721717100;
	bh=YsRpIjHui/E4Nyhzc91eYVtJPXNfygPjzJVhFxfItC0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NVxK/dESWkZTLqLMzH+QJWFfHzOuDB5Zg9jxVFrm55l8etkE62sOi/PKgAV8Do0QY
	 9rqjDpdBneIIs6hLXbaC9H5ardG4k9hNSS/24b9JnxWSwubCihG79QaFgLXjiOt26i
	 p5kfVp+usEUs2GaoIHsD2Gg+yWKdMTm1ax+yF74qZvG4LhsUAIfWXOI8A0pzR+4k2C
	 4L30n/ESR2jhEAg8I5Cgx9nuBQXnCjuKDvQSU/NlgeR8s9cl3adIfhZnMK/jclT8fC
	 sCU2WFhWD8J2tFeo6YMWlMfyl6EZSdgTeivf6nLJX9D94/RMTIzVb5nPxrBdMYvlet
	 +qODh3gpzSY0w==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/25] x86/numa_emu: split __apicid_to_node update to a helper function
Date: Tue, 23 Jul 2024 09:41:45 +0300
Message-ID: <20240723064156.4009477-15-rppt@kernel.org>
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Vasily Gorbik <gor@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

This is required to make numa emulation code architecture independent so
that it can be moved to generic code in following commits.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 arch/x86/include/asm/numa.h  |  2 ++
 arch/x86/mm/numa.c           | 22 ++++++++++++++++++++++
 arch/x86/mm/numa_emulation.c | 14 +-------------
 3 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/arch/x86/include/asm/numa.h b/arch/x86/include/asm/numa.h
index 2dab1ada96cf..7017d540894a 100644
--- a/arch/x86/include/asm/numa.h
+++ b/arch/x86/include/asm/numa.h
@@ -72,6 +72,8 @@ void debug_cpumask_set_cpu(int cpu, int node, bool enable);
 
 #ifdef CONFIG_NUMA_EMU
 int numa_emu_cmdline(char *str);
+void __init numa_emu_update_cpu_to_node(int *emu_nid_to_phys,
+					unsigned int nr_emu_nids);
 #else /* CONFIG_NUMA_EMU */
 static inline int numa_emu_cmdline(char *str)
 {
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index cfe7e5477cf8..9180d524cfe4 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -848,6 +848,28 @@ EXPORT_SYMBOL(cpumask_of_node);
 
 #endif	/* !CONFIG_DEBUG_PER_CPU_MAPS */
 
+#ifdef CONFIG_NUMA_EMU
+void __init numa_emu_update_cpu_to_node(int *emu_nid_to_phys,
+					unsigned int nr_emu_nids)
+{
+	int i, j;
+
+	/*
+	 * Transform __apicid_to_node table to use emulated nids by
+	 * reverse-mapping phys_nid.  The maps should always exist but fall
+	 * back to zero just in case.
+	 */
+	for (i = 0; i < ARRAY_SIZE(__apicid_to_node); i++) {
+		if (__apicid_to_node[i] == NUMA_NO_NODE)
+			continue;
+		for (j = 0; j < nr_emu_nids; j++)
+			if (__apicid_to_node[i] == emu_nid_to_phys[j])
+				break;
+		__apicid_to_node[i] = j < nr_emu_nids ? j : 0;
+	}
+}
+#endif /* CONFIG_NUMA_EMU */
+
 #ifdef CONFIG_NUMA_KEEP_MEMINFO
 static int meminfo_to_nid(struct numa_meminfo *mi, u64 start)
 {
diff --git a/arch/x86/mm/numa_emulation.c b/arch/x86/mm/numa_emulation.c
index 439804e21962..f2746e52ab93 100644
--- a/arch/x86/mm/numa_emulation.c
+++ b/arch/x86/mm/numa_emulation.c
@@ -476,19 +476,7 @@ void __init numa_emulation(struct numa_meminfo *numa_meminfo, int numa_dist_cnt)
 		    ei.blk[i].nid != NUMA_NO_NODE)
 			node_set(ei.blk[i].nid, numa_nodes_parsed);
 
-	/*
-	 * Transform __apicid_to_node table to use emulated nids by
-	 * reverse-mapping phys_nid.  The maps should always exist but fall
-	 * back to zero just in case.
-	 */
-	for (i = 0; i < ARRAY_SIZE(__apicid_to_node); i++) {
-		if (__apicid_to_node[i] == NUMA_NO_NODE)
-			continue;
-		for (j = 0; j < ARRAY_SIZE(emu_nid_to_phys); j++)
-			if (__apicid_to_node[i] == emu_nid_to_phys[j])
-				break;
-		__apicid_to_node[i] = j < ARRAY_SIZE(emu_nid_to_phys) ? j : 0;
-	}
+	numa_emu_update_cpu_to_node(emu_nid_to_phys, ARRAY_SIZE(emu_nid_to_phys));
 
 	/* make sure all emulated nodes are mapped to a physical node */
 	for (i = 0; i < ARRAY_SIZE(emu_nid_to_phys); i++)
-- 
2.43.0

