Return-Path: <linuxppc-dev+bounces-10454-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A79B15F34
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 13:21:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsVCT05znz3bkg;
	Wed, 30 Jul 2025 21:21:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753874484;
	cv=none; b=jhmwGO4w3pvP0QXsdmq7QaGjNclE8egx49JUvlpzDIRUCspj6sKHcH5Y+tmxKuW15U8VEZPl7tNWIdN+Wb1K/sreehdZNCzexhXjViRPoDex6piXkvWBqqjuraId5RnU5J+LevuyitBLeRR06k3TOL//0ieKAQ+aWgyobujlK2JKG15g6a3PoxkbFCQuuNaYCeQklnllCna/6wvXSTcA77SLfpfCajQtS5nuJfb8drDmbYLZ9Zr8ahQN+xYhGdo5REGb14e1cASShse4bOyTXSTNt7oEP+jX9tRJqGTJA6ZNiXqsMuNpxZh/PGGU+GfOjwefLdrJ1f1QUKGP7xB2NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753874484; c=relaxed/relaxed;
	bh=5obXghoBDb03rk0VDSAZ7lFDc9v2p/DdlGM67CP3lvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZGJGQ8fLPV8fgFI1PpdkO7lE4Biq0jQc/0WoEhG2IG3KJIjkxqG6Vc+e+hEp0eapWT0eCq9Y2gD8X5RzQXnZa8YT4lSulsHrLwNJ6bt1THfax+MYk5FUYeEZ/n5uEjonZ7dAyd2lMK9EH4Chu4QIP5csoqGNMzCUToGKhAxnGYgHM9qlym1IzBVWmND3Eflw90wccQusHmVnHkb3jHqpJTxnr5wbPxMuai6I41Se6bA6N8w4G4S+0Wfu1H21Rfg8T30o9yfgjEuoumj91WVZaLNVMLye0SUl66PtQ9N9BFO3vZzLM/xpLzOqmp7TIwSnEs6vzEupYaZmg6KKvfz+CQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YeINPCD5; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YeINPCD5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bsVCS0tpJz30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 21:21:23 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U1vf7v017098;
	Wed, 30 Jul 2025 11:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=5obXgh
	oBDb03rk0VDSAZ7lFDc9v2p/DdlGM67CP3lvw=; b=YeINPCD5Zn7mxdOAOZz4X3
	sOWifwBVDfptouS6zG/lGjDm5xLelNZqh4y9K/Tn0RWntrLpAqERT1Smu96XsXm6
	dk+aR739qUAOajVEIawcQS23fSzKxrHisVha9fMbRPjVGPIvuZYDErjMr/3jEyuJ
	bx2yTdyXPACSNryIZGQe6RtyGV8EkOXMm/g0mj3HRlY0/51sMWiPbQ/XbCQt6gzT
	qTvme6SPrPXhnx8QQKL+Rfa9Cj1eafCdToWtmI8itdU2721wP7VWtE4/TIYMLT3K
	/rnmaUwYfWQXCZTdn/w08TNUdN9tLavitHldKx10oEc4KnGgRX8uWR4FoCGc946Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4864k7vt1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 11:21:17 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56UBJHiF000365;
	Wed, 30 Jul 2025 11:21:16 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4864k7vt1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 11:21:16 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56U6tlaO006252;
	Wed, 30 Jul 2025 11:21:15 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 485bjm6xuy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 11:21:15 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56UBL6dM6357748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Jul 2025 11:21:06 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9412D58051;
	Wed, 30 Jul 2025 11:21:13 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BBA815805C;
	Wed, 30 Jul 2025 11:21:10 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Jul 2025 11:21:10 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
Date: Wed, 30 Jul 2025 13:20:57 +0200
Subject: [PATCH v3 1/2] PCI/AER: Fix missing uevent on recovery when a
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
Message-Id: <20250730-add_err_uevents-v3-1-540b158c070f@linux.ibm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1194;
 i=schnelle@linux.ibm.com; h=from:subject:message-id;
 bh=lFOsaGCqPFeMuSYl12T0qvZETcU/iSpEinVY4COc/Iw=;
 b=owGbwMvMwCX2Wz534YHOJ2GMp9WSGDK6GJSk4jaJNjX7s/FWTOpfuz64bd+0bWGFfELFOh8vr
 ty2ZsvejlIWBjEuBlkxRZZFXc5+6wqmmO4J6u+AmcPKBDKEgYtTACbitpqR4cW8zzoSlcG3t01a
 zZu9jZHx0yydLpOP1U239ddzPLeadIuRoeV8y1E/tSDDPmY1aQ+Vdd4mzCv+FofNbp/Wd/8m35G
 nnAA=
X-Developer-Key: i=schnelle@linux.ibm.com; a=openpgp;
 fpr=9DB000B2D2752030A5F72DDCAFE43F15E8C26090
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6MJwY2lVKJ9sB9BqXhPQys5sLr_GtI_0
X-Proofpoint-GUID: n-WJ77-aeipZPH3QSgiqjW3G6l4Vdl5y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA4MCBTYWx0ZWRfX6L0NDNj6R8IM
 ltSnttOoAB+UftZvh3fv7wlkUsputRSD8wGW1PUMVzPFBX7rbGs6Aj4rHSBOWzuA+SfZ0mO+S8w
 i+pQdfJLDFLKPCPidg8rnBbsfmy1rbiwlfgNZiV9x+qFzFLkKOsnluhAWbyn3UT/q37rh9YfKlW
 sfub98Zj5X9jmiQCRR9AtQItY0XzqDXR96btjFXXpmzB/utpdjT2v1YeCgpoGiyzt8LIm3Iw/jb
 5Bc7cTr9jAaWqhgUFJSqBQovftUm1pRHObCDNT/y1u3IakcXIOEFT+bFoVs6Y5eYu4wb7GnBvO3
 MhJhc+zg1GIpVSDdZPeqvXcEpcYtVAVqf+I7w882yzdbm9w2eHY6ucnQZglvZPU8YbvHFZI2TcZ
 fL6+PkPoKc0v3Okj69DdJxkV3ZPC7quQuIymcf8Hd6oPpjdykCG+K+xaNafj6XTUHFLK/O6q
X-Authority-Analysis: v=2.4 cv=ZoDtK87G c=1 sm=1 tr=0 ts=688a002d cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=Tbr2KL6GNvhcKcAIiBYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 clxscore=1011
 adultscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300080
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


