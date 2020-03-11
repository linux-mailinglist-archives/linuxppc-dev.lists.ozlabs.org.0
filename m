Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 147FF18153E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 10:46:11 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cnCK3pg4zDrDX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 20:46:05 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cn225pcnzDq9T
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 20:38:02 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02B9UHrT041893; Wed, 11 Mar 2020 05:37:58 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ypsgvrg48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Mar 2020 05:37:58 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02B9Z8un002956;
 Wed, 11 Mar 2020 09:37:56 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 2ypjxr3te5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Mar 2020 09:37:56 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02B9buIF63111650
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2020 09:37:56 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 110AEC6057;
 Wed, 11 Mar 2020 09:37:56 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63995C6059;
 Wed, 11 Mar 2020 09:37:55 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.122.202])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 11 Mar 2020 09:37:55 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 1A50B2E3202; Wed, 11 Mar 2020 15:07:47 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: [PATCH v3 1/6] powerpc: Move idle_loop_prolog()/epilog() functions to
 header file
Date: Wed, 11 Mar 2020 15:07:36 +0530
Message-Id: <1583919461-27405-2-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1583919461-27405-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1583919461-27405-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-11_02:2020-03-10,
 2020-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 impostorscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003110061
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

Currently prior to entering an idle state on a Linux Guest, the
pseries cpuidle driver implement an idle_loop_prolog() and
idle_loop_epilog() functions which ensure that idle_purr is correctly
computed, and the hypervisor is informed that the CPU cycles have been
donated.

These prolog and epilog functions are also required in the default
idle call, i.e pseries_lpar_idle(). Hence move these accessor
functions to a common header file and call them from
pseries_lpar_idle(). Since the existing header files such as
asm/processor.h have enough clutter, create a new header file
asm/idle.h. Finally rename idle_loop_prolog() and idle_loop_epilog()
to pseries_idle_prolog() and pseries_idle_epilog() as they are only
relavent for on pseries guests.

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/idle.h        | 28 ++++++++++++++++++++++++++
 arch/powerpc/platforms/pseries/setup.c |  7 +++++--
 drivers/cpuidle/cpuidle-pseries.c      | 36 +++++++---------------------------
 3 files changed, 40 insertions(+), 31 deletions(-)
 create mode 100644 arch/powerpc/include/asm/idle.h

diff --git a/arch/powerpc/include/asm/idle.h b/arch/powerpc/include/asm/idle.h
new file mode 100644
index 0000000..e838ea5
--- /dev/null
+++ b/arch/powerpc/include/asm/idle.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _ASM_POWERPC_IDLE_H
+#define _ASM_POWERPC_IDLE_H
+#include <asm/runlatch.h>
+
+static inline void pseries_idle_prolog(unsigned long *in_purr)
+{
+	ppc64_runlatch_off();
+	*in_purr = mfspr(SPRN_PURR);
+	/*
+	 * Indicate to the HV that we are idle. Now would be
+	 * a good time to find other work to dispatch.
+	 */
+	get_lppaca()->idle = 1;
+}
+
+static inline void pseries_idle_epilog(unsigned long in_purr)
+{
+	u64 wait_cycles;
+
+	wait_cycles = be64_to_cpu(get_lppaca()->wait_state_cycles);
+	wait_cycles += mfspr(SPRN_PURR) - in_purr;
+	get_lppaca()->wait_state_cycles = cpu_to_be64(wait_cycles);
+	get_lppaca()->idle = 0;
+
+	ppc64_runlatch_on();
+}
+#endif
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 0c8421d..2f53e6b 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -68,6 +68,7 @@
 #include <asm/isa-bridge.h>
 #include <asm/security_features.h>
 #include <asm/asm-const.h>
+#include <asm/idle.h>
 #include <asm/swiotlb.h>
 #include <asm/svm.h>
 
