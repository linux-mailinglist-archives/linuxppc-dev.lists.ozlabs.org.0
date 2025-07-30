Return-Path: <linuxppc-dev+bounces-10455-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 152A0B15F38
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 13:21:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsVCW0zXSz3bmc;
	Wed, 30 Jul 2025 21:21:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753874487;
	cv=none; b=bigyUYR9OY86vR2fmuCpjY9rsmtPC2mcDgwQ5HzH9DHPZ/2+LiKoVb+GcLY18DZwr0zQq3tTxu89dAs3gKY/r5JuLR3EMGMG58lyhWaEoBS3O9dBPZuFH3NiG/KIxQinSOw5Zm4+hCuWEtQVgxM2B70O0AHXdNFg10ttvs0VKcQIUNw1Vf/2p+ABGB6TfNd7dDHSrnzBnj476ISOAuYiGCmnmNgSgOcUGHycuuMbjzlUU61V5kGjJDnsdDpZPWGonBxEG8S3beqj3uUW2IdhkIlLiFvjiLj+SK6ZNsNuG5nG0s/GBjrG6A1BDrDKXhP6eByKzpvqFvfm7FvLOvxD2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753874487; c=relaxed/relaxed;
	bh=psGfoXo+1QmDlFPtm4TauJQSsDaRC5nyeHa5RRidzco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DPMMF6yg+nOh74weDZxgC8dtEnjY59JgfJUodOBsLHg1rdVyCD2V3Ja64avDpYJkXyYM35scimy09KeB5w8yPJ7qaqR3L0/SVEyHqVvHV75zdwRsyYDLDHqrpJFcI7L++O7HqmXNhFHCEpnzqp0w387IdLuKLpwu+RfVfGuFmE2ziZf9Qbcz2Tg674R8Zdx03aXGKYaTWrKmQYtfAO+npTtZwJnWsL/TVFE5fOo2SR40RBpEfgU1yeAPWIWpDY8Nw1ASiaaqIcBjOeC0/2oVbaBmH/T1X8gq9uTXv+AhdriVnQdzOfI2aKekEft+oVg0F/z69cB4zMHovC7/igNZ/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CPdp/Pko; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CPdp/Pko;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bsVCV3T6Rz30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 21:21:26 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U3o2OB026014;
	Wed, 30 Jul 2025 11:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=psGfoX
	o+1QmDlFPtm4TauJQSsDaRC5nyeHa5RRidzco=; b=CPdp/Pko7CJnV3QZiViLL2
	LDM6I0p4Uh4bm1aGv9HpHOZRGbPeFS8uiW7eGGHScd16XsLUJrKNs/qCxwkSWRYY
	z2Ae2rDF5Ud6cE3Wda/0ERU48KuNlqD8g0JSl3XVwIdauvza75LzRCbTvlpyaiCi
	FtFwt5cj908JcEawiaBJPsFgRQ2ixRCpABzXUJj/RN0ORzJLmEqB3mqdxTOm4ufF
	3UnCLk/79lfXTJJHJIkIOd20wlT/llk2M7gDKP7W3VcrZY/oQfFjfqR7E44Nms7j
	vGSZrp5vJRULmHnAK4+kFTjCMxbEcGbxjFZG+uqcroz5EZo0QVhcDQYpWGYeyobw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 487bu01thx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 11:21:20 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56UBJIk2001222;
	Wed, 30 Jul 2025 11:21:19 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 487bu01thv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 11:21:19 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56U7PuIu006231;
	Wed, 30 Jul 2025 11:21:18 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 485bjm6xv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 11:21:18 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56UBLGWa55968210
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Jul 2025 11:21:17 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A67265805E;
	Wed, 30 Jul 2025 11:21:16 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF2625805C;
	Wed, 30 Jul 2025 11:21:13 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Jul 2025 11:21:13 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
Date: Wed, 30 Jul 2025 13:20:58 +0200
Subject: [PATCH v3 2/2] PCI/ERR: s390/pci: Use pci_uevent_ers() in PCI
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
Message-Id: <20250730-add_err_uevents-v3-2-540b158c070f@linux.ibm.com>
References: <20250730-add_err_uevents-v3-0-540b158c070f@linux.ibm.com>
In-Reply-To: <20250730-add_err_uevents-v3-0-540b158c070f@linux.ibm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2976;
 i=schnelle@linux.ibm.com; h=from:subject:message-id;
 bh=ADiI/FcmaKPQpOyjwuC3hvtza4HzWKe8DIdgIOFG7zI=;
 b=owGbwMvMwCX2Wz534YHOJ2GMp9WSGDK6GJQfnYvco7Ssk8PLXERr78RoAbO/f8Tm71MoTch4F
 n8m7WddRykLgxgXg6yYIsuiLme/dQVTTPcE9XfAzGFlAhnCwMUpABO5rMbIcNzefyVPeFjanN4P
 E5+n9f36ZTLLuuJjk76WlaS60VaZnQz/K9bziEaXlTzj5DeWuxGgVbLdTSe/xWR/69/DDTefzZn
 KAAA=
X-Developer-Key: i=schnelle@linux.ibm.com; a=openpgp;
 fpr=9DB000B2D2752030A5F72DDCAFE43F15E8C26090
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=ZNPXmW7b c=1 sm=1 tr=0 ts=688a0030 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=EcUHtpB8bGtrbQ9pWRIA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: GFbTPv-KDrHn6x5C6eUTsuRxtBD8lLNU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA4MCBTYWx0ZWRfXzuE2isvjLX0E
 HE2BGy4Wi2ws4SNigGyk/vMnWF9NUlObrzwlM2rdF/gL/6D94kOD/GhRgV2uee3u3ihS+y9USHp
 5mnS4jk6HSo0IF0PvdvSpmX/Kjblbuwag3ERtV/Sx00MXWisQipoYHysks3/vLwuA8i1zgyBhHI
 nfEChklCEPpwIRisKjCBNq/y8T/at91GgYTu52rFG3Gu6NID+pUg+c27SEx9nyewyevyxnd2F5K
 h0ykibrbttUKKFOI00gv2g48py8XTQhZPF2qkQTAI9wFup2L9Oc2toeHkhcfqZB4G3P3lLqs0rd
 hcZt6UyI6zzlyqDZ9pmmhfVZ7VneW3fh5esncWXcnj6nQ9waNZBsP8qf1FgmxrrlaWA/CGSLM5j
 +li4e/9aef0gqnxB5+Q9wCTRF3RtKFtF75w9gGNPtT3iFf7pWAyXEX9X/HKm2nCOJzHjSfkh
X-Proofpoint-GUID: W4LxibM4NX-3R4h-gtKy79Ht_Ytlsfk1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=815 adultscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300080
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


