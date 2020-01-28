Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0310814C2F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 23:27:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486h7v1yRKzDqNm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 09:27:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cheloha@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486gnF4lT9zDqGW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 09:11:23 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00SM8g5n001921; Tue, 28 Jan 2020 17:11:17 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xrhv2a0fs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 17:11:17 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 00SM8rjr003135;
 Tue, 28 Jan 2020 17:11:16 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xrhv2a0fa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 17:11:16 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00SMB0uW000615;
 Tue, 28 Jan 2020 22:11:15 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 2xrda6mbxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 22:11:15 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00SMBEoK42533126
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jan 2020 22:11:14 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8541F1360C0;
 Tue, 28 Jan 2020 22:11:14 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1873C1360C1;
 Tue, 28 Jan 2020 22:11:13 +0000 (GMT)
Received: from rascal.austin.ibm.com (unknown [9.41.179.32])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 28 Jan 2020 22:11:13 +0000 (GMT)
From: Scott Cheloha <cheloha@linux.ibm.com>
To: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/drmem: cache LMBs in xarray to accelerate lookup
Date: Tue, 28 Jan 2020 16:11:13 -0600
Message-Id: <20200128221113.17158-1-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-28_08:2020-01-28,
 2020-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 clxscore=1011 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001280164
X-Mailman-Approved-At: Wed, 29 Jan 2020 09:25:49 +1100
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Nathan Fontenont <ndfont@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Rick Lindley <ricklind@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

LMB lookup is currently an O(n) linear search.  This scales poorly when
there are many LMBs.

If we cache each LMB by both its base address and its DRC index
in an xarray we can cut lookups to O(log n), greatly accelerating
drmem initialization and memory hotplug.

This patch introduces two xarrays of of LMBs and fills them during
drmem initialization.  The patch also adds two interfaces for LMB
lookup.

The first interface, drmem_find_lmb_by_base_addr(), is employed in
hot_add_drconf_scn_to_nid() to replace a linear search.  This speeds up
memory_add_physaddr_to_nid(), which is called by lmb_set_nid(), an
interface used during drmem initialization and memory hotplug.

The second interface, drmem_find_lmb_by_drc_index(), is employed in
get_lmb_range() to replace a linear search.  This speeds up
dlpar_memory_add_by_ic() and dlpar_memory_remove_by_ic(), interfaces
used during memory hotplug.

These substitutions yield significant improvements:

1. A POWER9 VM with a maximum memory of 10TB and 256MB LMBs has
   40960 LMBs.  With this patch it completes drmem_init() ~1138ms
   faster.

Before:
[    0.542244] drmem: initializing drmem v1
[    1.768787] drmem: initialized 40960 LMBs

After:
[    0.543611] drmem: initializing drmem v1
[    0.631386] drmem: initialized 40960 LMBs

2. A POWER9 VM with a maximum memory of 4TB and 256MB LMBs has
   16384 LMBs.  Via the qemu monitor we can hot-add memory as
   virtual DIMMs.  Each DIMM is 256 LMBs.  With this patch we
   hot-add every possible LMB about 60 seconds faster.

Before:
[   17.422177] pseries-hotplug-mem: Attempting to hot-add 256 LMB(s) at index 80000100
[...]
[  167.285563] pseries-hotplug-mem: Memory at 3fff0000000 (drc index 80003fff) was hot-added

After:
[   14.753480] pseries-hotplug-mem: Attempting to hot-add 256 LMB(s) at index 80000100
[...]
[  103.934092] pseries-hotplug-mem: Memory at 3fff0000000 (drc index 80003fff) was hot-added

Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
---
These linear searches become a serious bottleneck as the machine
approaches 64TB.  There are just too many LMBs to use a linear
search.

On a 60TB machine we recently saw the following soft lockup during
drmem_init():

