Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 958D7939B31
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 08:56:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S2VpYoVm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSnxG3mftz3ccX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 16:56:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S2VpYoVm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSnjN6lpJz30VX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 16:46:00 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A67E2CE0BBB;
	Tue, 23 Jul 2024 06:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB686C4AF0B;
	Tue, 23 Jul 2024 06:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721717159;
	bh=rbVckViSVk+mWr74pnwR2o+U7UjRpaIJSEgglVAH+jA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S2VpYoVmHlTiPzU8OqPPA83vMOFMf/PIBBBHYwi5Wo+QDdtmOGBN5Sscv5TCpLxgN
	 NZO/x31toKmJYKIOruH56bVAhmJIg6nm0awNn5f/75Hd+0paV3Uw+mTYwKmGwaC8Zq
	 wb7M9OglSTyQU+edoI3r5AnDjjNVZA7pNqCl13LuGKJXc4OhXnw5Y2jv+06YxhonfG
	 2hX1hXiw8/5LQKlf61IepqOIywzamX/NcfHLYTl5mEaMJIfQdGJ1cGB68C0lPPiz8c
	 IoYAnoWIrKfPiDCSKfBVWMaTsbhpQXAwtUx1ww+ePFzxX42z9MKcussciG9QVw3dBx
	 XAvULj29Krlrw==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 19/25] mm: introduce numa_emulation
Date: Tue, 23 Jul 2024 09:41:50 +0300
Message-ID: <20240723064156.4009477-20-rppt@kernel.org>
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

Move numa_emulation codfrom arch/x86 to mm/numa_emulation.c

This code will be later reused by arch_numa.

No functional changes.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/Kconfig                     |  8 --------
 arch/x86/include/asm/numa.h          | 12 ------------
 arch/x86/mm/Makefile                 |  1 -
 arch/x86/mm/numa_internal.h          | 11 -----------
 include/linux/numa_memblks.h         | 17 +++++++++++++++++
 mm/Kconfig                           |  8 ++++++++
 mm/Makefile                          |  1 +
 {arch/x86/mm => mm}/numa_emulation.c |  4 +---
 8 files changed, 27 insertions(+), 35 deletions(-)
 rename {arch/x86/mm => mm}/numa_emulation.c (99%)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index d8084f37157c..a42735c126fa 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1592,14 +1592,6 @@ config X86_64_ACPI_NUMA
 	help
 	  Enable ACPI SRAT based node topology detection.
 
-config NUMA_EMU
-	bool "NUMA emulation"
-	depends on NUMA
-	help
-	  Enable NUMA emulation. A flat machine will be split
-	  into virtual nodes when booted with "numa=fake=N", where N is the
-	  number of nodes. This is only useful for debugging.
-
 config NODES_SHIFT
 	int "Maximum NUMA Nodes (as a power of 2)" if !MAXSMP
 	range 1 10
diff --git a/arch/x86/include/asm/numa.h b/arch/x86/include/asm/numa.h
index 203100500f24..5469d7a7c40f 100644
--- a/arch/x86/include/asm/numa.h
+++ b/arch/x86/include/asm/numa.h
@@ -65,16 +65,4 @@ static inline void init_gi_nodes(void)			{ }
 void debug_cpumask_set_cpu(unsigned int cpu, int node, bool enable);
 #endif
 
-#ifdef CONFIG_NUMA_EMU
-int numa_emu_cmdline(char *str);
-void __init numa_emu_update_cpu_to_node(int *emu_nid_to_phys,
-					unsigned int nr_emu_nids);
-u64 __init numa_emu_dma_end(void);
-#else /* CONFIG_NUMA_EMU */
-static inline int numa_emu_cmdline(char *str)
-{
-	return -EINVAL;
-}
-#endif /* CONFIG_NUMA_EMU */
-
 #endif	/* _ASM_X86_NUMA_H */
diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
index 8d3a00e5c528..690fbf48e853 100644
--- a/arch/x86/mm/Makefile
+++ b/arch/x86/mm/Makefile
@@ -57,7 +57,6 @@ obj-$(CONFIG_MMIOTRACE_TEST)	+= testmmiotrace.o
 obj-$(CONFIG_NUMA)		+= numa.o numa_$(BITS).o
 obj-$(CONFIG_AMD_NUMA)		+= amdtopology.o
 obj-$(CONFIG_ACPI_NUMA)		+= srat.o
