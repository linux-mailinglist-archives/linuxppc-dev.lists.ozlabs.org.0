Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F7459903
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 13:10:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZvFm41mLzDqHP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 21:10:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anju@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZvCg5lTXzDqMV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 21:09:03 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5SB71tO017348
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 07:08:59 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tdhjpghqr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 07:08:58 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <anju@linux.vnet.ibm.com>;
 Fri, 28 Jun 2019 12:08:57 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 28 Jun 2019 12:08:54 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5SB8rDM56688774
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jun 2019 11:08:53 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88C0E4203F;
 Fri, 28 Jun 2019 11:08:53 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0155B42041;
 Fri, 28 Jun 2019 11:08:52 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.75.80])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 28 Jun 2019 11:08:51 +0000 (GMT)
From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/imc: Dont create debugfs files for cpu-less nodes
Date: Fri, 28 Jun 2019 16:38:48 +0530
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19062811-0016-0000-0000-0000028D5392
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062811-0017-0000-0000-000032EAD6C0
Message-Id: <20190628110848.28180-1-anju@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-28_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=40 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906280132
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
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.vnet.ibm.com,
 anju@linux.vnet.ibm.com, cai@lca.pw, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>

Commit <684d984038aa> ('powerpc/powernv: Add debugfs interface for imc-mode
and imc') added debugfs interface for the nest imc pmu devices to support
changing of different ucode modes. Primarily adding this capability for
debug. But when doing so, the code did not consider the case of cpu-less
nodes. So when reading the _cmd_ or _mode_ file of a cpu-less node
will create this crash.

[ 1139.415461][ T5301] Faulting instruction address: 0xc0000000000d0d58
[ 1139.415492][ T5301] Oops: Kernel access of bad area, sig: 11 [#1]
[ 1139.415509][ T5301] LE PAGE_SIZE=64K MMU=Radix MMU=Hash SMP NR_CPUS=256
DEBUG_PAGEALLOC NUMA PowerNV
[ 1139.415542][ T5301] Modules linked in: i2c_opal i2c_core ip_tables x_tables
xfs sd_mod bnx2x mdio ahci libahci tg3 libphy libata firmware_class dm_mirror
dm_region_hash dm_log dm_mod
[ 1139.415595][ T5301] CPU: 67 PID: 5301 Comm: cat Not tainted 5.2.0-rc6-next-
20190627+ #19
[ 1139.415634][ T5301] NIP:  c0000000000d0d58 LR: c00000000049aa18 CTR:c0000000000d0d50
[ 1139.415675][ T5301] REGS: c00020194548f9e0 TRAP: 0300   Not tainted  (5.2.0-rc6-next-20190627+)
[ 1139.415705][ T5301] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR:28022822  XER: 00000000
[ 1139.415777][ T5301] CFAR: c00000000049aa14 DAR: 000000000003fc08 DSISR:40000000 IRQMASK: 0
[ 1139.415777][ T5301] GPR00: c00000000049aa18 c00020194548fc70 c0000000016f8b00000000000003fc08
[ 1139.415777][ T5301] GPR04: c00020194548fcd0 0000000000000000 0000000014884e73ffffffff00011eaa
[ 1139.415777][ T5301] GPR08: 000000007eea5a52 c0000000000d0d50 00000000000000000000000000000000
[ 1139.415777][ T5301] GPR12: c0000000000d0d50 c000201fff7f8c00 00000000000000000000000000000000
[ 1139.415777][ T5301] GPR16: 000000000000000d 00007fffeb0c3368 ffffffffffffffff0000000000000000
[ 1139.415777][ T5301] GPR20: 0000000000000000 0000000000000000 00000000000000000000000000020000
[ 1139.415777][ T5301] GPR24: 0000000000000000 0000000000000000 0000000000020000000000010ec90000
[ 1139.415777][ T5301] GPR28: c00020194548fdf0 c00020049a584ef8 0000000000000000c00020049a584ea8
[ 1139.416116][ T5301] NIP [c0000000000d0d58] imc_mem_get+0x8/0x20
[ 1139.416143][ T5301] LR [c00000000049aa18] simple_attr_read+0x118/0x170
[ 1139.416158][ T5301] Call Trace:
[ 1139.416182][ T5301] [c00020194548fc70] [c00000000049a970]simple_attr_read+0x70/0x170 (unreliable)
[ 1139.416255][ T5301] [c00020194548fd10] [c00000000054385c]debugfs_attr_read+0x6c/0xb0
[ 1139.416305][ T5301] [c00020194548fd60] [c000000000454c1c]__vfs_read+0x3c/0x70
[ 1139.416363][ T5301] [c00020194548fd80] [c000000000454d0c] vfs_read+0xbc/0x1a0
[ 1139.416392][ T5301] [c00020194548fdd0] [c00000000045519c]ksys_read+0x7c/0x140
[ 1139.416434][ T5301] [c00020194548fe20] [c00000000000b108]system_call+0x5c/0x70
[ 1139.416473][ T5301] Instruction dump:
[ 1139.416511][ T5301] 4e800020 60000000 7c0802a6 60000000 7c801d28 38600000 4e800020 60000000
[ 1139.416572][ T5301] 60000000 60000000 7c0802a6 60000000 <7d201c28> 38600000 f9240000 4e800020
[ 1139.416636][ T5301] ---[ end trace c44d1fb4ace04784 ]---
[ 1139.520686][ T5301]
[ 1140.520820][ T5301] Kernel panic - not syncing: Fatal exception

Patch adds a check to avoid creation of these files to cpu-less nodes.

Fixes: 684d984038aa ('powerpc/powernv: Add debugfs interface for imc-mode and imc')
Reported-by: Qian Cai <cai@lca.pw>
Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/powernv/opal-imc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/opal-imc.c b/arch/powerpc/platforms/powernv/opal-imc.c
index 186109bdd41b..12c8964a2f9c 100644
--- a/arch/powerpc/platforms/powernv/opal-imc.c
+++ b/arch/powerpc/platforms/powernv/opal-imc.c
@@ -13,6 +13,7 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/crash_dump.h>
+#include <linux/cpumask.h>
 #include <asm/opal.h>
 #include <asm/io.h>
 #include <asm/imc-pmu.h>
@@ -56,6 +57,7 @@ static void export_imc_mode_and_cmd(struct device_node *node,
 	int chip = 0, nid;
 	char mode[16], cmd[16];
 	u32 cb_offset;
+	const struct cpumask *l_cpumask;
 
 	imc_debugfs_parent = debugfs_create_dir("imc", powerpc_debugfs_root);
 
@@ -70,6 +72,14 @@ static void export_imc_mode_and_cmd(struct device_node *node,
 		cb_offset = IMC_CNTL_BLK_OFFSET;
 
 	for_each_node(nid) {
+		/*
+		 * Since these are related to nest pmu,
+		 * create only if the node has any cpu in it.
+		 */
+		l_cpumask = cpumask_of_node(nid);
+		if (cpumask_empty(l_cpumask))
+			continue;
+
 		loc = (u64)(pmu_ptr->mem_info[chip].vbase) + cb_offset;
 		imc_mode_addr = (u64 *)(loc + IMC_CNTL_BLK_MODE_OFFSET);
 		sprintf(mode, "imc_mode_%d", nid);
-- 
2.20.1

