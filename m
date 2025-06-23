Return-Path: <linuxppc-dev+bounces-9630-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC71AE38B3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jun 2025 10:42:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQhQb3T2hz2yDk;
	Mon, 23 Jun 2025 18:41:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750668119;
	cv=none; b=mnvmzZ23kJ3D7qGYOHRBwVcckuATcpkJciwxexh/Te67mTpVSrwpOI5LXS+eNsmc6jRwi4zn7n6kCqcGXn6OB/TsIuP2iJ9fOmMHV2qr7KOfRBH8kWxL9B98/WJBnKqPCXJyS48AjS39XbqUn/FJ1BpDO4PMLLFpENVM/JIFBGQYbleUK6vIarnW4g2L5FP9L4yrKGgRY72xfc71+tMpk8PXap+PczEm8vsiRv2qXZRq7NMxp1SI25Q+8B75huzFtORU+tmuyIehSGIHQJfEPcG0/0d+mhe1vZ5k044kk16zBjUKTGY25CUnSFm4QDwm6KBTw2d7oopWk3aR6GMH/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750668119; c=relaxed/relaxed;
	bh=TkKzrtwUg2fZOc/yGpYd05A47C3HgikZeiXFYnWNM1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ecH7UG1fr0r5RxuydZNeDbrzcxUcnr2cbQbS7WFKE+xCMVlxQZigiM2vfdX5P3e1demd4S+G7lLbhy0nhXXUIHIT3RsMW0s5N234nYE9HD6aXkyKW1c4RDkl0lkDeiz2GZcM2/yHfryvvKccCHh/esCU5RORq9PLEoT4ZRSlt+gq/hYyIrWLYKvluXYiQc1WPVoVt4NQo/VF6xN7OFnckffObv4KBKDdci2g0x32f7rBnHfGqpzNP3bU+d/WQsMpecTPoHLXfr0+VAzPncLwQs10Zzli+zdIea+jtpFSC2f3YzXkNxRFUsHsLgFm4lNV3jIrr2dASbXzOz3mDSbi+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rnwh6Nhh; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rnwh6Nhh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQhQZ4cTLz30Vr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jun 2025 18:41:58 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MLPxm3011313;
	Mon, 23 Jun 2025 08:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=TkKzrt
	wUg2fZOc/yGpYd05A47C3HgikZeiXFYnWNM1o=; b=Rnwh6NhhPvmg5bOH1zfKyW
	Rtn23HlEfKtmw0zApXDadM1TACElKPuLFkD/S/aZnLvfXWGy0FgCeNXsBZLj6jqD
	Z3SqIK3i4SnH8/shzFunbjSxs40UfbVUQCsNmXYECYUHS0WI0/CiR1IZfIrI7CQs
	Ko/Xa28QWFwRws6IcJ3/5xznLKHbUTPHWp8Y+9KLKjCuzuCKS1s6ajYbV2uKg23G
	D4ryj+Uha+mhJuQwniCWzXWXFbsFtzw08OLbbOyOacxy5ZZ9VpI23lJM4fZc9qWO
	4jzxoQbNEetlEb0XlZU7VXbCMp8P/pg3FRI3wRlG+4skmiAWumRB9TwFTO+DyWnQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8j0aj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 08:41:53 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55N8X9Ds017305;
	Mon, 23 Jun 2025 08:41:53 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8j0ahq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 08:41:53 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55N83Jfo030546;
	Mon, 23 Jun 2025 08:41:51 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e7eynee1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 08:41:51 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55N8fobU25952974
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 08:41:50 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 30F4658043;
	Mon, 23 Jun 2025 08:41:50 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CD5358059;
	Mon, 23 Jun 2025 08:41:47 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Jun 2025 08:41:47 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
Date: Mon, 23 Jun 2025 10:41:33 +0200
Subject: [PATCH v2 2/2] PCI/ERR: s390/pci: Use pci_uevent_ers() in PCI
 recovery
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
Message-Id: <20250623-add_err_uevents-v2-2-a3a2cf8e711d@linux.ibm.com>
References: <20250623-add_err_uevents-v2-0-a3a2cf8e711d@linux.ibm.com>
In-Reply-To: <20250623-add_err_uevents-v2-0-a3a2cf8e711d@linux.ibm.com>
To: Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        "Oliver O'Halloran" <oohall@gmail.com>, Sinan Kaya <okaya@kernel.org>,
        Keith Busch <kbusch@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Niklas Schnelle <schnelle@linux.ibm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2985;
 i=schnelle@linux.ibm.com; h=from:subject:message-id;
 bh=GjU0NEo5GVFERFWe9Jr9MTf1dpYmlEqhadodq5dMl1g=;
 b=owGbwMvMwCX2Wz534YHOJ2GMp9WSGDIihV2ats78/77k71PP2GLxxNvPGn7zKL8WvX5WqEgxu
 yFte4x2RykLgxgXg6yYIsuiLme/dQVTTPcE9XfAzGFlAhnCwMUpABPJt2P4H+HdxXA5T2+HN4No
 6Cf7+ghniY8rtcoe7Zvm56KktoY3muF/1emWhf3vuDwSlk637uiNfPd1o+5WW/f87zps+V0F364
 xAAA=
