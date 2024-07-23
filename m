Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8A8939B2A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 08:53:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sy8Le62C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSnt00RP3z3cXd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 16:53:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sy8Le62C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSnhV2FkLz3cYh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 16:45:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 91FD260D2C;
	Tue, 23 Jul 2024 06:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD2FC4AF09;
	Tue, 23 Jul 2024 06:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721717112;
	bh=NBS9sSELyDjXskLupWw1+sILSG3bb7AMsfQy1q7g6+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sy8Le62C0nSfYONzB5OqQtNVljQMOYCPxcj7s7rvy33s/FViYPWZhd2aXVmEOcluJ
	 u5vJVlIgA5Z4zITDTVOT7CGOd5Rsl3raVSCCorRFuqlBEfq6cETpxEcJwIEoZrNJGw
	 NMy+YX46uk98KS2sWFmufuZU03pF+oo+7txOWNcvH8ragojRdlr1a+5eEVnj1Mhi6B
	 fl3/Err2rFg8lRV6hnME3wQhyBWGHzcxR9qZMxsOLF5GpdHxF/6i460+2L+cwghg+Q
	 ZihtUIdEY4Bbh6svDmFpTm9x6NPbCucKFfd1WWOViYNGNL79W3VYlty98npK9T9rtA
	 HoIXU79EZnyfg==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/25] x86/numa_emu: use a helper function to get MAX_DMA32_PFN
Date: Tue, 23 Jul 2024 09:41:46 +0300
Message-ID: <20240723064156.4009477-16-rppt@kernel.org>
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
 arch/x86/include/asm/numa.h  | 1 +
 arch/x86/mm/numa.c           | 5 +++++
 arch/x86/mm/numa_emulation.c | 4 ++--
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/numa.h b/arch/x86/include/asm/numa.h
index 7017d540894a..b22c85c1ef18 100644
--- a/arch/x86/include/asm/numa.h
+++ b/arch/x86/include/asm/numa.h
@@ -74,6 +74,7 @@ void debug_cpumask_set_cpu(int cpu, int node, bool enable);
 int numa_emu_cmdline(char *str);
 void __init numa_emu_update_cpu_to_node(int *emu_nid_to_phys,
 					unsigned int nr_emu_nids);
+u64 __init numa_emu_dma_end(void);
 #else /* CONFIG_NUMA_EMU */
 static inline int numa_emu_cmdline(char *str)
 {
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 9180d524cfe4..8b7c6580d268 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -868,6 +868,11 @@ void __init numa_emu_update_cpu_to_node(int *emu_nid_to_phys,
 		__apicid_to_node[i] = j < nr_emu_nids ? j : 0;
 	}
 }
+
+u64 __init numa_emu_dma_end(void)
+{
+	return PFN_PHYS(MAX_DMA32_PFN);
+}
 #endif /* CONFIG_NUMA_EMU */
 
 #ifdef CONFIG_NUMA_KEEP_MEMINFO
diff --git a/arch/x86/mm/numa_emulation.c b/arch/x86/mm/numa_emulation.c
index f2746e52ab93..fb4814497446 100644
--- a/arch/x86/mm/numa_emulation.c
+++ b/arch/x86/mm/numa_emulation.c
@@ -128,7 +128,7 @@ static int __init split_nodes_interleave(struct numa_meminfo *ei,
 	 */
 	while (!nodes_empty(physnode_mask)) {
 		for_each_node_mask(i, physnode_mask) {
-			u64 dma32_end = PFN_PHYS(MAX_DMA32_PFN);
+			u64 dma32_end = numa_emu_dma_end();
 			u64 start, limit, end;
 			int phys_blk;
 
@@ -275,7 +275,7 @@ static int __init split_nodes_size_interleave_uniform(struct numa_meminfo *ei,
 	 */
 	while (!nodes_empty(physnode_mask)) {
 		for_each_node_mask(i, physnode_mask) {
-			u64 dma32_end = PFN_PHYS(MAX_DMA32_PFN);
+			u64 dma32_end = numa_emu_dma_end();
 			u64 start, limit, end;
 			int phys_blk;
 
-- 
2.43.0

