Return-Path: <linuxppc-dev+bounces-1414-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6284297A8D8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2024 23:34:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6ypv3wKBz2yFQ;
	Tue, 17 Sep 2024 07:34:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726511769;
	cv=none; b=MwnzSm+JDVTfTg9rnh6k0tU3/Sm/wRqCKTlPcJHzdukMfGSxp3r8WmzUs2R6K7N6ssE/nxmKXhXLBQcOaHqQD+sG1Drw0sE8yPdiDBexuCPq/JQ3ljy2X9sqn2EmXCREs2CU6+X7+rBOZdQ7G6SeaJ0MkbZvQZnt7yVVZ0Pq8+lUcFGUYX3Zh2IYXXARftQofhnNNjO3egaII8ICS6UqRM0bhS/CJ96oGmSMF4KEJeU2p4jL3VgL6GSAGwxIN+clLZ7SXi2EhwrVqnzO/zicetFu7CP4Xq26IuJgEIPTAEYuAHWu4EQFF8dHnW0CHmWBrofhL4xHfEtnphjGWiTgcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726511769; c=relaxed/relaxed;
	bh=A4xTVjIAJOyLBlRcJFvKJNObv3yBThLCPXFlb+2AULo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=blrAh8+J/zkS98l6Te0mrGn4/zjUZNrkWdwKq/UGaOZH++yOwx7kvcs7iz/pC0PJSL+nH+pJGsRKFVl1QE9//9Ga43/bmWganagkFzHittFdjMgUbSplFq8ofOKEyjOlM2uHCUlOOCtEaLUpO+qAsegw8IjtjSCHMxdUatuDhHOAyyW89EL8+tVHS5NUX3XFG5t4p7/vlQw84vgWExaB3BE2C82leCu/u3QQ2JjKavGAFjkQzi0lUKxjAgl9+qLByMRXhp5c81RzZNdw9w443wVkod8+44ZLRDKV+qfO9DviSdCtv2nFRRtBXaiYEDaLZhTsU3lYEAKnZ6QHROFPBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G5Hghr/j; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G5Hghr/j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6tsN5FTxz2xYw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2024 04:36:07 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48GIV7mY023222;
	Mon, 16 Sep 2024 18:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=A4xTVjIAJOyLBlRcJFvKJNObv3
	yBThLCPXFlb+2AULo=; b=G5Hghr/jujEomuuHVeGjxiNL6cQ2Uh4reZwim/WeMn
	is2/YxhEbTdNg54G0iaZBywwhUymkr39Xmr5aR8I8fNxt6Y7JPU0WSBtPyqpYNJO
	kNF+R71h+VUsnVZCxJg93r0gMdbx1iyHpbnKcaYPSrJX39IJMoFbr5QnN6KuGbVy
	SbshGRP+8rrY8m8Lb5tm1SwqxAVPE0qct9APv5upWPHmimQskCWKC1KDI+2kfkQP
	L6VPEM62JV4cSv84/2E4dnxsXnjUHiiVmDzDr+/zbK+6m5qH8dJsv6M55ZysETWL
	kT6MC5FUgPs1MeNzSUw8vOVffM12CXzoC1voz1f1hAzA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n3ud3rhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 18:36:01 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48GH08Dv000641;
	Mon, 16 Sep 2024 18:36:00 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41nn7116bk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 18:36:00 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48GIZxYf47579602
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Sep 2024 18:35:59 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C79658052;
	Mon, 16 Sep 2024 18:35:59 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 46C1358045;
	Mon, 16 Sep 2024 18:35:59 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.251.176])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Sep 2024 18:35:59 +0000 (GMT)
From: Gaurav Batra <gbatra@linux.ibm.com>
To: mpe@ellerman.id.au
Cc: brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        Gaurav Batra <gbatra@linux.ibm.com>
Subject: [PATCH] powerpc/pseries/iommu: Wait until all TCEs are unmapped before deleting DDW
Date: Mon, 16 Sep 2024 13:35:58 -0500
Message-Id: <20240916183558.89919-1-gbatra@linux.ibm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xY961e8zYxSddK86fOFLmGkItuuT-xA6
X-Proofpoint-ORIG-GUID: xY961e8zYxSddK86fOFLmGkItuuT-xA6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-16_14,2024-09-16_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409160123

Some of the network drivers, like Mellanox, use core linux page_pool APIs
to manage DMA buffers. These page_pool APIs cache DMA buffers with
infrequent map/unmap calls for DMA mappings, thus increasing performance.

When a device is initialized, the drivers makes a call to the page_pool API
to create a DMA buffer pool. Hence forth DMA buffers are allocated and
freed from this pool by the driver. The DMA map/unmap is done by the core
page_pool infrastructure.

These DMA buffers could be allocated for RX/TX buffer rings for the device
or could be in-process by the network stack.

When a network device is closed, driver will release all DMA mapped
buffers. All the DMA buffers allocated to the RX/TX rings are released back
to the page_pool by the driver. Some of the DMA mapped buffers could still
be allocated and in-process by the network stack.

