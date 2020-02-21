Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B000C166F2A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 06:26:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48P0L65D6YzDqx1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 16:26:06 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48P09s4VKwzDqbv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 16:18:57 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01L5F70p027702; Fri, 21 Feb 2020 00:18:50 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8ubvy1m5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 00:18:50 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01L5IfZ6007495;
 Fri, 21 Feb 2020 05:18:49 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 2y6897eywm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 05:18:49 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01L5Imt450004300
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 05:18:48 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5FBD7BE04F;
 Fri, 21 Feb 2020 05:18:48 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15B1EBE053;
 Fri, 21 Feb 2020 05:18:47 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.124.31.110])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 21 Feb 2020 05:18:47 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 2CDD92E3ACD; Fri, 21 Feb 2020 10:48:44 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: [PATCH v2 3/5] powerpc/pseries: Account for SPURR ticks on idle CPUs
Date: Fri, 21 Feb 2020 10:48:32 +0530
Message-Id: <1582262314-8319-4-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582262314-8319-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1582262314-8319-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_19:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002210035
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

On Pseries LPARs, to calculate utilization, we need to know the
[S]PURR ticks when the CPUs were busy or idle.

Via idle_loop_prolog(), idle_loop_epilog(), we track the idle PURR
ticks in the VPA variable "wait_state_cycles". This patch extends the
support to account for the idle SPURR ticks. It also provides an
accessor function to accurately reads idle SPURR ticks.

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/idle.h        | 33 +++++++++++++++++++++++++++++++++
 arch/powerpc/platforms/pseries/setup.c |  2 ++
 2 files changed, 35 insertions(+)

diff --git a/arch/powerpc/include/asm/idle.h b/arch/powerpc/include/asm/idle.h
index 126a217..db82fc1 100644
--- a/arch/powerpc/include/asm/idle.h
+++ b/arch/powerpc/include/asm/idle.h
@@ -2,13 +2,20 @@
 #define _ASM_POWERPC_IDLE_H
 #include <asm/runlatch.h>
 
+DECLARE_PER_CPU(u64, idle_spurr_cycles);
 DECLARE_PER_CPU(u64, idle_entry_purr_snap);
+DECLARE_PER_CPU(u64, idle_entry_spurr_snap);
 
 static inline void snapshot_purr_idle_entry(void)
 {
 	*this_cpu_ptr(&idle_entry_purr_snap) = mfspr(SPRN_PURR);
 }
 
+static inline void snapshot_spurr_idle_entry(void)
+{
+	*this_cpu_ptr(&idle_entry_spurr_snap) = mfspr(SPRN_SPURR);
+}
+
 static inline void update_idle_purr_accounting(void)
 {
 	u64 wait_cycles;
@@ -19,10 +26,19 @@ static inline void update_idle_purr_accounting(void)
 	get_lppaca()->wait_state_cycles = cpu_to_be64(wait_cycles);
 }
 
+static inline void update_idle_spurr_accounting(void)
+{
+	u64 *idle_spurr_cycles_ptr = this_cpu_ptr(&idle_spurr_cycles);
+	u64 in_spurr = *this_cpu_ptr(&idle_entry_spurr_snap);
+
+	*idle_spurr_cycles_ptr += mfspr(SPRN_SPURR) - in_spurr;
+}
+
 static inline void idle_loop_prolog(void)
 {
 	ppc64_runlatch_off();
 	snapshot_purr_idle_entry();
+	snapshot_spurr_idle_entry();
 	/*
 	 * Indicate to the HV that we are idle. Now would be
 	 * a good time to find other work to dispatch.
@@ -33,6 +49,7 @@ static inline void idle_loop_prolog(void)
 static inline void idle_loop_epilog(void)
 {
 	update_idle_purr_accounting();
+	update_idle_spurr_accounting();
 	get_lppaca()->idle = 0;
 	ppc64_runlatch_on();
 }
@@ -52,4 +69,20 @@ static inline u64 read_this_idle_purr(void)
 
 	return be64_to_cpu(get_lppaca()->wait_state_cycles);
 }
+
+static inline u64 read_this_idle_spurr(void)
+{
+	/*
+	 * If we are reading from an idle context, update the
+	 * idle-spurr cycles corresponding to the last idle period.
+	 * Since the idle context is not yet over, take a fresh
+	 * snapshot of the idle-spurr.
+	 */
+	if (get_lppaca()->idle == 1) {
+		update_idle_spurr_accounting();
+		snapshot_spurr_idle_entry();
+	}
+
+	return *this_cpu_ptr(&idle_spurr_cycles);
+}
 #endif
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index e9f2cefa..5ef5c82 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -318,7 +318,9 @@ static int alloc_dispatch_log_kmem_cache(void)
 }
 machine_early_initcall(pseries, alloc_dispatch_log_kmem_cache);
 
+DEFINE_PER_CPU(u64, idle_spurr_cycles);
 DEFINE_PER_CPU(u64, idle_entry_purr_snap);
+DEFINE_PER_CPU(u64, idle_entry_spurr_snap);
 static void pseries_lpar_idle(void)
 {
 	/*
-- 
1.9.4

