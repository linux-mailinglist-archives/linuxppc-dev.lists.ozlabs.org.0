Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB72B6FD44B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 05:33:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGLGD4XJcz3fZ9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 13:33:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ub1xWV7O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ub1xWV7O;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGLDP505xz306l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 13:31:49 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34A3S1nn009939;
	Wed, 10 May 2023 03:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=c5KYN5omqe0+gPf4MlUGkZyFRGHw1nix6p2Wce9lw70=;
 b=Ub1xWV7Or/+G60CIyRVRG53uZKOL7WmQ7JGnjozZUgFovQNbPE16eCQ8nt4Z8IWQxrRf
 wLw3bLjqhRIuKXnK+s1YpDORZ8LU3RLTZfyVq6An7YtC2FkBuvmRf6hLpbguvwvhwusS
 NrgkPTPDiM4rEsqpmBH8t9jF+iVsUR8/y7jbXfCIDg+u+ZyBaaEQb8d03qARLx1Rz1OI
 wLhao0BwaaIXrdMwjvdor6NkGUpdmmYtVxHvQJluO2Iu/Ev0jUuI14uLATj07rpMv9eY
 5UTa1uXMxsfIETjuG0aaMoO4Z5eDZNQYEz0V5DSBsay2rourDGayhy26jtJP+p4vSZQ3 XQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg29wsp68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:38 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34A3KKno021301;
	Wed, 10 May 2023 03:31:37 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg29wsp5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:37 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 349N0lwN016041;
	Wed, 10 May 2023 03:31:36 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3qf84e8s7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:35 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34A3VXLR31130254
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 May 2023 03:31:33 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80F7520049;
	Wed, 10 May 2023 03:31:33 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0020320040;
	Wed, 10 May 2023 03:31:32 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 May 2023 03:31:32 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0206560595;
	Wed, 10 May 2023 13:31:30 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 02/11] powerpc: qspinlock: Enforce qnode writes prior to publishing to queue
Date: Wed, 10 May 2023 13:31:08 +1000
Message-Id: <20230510033117.1395895-3-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230510033117.1395895-1-rmclure@linux.ibm.com>
References: <20230510033117.1395895-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ebTIjTTNQcuHuaCPlfVqYmvUrLebmF77
X-Proofpoint-ORIG-GUID: 4n9BxQgM279amSSJUDwL_4opzkacYEkY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_16,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=883
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

Annotate the release barrier and memory clobber (in effect, producing a
compiler barrier) in the publish_tail_cpu call. These barriers have the
effect of ensuring that qnode attributes are all written to prior to
publish the node to the waitqueue.

Even while the initial write to the 'locked' attribute is guaranteed to
terminate prior to the node being visible, KCSAN still complains that
the write is reorderable by the compiler. Issue a kcsan_release() to
inform KCSAN of the release barrier contained in publish_tail_cpu().

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
v2: Remove extraneous compiler barrier, but annotate release-barrier
contained in call publish_tail_cpu(), and include kcsan_release().
---
 arch/powerpc/lib/qspinlock.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index b76c1f6acce5..253620979d0c 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -161,6 +161,8 @@ static __always_inline u32 publish_tail_cpu(struct qspinlock *lock, u32 tail)
 {
 	u32 prev, tmp;
 
+	kcsan_release();
+
 	asm volatile(
 "\t"	PPC_RELEASE_BARRIER "						\n"
 "1:	lwarx	%0,0,%2		# publish_tail_cpu			\n"
@@ -570,6 +572,11 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 
 	tail = encode_tail_cpu(node->cpu);
 
+	/*
+	 * Assign all attributes of a node before it can be published.
+	 * Issues an lwsync, serving as a release barrier, as well as a
+	 * compiler barrier.
+	 */
 	old = publish_tail_cpu(lock, tail);
 
 	/*
-- 
2.37.2