@@ -319,6 +320,8 @@ static int alloc_dispatch_log_kmem_cache(void)
 
 static void pseries_lpar_idle(void)
 {
+	unsigned long in_purr;
+
 	/*
 	 * Default handler to go into low thread priority and possibly
 	 * low power mode by ceding processor to hypervisor
@@ -328,7 +331,7 @@ static void pseries_lpar_idle(void)
 		return;
 
 	/* Indicate to hypervisor that we are idle. */
-	get_lppaca()->idle = 1;
+	pseries_idle_prolog(&in_purr);
 
 	/*
 	 * Yield the processor to the hypervisor.  We return if
@@ -339,7 +342,7 @@ static void pseries_lpar_idle(void)
 	 */
 	cede_processor();
 
-	get_lppaca()->idle = 0;
+	pseries_idle_epilog(in_purr);
 }
 
 /*
diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
index 74c2479..46d5e05 100644
--- a/drivers/cpuidle/cpuidle-pseries.c
+++ b/drivers/cpuidle/cpuidle-pseries.c
@@ -19,6 +19,7 @@
 #include <asm/machdep.h>
 #include <asm/firmware.h>
 #include <asm/runlatch.h>
+#include <asm/idle.h>
 #include <asm/plpar_wrappers.h>
 
 struct cpuidle_driver pseries_idle_driver = {
@@ -31,29 +32,6 @@ struct cpuidle_driver pseries_idle_driver = {
 static u64 snooze_timeout __read_mostly;
 static bool snooze_timeout_en __read_mostly;
 
-static inline void idle_loop_prolog(unsigned long *in_purr)
-{
-	ppc64_runlatch_off();
-	*in_purr = mfspr(SPRN_PURR);
-	/*
-	 * Indicate to the HV that we are idle. Now would be
-	 * a good time to find other work to dispatch.
-	 */
-	get_lppaca()->idle = 1;
-}
-
-static inline void idle_loop_epilog(unsigned long in_purr)
-{
-	u64 wait_cycles;
-
-	wait_cycles = be64_to_cpu(get_lppaca()->wait_state_cycles);
-	wait_cycles += mfspr(SPRN_PURR) - in_purr;
-	get_lppaca()->wait_state_cycles = cpu_to_be64(wait_cycles);
-	get_lppaca()->idle = 0;
-
-	ppc64_runlatch_on();
-}
-
 static int snooze_loop(struct cpuidle_device *dev,
 			struct cpuidle_driver *drv,
 			int index)
@@ -63,7 +41,7 @@ static int snooze_loop(struct cpuidle_device *dev,
 
 	set_thread_flag(TIF_POLLING_NRFLAG);
 
-	idle_loop_prolog(&in_purr);
+	pseries_idle_prolog(&in_purr);
 	local_irq_enable();
 	snooze_exit_time = get_tb() + snooze_timeout;
 
@@ -87,7 +65,7 @@ static int snooze_loop(struct cpuidle_device *dev,
 
 	local_irq_disable();
 
-	idle_loop_epilog(in_purr);
+	pseries_idle_epilog(in_purr);
 
 	return index;
 }
@@ -115,7 +93,7 @@ static int dedicated_cede_loop(struct cpuidle_device *dev,
 {
 	unsigned long in_purr;
 
-	idle_loop_prolog(&in_purr);
+	pseries_idle_prolog(&in_purr);
 	get_lppaca()->donate_dedicated_cpu = 1;
 
 	HMT_medium();
@@ -124,7 +102,7 @@ static int dedicated_cede_loop(struct cpuidle_device *dev,
 	local_irq_disable();
 	get_lppaca()->donate_dedicated_cpu = 0;
 
-	idle_loop_epilog(in_purr);
+	pseries_idle_epilog(in_purr);
 
 	return index;
 }
@@ -135,7 +113,7 @@ static int shared_cede_loop(struct cpuidle_device *dev,
 {
 	unsigned long in_purr;
 
-	idle_loop_prolog(&in_purr);
+	pseries_idle_prolog(&in_purr);
 
 	/*
 	 * Yield the processor to the hypervisor.  We return if
@@ -147,7 +125,7 @@ static int shared_cede_loop(struct cpuidle_device *dev,
 	check_and_cede_processor();
 
 	local_irq_disable();
-	idle_loop_epilog(in_purr);
+	pseries_idle_epilog(in_purr);
 
 	return index;
 }
-- 
1.9.4

