Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB0D17139F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 10:04:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Smvg6fK4zDr2s
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 20:04:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=0x1SYOFR; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SmZ10ZpFzDqsl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 19:49:28 +1100 (AEDT)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E0F324683;
 Thu, 27 Feb 2020 08:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582793364;
 bh=d6JASArDTC2YfUmrU9XUpiTM3xImoHt6h/h+S4gwbKw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0x1SYOFRdLAqiutbk8dXzSYLqNK4ETW4iJYOWrtI8+trt2hNpAQQSkNNThvHytoHK
 sbrR13MAdpcaucxR0egMp+nacxwn7Jj7scMmKl0+W2M2EN14rTs9zMxDRW8QM5580x
 98Tecr/imFBp2kLO33ktoryGWwg8fo5MsC/0AYHc=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/14] powerpc/32: drop get_pteptr()
Date: Thu, 27 Feb 2020 10:46:01 +0200
Message-Id: <20200227084608.18223-8-rppt@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200227084608.18223-1-rppt@kernel.org>
References: <20200227084608.18223-1-rppt@kernel.org>
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

From: Christophe Leroy <christophe.leroy@c-s.fr>

Commit 8d30c14cab30 ("powerpc/mm: Rework I$/D$ coherency (v3)") and
commit 90ac19a8b21b ("[POWERPC] Abolish iopa(), mm_ptov(),
io_block_mapping() from arch/powerpc") removed the use of get_pteptr()
outside of mm/pgtable_32.c

In mm/pgtable_32.c, the only user of get_pteptr() is __change_page_attr()
which operates on kernel context and on lowmem pages only.

Move page table traversal to __change_page_attr() and drop get_pteptr().

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/powerpc/mm/pgtable_32.c | 43 ++++++------------------------------
 1 file changed, 7 insertions(+), 36 deletions(-)

diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 5fb90edd865e..4894555622d7 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -121,53 +121,24 @@ void __init mapin_ram(void)
 	}
 }
 
-/* Scan the real Linux page tables and return a PTE pointer for
- * a virtual address in a context.
- * Returns true (1) if PTE was found, zero otherwise.  The pointer to
- * the PTE pointer is unmodified if PTE is not found.
- */
-static int
-get_pteptr(struct mm_struct *mm, unsigned long addr, pte_t **ptep, pmd_t **pmdp)
-{
-        pgd_t	*pgd;
-	pud_t	*pud;
-        pmd_t	*pmd;
-        pte_t	*pte;
-        int     retval = 0;
-
-        pgd = pgd_offset(mm, addr & PAGE_MASK);
-        if (pgd) {
-		pud = pud_offset(pgd, addr & PAGE_MASK);
-		if (pud && pud_present(*pud)) {
-			pmd = pmd_offset(pud, addr & PAGE_MASK);
-			if (pmd_present(*pmd)) {
-				pte = pte_offset_map(pmd, addr & PAGE_MASK);
-				if (pte) {
-					retval = 1;
-					*ptep = pte;
-					if (pmdp)
-						*pmdp = pmd;
-					/* XXX caller needs to do pte_unmap, yuck */
-				}
-			}
-		}
-        }
-        return(retval);
-}
-
 static int __change_page_attr_noflush(struct page *page, pgprot_t prot)
 {
 	pte_t *kpte;
 	pmd_t *kpmd;
-	unsigned long address;
+	unsigned long address, va;
 
 	BUG_ON(PageHighMem(page));
 	address = (unsigned long)page_address(page);
+	va = address & PAGE_MASK;
 
 	if (v_block_mapped(address))
 		return 0;
-	if (!get_pteptr(&init_mm, address, &kpte, &kpmd))
+
+	kpmd = pmd_offset(pud_offset(pgd_offset_k(va), va), va);
+	if (!pmd_present(*kpmd))
 		return -EINVAL;
+
+	kpte = pte_offset_map(kpmd, va);
 	__set_pte_at(&init_mm, address, kpte, mk_pte(page, prot), 0);
 	pte_unmap(kpte);
 
-- 
2.24.0

