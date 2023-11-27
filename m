Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 173037F9C12
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 09:49:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZmXO14n7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SdzlZ6FSnz3cRt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 19:48:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZmXO14n7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sdzkh56WLz3bcJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 19:48:11 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AR71t71020032;
	Mon, 27 Nov 2023 08:48:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=eVNkdqNxZfot6iLTh8wftJAbMJwzWE74W3gGr4ce6Zw=;
 b=ZmXO14n7pk0TQF+zmcVYMrhQ+n5O3Es6vGAkdF3N5VGHCf31ZgyKyZQltChxejklnbQ6
 ZbMZP9/BY5i8HpDxEPPM1de4tdaistawcriv2mKD7ySWKIIbSEcOlaVuSw41DuKo34Cj
 YKdqKzu1u3CLym6Xu40FfPVfKOinw2k+hbpOwCviUaJ/Oanfe4FBAQKEe/P9DcWJ+AHJ
 8uX0P32chdFUchsVSm3T6kroJFar9Hwgfh6qwHzO+bzeP5xUfgIbMUqyYJ3V4UtEy8iQ
 jDyY5xp/HDOfW+7NDxTR7LkyZ0t8j3TeB3bf6KCpzLdkb1RYba14hZotr6ssM1dQdweH IA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3umgdp9r7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 08:48:02 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AR70XCJ021157;
	Mon, 27 Nov 2023 08:48:01 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3umgdp9r7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 08:48:01 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AR8JJhV016824;
	Mon, 27 Nov 2023 08:48:01 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ukv8n7crj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 08:48:01 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AR8lxjX22282810
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Nov 2023 08:47:59 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0348058067;
	Mon, 27 Nov 2023 08:47:59 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75B3D58063;
	Mon, 27 Nov 2023 08:47:57 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.67.85.162])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 27 Nov 2023 08:47:57 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/rtas: Create rtas_busy_sleep function
Date: Mon, 27 Nov 2023 00:47:52 -0800
Message-Id: <20231127084753.3827119-1-haren@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _urwV5v4ajwv6aM0JQp9R3ZEmUBJmvT7
X-Proofpoint-ORIG-GUID: _-pyf34rryJYMe3Zj1Z94-9xOXPCN1NU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_07,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0
 mlxlogscore=916 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311270060
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
Cc: nathanl@linux.ibm.com, Haren Myneni <haren@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the RTAS delay sleep code to new rtas_busy_sleep(). It can
be called from HCALL delay code that needs to support both usleep()
or msleep() depends on delay value.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h |  1 +
 arch/powerpc/kernel/rtas.c      | 56 ++++++++++++++++++---------------
 2 files changed, 32 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index c697c3c74694..b389351a0045 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -435,6 +435,7 @@ extern void rtas_get_rtc_time(struct rtc_time *rtc_time);
 extern int rtas_set_rtc_time(struct rtc_time *rtc_time);
 
 extern unsigned int rtas_busy_delay_time(int status);
+extern void rtas_busy_sleep(int value);
 bool rtas_busy_delay(int status);
 
 extern int early_init_dt_scan_rtas(unsigned long node,
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index eddc031c4b95..aa0bd7c4dcf1 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1250,6 +1250,36 @@ static bool __init rtas_busy_delay_early(int status)
 	return retry;
 }
 
+void rtas_busy_sleep(int value)
+{
+	unsigned int ms;
+
+	ms = rtas_busy_delay_time(value);
+	/*
+	 * The extended delay hint can be as high as 100 seconds.
+	 * Surely any function returning such a status is either
+	 * buggy or isn't going to be significantly slowed by us
+	 * polling at 1HZ. Clamp the sleep time to one second.
+	 */
+	ms = clamp(ms, 1U, 1000U);
+	/*
+	 * The delay hint is an order-of-magnitude suggestion, not
+	 * a minimum. It is fine, possibly even advantageous, for
+	 * us to pause for less time than hinted. For small values,
+	 * use usleep_range() to ensure we don't sleep much longer
+	 * than actually needed.
+	 *
+	 * See Documentation/timers/timers-howto.rst for
+	 * explanation of the threshold used here. In effect we use
+	 * usleep_range() for 9900 and 9901, msleep() for
+	 * 9902-9905.
+	 */
+	if (ms <= 20)
+		usleep_range(ms * 100, ms * 1000);
+	else
+		msleep(ms);
+}
+
 /**
  * rtas_busy_delay() - helper for RTAS busy and extended delay statuses
  *
@@ -1270,7 +1300,6 @@ static bool __init rtas_busy_delay_early(int status)
  */
 bool __ref rtas_busy_delay(int status)
 {
-	unsigned int ms;
 	bool ret;
 
 	/*
@@ -1282,30 +1311,7 @@ bool __ref rtas_busy_delay(int status)
 	switch (status) {
 	case RTAS_EXTENDED_DELAY_MIN...RTAS_EXTENDED_DELAY_MAX:
 		ret = true;
-		ms = rtas_busy_delay_time(status);
-		/*
-		 * The extended delay hint can be as high as 100 seconds.
-		 * Surely any function returning such a status is either
-		 * buggy or isn't going to be significantly slowed by us
-		 * polling at 1HZ. Clamp the sleep time to one second.
-		 */
-		ms = clamp(ms, 1U, 1000U);
-		/*
-		 * The delay hint is an order-of-magnitude suggestion, not
-		 * a minimum. It is fine, possibly even advantageous, for
-		 * us to pause for less time than hinted. For small values,
-		 * use usleep_range() to ensure we don't sleep much longer
-		 * than actually needed.
-		 *
-		 * See Documentation/timers/timers-howto.rst for
-		 * explanation of the threshold used here. In effect we use
-		 * usleep_range() for 9900 and 9901, msleep() for
-		 * 9902-9905.
-		 */
-		if (ms <= 20)
-			usleep_range(ms * 100, ms * 1000);
-		else
-			msleep(ms);
+		rtas_busy_sleep(status);
 		break;
 	case RTAS_BUSY:
 		ret = true;
-- 
2.26.3