[   60.602386] watchdog: BUG: soft lockup - CPU#9 stuck for 23s! [swapper/0:1]
[   60.602414] Modules linked in:
[   60.602417] Supported: No, Unreleased kernel
[   60.602423] CPU: 9 PID: 1 Comm: swapper/0 Not tainted 5.3.18-2-default #1 SLE15-SP2 (unreleased)
[   60.602426] NIP:  c000000000095c0c LR: c000000000095bb0 CTR: 0000000000000000
[   60.602430] REGS: c00022c7fc497830 TRAP: 0901   Not tainted  (5.3.18-2-default)
[   60.602432] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 44000244  XER: 00000000
[   60.602442] CFAR: c000000000095c18 IRQMASK: 0 
               GPR00: c000000000095bb0 c00022c7fc497ac0 c00000000162cc00 c0003bffffff5e08 
               GPR04: 0000000000000000 c000000000ea539a 000000000000002f 0000000010000000 
               GPR08: c00007fc5f59ffb8 000014bc50000000 c00007fc5f1f1a30 c0000000014f2fb8 
               GPR12: 0000000000000000 c00000001e980600 
[   60.602464] NIP [c000000000095c0c] hot_add_scn_to_nid+0xbc/0x400
[   60.602467] LR [c000000000095bb0] hot_add_scn_to_nid+0x60/0x400
[   60.602470] Call Trace:
[   60.602473] [c00022c7fc497ac0] [c000000000095bb0] hot_add_scn_to_nid+0x60/0x400 (unreliable)
[   60.602478] [c00022c7fc497b20] [c00000000007a6a0] memory_add_physaddr_to_nid+0x20/0x60
[   60.602483] [c00022c7fc497b40] [c0000000010235a4] drmem_init+0x258/0x2d8
[   60.602485] [c00022c7fc497c10] [c000000000010694] do_one_initcall+0x64/0x300
[   60.602489] [c00022c7fc497ce0] [c0000000010144f8] kernel_init_freeable+0x2e8/0x3fc
[   60.602491] [c00022c7fc497db0] [c000000000010b0c] kernel_init+0x2c/0x160
[   60.602497] [c00022c7fc497e20] [c00000000000b960] ret_from_kernel_thread+0x5c/0x7c
[   60.602498] Instruction dump:
[   60.602501] 7d0a4214 7faa4040 419d0328 e92a0010 71290088 2fa90008 409e001c e92a0000 
[   60.602506] 7fbe4840 419c0010 7d274a14 7fbe4840 <419c00e4> 394a0018 7faa4040 409dffd0 

This patch should eliminate the drmem_init() bottleneck during boot.

One other important thing to note is that this only addresses part of
the slowdown during memory hotplug when there are many LMBs.  A far larger
part of it is caused by the linear memblock search in find_memory_block().
That problem is addressed with this patch:

https://lore.kernel.org/lkml/20200121231028.13699-1-cheloha@linux.ibm.com/

which is in linux-next.  The numbers I quote here in the commit message
for time improvements during hotplug are taken with that patch applied.

Without it, hotplug is even slower.

 arch/powerpc/include/asm/drmem.h              |  3 ++
 arch/powerpc/mm/drmem.c                       | 33 +++++++++++++++++++
 arch/powerpc/mm/numa.c                        | 30 +++++++----------
 .../platforms/pseries/hotplug-memory.c        | 11 ++-----
 4 files changed, 50 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
index 3d76e1c388c2..a37cbe794cdd 100644
--- a/arch/powerpc/include/asm/drmem.h
+++ b/arch/powerpc/include/asm/drmem.h
@@ -88,6 +88,9 @@ static inline bool drmem_lmb_reserved(struct drmem_lmb *lmb)
 	return lmb->flags & DRMEM_LMB_RESERVED;
 }
 
+struct drmem_lmb *drmem_find_lmb_by_base_addr(unsigned long);
+struct drmem_lmb *drmem_find_lmb_by_drc_index(unsigned long);
+
 u64 drmem_lmb_memory_max(void);
 void __init walk_drmem_lmbs(struct device_node *dn,
 			void (*func)(struct drmem_lmb *, const __be32 **));
diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
index 557d9080604d..7c464b0a256e 100644
--- a/arch/powerpc/mm/drmem.c
+++ b/arch/powerpc/mm/drmem.c
@@ -11,9 +11,12 @@
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/memblock.h>
+#include <linux/xarray.h>
 #include <asm/prom.h>
 #include <asm/drmem.h>
 
+static DEFINE_XARRAY(drmem_lmb_base_addr);
+static DEFINE_XARRAY(drmem_lmb_drc_index);
 static struct drmem_lmb_info __drmem_info;
 struct drmem_lmb_info *drmem_info = &__drmem_info;
 
