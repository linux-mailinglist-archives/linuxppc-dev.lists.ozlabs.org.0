Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE50E1433BB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2020 23:12:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481m9r0SryzDqgM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 09:12:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481m7m23FKzDqdm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 09:10:28 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00KM7Iqr175851; Mon, 20 Jan 2020 17:10:18 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xmg3a9prg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jan 2020 17:10:17 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00KM8s9Q030766;
 Mon, 20 Jan 2020 22:10:17 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 2xksn66ck1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jan 2020 22:10:17 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00KMAGM842008842
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jan 2020 22:10:16 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 914D7AE0F2;
 Mon, 20 Jan 2020 22:10:16 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1881AE0F4;
 Mon, 20 Jan 2020 22:10:13 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.26.151])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 20 Jan 2020 22:10:13 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/pseries/vio: Fix iommu_table use-after-free refcount
 warning
Date: Mon, 20 Jan 2020 14:10:02 -0800
Message-Id: <1579558202-26052-1-git-send-email-tyreld@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-20_10:2020-01-20,
 2020-01-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=3
 lowpriorityscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=815 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-2001200185
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, aik@ozlabs.ru,
 Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, drt@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>

Commit e5afdf9dd515 ("powerpc/vfio_spapr_tce: Add reference counting to
iommu_table") missed an iommu_table allocation in the pseries vio code.
The iommu_table is allocated with kzalloc and as a result the associated
kref gets a value of zero. This has the side effect that during a DLPAR
remove of the associated virtual IOA the iommu_tce_table_put() triggers
a use-after-free underflow warning.

Call Trace:
[c0000002879e39f0] [c00000000071ecb4] refcount_warn_saturate+0x184/0x190
(unreliable)
[c0000002879e3a50] [c0000000000500ac] iommu_tce_table_put+0x9c/0xb0
[c0000002879e3a70] [c0000000000f54e4] vio_dev_release+0x34/0x70
[c0000002879e3aa0] [c00000000087cfa4] device_release+0x54/0xf0
[c0000002879e3b10] [c000000000d64c84] kobject_cleanup+0xa4/0x240
[c0000002879e3b90] [c00000000087d358] put_device+0x28/0x40
[c0000002879e3bb0] [c0000000007a328c] dlpar_remove_slot+0x15c/0x250
[c0000002879e3c50] [c0000000007a348c] remove_slot_store+0xac/0xf0
[c0000002879e3cd0] [c000000000d64220] kobj_attr_store+0x30/0x60
[c0000002879e3cf0] [c0000000004ff13c] sysfs_kf_write+0x6c/0xa0
[c0000002879e3d10] [c0000000004fde4c] kernfs_fop_write+0x18c/0x260
[c0000002879e3d60] [c000000000410f3c] __vfs_write+0x3c/0x70
[c0000002879e3d80] [c000000000415408] vfs_write+0xc8/0x250
[c0000002879e3dd0] [c0000000004157dc] ksys_write+0x7c/0x120
[c0000002879e3e20] [c00000000000b278] system_call+0x5c/0x68

Further, since the refcount was always zero the iommu_tce_table_put()
fails to call the iommu_table release function resulting in a leak.

Fix this issue be initilizing the iommu_table kref immediately after
allocation.

Fixes: e5afdf9dd515 ("powerpc/vfio_spapr_tce: Add reference counting to iommu_table")
Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/vio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index 79e2287..f682b7b 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -1176,6 +1176,8 @@ static struct iommu_table *vio_build_iommu_table(struct vio_dev *dev)
 	if (tbl == NULL)
 		return NULL;
 
+	kref_init(&tbl->it_kref);
+
 	of_parse_dma_window(dev->dev.of_node, dma_window,
 			    &tbl->it_index, &offset, &size);
 
-- 
1.8.3.1

