Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C0E235916
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 18:42:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKRdh37k5zDqRK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 02:42:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=LCVbBqUy; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKRVN6HW3zDqPy
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 02:36:28 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8CB07208B3;
 Sun,  2 Aug 2020 16:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596386186;
 bh=4WuJOQlNfEjZEgWh7mIgx+GQ0z3C84AGorDeAuZhOK8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LCVbBqUyTpTcklPw3QEPBUmjv+Mt1qQf7Et+tJ1c8TdhfSluYQvZX/m4M7OG4sZ3k
 pxTM46y59Y1+F61mBTppc2pAWy1KG3NU0wjGQvFquSk7OKaXsTrG0BvQ7S9Ag7ksb0
 MpC9MHAhLgGU02MkEZXWU7/oN8AvazuUaSdI2H+k=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 01/17] KVM: PPC: Book3S HV: simplify kvm_cma_reserve()
Date: Sun,  2 Aug 2020 19:35:45 +0300
Message-Id: <20200802163601.8189-2-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200802163601.8189-1-rppt@kernel.org>
References: <20200802163601.8189-1-rppt@kernel.org>
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
 Michal Simek <monstr@monstr.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

The memory size calculation in kvm_cma_reserve() traverses memblock.memory
rather than simply call memblock_phys_mem_size(). The comment in that
function suggests that at some point there should have been call to
memblock_analyze() before memblock_phys_mem_size() could be used.
As of now, there is no memblock_analyze() at all and
memblock_phys_mem_size() can be used as soon as cold-plug memory is
registerd with memblock.

Replace loop over memblock.memory with a call to memblock_phys_mem_size().

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_builtin.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 7cd3cf3d366b..56ab0d28de2a 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -95,22 +95,15 @@ EXPORT_SYMBOL_GPL(kvm_free_hpt_cma);
 void __init kvm_cma_reserve(void)
 {
 	unsigned long align_size;
-	struct memblock_region *reg;
-	phys_addr_t selected_size = 0;
+	phys_addr_t selected_size;
 
 	/*
 	 * We need CMA reservation only when we are in HV mode
 	 */
 	if (!cpu_has_feature(CPU_FTR_HVMODE))
 		return;
-	/*
-	 * We cannot use memblock_phys_mem_size() here, because
-	 * memblock_analyze() has not been called yet.
-	 */
-	for_each_memblock(memory, reg)
-		selected_size += memblock_region_memory_end_pfn(reg) -
-				 memblock_region_memory_base_pfn(reg);
 
+	selected_size = PHYS_PFN(memblock_phys_mem_size());
 	selected_size = (selected_size * kvm_cma_resv_ratio / 100) << PAGE_SHIFT;
 	if (selected_size) {
 		pr_debug("%s: reserving %ld MiB for global area\n", __func__,
-- 
2.26.2

