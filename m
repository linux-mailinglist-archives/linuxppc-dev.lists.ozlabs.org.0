Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 373977B5CFE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 00:04:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jbrgSVWp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rzw2k0pyQz3cfT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 09:03:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jbrgSVWp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rzw1m2xwwz3cCl
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 09:03:08 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 392M1kYZ012913;
	Mon, 2 Oct 2023 22:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=4EcadeJIOfsidZwfBv0CSr/w1ff192w0CyNTgmgx9lU=;
 b=jbrgSVWpWdl9tenkaXdIo5xEn//KNH6WM3X2EQqqwmkAwAJtqC11IJlYK0KyxGdA2hdj
 KogTw+TQPmHfVTPc5nroetBzMs33svNGu7skacgOt6yeD89kp09ocsOmAdjmK1SpscBo
 7m5uW0yT2ErGw0BO6kOmmlhpmCatzBQjYPaQrI8825vQ4AvJBNAKFurCWgb0NktYUq1z
 D3Uat2GRzG9qpwqEL7iGB/0FBdJ4BBwo5KtesBDUZieFcM0N3jSGHoQGwVTdLgzotx7E
 ypJuZc4TipD979+HdtlY9sfqd5l7mZU0lmHHst4B+1d0tKgEvdMwgweX2ODk7gHVSskx gA== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tg69xr1kr-12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Oct 2023 22:03:02 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 392LFqk9007512;
	Mon, 2 Oct 2023 21:46:05 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3teygk4fe8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Oct 2023 21:46:05 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 392Lk5qo58654994
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Oct 2023 21:46:05 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3FA565805A;
	Mon,  2 Oct 2023 21:46:05 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6EB2F58054;
	Mon,  2 Oct 2023 21:46:04 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.67.151.197])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  2 Oct 2023 21:46:04 +0000 (GMT)
From: Gaurav Batra <gbatra@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/pseries/iommu: enable_ddw incorrectly returns direct mapping for SR-IOV device.
Date: Mon,  2 Oct 2023 16:46:03 -0500
Message-Id: <20231002214603.43881-1-gbatra@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rDyPhxMgA7SL4h5M-L8Jtyq1eY8ruy-U
X-Proofpoint-ORIG-GUID: rDyPhxMgA7SL4h5M-L8Jtyq1eY8ruy-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-02_15,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 suspectscore=0 phishscore=0 mlxlogscore=934
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1011 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310020171
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
Cc: brking@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, Gaurav Batra <gbatra@linux.vnet.ibm.com>, gjoyce@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a device is initialized, the driver invokes dma_supported() twice - first
for streaming mappings followed by coherent mappings. For an SR-IOV device,
default window is deleted and DDW created. With vPMEM enabled, TCE mappings
are dynamically created for both vPMEM and SR-IOV device. There are no direct
mappings.

First time when dma_supported() is called with 64 bit mask, DDW is created and
marked as dynamic window. The second time dma_supported() is called, enable_ddw()
finds existing window for the device and incorrectly returns it as "direct mapping".

This only happens when size of DDW is capable of mapping max LPAR memory.

This results in streaming TCEs to not get dynamically mapped, since code incorrently
assumes these are already pre-mapped. The adapter initially comes up but goes down
due to EEH.
---
 arch/powerpc/platforms/pseries/iommu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 16d93b580f61..d8b4adcef1ad 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -914,7 +914,8 @@ static int remove_ddw(struct device_node *np, bool remove_prop, const char *win_
 	return 0;
 }
 
-static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr, int *window_shift)
+static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr, int *window_shift,
+			      bool *direct_mapping)
 {
 	struct dma_win *window;
 	const struct dynamic_dma_window_prop *dma64;
@@ -927,6 +928,7 @@ static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr, int *windo
 			dma64 = window->prop;
 			*dma_addr = be64_to_cpu(dma64->dma_base);
 			*window_shift = be32_to_cpu(dma64->window_shift);
+			*direct_mapping = window->direct;
 			found = true;
 			break;
 		}
@@ -1270,8 +1272,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
 	mutex_lock(&dma_win_init_mutex);
 
-	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset, &len)) {
-		direct_mapping = (len >= max_ram_len);
+	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset, &len, &direct_mapping)) {
 		goto out_unlock;
 	}
 
-- 
2.39.2 (Apple Git-143)

