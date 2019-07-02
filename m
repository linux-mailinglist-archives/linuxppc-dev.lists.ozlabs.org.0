Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4015C961
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 08:36:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dDzg6whKzDqT7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 16:36:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="zaA80uur"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dCGw1c6czDqSn
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 15:19:51 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id m4so7097535pgk.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 22:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nqm1MiOeZebJXjq+40rQkia+J1ym1ayfkTrPWZH8MuU=;
 b=zaA80uurEM6pYLRnL3n9l5DfTNvE5Jv2DvKZ42vnKf/je+7UWZ62Igg0nI6Vzo72Bj
 I62Rq6VE82rjbCoqHdsENnt3vTG82bdssAW80tJvTaLSoTF6cJETdF+RsoneifPjKSOV
 EK2YLIiKg5U5W9VGdIUE5m+4/JTDwdJzgLou0K4oSBNxbAjS1U1RrpS5gDOeJpBNJe/S
 Obw4xya1DfuB/X6WZo08DxvEs6F0BHWhTgTWb5U4xYk3hx4ZfxtTVxuefclCL7whV5YW
 0II7mu5ukymeY5U4c+ywWwq3YCx6OsvnzTLFvin3M1/3ULsptB0l33YhcmjF/TJUdPfQ
 k0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nqm1MiOeZebJXjq+40rQkia+J1ym1ayfkTrPWZH8MuU=;
 b=NNDRPO0NFItSoqUu2D3rPUHPQwqPCEvZwPX40smnIZLw++Ab2CYf8CkAghfeDj2e32
 g7gMWPg3jCwjJdGBRNdz6cWZgKz7RTt6N2Cxz3ryBAh4Xbri6Yi/Ik/H66npxip+9/cC
 byOOzPFCx9XvpPjTHJzqOeCYJBmJRFKdQlcWjT/jCH8UG2FJU86C0aOz4Y3j3CQpfIti
 Do9D6g9yJFK1uWCeT6UI3aHXOCddKpS4ck2m7qHGnlI/j5GT+JNxI/4mEckWV1Lj6+Bt
 oFurqHWaKNafQuHRzJGuG2mqwAusNHf2EiQuNyM+cNKMAHx54NiuDApZSCJtRvFP+MnF
 Z4Rg==
X-Gm-Message-State: APjAAAVBYNKkB+NjOIIhCgM0LPq73vU93wcPitlqdFVnANT0EGnf5bBu
 5p/xxw10eIxSmdm8m4ZpITUHBIB7R/jpow==
X-Google-Smtp-Source: APXvYqyd3AY2n6NsKvldI34RT54wi9zVhhzYtNPesZPcQAoO+IjY5NI9QDIBo8/iQtlSe+VKk1/rQw==
X-Received: by 2002:a17:90a:fa12:: with SMTP id
 cm18mr3375511pjb.137.1562044789286; 
 Mon, 01 Jul 2019 22:19:49 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.67])
 by smtp.gmail.com with ESMTPSA id t9sm1106898pji.18.2019.07.01.22.19.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 22:19:48 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [v2 02/12] powerpc/mce: Bug fixes for MCE handling in kernel space
Date: Tue,  2 Jul 2019 10:49:22 +0530
Message-Id: <20190702051932.511-3-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702051932.511-1-santosh@fossix.org>
References: <20190702051932.511-1-santosh@fossix.org>
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
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Balbir Singh <bsingharora@gmail.com>

The code currently assumes PAGE_SHIFT as the shift value of
the pfn, this works correctly (mostly) for user space pages,
but the correct thing to do is

1. Extract the shift value returned via the pte-walk API's
2. Use the shift value to access the instruction address.

Note, the final physical address still use PAGE_SHIFT for
computation. handle_ierror() is not modified and handle_derror()
is modified just for extracting the correct instruction
address.

This is largely due to __find_linux_pte() returning pfn's
shifted by pdshift. The code is much more generic and can
handle shift values returned.

Fixes: ba41e1e1ccb9 ("powerpc/mce: Hookup derror (load/store) UE errors")

