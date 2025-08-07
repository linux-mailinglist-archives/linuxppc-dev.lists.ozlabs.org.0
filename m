Return-Path: <linuxppc-dev+bounces-10730-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2D5B1D975
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 15:55:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byTG36MZcz3cS0;
	Thu,  7 Aug 2025 23:55:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754574955;
	cv=none; b=DQxRrY6WBm+J2YNQnYpy8dnnsGFttROkES7vkyII6ZT457HQKSgVxvKGKzHZ9OZUifhBC7bjSgfEc0vC6VIRl5108A01IZKd4JsHGnzxWZ4ILU0BDy3shVbIQYkjJkha1GQG7GKNVLEgL4DHhUk4rP/yUEHUdyB2jbtsNCZeEdb75vCUutUsd0+b1vDnfCaW0ksYmgAOF7MDXlrANSAUAl3iEF9SdZnNBgmKtFAhRLdwE5LI07wje9VbAduNYCH/ClEJ05MYIV7JGBUOLnGyWd7sxcV+p4qzy2iUXjxyAwU/pqawqA3aZuylxHRjBRRNaF5onFqau29RQ53bOnckYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754574955; c=relaxed/relaxed;
	bh=y3+fywtBg7WA4g2vIVfSuzo1cv1w/rMDMqYu2v+Dabg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H0AAeTozIaJOSjdXk5KHzUrt5CRSm63OrIXa2kF1ByIyFHuRnfohI21bl6ZSe/8xD5Irxhpfsa3JsgAknDuAL/vl92mL2K5dT2TjOQuWzbivQb7rQsManbnpLR5AseE3wgDpSXh5QbZkl0uAj67hVIvI+l3+DgtYFrcDdl7UHr2paPaBV36Gns+TCnN4vTgG/kfXpQX451m8sIcOihPVJn2EVZeft0/7Ic4QFazyzrJVgf5WB2FL8GuWtqjTBi4X5874eSIQt5oTEtFnvT5nun+yvxt1a6o1E4jnZEgsHxHMckLgynQog2DzGxwa5uVYjDCSchesCRIYtRI+e40emw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c88eQYTU; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c88eQYTU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byTG25rrGz3cRh
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 23:55:54 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5778csZI021572;
	Thu, 7 Aug 2025 13:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=y3+fywtBg7WA4g2vIVfSuzo1cv1w
	/rMDMqYu2v+Dabg=; b=c88eQYTU5kYHu2kzEIaOcgGzXPUwEE6Cf1Hj31bDnbpB
	PCwXQDMFGqjHb1e2Xl8cbNDwt7UIce6pb8rqTotHV8Uuh6E199wJBO5NanSwRyzn
	q+w4xiCxGM9GkYy3KQsT+pwECZwkWapnRq9XMEaH/mWtli3V8UHvAiHQ54XZf+za
	cbEI5GA80rl0QguSMBvMpcurrkGng/8jWfTbGSUvs50RHo5GGlGkJf6DnSwGLNkx
	Yt2Es8vX17bKsyIsBleDcXaKl5SyKZoq2D9BVHrZrN56diphU94whURjxkTUslFr
	nQfuu6uh+xf1E3m2kX9s7EOsRPm+RVHYeg9pim2HUw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48bq622fym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 13:55:48 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 577DnxdR022588;
	Thu, 7 Aug 2025 13:55:48 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48bq622fyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 13:55:48 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 577DjUMV001627;
	Thu, 7 Aug 2025 13:55:47 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 48bpwr0vm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 13:55:47 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 577Dtjed24707804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Aug 2025 13:55:45 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 462B358062;
	Thu,  7 Aug 2025 13:55:45 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 712C95805A;
	Thu,  7 Aug 2025 13:55:42 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 Aug 2025 13:55:42 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [PATCH v5 0/3] PCI/ERR: s390/pci: Use pci_uevent_ers() in PCI
 recovery
Date: Thu, 07 Aug 2025 15:55:37 +0200
Message-Id: <20250807-add_err_uevents-v5-0-adf85b0620b0@linux.ibm.com>
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
X-B4-Tracking: v=1; b=H4sIAFmwlGgC/23QTQrCMBAF4KtI1kYmP02iK+8hUtpkogFtJdFQk
 d7dKEIXcfkG5nvDvEjCGDCR3epFIuaQwjiU0KxXxJ674YQ0uJIJB96AZJp2zrUYY/vAjMM9UeW
 Nk05bhK0lZesW0YfpKx6OJZ9Duo/x+S3I7DP9WVxWVmaUUSGMdKrXemvV/hKGx7QJ/XVjxyv5e
 JkvhuKiNjgF2omOW29QM+b+GWIxtIDaEMVoJPSsMRY0+H+GXAwD9V+yLIZVXPbeGSVMdcc8z2+
 4gbhAfgEAAA==
