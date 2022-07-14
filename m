Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD61757465D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 10:12:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lk6f73rT2z3cdq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 18:11:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lk6dl3nmBz3bx3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 18:11:39 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
	by ozlabs.ru (Postfix) with ESMTP id E5797804CB;
	Thu, 14 Jul 2022 04:11:34 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] powerpc/iommu: Fix iommu_table_in_use for a small default DMA window case
Date: Thu, 14 Jul 2022 18:11:19 +1000
Message-Id: <20220714081119.3714605-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Leonardo Bras <leobras.c@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The existing iommu_table_in_use() helper checks if the kernel is using
any of TCEs. There are some reserved TCEs:
1) the very first one if DMA window starts from 0 to avoid having a zero
but still valid DMA handle;
2) it_reserved_start..it_reserved_end to exclude MMIO32 window in case
the default window spans across that - this is the default for the first
DMA window on PowerNV.

When 1) is the case and 2) is not the helper does not skip 1) and returns
wrong status.

This only seems occurring when passing through a PCI device to a nested
guest (not something we support really well) so it has not been seen
before.

This fixes the bug by adding a special case for no MMIO32 reservation.

Fixes: 3c33066a2190 ("powerpc/kernel/iommu: Add new iommu_table_in_use() helper")
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kernel/iommu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 7e56ddb3e0b9..caebe1431596 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -775,6 +775,11 @@ bool iommu_table_in_use(struct iommu_table *tbl)
 	/* ignore reserved bit0 */
 	if (tbl->it_offset == 0)
 		start = 1;
+
+	/* Simple case with no reserved MMIO32 region */
+	if (!tbl->it_reserved_start && !tbl->it_reserved_end)
+		return find_next_bit(tbl->it_map, tbl->it_size, start) != tbl->it_size;
+
 	end = tbl->it_reserved_start - tbl->it_offset;
 	if (find_next_bit(tbl->it_map, end, start) != end)
 		return true;
-- 
2.30.2

