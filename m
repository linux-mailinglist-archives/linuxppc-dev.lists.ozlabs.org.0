Return-Path: <linuxppc-dev+bounces-9628-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D60EAE38AE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jun 2025 10:42:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQhQZ29h0z2ydj;
	Mon, 23 Jun 2025 18:41:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750668118;
	cv=none; b=P0LfSkNX0iTufy3HDDstpuWsULQ2QGnRwXySFBOU2/esFTb3nX6nbEAq0vgr6zy5QzHK4BomEmXVM+l7Uxd9MwNHejGd4D/9bp6U1bsl5NyProKsU+jmL5iZHgHAXjEJUCet1Lw6d3XxMgWiyUasFQQKxSR5fUUJjMjIG4JoSFZpWWCgKy/+NkhRWBqlsn046FnFXpUpILR6up/6hlit06YK/hR5wzkPRUachWGQkjjewve8l/B6XrDUgp/KnOtpVIkDrWJN46rnKigIPdX/9XXlRzZO2yTxyM1fop5GLYNDH/V9D/bxeGE4ic1tKU6YQYzK9rGBinNFlj83K5p3rg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750668118; c=relaxed/relaxed;
	bh=qpbUExTaXqTbf6MIcvkeC4R/iiFBpRT+gOHF099uG3M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ga22DnC8jj1f7ewzbFdiYQfIaqV7VxiGTMkgQ7rgEJ54GTNl/QAyG4U7EwmaYwgMlwPBMnPcZeZBVThXmTdcdUeKwYgBgUSJEj0n39HutIAVJtUOXzhuoZrUZVJoE4rGfKoIt53ZSCDBaQ9bKmpZWAy/YpSZrUSVkTIro2FxBleUh+jFmnjd7vyIo38xcsvmN/Qq8keFh8Xj1fhiqO0mGaTHL0JbwnnOZDtE1UhKAVykojVyHrk7x2QhB7g3F56H5qdXRIaicsbA9Vj4/1XkydBJz0vgu40H/DfspDcYLpg2ci99FXlT4Ai/wFCoC6tgq2lWSjh9e+9POo8ordBgdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cOGe51Jl; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cOGe51Jl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQhQX74ggz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jun 2025 18:41:56 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MLPWvv021390;
	Mon, 23 Jun 2025 08:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=qpbUExTaXqTbf6MIcvkeC4R/iiFB
	pRT+gOHF099uG3M=; b=cOGe51JloSg+FoN26ba340FSVcUuPI/NRjoKsdhVg/Rs
	A0d+uxsrQ/nV2arjk/0r7BFFIUTql2zgJx/g3cry7iXBBUS/nNRtmInl2pmWdCoC
	vjTWw0BmlEi6HIeHzmjjG3L8p8Ds854b5zZZiPoIbmkhLiR1mF79vQPPG9Dx2Re2
	Xk0wI2sHFvfic1FkFnyBTBAoKC7O0W/VvwrDoiU52It9djhB5uhHLnvH0io6gcyZ
	VTq3DHJIz8iDiy0ub86GCbX2zAVSTimjh8+ecv4hbr2PgMihn1U74Q3umYmyV0yX
	u/ya7DBryQX18OJZDas8fKF+xBCg6oRt3WDpbUTDdQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dj5tggt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 08:41:46 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55N8b71N005760;
	Mon, 23 Jun 2025 08:41:46 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dj5tggt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 08:41:46 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55N81YSs014988;
	Mon, 23 Jun 2025 08:41:45 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 47e72tdg6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 08:41:45 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55N8fiMZ26083946
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 08:41:44 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0ED9258043;
	Mon, 23 Jun 2025 08:41:44 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F89858055;
	Mon, 23 Jun 2025 08:41:41 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Jun 2025 08:41:41 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [PATCH v2 0/2] PCI/ERR: s390/pci: Use pci_uevent_ers() in PCI
 recovery
