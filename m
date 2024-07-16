Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B61893252F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 13:19:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eUYe44Ch;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNc5Z1djQz2ypm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 21:18:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eUYe44Ch;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNc191hrfz3cYh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 21:15:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7886460B9F;
	Tue, 16 Jul 2024 11:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DCECC116B1;
	Tue, 16 Jul 2024 11:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721128507;
	bh=GElWHq2qRIT8py39Ko6uJRewjseLB9ydLgZveNWdQ+Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eUYe44ChrhAY+EIKXqRBxJW/GGnRiqr4keNuzA8k+5ofeJ4HBvR/n8QM0J61no1f2
	 abiQBz3/QII7idJTs0afg3rMGY90A9xGmtBhYCNbiK9q4iubegCmxJf7NrcoovNvKG
	 qQRxvsWN8oXJMXkni0JawCEhHK8wA6sAxUA+cca/xtj4Q9hkmUftsVcp/KiDWJ6cLF
	 921Vh4BmVDEODNmwHfRepZDaSRiM/CEFqWbhNtHQKO/A34nitM0llJ5YCV7ixvsAcB
	 JHNcrvbEtQV/XUjf4mxX16sZ1+VCT2rSdlrKQOTKpNfcPTqTHU8isN0T/2V75O32aW
	 WPUTqww3gzW2A==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 06/17] x86/numa: simplify numa_distance allocation
Date: Tue, 16 Jul 2024 14:13:35 +0300
Message-ID: <20240716111346.3676969-7-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716111346.3676969-1-rppt@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Allocation of numa_distance uses memblock_phys_alloc_range() to limit
allocation to be below the last mapped page.

But NUMA initializaition runs after the direct map is populated and
there is also code in setup_arch() that adjusts memblock limit to
reflect how much memory is already mapped in the direct map.

Simplify the allocation of numa_distance and use plain memblock_alloc().
This makes the code clearer and ensures that when numa_distance is not
allocated it is always NULL.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/numa.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 5e1dde26674b..ab2d4ecef786 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -319,8 +319,7 @@ void __init numa_reset_distance(void)
 {
 	size_t size = numa_distance_cnt * numa_distance_cnt * sizeof(numa_distance[0]);
 
-	/* numa_distance could be 1LU marking allocation failure, test cnt */
-	if (numa_distance_cnt)
+	if (numa_distance)
 		memblock_free(numa_distance, size);
 	numa_distance_cnt = 0;
 	numa_distance = NULL;	/* enable table creation */
@@ -331,7 +330,6 @@ static int __init numa_alloc_distance(void)
 	nodemask_t nodes_parsed;
 	size_t size;
 	int i, j, cnt = 0;
-	u64 phys;
 
 	/* size the new table and allocate it */
 	nodes_parsed = numa_nodes_parsed;
@@ -342,16 +340,12 @@ static int __init numa_alloc_distance(void)
 	cnt++;
 	size = cnt * cnt * sizeof(numa_distance[0]);
 
-	phys = memblock_phys_alloc_range(size, PAGE_SIZE, 0,
-					 PFN_PHYS(max_pfn_mapped));
-	if (!phys) {
+	numa_distance = memblock_alloc(size, PAGE_SIZE);
+	if (!numa_distance) {
 		pr_warn("Warning: can't allocate distance table!\n");
-		/* don't retry until explicitly reset */
-		numa_distance = (void *)1LU;
 		return -ENOMEM;
 	}
 
-	numa_distance = __va(phys);
 	numa_distance_cnt = cnt;
 
 	/* fill with the default distances */
-- 
2.43.0

