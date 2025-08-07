Return-Path: <linuxppc-dev+bounces-10709-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD893B1D595
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 12:15:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byNN72267z2yCM;
	Thu,  7 Aug 2025 20:15:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754561751;
	cv=none; b=ONP9aZqVYNur05rg48jQC9Q5PdjVfTUhfaxsVGusFBRv++PIHToXw5iJ1S2duXxIfBWTSvQs9HUJFcGyq+glWTr8ldUZsDZvNbpATCY402cpfhpwPCR0DGZ1TQaPGDMkqrbZBqsAVijS1oSMr+K+vn++U7Pe/zx0rYJ9EeQSiozUSLfYsPBuRNelr3Z8kT/bLL0xiPza99Z1YILxtjfgxwq6DBMpdMjJmTWRCT1bSkxWLnsCii9CF29vo+5HHa445c8nk15ji6+DFoak6xB/jpBY9ukR0ZhbUhOw9InZsg298Zd1IbV2ghex3b7Y3sZApR/A01NYZGEFv31ao+Zn0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754561751; c=relaxed/relaxed;
	bh=jkQ7QH69gsRvGYUyPEqL7QOSe+6tJjj6DmYw3MwPqNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GxwJopRjBAfJksTvrYwXw7OPUj+rw+6jvCLewzvXZAAxCuFLF2Dh5lyApHV9Mz0ntIlOiINv8Bwj2oUwaOApPzBSFsFIVUb60E0+eEXgY/YvzyilVrfwGCqKx3qbgrZJjwDoobCsVwpHyuMeLgS7NTbRzh3PgWFnXF5XOYGIE+qFX5aA3I16EtFBinos7cNFfAgvSFKK7uKz36hHsZfrJwoM5U+oaI9ROPoxxDuRERbB3XURJ0qmgMQaot2XKqMdkFoS2ZEq2HtySvk0Azfuk2jnppuq/nBKmMinCOIOw+PGne+pu/ciFeNe7pSGG90BUjscJdOXEO5N84pS1ull8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bgCJ1Hjo; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bgCJ1Hjo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byNN63JvXz2xcD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 20:15:50 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5772qNPC029069;
	Thu, 7 Aug 2025 10:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=jkQ7QH
	69gsRvGYUyPEqL7QOSe+6tJjj6DmYw3MwPqNE=; b=bgCJ1HjoIa2zta5pOUGj5q
	DLY7C/pk3g/gjgS98LddFu3iMWy2Yy5vih9vI1NmFa51aOae52nbLkjTidu792D4
	+vpXTszBkqCj04D0KFiGmuLcIFnmDE1CU8b9g+bys7qUegTxtil8EjVjb9ts62Pg
	WaNdn9hq4ZzRxPqypnLClI/t0ZqhEhl95r44GlbnAze5pJn/sruQneSLxYUW6Ozu
	47wH52VfshBeWD27ARb26lhatcEoJZaqL+1yovppxAxlFe8z4lxIMHfAlo2QHSHj
	VCm1DJMP4lQjJgvOGx87E1OY/5BkZaTePPG/RnhcUOiOCY7nu9uKhqZBGveSwwAQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48bq611jx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 10:15:45 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 577ABARI017258;
	Thu, 7 Aug 2025 10:15:45 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48bq611jx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 10:15:45 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5779PSu7001558;
	Thu, 7 Aug 2025 10:15:44 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 48bpwr030x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 10:15:44 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 577AFgV425494032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Aug 2025 10:15:42 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 42F5E58059;
	Thu,  7 Aug 2025 10:15:42 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7108658043;
	Thu,  7 Aug 2025 10:15:39 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 Aug 2025 10:15:39 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
Date: Thu, 07 Aug 2025 12:15:31 +0200
Subject: [PATCH v4 1/3] PCI/AER: Fix missing uevent on recovery when a
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
Message-Id: <20250807-add_err_uevents-v4-1-c624bfd8638d@linux.ibm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239;
 i=schnelle@linux.ibm.com; h=from:subject:message-id;
 bh=/TDoLoAhctmjAWMVE7SheYXDr42tTImW0wlVGjr8Rgc=;
 b=owGbwMvMwCX2Wz534YHOJ2GMp9WSGDKm1BwTXHKN8ecilk1Ljgh0r9oj/C9OTKL9Vs2PgJ+qf
 Cs6pnXKd5SyMIhxMciKKbIs6nL2W1cwxXRPUH8HzBxWJpAhDFycAjCRnHMM/4N45e/UaS1N27uu
 RuXUfTtpg1n96ibm5xWU7M0r6xT47jEybNq79EhDkn39v/WdP59E3fHn11j7aUPS1sOf+C5eati
 1iwkA
X-Developer-Key: i=schnelle@linux.ibm.com; a=openpgp;
 fpr=9DB000B2D2752030A5F72DDCAFE43F15E8C26090
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ScFbWCvdM5rrP4JAOcis4XB4nj0jFN9u
X-Proofpoint-ORIG-GUID: WdfDEOVBYRCHPH1U3f1hOPZDJuD8MBE_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA3OCBTYWx0ZWRfX+HqjXSvEImnK
 Mi9YLhzkvf7N/95t36d5h42mhINOBYe6WjF4ygafF4pY1IbKLkqb+IRe4b+CnJbn6fJ+4+jYgQe
 voJAdpTdOmkGpTCWhWkNoKKs5BAy/VAsOnZP+0uO3EhhjoBvF2b2STNZMHL0TT5QhwmtKahVmGX
 E1+WzE72ErEYQoo9y9GfRv4oPbGgClPJU7WB9xYYj+XEyqOV8bhl/8Cuzk/9u8jIAN87EPK4+g6
 972MnGOULJDzXeb+Wq1MRlHHqcMxv0V62Ow84no3ZpHBJ8VLcISkCzvHA5us87ebxwnjbYqB+fG
 5yGcIWPix82QoQFAVSlnWBO8JOToGH+Hv8yKBDAFPcynkWj7N/PBncN0scqAkOsPr3gOV9XhT6K
 yxO60xFzPvhPZkJ2BSER0gqUleAOmVgucvu6HPatWXXqW6Crk37HAOoGThQtUjV+sxADrPwP
X-Authority-Analysis: v=2.4 cv=TayWtQQh c=1 sm=1 tr=0 ts=68947cd1 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=Tbr2KL6GNvhcKcAIiBYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508070078
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


