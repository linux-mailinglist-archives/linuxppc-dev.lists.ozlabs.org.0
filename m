Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBE7231DAA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 13:51:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGsM828zZzDqhH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 21:51:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGs763V6jzDqWy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 21:40:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BGs7554Q5z8tSY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 21:40:49 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BGs754cMMz9sSd; Wed, 29 Jul 2020 21:40:49 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BGs751s4hz9sRN
 for <linuxppc-dev@ozlabs.org>; Wed, 29 Jul 2020 21:40:49 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06TBZRTI102232; Wed, 29 Jul 2020 07:40:44 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32k2sb938t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 07:40:43 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06TBa7Mj103914;
 Wed, 29 Jul 2020 07:40:43 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32k2sb937e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 07:40:43 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06TBe786010270;
 Wed, 29 Jul 2020 11:40:40 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 32gcpx50sq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 11:40:40 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06TBeb5s29622278
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jul 2020 11:40:37 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92BB111C04A;
 Wed, 29 Jul 2020 11:40:37 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B22211C05B;
 Wed, 29 Jul 2020 11:40:34 +0000 (GMT)
Received: from [192.168.0.8] (unknown [9.79.217.86])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 29 Jul 2020 11:40:33 +0000 (GMT)
Subject: [PATCH v6 05/11] powerpc/drmem: make lmb walk a bit more flexible
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 29 Jul 2020 17:10:32 +0530
Message-ID: <159602282727.575379.3979857013827701828.stgit@hbathini>
In-Reply-To: <159602259854.575379.16910915605574571585.stgit@hbathini>
References: <159602259854.575379.16910915605574571585.stgit@hbathini>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-29_04:2020-07-29,
 2020-07-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007290075
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
Cc: Pingfan Liu <piliu@redhat.com>, Kexec-ml <kexec@lists.infradead.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, numa & prom are the users of drmem lmb walk code. Loading
kdump with kexec_file also needs to walk the drmem LMBs to setup the
usable memory ranges for kdump kernel. But there are couple of issues
in using the code as is. One, walk_drmem_lmb() code is built into the
.init section currently, while kexec_file needs it later. Two, there
is no scope to pass data to the callback function for processing and/
or erroring out on certain conditions.

Fix that by, moving drmem LMB walk code out of .init section, adding
scope to pass data to the callback function and bailing out when
an error is encountered in the callback function.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Tested-by: Pingfan Liu <piliu@redhat.com>
Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---

v5 -> v6:
* Unchanged.

v4 -> v5:
* Unchanged.

v3 -> v4:
* Unchanged. Added Reviewed-by tag from Thiago.

v2 -> v3:
* Unchanged. Added Tested-by tag from Pingfan.

v1 -> v2:
* No changes.


 arch/powerpc/include/asm/drmem.h |    9 ++--
 arch/powerpc/kernel/prom.c       |   13 +++---
 arch/powerpc/mm/drmem.c          |   87 +++++++++++++++++++++++++-------------
 arch/powerpc/mm/numa.c           |   13 +++---
 4 files changed, 78 insertions(+), 44 deletions(-)

diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
index 414d209f45bb..17ccc6474ab6 100644
--- a/arch/powerpc/include/asm/drmem.h
+++ b/arch/powerpc/include/asm/drmem.h
@@ -90,13 +90,14 @@ static inline bool drmem_lmb_reserved(struct drmem_lmb *lmb)
 }
 
 u64 drmem_lmb_memory_max(void);
-void __init walk_drmem_lmbs(struct device_node *dn,
-			void (*func)(struct drmem_lmb *, const __be32 **));
+int walk_drmem_lmbs(struct device_node *dn, void *data,
+		    int (*func)(struct drmem_lmb *, const __be32 **, void *));
 int drmem_update_dt(void);
 
 #ifdef CONFIG_PPC_PSERIES
-void __init walk_drmem_lmbs_early(unsigned long node,
-			void (*func)(struct drmem_lmb *, const __be32 **));
+int __init
+walk_drmem_lmbs_early(unsigned long node, void *data,
+		      int (*func)(struct drmem_lmb *, const __be32 **, void *));
 #endif
 
 static inline void invalidate_lmb_associativity_index(struct drmem_lmb *lmb)
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 9cc49f265c86..7df78de378b0 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -468,8 +468,9 @@ static bool validate_mem_limit(u64 base, u64 *size)
  * This contains a list of memory blocks along with NUMA affinity
  * information.
  */
