Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8244C91AE1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 03:53:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BcQg2lZszDr9H
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 11:53:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 46BcNn2Wk4zDqdc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 11:51:52 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 0CA6BAE8001C;
 Sun, 18 Aug 2019 21:51:00 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] vfio/spapr_tce: Fix incorrect tce_iommu_group memory
 free
Date: Mon, 19 Aug 2019 11:51:17 +1000
Message-Id: <20190819015117.94878-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
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
Cc: kvm@vger.kernel.org, Jose Ricardo Ziviani <joserz@linux.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, kvm-ppc@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The @tcegrp variable is used in 1) a loop over attached groups
2) it stores a pointer to a newly allocated tce_iommu_group if 1) found
nothing. However the error handler does not distinguish how we got there
and incorrectly releases memory for a found+incompatible group.

This fixes it by adding another error handling case.

Fixes: 0bd971676e68 ("powerpc/powernv/npu: Add compound IOMMU groups")
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

The bug is there since 2157e7b82f3b but it would not appear in practice
before 0bd971676e68, hence that "Fixes". Or it still should be
157e7b82f3b ("vfio: powerpc/spapr: Register memory and define IOMMU v2")
?

Found it when tried adding a "compound PE" (GPU + NPUs) to a container
with a passed through xHCI host. The compatibility test (->create_table
should be equal) treats them as incompatible which might a bug (or
we are just suboptimal here) on its own.

---
 drivers/vfio/vfio_iommu_spapr_tce.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_spapr_tce.c b/drivers/vfio/vfio_iommu_spapr_tce.c
index 8ce9ad21129f..babef8b00daf 100644
--- a/drivers/vfio/vfio_iommu_spapr_tce.c
+++ b/drivers/vfio/vfio_iommu_spapr_tce.c
@@ -1234,7 +1234,7 @@ static long tce_iommu_take_ownership_ddw(struct tce_container *container,
 static int tce_iommu_attach_group(void *iommu_data,
 		struct iommu_group *iommu_group)
 {
-	int ret;
+	int ret = 0;
 	struct tce_container *container = iommu_data;
 	struct iommu_table_group *table_group;
 	struct tce_iommu_group *tcegrp = NULL;
@@ -1287,13 +1287,13 @@ static int tce_iommu_attach_group(void *iommu_data,
 			!table_group->ops->release_ownership) {
 		if (container->v2) {
 			ret = -EPERM;
-			goto unlock_exit;
+			goto free_exit;
 		}
 		ret = tce_iommu_take_ownership(container, table_group);
 	} else {
 		if (!container->v2) {
 			ret = -EPERM;
-			goto unlock_exit;
+			goto free_exit;
 		}
 		ret = tce_iommu_take_ownership_ddw(container, table_group);
 		if (!tce_groups_attached(container) && !container->tables[0])
@@ -1305,10 +1305,11 @@ static int tce_iommu_attach_group(void *iommu_data,
 		list_add(&tcegrp->next, &container->group_list);
 	}
 
-unlock_exit:
+free_exit:
 	if (ret && tcegrp)
 		kfree(tcegrp);
 
+unlock_exit:
 	mutex_unlock(&container->lock);
 
 	return ret;
-- 
2.17.1