DMA buffers that are relased by the Network driver are synchronously
unmapped by the page_pool APIs. But, DMA buffers that are passed to the
network stack and still in-process are unmapped later asynchronously by the
page_pool infrastructure.

This asynchronous unmapping of the DMA buffers, by the page_pool, can lead
to issues when a network device is dynamically removed in PowerPC
architecture.  When a network device is DLPAR removed, the driver releases
all the mapped DMA buffers and stops using the device. Driver returns
successfully. But, at this stage there still could be mapped DMA buffers
which are in-process by the network stack.

DLPAR code proceeds to remove the device from the device tree, deletes
Dynamic DMA Window (DDW) and associated IOMMU tables. DLPAR of the device
succeeds.

Later, when network stack release some of the DMA buffers, page_pool
proceeds to unmap them. The page_pool relase path calls into PowerPC TCE
management to release the TCE. This is where the LPAR OOPses since the DDW
and associated resources for the device are already free'ed.

This issue was exposed during LPM from a Power9 to Power10 machine with HNV
configuration. The bonding device is Virtual Ethernet with SR-IOV. During
LPM, I/O is switched from SR-IOV to passive Virtual Ethernet and DLPAR
remove of SR-IOV is initiated. This lead to the above mentioned scenario.

It is possible to hit this issue by just Dynamically removing SR-IOV device
which is under heavy I/O load, a scenario where some of the mapped DMA
buffers are in-process somewhere in the network stack and not mapped to the
RX/TX ring of the device.

The issue is only encountered when TCEs are dynamically managed. In this
scenario map/unmap of TCEs goes into the PowerPC TCE management path as and
when DMA bufffers are mapped/unmaped and accesses DDW resources. When RAM
is directly mapped during device initialization, this dynamic TCE
management is by-passed and LPAR doesn't OOPses.

Solution:

During DLPAR remove of the device, before deleting the DDW and associated
resources, check to see if there are any outstanding TCEs. If there are
outstanding TCEs, sleep for 50ms and check again, until all the TCEs are
unmapped.

Once all the TCEs are unmapped, DDW is removed and DLPAR succeeds. This
ensures there will be no reference to the DDW after it is deleted.

Signed-off-by: Gaurav Batra <gbatra@linux.ibm.com>
---
 arch/powerpc/kernel/iommu.c            | 22 ++++++++++++++++++++--
 arch/powerpc/platforms/pseries/iommu.c |  8 ++++----
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 76381e14e800..af7511a8f480 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -14,6 +14,7 @@
 #include <linux/types.h>
 #include <linux/slab.h>
 #include <linux/mm.h>
+#include <linux/delay.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/dma-mapping.h>
@@ -803,6 +804,7 @@ bool iommu_table_in_use(struct iommu_table *tbl)
 static void iommu_table_free(struct kref *kref)
 {
 	struct iommu_table *tbl;
+	unsigned long start_time;
 
 	tbl = container_of(kref, struct iommu_table, it_kref);
 
@@ -817,8 +819,24 @@ static void iommu_table_free(struct kref *kref)
 	iommu_debugfs_del(tbl);
 
 	/* verify that table contains no entries */
-	if (iommu_table_in_use(tbl))
-		pr_warn("%s: Unexpected TCEs\n", __func__);
+	start_time = jiffies;
+	while (iommu_table_in_use(tbl)) {
+		int sec;
+
+		pr_info("%s: Unexpected TCEs, wait for 50ms\n", __func__);
+		msleep(50);
+
+		/* Come out of the loop if we have already waited for 120 seconds
+		 * for the TCEs to be free'ed. TCE are being free'ed
+		 * asynchronously by some DMA buffer management API - like
+		 * page_pool.
+		 */
+		sec = (s32)((u32)jiffies - (u32)start_time) / HZ;
+		if (sec >= 120) {
+			pr_warn("%s: TCEs still mapped even after 120 seconds\n", __func__);
+			break;
+		}
+	}
 
 	/* free bitmap */
 	vfree(tbl->it_map);
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 534cd159e9ab..925494b6fafb 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -2390,6 +2390,10 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
 
 	switch (action) {
 	case OF_RECONFIG_DETACH_NODE:
+		if (pci && pci->table_group)
+			iommu_pseries_free_group(pci->table_group,
+					np->full_name);
+
 		/*
 		 * Removing the property will invoke the reconfig
 		 * notifier again, which causes dead-lock on the
@@ -2400,10 +2404,6 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
 		if (remove_dma_window_named(np, false, DIRECT64_PROPNAME, true))
 			remove_dma_window_named(np, false, DMA64_PROPNAME, true);
 
-		if (pci && pci->table_group)
-			iommu_pseries_free_group(pci->table_group,
-					np->full_name);
-
 		spin_lock(&dma_win_list_lock);
 		list_for_each_entry(window, &dma_win_list, list) {
 			if (window->device == np) {

base-commit: 6e4436539ae182dc86d57d13849862bcafaa4709
-- 
2.39.3 (Apple Git-146)


