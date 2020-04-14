Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4EC1A8489
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 18:21:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491rNN1JSQzDqly
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 02:21:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=t/yCmpCc; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491qN72lVHzDqjl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 01:36:39 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C03320678;
 Tue, 14 Apr 2020 15:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586878596;
 bh=ybPPvADQAq307A0mTIfstOnJj2n8fbsD+ITheeuQdo0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t/yCmpCcn8sCzGMmKhQcslmtaEsbx0+I+UZtglQV6ojnIQromBlhZlaLBILJGAd6y
 4Vn8iZPrK0sW8k+OougefKf9e1ZgbFEiDkY2u2fJZMlwXYYyOiu+omc8hiEdMujXQD
 1OSJEg4mIUApPR9xNP/PjDEgG9IK6jvSzBnwpCpg=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 09/14] sh: fault: Modernize printing of kernel messages
Date: Tue, 14 Apr 2020 18:34:50 +0300
Message-Id: <20200414153455.21744-10-rppt@kernel.org>
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

From: Geert Uytterhoeven <geert+renesas@glider.be>

  - Convert from printk() to pr_*(),
  - Add missing continuations,
  - Use "%llx" to format u64,
  - Join multiple prints in show_fault_oops() into a single print.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/sh/mm/fault.c | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/arch/sh/mm/fault.c b/arch/sh/mm/fault.c
index 5f23d7907597..7b74e18b71d7 100644
--- a/arch/sh/mm/fault.c
+++ b/arch/sh/mm/fault.c
@@ -47,10 +47,10 @@ static void show_pte(struct mm_struct *mm, unsigned long addr)
 			pgd = swapper_pg_dir;
 	}
 
-	printk(KERN_ALERT "pgd = %p\n", pgd);
+	pr_alert("pgd = %p\n", pgd);
 	pgd += pgd_index(addr);
-	printk(KERN_ALERT "[%08lx] *pgd=%0*Lx", addr,
-	       (u32)(sizeof(*pgd) * 2), (u64)pgd_val(*pgd));
+	pr_alert("[%08lx] *pgd=%0*llx", addr, (u32)(sizeof(*pgd) * 2),
+		 (u64)pgd_val(*pgd));
 
 	do {
 		pud_t *pud;
@@ -61,33 +61,33 @@ static void show_pte(struct mm_struct *mm, unsigned long addr)
 			break;
 
 		if (pgd_bad(*pgd)) {
-			printk("(bad)");
+			pr_cont("(bad)");
 			break;
 		}
 
 		pud = pud_offset(pgd, addr);
 		if (PTRS_PER_PUD != 1)
-			printk(", *pud=%0*Lx", (u32)(sizeof(*pud) * 2),
-			       (u64)pud_val(*pud));
+			pr_cont(", *pud=%0*llx", (u32)(sizeof(*pud) * 2),
+				(u64)pud_val(*pud));
 
 		if (pud_none(*pud))
 			break;
 
 		if (pud_bad(*pud)) {
-			printk("(bad)");
+			pr_cont("(bad)");
 			break;
 		}
 
 		pmd = pmd_offset(pud, addr);
 		if (PTRS_PER_PMD != 1)
-			printk(", *pmd=%0*Lx", (u32)(sizeof(*pmd) * 2),
-			       (u64)pmd_val(*pmd));
+			pr_cont(", *pmd=%0*llx", (u32)(sizeof(*pmd) * 2),
+				(u64)pmd_val(*pmd));
 
 		if (pmd_none(*pmd))
 			break;
 
 		if (pmd_bad(*pmd)) {
-			printk("(bad)");
+			pr_cont("(bad)");
 			break;
 		}
 
@@ -96,11 +96,11 @@ static void show_pte(struct mm_struct *mm, unsigned long addr)
 			break;
 
 		pte = pte_offset_kernel(pmd, addr);
-		printk(", *pte=%0*Lx", (u32)(sizeof(*pte) * 2),
-		       (u64)pte_val(*pte));
+		pr_cont(", *pte=%0*llx", (u32)(sizeof(*pte) * 2),
+			(u64)pte_val(*pte));
 	} while (0);
 
-	printk("\n");
+	pr_cont("\n");
 }
 
 static inline pmd_t *vmalloc_sync_one(pgd_t *pgd, unsigned long address)
@@ -188,14 +188,11 @@ show_fault_oops(struct pt_regs *regs, unsigned long address)
 	if (!oops_may_print())
 		return;
 
-	printk(KERN_ALERT "BUG: unable to handle kernel ");
-	if (address < PAGE_SIZE)
-		printk(KERN_CONT "NULL pointer dereference");
-	else
-		printk(KERN_CONT "paging request");
-
-	printk(KERN_CONT " at %08lx\n", address);
-	printk(KERN_ALERT "PC:");
+	pr_alert("BUG: unable to handle kernel %s at %08lx\n",
+		 address < PAGE_SIZE ? "NULL pointer dereference"
+				     : "paging request",
+		 address);
+	pr_alert("PC:");
 	printk_address(regs->pc, 1);
 
 	show_pte(NULL, address);
-- 
2.25.1

