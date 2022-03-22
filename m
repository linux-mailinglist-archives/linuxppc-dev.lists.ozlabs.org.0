Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8504E3812
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 05:57:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMzkb4fMxz30jZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 15:57:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kCf6Napm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kCf6Napm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMzjs1jxYz2xfT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Mar 2022 15:57:04 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22M3779w023856; 
 Tue, 22 Mar 2022 04:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=nW/G3tNopcoWb7tx/rqNV3PXu+kwx95tsS+2dMydmdQ=;
 b=kCf6NapmtO2IDt/QA/dTU1+pwU6BXU0PcyXVnhPWkRoxnlTnIgOlfzlBkkYv6BEZ19bL
 y6ALyKTzcUV3Fbgru4+UXgO9gFFb/h2KO8mDnR+zUkiJe2YfXQXjkpL7nwGJ5nnZmnjg
 MhNZImJOG1p93rw+qa030Mxx5RsyT7jOUT14mF70y+thvAzKl8+h2OheCOSXm2agPci4
 6nqnW9MNfBFY8SS8JK14AK4c8jw2sWKn+67qAV0jtFY9i1kuSpqo0cljZQWA5Jc0ba3Z
 TLyLPhOv8sWSQ/FxE7saxgguke7ug+bnX/OZgGBCNnxIvWKyu43TizS9V7+gDeB+hvmq sg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ey5wc1xys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Mar 2022 04:56:55 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22M4rCLY024230;
 Tue, 22 Mar 2022 04:56:53 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3ew6t94kas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Mar 2022 04:56:53 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22M4j9TE53084526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Mar 2022 04:45:09 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A1AD5204F;
 Tue, 22 Mar 2022 04:56:50 +0000 (GMT)
Received: from Madhavan.com (unknown [9.43.92.249])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 209745204E;
 Tue, 22 Mar 2022 04:56:47 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] selftest/powerpc/pmu/ebb: remove fixed_instruction.S
Date: Tue, 22 Mar 2022 10:26:38 +0530
Message-Id: <20220322045638.10443-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3WsgZuGxwcIQH6QCYRPQfU_Eevs0DzP6
X-Proofpoint-GUID: 3WsgZuGxwcIQH6QCYRPQfU_Eevs0DzP6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-21_10,2022-03-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=993 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 mlxscore=0 spamscore=0 suspectscore=0
 bulkscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203220024
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, atrajeev@linux.vnet.ibm.com,
 linux-kselftest@vger.kernel.org, shuah@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 3752e453f6ba ("selftests/powerpc: Add tests of PMU EBBs") added
selftest testcases to verify EBB interface. instruction_count_test.c
testcase needs a fixed loop function to count overhead. Instead of
using the thirty_two_instruction_loop() in fixed_instruction_loop.S
in ebb folder, file is linked with thirty_two_instruction_loop() in
loop.S from top folder. Since fixed_instruction_loop.S not used, patch
removes the file.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 .../powerpc/pmu/ebb/fixed_instruction_loop.S  | 43 -------------------
 1 file changed, 43 deletions(-)
 delete mode 100644 tools/testing/selftests/powerpc/pmu/ebb/fixed_instruction_loop.S

diff --git a/tools/testing/selftests/powerpc/pmu/ebb/fixed_instruction_loop.S b/tools/testing/selftests/powerpc/pmu/ebb/fixed_instruction_loop.S
deleted file mode 100644
index 08a7b5f133b9..000000000000
--- a/tools/testing/selftests/powerpc/pmu/ebb/fixed_instruction_loop.S
+++ /dev/null
@@ -1,43 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright 2014, Michael Ellerman, IBM Corp.
- */
-
-#include <ppc-asm.h>
-
-	.text
-
-FUNC_START(thirty_two_instruction_loop)
-	cmpwi	r3,0
-	beqlr
-	addi	r4,r3,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1
-	addi	r4,r4,1	# 28 addi's
-	subi	r3,r3,1
-	b	FUNC_NAME(thirty_two_instruction_loop)
-FUNC_END(thirty_two_instruction_loop)
-- 
2.34.1

