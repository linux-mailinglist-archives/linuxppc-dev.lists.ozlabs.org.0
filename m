Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCD6168504
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 18:32:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48PJSN63jRzDqpf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2020 04:32:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cheloha@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48PJQM0l9SzDqNS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2020 04:30:50 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01LHQUsK011002; Fri, 21 Feb 2020 12:30:45 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y9tkd86gm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 12:30:45 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01LHRZrg013596;
 Fri, 21 Feb 2020 12:30:44 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y9tkd86g8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 12:30:44 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01LHUFuS029092;
 Fri, 21 Feb 2020 17:30:44 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 2y68976n03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 17:30:44 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01LHUhx74719466
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 17:30:43 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 518B6B2070;
 Fri, 21 Feb 2020 17:30:43 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B772CB2068;
 Fri, 21 Feb 2020 17:30:42 +0000 (GMT)
Received: from rascal.austin.ibm.com (unknown [9.41.179.32])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 21 Feb 2020 17:30:42 +0000 (GMT)
From: Scott Cheloha <cheloha@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 1/2] powerpc/drmem: accelerate memory_add_physaddr_to_nid()
 with LMB xarray
Date: Fri, 21 Feb 2020 11:29:01 -0600
Message-Id: <20200221172901.1596249-2-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200128221113.17158-1-cheloha@linux.ibm.com>
References: <20200128221113.17158-1-cheloha@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-21_06:2020-02-21,
 2020-02-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002210132
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
 Michal Hocko <mhocko@suse.com>, Michal Suchanek <msuchanek@suse.com>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 Rick Lindley <ricklind@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On PowerPC, memory_add_physaddr_to_nid() uses a linear search to find
an LMB matching the given address.  This scales very poorly when there
are many LMBs.  The poor scaling cripples drmem_init() during boot:
lmb_set_nid(), which calls memory_add_physaddr_to_nid(), is called for
each LMB.

If we index each LMB in an xarray by its base address we can achieve
O(log n) search during memory_add_physaddr_to_nid(), which scales much
better.

For example, in the lab we have a 64TB P9 machine with 256MB LMBs.
So, suring drmem_init() we instantiate 249854 LMBs.  On a vanilla
kernel it completes drmem_init() in ~35 seconds with a soft lockup
trace.  On the patched kernel it completes drmem_init() in ~0.5
seconds.

Before:
[   53.721639] drmem: initializing drmem v2
[   80.604346] watchdog: BUG: soft lockup - CPU#65 stuck for 23s! [swapper/0:1]
[   80.604377] Modules linked in:
[   80.604389] CPU: 65 PID: 1 Comm: swapper/0 Not tainted 5.6.0-rc2+ #4
[   80.604397] NIP:  c0000000000a4980 LR: c0000000000a4940 CTR: 0000000000000000
[   80.604407] REGS: c0002dbff8493830 TRAP: 0901   Not tainted  (5.6.0-rc2+)
[   80.604412] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 44000248  XER: 0000000d
[   80.604431] CFAR: c0000000000a4a38 IRQMASK: 0
[   80.604431] GPR00: c0000000000a4940 c0002dbff8493ac0 c000000001904400 c0003cfffffede30
[   80.604431] GPR04: 0000000000000000 c000000000f4095a 000000000000002f 0000000010000000
[   80.604431] GPR08: c0000bf7ecdb7fb8 c0000bf7ecc2d3c8 0000000000000008 c00c0002fdfb2001
[   80.604431] GPR12: 0000000000000000 c00000001e8ec200
[   80.604477] NIP [c0000000000a4980] hot_add_scn_to_nid+0xa0/0x3e0
[   80.604486] LR [c0000000000a4940] hot_add_scn_to_nid+0x60/0x3e0
[   80.604492] Call Trace:
[   80.604498] [c0002dbff8493ac0] [c0000000000a4940] hot_add_scn_to_nid+0x60/0x3e0 (unreliable)
[   80.604509] [c0002dbff8493b20] [c000000000087c10] memory_add_physaddr_to_nid+0x20/0x60
[   80.604521] [c0002dbff8493b40] [c0000000010d4880] drmem_init+0x25c/0x2f0
[   80.604530] [c0002dbff8493c10] [c000000000010154] do_one_initcall+0x64/0x2c0
[   80.604540] [c0002dbff8493ce0] [c0000000010c4aa0] kernel_init_freeable+0x2d8/0x3a0
[   80.604550] [c0002dbff8493db0] [c000000000010824] kernel_init+0x2c/0x148
[   80.604560] [c0002dbff8493e20] [c00000000000b648] ret_from_kernel_thread+0x5c/0x74
[   80.604567] Instruction dump:
[   80.604574] 392918e8 e9490000 e90a000a e92a0000 80ea000c 1d080018 3908ffe8 7d094214
[   80.604586] 7fa94040 419d00dc e9490010 714a0088 <2faa0008> 409e00ac e9490000 7fbe5040
[   89.047390] drmem: 249854 LMB(s)

