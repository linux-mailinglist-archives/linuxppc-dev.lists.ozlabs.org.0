Return-Path: <linuxppc-dev+bounces-10708-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44881B1D592
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 12:15:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byNN540MHz2xck;
	Thu,  7 Aug 2025 20:15:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754561749;
	cv=none; b=dDG2SvQONJOJCOD4eYyEEZqAgNa0ua6kPZ5tDq/fuWEgbFxU9MKuNjC54lPp0c4s1/WXjufbBkJsgEpyVt2BsuBLZZmjQPXeNuqVEElgtx7uRnU+LRkAzXwAx4iHISbqUb3D+GvKoElQNs4z1voqcxP8ZhqCc41wEEO726gW0UCW2i2NuipBTDV0QgVj8K32JzvtR2OzU0gmOH+e4x9veK+4iEXSKogJiiuOasA/8782ASqqYyqkQayvh6j/jMhlJvxT0X2G625pJBTFA3Fypjax1FtFKf+mrSoPZu4KzFXKGBYL9jq+54a+OnC6/V115JvJmKXghOZpfPWNXmCPeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754561749; c=relaxed/relaxed;
	bh=l/+SEP9W1HI808c+t26c8v/UhqRxC5G02OyRBCZLA0E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EYFBZFj1iwcTcXLOeiEWaKlDGvHDknEtGWou7jmEqNs2Z/KqHjFY5BkWLbulJ0PMJ8TiHoeusaaOa6Pq3puFBglhQDaVa2cN4Ka51lOE5KfEbzXhLXGVuWqQv/BBq7XrxCnHYlrwwvteUOo4yjwqPftlTYJc6Q5DZP1B98oHFBebWK4qiFQlKsNvS7mxDgsbQbGOaMIXwEp1RQUzV8khgJd73hqM5kzUo/jjN2qqcGIJ1cpBKxj7bEScFBs3cry5xZ+YSl7LJm9s4rXZuEisQt03Ol/T+74BCd76A9LxIvvHnNRSitNgb4e6ezmQMaoVDwbP1K9cLKRVLpKVk/uRpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SrBV9kem; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SrBV9kem;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byNN453GGz2xcD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 20:15:48 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57768gGX019393;
	Thu, 7 Aug 2025 10:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=l/+SEP9W1HI808c+t26c8v/UhqRx
	C5G02OyRBCZLA0E=; b=SrBV9kemVKcu1yOAiMe/EHT4vVcf3TvfSbbghgfQHY0E
	hMY0mOGcR8fv5Je9NzZWxy/02UHW2A0QvXCMV0+ixUqxZbCCAHUY+HB/UPtcvkoG
	ngcDH75CgM93rGSbODw9wtqKuQ1NnzIuu+LALnXq6hHRkABssVYMgYi0de9QPOgC
	kSVmZ8AGGFwjL2HeHr6Jji7vEh+zN3H/tArn0K34g4xwFiEZGtp3x9wbkDiYZIm1
	7ozRsIg9Dt2vwf4DDuE0QVbO/olUTrcZEJibHXLWpFVHXFByuiWYpx4m+ptrDGpu
	aQcWp7tQo8nqeW8rS8J0KCJHCr0p9s9aHUb0plocYA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48c26txucj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 10:15:43 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 577AFgss021851;
	Thu, 7 Aug 2025 10:15:42 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48c26txuce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 10:15:42 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5779T0BV007997;
	Thu, 7 Aug 2025 10:15:41 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48bpwn02rc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 10:15:41 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 577AFV5T31523364
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Aug 2025 10:15:32 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36A3C5805F;
	Thu,  7 Aug 2025 10:15:39 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 63C8E58055;
	Thu,  7 Aug 2025 10:15:36 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 Aug 2025 10:15:36 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [PATCH v4 0/3] PCI/ERR: s390/pci: Use pci_uevent_ers() in PCI
 recovery
Date: Thu, 07 Aug 2025 12:15:30 +0200
Message-Id: <20250807-add_err_uevents-v4-0-c624bfd8638d@linux.ibm.com>
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
X-B4-Tracking: v=1; b=H4sIAMJ8lGgC/23N3wqCMBTH8VeJXTfZP5121XtEiG7HHOSMTYchv
 ntTAiG7/P7gfM6MPDgDHl1OM3IQjDe9jSHOJ6Tayj4AGx0bMcJSIqjEldYlOFeOEMAOHmdNroW
 WCkihULx6OWjMtIm3e+zW+KF37+1BoOv6tZg4WIFiijnPhc5qKQuVXZ/GjlNi6i5RfYdWL7Ddy
 Bg/GgwTXPGKqSYHSan+Z/DdkJwcDR6NVJCaprkikjS/xrIsH3yogd06AQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1934;
 i=schnelle@linux.ibm.com; h=from:subject:message-id;
 bh=QwR/g9gCl0cuQrGYwZYsUDmIdsP7KonbdNDOCnypE+c=;
 b=owGbwMvMwCX2Wz534YHOJ2GMp9WSGDKm1Bzdx2O597Pf9h9Hpk57P3einfr5zta1tzXygjqiR
 UqCJ3Q5dZSyMIhxMciKKbIs6nL2W1cwxXRPUH8HzBxWJpAhDFycAjARxb0M/8s3B2f/LtKX2LPb
 YN2Rtnn3/YVePjWefyqqe1lwDkdTzlWG/0U9dpMW6wsrPaniEePc+Xu12J6dl7//CPJjzTQIunL
 jNA8A
X-Developer-Key: i=schnelle@linux.ibm.com; a=openpgp;
 fpr=9DB000B2D2752030A5F72DDCAFE43F15E8C26090
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UQ8b2gZMgDFxw_ehMZi0GX83mVCpFKRQ
X-Authority-Analysis: v=2.4 cv=F/xXdrhN c=1 sm=1 tr=0 ts=68947ccf cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=akVQnn9Ajh7wPi5GvloA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: LBtR00s-TY3MdBWy78IPVMvB4fsARNX9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA3MyBTYWx0ZWRfX0z0IzgHqDF5s
 H/zb2dl4gCb+hXFmcSm5mU6NPolZu63JtpXEQVLIBUndJk8nMcRa/9pu4702Erlk8UdfFMl8ha/
 imzhXircjMy+MA8XrqdKXPKla+5Z6lbRTkOhN0w2EDqF1u5i+cyEUcF7C4xggONECyQbe1Njr6F
 zbuKWldLxUJIbJownnjuK9YxVJbC+LxJxfYkgtNr3HPobwoR8lhjhAsR5jwkYdwHeSFz8PavWa5
 lTaKaSLfghp+CokcuxfeWpcHLkVdovObDiWUtK7biyQjdhsnTpEQSYAnRw6mNXMkJlk4UomesV4
 kMW2jhKK4wXStS77beJLxmRbDSxWd1gPGi9mPoX/kfTrepo6w3AKbF9FI39BezNfVXPq0jKvYod
 +bj0cDfhPTBKg4Rq5SRT08FAQp591j9AQ3Jf5D/nxFGhth4bO2u5MTvmO/nFYsCate+p1Gd4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508070073
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
      powerpc/eeh: Use result of error_detected() in uevent
      PCI/ERR: s390/pci: Use pci_uevent_ers() in PCI recovery

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


