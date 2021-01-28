Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E651A307703
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 14:28:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRLrS5qddzDqPT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 00:28:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=dietmar.eggemann@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DRLSk5JHlzDrYX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 00:10:55 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D7BB11B3;
 Thu, 28 Jan 2021 05:10:54 -0800 (PST)
Received: from e125579.fritz.box (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B24E93F719;
 Thu, 28 Jan 2021 05:10:51 -0800 (PST)
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Jeremy Kerr <jk@ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/3] sched: Remove MAX_USER_RT_PRIO
Date: Thu, 28 Jan 2021 14:10:38 +0100
Message-Id: <20210128131040.296856-2-dietmar.eggemann@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128131040.296856-1-dietmar.eggemann@arm.com>
References: <20210128131040.296856-1-dietmar.eggemann@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Hillf Danton <hdanton@sina.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit d46523ea32a7 ("[PATCH] fix MAX_USER_RT_PRIO and MAX_RT_PRIO")
was introduced due to a a small time period in which the realtime patch
set was using different values for MAX_USER_RT_PRIO and MAX_RT_PRIO.

This is no longer true, i.e. now MAX_RT_PRIO == MAX_USER_RT_PRIO.

Get rid of MAX_USER_RT_PRIO and make everything use MAX_RT_PRIO
instead.

Signed-off-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
---
 include/linux/sched/prio.h | 9 +--------
 kernel/sched/core.c        | 7 +++----
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/include/linux/sched/prio.h b/include/linux/sched/prio.h
index 7d64feafc408..d111f2fd77ea 100644
--- a/include/linux/sched/prio.h
+++ b/include/linux/sched/prio.h
@@ -11,16 +11,9 @@
  * priority is 0..MAX_RT_PRIO-1, and SCHED_NORMAL/SCHED_BATCH
  * tasks are in the range MAX_RT_PRIO..MAX_PRIO-1. Priority
  * values are inverted: lower p->prio value means higher priority.
- *
- * The MAX_USER_RT_PRIO value allows the actual maximum
- * RT priority to be separate from the value exported to
- * user-space.  This allows kernel threads to set their
- * priority to a value higher than any user task. Note:
- * MAX_RT_PRIO must not be smaller than MAX_USER_RT_PRIO.
  */
 
-#define MAX_USER_RT_PRIO	100
-#define MAX_RT_PRIO		MAX_USER_RT_PRIO
+#define MAX_RT_PRIO		100
 
 #define MAX_PRIO		(MAX_RT_PRIO + NICE_WIDTH)
 #define DEFAULT_PRIO		(MAX_RT_PRIO + NICE_WIDTH / 2)
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 06b449942adf..625ec1e12064 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5897,11 +5897,10 @@ static int __sched_setscheduler(struct task_struct *p,
 
 	/*
 	 * Valid priorities for SCHED_FIFO and SCHED_RR are
-	 * 1..MAX_USER_RT_PRIO-1, valid priority for SCHED_NORMAL,
+	 * 1..MAX_RT_PRIO-1, valid priority for SCHED_NORMAL,
 	 * SCHED_BATCH and SCHED_IDLE is 0.
 	 */
-	if ((p->mm && attr->sched_priority > MAX_USER_RT_PRIO-1) ||
-	    (!p->mm && attr->sched_priority > MAX_RT_PRIO-1))
+	if (attr->sched_priority > MAX_RT_PRIO-1)
 		return -EINVAL;
 	if ((dl_policy(policy) && !__checkparam_dl(attr)) ||
 	    (rt_policy(policy) != (attr->sched_priority != 0)))
@@ -6969,7 +6968,7 @@ SYSCALL_DEFINE1(sched_get_priority_max, int, policy)
 	switch (policy) {
 	case SCHED_FIFO:
 	case SCHED_RR:
-		ret = MAX_USER_RT_PRIO-1;
+		ret = MAX_RT_PRIO-1;
 		break;
 	case SCHED_DEADLINE:
 	case SCHED_NORMAL:
-- 
2.25.1

