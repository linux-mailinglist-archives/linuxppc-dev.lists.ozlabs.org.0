Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6520D166EF3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 06:20:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48P0Cl2TYRzDqcY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 16:20:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48P09q5N6czDqbv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 16:18:55 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01L5F90x047607; Fri, 21 Feb 2020 00:18:50 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y8ubxkpaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 00:18:49 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01L5BtNu031660;
 Fri, 21 Feb 2020 05:18:49 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 2y6897q2ej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 05:18:49 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01L5IlTP50266414
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 05:18:48 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6E21136055;
 Fri, 21 Feb 2020 05:18:47 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E29E136053;
 Fri, 21 Feb 2020 05:18:47 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.124.31.110])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 21 Feb 2020 05:18:47 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 1BBC92E3ACC; Fri, 21 Feb 2020 10:48:44 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: [PATCH v2 2/5] powerpc/idle: Add accessor function to always read
 latest idle PURR
Date: Fri, 21 Feb 2020 10:48:31 +0530
Message-Id: <1582262314-8319-3-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582262314-8319-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1582262314-8319-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_19:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002210035
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>

Currently when CPU goes idle, we take a snapshot of PURR via
idle_loop_prolog() which is used at the CPU idle exit to compute the
idle PURR cycles via the function idle_loop_epilog().  Thus, the value
of idle PURR cycle thus read before idle_loop_prolog() and after
idle_loop_epilog() is always correct.

However, if we were to read the idle PURR cycles from an interrupt
context between idle_loop_prolog() and idle_loop_epilog() (this will
be done in a future patch), then, the value of the idle PURR thus read
will not include the cycles spent in the most recent idle period.

This patch addresses the issue by providing accessor function to read
the idle PURR such such that it includes the cycles spent in the most
recent idle period, if we read it between idle_loop_prolog() and
idle_loop_epilog(). In order to achieve it, the patch saves the
snapshot of PURR in idle_loop_prolog() in a per-cpu variable, instead
of on the stack, so that it can be accessed from an interrupt context.

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/idle.h        | 46 +++++++++++++++++++++++++++-------
 arch/powerpc/platforms/pseries/setup.c |  7 +++---
 drivers/cpuidle/cpuidle-pseries.c      | 15 +++++------
 3 files changed, 46 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/include/asm/idle.h b/arch/powerpc/include/asm/idle.h
index f32a7d8..126a217 100644
--- a/arch/powerpc/include/asm/idle.h
+++ b/arch/powerpc/include/asm/idle.h
@@ -2,10 +2,27 @@
 #define _ASM_POWERPC_IDLE_H
 #include <asm/runlatch.h>
 
-static inline void idle_loop_prolog(unsigned long *in_purr)
+DECLARE_PER_CPU(u64, idle_entry_purr_snap);
+
+static inline void snapshot_purr_idle_entry(void)
+{
+	*this_cpu_ptr(&idle_entry_purr_snap) = mfspr(SPRN_PURR);
+}
+
+static inline void update_idle_purr_accounting(void)
+{
+	u64 wait_cycles;
+	u64 in_purr = *this_cpu_ptr(&idle_entry_purr_snap);
+
+	wait_cycles = be64_to_cpu(get_lppaca()->wait_state_cycles);
+	wait_cycles += mfspr(SPRN_PURR) - in_purr;
+	get_lppaca()->wait_state_cycles = cpu_to_be64(wait_cycles);
+}
+
+static inline void idle_loop_prolog(void)
 {
 	ppc64_runlatch_off();
-	*in_purr = mfspr(SPRN_PURR);
+	snapshot_purr_idle_entry();
 	/*
 	 * Indicate to the HV that we are idle. Now would be
 	 * a good time to find other work to dispatch.
@@ -13,15 +30,26 @@ static inline void idle_loop_prolog(unsigned long *in_purr)
 	get_lppaca()->idle = 1;
 }
 
-static inline void idle_loop_epilog(unsigned long in_purr)
+static inline void idle_loop_epilog(void)
 {
-	u64 wait_cycles;
-
-	wait_cycles = be64_to_cpu(get_lppaca()->wait_state_cycles);
-	wait_cycles += mfspr(SPRN_PURR) - in_purr;
-	get_lppaca()->wait_state_cycles = cpu_to_be64(wait_cycles);
+	update_idle_purr_accounting();
 	get_lppaca()->idle = 0;
-
 	ppc64_runlatch_on();
 }
+
+static inline u64 read_this_idle_purr(void)
+{
+	/*
+	 * If we are reading from an idle context, update the
+	 * idle-purr cycles corresponding to the last idle period.
+	 * Since the idle context is not yet over, take a fresh
+	 * snapshot of the idle-purr.
+	 */
+	if (unlikely(get_lppaca()->idle == 1)) {
+		update_idle_purr_accounting();
+		snapshot_purr_idle_entry();
+	}
+
+	return be64_to_cpu(get_lppaca()->wait_state_cycles);
+}
 #endif
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index ffd4d59..e9f2cefa 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -318,10 +318,9 @@ static int alloc_dispatch_log_kmem_cache(void)
 }
 machine_early_initcall(pseries, alloc_dispatch_log_kmem_cache);
 
