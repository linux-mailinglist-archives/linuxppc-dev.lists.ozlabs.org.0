Return-Path: <linuxppc-dev+bounces-7657-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE33A88C59
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Apr 2025 21:40:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZbyLl3r9Rz30Vw;
	Tue, 15 Apr 2025 05:40:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744659631;
	cv=none; b=Blbp+x8bx+cAw4RYUZM4N/qnea8E2+TkvV0zxVqc9ZDoihDrojsUV9ETPszhYEYC4Km2OlemjcyMgG9g6SAtKGX0DV92MNpihJHVu+JHE7jAXlJAI8FAPjYCaLYyEEohDiKCvYkYOXw2eZjo3ALpmMLxUx+FScIwhOrDV79aZubvVYniWR1IL1spoqHc3C7olp5ROzGngUik75qqOR4NRPo8nnbTbo1/BeOwnTU32KpdnSmHDioqJP3MAgDZVv1B6hTy/NhJnyb7uy1LWq5ypMg9fmMWt2bqiwgoSGj+2NDo9GvpWkMnXdEpvDYZe1dRa47i8+7LDiZ+R7KRHWEviA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744659631; c=relaxed/relaxed;
	bh=Eo/7lmDns5bA04x+0vlwGMMIGQBGv0AeM71HeXdVR+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bLDEXIqpwXredRo6ALAkGiy3of6lYSxMiMhDXb84TrfT0azMIV0wlvgToP9CsWsH9yMmZ5LO2AL2iSd9HbyQUaiCQ2V3OehKLhicZiV7kG1s7OvvZcyPVGmGa/mqhxrGkS50hJblEENNRHdsoxgRRlAL0cFsxq4abdyEtqyx1CbF/5cpTpC0STRZamruiRtFN8++I7RNJNaXTKGr3Fw44oWmQlMTxk1AKbisKy+OjJmwn1qihnma7f1FP0uNEKPOCiO6w9c+JTsB4c2Btx6/bOUqFIRNABNZIR3pkeKaUoKNlIFgWAnq+I6HWQ3q1s+hAuELHQesTG7XKa0usDySSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F1x4kVNe; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F1x4kVNe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZbyLj5fTlz30BW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Apr 2025 05:40:29 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EA43He026680;
	Mon, 14 Apr 2025 19:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=Eo/7lmDns5bA04x+0vlwGMMIGQBGv0AeM71HeXdVR
	+k=; b=F1x4kVNepHNiTlXSoTwRhM2FSSAOe+0zEnF1V1AaULo1ZavoZWc7QzbBR
	nD2HaFePqzKRJl6Muq6pXSTszO2Mx7lfzgLbh925aAecss5z2OTFFAVvgkBiysNC
	tzG05bEmjVxfVsGyvsyvWHATe6CgKsYomNZz5TI5Fs+RKj/6DCgKsoxD8OznpuE6
	uRO/Nrkz6niTCVCBEkbVbSyn6khzIU9H1Y/qGJg3R1Mxs9gB2QyjDUI3hQp5JaL2
	7FuwHFRhOU9fdkhD3AlW2u57EO2C55CiMY/AF/JsgHBY1MX9q91eszvo8mzqiR7A
	KldFCf/n07VkWdihLpT99VTTWvx1g==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46109f2raq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 19:40:25 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53EI25tQ016689;
	Mon, 14 Apr 2025 19:40:24 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 460571ydj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 19:40:24 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53EJeOHI28902100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 19:40:24 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D8AC5805D;
	Mon, 14 Apr 2025 19:40:24 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32CDA58058;
	Mon, 14 Apr 2025 19:40:24 +0000 (GMT)
Received: from d.attlocal.net (unknown [9.61.98.8])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 14 Apr 2025 19:40:24 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: netdev@vger.kernel.org
Cc: michal.swiatkowski@linux.intel.com,
        Dave Marquardt <davemarq@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH net-next v2 0/2] net: ibmveth: Make ibmveth use WARN_ON instead of BUG_ON and added KUnit tests
Date: Mon, 14 Apr 2025 14:40:14 -0500
Message-ID: <20250414194016.437838-1-davemarq@linux.ibm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -yDISVVWdXosvG8rLzfqzz5BPPUGHLXq
X-Proofpoint-ORIG-GUID: -yDISVVWdXosvG8rLzfqzz5BPPUGHLXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=740 malwarescore=0 clxscore=1015 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504140142
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

- Made ibmveth driver use WARN_ON with recovery rather than BUG_ON. Some
  recovery code schedules a reset through new function ibmveth_reset. Also
  removed a conflicting and unneeded forward declaration.
- Added KUnit tests for some areas changed by the WARN_ON changes.

Changes:
v2: Addressed Michal Swiatkowski's comments
- Split into multiple patches
- Used a more descriptive label
*** BLURB HERE ***

Dave Marquardt (2):
  net: ibmveth: make ibmveth use WARN_ON instead of BUG_ON
  net: ibmveth: added KUnit tests for some buffer pool functions

 drivers/net/ethernet/ibm/Kconfig   |  13 ++
 drivers/net/ethernet/ibm/ibmveth.c | 241 ++++++++++++++++++++++++++---
 drivers/net/ethernet/ibm/ibmveth.h |  65 ++++----
 3 files changed, 268 insertions(+), 51 deletions(-)

-- 
2.49.0


