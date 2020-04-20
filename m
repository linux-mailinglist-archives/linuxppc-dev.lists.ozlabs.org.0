Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 888B11B03E2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 10:10:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495KB45XhxzDql5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 18:10:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495JCH1mTrzDqJH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 17:26:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 495JCG41d7z8sxL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 17:26:02 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 495JCG3BXPz9sSm; Mon, 20 Apr 2020 17:26:02 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 495JCF5SY0z9s71
 for <linuxppc-dev@ozlabs.org>; Mon, 20 Apr 2020 17:26:00 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03K72lvA115337
 for <linuxppc-dev@ozlabs.org>; Mon, 20 Apr 2020 03:25:59 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gcbe4ryy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 20 Apr 2020 03:25:58 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Mon, 20 Apr 2020 08:25:14 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 Apr 2020 08:25:12 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 03K7PrrF38338976
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Apr 2020 07:25:53 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E674A4051;
 Mon, 20 Apr 2020 07:25:53 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D5BCA4055;
 Mon, 20 Apr 2020 07:25:51 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.25.223])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Apr 2020 07:25:51 +0000 (GMT)
Subject: [PATCH v2 1/2] powerpc/fadump: use static allocation for reserved
 memory ranges
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Mon, 20 Apr 2020 12:55:50 +0530
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20042007-4275-0000-0000-000003C31EA3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042007-4276-0000-0000-000038D89F5F
Message-Id: <158736754835.20831.15003408332721022400.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-20_02:2020-04-17,
 2020-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1011 suspectscore=2 malwarescore=0 spamscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004200063
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
Cc: stable@vger.kernel.org, Vasant Hegde <hegdevasant@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At times, memory ranges have to be looked up during early boot, when
kernel couldn't be initialized for dynamic memory allocation. In fact,
reserved-ranges look up is needed during FADump memory reservation.
Without accounting for reserved-ranges in reserving memory for FADump,
MPIPL boot fails with memory corruption issues. So, extend memory
ranges handling to support static allocation and populate reserved
memory ranges during early boot.

Fixes: dda9dbfeeb7a ("powerpc/fadump: consider reserved ranges while releasing memory")
Cc: stable@vger.kernel.org
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/include/asm/fadump-internal.h |    4 +
 arch/powerpc/kernel/fadump.c               |   77 ++++++++++++++++------------
 2 files changed, 48 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
index c814a2b..8d61c8f 100644
--- a/arch/powerpc/include/asm/fadump-internal.h
+++ b/arch/powerpc/include/asm/fadump-internal.h
@@ -64,12 +64,14 @@ struct fadump_memory_range {
 };
 
 /* fadump memory ranges info */
+#define RNG_NAME_SZ			16
 struct fadump_mrange_info {
-	char				name[16];
+	char				name[RNG_NAME_SZ];
 	struct fadump_memory_range	*mem_ranges;
 	u32				mem_ranges_sz;
 	u32				mem_range_cnt;
 	u32				max_mem_ranges;
+	bool				is_static;
 };
 
 /* Platform specific callback functions */
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 59e60a9..679277b 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -40,8 +40,17 @@ struct kobject *fadump_kobj;
 
 #ifndef CONFIG_PRESERVE_FA_DUMP
 static DEFINE_MUTEX(fadump_mutex);
-struct fadump_mrange_info crash_mrange_info = { "crash", NULL, 0, 0, 0 };
-struct fadump_mrange_info reserved_mrange_info = { "reserved", NULL, 0, 0, 0 };
+struct fadump_mrange_info crash_mrange_info = { "crash", NULL, 0, 0, 0, false };
+
+#define RESERVED_RNGS_SZ	16384 /* 16K - 128 entries */
+#define RESERVED_RNGS_CNT	(RESERVED_RNGS_SZ / \
+				 sizeof(struct fadump_memory_range))
+static struct fadump_memory_range rngs[RESERVED_RNGS_CNT];
+struct fadump_mrange_info reserved_mrange_info = { "reserved", rngs,
+						   RESERVED_RNGS_SZ, 0,
+						   RESERVED_RNGS_CNT, true };
+
+static void __init early_init_dt_scan_reserved_ranges(unsigned long node);
 
 #ifdef CONFIG_CMA
 static struct cma *fadump_cma;