+DEFINE_PER_CPU(u64, idle_entry_purr_snap);
 static void pseries_lpar_idle(void)
 {
-	unsigned long in_purr;
-
 	/*
 	 * Default handler to go into low thread priority and possibly
 	 * low power mode by ceding processor to hypervisor
@@ -331,7 +330,7 @@ static void pseries_lpar_idle(void)
 		return;
 
 	/* Indicate to hypervisor that we are idle. */
-	idle_loop_prolog(&in_purr);
+	idle_loop_prolog();
 
 	/*
 	 * Yield the processor to the hypervisor.  We return if
@@ -342,7 +341,7 @@ static void pseries_lpar_idle(void)
 	 */
 	cede_processor();
 
-	idle_loop_epilog(in_purr);
+	idle_loop_epilog();
 }
 
 /*
diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
index fc9dee9c..98d3832 100644
--- a/drivers/cpuidle/cpuidle-pseries.c
+++ b/drivers/cpuidle/cpuidle-pseries.c
@@ -36,12 +36,11 @@ static int snooze_loop(struct cpuidle_device *dev,
 			struct cpuidle_driver *drv,
 			int index)
 {
-	unsigned long in_purr;
 	u64 snooze_exit_time;
 
 	set_thread_flag(TIF_POLLING_NRFLAG);
 
-	idle_loop_prolog(&in_purr);
+	idle_loop_prolog();
 	local_irq_enable();
 	snooze_exit_time = get_tb() + snooze_timeout;
 
@@ -65,7 +64,7 @@ static int snooze_loop(struct cpuidle_device *dev,
 
 	local_irq_disable();
 
-	idle_loop_epilog(in_purr);
+	idle_loop_epilog();
 
 	return index;
 }
@@ -91,9 +90,8 @@ static int dedicated_cede_loop(struct cpuidle_device *dev,
 				struct cpuidle_driver *drv,
 				int index)
 {
-	unsigned long in_purr;
 
-	idle_loop_prolog(&in_purr);
+	idle_loop_prolog();
 	get_lppaca()->donate_dedicated_cpu = 1;
 
 	HMT_medium();
@@ -102,7 +100,7 @@ static int dedicated_cede_loop(struct cpuidle_device *dev,
 	local_irq_disable();
 	get_lppaca()->donate_dedicated_cpu = 0;
 
-	idle_loop_epilog(in_purr);
+	idle_loop_epilog();
 
 	return index;
 }
@@ -111,9 +109,8 @@ static int shared_cede_loop(struct cpuidle_device *dev,
 			struct cpuidle_driver *drv,
 			int index)
 {
-	unsigned long in_purr;
 
-	idle_loop_prolog(&in_purr);
+	idle_loop_prolog();
 
 	/*
 	 * Yield the processor to the hypervisor.  We return if
@@ -125,7 +122,7 @@ static int shared_cede_loop(struct cpuidle_device *dev,
 	check_and_cede_processor();
 
 	local_irq_disable();
-	idle_loop_epilog(in_purr);
+	idle_loop_epilog();
 
 	return index;
 }
-- 
1.9.4

