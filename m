Return-Path: <linuxppc-dev+bounces-7902-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2045CA96C27
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 15:11:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhjLd73m7z3bx1;
	Tue, 22 Apr 2025 23:11:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745327513;
	cv=none; b=Vj86zkdYIp6iODXnT6CzcZCytObDG1x8A5PORz+MT8GTXg4afVXd3PPH71l5+DJQqSxbyXPecvDDtJnrxDkQNNVWBjclUVBXlJc/9rmk2rpv4WBHd5z88zwwbZSvQanoqewXnkRx+zoBdTBwupOefMgCWXucQizYYVSdwc2Wxe8Wpif0WKEJCxztNLPzCC5O3YnU8ZHqc5fCdTnYsdWdYDKhMi3gKzulp6n/4XfU5RLl4KKVcq22ZHzMQro0JQM1HeGvi8phBHm8yBNeNgnVuHQnoeJUE6B7dpDffjSlK9g5NVrfVRybhGJBBU1ft6n6Maoa+0THomnu3caAvoCSFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745327513; c=relaxed/relaxed;
	bh=ScOt4YcpS/wxQRSbcYFmEU2eo0k8ZR8ip++l6ZKMUaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K9B0eTk+9aZr8CThALuu9o0B7gmcaB2kYZRkupeEewtmMfvJ+1M+J3jfceTI+yuNjRi5thOQ4a7M0Xa+wxdbYvTMrDC40kHAHkrtPENiYkK3+lYOTyaAv8xugeXfdRtoq0nEClDPK096uDnXNuz2kR4IEW91fdjrwuD7u1vVZI7Cxwoe32jyJO/BbD0PPAZAVV8BOSzxiWy8XacB4WSntBPvgj9tYonWrislvOHXkD8bcv3yV5Lh8ziw2gpF3BeFOEHb+LzWMywo4VR2BEhjqjMFZmWG1AodDlKYJFeWZkEbAIitSryIqzAWE/1Ed74XFegCoFs453ij1rVf5v+W9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GmNzJTwp; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GmNzJTwp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhjLd2Mpsz304l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 23:11:53 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MAbSev020741;
	Tue, 22 Apr 2025 13:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=ScOt4YcpS/wxQRSbc
	YFmEU2eo0k8ZR8ip++l6ZKMUaY=; b=GmNzJTwpUtcXB1H7VgeHKn+tQXlZmbd5o
	m1TZJuwMRSnVufeWeSG6ohpKniEAwt4vM+8kSi1KfH+NAhPZMQcNeVk+1OMl1nfi
	jZ3PzI7449mXCPV4yxwUYhH1jn/Kyb4UQkiurvuBUNIRjpQ0Sa4A4pUze+idWowz
	vm7/XI0n5wJ+sISTA3Ken/ZnnOtL2JYAfOnvaaksM828+hArPMH0f+cB4BgZNyEQ
	wdUa33NXu1f9739VapA7vnmGcYNIDM2N63GuobGrALS0VhO8f/0z364a74BGR80/
	SJCgGUUV6mEk3wiuOUr7g9V65YdEtWxaOWZNENsmwuQ6M1in2KoPQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4669h1gquh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:11:42 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53MD8NU4021598;
	Tue, 22 Apr 2025 13:11:41 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4669h1gque-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:11:41 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53MBVFIR015384;
	Tue, 22 Apr 2025 13:11:40 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 464qnkjuh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:11:34 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53MDBV2X30933306
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 13:11:31 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 60C1F20063;
	Tue, 22 Apr 2025 13:11:31 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1BEE2005A;
	Tue, 22 Apr 2025 13:11:22 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.58.77])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 22 Apr 2025 13:11:22 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, christophe.leroy@csgroup.eu
Cc: npiggin@gmail.com, naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH 2/6] powerpc/xmon: fix sparse warning "Using plain integer as NULL pointer"
Date: Tue, 22 Apr 2025 18:40:36 +0530
Message-ID: <20250422131040.374427-3-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422131040.374427-1-maddy@linux.ibm.com>
References: <20250422131040.374427-1-maddy@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=XvP6OUF9 c=1 sm=1 tr=0 ts=6807958e cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=UNBm9OSmSZM4mi4iOaMA:9
X-Proofpoint-GUID: uw37_B_TunWaBr8RWPKcMUGZnyOyCgoc
X-Proofpoint-ORIG-GUID: sRMGyhe5q16wJSErP2YClIFwLb4rRKxV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=444 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220098
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Fix passing of argument 0 to NULL to avoid sparse warning

