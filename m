Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AFE94A117
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 08:53:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CqBflqCF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wf18z25hGz3d8M
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 16:53:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CqBflqCF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wf0z23KHRz3ck2
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 16:44:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AE8E5CE0FCA;
	Wed,  7 Aug 2024 06:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDADC4AF0D;
	Wed,  7 Aug 2024 06:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723013083;
	bh=yGSuYKZLlLMiqFbedlBPLpAzRh3UdSHwetUs8HvKRLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CqBflqCFwo48PEAMrdWsrQRxrw7fFfJMbr45ShyHQaQ8CSFQtVsFRcp7gph3jC5+a
	 uqfJaSVSedg02ztdanY4YO7bMgGFPyUpgX33biZCx3JNo2rw+V8hq/6j7//Pu/7p7X
	 vmpZitvUnMmfAXTLP2gBHFxJN0e2JWnBfkTHk3S1QVU5aSVdI3q/dhzRzj7ln+F6a3
	 cPgLIoezkRWO2ek2yALWDAlP5Qn/88+bPzmOepZLouNbO2T0xjdwO6V3kNMG3bKnoj
	 V6v3fFP8AWf/Q/KwgdFAefzUUaAJOQoOPlyG8f/XEgj6McFE6BzQnSNTQUBMsAp436
	 0520SFnp6im5Q==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 16/26] x86/numa: numa_{add,remove}_cpu: make cpu parameter unsigned
Date: Wed,  7 Aug 2024 09:41:00 +0300
Message-ID: <20240807064110.1003856-17-rppt@kernel.org>
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

CPU id cannot be negative.

Making it unsigned also aligns with declarations in
include/asm-generic/numa.h used by arm64 and riscv and allows sharing
numa emulation code with these architectures.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Tested-by: Zi Yan <ziy@nvidia.com> # for x86_64 and arm64
Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> [arm64 + CXL via QEMU]
Acked-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/include/asm/numa.h  | 10 +++++-----
 arch/x86/mm/numa.c           | 10 +++++-----
 arch/x86/mm/numa_emulation.c | 10 +++++-----
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/x86/include/asm/numa.h b/arch/x86/include/asm/numa.h
index b22c85c1ef18..6fa5ea925aac 100644
--- a/arch/x86/include/asm/numa.h
+++ b/arch/x86/include/asm/numa.h
@@ -54,20 +54,20 @@ static inline int numa_cpu_node(int cpu)
 extern void numa_set_node(int cpu, int node);
 extern void numa_clear_node(int cpu);
 extern void __init init_cpu_to_node(void);
-extern void numa_add_cpu(int cpu);
-extern void numa_remove_cpu(int cpu);
+extern void numa_add_cpu(unsigned int cpu);
+extern void numa_remove_cpu(unsigned int cpu);
 extern void init_gi_nodes(void);
 #else	/* CONFIG_NUMA */
 static inline void numa_set_node(int cpu, int node)	{ }
 static inline void numa_clear_node(int cpu)		{ }
 static inline void init_cpu_to_node(void)		{ }
-static inline void numa_add_cpu(int cpu)		{ }
-static inline void numa_remove_cpu(int cpu)		{ }
+static inline void numa_add_cpu(unsigned int cpu)	{ }
+static inline void numa_remove_cpu(unsigned int cpu)	{ }
 static inline void init_gi_nodes(void)			{ }
 #endif	/* CONFIG_NUMA */
 
 #ifdef CONFIG_DEBUG_PER_CPU_MAPS
-void debug_cpumask_set_cpu(int cpu, int node, bool enable);
+void debug_cpumask_set_cpu(unsigned int cpu, int node, bool enable);
 #endif
 
 #ifdef CONFIG_NUMA_EMU
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 2acf8d17b9b8..bf56f667fe0f 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -741,12 +741,12 @@ void __init init_cpu_to_node(void)
 #ifndef CONFIG_DEBUG_PER_CPU_MAPS
 
 # ifndef CONFIG_NUMA_EMU
-void numa_add_cpu(int cpu)
+void numa_add_cpu(unsigned int cpu)
 {
 	cpumask_set_cpu(cpu, node_to_cpumask_map[early_cpu_to_node(cpu)]);
 }
 
-void numa_remove_cpu(int cpu)
+void numa_remove_cpu(unsigned int cpu)
 {
 	cpumask_clear_cpu(cpu, node_to_cpumask_map[early_cpu_to_node(cpu)]);
 }
@@ -784,7 +784,7 @@ int early_cpu_to_node(int cpu)
 	return per_cpu(x86_cpu_to_node_map, cpu);
 }
 
-void debug_cpumask_set_cpu(int cpu, int node, bool enable)
+void debug_cpumask_set_cpu(unsigned int cpu, int node, bool enable)
 {
 	struct cpumask *mask;
 
@@ -816,12 +816,12 @@ static void numa_set_cpumask(int cpu, bool enable)
 	debug_cpumask_set_cpu(cpu, early_cpu_to_node(cpu), enable);
 }
 
-void numa_add_cpu(int cpu)
+void numa_add_cpu(unsigned int cpu)
 {
 	numa_set_cpumask(cpu, true);
 }
 
-void numa_remove_cpu(int cpu)
+void numa_remove_cpu(unsigned int cpu)
 {
 	numa_set_cpumask(cpu, false);
 }
diff --git a/arch/x86/mm/numa_emulation.c b/arch/x86/mm/numa_emulation.c
index fb4814497446..235f8a4eb2fa 100644
--- a/arch/x86/mm/numa_emulation.c
+++ b/arch/x86/mm/numa_emulation.c
@@ -514,7 +514,7 @@ void __init numa_emulation(struct numa_meminfo *numa_meminfo, int numa_dist_cnt)
 }
 
 #ifndef CONFIG_DEBUG_PER_CPU_MAPS
-void numa_add_cpu(int cpu)
+void numa_add_cpu(unsigned int cpu)
 {
 	int physnid, nid;
 
@@ -532,7 +532,7 @@ void numa_add_cpu(int cpu)
 			cpumask_set_cpu(cpu, node_to_cpumask_map[nid]);
 }
 
-void numa_remove_cpu(int cpu)
+void numa_remove_cpu(unsigned int cpu)
 {
 	int i;
 
@@ -540,7 +540,7 @@ void numa_remove_cpu(int cpu)
 		cpumask_clear_cpu(cpu, node_to_cpumask_map[i]);
 }
 #else	/* !CONFIG_DEBUG_PER_CPU_MAPS */
-static void numa_set_cpumask(int cpu, bool enable)
+static void numa_set_cpumask(unsigned int cpu, bool enable)
 {
 	int nid, physnid;
 
@@ -560,12 +560,12 @@ static void numa_set_cpumask(int cpu, bool enable)
 	}
 }
 
-void numa_add_cpu(int cpu)
+void numa_add_cpu(unsigned int cpu)
 {
 	numa_set_cpumask(cpu, true);
 }
 
-void numa_remove_cpu(int cpu)
+void numa_remove_cpu(unsigned int cpu)
 {
 	numa_set_cpumask(cpu, false);
 }
-- 
2.43.0

