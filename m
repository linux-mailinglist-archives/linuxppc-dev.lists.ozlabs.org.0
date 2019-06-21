Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC784DFE9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 07:01:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VRNz37PVzDqSp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 15:01:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="CEH+cIP/"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VRGh1n7MzDqM3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 14:56:12 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id a186so2925458pfa.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 21:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nqm1MiOeZebJXjq+40rQkia+J1ym1ayfkTrPWZH8MuU=;
 b=CEH+cIP/D8aKydaX7bJlG1xIGFCaE7nMY6FcksZWqq53ZTzi4ew+6Yvjk1icfSk/88
 sCSEZnyLVV9Tevlqeb/efgjkyh8ZVz1+myLJPVuPrupJnR+baohXj7SbXn867BEPyN8g
 olF4FgRCsLNuRlCeHARm0yP7uIZV4MJb3vofdX5Ago2ZYsYczMYPQ9PagJFqGIq28EDv
 gge67ODPKggsy/9dRMRNNnIiqBC8Te/U049qJ6+7TMYjfG8d4cb8papfqIdd8XX9e5WR
 6Vb5wSNPSmKB/TvCSjcZuAi4bn36h/My9irc2K7w4uTsJI7A8AlhVmm4HKZ4FqqXBX+H
 jntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nqm1MiOeZebJXjq+40rQkia+J1ym1ayfkTrPWZH8MuU=;
 b=TALILi/wI5JgoYbqceayvonfv6pKe5McA3op3kT31qaCqBHrUHRFImhmmnHS0JqMpJ
 Hv7KLCmK1qRiZuKJ8zmffWQFPK9aB//KlLzZ9YO3Zdjb+SfSeVwbbolQjm/oOxDS7yhQ
 +l7aKIZaTbh4uggpwvC1N4sxZ6Pd9OIzjVCc1GqwAc4SIC7bD5Qk2A16kLBrpOLrEAGA
 8LeqqANmqSrHOiJS9ME3qknD2ZCUdIxK4SITRN4NdLhd5vCRdYDHYo69Tmf32pwXqCHj
 hW0AO1thlJYNwtr5D8ZhUc798RDsb0mnHlFSJGrUnYexwC+K7HtBXIad/wuBxn0y5T2/
 H8Wg==
X-Gm-Message-State: APjAAAW0iii+VeKHrfg8VztdeO/wHgtsEagPq5a1xl+pZi9Yf7u/iRPh
 /lR/R90fMAx1qq863H4OuAtoaM3uGPEcGA==
X-Google-Smtp-Source: APXvYqx3sVo/tkXxtPqnNYlXg+BGXFzNtZsrT1oGiTTnPC+Iu0alp1bDr2DtKBHmhcoHx+7VL4aBaw==
X-Received: by 2002:a63:5247:: with SMTP id s7mr15642122pgl.29.1561092969731; 
 Thu, 20 Jun 2019 21:56:09 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.77])
 by smtp.gmail.com with ESMTPSA id q131sm1392069pfq.157.2019.06.20.21.56.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 21:56:09 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 02/13] powerpc/mce: Bug fixes for MCE handling in kernel space
Date: Fri, 21 Jun 2019 10:25:44 +0530
Message-Id: <9e9ec4eda29318385601ef75640defcbcf4ffe1e.1561020760.git.santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1561020760.git.santosh@fossix.org>
References: <cover.1561020760.git.santosh@fossix.org>
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

