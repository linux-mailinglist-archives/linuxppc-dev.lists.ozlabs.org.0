Return-Path: <linuxppc-dev+bounces-10731-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 483C2B1D977
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 15:56:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byTG72c8Cz3cSJ;
	Thu,  7 Aug 2025 23:55:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754574959;
	cv=none; b=SEwcMifcJETz19Ccs32fQF/766M4M2KweL/pE7ulk9rQpP5sxwWpKIsCL/iUJllNI24bVydxSekIZSCVfSbj0wiGyt9ItbMyB6S38PpjGbnoMm2t+NRhzZ49U+JDh6QiL3Et6Y0cc2Ve01oPLie802Il2vzfQmMyMXviSQcpksi/XTljXya4V8fb6YydYPdIkGvAp/3tl+yiu68EmsOZDZql4pLorL5i8bv25e81JAmNLefqYL/TYQqMbDwRutmSQFBif7fCsFUVVahsfwet9pJVD/Z1EEoYGlEDr9tr+HvkweuqvyKYvaA0cYmjps7qLW0Upb8eXbOKUDeIlvRl/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754574959; c=relaxed/relaxed;
	bh=jkQ7QH69gsRvGYUyPEqL7QOSe+6tJjj6DmYw3MwPqNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IHNiDDaS9NrKBTcIDMiNVgsAZtTyuVZ0OGXiPy5jKdmGL6zlCzKE5kckxDXt4IvVtUR1XdqQx/Ghmc1NzaLI5PykdApz5wOTdWVwNbLVXkFgPQ8PmyNmXmos0Bcf56dcCpORI9yqnJMhmBo44AihiVxUFCzibj1dLy3BTjupyjw7AyuTq//DpRZkxtdQ/i0/FHBZX5QP6sRCSIxxv/TRxj+87BNL97NyZqsr/wGdjs/hZRVLcsvwpXsLWVlPW90I/ZPmghoMpJOQvQt60Engw4/gjfSzmsw2D9iLCfemXqxaywZrUCEkOOzpRL7Y90++zaQwW12KWUJ/xnsH5fcKhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nbNf+TEC; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nbNf+TEC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byTG63gFsz3cRh
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 23:55:58 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 577DJQH2012314;
	Thu, 7 Aug 2025 13:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=jkQ7QH
	69gsRvGYUyPEqL7QOSe+6tJjj6DmYw3MwPqNE=; b=nbNf+TECkoaIlHlgRVQpnk
	1tTYH9Iy1H1LZhJAzI9cTBKbX3B5czYxrQGpGW3Lqg05bBDzjbO4J/q6kglOcbQE
	NZr2BvIykfhxz8Lo9mLNIX5VsUgc2+6ABYrjLgFMjC139Gcxkk039bx3BuOlUf49
	uBsmqoQkAob8Epxw7Y/EKSkBX+t9gz7CanR4kung07qFo9vH595aeQ6GJXGvvv+l
	zCeKzFD195SSsqH7xRu4vIqUlqJgRCKQiJJVxn531KruuGm8kTZZk7hWR2wIT2Ml
	hO2AahF6BZo631MtaSpL6OvvtOCSu6gUzzMs64S8QZ9FayGBsaVu4oFCJPtWQKAg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48bq63tcwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 13:55:51 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 577DtpJo011134;
	Thu, 7 Aug 2025 13:55:51 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48bq63tcw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 13:55:51 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 577Ds8xT025959;
	Thu, 7 Aug 2025 13:55:50 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 48bpwn8vx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 13:55:50 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 577DtmHv29491774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Aug 2025 13:55:48 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4AA6558052;
	Thu,  7 Aug 2025 13:55:48 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7FA9D58064;
	Thu,  7 Aug 2025 13:55:45 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 Aug 2025 13:55:45 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
