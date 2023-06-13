Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA00F72E934
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 19:17:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ayFbTFcI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgZxb4rDFz30gp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 03:17:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ayFbTFcI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gbatra@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgZwj4Cxpz2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 03:16:53 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35DH8pmW028400;
	Tue, 13 Jun 2023 17:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=t0OkUOaZzv803siDhVjvJRNLhxV1+7O3iVNBtawpCUc=;
 b=ayFbTFcIwhXUjNMf5nju7lupFyltl3kr1c7OFgYO1cshPVtqFtofs/jA/xx2ro+LAxu/
 DAnl+d9fSTn2npd3sN4Ft44yCRMyqCPtQnHnMauXT5Z7cXeGMy7ljyLkd14OVBOCbdNl
 HrFQ63IVU2FvJ+ybIBk858ZA6QduhnQfxu+nW15Vh544osKvzNJtbCJsqmfMYGzC0JPB
 51b3bHZttJc4UtJSVrGeHHpzjrznmZW7UD5g69b3jG52Pf0QIx7H+RY/GGDZhuNavYe5
 RviOaks2br97Y/yyj60MwN2oWSeP1DfLzJEVHYOOqLGRFc7pth85Na/Etu1iv9uBTT9S OA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6uuf12d6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:16:44 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35D98Ww6030258;
	Tue, 13 Jun 2023 17:16:43 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3r4gt4wf4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:16:43 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35DHGg1462914846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jun 2023 17:16:42 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52F9458056;
	Tue, 13 Jun 2023 17:16:42 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3365058052;
	Tue, 13 Jun 2023 17:16:42 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.24.27.252])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Jun 2023 17:16:42 +0000 (GMT)
From: Gaurav Batra <gbatra@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/iommu: TCEs are incorrectly manipulated with DLPAR add/remove of memory
Date: Tue, 13 Jun 2023 12:16:41 -0500
Message-Id: <20230613171641.15641-1-gbatra@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1L4Lly0n1PtgqAWvSeLq5RMCO3e3z51Y
X-Proofpoint-ORIG-GUID: 1L4Lly0n1PtgqAWvSeLq5RMCO3e3z51Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_19,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306130151
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
Cc: Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, Gaurav Batra <gbatra@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When memory is dynamically added/removed, iommu_mem_notifier() is invoked. This
routine traverses through all the DMA windows (DDW only, not default windows)
to add/remove "direct" TCE mappings. The routines for this purpose are
tce_clearrange_multi_pSeriesLP() and tce_clearrange_multi_pSeriesLP().

Both these routines are designed for Direct mapped DMA windows only.

The issue is that there could be some DMA windows in the list which are not
"direct" mapped. Calling these routines will either,

1) remove some dynamically mapped TCEs, Or
2) try to add TCEs which are out of bounds and HCALL returns H_PARAMETER

Here are the side affects when these routines are incorrectly invoked for
"dynamically" mapped DMA windows.

tce_setrange_multi_pSeriesLP()

This adds direct mapped TCEs. Now, this could invoke HCALL to add TCEs with
out-of-bound range. In this scenario, HCALL will return H_PARAMETER and DLAR
ADD of memory will fail.

tce_clearrange_multi_pSeriesLP()

This will remove range of TCEs. The TCE range that is calculated, depending on
the memory range being added, could infact be mapping some other memory
address (for dynamic DMA window scenario). This will wipe out those TCEs.

The solution is for iommu_mem_notifier() to only invoke these routines for
"direct" mapped DMA windows.

Signed-off-by: Gaurav Batra <gbatra@linux.vnet.ibm.com>
Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 918f511837db..24dd61636400 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -363,6 +363,7 @@ struct dynamic_dma_window_prop {
 struct dma_win {
 	struct device_node *device;
 	const struct dynamic_dma_window_prop *prop;
+	bool    direct;
 	struct list_head list;
 };
 
@@ -1409,6 +1410,8 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		goto out_del_prop;
 
 	if (direct_mapping) {
+		window->direct = true;
+
 		/* DDW maps the whole partition, so enable direct DMA mapping */
 		ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
 					    win64->value, tce_setrange_multi_pSeriesLP_walk);
@@ -1425,6 +1428,8 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		int i;
 		unsigned long start = 0, end = 0;
 
+		window->direct = false;
+
 		for (i = 0; i < ARRAY_SIZE(pci->phb->mem_resources); i++) {
 			const unsigned long mask = IORESOURCE_MEM_64 | IORESOURCE_MEM;
 
@@ -1587,8 +1592,10 @@ static int iommu_mem_notifier(struct notifier_block *nb, unsigned long action,
 	case MEM_GOING_ONLINE:
 		spin_lock(&dma_win_list_lock);
 		list_for_each_entry(window, &dma_win_list, list) {
-			ret |= tce_setrange_multi_pSeriesLP(arg->start_pfn,
-					arg->nr_pages, window->prop);
+			if (window->direct) {
+				ret |= tce_setrange_multi_pSeriesLP(arg->start_pfn,
+						arg->nr_pages, window->prop);
+			}
 			/* XXX log error */
 		}
 		spin_unlock(&dma_win_list_lock);
@@ -1597,8 +1604,10 @@ static int iommu_mem_notifier(struct notifier_block *nb, unsigned long action,
 	case MEM_OFFLINE:
 		spin_lock(&dma_win_list_lock);
 		list_for_each_entry(window, &dma_win_list, list) {
-			ret |= tce_clearrange_multi_pSeriesLP(arg->start_pfn,
-					arg->nr_pages, window->prop);
+			if (window->direct) {
+				ret |= tce_clearrange_multi_pSeriesLP(arg->start_pfn,
+						arg->nr_pages, window->prop);
+			}
 			/* XXX log error */
 		}
 		spin_unlock(&dma_win_list_lock);
-- 
2.39.2 (Apple Git-143)

