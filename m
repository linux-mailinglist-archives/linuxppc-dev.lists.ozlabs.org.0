Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8101D6358B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 14:24:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jhMK5GtpzDqWx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 22:24:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="Y/8+Bkta"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jh9j1yltzDqPv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 22:15:53 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id b13so4610294pfo.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jul 2019 05:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MJzVf8ePz92EuVzLMfLPbljGXsEH0ENJuGJ8qCk3dtg=;
 b=Y/8+BktagPsVjEodnOtdSnVQBboOpWy8Ukuc4xnOew3GCDUrIqFAa+v2DGPzMYPLTr
 DIyUThl4ySWwluFZI2ifBCtAS+y2cT0ntV6hdqO1OfSLVParmN5hhgkxPc563fOXUta4
 upQJjhoDg2VFKse4TgeyuEPWcbzTS+n5vAUo9hYwSeAkhUDFZuVIpxc+XE71Ex5Iq8oT
 /FOb6oYWfKAweWNYgh85PLGsy1LqdmUMRsOwheS9lMhImozk5CJOsvhiMbxlF0v3LzQg
 3c3d9bV5Rq1tzI+okjNqdnwabz68G3fUuS44arIRhSA7IWty3OIYhQnNAcVojEvM7sga
 5I7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MJzVf8ePz92EuVzLMfLPbljGXsEH0ENJuGJ8qCk3dtg=;
 b=T7I6/gnDHwUuk5Dym3pcFhIcog5F4XY8otbuzv0AuzPw95M6HQdhcayUepzputEEVj
 yiTLi9W5tBZA6iUK4kUkI/0qB/y99X4rTqC4yIvjtH9G9DVWTu1+WPpi4pXsZqCUq8g9
 iduLuRN7d0K0RxAVE9bGCbeBzwumwE3OHrF3ewhyGPMbL5h/zrZhHPoOHsB4wRIcLtje
 5vJl1EfTT/80D16GHJiZ165lyaD0M/OXSLjS3R3j6kAiDYnfYOCV33Wt/GFJOLVfffXN
 kP/DNIkzFBz2nmt2goVewVd9g/KroLxwZpTvAzVtDc6k23IU0GMXnrNz7OMpDtqC2Def
 py3g==
X-Gm-Message-State: APjAAAVMfZIyP9c2vY7vRKIR5H894MwBVbX6tKVRB127oHuZrJReXJOW
 s1TZRLDBDFQjrTttEQB2sINaRsC7pXHysWNZ
X-Google-Smtp-Source: APXvYqznakK/ppI4kgBJucoH/5l1KUpuuI6JglAn8z1HDKR3+4eXRffTRdSHVsigXE4ao1gi4cFlcg==
X-Received: by 2002:a63:d944:: with SMTP id e4mr29885876pgj.261.1562674551130; 
 Tue, 09 Jul 2019 05:15:51 -0700 (PDT)
Received: from santosiv.in.ibm.com ([223.186.121.175])
 by smtp.gmail.com with ESMTPSA id o15sm21243933pgj.18.2019.07.09.05.15.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 05:15:50 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org
Subject: [v5 2/6] powerpc/mce: Fix MCE handling for huge pages
Date: Tue,  9 Jul 2019 17:45:20 +0530
Message-Id: <20190709121524.18762-3-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190709121524.18762-1-santosh@fossix.org>
References: <20190709121524.18762-1-santosh@fossix.org>
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

The current code would fail on huge pages addresses, since the shift
would be incorrect. Use the correct page shift value returned by
__find_linux_pte() to get the correct pfn. The code is more generic
and can handle both regular and compound pages.

Fixes: ba41e1e1ccb9 ("powerpc/mce: Hookup derror (load/store) UE errors")

Signed-off-by: Balbir Singh <bsingharora@gmail.com>
[arbab@linux.ibm.com: Fixup pseries_do_memory_failure()]
Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
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

