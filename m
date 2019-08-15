Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE548E1F0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 02:46:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46877672dbzDqk9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 10:46:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="kdCxrQJC"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4686zq054PzDqxh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 10:40:06 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id n4so483418pgv.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 17:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D2tlN+71g8bWt9oQlVT6rxO2X/4rsSsVdmtXxR74abA=;
 b=kdCxrQJCWt07ionWVmtYa9pkcvVdj6ejpK9Z/fzG1CU/wmax9uUyylyLS4k6l1zcxi
 QgWUUCA8BuF0rYGj8gE0NOZG7zmBkMtjJtOWifH157TJavy6ZGMLJpK3PdAKW3wzKPHn
 Z2Q8LYFUSrlQM1SVeg1j8ms2BzQI+yxK8jeH0NqDUiM7nirgUIoqpn83PPVs+KkGNKz4
 eAwZAoMlt6R+OR276CGGB8RQ+nTrrhqq8pNlypPCuqOPdO7mR1JXwFp3cPWmQjztUr9o
 f5NwTS/flLhKTEbRdbwgg/tpTWQkX6l8f+Gf9i+6sMvZIFixeQyB/SaAb5mGF1aVB8az
 NMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D2tlN+71g8bWt9oQlVT6rxO2X/4rsSsVdmtXxR74abA=;
 b=SgOok+Fvlksa8AjyHSFO/bMTqkMM6p5uTx8EEVCpMR0tnIVoPoifB4PtXdyFEfkyYt
 adC015GxIuhytA7gwTgzCvT6ZkuNfP1+x9K4VE8rBScLPr/okOHAzsgsNWoOsErnjP4v
 pK9GVFAmweUAQVWXwgTdVmNd7Bmd1XsTyXvLBIGddrL8PR0QFtTmLejVzpMfMDA7Xtct
 0em3rQ4bMVN78deoDPO56WFSy16eI3Gv3+8zb2t4Fjso7FqakZ6uDK+Za7lZ1vW8615A
 nMSDE8K4lwuhsyxvPScsE+fvPObb83ehgb4ajU2eW6LEnMBJo0UunEo2DqjCMJEnMaQU
 t1Xw==
X-Gm-Message-State: APjAAAVjfPJiO1CsSYU/s8DryZ/07AsF9UW8PzcVGn3O8h5ojSMrALZH
 Kxcbz1553+Qlp8IrsmDKZlDAyk1MJyjQug==
X-Google-Smtp-Source: APXvYqztEmpGDpuKWxd7856OuuhAQ2uDhuhwrGZpks3eemWDqZvzdd3Equs389OOwmlt6xHIgUhqew==
X-Received: by 2002:a17:90a:1110:: with SMTP id
 d16mr580444pja.29.1565829604197; 
 Wed, 14 Aug 2019 17:40:04 -0700 (PDT)
Received: from santosiv.in.ibm.com ([49.205.218.176])
 by smtp.gmail.com with ESMTPSA id g8sm815917pgk.1.2019.08.14.17.40.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 17:40:03 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 2/7] powerpc/mce: Fix MCE handling for huge pages
Date: Thu, 15 Aug 2019 06:09:36 +0530
Message-Id: <20190815003941.18655-3-santosh@fossix.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815003941.18655-1-santosh@fossix.org>
References: <20190815003941.18655-1-santosh@fossix.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Chandan Rajendra <chandan@linux.ibm.com>, stable@vger.kernel.org,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Balbir Singh <bsingharora@gmail.com>

The current code would fail on huge pages addresses, since the shift would
be incorrect. Use the correct page shift value returned by
__find_linux_pte() to get the correct physical address. The code is more
generic and can handle both regular and compound pages.

Fixes: ba41e1e1ccb9 ("powerpc/mce: Hookup derror (load/store) UE errors")
Signed-off-by: Balbir Singh <bsingharora@gmail.com>
[arbab@linux.ibm.com: Fixup pseries_do_memory_failure()]
Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
Co-developed-by: Santosh Sivaraj <santosh@fossix.org>
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
Tested-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
Cc: stable@vger.kernel.org # v4.15+
---
 arch/powerpc/include/asm/mce.h       |  2 +-
 arch/powerpc/kernel/mce_power.c      | 55 ++++++++++++++--------------
 arch/powerpc/platforms/pseries/ras.c |  9 ++---
 3 files changed, 32 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index a4c6a74ad2fb..f3a6036b6bc0 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -209,7 +209,7 @@ extern void release_mce_event(void);
 extern void machine_check_queue_event(void);
 extern void machine_check_print_event_info(struct machine_check_event *evt,
 					   bool user_mode, bool in_guest);
-unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr);
+unsigned long addr_to_phys(struct pt_regs *regs, unsigned long addr);
 #ifdef CONFIG_PPC_BOOK3S_64
 void flush_and_reload_slb(void);
 #endif /* CONFIG_PPC_BOOK3S_64 */
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index a814d2dfb5b0..e74816f045f8 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -20,13 +20,14 @@
 #include <asm/exception-64s.h>
 
 /*
- * Convert an address related to an mm to a PFN. NOTE: we are in real
- * mode, we could potentially race with page table updates.
+ * Convert an address related to an mm to a physical address.
+ * NOTE: we are in real mode, we could potentially race with page table updates.
  */
-unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr)
+unsigned long addr_to_phys(struct pt_regs *regs, unsigned long addr)
 {
-	pte_t *ptep;
-	unsigned long flags;
+	pte_t *ptep, pte;
+	unsigned int shift;
+	unsigned long flags, phys_addr;
 	struct mm_struct *mm;
 
 	if (user_mode(regs))
@@ -35,14 +36,21 @@ unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr)
 		mm = &init_mm;
 
 	local_irq_save(flags);
-	if (mm == current->mm)
-		ptep = find_current_mm_pte(mm->pgd, addr, NULL, NULL);
-	else
-		ptep = find_init_mm_pte(addr, NULL);
+	ptep = __find_linux_pte(mm->pgd, addr, NULL, &shift);
 	local_irq_restore(flags);
+
 	if (!ptep || pte_special(*ptep))
 		return ULONG_MAX;
-	return pte_pfn(*ptep);
+
+	pte = *ptep;
+	if (shift > PAGE_SHIFT) {
+		unsigned long rpnmask = (1ul << shift) - PAGE_SIZE;
+
+		pte = __pte(pte_val(pte) | (addr & rpnmask));
+	}
+	phys_addr = pte_pfn(pte) << PAGE_SHIFT;
+
+	return phys_addr;
 }
 
 /* flush SLBs and reload */
@@ -344,7 +352,7 @@ static const struct mce_derror_table mce_p9_derror_table[] = {
   MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0, false, 0, 0, 0, 0, 0 } };
 
-static int mce_find_instr_ea_and_pfn(struct pt_regs *regs, uint64_t *addr,
+static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
 					uint64_t *phys_addr)
 {
 	/*
@@ -354,18 +362,16 @@ static int mce_find_instr_ea_and_pfn(struct pt_regs *regs, uint64_t *addr,
 	 * faults
 	 */
 	int instr;
-	unsigned long pfn, instr_addr;
+	unsigned long instr_addr;
 	struct instruction_op op;
 	struct pt_regs tmp = *regs;
 
-	pfn = addr_to_pfn(regs, regs->nip);
-	if (pfn != ULONG_MAX) {
-		instr_addr = (pfn << PAGE_SHIFT) + (regs->nip & ~PAGE_MASK);
+	instr_addr = addr_to_phys(regs, regs->nip) + (regs->nip & ~PAGE_MASK);
+	if (instr_addr != ULONG_MAX) {
 		instr = *(unsigned int *)(instr_addr);
 		if (!analyse_instr(&op, &tmp, instr)) {
-			pfn = addr_to_pfn(regs, op.ea);
 			*addr = op.ea;
-			*phys_addr = (pfn << PAGE_SHIFT);
+			*phys_addr = addr_to_phys(regs, op.ea);
 			return 0;
 		}
 		/*
@@ -440,15 +446,9 @@ static int mce_handle_ierror(struct pt_regs *regs,
 			*addr = regs->nip;
 			if (mce_err->sync_error &&
 				table[i].error_type == MCE_ERROR_TYPE_UE) {
-				unsigned long pfn;
-
-				if (get_paca()->in_mce < MAX_MCE_DEPTH) {
-					pfn = addr_to_pfn(regs, regs->nip);
-					if (pfn != ULONG_MAX) {
-						*phys_addr =
-							(pfn << PAGE_SHIFT);
-					}
-				}
+				if (get_paca()->in_mce < MAX_MCE_DEPTH)
+					*phys_addr = addr_to_phys(regs,
+								 regs->nip);
 			}
 		}
 		return handled;
@@ -541,7 +541,8 @@ static int mce_handle_derror(struct pt_regs *regs,
 			 * kernel/exception-64s.h
 			 */
 			if (get_paca()->in_mce < MAX_MCE_DEPTH)
-				mce_find_instr_ea_and_pfn(regs, addr, phys_addr);
+				mce_find_instr_ea_and_phys(regs, addr,
+							   phys_addr);
 		}
 		found = 1;
 	}
diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index f16fdd0f71f7..5743f6353638 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -739,13 +739,10 @@ static void pseries_do_memory_failure(struct pt_regs *regs,
 	if (mce_log->sub_err_type & UE_LOGICAL_ADDR_PROVIDED) {
 		paddr = be64_to_cpu(mce_log->logical_address);
 	} else if (mce_log->sub_err_type & UE_EFFECTIVE_ADDR_PROVIDED) {
-		unsigned long pfn;
-
-		pfn = addr_to_pfn(regs,
-				  be64_to_cpu(mce_log->effective_address));
-		if (pfn == ULONG_MAX)
+		paddr = addr_to_phys(regs,
+				     be64_to_cpu(mce_log->effective_address));
+		if (paddr == ULONG_MAX)
 			return;
-		paddr = pfn << PAGE_SHIFT;
 	} else {
 		return;
 	}
-- 
2.21.0

