Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BA46FD478
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 05:38:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGLN61Xmvz3fmF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 13:38:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nsTVjWP5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nsTVjWP5;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGLDg6Pfwz3cG1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 13:32:03 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34A3OtPk013691;
	Wed, 10 May 2023 03:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=X5PbnuWfxrXONDL2GfdKuU0G8S7upFEeb38iREZgtSg=;
 b=nsTVjWP5/FkZBOKOkoLIAHcLeKeJuL2gQ5wDk5H/1BQgMU17zK2Z1wqE89RlSECdi5jk
 Uf9XUTGL62bRQQWkEltOP+KDxEDGvARkEZMZr7IU6Ew8rgq2LDrb8aM+u5cc6TP9sJDe
 3Y/kcpvC6Miz0JSyMp4lH68d/DhRcRDDdrQaZbyx6iMt/N3b5FPmvLyjP8iYuZM5p5HB
 vl3c4t2QQOes/eFdMNsnHY9goxJRGqmvznt9sSAmraKSyDbslFww/nHl6xK+ZhKn1xNs
 ZmoEcr4TDm//gmn3lKk4MO0dMYh+U3LXgdI7JBpwVEjubstInw+xIzXwAHDn2nEXv5t7 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg3b4r39j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:38 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34A3TH09025715;
	Wed, 10 May 2023 03:31:37 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg3b4r392-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:37 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 349MNsrl011329;
	Wed, 10 May 2023 03:31:36 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3qf7dg0n63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:35 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34A3VX8O18612778
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 May 2023 03:31:33 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 68F4F2004E;
	Wed, 10 May 2023 03:31:33 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1A3720043;
	Wed, 10 May 2023 03:31:32 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 May 2023 03:31:32 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 05C966059A;
	Wed, 10 May 2023 13:31:30 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 03/11] asm-generic/mmiowb: Mark accesses to fix KCSAN warnings
Date: Wed, 10 May 2023 13:31:09 +1000
Message-Id: <20230510033117.1395895-4-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230510033117.1395895-1-rmclure@linux.ibm.com>
References: <20230510033117.1395895-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Mbdpk-JroTvX-Jtzl22SoqydY1bIim1x
X-Proofpoint-GUID: GB6-k8IlB_mVcin_4yPI5CIk_EYmDITr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_16,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 malwarescore=0 mlxlogscore=936 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100021
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
Reported-by: Gautam Menghani <gautam@linux.ibm.com>
Tested-by: Gautam Menghani <gautam@linux.ibm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
v2: Remove extraneous READ_ONCE in mmiowb_set_pending for nesting_count
---
 include/asm-generic/mmiowb.h | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/asm-generic/mmiowb.h b/include/asm-generic/mmiowb.h
index 5698fca3bf56..6dea28c8835b 100644
--- a/include/asm-generic/mmiowb.h
+++ b/include/asm-generic/mmiowb.h
@@ -37,25 +37,29 @@ static inline void mmiowb_set_pending(void)
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

