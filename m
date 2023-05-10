Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 152E56FD44C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 05:34:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGLH875SDz3fLk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 13:34:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D8n+DxFX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D8n+DxFX;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGLDP5L8zz30Qg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 13:31:49 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34A3C3ke030263;
	Wed, 10 May 2023 03:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=PN4E3BXvcN9JljeJiuqCcs+HAwtMeyRYZVNNGAmLwy8=;
 b=D8n+DxFXIl9Q9bKgQYzNDZQTYewg4ZGvfsaUrKxfEvviz4BkQATzJ9dXJgU9GsLci3ZG
 77MnDOLRJ6NDlGHB9uvwSvU0pdmoqyBYiFsWC9I6DA/20J+HnfQKbky2gWhgIatEmRiY
 vTNBAPYbyAW/fc/CLyzWWK+fF5o4fGk4mHCsF9H2Xpw1vTOYPr7GHHV+NpFwZqysw1b8
 d2/mOy4yWRNIcyyMjBR07EB9o5XQKg20/GKTLe7FoDNho+a9FpwnEvYJ6X54tSOUATMK
 ODYRLSdLdAWjf90TCVciR4MHmqbNUUoXNRXEXzwhRtbebSgGvlTMAn2OwB7TSys/gzfv 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg29wsp6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:40 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34A3VeCh019315;
	Wed, 10 May 2023 03:31:40 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg29wsp6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:40 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 349Nij6N017430;
	Wed, 10 May 2023 03:31:38 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3qf84e8s7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:38 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34A3VZvi3539660
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 May 2023 03:31:36 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D5B5E20040;
	Wed, 10 May 2023 03:31:35 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59BFF2004E;
	Wed, 10 May 2023 03:31:35 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 May 2023 03:31:35 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 20767605B2;
	Wed, 10 May 2023 13:31:30 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 10/11] powerpc: powernv: Annotate asynchronous access to opal tokens
Date: Wed, 10 May 2023 13:31:16 +1000
Message-Id: <20230510033117.1395895-11-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230510033117.1395895-1-rmclure@linux.ibm.com>
References: <20230510033117.1395895-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6DxGhbLw7OV5MG_QwTY3FKHg2a2BWuHH
X-Proofpoint-ORIG-GUID: sJVUlo8jP8IKgdLRePp8Ui63LjhYc37M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_16,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305100021
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
Cc: arnd@arndb.de, gautam@linux.ibm.com, npiggin@gmail.com, Rohan McLure <rmclure@linux.ibm.com>
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

