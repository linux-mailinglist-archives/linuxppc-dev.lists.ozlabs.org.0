Return-Path: <linuxppc-dev+bounces-10402-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F064B119A1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jul 2025 10:15:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bpLK82DQPz3bTf;
	Fri, 25 Jul 2025 18:15:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753431324;
	cv=none; b=hb7XY1kUiYuPoLgeZUiFLGbHRnc3c9NI99SluBzRY5mbQ6xnMnsEd6e43lmm33Efen+iL8ViuCyn3zJ1K6x6chJGFBYIqNdzWJtpy2D6o0xyLlRAnrPZQRPncaeW2TwQG5zjb5fPejsfZouAsWRDSx6dwLMtSzfqqNlzi+mEOkY1K11m+820Yk38LDMcmrhE3j9B0656uYFFQAtUoVIrR7khm5nbiAOu+IaakU72Xo+rujetJDoZd8UU/yqGMW7KMfYSqrfe449AutE5zTZegqVnkd273lO667wTmwFZK8VL+SBuvo0vOCs1fb6x4LgHHtlT9rxlDvfqkKWL0XYN2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753431324; c=relaxed/relaxed;
	bh=ZSmnX7khMXwKWAfmtOacIRiPIxAbcOkrTQnl60docaY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W0riaazogNuq6KcA64IJkyXkNV6QmSWPbeBwqDfpLEvOtacAKII1P/3xXCS7KBRqHJv6laYTGJNQcGQRe1haxWbzKeujJOsao8e1xEDeata50vVfhyMvh2fNqsxqUtVFrEBWrXBnMTpMjEvA7N1utvlz06q4gxoL8tbvk+7Tj7yIqbEl9SBnf1u+FzTWeIcDZ44PBiL9XNr6APVpe5XwjPFhAAy/Ryknuf+dy4xTlqefoeA1u37tTsCQKSl6fUN8uJQeIk52yMHLG3bKcLgwVQRF/hrjtG7jaDQNy45NH/D8bGP12PLdaqjXb63Q0tnxK4BMo0IZ7Jba3N/nLhJtLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UUm6SvTI; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UUm6SvTI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bpLK62wcxz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jul 2025 18:15:21 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OMAFFb005318;
	Fri, 25 Jul 2025 08:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=ZSmnX7khMXwKWAfmtOacIRiPIxAbcOkrTQnl60doc
	aY=; b=UUm6SvTIV1tde63nj9EANrWdu+hNGCUNo79uFuy/SUlI206ISzuN2m6cG
	v1hFdMZPQrPLM2eQPFMsjFBqeI/3cTwVTyhotw1aTJDEAttt16TcuiH0uEv4DddH
	U1njM1X0jSMscHvtKWQ7pQ4kF3GyGkU9J5QvI0VPpYRSgeOD50XlIc+o4GLFKDBA
	L+y+QfPBtFWNE6Qd3Ohls+wGPp10VIZOVj2NjNIclnkl3axHGZGdXuad0u7M3GMJ
	sfzpo84vyTICaLyhSXgOKj1A+Jx9QemNlMm1R5RC+N/XGrZyDSBEm2MGtKZOda9x
	L/aBGSZg5AgBj9/N/KmeDlmUN2FDQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 483wcjsvrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Jul 2025 08:15:08 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 56P8E6Lp014123;
	Fri, 25 Jul 2025 08:15:06 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 483wcjsvrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Jul 2025 08:15:06 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56P5ELcZ024761;
	Fri, 25 Jul 2025 08:15:05 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 480rd2rc9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Jul 2025 08:15:05 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56P8F1C144106070
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Jul 2025 08:15:01 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C116720040;
	Fri, 25 Jul 2025 08:15:01 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C7DF20043;
	Fri, 25 Jul 2025 08:14:59 +0000 (GMT)
Received: from li-80eaad4c-2afd-11b2-a85c-af8123d033e3.ibm.com.com (unknown [9.124.210.185])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Jul 2025 08:14:58 +0000 (GMT)
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: "Nysal Jan K.A." <nysal@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/qspinlock: Add spinlock contention tracepoint
Date: Fri, 25 Jul 2025 13:44:29 +0530
Message-ID: <20250725081432.1254986-1-nysal@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XsA2Me7NclVqswZ3TJb4Ko2Fp2Yh-r_J
X-Proofpoint-ORIG-GUID: dR7AGs8NJV7cqySRA1zDtwt_K5Ww28N1
X-Authority-Analysis: v=2.4 cv=QOloRhLL c=1 sm=1 tr=0 ts=68833d0c cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=FRJ3dP_dh1OrdgN2pXUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA2OCBTYWx0ZWRfX89DQEopr3HIc
 jIcvoB6GtgDZiP7FluDKzv8QvEtqzm4g5MczF2c/utQ6NS0eW0If8UXy7vcf0UQczesaUvgFGdY
 olsAsCPn9CqWFjJFQbYXfn4nCRjfhyMtFTsn3HrpXtzdQB+OIRCLD3merIcXzBh0GcdP/WZyw0f
 B1PXUSwy80ad1xQNZW0Eex9OAYskyLvXHG3qg1uA3EYSUxkGeA2QcvDGWgGlJQNFl2E0dVHGpwC
 amsCWDwAxWvg4DfvTJG6IKpAJBArgSO006Cd49Oh3tOE780SGL9a01Iye28TjzYgzw1qgbaE+Mf
 VjqUEBMJzGA23eoiTE8HUfKHRDw/wUD7jxqUqUuVbpLXQiXE13bssjZ2TLXW7B1CktkG2iEvXLl
 JApn3NxUsOoNmHu24hBbNfOirYTbSHhpWoTC15YoSzKMVbLaPB1xQVWHEgwzd+2Yx+MjKPQJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 mlxscore=0 impostorscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250068
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add a lock contention tracepoint in the queued spinlock slowpath.
Also add the __lockfunc annotation so that in_lock_functions()
works as expected.

Signed-off-by: Nysal Jan K.A. <nysal@linux.ibm.com>
---
 arch/powerpc/lib/qspinlock.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index bcc7e4dff8c3..622e7f45c2ce 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -9,6 +9,7 @@
 #include <linux/sched/clock.h>
 #include <asm/qspinlock.h>
 #include <asm/paravirt.h>
+#include <trace/events/lock.h>
 
 #define MAX_NODES	4
 
@@ -708,8 +709,9 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	qnodesp->count--;
 }
 
-void queued_spin_lock_slowpath(struct qspinlock *lock)
+void __lockfunc queued_spin_lock_slowpath(struct qspinlock *lock)
 {
+	trace_contention_begin(lock, LCB_F_SPIN);
 	/*
 	 * This looks funny, but it induces the compiler to inline both
 	 * sides of the branch rather than share code as when the condition
@@ -718,16 +720,17 @@ void queued_spin_lock_slowpath(struct qspinlock *lock)
 	if (IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS) && is_shared_processor()) {
 		if (try_to_steal_lock(lock, true)) {
 			spec_barrier();
-			return;
+		} else {
+			queued_spin_lock_mcs_queue(lock, true);
 		}
-		queued_spin_lock_mcs_queue(lock, true);
 	} else {
 		if (try_to_steal_lock(lock, false)) {
 			spec_barrier();
-			return;
+		} else {
+			queued_spin_lock_mcs_queue(lock, false);
 		}
-		queued_spin_lock_mcs_queue(lock, false);
 	}
+	trace_contention_end(lock, 0);
 }
 EXPORT_SYMBOL(queued_spin_lock_slowpath);
 
-- 
2.47.0