X-Developer-Key: i=schnelle@linux.ibm.com; a=openpgp;
 fpr=9DB000B2D2752030A5F72DDCAFE43F15E8C26090
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA0OCBTYWx0ZWRfX64SdLBpnT7x6 dWDHEqZNqIiduTmxjuAPi9mkd1Gp2aFk8AbH8f9D/XHMxwa0pAyc3RNGBunM94n40cX71Dl97qP n+ul/s97wGaNZBaCb20nYhaANrMTzSW8/WR0jHDyVH9QbEw/J28byCMYo4vbmmnp1FTSqT5UXmS
 5pWbGRUJTj4RTBAPU2HaCTI2RDU9os9FErcCUhFgDAUY+268kRgES1d0h+44N/u+IQr/ePo/Kul cusvVYF3GX8nWeHwwzkEYAoJLWlZhQQszWk13XpuRZYEpEAft663t5FFhxcgucx4gUy5yBfpzhn PVFQtyp6619xegiuV6q7AJ6DaFxRCm8dyz646qum38QDrZcrV9s5QbVvb2u3W5T0BKgWwE+PMxQ
 KN/UwKCncDNIp7S2Y6th3MPMRKrDYDri0VnRaBiWA1DukPVCkci2KSdQyCFeAMvoJ+HVd1lw
X-Proofpoint-GUID: q73tPqesKaxsDlZAmW-T1sTAlfLuG3yw
X-Proofpoint-ORIG-GUID: 3v3CGwqtc-lm4njBAvmcHlflsrG7XDGs
X-Authority-Analysis: v=2.4 cv=combk04i c=1 sm=1 tr=0 ts=68591351 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=EcUHtpB8bGtrbQ9pWRIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=822 clxscore=1015
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230048
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Issue uevents during PCI recovery using pci_uevent_ers() as done by EEH
and AER PCIe recovery routines.

Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
 arch/s390/pci/pci_event.c | 3 +++
 drivers/pci/pci-driver.c  | 2 +-
 include/linux/pci.h       | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/s390/pci/pci_event.c b/arch/s390/pci/pci_event.c
index 2fbee3887d13aa28e0621aa7b6d673f4517b5461..cdbe603ec2f59d95ff92210742d39d7c20f26186 100644
--- a/arch/s390/pci/pci_event.c
+++ b/arch/s390/pci/pci_event.c
@@ -91,6 +91,7 @@ static pci_ers_result_t zpci_event_notify_error_detected(struct pci_dev *pdev,
 	pci_ers_result_t ers_res = PCI_ERS_RESULT_DISCONNECT;
 
 	ers_res = driver->err_handler->error_detected(pdev,  pdev->error_state);
+	pci_uevent_ers(pdev, ers_res);
 	if (ers_result_indicates_abort(ers_res))
 		pr_info("%s: Automatic recovery failed after initial reporting\n", pci_name(pdev));
 	else if (ers_res == PCI_ERS_RESULT_NEED_RESET)
@@ -226,6 +227,7 @@ static pci_ers_result_t zpci_event_attempt_error_recovery(struct pci_dev *pdev)
 		ers_res = zpci_event_do_reset(pdev, driver);
 
 	if (ers_res != PCI_ERS_RESULT_RECOVERED) {
+		pci_uevent_ers(pdev, PCI_ERS_RESULT_DISCONNECT);
 		pr_err("%s: Automatic recovery failed; operator intervention is required\n",
 		       pci_name(pdev));
 		status_str = "failed (driver can't recover)";
@@ -235,6 +237,7 @@ static pci_ers_result_t zpci_event_attempt_error_recovery(struct pci_dev *pdev)
 	pr_info("%s: The device is ready to resume operations\n", pci_name(pdev));
 	if (driver->err_handler->resume)
 		driver->err_handler->resume(pdev);
+	pci_uevent_ers(pdev, PCI_ERS_RESULT_RECOVERED);
 out_unlock:
 	pci_dev_unlock(pdev);
 	zpci_report_status(zdev, "recovery", status_str);
diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index 94ba6938b7c6271b557cc7f17ffb89631d83827e..2f3037050fd011108ef93e39d2d78a5c7e22fd05 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -1578,7 +1578,7 @@ static int pci_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	return 0;
 }
 
-#if defined(CONFIG_PCIEAER) || defined(CONFIG_EEH)
+#if defined(CONFIG_PCIEAER) || defined(CONFIG_EEH) || defined(CONFIG_S390)
 /**
  * pci_uevent_ers - emit a uevent during recovery path of PCI device
  * @pdev: PCI device undergoing error recovery
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 05e68f35f39238f8b9ce08df97b384d1c1e89bbe..bcc412a21d93a6dcc566f011258ed39d80d896c2 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2737,7 +2737,7 @@ static inline bool pci_is_thunderbolt_attached(struct pci_dev *pdev)
 	return false;
 }
 
-#if defined(CONFIG_PCIEPORTBUS) || defined(CONFIG_EEH)
+#if defined(CONFIG_PCIEPORTBUS) || defined(CONFIG_EEH) || defined(CONFIG_S390)
 void pci_uevent_ers(struct pci_dev *pdev, enum  pci_ers_result err_type);
 #endif
 

-- 
2.48.1


