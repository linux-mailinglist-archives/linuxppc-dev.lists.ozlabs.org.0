Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6910886B443
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 17:11:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FE13DZ76;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlK930568z3dWc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 03:11:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FE13DZ76;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlK8G4LDNz30NY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 03:10:38 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41SG00j7011011;
	Wed, 28 Feb 2024 16:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=lFzZ+uKK9jWdHGRqBfOIQfaRRz7nH+OApMLXZqmSw38=;
 b=FE13DZ76EJt6cOMeazEmd3luq6vjhV1izqWqqFILHjRq7J+wPBPkU41f7W/i/duxxU6O
 F2SyR82gdgLu5XjEBovjTiT3myUYOwsML3tqYv8baQLPqhXVU71w3B4e+MlaZ0zBUrYu
 V+3Cad3XXKgLGF1i5hT0AUODMncaYo4+4Akv+GAU5+2REpdRhXCakcyHb8FVXBdyeXaU
 Thlx5qYEh3ORDsYFaNZbK4MGXqWmcLD0jpAfmRk9Z4c7clnFtjpdebhdAkZLeW8Gq/q7
 7wZHpZGxMpc/e6QzHbpH5qkgE3AxYap9ckUrFD+b5XCFXVv+eXhnYdQciZuMwVSUPGhx Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wj7ybge9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 16:10:25 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41SFxwRa010832;
	Wed, 28 Feb 2024 16:10:25 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wj7ybge9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 16:10:25 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41SDe9qQ008782;
	Wed, 28 Feb 2024 16:10:24 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wftstqkd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 16:10:24 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41SGAKGt28574014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Feb 2024 16:10:22 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80D3C2005A;
	Wed, 28 Feb 2024 16:10:20 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3FF9D2004F;
	Wed, 28 Feb 2024 16:10:20 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.171.184.61])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 Feb 2024 16:10:20 +0000 (GMT)
From: Tobias Huschle <huschle@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC] sched/eevdf: sched feature to dismiss lag on wakeup
Date: Wed, 28 Feb 2024 17:10:18 +0100
Message-Id: <20240228161018.14253-1-huschle@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: U_5Hm9dPXdMRVcUqEwgF8Jr34BZT4MAW
X-Proofpoint-ORIG-GUID: htKPM3LVBjGR6p1vhcpzqx_CsnXtnahg
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_08,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 clxscore=1011
 suspectscore=0 phishscore=0 impostorscore=0 mlxscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2402280126
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
Cc: juri.lelli@redhat.com, vschneid@redhat.com, vincent.guittot@linaro.org, srikar@linux.vnet.ibm.com, peterz@infradead.org, sshegde@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org, bsegall@google.com, mingo@redhat.com, mgorman@suse.de, bristot@redhat.com, dietmar.eggemann@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The previously used CFS scheduler gave tasks that were woken up an
enhanced chance to see runtime immediately by deducting a certain value
from its vruntime on runqueue placement during wakeup.

This property was used by some, at least vhost, to ensure, that certain
kworkers are scheduled immediately after being woken up. The EEVDF
scheduler, does not support this so far. Instead, if such a woken up
entitiy carries a negative lag from its previous execution, it will have
to wait for the current time slice to finish, which affects the
performance of the process expecting the immediate execution negatively.

To address this issue, implement EEVDF strategy #2 for rejoining
entities, which dismisses the lag from previous execution and allows
the woken up task to run immediately (if no other entities are deemed
to be preferred for scheduling by EEVDF).

The vruntime is decremented by an additional value of 1 to make sure,
that the woken up tasks gets to actually run. This is of course not
following strategy #2 in an exact manner but guarantees the expected
behavior for the scenario described above. Without the additional
decrement, the performance goes south even more. So there are some
side effects I could not get my head around yet.

Questions:
1. The kworker getting its negative lag occurs in the following scenario
   - kworker and a cgroup are supposed to execute on the same CPU
   - one task within the cgroup is executing and wakes up the kworker
   - kworker with 0 lag, gets picked immediately and finishes its
     execution within ~5000ns
   - on dequeue, kworker gets assigned a negative lag
   Is this expected behavior? With this short execution time, I would
   expect the kworker to be fine.
   For a more detailed discussion on this symptom, please see:
   https://lore.kernel.org/netdev/ZWbapeL34Z8AMR5f@DESKTOP-2CCOB1S./T/
2. The proposed code change of course only addresses the symptom. Am I
   assuming correctly that this is in general the exepected behavior and
   that the task waking up the kworker should rather do an explicit
   reschedule of itself to grant the kworker time to execute?
   In the vhost case, this is currently attempted through a cond_resched
   which is not doing anything because the need_resched flag is not set.

Feedback and opinions would be highly appreciated.

Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
---
 kernel/sched/fair.c     | 5 +++++
 kernel/sched/features.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 533547e3c90a..c20ae6d62961 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5239,6 +5239,11 @@ place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 		lag = div_s64(lag, load);
 	}
 
+	if (sched_feat(NOLAG_WAKEUP) && (flags & ENQUEUE_WAKEUP)) {
+		se->vlag = 0;
+		lag = 1;
+	}
+
 	se->vruntime = vruntime - lag;
 
 	/*
diff --git a/kernel/sched/features.h b/kernel/sched/features.h
index 143f55df890b..d3118e7568b4 100644
--- a/kernel/sched/features.h
+++ b/kernel/sched/features.h
@@ -7,6 +7,7 @@
 SCHED_FEAT(PLACE_LAG, true)
 SCHED_FEAT(PLACE_DEADLINE_INITIAL, true)
 SCHED_FEAT(RUN_TO_PARITY, true)
+SCHED_FEAT(NOLAG_WAKEUP, true)
 
 /*
  * Prefer to schedule the task we woke last (assuming it failed
-- 
2.34.1

