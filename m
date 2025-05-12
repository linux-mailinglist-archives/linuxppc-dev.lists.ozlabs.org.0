Return-Path: <linuxppc-dev+bounces-8523-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB62EAB479B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 May 2025 00:47:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxF924NYQz2xnM;
	Tue, 13 May 2025 08:47:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747090022;
	cv=none; b=aO6jwxmu22ao2caKynxFWR2PdHZP1MexxFsf5jsQUDfAmEYP5CL9GqYG8sY7/k6dOLroo4vaLBASczdOYgjAFM+xjCH1BlfRMeumqy29h+hZVtestuOiyPhpbFAZ6dRVdqS9Yo/r+qqqpFphfdWsSfpLZlM47kDbt8XOlrVv3swm/S32LbV6CIrnNBH7QALeFSrUXVTF1zqKqziHcTjZQNZHW7TwoLcPIzkh6xBhGEMJrs8Wh6SXhO9en3JwUgTC2JIJfNN+vnWiFuil1MkXGICt0EE4m14QoZOXhh2CT3xrkSbkMhRjKiRxXIP6zBOlJiE6gf+n5FN/8JVJPgR27A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747090022; c=relaxed/relaxed;
	bh=+Pxty47wzhSe18CB3+iQWaxbdDCtth5cjzLv0DsWG+M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XWf8QEDY1VCidNYwOw6Nef1Bv+bAq3mtkOZsEVIBLG2BBF+AcrDBWVGNboBai8D7nMUQrQ2+jhEaw2GcIt718LdV6mnj64RISymyaQzi05F1+/0/VrbQ/Ye4oABfaVtGc5ZP6zbFkt9WY5DYXUhC4F86H2QGAJkHkh1fE+cye8cNe4ff0fRDHhkOt2rFQs8i+Kx7nYWyjezW3mcdkK/qQNv2uhKKwc9eLOSA5AwirwAZjeS5O6spyqjWsYcx77+n3YQ+jtmncrgHgp1KD1bjAfj2uNoZT5g5S/OVWbI9zF1FQAmu42fSoAykcYWCesudbx3ndPlgHEGLuzI0gRhjwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gW4nZDVb; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gW4nZDVb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZxF902KsYz2xjN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 08:46:59 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CLIjSu025476
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 22:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=+Pxty47wzhSe18CB3+iQWaxbdDCtth5cjzLv0DsWG
	+M=; b=gW4nZDVbqGt/wduJh2UiaJLUP8n8XR4unPQoUN/3FQh9+O3hfQqkwekER
	spy9sjMRsfzxVgG7yWC8kGZIGnLXvYmOsivTgHoUF/lGPDZW9pVyx2d2XNR0rusx
	HONLEsnllUCXqpP+GAZc+l8nYMN1iIHnyLvsAn/stxjNle+p3vQFZ+XeloP8+Z8g
	cOYJ30IadawzMkXGJ7tq4oZtJ4gPNk86R1bF2tjRImQYasRoTvsj1YeFTY/KdhvE
	2PXzkj1/b7SI3m48NMJJrDrUz/3VNbAdQv4rDbSC5COYDMO+uKoAKHTlXLlx7Hqf
	cWNLDJu74biNxU3lBeRFhsCmZww2Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46krsg8a3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 22:46:56 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54CMkuxr005924;
	Mon, 12 May 2025 22:46:56 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46krsg8a3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 22:46:56 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54CMVh36003597;
	Mon, 12 May 2025 22:46:55 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46jkbkg1bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 22:46:55 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54CMkoTu28312210
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 22:46:50 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D8C4958059;
	Mon, 12 May 2025 22:46:53 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F94C5804B;
	Mon, 12 May 2025 22:46:53 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.248.25])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 May 2025 22:46:53 +0000 (GMT)
From: Gaurav Batra <gbatra@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com
Cc: Gaurav Batra <gbatra@linux.ibm.com>, Nilay Shroff <nilay@linux.ibm.com>,
        Ritesh Harjani <ritesh.list@gmail.com>
Subject: [PATCH v3] powerpc/pseries/iommu: Fix kmemleak in TCE table userspace view
Date: Mon, 12 May 2025 17:46:53 -0500
Message-Id: <20250512224653.35697-1-gbatra@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDIzMyBTYWx0ZWRfX/ckpdosvCk3j kqZIBc8aiKPKH4i8pYV0+3cYGMRGkeNTNDm6J7f9EdVgknMwfJwotxC/ak7/SpuHgTsxqwdwgGN imJ+cVkl5GjagqDbuXgQNdy5016lfCvGmzVDhzU4WZ5FiEcR/gg4oWYjlpqX4iPmCDqaW3NhhCg
 lavhnal3MoOY9Ofidw4q6fWTdORbjSxctsHfepHJ2vU9fZojYoanhpvfJETrUvGVXHBwmBgikpX 2VHdQ1t+e7wgvuCSZ+cWKPFPMdXPZAt3Go39F39+klajhfu5t22V2i9lZ8FW5a8+x6qwf46JHbE S4sAkaZlW9xUCVMu8TWaiAIIfa3eJWf9mWkPJMvHHG/j/UQtaC1ryBcy7Wd3q0rRdHKaSqDtFpC
 UkcheZfy7Bo5So6u6M0pvFquwMBmXnc5GaVC2Gc5z3pVmd/JJzrE8vMNv25Uo5WlBzFEPtzx
X-Proofpoint-ORIG-GUID: GnjMcRZ36jo-dhN46PKXRcoPs252YSN_
X-Proofpoint-GUID: Q8WyzFAPVd5YB4aCsfs_tzm652eZTvDL
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=68227a60 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=_ic8xWZxl3AzqVNFu_8A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 mlxlogscore=825
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120233
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
Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
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


