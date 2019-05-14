Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 986A91C0C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 04:56:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4532Ph1XYfzDqK5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 12:56:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4532MQ2ScnzDq6y
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 12:54:09 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4E2kZ9V166352; Mon, 13 May 2019 22:54:01 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sfm55j3kx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 May 2019 22:54:01 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x4DKuVpX024890;
 Mon, 13 May 2019 20:58:21 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 2sdp14jxm2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 May 2019 20:58:21 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4E2rxdV33423552
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 May 2019 02:53:59 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 936F92805C;
 Tue, 14 May 2019 02:53:59 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BB6028058;
 Tue, 14 May 2019 02:53:57 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.80.221.111])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 14 May 2019 02:53:57 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: dan.j.williams@intel.com
Subject: [RFC PATCH] mm/nvdimm: Fix kernel crash on devm_mremap_pages_release
Date: Tue, 14 May 2019 08:23:54 +0530
Message-Id: <20190514025354.9108-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905140018
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When we initialize the namespace, if we support altmap, we don't initialize all the
backing struct page where as while releasing the namespace we look at some of
these uninitilized struct page. This results in a kernel crash as below.

kernel BUG at include/linux/mm.h:1034!
cpu 0x2: Vector: 700 (Program Check) at [c00000024146b870]
    pc: c0000000003788f8: devm_memremap_pages_release+0x258/0x3a0
    lr: c0000000003788f4: devm_memremap_pages_release+0x254/0x3a0
    sp: c00000024146bb00
   msr: 800000000282b033
  current = 0xc000000241382f00
  paca    = 0xc00000003fffd680   irqmask: 0x03   irq_happened: 0x01
    pid   = 4114, comm = ndctl
 c0000000009bf8c0 devm_action_release+0x30/0x50
 c0000000009c0938 release_nodes+0x268/0x2d0
 c0000000009b95b4 device_release_driver_internal+0x164/0x230
 c0000000009b638c unbind_store+0x13c/0x190
 c0000000009b4f44 drv_attr_store+0x44/0x60
 c00000000058ccc0 sysfs_kf_write+0x70/0xa0
 c00000000058b52c kernfs_fop_write+0x1ac/0x290
 c0000000004a415c __vfs_write+0x3c/0x70
 c0000000004a85ac vfs_write+0xec/0x200
 c0000000004a8920 ksys_write+0x80/0x130
 c00000000000bee4 system_call+0x5c/0x70

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/page_alloc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 59661106da16..892eabe1ec13 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5740,8 +5740,7 @@ void __meminit memmap_init_zone(unsigned long size, int nid, unsigned long zone,
 
 #ifdef CONFIG_ZONE_DEVICE
 	/*
-	 * Honor reservation requested by the driver for this ZONE_DEVICE
-	 * memory. We limit the total number of pages to initialize to just
+	 * We limit the total number of pages to initialize to just
 	 * those that might contain the memory mapping. We will defer the
 	 * ZONE_DEVICE page initialization until after we have released
 	 * the hotplug lock.
@@ -5750,8 +5749,6 @@ void __meminit memmap_init_zone(unsigned long size, int nid, unsigned long zone,
 		if (!altmap)
 			return;
 
-		if (start_pfn == altmap->base_pfn)
-			start_pfn += altmap->reserve;
 		end_pfn = altmap->base_pfn + vmem_altmap_offset(altmap);
 	}
 #endif
-- 
2.21.0

