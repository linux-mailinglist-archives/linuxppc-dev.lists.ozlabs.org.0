Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DF845409C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 07:05:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvC855sqXz3cHf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 17:05:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qPUamxxL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qPUamxxL; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvC5p2l5vz2yNW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 17:03:10 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AH5mB1i031292; 
 Wed, 17 Nov 2021 06:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9Hvp4HXxpgB/XMSHlV7gY7mQNC6zKDlMMSp+1LR7Nbc=;
 b=qPUamxxLGd3jlrBabwH6txtkeKz3ejpzDhLDnLMxBZov4ZVXEjR5Plv/h+dDkpr6J3wO
 C4IlTN2g5kRNgGnfTu9M5zPGh8UWIW6mQHu0/XYp33L1YcvpK7JgUlpY7ZMfQc4jF49Y
 EgjQbc9mibElKDGON36gQRHXnH8qYmnQwO1ylpCWXxNga0QvszskaCUOI+dXwbgfYEvJ
 w/Maq/7F2Ipyoddc64y14CTOuLl9tT4WxW21MRxHYQyhx2oIxicTewuMOMFYQrjvpW4P
 SZRuDcnVcnqVE4Z8LgKHPRjzpmsm4a/MR5Of6D4ibsbulPqvP1Cq647YYq9SBX/gHJw+ 0g== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ccuwp07v8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 06:03:03 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AH5wtTI008549;
 Wed, 17 Nov 2021 06:03:02 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 3ca50b4fda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 06:03:02 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AH6313u56230348
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Nov 2021 06:03:01 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54AFC6A05F;
 Wed, 17 Nov 2021 06:03:01 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C5466A057;
 Wed, 17 Nov 2021 06:03:01 +0000 (GMT)
Received: from localhost (unknown [9.211.102.167])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 17 Nov 2021 06:03:01 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] powerpc/rtas: rtas_busy_delay_time() kernel-doc
Date: Wed, 17 Nov 2021 00:02:59 -0600
Message-Id: <20211117060259.957178-3-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211117060259.957178-1-nathanl@linux.ibm.com>
References: <20211117060259.957178-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yJ7Hb8iDcc7sugL6ysYr35q5oRwbIR9G
X-Proofpoint-GUID: yJ7Hb8iDcc7sugL6ysYr35q5oRwbIR9G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_02,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170029
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, aik@ozlabs.ru,
 cheloha@linux.ibm.com, ldufour@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Provide API documentation for rtas_busy_delay_time(), explaining why we
return the same value for 9900 and -2.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index d686834fe7f5..4cfe9f93a9cd 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -492,8 +492,25 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 }
 EXPORT_SYMBOL(rtas_call);
 
-/* For RTAS_BUSY (-2), delay for 1 millisecond.  For an extended busy status
- * code of 990n, perform the hinted delay of 10^n (last digit) milliseconds.
+/**
+ * rtas_busy_delay_time() - From an RTAS status value, calculate the
+ *                          suggested delay time in milliseconds.
+ *
+ * @status: a value returned from rtas_call() or similar APIs which return
+ *          the status of a RTAS function call.
+ *
+ * Context: Any context.
+ *
+ * Return:
+ * * 100000 - If @status is 9905.
+ * * 10000  - If @status is 9904.
+ * * 1000   - If @status is 9903.
+ * * 100    - If @status is 9902.
+ * * 10     - If @status is 9901.
+ * * 1      - If @status is either 9900 or -2. This is "wrong" for -2, but
+ *            some callers depend on this behavior, and the worst outcome
+ *            is that they will delay for longer than necessary.
+ * * 0      - If @status is not a busy or extended delay value.
  */
 unsigned int rtas_busy_delay_time(int status)
 {
-- 
2.31.1

