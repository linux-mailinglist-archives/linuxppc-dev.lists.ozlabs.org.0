Return-Path: <linuxppc-dev+bounces-9376-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93733AD9E0F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jun 2025 17:29:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bKKvF1YH9z2xd3;
	Sun, 15 Jun 2025 01:29:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749914985;
	cv=none; b=REYwvba3U35JGN+mexc1CcwV0vK8xNCi9/Nth7W0yjq9XNX+wFUm5+LNAwH7C1qp7j+hpoC+xAQGBJJ7dAss1sKhOxBRUDRfNP+dYE+QY4yZCoscCaWCElc/aITAF5M+Do3fQ/hbJ7evQru+cqc2Lu3DAH+x3lo4FDswuJJPq6jlzC4Tfh2x0ITgfrnmew7GV/d6vN9uiE0dmA8JOuXUYH9vklcuOefHEiV/aoUR0LXcY2ICrhcHaZrArmumq0VuEyN5M3pkNb5LImAsZ13ebGNawyWYavCd/HSqamLIRH3VV5f3pT4D5vICEcEqHfWGls0JBvh7NPvqvXjtCwAMgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749914985; c=relaxed/relaxed;
	bh=vFZDX8D7J77H7E2WhOp55VohA1juamykVyStQitETaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EQgv0m08U7SI893kRiHY1j3Fq1A8sxzwkc9HGoZ3ED8qbSh8LHSdMvu6mb86Mo39HaVB48lK9x2qdCMUAOIot2V+5x8bhmlhcgqaiylRvDhlrqcvnxMEEnmXOZS2rGW4hSY3w13hxUc1v6U+prWp1/0nyIadArQDJ1LV+WVgZuPoyxERAE5D6wDx3h87JtA11llulrkDDSa9eWGk6GAxLvMti2sk2kypFfNSF6p+rJfLwYGQQV76F3XEUudyc3cnB11ED48nhuIGCf5wvd5FZNFcIPRG8ZkXSeUfnLoE7+LYCWRtsQZe9PaLcOp1i2nGK2J2cj2xthIw9auAS0phVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SG/+hmA2; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SG/+hmA2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bKKvD0m1Fz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Jun 2025 01:29:43 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55E7Sbgw020426;
	Sat, 14 Jun 2025 15:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=vFZDX8D7J77H7E2WhOp55VohA1juamykVyStQitET
	aw=; b=SG/+hmA2aqDSaF8wqrYSl3+7V9jfGGF+u6Cl17tQ9UashiQQNMf9pXzxP
	LCkrbZ7/tEfsJF79kEA3ADPc6y28mmwaG4oEIxFK5VW2vEsoEpuVAniu4aRBks7v
	YHaTBhOGOSiOXqpw5FYOjDbk7EDfR5QTWL/iryS4ZwjrIzTPlhGs8c3uoSXEUAtg
	BV8ul6CisyPvX8hLm0vgPKpLTfAF42nsDeNbieQh+CrfWbZjXrIG1BV63f0Dc+sd
	Vzvd5gvulQdfOVZMFS424aV2ntffKimawbnlHWaQYXk/BriAzpORL9up1ir6+qVO
	WBUAEmxHIGAE43USjFw5A98fQPTEQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4794qns612-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 14 Jun 2025 15:29:35 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55ED69mM015168;
	Sat, 14 Jun 2025 15:29:34 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 474yrtybcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 14 Jun 2025 15:29:34 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55EFTWFd38535606
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 14 Jun 2025 15:29:33 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E32F02004E;
	Sat, 14 Jun 2025 15:29:32 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7BCE20040;
	Sat, 14 Jun 2025 15:29:29 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.102.158])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 14 Jun 2025 15:29:29 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH] Documentation: embargoed-hardware-issues.rst: Add myself for Power
Date: Sat, 14 Jun 2025 20:59:24 +0530
Message-ID: <20250614152925.82831-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XnskIu8cH3CMAgB_0DPHG301G1KlVu3B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDEyOSBTYWx0ZWRfX+2kx+xVqjF8T uTk2t8ys+GVqWgBtqDHabZgH2zfaGpfJe9ozSZc1ra1Q0dZWFXFqTpjUfqLc8/f8ub3YpptZbsH 5JFkn6gig0bkwAIFCxqXcurvbSx31y8V/QaGxingoAuadpmSPexHgR74l55R1z/c5r1P6rFGlI0
 GLI9xnCE1hyVvikGFbt6YDbS4OF9OxcB71E+M7mzUA/X9QHoj2o3j6t/ZIpBFRvdvfo0aEWVkSe qqwFTuGGdbf/NCYiI8Fvp1lovr1xW3yaFs6XhIcyyTvV0pEkZqfHXubCm5tJOZmbf6Eee1qQt2M dFsEmZnp6avmui+1lCG1hSuJ9eFy1cRt2rPyrBHkt+W1XU2t/McABtw+cVZBON/WA6pkxT4e/zM
 vpsnx2NITclk7S+Kyk8HlOcbnf0+l29XN9RTFcE79eHIrLtG93JJm3WwbAUfUmraXE2cIOOP
X-Authority-Analysis: v=2.4 cv=NYfm13D4 c=1 sm=1 tr=0 ts=684d955f cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=zd2uoN0lAAAA:8 a=vzhER2c_AAAA:8 a=7CQSdrXTAAAA:8 a=QyXUC8HyAAAA:8 a=COk6AnOGAAAA:8
 a=JFNNFzKWV5WJRw__lZwA:9 a=0YTRHmU2iG2pZC6F1fw2:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: XnskIu8cH3CMAgB_0DPHG301G1KlVu3B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxlogscore=703 mlxscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506140129
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Adding myself as the contact for Power

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 Documentation/process/embargoed-hardware-issues.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Documentation/process/embargoed-hardware-issues.rst
index da6bf0f6d01e..34e00848e0da 100644
--- a/Documentation/process/embargoed-hardware-issues.rst
+++ b/Documentation/process/embargoed-hardware-issues.rst
@@ -290,6 +290,7 @@ an involved disclosed party. The current ambassadors list:
   AMD		Tom Lendacky <thomas.lendacky@amd.com>
   Ampere	Darren Hart <darren@os.amperecomputing.com>
   ARM		Catalin Marinas <catalin.marinas@arm.com>
+  IBM Power	Madhavan Srinivasan <maddy@linux.ibm.com>
   IBM Z		Christian Borntraeger <borntraeger@de.ibm.com>
   Intel		Tony Luck <tony.luck@intel.com>
   Qualcomm	Trilok Soni <quic_tsoni@quicinc.com>
-- 
2.49.0


