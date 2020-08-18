Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B600E2489F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 17:34:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWFMK5NlWzDqDJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 01:34:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Sb4tO818; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWDzy5vjtzDqbq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 01:17:34 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E54462054F;
 Tue, 18 Aug 2020 15:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597763852;
 bh=DFgjPvI/vXV91uvzN+sme20WtWl/kJKoZupsBOJXfBQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Sb4tO818fhfIY1L0sTQE8nDj+8mGi9uHOcqZnjg0uj3tpj6i4/rzppzDqqqompdjZ
 iFUaYJr4fueUpI5iPhsaxdXJPjYQyvH1ESfKCPejy1fi1XGVCto65QLI3+mssBbcEL
 8tsVYJMK/jhJgOVkQ7iYEV+fVy8vBFUiHXB5XJsI=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 04/17] arm64: numa: simplify dummy_numa_init()
Date: Tue, 18 Aug 2020 18:16:21 +0300
Message-Id: <20200818151634.14343-5-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818151634.14343-1-rppt@kernel.org>
References: <20200818151634.14343-1-rppt@kernel.org>
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>, Michal Simek <monstr@monstr.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

dummy_numa_init() loops over memblock.memory and passes nid=0 to
numa_add_memblk() which essentially wraps memblock_set_node(). However,
memblock_set_node() can cope with entire memory span itself, so the loop
over memblock.memory regions is redundant.

Using a single call to memblock_set_node() rather than a loop also fixes an
issue with a buggy ACPI firmware in which the SRAT table covers some but
not all of the memory in the EFI memory map.

Jonathan Cameron says:

  This issue can be easily triggered by having an SRAT table which fails
  to cover all elements of the EFI memory map.

  This firmware error is detected and a warning printed. e.g.
  "NUMA: Warning: invalid memblk node 64 [mem 0x240000000-0x27fffffff]"
  At that point we fall back to dummy_numa_init().

  However, the failed ACPI init has left us with our memblocks all broken
  up as we split them when trying to assign them to NUMA nodes.

  We then iterate over the memblocks and add them to node 0.

  numa_add_memblk() calls memblock_set_node() which merges regions that
  were previously split up during the earlier attempt to add them to different
  nodes during parsing of SRAT.

  This means elements are moved in the memblock array and we can end up
  in a different memblock after the call to numa_add_memblk().
  Result is:

  Unable to handle kernel paging request at virtual address 0000000000003a40
  Mem abort info:
    ESR = 0x96000004
    EC = 0x25: DABT (current EL), IL = 32 bits
    SET = 0, FnV = 0
    EA = 0, S1PTW = 0
  Data abort info:
    ISV = 0, ISS = 0x00000004
    CM = 0, WnR = 0
  [0000000000003a40] user address but active_mm is swapper
  Internal error: Oops: 96000004 [#1] PREEMPT SMP

  ...

  Call trace:
    sparse_init_nid+0x5c/0x2b0
    sparse_init+0x138/0x170
    bootmem_init+0x80/0xe0
    setup_arch+0x2a0/0x5fc
    start_kernel+0x8c/0x648

Replace the loop with a single call to memblock_set_node() to the entire
memory.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/mm/numa.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
index 73f8b49d485c..8a97cd3d2dfe 100644
--- a/arch/arm64/mm/numa.c
+++ b/arch/arm64/mm/numa.c
@@ -423,19 +423,16 @@ static int __init numa_init(int (*init_func)(void))
  */
 static int __init dummy_numa_init(void)
 {
+	phys_addr_t start = memblock_start_of_DRAM();
+	phys_addr_t end = memblock_end_of_DRAM();
 	int ret;
-	struct memblock_region *mblk;
 
 	if (numa_off)
 		pr_info("NUMA disabled\n"); /* Forced off on command line. */
-	pr_info("Faking a node at [mem %#018Lx-%#018Lx]\n",
-		memblock_start_of_DRAM(), memblock_end_of_DRAM() - 1);
-
-	for_each_memblock(memory, mblk) {
-		ret = numa_add_memblk(0, mblk->base, mblk->base + mblk->size);
-		if (!ret)
-			continue;
+	pr_info("Faking a node at [mem %#018Lx-%#018Lx]\n", start, end - 1);
 
+	ret = numa_add_memblk(0, start, end);
+	if (ret) {
 		pr_err("NUMA init failed\n");
 		return ret;
 	}
-- 
2.26.2

