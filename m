Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1AE830ED6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jan 2024 22:56:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rprYQAvZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TFfpJ3QWqz3cFf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jan 2024 08:56:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rprYQAvZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TFfnQ3kkPz2yhZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jan 2024 08:55:21 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40HLRqaP030271
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jan 2024 21:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=mP+jN+D1eTH3FnVh4GiMGj65Pu8fRDLq/3aO5JFPEas=;
 b=rprYQAvZVjIVCuPK3iJmoyje2zqJcQw8+ejfhVeKgDE5dIFruQrdkv8rOriSkxuPO2M0
 SNnKNxQYcnB60h/SIIuW4C24OwvY8pvJdeG9GbJsN3y5Fgavf2VWITwZeLncHDrJA+Cl
 xr4aIzvbe3Z5lgmhI/kOGAXcd2WZYSRzy7pTGOP91seNrQxjR9CzMYNxKH8DS99s7SlQ
 77eA/Yc2pM3uZUINYJs/qKY1nuwlPpzOYrgBNb+955a+2o5YrFe7EXFIiWxOf5pKUAqQ
 N87G6q4mJYcf7HpjLokCNe5IRjnuGuGXBZsZ/BHRJQr9vW17yma5lKxg7IYwq7pbhYb5 1w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vppu18kcr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jan 2024 21:55:18 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40HLpYHG031719
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jan 2024 21:55:18 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vppu18kc0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 21:55:18 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40HJiMVR030441;
	Wed, 17 Jan 2024 21:46:40 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vm72k7fmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 21:46:40 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40HLkdjN30409246
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Jan 2024 21:46:40 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B373D58058;
	Wed, 17 Jan 2024 21:46:39 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 609BF58057;
	Wed, 17 Jan 2024 21:46:39 +0000 (GMT)
Received: from li-6bf4d4cc-31f5-11b2-a85c-838e9310af65.ibm.com.com (unknown [9.61.108.244])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Jan 2024 21:46:39 +0000 (GMT)
From: Brian King <brking@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Enable support for 32 bit MSI-X vectors
Date: Wed, 17 Jan 2024 15:46:32 -0600
Message-Id: <20240117214632.134539-1-brking@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bj3L6-XLMPuyB7X7ft9VSdkjJjB4L0eM
X-Proofpoint-ORIG-GUID: Qhuo41JkXdtvE0tB9UA9qny6A0fu0gvc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-17_12,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=922 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1011 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401170156
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
Cc: Brian King <brking@linux.vnet.ibm.com>, brking@pobox.com, drc@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some devices are not capable of addressing 64 bits
via DMA, which includes MSI-X vectors. This allows
us to ensure these devices use MSI-X vectors in
32 bit space.

Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/pseries/msi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
index 423ee1d5bd94..6dfb55b52d36 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -26,6 +26,7 @@ static int query_token, change_token;
 #define RTAS_CHANGE_MSI_FN	3
 #define RTAS_CHANGE_MSIX_FN	4
 #define RTAS_CHANGE_32MSI_FN	5
+#define RTAS_CHANGE_32MSIX_FN	6
 
 /* RTAS Helpers */
 
@@ -41,7 +42,7 @@ static int rtas_change_msi(struct pci_dn *pdn, u32 func, u32 num_irqs)
 	seq_num = 1;
 	do {
 		if (func == RTAS_CHANGE_MSI_FN || func == RTAS_CHANGE_MSIX_FN ||
-		    func == RTAS_CHANGE_32MSI_FN)
+		    func == RTAS_CHANGE_32MSI_FN || func == RTAS_CHANGE_32MSIX_FN)
 			rc = rtas_call(change_token, 6, 4, rtas_ret, addr,
 					BUID_HI(buid), BUID_LO(buid),
 					func, num_irqs, seq_num);
@@ -406,8 +407,12 @@ static int rtas_prepare_msi_irqs(struct pci_dev *pdev, int nvec_in, int type,
 
 		if (use_32bit_msi_hack && rc > 0)
 			rtas_hack_32bit_msi_gen2(pdev);
-	} else
-		rc = rtas_change_msi(pdn, RTAS_CHANGE_MSIX_FN, nvec);
+	} else {
+		if (pdev->no_64bit_msi)
+			rc = rtas_change_msi(pdn, RTAS_CHANGE_32MSIX_FN, nvec);
+		else
+			rc = rtas_change_msi(pdn, RTAS_CHANGE_MSIX_FN, nvec);
+	}
 
 	if (rc != nvec) {
 		if (nvec != nvec_in) {
-- 
2.39.3