@@ -110,6 +119,11 @@ static int __init fadump_cma_init(void) { return 1; }
 int __init early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
 				      int depth, void *data)
 {
+	if (depth == 0) {
+		early_init_dt_scan_reserved_ranges(node);
+		return 0;
+	}
+
 	if (depth != 1)
 		return 0;
 
@@ -728,10 +742,14 @@ void fadump_free_cpu_notes_buf(void)
 
 static void fadump_free_mem_ranges(struct fadump_mrange_info *mrange_info)
 {
+	if (mrange_info->is_static) {
+		mrange_info->mem_range_cnt = 0;
+		return;
+	}
+
 	kfree(mrange_info->mem_ranges);
-	mrange_info->mem_ranges = NULL;
-	mrange_info->mem_ranges_sz = 0;
-	mrange_info->max_mem_ranges = 0;
+	memset((void *)((u64)mrange_info + RNG_NAME_SZ), 0,
+	       (sizeof(struct fadump_mrange_info) - RNG_NAME_SZ));
 }
 
 /*
@@ -788,6 +806,12 @@ static inline int fadump_add_mem_range(struct fadump_mrange_info *mrange_info,
 		if (mrange_info->mem_range_cnt == mrange_info->max_mem_ranges) {
 			int ret;
 
+			if (mrange_info->is_static) {
+				pr_err("Reached array size limit for %s memory ranges\n",
+				       mrange_info->name);
+				return -ENOSPC;
+			}
+
 			ret = fadump_alloc_mem_ranges(mrange_info);
 			if (ret)
 				return ret;
@@ -1204,20 +1228,19 @@ static void sort_and_merge_mem_ranges(struct fadump_mrange_info *mrange_info)
  * Scan reserved-ranges to consider them while reserving/releasing
  * memory for FADump.
  */
-static inline int fadump_scan_reserved_mem_ranges(void)
+static void __init early_init_dt_scan_reserved_ranges(unsigned long node)
 {
-	struct device_node *root;
 	const __be32 *prop;
 	int len, ret = -1;
 	unsigned long i;
 
-	root = of_find_node_by_path("/");
-	if (!root)
-		return ret;
+	/* reserved-ranges already scanned */
+	if (reserved_mrange_info.mem_range_cnt != 0)
+		return;
 
-	prop = of_get_property(root, "reserved-ranges", &len);
+	prop = of_get_flat_dt_prop(node, "reserved-ranges", &len);
 	if (!prop)
-		return ret;
+		return;
 
 	/*
 	 * Each reserved range is an (address,size) pair, 2 cells each,
@@ -1239,7 +1262,8 @@ static inline int fadump_scan_reserved_mem_ranges(void)
 		}
 	}
 
-	return ret;
+	/* Compact reserved ranges */
+	sort_and_merge_mem_ranges(&reserved_mrange_info);
 }
 
 /*
@@ -1253,32 +1277,21 @@ static void fadump_release_memory(u64 begin, u64 end)
 	u64 ra_start, ra_end, tstart;
 	int i, ret;
 
-	fadump_scan_reserved_mem_ranges();
-
 	ra_start = fw_dump.reserve_dump_area_start;
 	ra_end = ra_start + fw_dump.reserve_dump_area_size;
 
 	/*
-	 * Add reserved dump area to reserved ranges list
-	 * and exclude all these ranges while releasing memory.
+	 * If reserved ranges array limit is hit, overwrite the last reserved
+	 * memory range with reserved dump area to ensure it is excluded from
+	 * the memory being released (reused for next FADump registration).
 	 */
-	ret = fadump_add_mem_range(&reserved_mrange_info, ra_start, ra_end);
-	if (ret != 0) {
-		/*
-		 * Not enough memory to setup reserved ranges but the system is
-		 * running shortage of memory. So, release all the memory except
-		 * Reserved dump area (reused for next fadump registration).
-		 */
-		if (begin < ra_end && end > ra_start) {
-			if (begin < ra_start)
-				fadump_release_reserved_area(begin, ra_start);
-			if (end > ra_end)
-				fadump_release_reserved_area(ra_end, end);
-		} else
-			fadump_release_reserved_area(begin, end);
+	if (reserved_mrange_info.mem_range_cnt ==
+	    reserved_mrange_info.max_mem_ranges)
+		reserved_mrange_info.mem_range_cnt--;
 
+	ret = fadump_add_mem_range(&reserved_mrange_info, ra_start, ra_end);
+	if (ret != 0)
 		return;
-	}
 
 	/* Get the reserved ranges list in order first. */
 	sort_and_merge_mem_ranges(&reserved_mrange_info);

