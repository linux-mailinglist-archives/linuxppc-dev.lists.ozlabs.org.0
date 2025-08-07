Return-Path: <linuxppc-dev+bounces-10711-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B63CB1D59B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 12:16:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byNND26Fhz3cPM;
	Thu,  7 Aug 2025 20:15:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754561756;
	cv=none; b=MmLBFpUiL2MNzT03jLbZ/gWbcWxFOa0kqKkf9IR3hD5KWO0/cmER/lgpb4OuDkzrzRgzswd8caLzRwceFNVN/3la6VZrN3ZvIrIiYRMcu0I9NT3hb1E/fqEBPv0QMooqxzLTz5Kc0PI9WEa92qtKbzUjAYyaqCxn8T/jXVQGyWQjOAX3YScHVGMZ6DxmWItp1HUZg8cKLLWBfeAMOme6Nz2w973GgfN/jdr+2hgfUmxz6eyVkPgqpxbLwzM9U57/p3699NuJaVmFnRYeozw9ndovmMZW5MYwh3xk7SdL6GCTbxoCNkm8gp3y4QmtXo1yd4qwsqu1IDsom93qAUenTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754561756; c=relaxed/relaxed;
	bh=dnzNl6nzTzRC5x2v/gK2+9RF29p0evKhXuLll1Ad/j8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=msGtu/U6L6jxVIoVSaSFN2aH9xMzdfgRymbayP749/zvF0AA6pJSI0/1VIy2rzSRvq4mKbMMh16R2+2610v7hvJ5ckqbxNMFb3Zs7SsREhBBMeIxKjWzZgkOtRSAYaIEtMTGbDKOgV3FrS8Kc/+LoP7TjdOJE2jWov7EbqpWgheAxfdJ93xnv/H3cq3pLtO5yjk4gJqwEqKNDD6mcnJ6+czCsadCRaEGJ6LDeAshwWvbvDYmA9q/HwdlPdrATwrrJAp86QZ2dDHK9YdKi3NgNTlkSYpCvoko5tvVN8uw+XJIJIyJLMdXRM9Gh/1bkTRDBnmfJvbqBbTM+IUEKOfagw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mtJpoJko; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mtJpoJko;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byNNC3f8Yz2xcD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 20:15:55 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5774SKaX021814;
	Thu, 7 Aug 2025 10:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=dnzNl6
	nzTzRC5x2v/gK2+9RF29p0evKhXuLll1Ad/j8=; b=mtJpoJkoz0pccBMwPLimVf
	vQrCWLoJx4eCCsW/ecKGzzdNAAMLTqILZy6/9Z2DDJL20AwFEQ8ZmuXwhMwtiLXo
	N0Ut7No8ZE9idni++zi7+aPtODvjkANx8ea7fsWLeCcG7VcvmRWHqzF7wliBW9qS
	AnKAUgxGhnzXN53tKSvki2XO0cErDfDy3Wn7sg8hHyMFSha4qG1TLQRyXeRYyXuM
	iDfjXdborSyKSXHRe8thfRoKBdhdWhkTzM2nSQ13Hw2sFZn4+XhF2eTBiTaachb7
	WQ1HKP8uWQBRYgjwlKBbBqPsiHxsmurMCivhZart+NPukZHMw9rGJyhSjVAU6dLw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48bq621f8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 10:15:51 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 577A3975007797;
	Thu, 7 Aug 2025 10:15:51 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48bq621f8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 10:15:51 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5779NGFE001574;
	Thu, 7 Aug 2025 10:15:50 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 48bpwr0313-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 10:15:50 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 577AFmAc33816898
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Aug 2025 10:15:48 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 590E25805F;
	Thu,  7 Aug 2025 10:15:48 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8953C5805D;
	Thu,  7 Aug 2025 10:15:45 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 Aug 2025 10:15:45 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