Date: Thu, 07 Aug 2025 15:55:38 +0200
Subject: [PATCH v5 1/3] PCI/AER: Fix missing uevent on recovery when a
 reset is requested
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250807-add_err_uevents-v5-1-adf85b0620b0@linux.ibm.com>
References: <20250807-add_err_uevents-v5-0-adf85b0620b0@linux.ibm.com>
In-Reply-To: <20250807-add_err_uevents-v5-0-adf85b0620b0@linux.ibm.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Lukas Wunner <lukas@wunner.de>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Cc: Linas Vepstas <linasvepstas@gmail.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        "Oliver O'Halloran" <oohall@gmail.com>, Sinan Kaya <okaya@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Keith Busch <kbusch@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239;
 i=schnelle@linux.ibm.com; h=from:subject:message-id;
 bh=/TDoLoAhctmjAWMVE7SheYXDr42tTImW0wlVGjr8Rgc=;
 b=owGbwMvMwCX2Wz534YHOJ2GMp9WSGDKmbIh9uu69I+fbv+90D8ncCH1wq+ZDhdjuc6uaPUSkz
 wv4SFU/7yhlYRDjYpAVU2RZ1OXst65giumeoP4OmDmsTCBDGLg4BWAiHlMZ/vB4BKxUfi4Rf2lx
 pNmZ/Cqh+N1ZkcrMX1hYTn56cnBBKAfDf2+mFvP5LN37BUwfSa3M36ltVpMzvTwhLH7ZA6bH6Vb
 ZjAA=
X-Developer-Key: i=schnelle@linux.ibm.com; a=openpgp;
 fpr=9DB000B2D2752030A5F72DDCAFE43F15E8C26090
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDExMiBTYWx0ZWRfX/Wsfsd3duAV+
 gB09k35NtU7zgEf2kV5bD4kA4j7MLNVQ4Cvx+eQjKcBFrttwnKzid+2nhYDi+kzG7cixdcaQMbX
 7JOINajx/vXuiHAuo/i7abgGHMPwIjdkCQsVsxSDPexakVgzg30KH/CFpJgcj/1yxqvAepH+D1Z
 SZ3AfwYFuaozlmgC5TJsDhyUgWFV9XfLGnpOekvztxpHwKlDP9kbHnY6Wa7/0dUob+0i+opbNB6
 M3VTs24EAxK6OzPFoHDA29Z1oqdB5xTrwSzEZg3jL+0UMtP+Edo0EIIbd3Z47oPiiPw4KlGLhMD
 J8xtxFWVL1sidUXR1CbyHEA8NbchXUPHjMrbH5ZWCaCNf6tAKY/kEQX5MJGo6z9mSNrjLqzFYzC
 5x2Fzr/yZ4PB3/BPBKmTX4IowPHS2QsuHkj3c4V4WWF5dU0uPLzZpTtX4N8mCEM9r1sMpJZe
X-Proofpoint-ORIG-GUID: 2dtXW_pF9OBePDYon2CoX1t3L3veg34U
X-Authority-Analysis: v=2.4 cv=LreSymdc c=1 sm=1 tr=0 ts=6894b067 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=Tbr2KL6GNvhcKcAIiBYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: BcmCkv8-ZkfKRRNsvXXt4tPM_dDmpQdI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508070112
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Since commit 7b42d97e99d3 ("PCI/ERR: Always report current recovery
status for udev") AER uses the result of error_detected() as parameter
to pci_uevent_ers(). As pci_uevent_ers() however does not handle
PCI_ERS_RESULT_NEED_RESET this results in a missing uevent for the
beginning of recovery if drivers request a reset. Fix this by treating
PCI_ERS_RESULT_NEED_RESET as beginning recovery.

Cc: stable@vger.kernel.org
Fixes: 7b42d97e99d3 ("PCI/ERR: Always report current recovery status for udev")
Reviewed-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
 drivers/pci/pci-driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index 67db34fd10ee7101baeeaae1bb9bec3b13e2fdeb..94ba6938b7c6271b557cc7f17ffb89631d83827e 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -1592,6 +1592,7 @@ void pci_uevent_ers(struct pci_dev *pdev, enum pci_ers_result err_type)
 	switch (err_type) {
 	case PCI_ERS_RESULT_NONE:
 	case PCI_ERS_RESULT_CAN_RECOVER:
+	case PCI_ERS_RESULT_NEED_RESET:
 		envp[idx++] = "ERROR_EVENT=BEGIN_RECOVERY";
 		envp[idx++] = "DEVICE_ONLINE=0";
 		break;

-- 
2.48.1