@@ -25,6 +28,31 @@ u64 drmem_lmb_memory_max(void)
 	return last_lmb->base_addr + drmem_lmb_size();
 }
 
+struct drmem_lmb *drmem_find_lmb_by_base_addr(unsigned long base_addr)
+{
+	return xa_load(&drmem_lmb_base_addr, base_addr);
+}
+
+struct drmem_lmb *drmem_find_lmb_by_drc_index(unsigned long drc_index)
+{
+	return xa_load(&drmem_lmb_drc_index, drc_index);
+}
+
+static int drmem_lmb_cache_for_lookup(struct drmem_lmb *lmb)
+{
+	void *ret;
+
+	ret = xa_store(&drmem_lmb_base_addr, lmb->base_addr, lmb,  GFP_KERNEL);
+	if (xa_err(ret))
+		return xa_err(ret);
+
+	ret = xa_store(&drmem_lmb_drc_index, lmb->drc_index, lmb, GFP_KERNEL);
+	if (xa_err(ret))
+		return xa_err(ret);
+
+	return 0;
+}
+
 static u32 drmem_lmb_flags(struct drmem_lmb *lmb)
 {
 	/*
@@ -364,6 +392,8 @@ static void __init init_drmem_v1_lmbs(const __be32 *prop)
 
 	for_each_drmem_lmb(lmb) {
 		read_drconf_v1_cell(lmb, &prop);
+		if (drmem_lmb_cache_for_lookup(lmb) != 0)
+			return;
 		lmb_set_nid(lmb);
 	}
 }
@@ -411,6 +441,9 @@ static void __init init_drmem_v2_lmbs(const __be32 *prop)
 			lmb->aa_index = dr_cell.aa_index;
 			lmb->flags = dr_cell.flags;
 
+			if (drmem_lmb_cache_for_lookup(lmb) != 0)
+				return;
+
 			lmb_set_nid(lmb);
 		}
 	}
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 50d68d21ddcc..23684d44549f 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -958,27 +958,21 @@ early_param("topology_updates", early_topology_updates);
 static int hot_add_drconf_scn_to_nid(unsigned long scn_addr)
 {
 	struct drmem_lmb *lmb;
-	unsigned long lmb_size;
-	int nid = NUMA_NO_NODE;
-
-	lmb_size = drmem_lmb_size();
-
-	for_each_drmem_lmb(lmb) {
-		/* skip this block if it is reserved or not assigned to
-		 * this partition */
-		if ((lmb->flags & DRCONF_MEM_RESERVED)
-		    || !(lmb->flags & DRCONF_MEM_ASSIGNED))
-			continue;
 
-		if ((scn_addr < lmb->base_addr)
-		    || (scn_addr >= (lmb->base_addr + lmb_size)))
-			continue;
+	lmb = drmem_find_lmb_by_base_addr(scn_addr);
+	if (lmb == NULL)
+		return NUMA_NO_NODE;
 
-		nid = of_drconf_to_nid_single(lmb);
-		break;
-	}
+	/*
+	 * We can't use it if it is reserved or not assigned to
+	 * this partition.
+	 */
+	if (lmb->flags & DRCONF_MEM_RESERVED)
+		return NUMA_NO_NODE;
+	if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
+		return NUMA_NO_NODE;
 
-	return nid;
+	return of_drconf_to_nid_single(lmb);
 }
 
 /*
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index c126b94d1943..29bd19831a9a 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -222,17 +222,10 @@ static int get_lmb_range(u32 drc_index, int n_lmbs,
 			 struct drmem_lmb **start_lmb,
 			 struct drmem_lmb **end_lmb)
 {
-	struct drmem_lmb *lmb, *start, *end;
+	struct drmem_lmb *start, *end;
 	struct drmem_lmb *last_lmb;
 
-	start = NULL;
-	for_each_drmem_lmb(lmb) {
-		if (lmb->drc_index == drc_index) {
-			start = lmb;
-			break;
-		}
-	}
-
+	start = drmem_find_lmb_by_drc_index(drc_index);
 	if (!start)
 		return -EINVAL;
 
-- 
2.24.1