Date: Thu, 07 Aug 2025 12:15:33 +0200
Subject: [PATCH v4 3/3] PCI/ERR: s390/pci: Use pci_uevent_ers() in PCI
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
Message-Id: <20250807-add_err_uevents-v4-3-c624bfd8638d@linux.ibm.com>
References: <20250807-add_err_uevents-v4-0-c624bfd8638d@linux.ibm.com>
In-Reply-To: <20250807-add_err_uevents-v4-0-c624bfd8638d@linux.ibm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3021;
 i=schnelle@linux.ibm.com; h=from:subject:message-id;
 bh=052dvgQxomwEVj6h89TauZrrC59BaSmnJfbTE7aDz2E=;
 b=owGbwMvMwCX2Wz534YHOJ2GMp9WSGDKm1By/cFtlmbN1TUPRJlepYFY2n1cLxBJyZQ5fd1Tm8
 fx0KK+no5SFQYyLQVZMkWVRl7PfuoIppnuC+jtg5rAygQxh4OIUgIloXmNkmDbl/Z2ctoMbZ9wv
 15BuOpP6RlP99k17Z6/gpLdntprslWdk+OjbLdTeHnxw9tUpzZfbqgNuq9sqNZlNmrFwwYy4La7
 mjAA=
X-Developer-Key: i=schnelle@linux.ibm.com; a=openpgp;
 fpr=9DB000B2D2752030A5F72DDCAFE43F15E8C26090
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA3OCBTYWx0ZWRfX+27U2wADsz1W
 YquXhSiYn/oBIcQlJbNlOGBUH0vtGym0pIgi5B9A5KKOmFJv7XlV5cQ5WJrjlrCDuI1PvQMvyKn
 N3GqrS+Li0iNmzitG6pVVVoZUparEOtzKUiMB15mksGSnLRS4x/3xIUWD9dep2IOoomGn/MPbaX
 sFwKKJOZ+fRAjM/E6F07tbYnaP4XWU/4g5Z8sqWvI2RXRoaGqeeagKU3SDKSKACSuU02pyrdXw+
 6GXCPRnRxyOmeOUuEUk80wj+ONMufCD2ezq8Y6G4KUlA3yckHUL4ak8AHzRD6KR9H/jixDHrqWp
 T1f3yBEKMa2zBaQTd6WD7tmgYPCJfurudyw/qESI74CoGnoffL+P8xb9F7YdlhuI5UbBnIa8zcG
 ZQ+00cC65S6MimsyviWyWlaVPkGBK9OitUc7uHJwZpO4TYTkFH0rozJ1Rl9Sf/fzHnZzTDfd
X-Proofpoint-GUID: AMl1tp86nZ0KQEfb6P8pkRN6DWCF8U4d
X-Authority-Analysis: v=2.4 cv=BIuzrEQG c=1 sm=1 tr=0 ts=68947cd7 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=EcUHtpB8bGtrbQ9pWRIA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 3teTrK-OTX_SCh1T-b9Gyk7MeZkxbvFM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 mlxlogscore=880 adultscore=0 clxscore=1015
 malwarescore=0 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508070078
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Issue uevents during PCI recovery using pci_uevent_ers() as done by EEH
and AER PCIe recovery routines.

Reviewed-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
 arch/s390/pci/pci_event.c | 3 +++
 drivers/pci/pci-driver.c  | 2 +-
 include/linux/pci.h       | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/s390/pci/pci_event.c b/arch/s390/pci/pci_event.c
index d930416d4c903f709764b75fe45fb66e529fcc5b..b95376041501f479eee20705d45fb8c68553da71 100644
--- a/arch/s390/pci/pci_event.c
+++ b/arch/s390/pci/pci_event.c
@@ -88,6 +88,7 @@ static pci_ers_result_t zpci_event_notify_error_detected(struct pci_dev *pdev,
 	pci_ers_result_t ers_res = PCI_ERS_RESULT_DISCONNECT;
 
 	ers_res = driver->err_handler->error_detected(pdev,  pdev->error_state);
+	pci_uevent_ers(pdev, ers_res);
 	if (ers_result_indicates_abort(ers_res))
 		pr_info("%s: Automatic recovery failed after initial reporting\n", pci_name(pdev));
 	else if (ers_res == PCI_ERS_RESULT_NEED_RESET)
@@ -244,6 +245,7 @@ static pci_ers_result_t zpci_event_attempt_error_recovery(struct pci_dev *pdev)
 		ers_res = PCI_ERS_RESULT_RECOVERED;
 
 	if (ers_res != PCI_ERS_RESULT_RECOVERED) {
+		pci_uevent_ers(pdev, PCI_ERS_RESULT_DISCONNECT);
 		pr_err("%s: Automatic recovery failed; operator intervention is required\n",
 		       pci_name(pdev));
 		status_str = "failed (driver can't recover)";
@@ -253,6 +255,7 @@ static pci_ers_result_t zpci_event_attempt_error_recovery(struct pci_dev *pdev)
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


