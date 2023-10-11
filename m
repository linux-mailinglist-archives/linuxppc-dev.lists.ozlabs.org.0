Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 217E87C4AE7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 08:44:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rKeyQn0s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S53Cm2ktYz6rjH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 17:44:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rKeyQn0s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S534J5yk2z3w61
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 17:38:08 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39B6HNw8030447
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 06:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Il7t17SsivA7S3qs/lh8Rq3IG3vZjIsdijWg6wc5nsQ=;
 b=rKeyQn0sCbzScjEFwumNxu6sIkZopcvXEzX0zgwkgt5D/J1rDcr6G5mLXnJOM/cNXZSQ
 mDQ4QWkJ32/0w/rUg6WqUJJp9BmLMk0+qE/shIti5EtmK41pmMD1hpj43TLlnWtFHR8y
 +PC/Sg2h9uty7mPovXjMGxl+oMmPNESl647M4NKgy2kxTF0cu11EdsVMQlTGCclfqMnZ
 zUdgAvttqoqKMyXa6nN65IwuSJH1NU2JjFK/kZyrs3GrBYq1DCnvvf1rCk408Yh+mHuP
 5JLNAVZLmOBgDSCUiRNphIBHDapPowt5/w4EzzbXK1FtUoP7alBWg7Se8F1YPK4J37yK Ig== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tnpa58kmk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 06:38:06 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39B4ElXF024445
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:31 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkhnsp7xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:31 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39B5bUlr23003722
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:30 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 014C82004D
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:30 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 201A120040
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8359D6057F;
	Wed, 11 Oct 2023 16:37:24 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 06/12] powerpc: Annotate endianness of various variables and functions
Date: Wed, 11 Oct 2023 16:37:05 +1100
Message-ID: <20231011053711.93427-7-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011053711.93427-1-bgray@linux.ibm.com>
References: <20231011053711.93427-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RYrdQEJRdI3kBCznQcSqm9U0wc_Zvjop
X-Proofpoint-ORIG-GUID: RYrdQEJRdI3kBCznQcSqm9U0wc_Zvjop
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_03,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110057
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sparse reports several endianness warnings on variables and functions
that are consistently treated as big endian. There are no
multi-endianness shenanigans going on here so fix these low hanging
fruit up in one patch.

All changes are just type annotations; no endianness switching
operations are introduced by this patch.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h    |  2 +-
 arch/powerpc/include/asm/imc-pmu.h              | 16 ++++++++--------
 arch/powerpc/kernel/prom_init.c                 |  2 +-
 arch/powerpc/kexec/core_64.c                    |  4 ++--
 arch/powerpc/kexec/file_load_64.c               |  6 +++---
 arch/powerpc/mm/drmem.c                         |  2 +-
 arch/powerpc/perf/hv-24x7.c                     |  2 +-
 arch/powerpc/perf/imc-pmu.c                     |  9 +++++----
 arch/powerpc/platforms/powermac/feature.c       |  3 ++-
 arch/powerpc/platforms/pseries/hotplug-memory.c |  3 ++-
 10 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 5c497c862d75..7b0d0f9d343a 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -647,7 +647,7 @@ static inline pte_t pte_mkuser(pte_t pte)
  */
 static inline int pte_devmap(pte_t pte)
 {
-	u64 mask = cpu_to_be64(_PAGE_DEVMAP | _PAGE_PTE);
+	__be64 mask = cpu_to_be64(_PAGE_DEVMAP | _PAGE_PTE);
 
 	return (pte_raw(pte) & mask) == mask;
 }
