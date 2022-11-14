Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACAD6276D7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 08:57:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9hVN6YwTz3cG7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 18:57:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RFLFix8k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RFLFix8k;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9hTQ3PLPz2ybK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 18:56:26 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 2AE7nP8p014359;
	Mon, 14 Nov 2022 07:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=HcqEBk/DXOB77vJabJPQb9JL4qbozyLVsRg5dLI/Loc=;
 b=RFLFix8krsw4XaWEVeXpeocvBwEpEiYJknsLCp+Hhw1/70S+pyNE+lYcpjxHZK7pVBAN
 uJOrt3LE600Zd08tk3JtEHPV7hj6ujBWz38D1Zeo9wPr0+PE2LsLrMcK0WRJNejiL1RT
 vSjBEe31W9Yqxn41Puw2UcaySlb2JYJYXzOesacLgXv8UWewkYZiJv3anCKo3UgcRab5
 gYbkGxOetwAZF0stkxpONHds3h2uiqpC5w4Q17xb9wvgl3Ouqh0vJ3p6a2DpK1EKOxyo
 zxTR4PLHQMVRyoBsZY8SzrWrk8gmxC5kNkmtyYYbdufBwQk4VdFHYK0CZ+5ZTuesAWKo Sw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kuhmer46y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 07:56:18 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AE7oP0n002228;
	Mon, 14 Nov 2022 07:56:17 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma03ams.nl.ibm.com with ESMTP id 3kt348t6ty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 07:56:16 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AE7uD7337356258
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Nov 2022 07:56:13 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC5E04C044;
	Mon, 14 Nov 2022 07:56:13 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F90D4C040;
	Mon, 14 Nov 2022 07:56:12 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com.com (unknown [9.43.111.149])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 14 Nov 2022 07:56:11 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/mce: log the error for all unrecoverable errors
Date: Mon, 14 Nov 2022 13:26:07 +0530
Message-Id: <20221114075607.30631-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Cne2n7Gk7ziPDaF41ttRcSn3vcUz5Xz7
X-Proofpoint-GUID: Cne2n7Gk7ziPDaF41ttRcSn3vcUz5Xz7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_06,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=720
 mlxscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 clxscore=1011 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211140055
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

machine_check_log_err() is not getting called for all
unrecoverable errors, And we are missing to log the error.

Raise irq work in save_mce_event() for unrecoverable errors,
So that we log the error from MCE event handling block in
timer handler.

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
 arch/powerpc/kernel/mce.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 6c5d30fba766..a1cb2172eb7b 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -131,6 +131,13 @@ void save_mce_event(struct pt_regs *regs, long handled,
 	if (mce->error_type == MCE_ERROR_TYPE_UE)
 		mce->u.ue_error.ignore_event = mce_err->ignore_event;
 
+	/*
+	 * Raise irq work, So that we don't miss to log the error for
+	 * unrecoverable errors.
+	 */
+	if (mce->disposition == MCE_DISPOSITION_NOT_RECOVERED)
+		mce_irq_work_queue();
+
 	if (!addr)
 		return;
 
@@ -235,7 +242,6 @@ static void machine_check_ue_event(struct machine_check_event *evt)
 	       evt, sizeof(*evt));
 
 	/* Queue work to process this event later. */
-	mce_irq_work_queue();
 }
 
 /*
-- 
2.37.1

