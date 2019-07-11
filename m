Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E803658AE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 16:21:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kysf2WXNzDqjV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 00:21:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kypt4TjfzDqjH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 00:18:58 +1000 (AEST)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 50C1B3222C970C39F9BC;
 Thu, 11 Jul 2019 22:18:52 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Thu, 11 Jul 2019
 22:18:45 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <benh@kernel.crashing.org>, <paulus@samba.org>, <mpe@ellerman.id.au>,
 <aik@ozlabs.ru>, <david@gibson.dropbear.id.au>
Subject: [PATCH -next] powerpc/powernv/ioda: using kfree_rcu() to simplify the
 code
Date: Thu, 11 Jul 2019 22:18:18 +0800
Message-ID: <20190711141818.18044-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
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
Cc: YueHaibing <yuehaibing@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The callback function of call_rcu() just calls a kfree(), so we
can use kfree_rcu() instead of call_rcu() + callback function.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/powerpc/platforms/powernv/pci-ioda-tce.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda-tce.c b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
index e28f03e..05f80b1 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda-tce.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
@@ -332,14 +332,6 @@ long pnv_pci_ioda2_table_alloc_pages(int nid, __u64 bus_offset,
 	return -ENOMEM;
 }
 
-static void pnv_iommu_table_group_link_free(struct rcu_head *head)
-{
-	struct iommu_table_group_link *tgl = container_of(head,
-			struct iommu_table_group_link, rcu);
-
-	kfree(tgl);
-}
-
 void pnv_pci_unlink_table_and_group(struct iommu_table *tbl,
 		struct iommu_table_group *table_group)
 {
@@ -355,7 +347,7 @@ void pnv_pci_unlink_table_and_group(struct iommu_table *tbl,
 	list_for_each_entry_rcu(tgl, &tbl->it_group_list, next) {
 		if (tgl->table_group == table_group) {
 			list_del_rcu(&tgl->next);
-			call_rcu(&tgl->rcu, pnv_iommu_table_group_link_free);
+			kfree_rcu(tgl, rcu);
 			found = true;
 			break;
 		}
-- 
2.7.4


