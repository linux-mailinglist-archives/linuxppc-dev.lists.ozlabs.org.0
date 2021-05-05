Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED553740B5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 18:36:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fb2R42JqXz3dT1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 02:36:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xem00VX2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Xem00VX2; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fb2QD3rwJz3d4T
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 02:35:48 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D3DB61925;
 Wed,  5 May 2021 16:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232546;
 bh=K1Ad5LIEd+gqJ8BD+O00ND/QWNDl+hwMAp3Bhh7hrOc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xem00VX2KMb0yrScWYlYZx9TVr/7h6MZlXErZjY4aWKHumGGY0U0QNdQ7mz9tLCwZ
 UyfoBccksh04Toa8JN4mzrxTfvBdlVAKNgUZ3OUOfWcQaDCGsTo/E4OjPqJyx8MBrL
 5clkEwVcyD7LYG82ho5mm67c+GTL6gktmiUZRcqK1UVZenxnv7CjFaruTEUFpiScWD
 jEfLeGgRqxJuc7SyaTVxl4dcbyJ1o8P1Z/7pCPp00BgM8QfwS24OI6anrcMriZSiAL
 07tcuLLtG1qFWIwj88hjOvb44530fV/Ktg5VLnW3TJgMtt2lgJ792ShH3o2/EVD84V
 tZoe3iVQeObLw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 064/104] powerpc/mm: Add cond_resched() while
 removing hpte mappings
Date: Wed,  5 May 2021 12:33:33 -0400
Message-Id: <20210505163413.3461611-64-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163413.3461611-1-sashal@kernel.org>
References: <20210505163413.3461611-1-sashal@kernel.org>
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
 Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Vaibhav Jain <vaibhav@linux.ibm.com>

[ Upstream commit a5d6a3e73acbd619dd5b7b831762b755f9e2db80 ]

While removing large number of mappings from hash page tables for
large memory systems as soft-lockup is reported because of the time
spent inside htap_remove_mapping() like one below:

 watchdog: BUG: soft lockup - CPU#8 stuck for 23s!
 <snip>
 NIP plpar_hcall+0x38/0x58
 LR  pSeries_lpar_hpte_invalidate+0x68/0xb0
 Call Trace:
  0x1fffffffffff000 (unreliable)
  pSeries_lpar_hpte_removebolted+0x9c/0x230
  hash__remove_section_mapping+0xec/0x1c0
  remove_section_mapping+0x28/0x3c
  arch_remove_memory+0xfc/0x150
  devm_memremap_pages_release+0x180/0x2f0
  devm_action_release+0x30/0x50
  release_nodes+0x28c/0x300
  device_release_driver_internal+0x16c/0x280
  unbind_store+0x124/0x170
  drv_attr_store+0x44/0x60
  sysfs_kf_write+0x64/0x90
  kernfs_fop_write+0x1b0/0x290
  __vfs_write+0x3c/0x70
  vfs_write+0xd4/0x270
  ksys_write+0xdc/0x130
  system_call+0x5c/0x70

Fix this by adding a cond_resched() to the loop in
htap_remove_mapping() that issues hcall to remove hpte mapping. The
call to cond_resched() is issued every HZ jiffies which should prevent
the soft-lockup from being reported.

Suggested-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20210404163148.321346-1-vaibhav@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 73b06adb6eeb..f81b09769e0b 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -337,7 +337,7 @@ int htab_bolt_mapping(unsigned long vstart, unsigned long vend,
 int htab_remove_mapping(unsigned long vstart, unsigned long vend,
 		      int psize, int ssize)
 {
-	unsigned long vaddr;
+	unsigned long vaddr, time_limit;
 	unsigned int step, shift;
 	int rc;
 	int ret = 0;
@@ -350,8 +350,19 @@ int htab_remove_mapping(unsigned long vstart, unsigned long vend,
 
 	/* Unmap the full range specificied */
 	vaddr = ALIGN_DOWN(vstart, step);
+	time_limit = jiffies + HZ;
+
 	for (;vaddr < vend; vaddr += step) {
 		rc = mmu_hash_ops.hpte_removebolted(vaddr, psize, ssize);
+
+		/*
+		 * For large number of mappings introduce a cond_resched()
+		 * to prevent softlockup warnings.
+		 */
+		if (time_after(jiffies, time_limit)) {
+			cond_resched();
+			time_limit = jiffies + HZ;
+		}
 		if (rc == -ENOENT) {
 			ret = -ENOENT;
 			continue;
-- 
2.30.2