-static void __init early_init_drmem_lmb(struct drmem_lmb *lmb,
-					const __be32 **usm)
+static int  __init early_init_drmem_lmb(struct drmem_lmb *lmb,
+					const __be32 **usm,
+					void *data)
 {
 	u64 base, size;
 	int is_kexec_kdump = 0, rngs;
@@ -484,7 +485,7 @@ static void __init early_init_drmem_lmb(struct drmem_lmb *lmb,
 	 */
 	if ((lmb->flags & DRCONF_MEM_RESERVED) ||
 	    !(lmb->flags & DRCONF_MEM_ASSIGNED))
-		return;
+		return 0;
 
 	if (*usm)
 		is_kexec_kdump = 1;
@@ -499,7 +500,7 @@ static void __init early_init_drmem_lmb(struct drmem_lmb *lmb,
 		 */
 		rngs = dt_mem_next_cell(dt_root_size_cells, usm);
 		if (!rngs) /* there are no (base, size) duple */
-			return;
+			return 0;
 	}
 
 	do {
@@ -524,6 +525,8 @@ static void __init early_init_drmem_lmb(struct drmem_lmb *lmb,
 		if (lmb->flags & DRCONF_MEM_HOTREMOVABLE)
 			memblock_mark_hotplug(base, size);
 	} while (--rngs);
+
+	return 0;
 }
 #endif /* CONFIG_PPC_PSERIES */
 
@@ -534,7 +537,7 @@ static int __init early_init_dt_scan_memory_ppc(unsigned long node,
 #ifdef CONFIG_PPC_PSERIES
 	if (depth == 1 &&
 	    strcmp(uname, "ibm,dynamic-reconfiguration-memory") == 0) {
-		walk_drmem_lmbs_early(node, early_init_drmem_lmb);
+		walk_drmem_lmbs_early(node, NULL, early_init_drmem_lmb);
 		return 0;
 	}
 #endif
diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
index 59327cefbc6a..b2eeea39684c 100644
--- a/arch/powerpc/mm/drmem.c
+++ b/arch/powerpc/mm/drmem.c
@@ -14,6 +14,8 @@
 #include <asm/prom.h>
 #include <asm/drmem.h>
 
+static int n_root_addr_cells, n_root_size_cells;
+
 static struct drmem_lmb_info __drmem_info;
 struct drmem_lmb_info *drmem_info = &__drmem_info;
 
@@ -189,12 +191,13 @@ int drmem_update_dt(void)
 	return rc;
 }
 
-static void __init read_drconf_v1_cell(struct drmem_lmb *lmb,
+static void read_drconf_v1_cell(struct drmem_lmb *lmb,
 				       const __be32 **prop)
 {
 	const __be32 *p = *prop;
 
-	lmb->base_addr = dt_mem_next_cell(dt_root_addr_cells, &p);
+	lmb->base_addr = of_read_number(p, n_root_addr_cells);
+	p += n_root_addr_cells;
 	lmb->drc_index = of_read_number(p++, 1);
 
 	p++; /* skip reserved field */
@@ -205,29 +208,33 @@ static void __init read_drconf_v1_cell(struct drmem_lmb *lmb,
 	*prop = p;
 }
 
-static void __init __walk_drmem_v1_lmbs(const __be32 *prop, const __be32 *usm,
-			void (*func)(struct drmem_lmb *, const __be32 **))
+static int
+__walk_drmem_v1_lmbs(const __be32 *prop, const __be32 *usm, void *data,
+		     int (*func)(struct drmem_lmb *, const __be32 **, void *))
 {
 	struct drmem_lmb lmb;
 	u32 i, n_lmbs;
+	int ret = 0;
 
 	n_lmbs = of_read_number(prop++, 1);
-	if (n_lmbs == 0)
-		return;
-
 	for (i = 0; i < n_lmbs; i++) {
 		read_drconf_v1_cell(&lmb, &prop);
-		func(&lmb, &usm);
+		ret = func(&lmb, &usm, data);
+		if (ret)
+			break;
 	}
+
+	return ret;
 }
 
-static void __init read_drconf_v2_cell(struct of_drconf_cell_v2 *dr_cell,
+static void read_drconf_v2_cell(struct of_drconf_cell_v2 *dr_cell,
 				       const __be32 **prop)
 {
 	const __be32 *p = *prop;
 
 	dr_cell->seq_lmbs = of_read_number(p++, 1);
-	dr_cell->base_addr = dt_mem_next_cell(dt_root_addr_cells, &p);
+	dr_cell->base_addr = of_read_number(p, n_root_addr_cells);
+	p += n_root_addr_cells;
 	dr_cell->drc_index = of_read_number(p++, 1);
 	dr_cell->aa_index = of_read_number(p++, 1);
 	dr_cell->flags = of_read_number(p++, 1);
@@ -235,17 +242,16 @@ static void __init read_drconf_v2_cell(struct of_drconf_cell_v2 *dr_cell,
 	*prop = p;
 }
 
-static void __init __walk_drmem_v2_lmbs(const __be32 *prop, const __be32 *usm,
-			void (*func)(struct drmem_lmb *, const __be32 **))
+static int
+__walk_drmem_v2_lmbs(const __be32 *prop, const __be32 *usm, void *data,
+		     int (*func)(struct drmem_lmb *, const __be32 **, void *))
 {
 	struct of_drconf_cell_v2 dr_cell;
 	struct drmem_lmb lmb;
 	u32 i, j, lmb_sets;
+	int ret = 0;
 
 	lmb_sets = of_read_number(prop++, 1);
-	if (lmb_sets == 0)
-		return;
-
 	for (i = 0; i < lmb_sets; i++) {
 		read_drconf_v2_cell(&dr_cell, &prop);
 
@@ -259,21 +265,29 @@ static void __init __walk_drmem_v2_lmbs(const __be32 *prop, const __be32 *usm,
 			lmb.aa_index = dr_cell.aa_index;
 			lmb.flags = dr_cell.flags;
 
-			func(&lmb, &usm);
+			ret = func(&lmb, &usm, data);
+			if (ret)
+				break;
 		}
 	}
+
+	return ret;
 }
 
 #ifdef CONFIG_PPC_PSERIES
-void __init walk_drmem_lmbs_early(unsigned long node,
-			void (*func)(struct drmem_lmb *, const __be32 **))
+int __init walk_drmem_lmbs_early(unsigned long node, void *data,
+		int (*func)(struct drmem_lmb *, const __be32 **, void *))
 {
 	const __be32 *prop, *usm;
-	int len;
+	int len, ret = -ENODEV;
 
 	prop = of_get_flat_dt_prop(node, "ibm,lmb-size", &len);
 	if (!prop || len < dt_root_size_cells * sizeof(__be32))
-		return;
+		return ret;
+
+	/* Get the address & size cells */
+	n_root_addr_cells = dt_root_addr_cells;
+	n_root_size_cells = dt_root_size_cells;
 
 	drmem_info->lmb_size = dt_mem_next_cell(dt_root_size_cells, &prop);
 
@@ -281,20 +295,21 @@ void __init walk_drmem_lmbs_early(unsigned long node,
 
 	prop = of_get_flat_dt_prop(node, "ibm,dynamic-memory", &len);
 	if (prop) {
-		__walk_drmem_v1_lmbs(prop, usm, func);
+		ret = __walk_drmem_v1_lmbs(prop, usm, data, func);
 	} else {
 		prop = of_get_flat_dt_prop(node, "ibm,dynamic-memory-v2",
 					   &len);
 		if (prop)
-			__walk_drmem_v2_lmbs(prop, usm, func);
+			ret = __walk_drmem_v2_lmbs(prop, usm, data, func);
 	}
 
 	memblock_dump_all();
+	return ret;
 }
 
 #endif
 
-static int __init init_drmem_lmb_size(struct device_node *dn)
+static int init_drmem_lmb_size(struct device_node *dn)
 {
 	const __be32 *prop;
 	int len;
@@ -303,12 +318,12 @@ static int __init init_drmem_lmb_size(struct device_node *dn)
 		return 0;
 
 	prop = of_get_property(dn, "ibm,lmb-size", &len);
-	if (!prop || len < dt_root_size_cells * sizeof(__be32)) {
+	if (!prop || len < n_root_size_cells * sizeof(__be32)) {
 		pr_info("Could not determine LMB size\n");
 		return -1;
 	}
 
-	drmem_info->lmb_size = dt_mem_next_cell(dt_root_size_cells, &prop);
+	drmem_info->lmb_size = of_read_number(prop, n_root_size_cells);
 	return 0;
 }
 
@@ -329,24 +344,36 @@ static const __be32 *of_get_usable_memory(struct device_node *dn)
 	return prop;
 }
 
-void __init walk_drmem_lmbs(struct device_node *dn,
-			    void (*func)(struct drmem_lmb *, const __be32 **))
+int walk_drmem_lmbs(struct device_node *dn, void *data,
+		    int (*func)(struct drmem_lmb *, const __be32 **, void *))
 {
 	const __be32 *prop, *usm;
+	int ret = -ENODEV;
+
+	if (!of_root)
+		return ret;
+
+	/* Get the address & size cells */
+	of_node_get(of_root);
+	n_root_addr_cells = of_n_addr_cells(of_root);
+	n_root_size_cells = of_n_size_cells(of_root);
+	of_node_put(of_root);
 
 	if (init_drmem_lmb_size(dn))
-		return;
+		return ret;
 
 	usm = of_get_usable_memory(dn);
 
 	prop = of_get_property(dn, "ibm,dynamic-memory", NULL);
 	if (prop) {
-		__walk_drmem_v1_lmbs(prop, usm, func);
+		ret = __walk_drmem_v1_lmbs(prop, usm, data, func);
 	} else {
 		prop = of_get_property(dn, "ibm,dynamic-memory-v2", NULL);
 		if (prop)
-			__walk_drmem_v2_lmbs(prop, usm, func);
+			ret = __walk_drmem_v2_lmbs(prop, usm, data, func);
 	}
+
+	return ret;
 }
 
 static void __init init_drmem_v1_lmbs(const __be32 *prop)
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 9fcf2d195830..88eb6894418d 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -644,8 +644,9 @@ static inline int __init read_usm_ranges(const __be32 **usm)
  * Extract NUMA information from the ibm,dynamic-reconfiguration-memory
  * node.  This assumes n_mem_{addr,size}_cells have been set.
  */
-static void __init numa_setup_drmem_lmb(struct drmem_lmb *lmb,
-					const __be32 **usm)
+static int __init numa_setup_drmem_lmb(struct drmem_lmb *lmb,
+					const __be32 **usm,
+					void *data)
 {
 	unsigned int ranges, is_kexec_kdump = 0;
 	unsigned long base, size, sz;
@@ -657,7 +658,7 @@ static void __init numa_setup_drmem_lmb(struct drmem_lmb *lmb,
 	 */
 	if ((lmb->flags & DRCONF_MEM_RESERVED)
 	    || !(lmb->flags & DRCONF_MEM_ASSIGNED))
-		return;
+		return 0;
 
 	if (*usm)
 		is_kexec_kdump = 1;
@@ -669,7 +670,7 @@ static void __init numa_setup_drmem_lmb(struct drmem_lmb *lmb,
 	if (is_kexec_kdump) {
 		ranges = read_usm_ranges(usm);
 		if (!ranges) /* there are no (base, size) duple */
-			return;
+			return 0;
 	}
 
 	do {
@@ -686,6 +687,8 @@ static void __init numa_setup_drmem_lmb(struct drmem_lmb *lmb,
 		if (sz)
 			memblock_set_node(base, sz, &memblock.memory, nid);
 	} while (--ranges);
+
+	return 0;
 }
 
 static int __init parse_numa_properties(void)
@@ -787,7 +790,7 @@ static int __init parse_numa_properties(void)
 	 */
 	memory = of_find_node_by_path("/ibm,dynamic-reconfiguration-memory");
 	if (memory) {
-		walk_drmem_lmbs(memory, numa_setup_drmem_lmb);
+		walk_drmem_lmbs(memory, NULL, numa_setup_drmem_lmb);
 		of_node_put(memory);
 	}
 