Signed-off-by: Balbir Singh <bsingharora@gmail.com>
[arbab@linux.ibm.com: Fixup pseries_do_memory_failure()]
---
 arch/powerpc/include/asm/mce.h       |  3 ++-
 arch/powerpc/kernel/mce_power.c      | 26 ++++++++++++++++----------
 arch/powerpc/platforms/pseries/ras.c |  6 ++++--
 3 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index a4c6a74ad2fb..94888a7025b3 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -209,7 +209,8 @@ extern void release_mce_event(void);
 extern void machine_check_queue_event(void);
 extern void machine_check_print_event_info(struct machine_check_event *evt,
 					   bool user_mode, bool in_guest);
-unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr);
+unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr,
+			  unsigned int *shift);
 #ifdef CONFIG_PPC_BOOK3S_64
 void flush_and_reload_slb(void);
 #endif /* CONFIG_PPC_BOOK3S_64 */
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index e39536aad30d..04666c0b40a8 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -23,7 +23,8 @@
  * Convert an address related to an mm to a PFN. NOTE: we are in real
  * mode, we could potentially race with page table updates.
  */
-unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr)
+unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr,
+			  unsigned int *shift)
 {
 	pte_t *ptep;
 	unsigned long flags;
@@ -36,13 +37,15 @@ unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr)
 
 	local_irq_save(flags);
 	if (mm == current->mm)
-		ptep = find_current_mm_pte(mm->pgd, addr, NULL, NULL);
+		ptep = find_current_mm_pte(mm->pgd, addr, NULL, shift);
 	else
-		ptep = find_init_mm_pte(addr, NULL);
+		ptep = find_init_mm_pte(addr, shift);
 	local_irq_restore(flags);
 	if (!ptep || pte_special(*ptep))
 		return ULONG_MAX;
-	return pte_pfn(*ptep);
+	if (!*shift)
+		*shift = PAGE_SHIFT;
+	return (pte_val(*ptep) & PTE_RPN_MASK) >> *shift;
 }
 
 /* flush SLBs and reload */
@@ -358,15 +361,16 @@ static int mce_find_instr_ea_and_pfn(struct pt_regs *regs, uint64_t *addr,
 	unsigned long pfn, instr_addr;
 	struct instruction_op op;
 	struct pt_regs tmp = *regs;
+	unsigned int shift;
 
-	pfn = addr_to_pfn(regs, regs->nip);
+	pfn = addr_to_pfn(regs, regs->nip, &shift);
 	if (pfn != ULONG_MAX) {
-		instr_addr = (pfn << PAGE_SHIFT) + (regs->nip & ~PAGE_MASK);
+		instr_addr = (pfn << shift) + (regs->nip & ((1 << shift) - 1));
 		instr = *(unsigned int *)(instr_addr);
 		if (!analyse_instr(&op, &tmp, instr)) {
-			pfn = addr_to_pfn(regs, op.ea);
+			pfn = addr_to_pfn(regs, op.ea, &shift);
 			*addr = op.ea;
-			*phys_addr = (pfn << PAGE_SHIFT);
+			*phys_addr = (pfn << shift);
 			return 0;
 		}
 		/*
@@ -442,12 +446,14 @@ static int mce_handle_ierror(struct pt_regs *regs,
 			if (mce_err->sync_error &&
 				table[i].error_type == MCE_ERROR_TYPE_UE) {
 				unsigned long pfn;
+				unsigned int shift;
 
 				if (get_paca()->in_mce < MAX_MCE_DEPTH) {
-					pfn = addr_to_pfn(regs, regs->nip);
+					pfn = addr_to_pfn(regs, regs->nip,
+							  &shift);
 					if (pfn != ULONG_MAX) {
 						*phys_addr =
-							(pfn << PAGE_SHIFT);
+							(pfn << shift);
 					}
 				}
 			}
diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index f16fdd0f71f7..5e43283d3300 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -740,12 +740,14 @@ static void pseries_do_memory_failure(struct pt_regs *regs,
 		paddr = be64_to_cpu(mce_log->logical_address);
 	} else if (mce_log->sub_err_type & UE_EFFECTIVE_ADDR_PROVIDED) {
 		unsigned long pfn;
+		unsigned int shift;
 
 		pfn = addr_to_pfn(regs,
-				  be64_to_cpu(mce_log->effective_address));
+				  be64_to_cpu(mce_log->effective_address),
+				  &shift);
 		if (pfn == ULONG_MAX)
 			return;
-		paddr = pfn << PAGE_SHIFT;
+		paddr = pfn << shift;
 	} else {
 		return;
 	}
-- 
2.20.1

