Return-Path: <linuxppc-dev+bounces-10710-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C875FB1D599
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 12:16:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byNN90vXfz3bqP;
	Thu,  7 Aug 2025 20:15:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754561753;
	cv=none; b=H6zrGGTizlo6wl9jmMhdCkHMmbxbZX9Gp2WAUlDQC45Rac5U72OX8NQ68EnzAl02+S0nU3j1sSlgBLuFIT0l3hIv0jjjsEpQxsatacQj+P1o3s/ko8TlDlrsu4063oXBs6Fm2XR63KArfEG/+aTvZ2bAzGBuyhlV+4gUc1mQC3aowMIbpMN8yZrOLQczK/3fAcHzjWcbHZt9l/MfKzzNzvhKf4IYs3VYcTNNPq7SAau+dAZmcmervMipB633zX+niesOsTeCuQUulsgurK33pWkoUPSaDkM50BQ9uzGlW5HUCEG2F+9JqqofId02W7ICxA+aBjyMdmPFjHysGy9e+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754561753; c=relaxed/relaxed;
	bh=STgXJSQZlvL9W8pyTNY4ql5iGZFkKX6A7jVujHu1LSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fKIQr2UxEbpBlmTo3YUXRh3VwTH9eTz+QmdelGTf9FnY11pnxUjZnWbvqdeFU4GGbnhVOn73rvZVu8ucOVQpsYq34GLenYA1N4t8AfQ+Yr5ZI/sfre1R3ewH9M6F9tsSQpRiQw/uj8n7Tq4NaNLdzgIqHHmHxIR8wwc2eWLldV/u/occ+dAtLrgr4KTemiZzJuRQ4gpwXVm42ybtAAzGwDkCZYYly4rW7VtSwkS+TX3WWbAppLTHkKboEThHITf6qG8oHOzl0a+qUl0I1AFIWQUYkDcOfaeMncFFfQYkjhYKv/RGI4+Z/1jzDebEdTylqDrGtoz1o58fYoGJg3thAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iaqV/8Np; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iaqV/8Np;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byNN83JRhz2xcD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 20:15:52 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5778t4Av021583;
	Thu, 7 Aug 2025 10:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=STgXJS
	QZlvL9W8pyTNY4ql5iGZFkKX6A7jVujHu1LSs=; b=iaqV/8NpjLe5ojCkH0/ZM1
	zMJLPAWZXHf5PEqeejWcYQdz9N8rfBiBrg6z/cKjSohwMToaXaxOS9/UVgNpencz
	udJQOZBt7V3bbeRQmRWO/OLFa9W9GHEkE6Z1YPl204MwMZy4HPQBDin0l6LTlVGC
	ri9oLIcdvfc3iORWMylgdAO84qC2W7cmxtaRzsrCRTkRqSBgRqWfN3jgQhARpNvh
	Ev0zn7Z50pXoHqJg0fCrgZoPY0niuf5WzQaYa+ePkWLPxOZ2Prjm4MKmXI1ngTGy
	/AgHM1AlQ9UjikstpRyXyNIA+p8FC+qJnx/PwvrOEnW2fAtCJO7Kd2YFUyUMMyCA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48bq621f8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 10:15:48 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 577AFlEb000363;
	Thu, 7 Aug 2025 10:15:47 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48bq621f8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 10:15:47 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5779rrh9001514;
	Thu, 7 Aug 2025 10:15:46 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 48bpwr0310-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 10:15:46 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 577AFjGF26149548
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Aug 2025 10:15:45 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F13258055;
	Thu,  7 Aug 2025 10:15:45 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D7035805D;
	Thu,  7 Aug 2025 10:15:42 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 Aug 2025 10:15:42 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
Date: Thu, 07 Aug 2025 12:15:32 +0200
Subject: [PATCH v4 2/3] powerpc/eeh: Use result of error_detected() in
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
Message-Id: <20250807-add_err_uevents-v4-2-c624bfd8638d@linux.ibm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029;
 i=schnelle@linux.ibm.com; h=from:subject:message-id;
 bh=h+ehO7sHf6gk7yXI2DZUqbMMTOqnPJU0Ks5nnomA7LY=;
 b=owGbwMvMwCX2Wz534YHOJ2GMp9WSGDKm1BzznHG0OPLenQdzTpgvi2rjMp95+EPLD6mcPdPLe
 7plH/6621HKwiDGxSArpsiyqMvZb13BFNM9Qf0dMHNYmUCGMHBxCsBEpDMZGXofsJtvutqcdGTd
 vVPT/ld+nBnWavh1n8X++ZuikoQ/TJVjZJjgYHd7d8yehZ7NExQfxjvrzci//+1qgUb7jyCNb7Y
 CD3gB
X-Developer-Key: i=schnelle@linux.ibm.com; a=openpgp;
 fpr=9DB000B2D2752030A5F72DDCAFE43F15E8C26090
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA3OCBTYWx0ZWRfXze0Jyb1EKTeu
 TosXHTnDa2F2gQwfjUH3RDhkQ3b1KwjyN39T/d3o8Z8nAsZpRaM3RsrkwcHHR3yCv6h9sjdqTDy
 6IaIUDtiwrPoXfLQge6DN5959ypomW/8MuF4aiooorFxAD2XjKJPl19O1CjZyvTQeEz0PE7SUpb
 AWcHW3Tbp8q9urezeLnIm/e9SZ0xNMf8pvSo4y0hCopwh2IO5MSZbO2TCdpXGFdoLI0PPJz83po
 Zn1Wzv/UIOroKaPE7KVE5zy1ihEd9Pnrz/vf1aldLJwWoOpQs5xOj6WLYxn81/PURp4q1J5Dwip
 k7TyMZ3ngIQjoOzVnT7ij0AVdsjsBEmrrolet/f7FTakMAFp4elcIDb7NpTefBVEbIzkIxDZ8D4
 ZDSC3ABX04+gwdYCd67VMyzv7lpCghcoXu478AqOA5gFegbc7ig+qNaVoelGcp0tghAPHvZ/
X-Proofpoint-GUID: wv-wTNnGwJw3sZ_4IVq31Zp0tPe5Y7R3
X-Authority-Analysis: v=2.4 cv=BIuzrEQG c=1 sm=1 tr=0 ts=68947cd4 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=NEBNNiDPVXfdxOcwRW8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: X0gJ0lqHEGcyjreeQWvUNloxKwWRPS-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 mlxlogscore=961 adultscore=0 clxscore=1015
 malwarescore=0 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508070078
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

With pci_uevent_ers() handling PCI_ERS_RESULT_NEED_RESET the result of
error_detected() can be used in pci_uevent_ers() even if drivers request
a reset. This aligns EEH's behavior with both AER.

Suggested-by: Lukas Wunner <lukas@wunner.de>
Link: https://lore.kernel.org/linux-pci/aIp6LiKJor9KLVpv@wunner.de/
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


