Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 252257F98E8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 06:49:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dj4qDBcy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sdvm20Vv5z3cXJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 16:49:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dj4qDBcy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sdvl65Qf4z3c5P
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 16:48:18 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AR3Fj1w004565;
	Mon, 27 Nov 2023 05:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=603hAX+QlJNAjs5x6UvJ5E/hZ7ChBCwi+rQPDR9Zgxs=;
 b=dj4qDBcyxQhhaYNP9+XYJ/iXl2SCJRVmJMbnwSJuFRTqDqZKxTKHx9QBUWo9Ka0R5fJU
 1SIc27jtl3DpGLGg9mcgtfghB/A1BkZhqBn+yqn9yHVi+icxMIFav2/lttl+S18oKl4p
 UvpGOQOGwJm6Lr7ehg1y9m/aqaEM0AUrceSAUOhN/ZuWDio/brMRX9hF75yoqaYuFxcl
 /kG0U/V6SpeWADq5DFDAHv0yES+fLcRtVGn0+Atjog45dDL1oytQoH0OiktJILzrNeaK
 eL1riJaR0AlMZ7wyXG2CpSZb8c6OoRuPu+uejq/TxR3SkRJQiuLXsj5gtfMsLHgnLQHA Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ukrbb2njy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 05:47:55 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AR5OjU7009518;
	Mon, 27 Nov 2023 05:47:55 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ukrbb2nje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 05:47:55 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AR44EKu013735;
	Mon, 27 Nov 2023 05:47:53 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ukvrk6fq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 05:47:53 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AR5lp9O10093058
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Nov 2023 05:47:51 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F0B220067;
	Mon, 27 Nov 2023 05:47:51 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0BDE20063;
	Mon, 27 Nov 2023 05:47:50 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 27 Nov 2023 05:47:50 +0000 (GMT)
Received: from socotra.ibm.com (unknown [9.177.95.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5F1156030B;
	Mon, 27 Nov 2023 16:47:45 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] asm-generic/mmiowb: Mark accesses to fix KCSAN warnings
Date: Mon, 27 Nov 2023 16:46:45 +1100
Message-ID: <20231127054648.1205221-2-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JoqAe_INKR8gYxTud9ZZDa8boAmj5PJz
X-Proofpoint-GUID: fEIiC46RUX2AIwzR7Hf-4F65T81nh_b9
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_03,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=589 clxscore=1011 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311270039
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
Cc: elver@google.com, arnd@arndb.de, gautam@linux.ibm.com, Rohan McLure <rmclure@linux.ibm.com>, npiggin@gmail.com, will@kernel.org
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

Resolve KCSAN warnings of type [1] by means of READ_ONCE, WRITE_ONCE.
As increments and decrements to nesting_count are balanced by interrupt
contexts, resolve type [2] warnings by simply revoking instrumentation,
with data_race() rather than READ_ONCE() and WRITE_ONCE(), the memory
consistency semantics of plain-accesses will still lead to correct
behaviour.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reported-by: Michael Ellerman <mpe@ellerman.id.au>
Reported-by: Gautam Menghani <gautam@linux.ibm.com>
Tested-by: Gautam Menghani <gautam@linux.ibm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
Previously discussed here:
https://lore.kernel.org/linuxppc-dev/20230510033117.1395895-4-rmclure@linux.ibm.com/
But pushed back due to affecting other architectures. Reissuing, to
linuxppc-dev, as it does not enact a functional change.
---
 include/asm-generic/mmiowb.h | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/include/asm-generic/mmiowb.h b/include/asm-generic/mmiowb.h
index 5698fca3bf56..f8c7c8a84e9e 100644
--- a/include/asm-generic/mmiowb.h
+++ b/include/asm-generic/mmiowb.h
@@ -37,25 +37,28 @@ static inline void mmiowb_set_pending(void)
 	struct mmiowb_state *ms = __mmiowb_state();
 
 	if (likely(ms->nesting_count))
-		ms->mmiowb_pending = ms->nesting_count;
+		WRITE_ONCE(ms->mmiowb_pending, ms->nesting_count);
 }
 
 static inline void mmiowb_spin_lock(void)
 {
 	struct mmiowb_state *ms = __mmiowb_state();
-	ms->nesting_count++;
+
+	/* Increment need not be atomic. Nestedness is balanced over interrupts. */
+	data_race(ms->nesting_count++);
 }
 
 static inline void mmiowb_spin_unlock(void)
 {
 	struct mmiowb_state *ms = __mmiowb_state();
+	u16 pending = READ_ONCE(ms->mmiowb_pending);
 
-	if (unlikely(ms->mmiowb_pending)) {
-		ms->mmiowb_pending = 0;
+	WRITE_ONCE(ms->mmiowb_pending, 0);
+	if (unlikely(pending))
 		mmiowb();
-	}
 
-	ms->nesting_count--;
+	/* Decrement need not be atomic. Nestedness is balanced over interrupts. */
+	data_race(ms->nesting_count--);
 }
 #else
 #define mmiowb_set_pending()		do { } while (0)
-- 
2.43.0

