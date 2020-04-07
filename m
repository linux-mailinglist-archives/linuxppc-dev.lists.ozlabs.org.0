Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 726CD1A099B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 10:55:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xLpj15R8zDqB3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 18:55:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xLf43fhbzDqcP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 18:48:12 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0378YdHr028355; Tue, 7 Apr 2020 04:48:05 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3082pe73u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2020 04:48:05 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0378egOf027183;
 Tue, 7 Apr 2020 08:48:04 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 306hv6en2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2020 08:48:04 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0378m3lr11665930
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Apr 2020 08:48:03 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B48346E04E;
 Tue,  7 Apr 2020 08:48:03 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14CCB6E04C;
 Tue,  7 Apr 2020 08:48:02 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.79.178.96])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  7 Apr 2020 08:48:02 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 0070E2E3231; Tue,  7 Apr 2020 14:17:58 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: [PATCH v5 2/5] powerpc/idle: Store PURR snapshot in a per-cpu global
 variable
Date: Tue,  7 Apr 2020 14:17:40 +0530
Message-Id: <1586249263-14048-3-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1586249263-14048-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1586249263-14048-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_01:2020-04-07,
 2020-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004070068
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
pseries_idle_prolog() which is used at the CPU idle exit to compute
the idle PURR cycles via the function pseries_idle_epilog().  Thus,
the value of idle PURR cycle thus read before pseries_idle_prolog() and
after pseries_idle_epilog() is always correct.

However, if we were to read the idle PURR cycles from an interrupt
context between pseries_idle_prolog() and pseries_idle_epilog() (this
will be done in a future patch), then, the value of the idle PURR thus
read will not include the cycles spent in the most recent idle period.
Thus, in that interrupt context, we will need access to the snapshot
of the PURR before going idle, in order to compute the idle PURR
cycles for the latest idle duration.

In this patch, we save the snapshot of PURR in pseries_idle_prolog()
in a per-cpu variable, instead of on the stack, so that it can be
accessed from an interrupt context.

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/idle.h        | 31 ++++++++++++++++++++++---------
 arch/powerpc/platforms/pseries/setup.c |  7 +++----
 drivers/cpuidle/cpuidle-pseries.c      | 15 ++++++---------
 3 files changed, 31 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/include/asm/idle.h b/arch/powerpc/include/asm/idle.h
index 32064a4c..b90d75a 100644
--- a/arch/powerpc/include/asm/idle.h
+++ b/arch/powerpc/include/asm/idle.h
@@ -5,10 +5,27 @@
 #include <asm/paca.h>
 
 #ifdef CONFIG_PPC_PSERIES
-static inline void pseries_idle_prolog(unsigned long *in_purr)
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
+static inline void pseries_idle_prolog(void)
 {
 	ppc64_runlatch_off();
-	*in_purr = mfspr(SPRN_PURR);
+	snapshot_purr_idle_entry();
 	/*
 	 * Indicate to the HV that we are idle. Now would be
 	 * a good time to find other work to dispatch.
@@ -16,16 +33,12 @@ static inline void pseries_idle_prolog(unsigned long *in_purr)
 	get_lppaca()->idle = 1;
 }
 
-static inline void pseries_idle_epilog(unsigned long in_purr)
+static inline void pseries_idle_epilog(void)
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
 #endif /* CONFIG_PPC_PSERIES */
 #endif
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 2f53e6b..4905c96 100644
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
-	pseries_idle_prolog(&in_purr);
+	pseries_idle_prolog();
 
 	/*
 	 * Yield the processor to the hypervisor.  We return if
@@ -342,7 +341,7 @@ static void pseries_lpar_idle(void)
 	 */
 	cede_processor();
 
-	pseries_idle_epilog(in_purr);
+	pseries_idle_epilog();
 }
 
 /*
diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
index 46d5e05..6513ef2 100644
--- a/drivers/cpuidle/cpuidle-pseries.c
+++ b/drivers/cpuidle/cpuidle-pseries.c
@@ -36,12 +36,11 @@ static int snooze_loop(struct cpuidle_device *dev,
 			struct cpuidle_driver *drv,
 			int index)
 {
-	unsigned long in_purr;
 	u64 snooze_exit_time;
 
 	set_thread_flag(TIF_POLLING_NRFLAG);
 
-	pseries_idle_prolog(&in_purr);
+	pseries_idle_prolog();
 	local_irq_enable();
 	snooze_exit_time = get_tb() + snooze_timeout;
 
@@ -65,7 +64,7 @@ static int snooze_loop(struct cpuidle_device *dev,
 
 	local_irq_disable();
 
-	pseries_idle_epilog(in_purr);
+	pseries_idle_epilog();
 
 	return index;
 }
@@ -91,9 +90,8 @@ static int dedicated_cede_loop(struct cpuidle_device *dev,
 				struct cpuidle_driver *drv,
 				int index)
 {
-	unsigned long in_purr;
 
-	pseries_idle_prolog(&in_purr);
+	pseries_idle_prolog();
 	get_lppaca()->donate_dedicated_cpu = 1;
 
 	HMT_medium();
@@ -102,7 +100,7 @@ static int dedicated_cede_loop(struct cpuidle_device *dev,
 	local_irq_disable();
 	get_lppaca()->donate_dedicated_cpu = 0;
 
-	pseries_idle_epilog(in_purr);
+	pseries_idle_epilog();
 
 	return index;
 }
@@ -111,9 +109,8 @@ static int shared_cede_loop(struct cpuidle_device *dev,
 			struct cpuidle_driver *drv,
 			int index)
 {
-	unsigned long in_purr;
 
-	pseries_idle_prolog(&in_purr);
+	pseries_idle_prolog();
 
 	/*
 	 * Yield the processor to the hypervisor.  We return if
@@ -125,7 +122,7 @@ static int shared_cede_loop(struct cpuidle_device *dev,
 	check_and_cede_processor();
 
 	local_irq_disable();
-	pseries_idle_epilog(in_purr);
+	pseries_idle_epilog();
 
 	return index;
 }
-- 
1.9.4

