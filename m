Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F32E5D994F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 20:38:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tgz61NfgzDr5g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 05:38:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tgwy5Z8KzDqLd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 05:36:18 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9GIHZI7037267
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 14:36:16 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vp67rn7a3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 14:36:15 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9GIK2J6024102
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 18:36:15 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 2vk6f7rhme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 18:36:14 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9GIaDip37355994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Oct 2019 18:36:13 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28F2EC6055;
 Wed, 16 Oct 2019 18:36:13 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C114C605A;
 Wed, 16 Oct 2019 18:36:13 +0000 (GMT)
Received: from localhost (unknown [9.41.179.251])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Oct 2019 18:36:12 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] powerpc/pseries: safely roll back failed DLPAR cpu add
Date: Wed, 16 Oct 2019 13:36:11 -0500
Message-Id: <20191016183611.10867-3-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191016183611.10867-1-nathanl@linux.ibm.com>
References: <20191016183611.10867-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-16_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=975 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910160151
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
Cc: tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

dlpar_online_cpu() attempts to online all threads of a core that has
been added to an LPAR. If onlining a non-primary thread
fails (e.g. due to an allocation failure), the core is left with at
least one thread online. dlpar_cpu_add() attempts to roll back the
whole operation, releasing the core back to the platform. However,
since some threads of the core being removed are still online, the
BUG_ON(cpu_online(cpu)) in pseries_remove_processor() strikes:

LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
Modules linked in:
CPU: 3 PID: 8587 Comm: drmgr Not tainted 5.3.0-rc2-00190-g9b123d1ea237-dirty #46
NIP:  c0000000000eeb2c LR: c0000000000eeac4 CTR: c0000000000ee9e0
REGS: c0000001f745b6c0 TRAP: 0700   Not tainted  (5.3.0-rc2-00190-g9b123d1ea237-dirty)
MSR:  800000010282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE,TM[E]>  CR: 44002448  XER: 00000000
CFAR: c00000000195d718 IRQMASK: 0
GPR00: c0000000000eeac4 c0000001f745b950 c0000000032f6200 0000000000000008
GPR04: 0000000000000008 c000000003349c78 0000000000000040 00000000000001ff
GPR08: 0000000000000008 0000000000000000 0000000000000001 0007ffffffffffff
GPR12: 0000000084002844 c00000001ecacb80 0000000000000000 0000000000000000
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000008
GPR24: c000000003349ee0 c00000000334a2e4 c0000000fca4d7a8 c000000001d20048
GPR28: 0000000000000001 ffffffffffffffff ffffffffffffffff c0000000fca4d7c4
NIP [c0000000000eeb2c] pseries_smp_notifier+0x14c/0x2e0
LR [c0000000000eeac4] pseries_smp_notifier+0xe4/0x2e0
Call Trace:
[c0000001f745b950] [c0000000000eeac4] pseries_smp_notifier+0xe4/0x2e0 (unreliable)
[c0000001f745ba10] [c0000000001ac774] notifier_call_chain+0xb4/0x190
[c0000001f745bab0] [c0000000001ad62c] blocking_notifier_call_chain+0x7c/0xb0
[c0000001f745baf0] [c00000000167bda0] of_detach_node+0xc0/0x110
[c0000001f745bb50] [c0000000000e7ae4] dlpar_detach_node+0x64/0xa0
[c0000001f745bb80] [c0000000000edefc] dlpar_cpu_add+0x31c/0x360
[c0000001f745bc10] [c0000000000ee980] dlpar_cpu_probe+0x50/0xb0
[c0000001f745bc50] [c00000000002cf70] arch_cpu_probe+0x40/0x70
[c0000001f745bc70] [c000000000ccd808] cpu_probe_store+0x48/0x80
[c0000001f745bcb0] [c000000000cbcef8] dev_attr_store+0x38/0x60
[c0000001f745bcd0] [c00000000059c980] sysfs_kf_write+0x70/0xb0
[c0000001f745bd10] [c00000000059afb8] kernfs_fop_write+0xf8/0x280
[c0000001f745bd60] [c0000000004b437c] __vfs_write+0x3c/0x70
[c0000001f745bd80] [c0000000004b8710] vfs_write+0xd0/0x220
[c0000001f745bdd0] [c0000000004b8acc] ksys_write+0x7c/0x140
[c0000001f745be20] [c00000000000bbd8] system_call+0x5c/0x68

Move dlpar_offline_cpu() up in the file so that dlpar_online_cpu() can
use it to re-offline any threads that have been onlined when an error
is encountered.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Fixes: e666ae0b10aa ("powerpc/pseries: Update CPU hotplug error recovery")
---
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 116 ++++++++++---------
 1 file changed, 59 insertions(+), 57 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index f3f54ef645e1..8ab24bd7f89c 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -338,6 +338,62 @@ static void pseries_remove_processor(struct device_node *np)
 	cpu_maps_update_done();
 }
 
