Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 551BA1A84A8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 18:25:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491rSW1LdszDqp7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 02:25:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=EsjR1/Yi; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491qNJ4Z39zDqk9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 01:36:48 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B6B42076D;
 Tue, 14 Apr 2020 15:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586878606;
 bh=fvLukdwkQTHO+51q3DGLoikuRIRMlioJ2DyvNE+LsyM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EsjR1/Yifkflit9+eKwFZLCCJFB8DergOAGiV4wfeGmM/V7L4EnrXxVxok0npwk6h
 WiBKvp5y1ti7RWPhFlbhCg0/KvxW5loI8ag/8FCL6WW1nK8DMZtzMhuoVRHVMUmF6W
 Av3cMdSJVEJr8PZ+JmDhYERiuyxHsfJxjLsfIVRk=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 10/14] sh: drop __pXd_offset() macros that duplicate
 pXd_index() ones
Date: Tue, 14 Apr 2020 18:34:51 +0300
Message-Id: <20200414153455.21744-11-rppt@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414153455.21744-1-rppt@kernel.org>
References: <20200414153455.21744-1-rppt@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-hexagon@vger.kernel.org, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, Jonas Bonn <jonas@southpole.se>,
 linux-arch@vger.kernel.org, Brian Cain <bcain@codeaurora.org>,
 Marc Zyngier <maz@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 kvm-ppc@vger.kernel.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
 nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

The __pXd_offset() macros are identical to the pXd_index() macros and there
is no point to keep both of them. All architectures define and use
pXd_index() so let's keep only those to make mips consistent with the rest
of the kernel.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/sh/include/asm/pgtable_32.h | 5 ++---
 arch/sh/include/asm/pgtable_64.h | 5 ++---
 arch/sh/mm/init.c                | 6 +++---
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/sh/include/asm/pgtable_32.h b/arch/sh/include/asm/pgtable_32.h
index 29274f0e428e..4acce5f2cbf9 100644
--- a/arch/sh/include/asm/pgtable_32.h
+++ b/arch/sh/include/asm/pgtable_32.h
@@ -407,13 +407,12 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 /* to find an entry in a page-table-directory. */
 #define pgd_index(address)	(((address) >> PGDIR_SHIFT) & (PTRS_PER_PGD-1))
 #define pgd_offset(mm, address)	((mm)->pgd + pgd_index(address))
-#define __pgd_offset(address)	pgd_index(address)
 
 /* to find an entry in a kernel page-table-directory */
 #define pgd_offset_k(address)	pgd_offset(&init_mm, address)
 
-#define __pud_offset(address)	(((address) >> PUD_SHIFT) & (PTRS_PER_PUD-1))
-#define __pmd_offset(address)	(((address) >> PMD_SHIFT) & (PTRS_PER_PMD-1))
+#define pud_index(address)	(((address) >> PUD_SHIFT) & (PTRS_PER_PUD-1))
+#define pmd_index(address)	(((address) >> PMD_SHIFT) & (PTRS_PER_PMD-1))
 
 /* Find an entry in the third-level page table.. */
 #define pte_index(address)	((address >> PAGE_SHIFT) & (PTRS_PER_PTE - 1))
diff --git a/arch/sh/include/asm/pgtable_64.h b/arch/sh/include/asm/pgtable_64.h
index 1778bc5971e7..27cc282ec6c0 100644
--- a/arch/sh/include/asm/pgtable_64.h
+++ b/arch/sh/include/asm/pgtable_64.h
@@ -46,14 +46,13 @@ static __inline__ void set_pte(pte_t *pteptr, pte_t pteval)
 
 /* To find an entry in a generic PGD. */
 #define pgd_index(address) (((address) >> PGDIR_SHIFT) & (PTRS_PER_PGD-1))
-#define __pgd_offset(address) pgd_index(address)
 #define pgd_offset(mm, address) ((mm)->pgd+pgd_index(address))
 
 /* To find an entry in a kernel PGD. */
 #define pgd_offset_k(address) pgd_offset(&init_mm, address)
 
-#define __pud_offset(address)	(((address) >> PUD_SHIFT) & (PTRS_PER_PUD-1))
-#define __pmd_offset(address)	(((address) >> PMD_SHIFT) & (PTRS_PER_PMD-1))
+#define pud_index(address)	(((address) >> PUD_SHIFT) & (PTRS_PER_PUD-1))
+/* #define pmd_index(address)	(((address) >> PMD_SHIFT) & (PTRS_PER_PMD-1)) */
 
 /*
  * PMD level access routines. Same notes as above.
diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
index b9de2d4fa57e..f445ba630790 100644
--- a/arch/sh/mm/init.c
+++ b/arch/sh/mm/init.c
@@ -172,9 +172,9 @@ void __init page_table_range_init(unsigned long start, unsigned long end,
 	unsigned long vaddr;
 
 	vaddr = start;
-	i = __pgd_offset(vaddr);
-	j = __pud_offset(vaddr);
-	k = __pmd_offset(vaddr);
+	i = pgd_index(vaddr);
+	j = pud_index(vaddr);
+	k = pmd_index(vaddr);
 	pgd = pgd_base + i;
 
 	for ( ; (i < PTRS_PER_PGD) && (vaddr != end); pgd++, i++) {
-- 
2.25.1

