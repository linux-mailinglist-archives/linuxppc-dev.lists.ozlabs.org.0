Return-Path: <linuxppc-dev+bounces-8353-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E001DAACC66
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 19:42:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsQgr59TMz2yyT;
	Wed,  7 May 2025 03:42:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746553320;
	cv=none; b=STD5Sk4GhIpAD4+cFE4dkmgM9nI8v5ntXBqdEQtnX0RX5oYyMWpxze6HO9I3Egpk2QHETZXyFS666VhHH7vim8IM3ZZMRyPaH+ErKz+/ewf8m4wTAyy8izPf6Mtrrgh+zywFPN5g3qoCTIu5H8+S+R19I5Wj05K1Sm4cWpTGcDoRwHv3wm6TCfrAXCJXP+T5C7Qp8FELXIyA1msE3oJHtvloEK1L9yKRVHrtlvDbrJQzmI2Jt/ROGHQT+KgwUQv0lzWmQWq9nHJ0D6U2Ku1QgSUHQ3/V40qrwy/uryKG+dCN96czXmVh0YxOY8SulQFpQ+zhAJYuQ/ljy0hz7osTCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746553320; c=relaxed/relaxed;
	bh=izhSRwOWg+Y/B9dfAOtf9Vp1OYEAaks48ZJaT/XTlFQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Uo1JjHE1EBeQY8G3ZnTBi6ji7SgbRofRQXA9FiPZvtAlvZjOwkPX0DPAO+E+BslYwME71l3QPwGDeP2Jhw6E6hE0YEhRsl31sYj+0F6/TErf0X3h41lKHienwX9VsqmAamIqboxYKuTqVHeH1JLpSIOUdqnDw8dPELMSqSF2UY4y70ePkHtGqQk1cri34IxoiGY+teDZDRpEtoQb58An+Qr7u0lTTMBF61l+XBRVqy2NFBgwlwrWmrONEQTP9xLQnwR6BWygcjVuxxCcwu3tA4e6yGW+qYmupHI/kg9zhQDIxoarsQyJz7ETtVwdiWe1V33+QTeaGAaS3KacID+mlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mtWOr8V9; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mtWOr8V9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsQgq2WSbz2xfR
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 03:41:59 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546A46aF010427
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 6 May 2025 17:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=izhSRwOWg+Y/B9dfAOtf9Vp1OYEAaks48ZJaT/XTl
	FQ=; b=mtWOr8V91zM5+LeyoeKAgABPDxugIbhF6KHzLJbsU23c7MEkcLPmwDk9p
	//W0iM1pKouRWmvgdKsqtBngTp13I/VnzZUHpY3TeHBzlpUyjj1GiskYuYswVNJG
	xa6XAB/xE1tLKh5iuXLpf8G1zAIlnm/vBdz8uqF54qaqfdRz6vz7gsoX/GBdCjiD
	y5PYEGTIT/l4vQia4blauT6dLLM6jxfE9h093ZRa+JWSgARmOCYniGtnhZ+ad5Dl
	4C4HljeZN/0Bd6J7d9l33ClNVlKPLIITA3lsRmW884UFJig7p6JwjnIQPrRAOzCg
	MCI56Nzf84Z8sRYKNkI2vGfnFhk4Q==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46fgbja8wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 May 2025 17:41:56 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 546FjgYA025807
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 6 May 2025 17:41:54 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dwuyvr6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 May 2025 17:41:54 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 546Hfr8Q19530390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 17:41:53 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9356758056;
	Tue,  6 May 2025 17:41:53 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 715B25803F;
	Tue,  6 May 2025 17:41:53 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.24.22.94])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 May 2025 17:41:53 +0000 (GMT)
