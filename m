Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6C6728F41
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 07:19:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcqC614BZz3fBG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 15:19:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cut4smeg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cut4smeg;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcqBF2Hztz3bgr
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 15:19:01 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3595Hlfw018631;
	Fri, 9 Jun 2023 05:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=JnmtpzZSA8d1i+zVnILVCz602wjV3bKiE/LWYOtIJEU=;
 b=cut4smegzRd0+zJu+Fr4u3ZqzpCY8E/aqohPuIXCA+i1kIpzjXRwd48PUNqolgoJ7mP2
 qA3N9gNe5+qbfe1vxXt06cuGytE1BH7JHo22O7u+ehe4MfBKx6jBotpmpUduQHSJ9nh2
 mLzN+0Uw5dVUF12fWKtYytTS3ZQoLwMDwc3HUCj622svQ6s9D2yupHJGzrRrnTXeVwUa
 /U6Ru2E3+WODqFmB97K7s65f+LDmxKUDVFVtQBdIrgF2HevT1ZcHxq8uJcHxRxSnnaNn
 mrrtqd5CC2fRVJf6nz0Gw7tR6MHDFdM72Sr3cBbjAs8j/6j8QQwP6qbgnupH4oneazrG IA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r3wtdr0b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jun 2023 05:18:55 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3590JQVV025304;
	Fri, 9 Jun 2023 05:18:53 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3r2a78sse0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jun 2023 05:18:53 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3595In2c7406198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Jun 2023 05:18:49 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9FA5620043;
	Fri,  9 Jun 2023 05:18:49 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3343520040;
	Fri,  9 Jun 2023 05:18:48 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.83.118])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  9 Jun 2023 05:18:47 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/fadump: invoke ibm,os-term with rtas_call_unlocked()
Date: Fri,  9 Jun 2023 10:48:46 +0530
Message-Id: <20230609051846.132457-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1eVeHnMJcjcHn6fNV0bOG-jQKZCMxn7z
X-Proofpoint-ORIG-GUID: 1eVeHnMJcjcHn6fNV0bOG-jQKZCMxn7z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_02,2023-06-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxlogscore=960
 priorityscore=1501 spamscore=0 impostorscore=0 mlxscore=0 adultscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306090043
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Invoke ibm,os-term call with rtas_call_unlocked(), without using the
RTAS spinlock, to avoid deadlock in the unlikely event of a machine
crash while making an RTAS call.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index c087eeee320f..f65b2a8cc0f1 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1587,6 +1587,7 @@ static bool ibm_extended_os_term;
 void rtas_os_term(char *str)
 {
 	s32 token = rtas_function_token(RTAS_FN_IBM_OS_TERM);
+	static struct rtas_args args;
 	int status;
 
 	/*
@@ -1607,7 +1608,7 @@ void rtas_os_term(char *str)
 	 * schedules.
 	 */
 	do {
-		status = rtas_call(token, 1, 1, NULL, __pa(rtas_os_term_buf));
+		status = rtas_call_unlocked(&args, token, 1, 1, NULL, __pa(rtas_os_term_buf));
 	} while (rtas_busy_delay_time(status));
 
 	if (status != 0)
-- 
2.40.1

