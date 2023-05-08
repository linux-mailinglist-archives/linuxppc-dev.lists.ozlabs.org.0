Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D97D6F9DA4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 04:10:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QF4WR3MKpz3fWj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 12:10:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b5d5vTue;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b5d5vTue;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QF4Lf51L9z3cTk
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 12:02:50 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3481tmLd007073;
	Mon, 8 May 2023 02:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=PN4E3BXvcN9JljeJiuqCcs+HAwtMeyRYZVNNGAmLwy8=;
 b=b5d5vTueqoqJTLCPlqt89babdxKJpZJMSwfLg0atIENY5KAhWs6f8z9AIZpL5jCuLVRX
 B7AcKnmZymQLzy1efejol63YbuANczqhrxGslPXYBEgEdKLx7yloNX+5g+oNiVpIlkGa
 RZRdI14MDuwfTdxUqiPC62m9MgABTjaHRNRA/cGUFjWRROZLCsIvR4p/9xwCE4EIxMPd
 NDh4vGgHqxg9YEuGPxDyq/PIZXxM29qj2KaVopSTZTD198hITjmQstZyKzIjqxAtRtn4
 O7sAGFyCc+zjqQcc9n4M9+5E3BJv0Zfc0jZ96/9LjR7I3sri5eyh26o5YqyebFz72teC IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qequag4gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:02:40 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3481wMqt012558;
	Mon, 8 May 2023 02:02:35 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qequag3n9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:02:34 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3480vVmg013366;
	Mon, 8 May 2023 02:01:43 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3qdeh68txk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:01:42 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34821eMT5702152
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 May 2023 02:01:40 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F4482005A;
	Mon,  8 May 2023 02:01:40 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 234522004B;
	Mon,  8 May 2023 02:01:40 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 May 2023 02:01:40 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 65B746060A;
	Mon,  8 May 2023 12:01:35 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 11/12] powerpc: powernv: Annotate asynchronous access to opal tokens
Date: Mon,  8 May 2023 12:01:19 +1000
Message-Id: <20230508020120.218494-12-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230508020120.218494-1-rmclure@linux.ibm.com>
References: <20230508020120.218494-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pw5Ad5v3A6QSth539JY25IwEZjebUFw2
X-Proofpoint-GUID: zpF284ZQPe7Mteqi6iromdO6RRoRxucv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-07_10,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305080012
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, npiggin@gmail.com, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The opal-async.c unit contains code for polling event sources, which
implies intentional data races. Ensure that the compiler will atomically
access such variables by means of {READ,WRITE}_ONCE calls, which in turn
inform KCSAN that polling behaviour is intended.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/opal-async.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-async.c b/arch/powerpc/platforms/powernv/opal-async.c
index c094fdf5825c..282d2ac6fbb0 100644
--- a/arch/powerpc/platforms/powernv/opal-async.c
+++ b/arch/powerpc/platforms/powernv/opal-async.c
@@ -146,7 +146,7 @@ int opal_async_wait_response(uint64_t token, struct opal_msg *msg)
 	 * functional.
 	 */
 	opal_wake_poller();
-	wait_event(opal_async_wait, opal_async_tokens[token].state
+	wait_event(opal_async_wait, READ_ONCE(opal_async_tokens[token].state)
 			== ASYNC_TOKEN_COMPLETED);
 	memcpy(msg, &opal_async_tokens[token].response, sizeof(*msg));
 
@@ -185,7 +185,7 @@ int opal_async_wait_response_interruptible(uint64_t token, struct opal_msg *msg)
 	 * interruptible version before doing anything else with the
 	 * token.
 	 */
-	if (opal_async_tokens[token].state == ASYNC_TOKEN_ALLOCATED) {
+	if (READ_ONCE(opal_async_tokens[token].state) == ASYNC_TOKEN_ALLOCATED) {
 		spin_lock_irqsave(&opal_async_comp_lock, flags);
 		if (opal_async_tokens[token].state == ASYNC_TOKEN_ALLOCATED)
 			opal_async_tokens[token].state = ASYNC_TOKEN_DISPATCHED;
@@ -199,7 +199,7 @@ int opal_async_wait_response_interruptible(uint64_t token, struct opal_msg *msg)
 	 */
 	opal_wake_poller();
 	ret = wait_event_interruptible(opal_async_wait,
-			opal_async_tokens[token].state ==
+			READ_ONCE(opal_async_tokens[token].state) ==
 			ASYNC_TOKEN_COMPLETED);
 	if (!ret)
 		memcpy(msg, &opal_async_tokens[token].response, sizeof(*msg));
-- 
2.37.2