+static int dlpar_offline_cpu(struct device_node *dn)
+{
+	int rc = 0;
+	unsigned int cpu;
+	int len, nthreads, i;
+	const __be32 *intserv;
+	u32 thread;
+
+	intserv = of_get_property(dn, "ibm,ppc-interrupt-server#s", &len);
+	if (!intserv)
+		return -EINVAL;
+
+	nthreads = len / sizeof(u32);
+
+	cpu_maps_update_begin();
+	for (i = 0; i < nthreads; i++) {
+		thread = be32_to_cpu(intserv[i]);
+		for_each_present_cpu(cpu) {
+			if (get_hard_smp_processor_id(cpu) != thread)
+				continue;
+
+			if (get_cpu_current_state(cpu) == CPU_STATE_OFFLINE)
+				break;
+
+			if (get_cpu_current_state(cpu) == CPU_STATE_ONLINE) {
+				set_preferred_offline_state(cpu,
+							    CPU_STATE_OFFLINE);
+				cpu_maps_update_done();
+				timed_topology_update(1);
+				rc = device_offline(get_cpu_device(cpu));
+				if (rc)
+					goto out;
+				cpu_maps_update_begin();
+				break;
+			}
+
+			/*
+			 * The cpu is in CPU_STATE_INACTIVE.
+			 * Upgrade it's state to CPU_STATE_OFFLINE.
+			 */
+			set_preferred_offline_state(cpu, CPU_STATE_OFFLINE);
+			WARN_ON(plpar_hcall_norets(H_PROD, thread) != H_SUCCESS);
+			__cpu_die(cpu);
+			break;
+		}
+		if (cpu == num_possible_cpus()) {
+			pr_warn("Could not find cpu to offline with physical id 0x%x\n",
+				thread);
+		}
+	}
+	cpu_maps_update_done();
+
+out:
+	return rc;
+}
+
 static int dlpar_online_cpu(struct device_node *dn)
 {
 	int rc = 0;
@@ -364,8 +420,10 @@ static int dlpar_online_cpu(struct device_node *dn)
 			timed_topology_update(1);
 			find_and_online_cpu_nid(cpu);
 			rc = device_online(get_cpu_device(cpu));
-			if (rc)
+			if (rc) {
+				dlpar_offline_cpu(dn);
 				goto out;
+			}
 			cpu_maps_update_begin();
 
 			break;
@@ -505,62 +563,6 @@ static ssize_t dlpar_cpu_add(u32 drc_index)
 	return rc;
 }
 
-static int dlpar_offline_cpu(struct device_node *dn)
-{
-	int rc = 0;
-	unsigned int cpu;
-	int len, nthreads, i;
-	const __be32 *intserv;
-	u32 thread;
-
-	intserv = of_get_property(dn, "ibm,ppc-interrupt-server#s", &len);
-	if (!intserv)
-		return -EINVAL;
-
-	nthreads = len / sizeof(u32);
-
-	cpu_maps_update_begin();
-	for (i = 0; i < nthreads; i++) {
-		thread = be32_to_cpu(intserv[i]);
-		for_each_present_cpu(cpu) {
-			if (get_hard_smp_processor_id(cpu) != thread)
-				continue;
-
-			if (get_cpu_current_state(cpu) == CPU_STATE_OFFLINE)
-				break;
-
-			if (get_cpu_current_state(cpu) == CPU_STATE_ONLINE) {
-				set_preferred_offline_state(cpu,
-							    CPU_STATE_OFFLINE);
-				cpu_maps_update_done();
-				timed_topology_update(1);
-				rc = device_offline(get_cpu_device(cpu));
-				if (rc)
-					goto out;
-				cpu_maps_update_begin();
-				break;
-			}
-
-			/*
-			 * The cpu is in CPU_STATE_INACTIVE.
-			 * Upgrade it's state to CPU_STATE_OFFLINE.
-			 */
-			set_preferred_offline_state(cpu, CPU_STATE_OFFLINE);
-			WARN_ON(plpar_hcall_norets(H_PROD, thread) != H_SUCCESS);
-			__cpu_die(cpu);
-			break;
-		}
-		if (cpu == num_possible_cpus()) {
-			pr_warn("Could not find cpu to offline with physical id 0x%x\n",
-				thread);
-		}
-	}
-	cpu_maps_update_done();
-
-out:
-	return rc;
-}
-
 static ssize_t dlpar_cpu_remove(struct device_node *dn, u32 drc_index)
 {
 	int rc;
-- 
2.20.1

