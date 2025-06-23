Return-Path: <linuxppc-dev+bounces-9629-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5E1AE38B1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jun 2025 10:42:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQhQZ2jZDz30BG;
	Mon, 23 Jun 2025 18:41:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750668118;
	cv=none; b=iaYmv8dhuj0GkMEUF9UBcNURgaomm6yWbSO8hOTy2esu1H5SLhYVAhpmmSd5Tm1ZEwMGSFcqoJBHtDyDxh6OGlVZkpHRaO+j/HIe9mbYueOfBkYHUGqMY3e9D9doVb8jEfzocYu1w7Ts/IgVtGnVKzugeDX4sshqFWdtD4DAUrdRWNVWDgU6nq5zENoZblKZNMGxXRo9SbVy2fXnkFqYEvHieKNP43jqaHbGHL6d91WsOPE9S6iWd8IGdvMymtIHc2Y6Z6PSMebwPtbDYXmpkf4QsVXQ4QyrDeOPWxlB767oD41GsQR3hsOx2Dwu7bgznhZ6vLonps3Wf7vG/4oCmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750668118; c=relaxed/relaxed;
	bh=5obXghoBDb03rk0VDSAZ7lFDc9v2p/DdlGM67CP3lvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=encMho8m8u1r1unI1oAUmP/y0DAV7QZhaJ9j2lALJ3ddSoWjRqJ9bQcUl1sd+LtVpMFCDUu52JCN3K+IUbB4JdJ1veS9CIQ3T1EjVl04O4yyIP4YMEF7FwK0cHuzW3PXyia19CZoouL0fFmyiW9vML8P43gtj1o8zf1AxbbMA0s+P3/TmOQrhXreAfS3LsUS39jR8/ujIJh7O1YoTznhZ1RZuYVBGmEnMjn/3O4fDEL7dFMNQ2XWWzDrAEl/vEIYM2aqtZzB6Czjbg/8YR7CxmGZagR0ST+Pv6Re5MXpLTNNoVtF9IsmdxLfAlF/CRUO7k1MSCKSvRi1jOZzba9KdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q1b0mnCx; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q1b0mnCx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQhQY07yZz2yDk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jun 2025 18:41:56 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N6Z6la029925;
	Mon, 23 Jun 2025 08:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=5obXgh
	oBDb03rk0VDSAZ7lFDc9v2p/DdlGM67CP3lvw=; b=q1b0mnCxxQj0pd0wOKCHgX
	u5dy9v112CHHd45qYQVb09ggsDbUbo8IoXU/oJGT4Mki0sLpJr/fNTiXpLg6rYvw
	8dKlFibz7UyycStrvOlEH5DNpSD/QFbzzxugFxUqZx2K82ZCFM2PtrCnaAnx6v2i
	Ozkk5FA5PFQQQdbMX6oy6bI6UixuxtVK93iPqpNAJraJPNX4EWRHFop+gasIEfu2
	L6//7i/pe7yWWAdjL8Sszc2DT+nPFLLvEZAmkkxM6Fad4EI90sZcQDN51Uv0C2TR
	wJNs/uCTkdHg8OWODVX6ny0aJD8E7fx9q3mkT8psqJw4ZzwfgU/+N0wYhzLLVZkQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dmf2r4ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 08:41:49 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55N8ZmV1001372;
	Mon, 23 Jun 2025 08:41:49 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dmf2r4ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 08:41:49 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8WLDN006408;
	Mon, 23 Jun 2025 08:41:48 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e82nwamv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 08:41:48 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55N8fgWF27591398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 08:41:42 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D4A258055;
	Mon, 23 Jun 2025 08:41:47 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E74E58043;
	Mon, 23 Jun 2025 08:41:44 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Jun 2025 08:41:44 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
Date: Mon, 23 Jun 2025 10:41:32 +0200
Subject: [PATCH v2 1/2] PCI/AER: Fix missing uevent on recovery when a
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
Message-Id: <20250623-add_err_uevents-v2-1-a3a2cf8e711d@linux.ibm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1194;
 i=schnelle@linux.ibm.com; h=from:subject:message-id;
 bh=lFOsaGCqPFeMuSYl12T0qvZETcU/iSpEinVY4COc/Iw=;
 b=owGbwMvMwCX2Wz534YHOJ2GMp9WSGDIihZ0L9tQHiOzWFMp9HGV9i+dA0Is/VxsPiK90rDttv
 2WRsM6BjlIWBjEuBlkxRZZFXc5+6wqmmO4J6u+AmcPKBDKEgYtTACYiuZORof9p4S6uZI9LjxQS
 jS9w6HB9dq2R/StyW40nupc5ag//CUaGCxfvpl3/43iiJ+Chu4nJ9KiOHZGmTTrv7FizL0ins05
 jAQA=
X-Developer-Key: i=schnelle@linux.ibm.com; a=openpgp;
 fpr=9DB000B2D2752030A5F72DDCAFE43F15E8C26090
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=M5FNKzws c=1 sm=1 tr=0 ts=6859134d cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=Tbr2KL6GNvhcKcAIiBYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA0OCBTYWx0ZWRfX6txSpMkyW0f/ VnS7fj5OsNE4T8/wk5ZvmPBOUl4xxbRTY1AUq/SPXa50t5/LuVqbofk1McGx6cWEYddHdBq6sxB zkzSpep8rWxE8+b2YHFRsP6qHtZIMi1qPiIhUjX09lqQ9RFJrfY5GqkqUDtr4iKY8GxhRaX2gtm
 S5tgWvJeJb4BA5vC6ZUhpcZ1rhxK6Gh8s9nNn2KHDf8pImENJXWEaDcn3d/R3pxxR3lC+WlL9YC 8qIlew6aFh4cWJ7mfKRxvZwjV7FeMkQc9+qyH2GHk4u+aNX85WiVl3MQEsK3GChAubyXUm+pHsH DtgprLLK0CogkDFg3bw1R5B1MEJd6Nsbif0r+G+BqHCNGMaacMmiNCFJtUqnCM353oc2PVHkzal
 e+bF6ogYAfLm8IYDPdtLLhfzOhH/b1C1jfHHxdjpRWYeDRMd3bOy1FpLzf9lc2uQvzyiH9Yn
X-Proofpoint-GUID: bPqn5dHKhfiQjAf65v4BgnWqDYI6NhUQ
X-Proofpoint-ORIG-GUID: Bs7pqGMJuxme9N2FCAkiGL3_FjDPUWKA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1011 adultscore=0
 mlxscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230048
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


