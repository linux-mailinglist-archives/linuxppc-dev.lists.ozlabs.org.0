Return-Path: <linuxppc-dev+bounces-5141-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0259A0B431
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 11:11:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWp244kGrz3c9G;
	Mon, 13 Jan 2025 21:11:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736763084;
	cv=none; b=QQR8YqfeaJEaheIRo50HRBwX5E6q7o7yScxTTUTKPo7hTOGAyqlflZtdwmsOXHYBe1wfIbtTS/GB+ERvY/ApMTQ1fXu/mK50fJTrBU1TwCJCmiBFQqcxM2SjLwrB14tPDQYjjy8FUy21SBpVRPhVq8yU80Z319m0MEtVxkS7bhDZfX9g5m7xsP6nUciJXEGJAkx48B1dTGqjtFIqimrWU5iAmgnXVbckkEvThmPIoa8SBkBH9P+4iCUvh37yQEBRqM8N9wLjjh9ePKc0SjTpaJ3SykOvf9xHFbfCGbKG8jLi88etTqXujiCKQaGaa4PPn2wso2DSDywVRNH9MoSmMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736763084; c=relaxed/relaxed;
	bh=Zz1ewnf5umyRtwvW3ZFlsF0yM/dhD1hBvztkDt0HZcs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Aypv+Ne9UQ8UCDG0Glm3QSkvjCO2LGwrzjvJ5fgdWDnCPhuMToVF09Az3dFOcgKB98azJ9IRZJBJYzqnJd3WikFMlH1otoRo3x9Qg4WqLhDaX+4xiLgBWd9/Hw6lj0d1lTkqcykNQBmosLXLZXve7lFYlTpMDxjVpqZX9UEyuHyzzoGIdDzkFiCYNNXl3iTEuc2WJ2gX6ZaxlhfcgT45bhSrJUXwCyzm40s/LFPG7GkAiVnprhLfSZiQKHG6iPOd7tjOP1EKoXRQW7lz+4X2dOkJEO0/+KH8BjGcoRXKoEMqDJEXfRc6cBDq2oVsztzWI7oKo36S3uPePRsnYKcnwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BLcnQi/W; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BLcnQi/W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWp2340C4z2ynn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 21:11:23 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50CNonv8000829
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 10:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=Zz1ewnf5umyRtwvW3ZFlsF0yM/dhD1hBvztkDt0HZ
	cs=; b=BLcnQi/WB9XPzH7ofZ5F8wwR354dLz1owU5StlVQhuCNo7nlL+RQ5/0zo
	yFd6FEbVQiRzGvcT7bC1nslccfArVd8V3cGsKfAUMh0rx/Ob5gT9UEWplbmTbzF+
	imZIp0WjgebKiMgWunOyBzH8DBgHCUj3iz3qY5GaT+M2ca9WTxV924Zfek6l43BS
	trlnATas4C6YD4Lu+4/7cZ8q2mbtin75GuG/Fafg7gpsb651OBqdyxYupr2Wzilw
	O54Ki072yOP/fPr/pphPfwI8T+JD0mNnmngzkVdXV1geraqM/ZCtHnCY74wL+Ke6
	Mb4qvMrhb14/pMWh47Ha1ltFMpftw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 444f74k3uw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 10:11:20 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50D8bTFT017014
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 10:11:19 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4444fjwj3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 10:11:19 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50DABGwA50397622
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 10:11:16 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0560C2006E;
	Mon, 13 Jan 2025 10:11:16 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D8202006C;
	Mon, 13 Jan 2025 10:11:15 +0000 (GMT)
Received: from ltcden3-lp4.aus.stglabs.ibm.com (unknown [9.53.174.155])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jan 2025 10:11:15 +0000 (GMT)
From: adubey@linux.ibm.com
To: maddy@linux.ibm.com, atrajeev@linux.ibm.com, hbathini@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 3/3] powerpc: Document details on H_HTM hcall
Date: Mon, 13 Jan 2025 05:11:11 -0500
Message-Id: <20250113101111.289810-1-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
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
X-Proofpoint-GUID: KQKUXXZTlbbbIfuIaC9AYLHX8kqyqqgJ
X-Proofpoint-ORIG-GUID: KQKUXXZTlbbbIfuIaC9AYLHX8kqyqqgJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501130084
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Abhishek Dubey <adubey@linux.ibm.com>

Add documentation to 'papr_hcalls.rst' describing the
input, output and return values of the H_HTM hcall as
per the internal specification.

v3 patch:
  https://lore.kernel.org/linuxppc-dev/20240828085223.42177-3-maddy@linux.ibm.com/

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
Co-developed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 Documentation/arch/powerpc/papr_hcalls.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/arch/powerpc/papr_hcalls.rst b/Documentation/arch/powerpc/papr_hcalls.rst
index 80d2c0aadab5..805e1cb9bab9 100644
--- a/Documentation/arch/powerpc/papr_hcalls.rst
+++ b/Documentation/arch/powerpc/papr_hcalls.rst
@@ -289,6 +289,17 @@ to be issued multiple times in order to be completely serviced. The
 subsequent hcalls to the hypervisor until the hcall is completely serviced
 at which point H_SUCCESS or other error is returned by the hypervisor.
 
+**H_HTM**
+
+| Input: flags, target, operation (op), op-param1, op-param2, op-param3
+| Out: *dumphtmbufferdata*
+| Return Value: *H_Success,H_Busy,H_LongBusyOrder,H_Partial,H_Parameter,
+		 H_P2,H_P3,H_P4,H_P5,H_P6,H_State,H_Not_Available,H_Authority*
+
+H_HTM supports setup, configuration, control and dumping of Hardware Trace
+Macro (HTM) function and its data. HTM buffer stores tracing data for functions
+like core instruction, core LLAT and nest.
+
 References
 ==========
 .. [1] "Power Architecture Platform Reference"
-- 
2.39.3


