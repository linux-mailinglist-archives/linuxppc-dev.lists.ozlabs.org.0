Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D83B594A12D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 08:56:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZAhqcz16;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wf1DN5cxFz3cyd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 16:56:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZAhqcz16;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wf0zx0TXWz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 16:45:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 06E1BCE0F7B;
	Wed,  7 Aug 2024 06:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7E8C32782;
	Wed,  7 Aug 2024 06:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723013131;
	bh=uFZpM9j6CUoUp5LvLIUDFjYYiDNmZI+8dY+ECAR0IcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZAhqcz164yz+M7OHGjtY0nzqFdYWaLV/NNgIPVOA4K8F4CFEwTXB6dIh9N53rnUG+
	 eM/zJBakc9tU+9kfI5vg1r8GW/NSORbAj4Sb5G/mkRWNLozqM2YV6XNLcTzCme/7Sc
	 gjZZ50TGWQQouDuouIM7p6qTp2Ctnfbj0v4WnjwQCsec4Nn+CM514XgUo3xqOkYQqi
	 tgcg1h+tY7HVyODQWcIYLAX+/DvoamSorlXHW8bfCLxZJPagG94+C2TGM/69lvOjX8
	 RiPeFAK+fcM0RhtG1jFcEn2U3Wbldv/LB6IQRUgvveaAE3oCuym1gO/VQFvbZRCN91
	 G6Eh8Wm6IFrjQ==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 20/26] mm: numa_memblks: introduce numa_memblks_init
Date: Wed,  7 Aug 2024 09:41:04 +0300
Message-ID: <20240807064110.1003856-21-rppt@kernel.org>
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Vasily Gorbik <gor@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Move most of x86::numa_init() to numa_memblks so that the latter will be
more self-contained.

With this numa_memblk data structures should not be exposed to the
architecture specific code.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Tested-by: Zi Yan <ziy@nvidia.com> # for x86_64 and arm64
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> [arm64 + CXL via QEMU]
Acked-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/mm/numa.c           | 40 ++++-------------------------------
 include/linux/numa_memblks.h |  3 +++
 mm/numa_memblks.c            | 41 ++++++++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+), 36 deletions(-)

diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 095502095503..d23287611449 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -115,13 +115,9 @@ void __init setup_node_to_cpumask_map(void)
 	pr_debug("Node to cpumask map for %u nodes\n", nr_node_ids);
 }
 
-static int __init numa_register_memblks(struct numa_meminfo *mi)
+static int __init numa_register_nodes(void)
 {
-	int nid, err;
-
-	err = numa_register_meminfo(mi);
-	if (err)
-		return err;
+	int nid;
 
 	if (!memblock_validate_numa_coverage(SZ_1M))
 		return -EINVAL;
@@ -175,39 +171,11 @@ static int __init numa_init(int (*init_func)(void))
 	for (i = 0; i < MAX_LOCAL_APIC; i++)
 		set_apicid_to_node(i, NUMA_NO_NODE);
 
-	nodes_clear(numa_nodes_parsed);
-	nodes_clear(node_possible_map);
-	nodes_clear(node_online_map);
-	memset(&numa_meminfo, 0, sizeof(numa_meminfo));
-	WARN_ON(memblock_set_node(0, ULLONG_MAX, &memblock.memory,
-				  NUMA_NO_NODE));
-	WARN_ON(memblock_set_node(0, ULLONG_MAX, &memblock.reserved,
-				  NUMA_NO_NODE));
-	/* In case that parsing SRAT failed. */
-	WARN_ON(memblock_clear_hotplug(0, ULLONG_MAX));
-	numa_reset_distance();
-
-	ret = init_func();
+	ret = numa_memblks_init(init_func, /* memblock_force_top_down */ true);
 	if (ret < 0)
 		return ret;
 
-	/*
-	 * We reset memblock back to the top-down direction
-	 * here because if we configured ACPI_NUMA, we have
-	 * parsed SRAT in init_func(). It is ok to have the
-	 * reset here even if we did't configure ACPI_NUMA
-	 * or acpi numa init fails and fallbacks to dummy
-	 * numa init.
-	 */
-	memblock_set_bottom_up(false);
-
-	ret = numa_cleanup_meminfo(&numa_meminfo);
-	if (ret < 0)
-		return ret;
-
-	numa_emulation(&numa_meminfo, numa_distance_cnt);
-
-	ret = numa_register_memblks(&numa_meminfo);
+	ret = numa_register_nodes();
 	if (ret < 0)
 		return ret;
 
diff --git a/include/linux/numa_memblks.h b/include/linux/numa_memblks.h
index f81f98678074..07381320848f 100644
--- a/include/linux/numa_memblks.h
+++ b/include/linux/numa_memblks.h
@@ -34,6 +34,9 @@ int __init numa_register_meminfo(struct numa_meminfo *mi);
 void __init numa_nodemask_from_meminfo(nodemask_t *nodemask,
 				       const struct numa_meminfo *mi);
 
+int __init numa_memblks_init(int (*init_func)(void),
+			     bool memblock_force_top_down);
+
 #ifdef CONFIG_NUMA_EMU
 int numa_emu_cmdline(char *str);
 void __init numa_emu_update_cpu_to_node(int *emu_nid_to_phys,
diff --git a/mm/numa_memblks.c b/mm/numa_memblks.c
index e3c3519725d4..7749b6f6b250 100644
--- a/mm/numa_memblks.c
+++ b/mm/numa_memblks.c
@@ -415,6 +415,47 @@ int __init numa_register_meminfo(struct numa_meminfo *mi)
 	return 0;
 }
 
+int __init numa_memblks_init(int (*init_func)(void),
+			     bool memblock_force_top_down)
+{
+	int ret;
+
+	nodes_clear(numa_nodes_parsed);
+	nodes_clear(node_possible_map);
+	nodes_clear(node_online_map);
+	memset(&numa_meminfo, 0, sizeof(numa_meminfo));
+	WARN_ON(memblock_set_node(0, ULLONG_MAX, &memblock.memory,
+				  NUMA_NO_NODE));
+	WARN_ON(memblock_set_node(0, ULLONG_MAX, &memblock.reserved,
+				  NUMA_NO_NODE));
+	/* In case that parsing SRAT failed. */
+	WARN_ON(memblock_clear_hotplug(0, ULLONG_MAX));
+	numa_reset_distance();
+
+	ret = init_func();
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * We reset memblock back to the top-down direction
+	 * here because if we configured ACPI_NUMA, we have
+	 * parsed SRAT in init_func(). It is ok to have the
+	 * reset here even if we did't configure ACPI_NUMA
+	 * or acpi numa init fails and fallbacks to dummy
+	 * numa init.
+	 */
+	if (memblock_force_top_down)
+		memblock_set_bottom_up(false);
+
+	ret = numa_cleanup_meminfo(&numa_meminfo);
+	if (ret < 0)
+		return ret;
+
+	numa_emulation(&numa_meminfo, numa_distance_cnt);
+
+	return numa_register_meminfo(&numa_meminfo);
+}
+
 static int __init cmp_memblk(const void *a, const void *b)
 {
 	const struct numa_memblk *ma = *(const struct numa_memblk **)a;
-- 
2.43.0

