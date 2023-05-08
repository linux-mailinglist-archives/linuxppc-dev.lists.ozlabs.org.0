Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D046F9D93
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 04:02:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QF4LW34cPz3cgx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 12:02:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DXr0yixV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DXr0yixV;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QF4Kb2rjMz3c9V
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 12:01:54 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34820KlX025496;
	Mon, 8 May 2023 02:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+YiXo72W1fsQGrtZS7y3JLveH0LGnNFikH1BjPwsIs0=;
 b=DXr0yixVc82VrrclZRWiGpT7IdACWvisF6AB+a5U3yYcY9eaop/AxTvAFT07KNXQfjOw
 AFGyEpAt7tCA7kqp5+nmjjQOq7dKE/m1bnDC98ZpseL9ewp7z00hmSeQ7w09Ky1cH2YJ
 N9JcIHkwJzv0jkweZQoYERe80rvvWl+Md/zOeSopsQKexlt9LiW0TOD4x9E8TLX2B4DN
 jh+lHahb8M1Mt81ZpyLISi/AjN0C/dTo5NzUt05ykSE4IbFFaSZv+UoNDF4Dq46AkHhD
 dGWItQN/zhgTKP3yRz3jJ+JC4pMnbjDE7GzOXYGWuBM5Vo0XYMWNm1cT3tb8vljKB/h9 qQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qdka0vtsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:01:43 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3481ZNZM007808;
	Mon, 8 May 2023 02:01:42 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qdka0vtrs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:01:42 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3481X98w016336;
	Mon, 8 May 2023 02:01:40 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3qde5fgpj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:01:40 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34821cIf5505538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 May 2023 02:01:38 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 325F920040;
	Mon,  8 May 2023 02:01:38 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA4712004B;
	Mon,  8 May 2023 02:01:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 May 2023 02:01:37 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 43C2B60593;
	Mon,  8 May 2023 12:01:35 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 01/12] powerpc: qspinlock: Fix qnode->locked value interpretation
Date: Mon,  8 May 2023 12:01:09 +1000
Message-Id: <20230508020120.218494-2-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230508020120.218494-1-rmclure@linux.ibm.com>
References: <20230508020120.218494-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: V5L0DOQoKqy8ydLqq0FOxiWsvHGcn1lK
X-Proofpoint-ORIG-GUID: O1QdXCtfF48cbGGCCGoI-AwnCfKjROWZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-07_10,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 mlxlogscore=908
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305080009
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

A comment accompanying the locked attribute of a qnode assigns a value
of 1 to mean that the lock has been acquired. The usages of this
variable however assume opposite semantics. Update usages so that the
assertions of this comment are reflected in this file.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
 arch/powerpc/lib/qspinlock.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index e4bd145255d0..9cf93963772b 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -435,7 +435,7 @@ static __always_inline bool yield_to_prev(struct qspinlock *lock, struct qnode *
 
 	smp_rmb(); /* See __yield_to_locked_owner comment */
 
-	if (!node->locked) {
+	if (node->locked) {
 		yield_to_preempted(prev_cpu, yield_count);
 		spin_begin();
 		return preempted;
@@ -566,7 +566,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	node->lock = lock;
 	node->cpu = smp_processor_id();
 	node->yield_cpu = -1;
-	node->locked = 0;
+	node->locked = 1;
 
 	tail = encode_tail_cpu(node->cpu);
 
@@ -584,7 +584,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 
 		/* Wait for mcs node lock to be released */
 		spin_begin();
-		while (!node->locked) {
+		while (node->locked) {
 			spec_barrier();
 
 			if (yield_to_prev(lock, node, old, paravirt))
@@ -693,13 +693,13 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	 */
 	if (paravirt && pv_prod_head) {
 		int next_cpu = next->cpu;
-		WRITE_ONCE(next->locked, 1);
+		WRITE_ONCE(next->locked, 0);
 		if (_Q_SPIN_MISO)
 			asm volatile("miso" ::: "memory");
 		if (vcpu_is_preempted(next_cpu))
 			prod_cpu(next_cpu);
 	} else {
-		WRITE_ONCE(next->locked, 1);
+		WRITE_ONCE(next->locked, 0);
 		if (_Q_SPIN_MISO)
 			asm volatile("miso" ::: "memory");
 	}
-- 
2.37.2