Date: Mon, 23 Jun 2025 10:41:31 +0200
Message-Id: <20250623-add_err_uevents-v2-0-a3a2cf8e711d@linux.ibm.com>
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
X-B4-Tracking: v=1; b=H4sIADsTWWgC/2WNwQqDMBAFf0X23IiJqVFP/Y8ioslaF2osiQaL+
 O9NpbceZ+DN28GjI/RQJzs4DORpthHEJQE9dvaBjExkEJm4ZpIr1hnTonPtigHt4lkxlEYapTG
 rNMTVy+FA21m8N5FH8svs3udB4F/7awn51wqccZbnpTRFr1Sli9uT7Lql1E+pnidojuP4AIrji
 pyyAAAA
X-Change-ID: 20250417-add_err_uevents-6f8d4d7ce09c
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1364;
 i=schnelle@linux.ibm.com; h=from:subject:message-id;
 bh=5kfo0BH1mkNWQLJKnyck8mWUaO6aelbU94wDuwLT/yM=;
 b=owGbwMvMwCX2Wz534YHOJ2GMp9WSGDIihZ3laiPOfmQOSOS0MTlSsbjyqsys761M1iGJG44b+
 fxelRnSUcrCIMbFICumyLKoy9lvXcEU0z1B/R0wc1iZQIYwcHEKwEROP2BkeHnVO+pC2yZWuQUT
 0zLuy014p1CWNuXxG5eviz4rVrvJhTP8sz/ctCBtk/tPpph1VpNiDv95ZRiy6H5F3azPJ35wveu
 5zwcA
X-Developer-Key: i=schnelle@linux.ibm.com; a=openpgp;
 fpr=9DB000B2D2752030A5F72DDCAFE43F15E8C26090
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AcD_HppZSu4nM4PO0B1jb-byJ4fHUR0C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA0OCBTYWx0ZWRfX6ks+F95pPmL/ LSGIKKs0vIGlNF5B+YrOyNhinCINv6vkcKUUMfTBm62UDhgdNFnhbTKaCTAR1LhEPKoDvISDvZM vfEOR9FFrqsvtHMNugnTqjE8JqekjFvENzD8Gr7rnKEmnXnHxlabQMy5Itg7dFEdhyMn4gs8HBP
 vyWVyBi9eaa866SojvhwFG8L/rHR/4XtNIVG1PZybpoxQfYPzfqFTnEYRRAjb5ltRQXdT74kXXn q7DgePgrF9k1SIO66hE563sxPpG6HVWR0v966cF2aG1hOqqbs/l5QAc860qAzobtcMvr93yhCNQ faWUOEnZDYBA5Z/95YZ8kimZvkhbr5tM4ErKSqT8CLS5dQRzVT50E7ZdNBwvEo67RJ1yrZZVBA2
 YRI7UdyaFab9YHxoLYQ4GmkCED/z564Sv3csVFFB3aFS3rRxoLaBGdg2KQ+AX9GK5Sqwt2pV
X-Authority-Analysis: v=2.4 cv=MshS63ae c=1 sm=1 tr=0 ts=6859134a cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=oL3LmRbi3Aco-JgH8HYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: UyU1r3XkDOk7tLSoBrszmjgcjvKHtE_n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1011 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230048
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi All,

This series adds issuing of uevents during PCI recovery on s390. In
developing this I noticed that pci_uevent_ers() ignores
PCI_ERS_RESULT_NEED_RESET which  results in
AER not generating a uevent at the beginning of recovery if drivers
request a reset as it uses the result of error_detected() as parameter
to pci_uevent_ers(). This is fixed in the first patch and relied upon by
the s390 recovery code as it also uses the result of error_detected().

Thanks,
Niklas

Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
Changes in v2:
- Add a patch fixing pci_uevent_ers() mistakenly ignoring PCI_ERS_RESULT_NEED_RESET
- Use the result of error_detected() for initial pci_uevent_ers()
- Drop fixes tag in s390 patch
- Rebase and re-test on current master
- Link to v1: https://lore.kernel.org/r/20250424-add_err_uevents-v1-1-3384d6b779c6@linux.ibm.com

---
Niklas Schnelle (2):
      PCI/AER: Fix missing uevent on recovery when a reset is requested
      PCI/ERR: s390/pci: Use pci_uevent_ers() in PCI recovery

 arch/s390/pci/pci_event.c | 3 +++
 drivers/pci/pci-driver.c  | 3 ++-
 include/linux/pci.h       | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)
---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250417-add_err_uevents-6f8d4d7ce09c

Best regards,
-- 
Niklas Schnelle


