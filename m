Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DD613F0E0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 19:25:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zCKy5YGzzDqMB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 05:25:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=CL1K8fCi; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z9jJ09TPzDqDB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 04:12:04 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 55F7C24692;
 Thu, 16 Jan 2020 17:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194722;
 bh=2uKuAs6naMr2zEfcsacto/qs+ruPnyQY/BEKfR1seyU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CL1K8fCieIrIVrZSikx6BXGs20y81/cjZI9OC9Zghg3h9ieyDa06dlJaQf5UgYk3M
 SnAOxAN5ezI3ht+JRKgN2SRiUaCbfSCpURbhRAXn2cdpXm1I6qEEAjnZ4oFRD6gh/Z
 ZX3jBpt2UBi/WKqcNOzRf9uoWx0sIJJSIN9/xgeE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 557/671] powerpc/mm/mce: Keep irqs disabled
 during lockless page table walk
Date: Thu, 16 Jan 2020 12:03:15 -0500
Message-Id: <20200116170509.12787-294-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116170509.12787-1-sashal@kernel.org>
References: <20200116170509.12787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>

[ Upstream commit d9101bfa6adc831bda8836c4d774820553c14942 ]

__find_linux_mm_pte() returns a page table entry pointer after walking
the page table without holding locks. To make it safe against a THP
split and/or collapse, we disable interrupts around the lockless page
table walk. However we need to keep interrupts disabled as long as we
use the page table entry pointer that is returned.

Fix addr_to_pfn() to do that.

Fixes: ba41e1e1ccb9 ("powerpc/mce: Hookup derror (load/store) UE errors")
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
[mpe: Rearrange code slightly and tweak change log wording]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20190918145328.28602-1-aneesh.kumar@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/mce_power.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index 37a110b8e7e1..ecb375040637 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -40,7 +40,7 @@ static unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr)
 {
 	pte_t *ptep;
 	unsigned int shift;
-	unsigned long flags;
+	unsigned long pfn, flags;
 	struct mm_struct *mm;
 
 	if (user_mode(regs))
@@ -50,18 +50,22 @@ static unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr)
 
 	local_irq_save(flags);
 	ptep = __find_linux_pte(mm->pgd, addr, NULL, &shift);
-	local_irq_restore(flags);
 
-	if (!ptep || pte_special(*ptep))
-		return ULONG_MAX;
+	if (!ptep || pte_special(*ptep)) {
+		pfn = ULONG_MAX;
+		goto out;
+	}
 
-	if (shift > PAGE_SHIFT) {
+	if (shift <= PAGE_SHIFT)
+		pfn = pte_pfn(*ptep);
+	else {
 		unsigned long rpnmask = (1ul << shift) - PAGE_SIZE;
-
-		return pte_pfn(__pte(pte_val(*ptep) | (addr & rpnmask)));
+		pfn = pte_pfn(__pte(pte_val(*ptep) | (addr & rpnmask)));
 	}
 
-	return pte_pfn(*ptep);
+out:
+	local_irq_restore(flags);
+	return pfn;
 }
 
 /* flush SLBs and reload */
-- 
2.20.1

