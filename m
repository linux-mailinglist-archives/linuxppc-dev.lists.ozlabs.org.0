Return-Path: <linuxppc-dev+bounces-10733-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A582B1D97D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 15:56:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byTGC15Y2z3cRh;
	Thu,  7 Aug 2025 23:56:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754574963;
	cv=none; b=AR6XANagjNW2eS9mQo2FJBVSsuGDb4rqri5OD85w+AN69IpCW7aPm61EDfNhcE7BfUE/0XkTkaSjEu/GLaRtz9EyhFuZTQddwsslHo5Ghn91C9in4385BYKbzegsHyv4jP0t1akX/YL2r8WBPbiSw84JBm1XDYCg9nlyV4OdLbR9iICcZL95zHz2Dfh+rIPYyfV/UlY3O7o+qKs18liZtjFQusAXCILj7JkOeMralnmx6Jn/YLYTyX+b72FN1OdaIKyK5y4lWETFHPF8SYFpn3edVq2G+ivGvDCZ9EEjmbjrVarAHNIC/y4vZlOMnc+DVGuz1S+KF5hl5w2cEclJsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754574963; c=relaxed/relaxed;
	bh=P6h6pEygabob+MKMluPz2iaWqjq/rfYE+mrRUjaz2zM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TfsJ8lepOviOnxCtYj4befwsepSnNuTuQqmpB6mfa3sKqL/EL3T9i8omBPlmfPCxZ3onH3rHZM4qNrbS9xsMgQ1nPCt7e97tImac8QVaoQiHRw1zuiOMeQPHEEvTMO35nePZ7QA81Qab/XuRE0vq2/J2EF55e4XqJGHbg0ynL70n+9KeGh/EpUEQAjiQeyVyr7OKaQsSKbckt8lsCapjmMCpe4PBGVpn1tuDu8EmrMuKlgMKQQPAJm7RIGQT9ozx3gfSuz0zf/M8T4c+Hyr0rbzx/5dmyj8SZHeT7TaHI/Jxs4CTJteAyigNi8Gpor0++aPnCrWHcrH2/MCj0U0l2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CyXgfXXv; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CyXgfXXv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byTGB29pmz3cSP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 23:56:01 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5773uSAH019831;
	Thu, 7 Aug 2025 13:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=P6h6pE
	ygabob+MKMluPz2iaWqjq/rfYE+mrRUjaz2zM=; b=CyXgfXXvrSI39MIxCFgnqr
	vh4FTQ+YxOF5MUP1J+j/xiEAyN+3/7Pr2jXYx/qn5q36gi+DHr1Q6ONcIM0f/PDd
	D1SZYwNW6fJsEcaBZcXXLKH4P3f+nR+fjbchS8QlH9jbXWcgSjzaLJYFB+RK+rTj
	WOwXZsOLRSkHXnzOR4GxvdcMcw8bbAUITKeARKj2c7aprDnFbompLyiS/koy8Ppk
	nj9UqVirTMswX16qblRxiLxmSf4qM5GgGPoWSdPzKEJp3sGOOMVdAynXAVX8rlS2
	bUbF5zYj9tPnm2qMFjIm6JUHkB+r8PG8FMWYdESbhkkoQ11Cc7O6Es+fE8BsNQow
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48c26tyv47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 13:55:57 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 577DZujP010443;
	Thu, 7 Aug 2025 13:55:57 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48c26tyv43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 13:55:57 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 577DRW5u022640;
	Thu, 7 Aug 2025 13:55:55 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48bpwqgw40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 13:55:55 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 577Dts6B11666480
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Aug 2025 13:55:54 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54D7D5805A;
	Thu,  7 Aug 2025 13:55:54 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8993D58052;
	Thu,  7 Aug 2025 13:55:51 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 Aug 2025 13:55:51 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
