Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6181E958
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 09:47:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453mqC641pzDqV3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 17:47:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ego@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453mnw1Q7dzDqH2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 17:46:11 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4F7giCk008654
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 03:46:08 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sgcpgdvb8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 03:46:08 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ego@linux.vnet.ibm.com>;
 Wed, 15 May 2019 08:46:07 +0100
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 15 May 2019 08:46:04 +0100
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4F7k3vs6619434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 May 2019 07:46:03 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C30ABE053;
 Wed, 15 May 2019 07:46:03 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBCEEBE051;
 Wed, 15 May 2019 07:46:02 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.124.35.248])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 15 May 2019 07:46:02 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 351052E3579; Wed, 15 May 2019 13:15:59 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: [PATCH v3] powerpc/pseries: Fix cpu_hotplug_lock acquisition in
 resize_hpt()
Date: Wed, 15 May 2019 13:15:52 +0530
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 19051507-0036-0000-0000-00000ABA5ECD
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011100; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01203565; UDB=6.00631764; IPR=6.00984492; 
 MB=3.00026899; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-15 07:46:06
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051507-0037-0000-0000-00004BCB7361
Message-Id: <1557906352-29048-1-git-send-email-ego@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-15_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905150050
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

The calls to arch_add_memory()/arch_remove_memory() are always made
with the read-side cpu_hotplug_lock acquired via
memory_hotplug_begin().  On pSeries,
arch_add_memory()/arch_remove_memory() eventually call resize_hpt()
which in turn calls stop_machine() which acquires the read-side
cpu_hotplug_lock again, thereby resulting in the recursive acquisition
of this lock.

Lockdep complains as follows in these code-paths.

 swapper/0/1 is trying to acquire lock:
 (____ptrval____) (cpu_hotplug_lock.rw_sem){++++}, at: stop_machine+0x2c/0x60

but task is already holding lock:
(____ptrval____) (cpu_hotplug_lock.rw_sem){++++}, at: mem_hotplug_begin+0x20/0x50

 other info that might help us debug this:
  Possible unsafe locking scenario:

        CPU0
        ----
   lock(cpu_hotplug_lock.rw_sem);
   lock(cpu_hotplug_lock.rw_sem);

  *** DEADLOCK ***

  May be due to missing lock nesting notation

 3 locks held by swapper/0/1:
  #0: (____ptrval____) (&dev->mutex){....}, at: __driver_attach+0x12c/0x1b0
  #1: (____ptrval____) (cpu_hotplug_lock.rw_sem){++++}, at: mem_hotplug_begin+0x20/0x50
  #2: (____ptrval____) (mem_hotplug_lock.rw_sem){++++}, at: percpu_down_write+0x54/0x1a0