diff --git a/arch/powerpc/include/asm/imc-pmu.h b/arch/powerpc/include/asm/imc-pmu.h
index 699a88584ae1..a656635df386 100644
--- a/arch/powerpc/include/asm/imc-pmu.h
+++ b/arch/powerpc/include/asm/imc-pmu.h
@@ -74,14 +74,14 @@ struct imc_events {
  * The following is the data structure to hold trace imc data.
  */
 struct trace_imc_data {
-	u64 tb1;
-	u64 ip;
-	u64 val;
-	u64 cpmc1;
-	u64 cpmc2;
-	u64 cpmc3;
-	u64 cpmc4;
-	u64 tb2;
+	__be64 tb1;
+	__be64 ip;
+	__be64 val;
+	__be64 cpmc1;
+	__be64 cpmc2;
+	__be64 cpmc3;
+	__be64 cpmc4;
+	__be64 tb2;
 };
 
 /* Event attribute array index */
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index d464ba412084..e67effdba85c 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -947,7 +947,7 @@ struct option_vector7 {
 } __packed;
 
 struct ibm_arch_vec {
-	struct { u32 mask, val; } pvrs[14];
+	struct { __be32 mask, val; } pvrs[14];
 
 	u8 num_vectors;
 
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index a79e28c91e2b..0bee7ca9a77c 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -379,8 +379,8 @@ void default_machine_kexec(struct kimage *image)
 
 #ifdef CONFIG_PPC_64S_HASH_MMU
 /* Values we need to export to the second kernel via the device tree. */
-static unsigned long htab_base;
-static unsigned long htab_size;
+static __be64 htab_base;
+static __be64 htab_size;
 
 static struct property htab_base_prop = {
 	.name = "linux,htab-base",
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 09187aca3d1f..961a6dd67365 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -32,7 +32,7 @@
 #include <asm/plpks.h>
 
 struct umem_info {
-	u64 *buf;		/* data buffer for usable-memory property */
+	__be64 *buf;		/* data buffer for usable-memory property */
 	u32 size;		/* size allocated for the data buffer */
 	u32 max_entries;	/* maximum no. of entries */
 	u32 idx;		/* index of current entry */
@@ -443,10 +443,10 @@ static int locate_mem_hole_bottom_up_ppc64(struct kexec_buf *kbuf,
  *
  * Returns buffer on success, NULL on error.
  */
-static u64 *check_realloc_usable_mem(struct umem_info *um_info, int cnt)
+static __be64 *check_realloc_usable_mem(struct umem_info *um_info, int cnt)
 {
 	u32 new_size;
-	u64 *tbuf;
+	__be64 *tbuf;
 
 	if ((um_info->idx + cnt) <= um_info->max_entries)
 		return um_info->buf;
diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
index 2369d1bf2411..fde7790277f7 100644
--- a/arch/powerpc/mm/drmem.c
+++ b/arch/powerpc/mm/drmem.c
@@ -67,7 +67,7 @@ static int drmem_update_dt_v1(struct device_node *memory,
 	struct property *new_prop;
 	struct of_drconf_cell_v1 *dr_cell;
 	struct drmem_lmb *lmb;
-	u32 *p;
+	__be32 *p;
 
 	new_prop = clone_property(prop, prop->length);
 	if (!new_prop)
diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index 3449be7c0d51..057ec2e3451d 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -1338,7 +1338,7 @@ static int get_count_from_result(struct perf_event *event,
 	for (i = count = 0, element_data = res->elements + data_offset;
 	     i < num_elements;
 	     i++, element_data += data_size + data_offset)
-		count += be64_to_cpu(*((u64 *) element_data));
+		count += be64_to_cpu(*((__be64 *)element_data));
 
 	*countp = count;
 
diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index eba2baabccb0..2016aee27037 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -1025,16 +1025,16 @@ static bool is_thread_imc_pmu(struct perf_event *event)
 	return false;
 }
 
-static u64 * get_event_base_addr(struct perf_event *event)
+static __be64 *get_event_base_addr(struct perf_event *event)
 {
 	u64 addr;
 
 	if (is_thread_imc_pmu(event)) {
 		addr = (u64)per_cpu(thread_imc_mem, smp_processor_id());
-		return (u64 *)(addr + (event->attr.config & IMC_EVENT_OFFSET_MASK));
+		return (__be64 *)(addr + (event->attr.config & IMC_EVENT_OFFSET_MASK));
 	}
 
-	return (u64 *)event->hw.event_base;
+	return (__be64 *)event->hw.event_base;
 }
 
 static void thread_imc_pmu_start_txn(struct pmu *pmu,
@@ -1058,7 +1058,8 @@ static int thread_imc_pmu_commit_txn(struct pmu *pmu)
 
 static u64 imc_read_counter(struct perf_event *event)
 {
-	u64 *addr, data;
+	__be64 *addr;
+	u64 data;
 
 	/*
 	 * In-Memory Collection (IMC) counters are free flowing counters.
diff --git a/arch/powerpc/platforms/powermac/feature.c b/arch/powerpc/platforms/powermac/feature.c
index ae62d432db8b..81c9fbae88b1 100644
--- a/arch/powerpc/platforms/powermac/feature.c
+++ b/arch/powerpc/platforms/powermac/feature.c
@@ -2614,7 +2614,8 @@ static void __init probe_one_macio(const char *name, const char *compat, int typ
 	struct device_node*	node;
 	int			i;
 	volatile u32 __iomem	*base;
-	const u32		*addrp, *revp;
+	const __be32		*addrp;
+	const u32		*revp;
 	phys_addr_t		addr;
 	u64			size;
 
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index aa4042dcd6d4..a43bfb01720a 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -55,7 +55,8 @@ static bool find_aa_index(struct device_node *dr_node,
 			 struct property *ala_prop,
 			 const u32 *lmb_assoc, u32 *aa_index)
 {
-	u32 *assoc_arrays, new_prop_size;
+	__be32 *assoc_arrays;
+	u32 new_prop_size;
 	struct property *new_prop;
 	int aa_arrays, aa_array_entries, aa_array_sz;
 	int i, index;
-- 
2.39.2

