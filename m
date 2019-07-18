Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6876C89A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 07:14:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45q2P26jk6zDqJc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 15:14:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 45q2LF2l3PzDqLn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 15:11:49 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 434E2AE807EF;
 Thu, 18 Jul 2019 01:11:41 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v5 1/4] powerpc/powernv/ioda: Fix race in TCE level
 allocation
Date: Thu, 18 Jul 2019 15:11:36 +1000
Message-Id: <20190718051139.74787-2-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190718051139.74787-1-aik@ozlabs.ru>
References: <20190718051139.74787-1-aik@ozlabs.ru>
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, stable@vger.kernel.org,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pnv_tce() returns a pointer to a TCE entry and originally a TCE table
would be pre-allocated. For the default case of 2GB window the table
needs only a single level and that is fine. However if more levels are
requested, it is possible to get a race when 2 threads want a pointer
to a TCE entry from the same page of TCEs.

This adds cmpxchg to handle the race. Note that once TCE is non-zero,
it cannot become zero again.

CC: stable@vger.kernel.org # v4.19+
Fixes: a68bd1267b72 ("powerpc/powernv/ioda: Allocate indirect TCE levels on demand")
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

The race occurs about 30 times in the first 3 minutes of copying files
via rsync and that's about it.

This fixes EEH's from
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=110810

---
Changes:
v2:
* replaced spin_lock with cmpxchg+readonce
---
 arch/powerpc/platforms/powernv/pci-ioda-tce.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda-tce.c b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
index e28f03e1eb5e..8d6569590161 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda-tce.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
@@ -48,6 +48,9 @@ static __be64 *pnv_alloc_tce_level(int nid, unsigned int shift)
 	return addr;
 }
 
+static void pnv_pci_ioda2_table_do_free_pages(__be64 *addr,
+		unsigned long size, unsigned int levels);
+
 static __be64 *pnv_tce(struct iommu_table *tbl, bool user, long idx, bool alloc)
 {
 	__be64 *tmp = user ? tbl->it_userspace : (__be64 *) tbl->it_base;
@@ -57,9 +60,9 @@ static __be64 *pnv_tce(struct iommu_table *tbl, bool user, long idx, bool alloc)
 
 	while (level) {
 		int n = (idx & mask) >> (level * shift);
-		unsigned long tce;
+		unsigned long oldtce, tce = be64_to_cpu(READ_ONCE(tmp[n]));
 
-		if (tmp[n] == 0) {
+		if (!tce) {
 			__be64 *tmp2;
 
 			if (!alloc)
@@ -70,10 +73,15 @@ static __be64 *pnv_tce(struct iommu_table *tbl, bool user, long idx, bool alloc)
 			if (!tmp2)
 				return NULL;
 
-			tmp[n] = cpu_to_be64(__pa(tmp2) |
-					TCE_PCI_READ | TCE_PCI_WRITE);
+			tce = __pa(tmp2) | TCE_PCI_READ | TCE_PCI_WRITE;
+			oldtce = be64_to_cpu(cmpxchg(&tmp[n], 0,
+					cpu_to_be64(tce)));
+			if (oldtce) {
+				pnv_pci_ioda2_table_do_free_pages(tmp2,
+					ilog2(tbl->it_level_size) + 3, 1);
+				tce = oldtce;
+			}
 		}
-		tce = be64_to_cpu(tmp[n]);
 
 		tmp = __va(tce & ~(TCE_PCI_READ | TCE_PCI_WRITE));
 		idx &= ~mask;
-- 
2.17.1