X-Change-ID: 20250417-add_err_uevents-6f8d4d7ce09c
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2241;
 i=schnelle@linux.ibm.com; h=from:subject:message-id;
 bh=genfLilDQilTlrVR+XjImpQdVjsDL45CfUIKqnfk+5E=;
 b=owGbwMvMwCX2Wz534YHOJ2GMp9WSGDKmbIg1SJr82zwgzr6o7XfzXyGLXbq7WBrPaTy69SIkJ
 J2nt0awo5SFQYyLQVZMkWVRl7PfuoIppnuC+jtg5rAygQxh4OIUgIlMb2b4H9MyX+rrE87HlfpB
 NaXt57w5p8tHNC3qv3bLePmCSbO57jEybPLROi1xRLDVT2TPW8/l/PwtC+a2Py5OWMOeeV9nQhE
 jDwA=
X-Developer-Key: i=schnelle@linux.ibm.com; a=openpgp;
 fpr=9DB000B2D2752030A5F72DDCAFE43F15E8C26090
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDEwOCBTYWx0ZWRfXypIpd6Ht8VBA
 4ArXLqP2NeA+aCDpkBLKklqTGdIxkINzfNJFQjXXXSf1ErVwcYbTBHpj9cXIWyais+yCLk9MkB3
 ckOecV26LKsFKvyfHHmgFWqGo7/iIQ7SGSNZuqMkyDbVjCpzTvd9cTb/eQeICPisBcxg8arCujq
 zSB+vJUNXsp048WZgbg8sIdsSV+uPBXI6dtalMZDb7t+SEpeTEtQWROtxzcuc5sqK8V4Q2obLxn
 UwC1g4rXhvhgfMdwsv1lLtf2bdbO56yLzNyIBxfDJ+4butBi83tPhh4+9069fRzLMpkqlB0Ppmp
 Wuxe8gxVJo2x0iC77SwJ0a85d6YIv1UaJsGJi5oX287BqiN2wPiF6+owwznm2YaneW6/ElcvhD/
 HHtg65EWEnt+RRUfj/+mart8NEX4/jpo46e14Vyum4DORBHZB93XnSKUlCDyN3XiUW8dYJLZ
X-Proofpoint-GUID: mjFpNY3XYbn_IxSgE3fyv19oNXETZZ82
X-Authority-Analysis: v=2.4 cv=BIuzrEQG c=1 sm=1 tr=0 ts=6894b064 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=Ot2KE7TKgi5QPKB6m9EA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 8dDb7rlIF5q5c9sp3xjcYHl_LrCS16l-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 malwarescore=0 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508070108
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Bjorn, Lukas, Mahesh,

This series adds issuing of uevents during PCI recovery on s390. In
developing this I noticed that pci_uevent_ers() ignores
PCI_ERS_RESULT_NEED_RESET. I think this will result in AER not generating a uevent
at the beginning of recovery if drivers request a reset via the voting
on error_detected() returns. This is fixed in the first patch and relied
upon by the s390 recovery code as it also uses the result of
error_detected() though with one device/driver at a time.

Thanks,
Niklas

Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
Changes in v5:
- Add R-b from Lukas Wunner for EEH
- Improve commit message for EEH (Lukas Wunner)
- Move the EEH patch to the end so the reference to s390 relies on the
  as is and not future state ;)
- Link to v4: https://lore.kernel.org/r/20250807-add_err_uevents-v4-0-c624bfd8638d@linux.ibm.com

Changes in v4:
- Add change in EEH to use the return of error_detected() in the uevent
  just like AER and the new s390 code
- Add R-b from Lukas
- Link to v3: https://lore.kernel.org/r/20250730-add_err_uevents-v3-0-540b158c070f@linux.ibm.com

Changes in v3:
- Reworded cover letter
- Rebase on v6.16
- Link to v2: https://lore.kernel.org/r/20250623-add_err_uevents-v2-0-a3a2cf8e711d@linux.ibm.com

Changes in v2:
- Add a patch fixing pci_uevent_ers() mistakenly ignoring PCI_ERS_RESULT_NEED_RESET
- Use the result of error_detected() for initial pci_uevent_ers()
- Drop fixes tag in s390 patch
- Rebase and re-test on current master
- Link to v1: https://lore.kernel.org/r/20250424-add_err_uevents-v1-1-3384d6b779c6@linux.ibm.com

---
Niklas Schnelle (3):
      PCI/AER: Fix missing uevent on recovery when a reset is requested
      PCI/ERR: s390/pci: Use pci_uevent_ers() in PCI recovery
      powerpc/eeh: Use result of error_detected() in uevent

 arch/powerpc/kernel/eeh_driver.c | 2 +-
 arch/s390/pci/pci_event.c        | 3 +++
 drivers/pci/pci-driver.c         | 3 ++-
 include/linux/pci.h              | 2 +-
 4 files changed, 7 insertions(+), 3 deletions(-)
---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250417-add_err_uevents-6f8d4d7ce09c

Best regards,
-- 
Niklas Schnelle