After:
[   53.424702] drmem: initializing drmem v2
[   53.898813] drmem: 249854 LMB(s)

lmb_set_nid() is called from dlpar_lmb_add() so this patch will also
improve memory hot-add speeds on big machines.

Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
---
 arch/powerpc/include/asm/drmem.h |  1 +
 arch/powerpc/mm/drmem.c          | 24 ++++++++++++++++++++++++
 arch/powerpc/mm/numa.c           | 29 ++++++++++-------------------
 3 files changed, 35 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
index 3d76e1c388c2..90a5a9ad872b 100644
--- a/arch/powerpc/include/asm/drmem.h
+++ b/arch/powerpc/include/asm/drmem.h
@@ -88,6 +88,7 @@ static inline bool drmem_lmb_reserved(struct drmem_lmb *lmb)
 	return lmb->flags & DRMEM_LMB_RESERVED;
 }
 
+struct drmem_lmb *drmem_find_lmb_by_base_addr(u64 base_addr);
 u64 drmem_lmb_memory_max(void);
 void __init walk_drmem_lmbs(struct device_node *dn,
 			void (*func)(struct drmem_lmb *, const __be32 **));
diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
index 44bfbdae920c..62cbe79e3860 100644
--- a/arch/powerpc/mm/drmem.c
+++ b/arch/powerpc/mm/drmem.c
@@ -11,12 +11,31 @@
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/memblock.h>
+#include <linux/xarray.h>
 #include <asm/prom.h>
 #include <asm/drmem.h>
 
+static DEFINE_XARRAY(drmem_lmb_xa_base_addr);
 static struct drmem_lmb_info __drmem_info;
 struct drmem_lmb_info *drmem_info = &__drmem_info;
 
+static int drmem_cache_lmb_for_lookup(struct drmem_lmb *lmb)
+{
+	void *ret;
+
+	ret = xa_store(&drmem_lmb_xa_base_addr, lmb->base_addr, lmb,
+		       GFP_KERNEL);
+	if (xa_is_err(ret))
+		return xa_err(ret);
+
+	return 0;
+}
+
+struct drmem_lmb *drmem_find_lmb_by_base_addr(u64 base_addr)
+{
+	return xa_load(&drmem_lmb_xa_base_addr, base_addr);
+}
+
 u64 drmem_lmb_memory_max(void)
 {
 	struct drmem_lmb *last_lmb;
@@ -364,6 +383,8 @@ static void __init init_drmem_v1_lmbs(const __be32 *prop)
 
 	for_each_drmem_lmb(lmb) {
 		read_drconf_v1_cell(lmb, &prop);
+		if (drmem_cache_lmb_for_lookup(lmb) != 0)
+			return;
 		lmb_set_nid(lmb);
 	}
 }
@@ -411,6 +432,9 @@ static void __init init_drmem_v2_lmbs(const __be32 *prop)
 			lmb->aa_index = dr_cell.aa_index;
 			lmb->flags = dr_cell.flags;
 
+			if (drmem_cache_lmb_for_lookup(lmb) != 0)
+				return;
+
 			lmb_set_nid(lmb);
 		}
 	}
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 3c7dec70cda0..0fd7963a991e 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -958,27 +958,18 @@ early_param("topology_updates", early_topology_updates);
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
-
-		if ((scn_addr < lmb->base_addr)
-		    || (scn_addr >= (lmb->base_addr + lmb_size)))
-			continue;
 
-		nid = of_drconf_to_nid_single(lmb);
-		break;
-	}
+	lmb = drmem_find_lmb_by_base_addr(scn_addr);
+	if (lmb == NULL)
+		return NUMA_NO_NODE;
+	
+	/* can't use this block if it is reserved or not assigned to
+	 * this partition */
+	if ((lmb->flags & DRCONF_MEM_RESERVED)
+	    || !(lmb->flags & DRCONF_MEM_ASSIGNED))
+		return NUMA_NO_NODE;
 
-	return nid;
+	return of_drconf_to_nid_single(lmb);
 }
 
 /*
-- 
2.24.1