Date: Thu, 07 Aug 2025 15:55:40 +0200
Subject: [PATCH v5 3/3] powerpc/eeh: Use result of error_detected() in
 uevent
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
Message-Id: <20250807-add_err_uevents-v5-3-adf85b0620b0@linux.ibm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1301;
 i=schnelle@linux.ibm.com; h=from:subject:message-id;
 bh=mOG87tayZw5x3IBqjx1AAyFnN9RUxt9soJwUnbs0X6I=;
 b=owGbwMvMwCX2Wz534YHOJ2GMp9WSGDKmbIh1Xf15eSUry3F3oxLJStUlDkL2l8OCwo2dwqT5j
 vJquLN2lLIwiHExyIopsizqcvZbVzDFdE9QfwfMHFYmkCEMXJwCMJEbgQz/6182btbxe8CgHMrm
 svNxf9hE1RIp7ezuFTkGn5kLNi7PZGS41y4REPRnm/urK8UFQXaf72ye+/rza99An+6v4Y95Wxw
 ZAA==
X-Developer-Key: i=schnelle@linux.ibm.com; a=openpgp;
 fpr=9DB000B2D2752030A5F72DDCAFE43F15E8C26090
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YH0b8-6YXjdsqzw7jV_FMU1BENykmw9c
X-Authority-Analysis: v=2.4 cv=F/xXdrhN c=1 sm=1 tr=0 ts=6894b06d cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=USTt9hxsF4_VS_TezIQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: fQbQG1xr9EhhieZp8D-XY0qjJ3wzijgZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDExMiBTYWx0ZWRfX/XXI7Fr1FvJY
 FOXThBrUUHzXjsk98nkr2a80J2h7wW/6Z7XWUTlp0cEOL4j+Zy49UU65Jrb+mXZoIo4m5p/8xxO
 Nrm7OlcUW3ahqemn/ryOEdRhyUV+1VxGMB2WWOzaba4A/V/UBtDzBVzijlu8Vi8IcWJcHUYfExE
 an9a156D2a+5kusq+clnieK9jxfWZD9Npe0SFNhvyEU/kS0++D4T1o4Od95b+b9sJPflrzd9Kkr
 vA9XYjtzjiTF+aeKxWHw6Lxc7Ntl+UUmCGdCZK6vFzd2FOWT3TEBmHUm8nuai3JAxa4K4PrEdzP
 6GvPnjYFnA/4tJ2G0SN505iiY58F3y5QFBHEQ9DI+QRn6JHjpNKmbzLPIZUuNwl0I260Gy7QwLd
 k5FhPacQt+sqjS1y3GoGU6e1mkF2q7jx33J+4XZ+/o+0N9uHDBxfR1zfPSv+/EMui4d7kW2k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508070112
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Ever since uevent support was added for AER and EEH with commit
856e1eb9bdd4 ("PCI/AER: Add uevents in AER and EEH error/resume"), it
reported PCI_ERS_RESULT_NONE as uevent when recovery begins.

Commit 7b42d97e99d3 ("PCI/ERR: Always report current recovery status for
udev") subsequently amended AER to report the actual return value of
error_detected().

Make the same change to EEH to align it with AER and s390.

Suggested-by: Lukas Wunner <lukas@wunner.de>
Link: https://lore.kernel.org/linux-pci/aIp6LiKJor9KLVpv@wunner.de/
Reviewed-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
 arch/powerpc/kernel/eeh_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 7efe04c68f0fe3fb1c3c13d97d58e79e47cf103b..20ed9685da8b7e6d419a4b02f715b52acfe715d3 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -334,7 +334,7 @@ static enum pci_ers_result eeh_report_error(struct eeh_dev *edev,
 	rc = driver->err_handler->error_detected(pdev, pci_channel_io_frozen);
 
 	edev->in_error = true;
-	pci_uevent_ers(pdev, PCI_ERS_RESULT_NONE);
+	pci_uevent_ers(pdev, rc);
 	return rc;
 }
 

-- 
2.48.1


