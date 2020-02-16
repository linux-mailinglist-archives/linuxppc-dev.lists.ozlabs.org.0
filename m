Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CECC1602F3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Feb 2020 09:30:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48L0ff6bKnzDqJL
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Feb 2020 19:30:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Wy2OJnni; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48L0Qn1vLKzDqcl
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Feb 2020 19:19:45 +1100 (AEDT)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9CE7A227BF;
 Sun, 16 Feb 2020 08:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581841182;
 bh=71MnpEc+yFN5lenidv0+rt0LqtwQ5nS0iIQpg548uOQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wy2OJnniPmauzyvPuXM1rSnjZ+QIN/dI8qvYMe+YlQnoKh7/RdA7/BUNyzslxJlvq
 z3POnN3JZ8sA1lndaJxCBe1sVPRZD4njKdp1QPN16lBjujoOPi+4j/C19LGwv79kZv
 s6GEvyiPxSFMkia/5jxu4RzXpPtIJoxsD47rJZIc=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/13] nios2: add support for folded p4d page tables
Date: Sun, 16 Feb 2020 10:18:35 +0200
Message-Id: <20200216081843.28670-6-rppt@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200216081843.28670-1-rppt@kernel.org>
References: <20200216081843.28670-1-rppt@kernel.org>
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
 James Morse <james.morse@arm.com>, nios2-dev@lists.rocketboards.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

Implement primitives necessary for the 4th level folding, add walks of p4d
level where appropriate and remove usage of __ARCH_USE_5LEVEL_HACK.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/nios2/include/asm/pgtable.h | 3 +--
 arch/nios2/mm/fault.c            | 9 +++++++--
 arch/nios2/mm/ioremap.c          | 6 +++++-
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/nios2/include/asm/pgtable.h b/arch/nios2/include/asm/pgtable.h
index 99985d8b7166..54305aa09b74 100644
--- a/arch/nios2/include/asm/pgtable.h
+++ b/arch/nios2/include/asm/pgtable.h
@@ -22,7 +22,6 @@
 #include <asm/tlbflush.h>
 
 #include <asm/pgtable-bits.h>
-#define __ARCH_USE_5LEVEL_HACK
 #include <asm-generic/pgtable-nopmd.h>
 
 #define FIRST_USER_ADDRESS	0UL
@@ -100,7 +99,7 @@ extern pte_t invalid_pte_table[PAGE_SIZE/sizeof(pte_t)];
  */
 static inline void set_pmd(pmd_t *pmdptr, pmd_t pmdval)
 {
-	pmdptr->pud.pgd.pgd = pmdval.pud.pgd.pgd;
+	*pmdptr = pmdval;
 }
 
 /* to find an entry in a page-table-directory */
diff --git a/arch/nios2/mm/fault.c b/arch/nios2/mm/fault.c
index 6a2e716b959f..d3da995665c3 100644
--- a/arch/nios2/mm/fault.c
+++ b/arch/nios2/mm/fault.c
@@ -245,6 +245,7 @@ asmlinkage void do_page_fault(struct pt_regs *regs, unsigned long cause,
 		 */
 		int offset = pgd_index(address);
 		pgd_t *pgd, *pgd_k;
+		p4d_t *p4d, *p4d_k;
 		pud_t *pud, *pud_k;
 		pmd_t *pmd, *pmd_k;
 		pte_t *pte_k;
@@ -256,8 +257,12 @@ asmlinkage void do_page_fault(struct pt_regs *regs, unsigned long cause,
 			goto no_context;
 		set_pgd(pgd, *pgd_k);
 
-		pud = pud_offset(pgd, address);
-		pud_k = pud_offset(pgd_k, address);
+		p4d = p4d_offset(pgd, address);
+		p4d_k = p4d_offset(pgd_k, address);
+		if (!p4d_present(*p4d_k))
+			goto no_context;
+		pud = pud_offset(p4d, address);
+		pud_k = pud_offset(p4d_k, address);
 		if (!pud_present(*pud_k))
 			goto no_context;
 		pmd = pmd_offset(pud, address);
diff --git a/arch/nios2/mm/ioremap.c b/arch/nios2/mm/ioremap.c
index 819bdfcc2e71..fe821efb9a99 100644
--- a/arch/nios2/mm/ioremap.c
+++ b/arch/nios2/mm/ioremap.c
@@ -86,11 +86,15 @@ static int remap_area_pages(unsigned long address, unsigned long phys_addr,
 	if (address >= end)
 		BUG();
 	do {
+		p4d_t *p4d;
 		pud_t *pud;
 		pmd_t *pmd;
 
 		error = -ENOMEM;
-		pud = pud_alloc(&init_mm, dir, address);
+		p4d = p4d_alloc(&init_mm, dir, address);
+		if (!p4d)
+			break;
+		pud = pud_alloc(&init_mm, p4d, address);
 		if (!pud)
 			break;
 		pmd = pmd_alloc(&init_mm, pud, address);
-- 
2.24.0

