Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5525843B72D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 18:28:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hdy1d1bv1z307x
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 03:28:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FEi4aDx+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FEi4aDx+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hdy0q1VTWz2xY8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 03:27:54 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QFnYcc010098; 
 Tue, 26 Oct 2021 16:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=SVCpTfmEBhogHAIIe2gYtS2bi8xkDZKCQxDgMAMI+zo=;
 b=FEi4aDx+yiWCZiwDiGiL2uejpYD+hjp7cXyrPK6QV8TArffVz2yhxoXvSKmaWGgnEzOv
 B8SeYuU9QJZ4WNzOH681LJ76acBLpKBGrYVjVwMzcK/Tydc1sR3aouGuzB/r1lok245M
 2SZ8laUK0Z/dA8fH38TNzwkMqyNzLRhCTfnVFJnWw/2b+rzDGK8a3edpXz+pdCPd6W3c
 nehYrOXIV4Tg7BbHNm4RYAu3eIu5SuFGQuA1s80s04BbR04iTuxSMoULcbzVqoapXs9+
 UU1AvqYuH2KvbW0gAF2v47m6gx2Vha3exYvMA+K6qKh8WuCu8kBBegHUxP6Nvtpj8rUC jA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bx4k66h11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 16:27:47 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19QGFJxD025964;
 Tue, 26 Oct 2021 16:27:46 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bx4k66gyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 16:27:46 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19QGHEbt025480;
 Tue, 26 Oct 2021 16:27:45 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3bx4f5exsx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 16:27:45 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19QGRgTb36307448
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Oct 2021 16:27:42 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72C01A405B;
 Tue, 26 Oct 2021 16:27:42 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21C77A4054;
 Tue, 26 Oct 2021 16:27:42 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.63.253])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 Oct 2021 16:27:42 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org
Subject: [PATCH 1/2] powerpc/watchdog: prevent printk and send IPI while
 holding the wd lock
Date: Tue, 26 Oct 2021 18:27:39 +0200
Message-Id: <20211026162740.16283-2-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211026162740.16283-1-ldufour@linux.ibm.com>
References: <20211026162740.16283-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _-bNd-WsRqmY6Qcq5UVytaygS42Da0Mg
X-Proofpoint-GUID: EusuoZMQhIVQO9sDyW05VSO6XagN8io6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_05,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110260088
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When handling the Watchdog interrupt, long processing should not be done
while holding the __wd_smp_lock. This prevents the other CPUs to grab it
and to process Watchdog timer interrupts. Furhtermore, this could lead to
the following situation:

CPU x detect lockup on CPU y and grab the __wd_smp_lock
      in watchdog_smp_panic()
CPU y caught the watchdog interrupt and try to grab the __wd_smp_lock
      in soft_nmi_interrupt()
CPU x wait for CPU y to catch the IPI for 1s in __smp_send_nmi_ipi()
CPU x will timeout and so has spent 1s waiting while holding the
      __wd_smp_lock.

A deadlock may also happen between the __wd_smp_lock and the console_owner
'lock' this way:
CPU x grab the console_owner
CPU y grab the __wd_smp_lock
CPU x catch the watchdog timer interrupt and needs to grab __wd_smp_lock
CPU y wants to print something and wait for console_owner
-> deadlock

Doing all the long processing without holding the _wd_smp_lock prevents
these situations.

Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/kernel/watchdog.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index f9ea0e5357f9..bc7411327066 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -149,6 +149,8 @@ static void set_cpu_stuck(int cpu, u64 tb)
 
 static void watchdog_smp_panic(int cpu, u64 tb)
 {
+	cpumask_t cpus_pending_copy;
+	u64 last_reset_tb_copy;
 	unsigned long flags;
 	int c;
 
@@ -161,29 +163,32 @@ static void watchdog_smp_panic(int cpu, u64 tb)
 	if (cpumask_weight(&wd_smp_cpus_pending) == 0)
 		goto out;
 
+	cpumask_copy(&cpus_pending_copy, &wd_smp_cpus_pending);
+	last_reset_tb_copy = wd_smp_last_reset_tb;
+
+	/* Take the stuck CPUs out of the watch group */
+	set_cpumask_stuck(&wd_smp_cpus_pending, tb);
+
+	wd_smp_unlock(&flags);
+
 	pr_emerg("CPU %d detected hard LOCKUP on other CPUs %*pbl\n",
-		 cpu, cpumask_pr_args(&wd_smp_cpus_pending));
+		 cpu, cpumask_pr_args(&cpus_pending_copy));
 	pr_emerg("CPU %d TB:%lld, last SMP heartbeat TB:%lld (%lldms ago)\n",
-		 cpu, tb, wd_smp_last_reset_tb,
-		 tb_to_ns(tb - wd_smp_last_reset_tb) / 1000000);
+		 cpu, tb, last_reset_tb_copy,
+		 tb_to_ns(tb - last_reset_tb_copy) / 1000000);
 
 	if (!sysctl_hardlockup_all_cpu_backtrace) {
 		/*
 		 * Try to trigger the stuck CPUs, unless we are going to
 		 * get a backtrace on all of them anyway.
 		 */
-		for_each_cpu(c, &wd_smp_cpus_pending) {
+		for_each_cpu(c, &cpus_pending_copy) {
 			if (c == cpu)
 				continue;
 			smp_send_nmi_ipi(c, wd_lockup_ipi, 1000000);
 		}
 	}
 
-	/* Take the stuck CPUs out of the watch group */
-	set_cpumask_stuck(&wd_smp_cpus_pending, tb);
-
-	wd_smp_unlock(&flags);
-
 	if (sysctl_hardlockup_all_cpu_backtrace)
 		trigger_allbutself_cpu_backtrace();
 
@@ -204,6 +209,8 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 			unsigned long flags;
 
 			wd_smp_lock(&flags);
+			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
+			wd_smp_unlock(&flags);
 
 			pr_emerg("CPU %d became unstuck TB:%lld\n",
 				 cpu, tb);
@@ -212,9 +219,6 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 				show_regs(regs);
 			else
 				dump_stack();
-
-			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
-			wd_smp_unlock(&flags);
 		}
 		return;
 	}
@@ -267,6 +271,7 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
 			return 0;
 		}
 		set_cpu_stuck(cpu, tb);
+		wd_smp_unlock(&flags);
 
 		pr_emerg("CPU %d self-detected hard LOCKUP @ %pS\n",
 			 cpu, (void *)regs->nip);
@@ -277,8 +282,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
 		print_irqtrace_events(current);
 		show_regs(regs);
 
-		wd_smp_unlock(&flags);
-
 		if (sysctl_hardlockup_all_cpu_backtrace)
 			trigger_allbutself_cpu_backtrace();
 
-- 
2.33.1