From: Gaurav Batra <gbatra@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com
Cc: Gaurav Batra <gbatra@linux.ibm.com>
Subject: [PATCH v2] powerpc/pseries/iommu: Fix kmemleak in TCE table userspace view
Date: Tue,  6 May 2025 12:41:53 -0500
Message-Id: <20250506174153.74986-1-gbatra@linux.ibm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mGhZe-e65zu7DGeVVGLMaxFFhMZeBy3M
X-Proofpoint-GUID: mGhZe-e65zu7DGeVVGLMaxFFhMZeBy3M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE2NiBTYWx0ZWRfX2DfbH2dp6DMU 0ijHeE/uCDMO1QFkInGoHRAGpafr1HNpPK28KshSeRlV8qlqMQ3Wvt4pH84S+8mAZSmptWltx1G hdi7riw+ru716UuPnl7QfFUtOUIao0xPgOF2qe3Bkvc0EuyeltlhPeJS+140ikeFRPHKKwT60G6
 966pEXtPezqmkyM4JCx7cHwxMhhw7mHeV6+KAgTUYyjlsIQAviVK5W6UuTQcjNGNvTn2IKq4qbY bsHiUHUPBEsqE0+mo7nIkNZoej1C/kzD6Is075X0k+2W7TKodZa/5bOaIK7N7KMawg0/1WyDRvV vWpSV4Mgn1U5iMA3vGEhO+1GriInerlg/4CV5+lrPNxhqZw84ozgrJSiOVFYABUmiLWHtKhf8nU
 qR3QQeVDHcfyqhByWhdy/uTyFokBrm/x3g1FjNESl6hzoQWVWk+PekxYkOF5Im1A76jAU75O
X-Authority-Analysis: v=2.4 cv=FJcbx/os c=1 sm=1 tr=0 ts=681a49e4 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=_ic8xWZxl3AzqVNFu_8A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_08,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=882 phishscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060166
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When a device is opened by a userspace driver, via VFIO interface, DMA
window is created. This DMA window has TCE Table and a corresponding
data for userview of TCE table.

When the userspace driver closes the device, all the above infrastructure
is free'ed and the device control given back to kernel. Both DMA window
and TCE table is getting free'ed. But due to a code bug, userview of the
TCE table is not getting free'ed. This is resulting in a memory leak.

Befow is the information from KMEMLEAK

unreferenced object 0xc008000022af0000 (size 16777216):
  comm "senlib_unit_tes", pid 9346, jiffies 4294983174
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 0):
    kmemleak_vmalloc+0xc8/0x1a0
    __vmalloc_node_range+0x284/0x340
    vzalloc+0x58/0x70
    spapr_tce_create_table+0x4b0/0x8d0
    tce_iommu_create_table+0xcc/0x170 [vfio_iommu_spapr_tce]
    tce_iommu_create_window+0x144/0x2f0 [vfio_iommu_spapr_tce]
    tce_iommu_ioctl.part.0+0x59c/0xc90 [vfio_iommu_spapr_tce]
    vfio_fops_unl_ioctl+0x88/0x280 [vfio]
    sys_ioctl+0xf4/0x160
    system_call_exception+0x164/0x310
    system_call_vectored_common+0xe8/0x278
unreferenced object 0xc008000023b00000 (size 4194304):
  comm "senlib_unit_tes", pid 9351, jiffies 4294984116
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 0):
    kmemleak_vmalloc+0xc8/0x1a0
    __vmalloc_node_range+0x284/0x340
    vzalloc+0x58/0x70
    spapr_tce_create_table+0x4b0/0x8d0
    tce_iommu_create_table+0xcc/0x170 [vfio_iommu_spapr_tce]
    tce_iommu_create_window+0x144/0x2f0 [vfio_iommu_spapr_tce]
    tce_iommu_create_default_window+0x88/0x120 [vfio_iommu_spapr_tce]
    tce_iommu_ioctl.part.0+0x57c/0xc90 [vfio_iommu_spapr_tce]
    vfio_fops_unl_ioctl+0x88/0x280 [vfio]
    sys_ioctl+0xf4/0x160
    system_call_exception+0x164/0x310
    system_call_vectored_common+0xe8/0x278

Fixes: f431a8cde7f1 ("powerpc/iommu: Reimplement the iommu_table_group_ops for pSeries")
Signed-off-by: Gaurav Batra <gbatra@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index d6ebc19fb99c..eec333dd2e59 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -197,7 +197,7 @@ static void tce_iommu_userspace_view_free(struct iommu_table *tbl)
 
 static void tce_free_pSeries(struct iommu_table *tbl)
 {
-	if (!tbl->it_userspace)
+	if (tbl->it_userspace)
 		tce_iommu_userspace_view_free(tbl);
 }
 

base-commit: 02ddfb981de88a2c15621115dd7be2431252c568
-- 
2.39.3 (Apple Git-146)


