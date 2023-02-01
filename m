Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE07686340
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 11:00:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6HVM73Grz3dvk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 21:00:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JKEPnYz/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JKEPnYz/;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6HTM0JNLz3cdZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 20:59:50 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3119rspB023886;
	Wed, 1 Feb 2023 09:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=g13ZAEfYWhQLcOpZodTnHMcvTvsdVwlurHgqxSw+Z48=;
 b=JKEPnYz/zfp4b5jKx3M40wggaQAwRPFwqHU0joEpLVqooJHzRN2N9KaxoNng+NkrG5ud
 YdoZpMwMms6c7Lvy1Znadik3MzbOUwmcozssGgkIX/LC7fP8PecXAQPaxkdYhdZ4Mu7m
 5WKgcFmudCSdDy0DhhZPMLZcE0bdz8bwxv9mtLUad3uPCLjp2Pb0HRmFbSa2vsUmtz4D
 w542z99J9/GW74nJarwaiTLSya1A5cuXb+FjxwzSiLkqPsd1uxAH9jcuXmlOzxJljULx
 2SZ/tG9QCFIoQDXYa0BG51aWoacrbrmIO4sEphb9ykbrn7JDqlVJezev3BKUMN692ka3 IA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfnuh03e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 09:59:42 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3117nK4K013445;
	Wed, 1 Feb 2023 09:59:41 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ncvtycne0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 09:59:40 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3119xbFe49676760
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Feb 2023 09:59:37 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7995220043;
	Wed,  1 Feb 2023 09:59:37 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5961920040;
	Wed,  1 Feb 2023 09:59:36 +0000 (GMT)
Received: from li-79f82dcc-27d1-11b2-a85c-9579c2333295.in.ibm.com (unknown [9.204.207.144])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Feb 2023 09:59:36 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3] powerpc/mce: log the error for all unrecoverable errors
Date: Wed,  1 Feb 2023 15:29:33 +0530
Message-Id: <20230201095933.129482-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eQjd-Pu4zv1g_TmcUGWU9wXHPKH0v4Yg
X-Proofpoint-GUID: eQjd-Pu4zv1g_TmcUGWU9wXHPKH0v4Yg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_03,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=988 impostorscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010083
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For all unrecoverable errors we are missing to log the
error, Since machine_check_log_err() is not getting called
for unrecoverable errors. machine_check_log_err() is called
from deferred handler, To run deferred handlers we have to do
irq work raise from the exception handler.

For recoverable errors exception vector code takes care of
running deferred handlers.

For unrecoverable errors raise irq work in save_mce_event(),
So that we log the error from MCE deferred handler.

Log without this change

 MCE: CPU27: machine check (Severe)  Real address Load/Store (foreign/control memory) [Not recovered]
 MCE: CPU27: PID: 10580 Comm: inject-ra-err NIP: [0000000010000df4]
 MCE: CPU27: Initiator CPU
 MCE: CPU27: Unknown

Log with this change

 MCE: CPU24: machine check (Severe)  Real address Load/Store (foreign/control memory) [Not recovered]
 MCE: CPU24: PID: 1589811 Comm: inject-ra-err NIP: [0000000010000e48]
 MCE: CPU24: Initiator CPU
 MCE: CPU24: Unknown
 RTAS: event: 5, Type: Platform Error (224), Severity: 3

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
---
V3: Rephrasing the commit message.
---
 arch/powerpc/kernel/mce.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 6c5d30fba766..219f28637a3e 100644
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
 
@@ -233,9 +240,6 @@ static void machine_check_ue_event(struct machine_check_event *evt)
 	}
 	memcpy(&local_paca->mce_info->mce_ue_event_queue[index],
 	       evt, sizeof(*evt));
-
-	/* Queue work to process this event later. */
-	mce_irq_work_queue();
 }
 
 /*
-- 
2.39.1