Cleans up sparse warning:
arch/powerpc/xmon/ppc-opc.c:797:15: warning: Using plain integer as NULL pointer
arch/powerpc/xmon/ppc-opc.c:797:18: warning: Using plain integer as NULL pointer
arch/powerpc/xmon/ppc-opc.c:801:15: warning: Using plain integer as NULL pointer
arch/powerpc/xmon/ppc-opc.c:801:18: warning: Using plain integer as NULL pointer
arch/powerpc/xmon/ppc-opc.c:805:14: warning: Using plain integer as NULL pointer
arch/powerpc/xmon/ppc-opc.c:805:17: warning: Using plain integer as NULL pointer
arch/powerpc/xmon/ppc-opc.c:809:16: warning: Using plain integer as NULL pointer
arch/powerpc/xmon/ppc-opc.c:809:19: warning: Using plain integer as NULL pointer
arch/powerpc/xmon/ppc-opc.c:863:15: warning: Using plain integer as NULL pointer
arch/powerpc/xmon/ppc-opc.c:863:18: warning: Using plain integer as NULL pointer
arch/powerpc/xmon/ppc-opc.c:868:15: warning: Using plain integer as NULL pointer
arch/powerpc/xmon/ppc-opc.c:868:18: warning: Using plain integer as NULL pointer
arch/powerpc/xmon/ppc-opc.c:872:15: warning: Using plain integer as NULL pointer
arch/powerpc/xmon/ppc-opc.c:872:18: warning: Using plain integer as NULL pointer
arch/powerpc/xmon/ppc-opc.c:875:15: warning: Using plain integer as NULL pointer
arch/powerpc/xmon/ppc-opc.c:875:18: warning: Using plain integer as NULL pointer
arch/powerpc/xmon/ppc-opc.c:878:15: warning: Using plain integer as NULL pointer
arch/powerpc/xmon/ppc-opc.c:878:18: warning: Using plain integer as NULL pointer
arch/powerpc/xmon/ppc-opc.c:881:14: warning: Using plain integer as NULL pointer
arch/powerpc/xmon/ppc-opc.c:881:17: warning: Using plain integer as NULL pointer

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/xmon/ppc-opc.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/xmon/ppc-opc.c b/arch/powerpc/xmon/ppc-opc.c
index 0774d711453e..b4ca7eb8d765 100644
--- a/arch/powerpc/xmon/ppc-opc.c
+++ b/arch/powerpc/xmon/ppc-opc.c
@@ -794,19 +794,19 @@ const struct powerpc_operand powerpc_operands[] =
 #define PSWM WS + 1
   /* The BO16 field in a BD8 form instruction.  */
 #define BO16 PSWM
-  {  0x1, 10, 0, 0, 0 },
+  {  0x1, 10, NULL, NULL, 0 },
 
   /* IDX bits for quantization in the pair singles instructions.  */
 #define PSQ PSWM + 1
-  {  0x7, 12, 0, 0, 0 },
+  {  0x7, 12, NULL, NULL, 0 },
 
   /* IDX bits for quantization in the pair singles x-type instructions.  */
 #define PSQM PSQ + 1
-  {  0x7, 7, 0, 0, 0 },
+  {  0x7, 7, NULL, NULL, 0 },
 
   /* Smaller D field for quantization in the pair singles instructions.  */
 #define PSD PSQM + 1
-  {  0xfff, 0, 0, 0,  PPC_OPERAND_PARENS | PPC_OPERAND_SIGNED },
+  {  0xfff, 0, NULL, NULL,  PPC_OPERAND_PARENS | PPC_OPERAND_SIGNED },
 
   /* The L field in an mtmsrd or A form instruction or R or W in an X form.  */
 #define A_L PSD + 1
@@ -860,25 +860,25 @@ const struct powerpc_operand powerpc_operands[] =
   /* Xilinx APU related masks and macros */
 #define FCRT XFL_L + 1
 #define FCRT_MASK (0x1f << 21)
-  { 0x1f, 21, 0, 0, PPC_OPERAND_FCR },
+  { 0x1f, 21, NULL, NULL, PPC_OPERAND_FCR },
 
   /* Xilinx FSL related masks and macros */
 #define FSL FCRT + 1
 #define FSL_MASK (0x1f << 11)
-  { 0x1f, 11, 0, 0, PPC_OPERAND_FSL },
+  { 0x1f, 11, NULL, NULL, PPC_OPERAND_FSL },
 
   /* Xilinx UDI related masks and macros */
 #define URT FSL + 1
-  { 0x1f, 21, 0, 0, PPC_OPERAND_UDI },
+  { 0x1f, 21, NULL, NULL, PPC_OPERAND_UDI },
 
 #define URA URT + 1
-  { 0x1f, 16, 0, 0, PPC_OPERAND_UDI },
+  { 0x1f, 16, NULL, NULL, PPC_OPERAND_UDI },
 
 #define URB URA + 1
-  { 0x1f, 11, 0, 0, PPC_OPERAND_UDI },
+  { 0x1f, 11, NULL, NULL, PPC_OPERAND_UDI },
 
 #define URC URB + 1
-  { 0x1f, 6, 0, 0, PPC_OPERAND_UDI },
+  { 0x1f, 6, NULL, NULL, PPC_OPERAND_UDI },
 
   /* The VLESIMM field in a D form instruction.  */
 #define VLESIMM URC + 1
-- 
2.49.0


