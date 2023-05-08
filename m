Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF526F9D94
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 04:03:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QF4MS3S43z3fNl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 12:03:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UiwNLsOy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UiwNLsOy;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QF4Kb33z0z3c9s
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 12:01:54 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 348102uw017665;
	Mon, 8 May 2023 02:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=sXajOJpKq8jxtnQttpjKbYnXvrF3M3ZkzttFFL9TAXI=;
 b=UiwNLsOyxfcaed98CkcE3lE55t4PRxgwzqDU9T/M/05iWP6NyEb+7Ko3TXd8As7FXHDK
 yEy3lj5F4CMjqcO+CPhP0FyYR+402aHzu93qqaGUDS9j6HWm3CFYjgD90T7SrWFrWp+o
 +jJq5D28K8Txt5O/+Kk7H+9VC5dNfJbI87FLUX9BnZjB3/tvVEjtDCtoXL7c8A5Pq59l
 LIno6x7uSVSgeKEYhWvnaUGP4a/FChbgKiLAL9BmloJwjU0KcX51BfBAMzz/MGo71b15
 aZyJyiDhXNI1z0Ch0QYRDkmcWfCKE/HsFPqbydZt7GHzlcQ8zOGY/1b/P0bSbUiNsvUy vw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qdm3139na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:01:43 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3481eNPF009193;
	Mon, 8 May 2023 02:01:42 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qdm3139mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:01:42 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3480dhL8030375;
	Mon, 8 May 2023 02:01:40 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3qdeh6gpgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:01:40 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34821c6j5505540
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 May 2023 02:01:38 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4918F20043;
	Mon,  8 May 2023 02:01:38 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB07E2004E;
	Mon,  8 May 2023 02:01:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 May 2023 02:01:37 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4E568605A5;
	Mon,  8 May 2023 12:01:35 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 04/12] asm-generic/mmiowb: Mark accesses to fix KCSAN warnings
Date: Mon,  8 May 2023 12:01:12 +1000
Message-Id: <20230508020120.218494-5-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230508020120.218494-1-rmclure@linux.ibm.com>
References: <20230508020120.218494-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RTKNhKV7DwAwOpasNHOWs101493OvhsI
X-Proofpoint-ORIG-GUID: N_vd80AdTKzx81U399P0Mz1blHbH64pa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-07_10,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=948 spamscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 mlxscore=0 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: arnd@arndb.de, npiggin@gmail.com, Rohan McLure <rmclure@linux.ibm.com>, Gautam Menghani <gautammenghani201@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Prior to this patch, data races are detectable by KCSAN of the following
forms:

[1] Asynchronous calls to mmiowb_set_pending() from an interrupt context
    or otherwise outside of a critical section
[2] Interrupted critical sections, where the interrupt will itself
    acquire a lock

In case [1], calling context does not need an mmiowb() call to be
issued, otherwise it would do so itself. Such calls to
mmiowb_set_pending() are either idempotent or no-ops.

In case [2], irrespective of when the interrupt occurs, the interrupt
will acquire and release its locks prior to its return, nesting_count
will continue balanced. In the worst case, the interrupted critical
section during a mmiowb_spin_unlock() call observes an mmiowb to be
pending and afterward is interrupted, leading to an extraneous call to
mmiowb(). This data race is clearly innocuous.

Mark all potentially asynchronous memory accesses with READ_ONCE or
WRITE_ONCE, including increments and decrements to nesting_count. This
has the effect of removing KCSAN warnings at consumer's callsites.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reported-by: Michael Ellerman <mpe@ellerman.id.au>
Reported-by: Gautam Menghani <gautammenghani201@gmail.com>
---
 include/asm-generic/mmiowb.h | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/include/asm-generic/mmiowb.h b/include/asm-generic/mmiowb.h
index 5698fca3bf56..0b8b794150db 100644
--- a/include/asm-generic/mmiowb.h
+++ b/include/asm-generic/mmiowb.h
@@ -35,27 +35,32 @@ DECLARE_PER_CPU(struct mmiowb_state, __mmiowb_state);
 static inline void mmiowb_set_pending(void)
 {
 	struct mmiowb_state *ms = __mmiowb_state();
+	u16 nesting_count = READ_ONCE(ms->nesting_count);
 
-	if (likely(ms->nesting_count))
-		ms->mmiowb_pending = ms->nesting_count;
+	if (likely(nesting_count))
+		WRITE_ONCE(ms->mmiowb_pending, nesting_count);
 }
 
 static inline void mmiowb_spin_lock(void)
 {
 	struct mmiowb_state *ms = __mmiowb_state();
-	ms->nesting_count++;
+
+	/* Increment need not be atomic. Nestedness is balanced over interrupts. */
+	WRITE_ONCE(ms->nesting_count, READ_ONCE(ms->nesting_count) + 1);
 }
 
 static inline void mmiowb_spin_unlock(void)
 {
 	struct mmiowb_state *ms = __mmiowb_state();
+	u16 pending = READ_ONCE(ms->mmiowb_pending);
 
-	if (unlikely(ms->mmiowb_pending)) {
-		ms->mmiowb_pending = 0;
+	WRITE_ONCE(ms->mmiowb_pending, 0);
+	if (unlikely(pending)) {
 		mmiowb();
 	}
 
-	ms->nesting_count--;
+	/* Decrement need not be atomic. Nestedness is balanced over interrupts. */
+	WRITE_ONCE(ms->nesting_count, READ_ONCE(ms->nesting_count) - 1);
 }
 #else
 #define mmiowb_set_pending()		do { } while (0)
-- 
2.37.2