stack backtrace:
 CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.0.0-rc5-58373-gbc99402235f3-dirty #166
 Call Trace:
 [c0000000feb03150] [c000000000e32bd4] dump_stack+0xe8/0x164 (unreliable)
 [c0000000feb031a0] [c00000000020d6c0] __lock_acquire+0x1110/0x1c70
 [c0000000feb03320] [c00000000020f080] lock_acquire+0x240/0x290
 [c0000000feb033e0] [c00000000017f554] cpus_read_lock+0x64/0xf0
 [c0000000feb03420] [c00000000029ebac] stop_machine+0x2c/0x60
 [c0000000feb03460] [c0000000000d7f7c] pseries_lpar_resize_hpt+0x19c/0x2c0
 [c0000000feb03500] [c0000000000788d0] resize_hpt_for_hotplug+0x70/0xd0
 [c0000000feb03570] [c000000000e5d278] arch_add_memory+0x58/0xfc
 [c0000000feb03610] [c0000000003553a8] devm_memremap_pages+0x5e8/0x8f0
 [c0000000feb036c0] [c0000000009c2394] pmem_attach_disk+0x764/0x830
 [c0000000feb037d0] [c0000000009a7c38] nvdimm_bus_probe+0x118/0x240
 [c0000000feb03860] [c000000000968500] really_probe+0x230/0x4b0
 [c0000000feb038f0] [c000000000968aec] driver_probe_device+0x16c/0x1e0
 [c0000000feb03970] [c000000000968ca8] __driver_attach+0x148/0x1b0
 [c0000000feb039f0] [c0000000009650b0] bus_for_each_dev+0x90/0x130
 [c0000000feb03a50] [c000000000967dd4] driver_attach+0x34/0x50
 [c0000000feb03a70] [c000000000967068] bus_add_driver+0x1a8/0x360
 [c0000000feb03b00] [c00000000096a498] driver_register+0x108/0x170
 [c0000000feb03b70] [c0000000009a7400] __nd_driver_register+0xd0/0xf0
 [c0000000feb03bd0] [c00000000128aa90] nd_pmem_driver_init+0x34/0x48
 [c0000000feb03bf0] [c000000000010a10] do_one_initcall+0x1e0/0x45c
 [c0000000feb03cd0] [c00000000122462c] kernel_init_freeable+0x540/0x64c
 [c0000000feb03db0] [c00000000001110c] kernel_init+0x2c/0x160
 [c0000000feb03e20] [c00000000000bed4] ret_from_kernel_thread+0x5c/0x68

Fix this issue by
  1) Requiring all the calls to pseries_lpar_resize_hpt() be made
     with cpu_hotplug_lock held.

  2) In pseries_lpar_resize_hpt() invoke stop_machine_cpuslocked()
     as a consequence of 1)

  3) To satisfy 1), in hpt_order_set(), call mmu_hash_ops.resize_hpt()
     with cpu_hotplug_lock held.

Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
v2 -> v3 : Updated the comment for pseries_lpar_resize_hpt()
           Updated the commit-log with the full backtrace.
v1 -> v2 : Rebased against powerpc/next instead of linux/master

 arch/powerpc/mm/book3s64/hash_utils.c | 9 ++++++++-
 arch/powerpc/platforms/pseries/lpar.c | 8 ++++++--
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 919a861..d07fcafd 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -38,6 +38,7 @@
 #include <linux/libfdt.h>
 #include <linux/pkeys.h>
 #include <linux/hugetlb.h>
+#include <linux/cpu.h>
 
 #include <asm/debugfs.h>
 #include <asm/processor.h>
@@ -1928,10 +1929,16 @@ static int hpt_order_get(void *data, u64 *val)
 
 static int hpt_order_set(void *data, u64 val)
 {
+	int ret;
+
 	if (!mmu_hash_ops.resize_hpt)
 		return -ENODEV;
 
-	return mmu_hash_ops.resize_hpt(val);
+	cpus_read_lock();
+	ret = mmu_hash_ops.resize_hpt(val);
+	cpus_read_unlock();
+
+	return ret;
 }
 
 DEFINE_DEBUGFS_ATTRIBUTE(fops_hpt_order, hpt_order_get, hpt_order_set, "%llu\n");
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 1034ef1..557d592 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -859,7 +859,10 @@ static int pseries_lpar_resize_hpt_commit(void *data)
 	return 0;
 }
 
-/* Must be called in user context */
+/*
+ * Must be called in process context. The caller must hold the
+ * cpus_lock.
+ */
 static int pseries_lpar_resize_hpt(unsigned long shift)
 {
 	struct hpt_resize_state state = {
@@ -913,7 +916,8 @@ static int pseries_lpar_resize_hpt(unsigned long shift)
 
 	t1 = ktime_get();
 
-	rc = stop_machine(pseries_lpar_resize_hpt_commit, &state, NULL);
+	rc = stop_machine_cpuslocked(pseries_lpar_resize_hpt_commit,
+				     &state, NULL);
 
 	t2 = ktime_get();
 
-- 
1.9.4

