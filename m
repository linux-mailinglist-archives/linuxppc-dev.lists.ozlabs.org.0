Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EEA6FD47E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 05:41:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGLRy6DtGz3fqX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 13:41:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qkrlY3S6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qkrlY3S6;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGLLV3fxdz3fDv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 13:37:06 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34A3QkMr005716;
	Wed, 10 May 2023 03:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Zu7YVnuQglASwhJ1EThDDJ7FQrAEyoF8c40akKemx70=;
 b=qkrlY3S6JxB0nCbKJjX64m3tP3yYOFS9CbeBCQZMoUrnBH+kPs8pzZtR6vP6SQYg/H/1
 KIPWw0fdynM5ZedLSr/gzVmRjpurCWkzX29n9Y/mw9wSKaEpdtxZSWolmIPcyw4MGyc9
 QQOXqaNoQiZj7/fDSbTa0DqF8EAHkT7ZdZV1cYPXfBQQy0eVsfN9uZgRshdpXGVAA6iE
 K78+XnQWkriLqTGV+eV25HGWoBvZxIE+wGtoBIPbPX/OkcUs4pS50dqv+Aeg6+8pZ7Bn
 n2tFch7tLyScm3Zzc6zO9I585aegmJ8CPoctk/NXgChuMgRvhXVevXwJNvojvlBZxL1s gw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg3ccr325-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:36:57 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34A3auSW028897;
	Wed, 10 May 2023 03:36:56 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg3ccr1r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:36:56 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34A3KOPw018561;
	Wed, 10 May 2023 03:31:38 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3qf7nh0s7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:38 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34A3Vab943712780
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 May 2023 03:31:36 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBD592004E;
	Wed, 10 May 2023 03:31:35 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6BFB120043;
	Wed, 10 May 2023 03:31:35 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 May 2023 03:31:35 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 1D36F605F2;
	Wed, 10 May 2023 13:31:30 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 09/11] powerpc: powernv: Annotate data races in opal events
Date: Wed, 10 May 2023 13:31:15 +1000
Message-Id: <20230510033117.1395895-10-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230510033117.1395895-1-rmclure@linux.ibm.com>
References: <20230510033117.1395895-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: R7qAj13k7g58rhcc85ct0f1q9SIFcR4-
X-Proofpoint-ORIG-GUID: EqSt7Nsie4hHM1rhn2pr8mKQEcjz4Be0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_16,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100026
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

The kopald thread handles opal events as they appear, but by polling a
static bit-vector in last_outstanding_events. Annotate these data races
accordingly. We are not at risk of missing events, but use of READ_ONCE,
WRITE_ONCE will assist readers in seeing that kopald only consumes the
events it is aware of when it is scheduled. Also removes extraneous
KCSAN warnings.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/powernv/opal-irqchip.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-irqchip.c b/arch/powerpc/platforms/powernv/opal-irqchip.c
index d55652b5f6fa..f9a7001dacb7 100644
--- a/arch/powerpc/platforms/powernv/opal-irqchip.c
+++ b/arch/powerpc/platforms/powernv/opal-irqchip.c
@@ -59,7 +59,7 @@ void opal_handle_events(void)
 
 		cond_resched();
 	}
-	last_outstanding_events = 0;
+	WRITE_ONCE(last_outstanding_events, 0);
 	if (opal_poll_events(&events) != OPAL_SUCCESS)
 		return;
 	e = be64_to_cpu(events) & opal_event_irqchip.mask;
@@ -69,7 +69,7 @@ void opal_handle_events(void)
 
 bool opal_have_pending_events(void)
 {
-	if (last_outstanding_events & opal_event_irqchip.mask)
+	if (READ_ONCE(last_outstanding_events) & opal_event_irqchip.mask)
 		return true;
 	return false;
 }
@@ -124,7 +124,7 @@ static irqreturn_t opal_interrupt(int irq, void *data)
 	__be64 events;
 
 	opal_handle_interrupt(virq_to_hw(irq), &events);
-	last_outstanding_events = be64_to_cpu(events);
+	WRITE_ONCE(last_outstanding_events, be64_to_cpu(events));
 	if (opal_have_pending_events())
 		opal_wake_poller();
 
-- 
2.37.2

