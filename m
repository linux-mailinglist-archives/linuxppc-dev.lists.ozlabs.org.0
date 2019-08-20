Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A94895954
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 10:20:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CNyc3BDSzDqwF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 18:20:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="ZaxOt8lk"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CNqP5n3zzDqcX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 18:14:09 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id z3so2367262pln.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 01:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XQA3UCdGC7caS48ij4zC/iNWJe//yYh8xmEXn6HYb5Q=;
 b=ZaxOt8lk22Z21ulmXMLkeo0R/2PTzZDR0R59vKVCfgZDN+uL7ZpYx1PvlCJfYueDro
 0+iBPqErLvoipl5xvSp7vEG5falbWHLpEPg5ypzBjEf8/k1FBngvApv3z67S5WLsZJMt
 mnMgTwgsaNsf9qzaMKnwiJ36s+EIsL+8fLtrDdWbyrexuraTZIp8JMe9ECT4fp0zQbSv
 lfOwLIRUpV7X8afUFwENMwTu2KajbnGZpMxfWW4Fh68lFD4sdthbwcapSbGieEc32Ddc
 n9FJo7AcVmmXhFBst/qWjg54KCZJ8XK61xbCBHNv5qtO0PpQvjDw6gnY5bc0QMok60VT
 i7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XQA3UCdGC7caS48ij4zC/iNWJe//yYh8xmEXn6HYb5Q=;
 b=HggM7kFzAXyz5IsKzeUFys5rEQP5fd0RKJg1/HnNr78z2Mbg7de2YadFBWtdJXWBkk
 VZxtaASD/tTTx49XlxWHk8d51Xz7+MT2ylBAah+iSFNypzaNz/6jRNtRdqtopGb/w9zY
 dP0ZFCbEgIg0pLS/3VHCvk46GMqVFZiu/1nXTdlYWLNneOkVxNIBdrtaiXnTiM5G5yhp
 f5JCVbR+WaZ+zvv5BQB2UkHLgLhIaa9pz1Nnz9jZMOA69hISCA9xTd1ZiX9YVdZD4yWG
 w+fVRR8cIz39WKG4ilJDzjCr6trScm7EdPNOmP0m7upXHcg3BjLpxqk1Uq+9GpbukHHb
 KazA==
X-Gm-Message-State: APjAAAWeu3JXf/Wpz/wuw8bQJWdQlC7rkqv+1QKiRAQo1MhXjCmny4d2
 Q0VgkksD64mJxj63vMyOenMewSlOB9WsiA==
X-Google-Smtp-Source: APXvYqwKartOprZEYdfxJQodngK2fUrnjvEtKW/9LFLWW5vrWacynvDQZeXWHe7YGCrlHyzifHiUvw==
X-Received: by 2002:a17:902:fe06:: with SMTP id
 g6mr26976368plj.265.1566288847004; 
 Tue, 20 Aug 2019 01:14:07 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.78])
 by smtp.gmail.com with ESMTPSA id b14sm18949265pfo.15.2019.08.20.01.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:14:06 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 2/7] powerpc/mce: Fix MCE handling for huge pages
Date: Tue, 20 Aug 2019 13:43:47 +0530
Message-Id: <20190820081352.8641-3-santosh@fossix.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820081352.8641-1-santosh@fossix.org>
References: <20190820081352.8641-1-santosh@fossix.org>
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
Tested-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
Cc: stable@vger.kernel.org # v4.15+
---
 arch/powerpc/kernel/mce_power.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index a814d2dfb5b0..714a98e0927f 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -26,6 +26,7 @@
 unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr)
 {
 	pte_t *ptep;
+	unsigned int shift;
 	unsigned long flags;
 	struct mm_struct *mm;
 
@@ -35,13 +36,18 @@ unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr)
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
+
+	if (shift > PAGE_SHIFT) {
+		unsigned long rpnmask = (1ul << shift) - PAGE_SIZE;
+
+		return pte_pfn(__pte(pte_val(*ptep) | (addr & rpnmask)));
+	}
+
 	return pte_pfn(*ptep);
 }
 
@@ -344,7 +350,7 @@ static const struct mce_derror_table mce_p9_derror_table[] = {
   MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0, false, 0, 0, 0, 0, 0 } };
 
-static int mce_find_instr_ea_and_pfn(struct pt_regs *regs, uint64_t *addr,
+static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
 					uint64_t *phys_addr)
 {
 	/*
@@ -541,7 +547,8 @@ static int mce_handle_derror(struct pt_regs *regs,
 			 * kernel/exception-64s.h
 			 */
 			if (get_paca()->in_mce < MAX_MCE_DEPTH)
-				mce_find_instr_ea_and_pfn(regs, addr, phys_addr);
+				mce_find_instr_ea_and_phys(regs, addr,
+							   phys_addr);
 		}
 		found = 1;
 	}
-- 
2.21.0

