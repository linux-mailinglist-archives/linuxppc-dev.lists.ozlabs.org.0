Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D08168517
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 18:35:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48PJWz3cRKzDqv2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2020 04:35:43 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48PJQN2yp4zDqNS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2020 04:30:52 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01LHRBnm162980; Fri, 21 Feb 2020 12:30:47 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y8ubyanyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 12:30:46 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01LHRfKM164248;
 Fri, 21 Feb 2020 12:30:45 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y8ubyany9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 12:30:45 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01LHUIrl017325;
 Fri, 21 Feb 2020 17:30:44 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 2y68976n8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 17:30:44 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01LHUiPJ48562490
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 17:30:44 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BF41B2066;
 Fri, 21 Feb 2020 17:30:44 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76031B2073;
 Fri, 21 Feb 2020 17:30:43 +0000 (GMT)
Received: from rascal.austin.ibm.com (unknown [9.41.179.32])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 21 Feb 2020 17:30:43 +0000 (GMT)
From: Scott Cheloha <cheloha@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 2/2] pseries/hotplug-memory: leverage xarray API to
 simplify code
Date: Fri, 21 Feb 2020 11:29:02 -0600
Message-Id: <20200221172901.1596249-3-cheloha@linux.ibm.com>
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
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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

The xarray API has entry marking (xa_set_mark/xa_clear_mark) and a
range-based iterator (xa_for_each_range), so there is no need for the
pseries hotplug code to maintain its own implementation of these
features.

This patch introduces an xarray of drmem_lmb structures indexed by
each LMB's DRC index (drmem_lmb.drc_index).  The xarray is protected
by the hotplug lock.  LMBs are indexed into the xarray during
drmem_init() and accessed during hotplug operations.

Custom LMB search, iteration, and marking code is replaced with xarray
equivalents.  The result is more compact.  The code ought to run
faster, too: several linear searches have been replaced with xa_load(),
which runs in sub-linear time.

The array of LMBs, drmem_info.lmbs[], is kept to preserve the ordering
of LMBs read from the firmware in drmem_init() during firmware writes
in drmem_update_dt().

Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
---
 arch/powerpc/include/asm/drmem.h              |  26 +--
 arch/powerpc/mm/drmem.c                       |  38 ++--
 .../platforms/pseries/hotplug-memory.c        | 207 ++++++------------
 3 files changed, 92 insertions(+), 179 deletions(-)

diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
index 90a5a9ad872b..97e07eec7eda 100644
--- a/arch/powerpc/include/asm/drmem.h
+++ b/arch/powerpc/include/asm/drmem.h
@@ -26,13 +26,8 @@ struct drmem_lmb_info {
 
 extern struct drmem_lmb_info *drmem_info;
 
-#define for_each_drmem_lmb_in_range(lmb, start, end)		\
-	for ((lmb) = (start); (lmb) <= (end); (lmb)++)
-
-#define for_each_drmem_lmb(lmb)					\
-	for_each_drmem_lmb_in_range((lmb),			\
-		&drmem_info->lmbs[0],				\
-		&drmem_info->lmbs[drmem_info->n_lmbs - 1])
+struct xarray;
+extern struct xarray *drmem_lmb_xa;
 
 /*
  * The of_drconf_cell_v1 struct defines the layout of the LMB data
@@ -71,23 +66,6 @@ static inline u32 drmem_lmb_size(void)
 	return drmem_info->lmb_size;
 }
 
-#define DRMEM_LMB_RESERVED	0x80000000
-
-static inline void drmem_mark_lmb_reserved(struct drmem_lmb *lmb)
-{
-	lmb->flags |= DRMEM_LMB_RESERVED;
-}
-
-static inline void drmem_remove_lmb_reservation(struct drmem_lmb *lmb)
-{
-	lmb->flags &= ~DRMEM_LMB_RESERVED;
-}
-
-static inline bool drmem_lmb_reserved(struct drmem_lmb *lmb)
-{
-	return lmb->flags & DRMEM_LMB_RESERVED;
-}
-
 struct drmem_lmb *drmem_find_lmb_by_base_addr(u64 base_addr);
 u64 drmem_lmb_memory_max(void);
 void __init walk_drmem_lmbs(struct device_node *dn,
diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
index 62cbe79e3860..013ab2689bd8 100644
--- a/arch/powerpc/mm/drmem.c
+++ b/arch/powerpc/mm/drmem.c
@@ -16,6 +16,8 @@
 #include <asm/drmem.h>
 
 static DEFINE_XARRAY(drmem_lmb_xa_base_addr);
+static DEFINE_XARRAY(drmem_lmb_xa_drc_index);
+struct xarray *drmem_lmb_xa = &drmem_lmb_xa_drc_index;
 static struct drmem_lmb_info __drmem_info;
 struct drmem_lmb_info *drmem_info = &__drmem_info;
 
@@ -27,6 +29,10 @@ static int drmem_cache_lmb_for_lookup(struct drmem_lmb *lmb)
 		       GFP_KERNEL);
 	if (xa_is_err(ret))
 		return xa_err(ret);
+	ret = xa_store(&drmem_lmb_xa_drc_index, lmb->drc_index, lmb,
+		       GFP_KERNEL);
+	if (xa_is_err(ret))
+		return xa_err(ret);
 
 	return 0;
 }
@@ -44,15 +50,6 @@ u64 drmem_lmb_memory_max(void)
 	return last_lmb->base_addr + drmem_lmb_size();
 }
 
-static u32 drmem_lmb_flags(struct drmem_lmb *lmb)
-{
-	/*
-	 * Return the value of the lmb flags field minus the reserved
-	 * bit used internally for hotplug processing.
-	 */
-	return lmb->flags & ~DRMEM_LMB_RESERVED;
-}
-
 static struct property *clone_property(struct property *prop, u32 prop_sz)
 {
 	struct property *new_prop;
@@ -84,6 +81,7 @@ static int drmem_update_dt_v1(struct device_node *memory,
 	struct of_drconf_cell_v1 *dr_cell;
 	struct drmem_lmb *lmb;
 	u32 *p;
+	int i;
 
 	new_prop = clone_property(prop, prop->length);
 	if (!new_prop)
@@ -94,11 +92,12 @@ static int drmem_update_dt_v1(struct device_node *memory,
 
 	dr_cell = (struct of_drconf_cell_v1 *)p;
 
-	for_each_drmem_lmb(lmb) {
+	for (i = 0; i < drmem_info->n_lmbs; i++) {
+		lmb = &drmem_info->lmbs[i];
 		dr_cell->base_addr = cpu_to_be64(lmb->base_addr);
 		dr_cell->drc_index = cpu_to_be32(lmb->drc_index);
 		dr_cell->aa_index = cpu_to_be32(lmb->aa_index);
-		dr_cell->flags = cpu_to_be32(drmem_lmb_flags(lmb));
+		dr_cell->flags = cpu_to_be32(lmb->flags);
 
 		dr_cell++;
 	}
@@ -113,7 +112,7 @@ static void init_drconf_v2_cell(struct of_drconf_cell_v2 *dr_cell,
 	dr_cell->base_addr = cpu_to_be64(lmb->base_addr);
 	dr_cell->drc_index = cpu_to_be32(lmb->drc_index);
 	dr_cell->aa_index = cpu_to_be32(lmb->aa_index);
-	dr_cell->flags = cpu_to_be32(drmem_lmb_flags(lmb));
+	dr_cell->flags = cpu_to_be32(lmb->flags);
 }
 
 static int drmem_update_dt_v2(struct device_node *memory,
@@ -124,11 +123,13 @@ static int drmem_update_dt_v2(struct device_node *memory,
 	struct drmem_lmb *lmb, *prev_lmb;
 	u32 lmb_sets, prop_sz, seq_lmbs;
 	u32 *p;
+	int i;
 
 	/* First pass, determine how many LMB sets are needed. */
 	lmb_sets = 0;
 	prev_lmb = NULL;
-	for_each_drmem_lmb(lmb) {
+	for (i = 0; i < drmem_info->n_lmbs; i++) {
+		lmb = &drmem_info->lmbs[i];
 		if (!prev_lmb) {
 			prev_lmb = lmb;
 			lmb_sets++;
@@ -136,7 +137,7 @@ static int drmem_update_dt_v2(struct device_node *memory,
 		}
 
 		if (prev_lmb->aa_index != lmb->aa_index ||
-		    drmem_lmb_flags(prev_lmb) != drmem_lmb_flags(lmb))
+		    prev_lmb->flags != lmb->flags)
 			lmb_sets++;
 
 		prev_lmb = lmb;
@@ -155,7 +156,8 @@ static int drmem_update_dt_v2(struct device_node *memory,
 	/* Second pass, populate the LMB set data */
 	prev_lmb = NULL;
 	seq_lmbs = 0;
-	for_each_drmem_lmb(lmb) {
+	for (i = 0; i < drmem_info->n_lmbs; i++) {
+		lmb = &drmem_info->lmbs[i];
 		if (prev_lmb == NULL) {
 			/* Start of first LMB set */
 			prev_lmb = lmb;
@@ -165,7 +167,7 @@ static int drmem_update_dt_v2(struct device_node *memory,
 		}
 
 		if (prev_lmb->aa_index != lmb->aa_index ||
-		    drmem_lmb_flags(prev_lmb) != drmem_lmb_flags(lmb)) {
+		    prev_lmb->flags != lmb->flags) {
 			/* end of one set, start of another */
 			dr_cell->seq_lmbs = cpu_to_be32(seq_lmbs);
 			dr_cell++;
@@ -371,6 +373,7 @@ void __init walk_drmem_lmbs(struct device_node *dn,
 static void __init init_drmem_v1_lmbs(const __be32 *prop)
 {
 	struct drmem_lmb *lmb;
+	int i;
 
 	drmem_info->n_lmbs = of_read_number(prop++, 1);
 	if (drmem_info->n_lmbs == 0)
@@ -381,7 +384,8 @@ static void __init init_drmem_v1_lmbs(const __be32 *prop)
 	if (!drmem_info->lmbs)
 		return;
 
-	for_each_drmem_lmb(lmb) {
+	for (i = 0; i < drmem_info->n_lmbs; i++) {
+		lmb = &drmem_info->lmbs[i];
 		read_drconf_v1_cell(lmb, &prop);
 		if (drmem_cache_lmb_for_lookup(lmb) != 0)
 			return;
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index a4d40a3ceea3..61d4c3c1e0fd 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -13,6 +13,7 @@
 #include <linux/memory.h>
 #include <linux/memory_hotplug.h>
 #include <linux/slab.h>
+#include <linux/xarray.h>
 
 #include <asm/firmware.h>
 #include <asm/machdep.h>
@@ -218,35 +219,6 @@ static struct memory_block *lmb_to_memblock(struct drmem_lmb *lmb)
 	return mem_block;
 }
 
-static int get_lmb_range(u32 drc_index, int n_lmbs,
-			 struct drmem_lmb **start_lmb,
-			 struct drmem_lmb **end_lmb)
-{
-	struct drmem_lmb *lmb, *start, *end;
-	struct drmem_lmb *last_lmb;
-
-	start = NULL;
-	for_each_drmem_lmb(lmb) {
-		if (lmb->drc_index == drc_index) {
-			start = lmb;
-			break;
-		}
-	}
-
-	if (!start)
-		return -EINVAL;
-
-	end = &start[n_lmbs - 1];
-
-	last_lmb = &drmem_info->lmbs[drmem_info->n_lmbs - 1];
-	if (end > last_lmb)
-		return -EINVAL;
-
-	*start_lmb = start;
-	*end_lmb = end;
-	return 0;
-}
-
 static int dlpar_change_lmb_state(struct drmem_lmb *lmb, bool online)
 {
 	struct memory_block *mem_block;
@@ -403,6 +375,7 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
 static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
 {
 	struct drmem_lmb *lmb;
+	unsigned long index;
 	int lmbs_removed = 0;
 	int lmbs_available = 0;
 	int rc;
@@ -413,7 +386,7 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
 		return -EINVAL;
 
 	/* Validate that there are enough LMBs to satisfy the request */
-	for_each_drmem_lmb(lmb) {
+	xa_for_each(drmem_lmb_xa, index, lmb) {
 		if (lmb_is_removable(lmb))
 			lmbs_available++;
 
@@ -427,7 +400,7 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
 		return -EINVAL;
 	}
 
-	for_each_drmem_lmb(lmb) {
+	xa_for_each(drmem_lmb_xa, index, lmb) {
 		rc = dlpar_remove_lmb(lmb);
 		if (rc)
 			continue;
@@ -435,7 +408,7 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
 		/* Mark this lmb so we can add it later if all of the
 		 * requested LMBs cannot be removed.
 		 */
-		drmem_mark_lmb_reserved(lmb);
+		xa_set_mark(drmem_lmb_xa, index, XA_MARK_0);
 
 		lmbs_removed++;
 		if (lmbs_removed == lmbs_to_remove)
@@ -445,29 +418,23 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
 	if (lmbs_removed != lmbs_to_remove) {
 		pr_err("Memory hot-remove failed, adding LMB's back\n");
 
-		for_each_drmem_lmb(lmb) {
-			if (!drmem_lmb_reserved(lmb))
-				continue;
-
+		xa_for_each_marked(drmem_lmb_xa, index, lmb, XA_MARK_0) {
 			rc = dlpar_add_lmb(lmb);
 			if (rc)
 				pr_err("Failed to add LMB back, drc index %x\n",
 				       lmb->drc_index);
 
-			drmem_remove_lmb_reservation(lmb);
+			xa_clear_mark(drmem_lmb_xa, index, XA_MARK_0);
 		}
 
 		rc = -EINVAL;
 	} else {
-		for_each_drmem_lmb(lmb) {
-			if (!drmem_lmb_reserved(lmb))
-				continue;
-
+		xa_for_each_marked(drmem_lmb_xa, index, lmb, XA_MARK_0) {
 			dlpar_release_drc(lmb->drc_index);
 			pr_info("Memory at %llx was hot-removed\n",
 				lmb->base_addr);
 
-			drmem_remove_lmb_reservation(lmb);
+			xa_clear_mark(drmem_lmb_xa, index, XA_MARK_0);
 		}
 		rc = 0;
 	}
@@ -478,25 +445,19 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
 static int dlpar_memory_remove_by_index(u32 drc_index)
 {
 	struct drmem_lmb *lmb;
-	int lmb_found;
 	int rc;
 
 	pr_info("Attempting to hot-remove LMB, drc index %x\n", drc_index);
 
-	lmb_found = 0;
-	for_each_drmem_lmb(lmb) {
-		if (lmb->drc_index == drc_index) {
-			lmb_found = 1;
-			rc = dlpar_remove_lmb(lmb);
-			if (!rc)
-				dlpar_release_drc(lmb->drc_index);
-
-			break;
-		}
+	lmb = xa_load(drmem_lmb_xa, drc_index);
+	if (lmb == NULL) {
+		pr_info("cannot hot-remove LMB %x: not found\n", drc_index);
+		return -EINVAL;
 	}
 
-	if (!lmb_found)
-		rc = -EINVAL;
+	rc = dlpar_remove_lmb(lmb);
+	if (!rc)
+		dlpar_release_drc(lmb->drc_index);
 
 	if (rc)
 		pr_info("Failed to hot-remove memory at %llx\n",
@@ -510,27 +471,22 @@ static int dlpar_memory_remove_by_index(u32 drc_index)
 static int dlpar_memory_readd_by_index(u32 drc_index)
 {
 	struct drmem_lmb *lmb;
-	int lmb_found;
 	int rc;
 
 	pr_info("Attempting to update LMB, drc index %x\n", drc_index);
 
-	lmb_found = 0;
-	for_each_drmem_lmb(lmb) {
-		if (lmb->drc_index == drc_index) {
-			lmb_found = 1;
-			rc = dlpar_remove_lmb(lmb);
-			if (!rc) {
-				rc = dlpar_add_lmb(lmb);
-				if (rc)
-					dlpar_release_drc(lmb->drc_index);
-			}
-			break;
-		}
+	lmb = xa_load(drmem_lmb_xa, drc_index);
+	if (lmb == NULL) {
+		pr_info("cannot update LMB %x: not found\n", drc_index);
+		return -EINVAL;
 	}
 
-	if (!lmb_found)
-		rc = -EINVAL;
+	rc = dlpar_remove_lmb(lmb);
+	if (!rc) {
+		rc = dlpar_add_lmb(lmb);
+		if (rc)
+			dlpar_release_drc(lmb->drc_index);
+	}
 
 	if (rc)
 		pr_info("Failed to update memory at %llx\n",
@@ -543,22 +499,21 @@ static int dlpar_memory_readd_by_index(u32 drc_index)
 
 static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 {
-	struct drmem_lmb *lmb, *start_lmb, *end_lmb;
+	struct drmem_lmb *lmb;
+	unsigned long first, index, last;
 	int lmbs_available = 0;
 	int rc;
 
 	pr_info("Attempting to hot-remove %u LMB(s) at %x\n",
 		lmbs_to_remove, drc_index);
 
-	if (lmbs_to_remove == 0)
-		return -EINVAL;
-
-	rc = get_lmb_range(drc_index, lmbs_to_remove, &start_lmb, &end_lmb);
-	if (rc)
+	if (lmbs_to_remove == 0 || drc_index > U32_MAX - lmbs_to_remove)
 		return -EINVAL;
+	first = drc_index;
+	last = drc_index + lmbs_to_remove - 1;
 
 	/* Validate that there are enough LMBs to satisfy the request */
-	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
+	xa_for_each_range(drmem_lmb_xa, index, lmb, first, last) {
 		if (lmb->flags & DRCONF_MEM_RESERVED)
 			break;
 
@@ -568,7 +523,7 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 	if (lmbs_available < lmbs_to_remove)
 		return -EINVAL;
 
-	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
+	xa_for_each_range(drmem_lmb_xa, index, lmb, first, last) {
 		if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
 			continue;
 
@@ -576,35 +531,29 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 		if (rc)
 			break;
 
-		drmem_mark_lmb_reserved(lmb);
+		xa_set_mark(drmem_lmb_xa, index, XA_MARK_0);
 	}
 
 	if (rc) {
 		pr_err("Memory indexed-count-remove failed, adding any removed LMBs\n");
 
 
-		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
-			if (!drmem_lmb_reserved(lmb))
-				continue;
-
+		xa_for_each_marked(drmem_lmb_xa, index, lmb, XA_MARK_0) {
 			rc = dlpar_add_lmb(lmb);
 			if (rc)
 				pr_err("Failed to add LMB, drc index %x\n",
 				       lmb->drc_index);
 
-			drmem_remove_lmb_reservation(lmb);
+			xa_clear_mark(drmem_lmb_xa, index, XA_MARK_0);
 		}
 		rc = -EINVAL;
 	} else {
-		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
-			if (!drmem_lmb_reserved(lmb))
-				continue;
-
+		xa_for_each_marked(drmem_lmb_xa, index, lmb, XA_MARK_0) {
 			dlpar_release_drc(lmb->drc_index);
 			pr_info("Memory at %llx (drc index %x) was hot-removed\n",
 				lmb->base_addr, lmb->drc_index);
 
-			drmem_remove_lmb_reservation(lmb);
+			xa_clear_mark(drmem_lmb_xa, index, XA_MARK_0);
 		}
 	}
 
@@ -687,6 +636,7 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 static int dlpar_memory_add_by_count(u32 lmbs_to_add)
 {
 	struct drmem_lmb *lmb;
+	unsigned long index;
 	int lmbs_available = 0;
 	int lmbs_added = 0;
 	int rc;
@@ -697,7 +647,7 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
 		return -EINVAL;
 
 	/* Validate that there are enough LMBs to satisfy the request */
-	for_each_drmem_lmb(lmb) {
+	xa_for_each(drmem_lmb_xa, index, lmb) {
 		if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
 			lmbs_available++;
 
@@ -708,7 +658,7 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
 	if (lmbs_available < lmbs_to_add)
 		return -EINVAL;
 
-	for_each_drmem_lmb(lmb) {
+	xa_for_each(drmem_lmb_xa, index, lmb) {
 		if (lmb->flags & DRCONF_MEM_ASSIGNED)
 			continue;
 
@@ -725,7 +675,7 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
 		/* Mark this lmb so we can remove it later if all of the
 		 * requested LMBs cannot be added.
 		 */
-		drmem_mark_lmb_reserved(lmb);
+		xa_set_mark(drmem_lmb_xa, index, XA_MARK_0);
 
 		lmbs_added++;
 		if (lmbs_added == lmbs_to_add)
@@ -735,10 +685,7 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
 	if (lmbs_added != lmbs_to_add) {
 		pr_err("Memory hot-add failed, removing any added LMBs\n");
 
-		for_each_drmem_lmb(lmb) {
-			if (!drmem_lmb_reserved(lmb))
-				continue;
-
+		xa_for_each_marked(drmem_lmb_xa, index, lmb, XA_MARK_0) {
 			rc = dlpar_remove_lmb(lmb);
 			if (rc)
 				pr_err("Failed to remove LMB, drc index %x\n",
@@ -746,17 +693,14 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
 			else
 				dlpar_release_drc(lmb->drc_index);
 
-			drmem_remove_lmb_reservation(lmb);
+			xa_clear_mark(drmem_lmb_xa, index, XA_MARK_0);
 		}
 		rc = -EINVAL;
 	} else {
-		for_each_drmem_lmb(lmb) {
-			if (!drmem_lmb_reserved(lmb))
-				continue;
-
+		xa_for_each_marked(drmem_lmb_xa, index, lmb, XA_MARK_0) {
 			pr_info("Memory at %llx (drc index %x) was hot-added\n",
 				lmb->base_addr, lmb->drc_index);
-			drmem_remove_lmb_reservation(lmb);
+			xa_clear_mark(drmem_lmb_xa, index, XA_MARK_0);
 		}
 		rc = 0;
 	}
@@ -767,27 +711,22 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
 static int dlpar_memory_add_by_index(u32 drc_index)
 {
 	struct drmem_lmb *lmb;
-	int rc, lmb_found;
+	int rc;
 
 	pr_info("Attempting to hot-add LMB, drc index %x\n", drc_index);
 
-	lmb_found = 0;
-	for_each_drmem_lmb(lmb) {
-		if (lmb->drc_index == drc_index) {
-			lmb_found = 1;
-			rc = dlpar_acquire_drc(lmb->drc_index);
-			if (!rc) {
-				rc = dlpar_add_lmb(lmb);
-				if (rc)
-					dlpar_release_drc(lmb->drc_index);
-			}
-
-			break;
-		}
+	lmb = xa_load(drmem_lmb_xa, drc_index);
+	if (lmb == NULL) {
+		pr_info("cannot hot-add LMB %x: not found\n", drc_index);
+		return -EINVAL;
 	}
 
-	if (!lmb_found)
-		rc = -EINVAL;
+	rc = dlpar_acquire_drc(lmb->drc_index);
+	if (!rc) {
+		rc = dlpar_add_lmb(lmb);
+		if (rc)
+			dlpar_release_drc(lmb->drc_index);
+	}
 
 	if (rc)
 		pr_info("Failed to hot-add memory, drc index %x\n", drc_index);
@@ -800,22 +739,21 @@ static int dlpar_memory_add_by_index(u32 drc_index)
 
 static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
 {
-	struct drmem_lmb *lmb, *start_lmb, *end_lmb;
+	struct drmem_lmb *lmb;
+	unsigned long first, index, last;
 	int lmbs_available = 0;
 	int rc;
 
 	pr_info("Attempting to hot-add %u LMB(s) at index %x\n",
 		lmbs_to_add, drc_index);
 
-	if (lmbs_to_add == 0)
-		return -EINVAL;
-
-	rc = get_lmb_range(drc_index, lmbs_to_add, &start_lmb, &end_lmb);
-	if (rc)
+	if (lmbs_to_add == 0 || drc_index > U32_MAX - lmbs_to_add)
 		return -EINVAL;
+	first = drc_index;
+	last = drc_index + lmbs_to_add - 1;
 
 	/* Validate that the LMBs in this range are not reserved */
-	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
+	xa_for_each_range(drmem_lmb_xa, index, lmb, first, last) {
 		if (lmb->flags & DRCONF_MEM_RESERVED)
 			break;
 
@@ -825,7 +763,7 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
 	if (lmbs_available < lmbs_to_add)
 		return -EINVAL;
 
-	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
+	xa_for_each_range(drmem_lmb_xa, index, lmb, first, last) {
 		if (lmb->flags & DRCONF_MEM_ASSIGNED)
 			continue;
 
@@ -839,16 +777,12 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
 			break;
 		}
 
-		drmem_mark_lmb_reserved(lmb);
+		xa_set_mark(drmem_lmb_xa, index, XA_MARK_0);
 	}
 
 	if (rc) {
 		pr_err("Memory indexed-count-add failed, removing any added LMBs\n");
-
-		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
-			if (!drmem_lmb_reserved(lmb))
-				continue;
-
+		xa_for_each_marked(drmem_lmb_xa, index, lmb, XA_MARK_0) {
 			rc = dlpar_remove_lmb(lmb);
 			if (rc)
 				pr_err("Failed to remove LMB, drc index %x\n",
@@ -856,17 +790,14 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
 			else
 				dlpar_release_drc(lmb->drc_index);
 
-			drmem_remove_lmb_reservation(lmb);
+			xa_clear_mark(drmem_lmb_xa, index, XA_MARK_0);
 		}
 		rc = -EINVAL;
 	} else {
-		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
-			if (!drmem_lmb_reserved(lmb))
-				continue;
-
+		xa_for_each_marked(drmem_lmb_xa, index, lmb, XA_MARK_0) {
 			pr_info("Memory at %llx (drc index %x) was hot-added\n",
 				lmb->base_addr, lmb->drc_index);
-			drmem_remove_lmb_reservation(lmb);
+			xa_clear_mark(drmem_lmb_xa, index, XA_MARK_0);
 		}
 	}
 
-- 
2.24.1