-obj-$(CONFIG_NUMA_EMU)		+= numa_emulation.o
 
 obj-$(CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS)	+= pkeys.o
 obj-$(CONFIG_RANDOMIZE_MEMORY)			+= kaslr.o
diff --git a/arch/x86/mm/numa_internal.h b/arch/x86/mm/numa_internal.h
index 249e3aaeadce..11e1ff370c10 100644
--- a/arch/x86/mm/numa_internal.h
+++ b/arch/x86/mm/numa_internal.h
@@ -7,15 +7,4 @@
 
 void __init x86_numa_init(void);
 
-struct numa_meminfo;
-
-#ifdef CONFIG_NUMA_EMU
-void __init numa_emulation(struct numa_meminfo *numa_meminfo,
-			   int numa_dist_cnt);
-#else
-static inline void numa_emulation(struct numa_meminfo *numa_meminfo,
-				  int numa_dist_cnt)
-{ }
-#endif
-
 #endif	/* __X86_MM_NUMA_INTERNAL_H */
diff --git a/include/linux/numa_memblks.h b/include/linux/numa_memblks.h
index 968a590535ac..f81f98678074 100644
--- a/include/linux/numa_memblks.h
+++ b/include/linux/numa_memblks.h
@@ -34,6 +34,23 @@ int __init numa_register_meminfo(struct numa_meminfo *mi);
 void __init numa_nodemask_from_meminfo(nodemask_t *nodemask,
 				       const struct numa_meminfo *mi);
 
+#ifdef CONFIG_NUMA_EMU
+int numa_emu_cmdline(char *str);
+void __init numa_emu_update_cpu_to_node(int *emu_nid_to_phys,
+					unsigned int nr_emu_nids);
+u64 __init numa_emu_dma_end(void);
+void __init numa_emulation(struct numa_meminfo *numa_meminfo,
+			   int numa_dist_cnt);
+#else
+static inline void numa_emulation(struct numa_meminfo *numa_meminfo,
+				  int numa_dist_cnt)
+{ }
+static inline int numa_emu_cmdline(char *str)
+{
+	return -EINVAL;
+}
+#endif /* CONFIG_NUMA_EMU */
+
 #endif /* CONFIG_NUMA_MEMBLKS */
 
 #endif	/* __NUMA_MEMBLKS_H */
diff --git a/mm/Kconfig b/mm/Kconfig
index 15c6efbaa1df..ae58eecdefdc 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1252,6 +1252,14 @@ config EXECMEM
 config NUMA_MEMBLKS
 	bool
 
+config NUMA_EMU
+	bool "NUMA emulation"
+	depends on NUMA_MEMBLKS
+	help
+	  Enable NUMA emulation. A flat machine will be split
+	  into virtual nodes when booted with "numa=fake=N", where N is the
+	  number of nodes. This is only useful for debugging.
+
 source "mm/damon/Kconfig"
 
 endmenu
diff --git a/mm/Makefile b/mm/Makefile
index 17bc4013a2c5..d5b1b30f76e3 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -141,3 +141,4 @@ obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
 obj-$(CONFIG_EXECMEM) += execmem.o
 obj-$(CONFIG_NUMA) += numa.o
 obj-$(CONFIG_NUMA_MEMBLKS) += numa_memblks.o
+obj-$(CONFIG_NUMA_EMU) += numa_emulation.o
diff --git a/arch/x86/mm/numa_emulation.c b/mm/numa_emulation.c
similarity index 99%
rename from arch/x86/mm/numa_emulation.c
rename to mm/numa_emulation.c
index 33610026b7a3..031fb9961bf7 100644
--- a/arch/x86/mm/numa_emulation.c
+++ b/mm/numa_emulation.c
@@ -7,9 +7,7 @@
 #include <linux/topology.h>
 #include <linux/memblock.h>
 #include <linux/numa_memblks.h>
-#include <asm/dma.h>
-
-#include "numa_internal.h"
+#include <asm/numa.h>
 
 #define FAKE_NODE_MIN_SIZE	((u64)32 << 20)
 #define FAKE_NODE_MIN_HASH_MASK	(~(FAKE_NODE_MIN_SIZE - 1UL))
-- 
2.43.0

