Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA73BD1F4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 20:42:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46d96g6FZczDqbw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 04:42:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="CFdhV1Qx"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46d6dh3sCKzDqJB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 02:51:04 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5865721655;
 Tue, 24 Sep 2019 16:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569343862;
 bh=V6xVQoeu2fDcplB1iBbsCGRGy308EHq5ck/SPjxZkyc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CFdhV1QxYk/AYhM1ceWL6mRMvSPa/XmdXu5+QT4uwRrM5JFtjDNTmHKLxY28QlB/U
 1xS4b/Yft+ynAWenU5QhRnBD8vhv6Xw1lEprhHzkQ3XDdUcbp2wa06sOHiSHMbD754
 ymlCOmRAs2ecABlkI7ZZs1xitNELgwCfkIRirB04=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 17/28] powerpc/64s/radix: Remove redundant
 pfn_pte bitop, add VM_BUG_ON
Date: Tue, 24 Sep 2019 12:50:20 -0400
Message-Id: <20190924165031.28292-17-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924165031.28292-1-sashal@kernel.org>
References: <20190924165031.28292-1-sashal@kernel.org>
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
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

[ Upstream commit 6bb25170d7a44ef0ed9677814600f0785e7421d1 ]

pfn_pte is never given a pte above the addressable physical memory
limit, so the masking is redundant. In case of a software bug, it
is not obviously better to silently truncate the pfn than to corrupt
the pte (either one will result in memory corruption or crashes),
so there is no reason to add this to the fast path.

Add VM_BUG_ON to catch cases where the pfn is invalid. These would
catch the create_section_mapping bug fixed by a previous commit.

  [16885.256466] ------------[ cut here ]------------
  [16885.256492] kernel BUG at arch/powerpc/include/asm/book3s/64/pgtable.h:612!
  cpu 0x0: Vector: 700 (Program Check) at [c0000000ee0a36d0]
      pc: c000000000080738: __map_kernel_page+0x248/0x6f0
      lr: c000000000080ac0: __map_kernel_page+0x5d0/0x6f0
      sp: c0000000ee0a3960
     msr: 9000000000029033
    current = 0xc0000000ec63b400
    paca    = 0xc0000000017f0000   irqmask: 0x03   irq_happened: 0x01
      pid   = 85, comm = sh
  kernel BUG at arch/powerpc/include/asm/book3s/64/pgtable.h:612!
  Linux version 5.3.0-rc1-00001-g0fe93e5f3394
  enter ? for help
  [c0000000ee0a3a00] c000000000d37378 create_physical_mapping+0x260/0x360
  [c0000000ee0a3b10] c000000000d370bc create_section_mapping+0x1c/0x3c
  [c0000000ee0a3b30] c000000000071f54 arch_add_memory+0x74/0x130

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20190724084638.24982-5-npiggin@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 4dd13b503dbbd..5f37d8c3b4798 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -555,8 +555,10 @@ static inline int pte_present(pte_t pte)
  */
 static inline pte_t pfn_pte(unsigned long pfn, pgprot_t pgprot)
 {
-	return __pte((((pte_basic_t)(pfn) << PAGE_SHIFT) & PTE_RPN_MASK) |
-		     pgprot_val(pgprot));
+	VM_BUG_ON(pfn >> (64 - PAGE_SHIFT));
+	VM_BUG_ON((pfn << PAGE_SHIFT) & ~PTE_RPN_MASK);
+
+	return __pte(((pte_basic_t)pfn << PAGE_SHIFT) | pgprot_val(pgprot));
 }
 
 static inline unsigned long pte_pfn(pte_t pte)
-- 
2.20.1

