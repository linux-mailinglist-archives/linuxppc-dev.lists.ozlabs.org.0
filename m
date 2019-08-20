Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EEF95F88
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 15:10:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CWPb5TKfzDqZX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 23:10:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CV063h5mzDr0d
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:07:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46CV061Qjpz8t86
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:07:02 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46CV0574lBz9sDQ; Tue, 20 Aug 2019 22:07:01 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46CV050zH0z9sBF
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 22:07:00 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7KC1s9H015213
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:06:58 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ugekq5rwm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:06:58 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 20 Aug 2019 13:06:56 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 20 Aug 2019 13:06:54 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7KC6qh545875224
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Aug 2019 12:06:52 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C86CA4065;
 Tue, 20 Aug 2019 12:06:52 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB409A405F;
 Tue, 20 Aug 2019 12:06:50 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Aug 2019 12:06:50 +0000 (GMT)
Subject: [PATCH v5 22/31] powerpc/fadump: make crash memory ranges array
 allocation generic
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 20 Aug 2019 17:36:50 +0530
In-Reply-To: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19082012-0012-0000-0000-00000340AF10
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082012-0013-0000-0000-0000217AD2F2
Message-Id: <156630281003.8896.15269815395828804029.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200128
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make allocate_crash_memory_ranges() and free_crash_memory_ranges()
functions generic to reuse them for memory management of all types of
dynamic memory range arrays. This change helps in memory management
of reserved ranges array to be added later.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/fadump-common.h |   11 ++++
 arch/powerpc/kernel/fadump.c        |   99 +++++++++++++++++++----------------
 2 files changed, 64 insertions(+), 46 deletions(-)

diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
index fc408b0..d1ff5b2 100644
--- a/arch/powerpc/kernel/fadump-common.h
+++ b/arch/powerpc/kernel/fadump-common.h
@@ -83,11 +83,20 @@ struct fadump_crash_info_header {
 	struct cpumask	online_mask;
 };
 
-struct fad_crash_memory_ranges {
+struct fadump_memory_range {
 	unsigned long long	base;
 	unsigned long long	size;
 };
 
+/* fadump memory ranges info */
+struct fadump_mrange_info {
+	char				name[16];
+	struct fadump_memory_range	*mem_ranges;
+	int				mem_ranges_sz;
+	int				mem_range_cnt;
+	int				max_mem_ranges;
+};
+
 /* Platform specific callback functions */
 struct fadump_ops;
 
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 8dd2dcc..2dd4621 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -36,10 +36,7 @@
 static struct fw_dump fw_dump;
 
 static DEFINE_MUTEX(fadump_mutex);
-struct fad_crash_memory_ranges *crash_memory_ranges;
-int crash_memory_ranges_size;
-int crash_mem_ranges;
-int max_crash_mem_ranges;
+struct fadump_mrange_info crash_mrange_info = { "crash", NULL, 0, 0, 0 };
 
 #ifdef CONFIG_CMA
 static struct cma *fadump_cma;
@@ -487,46 +484,49 @@ void crash_fadump(struct pt_regs *regs, const char *str)
 	fw_dump.ops->fadump_trigger(fdh, str);
 }
 
-static void free_crash_memory_ranges(void)
+static void fadump_free_mem_ranges(struct fadump_mrange_info *mrange_info)
 {
-	kfree(crash_memory_ranges);
-	crash_memory_ranges = NULL;
-	crash_memory_ranges_size = 0;
-	max_crash_mem_ranges = 0;
+	kfree(mrange_info->mem_ranges);
+	mrange_info->mem_ranges = NULL;
+	mrange_info->mem_ranges_sz = 0;
+	mrange_info->max_mem_ranges = 0;
 }
 
 /*
- * Allocate or reallocate crash memory ranges array in incremental units
+ * Allocate or reallocate mem_ranges array in incremental units
  * of PAGE_SIZE.
  */
-static int allocate_crash_memory_ranges(void)
+static int fadump_alloc_mem_ranges(struct fadump_mrange_info *mrange_info)
 {
-	struct fad_crash_memory_ranges *new_array;
+	struct fadump_memory_range *new_array;
 	u64 new_size;
 
-	new_size = crash_memory_ranges_size + PAGE_SIZE;
-	pr_debug("Allocating %llu bytes of memory for crash memory ranges\n",
-		 new_size);
+	new_size = mrange_info->mem_ranges_sz + PAGE_SIZE;
+	pr_debug("Allocating %llu bytes of memory for %s memory ranges\n",
+		 new_size, mrange_info->name);
 
-	new_array = krealloc(crash_memory_ranges, new_size, GFP_KERNEL);
+	new_array = krealloc(mrange_info->mem_ranges, new_size, GFP_KERNEL);
 	if (new_array == NULL) {
-		pr_err("Insufficient memory for setting up crash memory ranges\n");
-		free_crash_memory_ranges();
+		pr_err("Insufficient memory for setting up %s memory ranges\n",
+		       mrange_info->name);
+		fadump_free_mem_ranges(mrange_info);
 		return -ENOMEM;
 	}
 
-	crash_memory_ranges = new_array;
-	crash_memory_ranges_size = new_size;
-	max_crash_mem_ranges = (new_size /
-				sizeof(struct fad_crash_memory_ranges));
+	mrange_info->mem_ranges = new_array;
+	mrange_info->mem_ranges_sz = new_size;
+	mrange_info->max_mem_ranges = (new_size /
+				       sizeof(struct fadump_memory_range));
 	return 0;
 }
 
-static inline int fadump_add_crash_memory(unsigned long long base,
-					  unsigned long long end)
+static inline int fadump_add_mem_range(struct fadump_mrange_info *mrange_info,
+				       unsigned long long base,
+				       unsigned long long end)
 {
 	u64  start, size;
 	bool is_adjacent = false;
+	struct fadump_memory_range *mem_ranges = mrange_info->mem_ranges;
 
 	if (base == end)
 		return 0;
@@ -535,31 +535,35 @@ static inline int fadump_add_crash_memory(unsigned long long base,
 	 * Fold adjacent memory ranges to bring down the memory ranges/
 	 * PT_LOAD segments count.
 	 */
-	if (crash_mem_ranges) {
-		start = crash_memory_ranges[crash_mem_ranges - 1].base;
-		size = crash_memory_ranges[crash_mem_ranges - 1].size;
+	if (mrange_info->mem_range_cnt) {
+		start = mem_ranges[mrange_info->mem_range_cnt - 1].base;
+		size  = mem_ranges[mrange_info->mem_range_cnt - 1].size;
 
 		if ((start + size) == base)
 			is_adjacent = true;
 	}
 	if (!is_adjacent) {
 		/* resize the array on reaching the limit */
-		if (crash_mem_ranges == max_crash_mem_ranges) {
+		if (mrange_info->mem_range_cnt == mrange_info->max_mem_ranges) {
 			int ret;
 
-			ret = allocate_crash_memory_ranges();
+			ret = fadump_alloc_mem_ranges(mrange_info);
 			if (ret)
 				return ret;
+
+			/* Update to the new resized array */
+			mem_ranges = mrange_info->mem_ranges;
 		}
 
 		start = base;
-		crash_memory_ranges[crash_mem_ranges].base = start;
-		crash_mem_ranges++;
+		mem_ranges[mrange_info->mem_range_cnt].base = start;
+		mrange_info->mem_range_cnt++;
 	}
 
-	crash_memory_ranges[crash_mem_ranges - 1].size = (end - start);
-	pr_debug("crash_memory_range[%d] [%#016llx-%#016llx], %#llx bytes\n",
-		(crash_mem_ranges - 1), start, end - 1, (end - start));
+	mem_ranges[mrange_info->mem_range_cnt - 1].size = (end - start);
+	pr_debug("%s_memory_range[%d] [%#016llx-%#016llx], %#llx bytes\n",
+		 mrange_info->name, (mrange_info->mem_range_cnt - 1),
+		 start, end - 1, (end - start));
 	return 0;
 }
 
@@ -574,18 +578,22 @@ static int fadump_exclude_reserved_area(unsigned long long start,
 
 	if ((ra_start < end) && (ra_end > start)) {
 		if ((start < ra_start) && (end > ra_end)) {
-			ret = fadump_add_crash_memory(start, ra_start);
+			ret = fadump_add_mem_range(&crash_mrange_info,
+						   start, ra_start);
 			if (ret)
 				return ret;
 
-			ret = fadump_add_crash_memory(ra_end, end);
+			ret = fadump_add_mem_range(&crash_mrange_info,
+						   ra_end, end);
 		} else if (start < ra_start) {
-			ret = fadump_add_crash_memory(start, ra_start);
+			ret = fadump_add_mem_range(&crash_mrange_info,
+						   start, ra_start);
 		} else if (ra_end < end) {
-			ret = fadump_add_crash_memory(ra_end, end);
+			ret = fadump_add_mem_range(&crash_mrange_info,
+						   ra_end, end);
 		}
 	} else
-		ret = fadump_add_crash_memory(start, end);
+		ret = fadump_add_mem_range(&crash_mrange_info, start, end);
 
 	return ret;
 }
@@ -634,7 +642,7 @@ static int fadump_setup_crash_memory_ranges(void)
 	int ret;
 
 	pr_debug("Setup crash memory ranges.\n");
-	crash_mem_ranges = 0;
+	crash_mrange_info.mem_range_cnt = 0;
 
 	/*
 	 * add the first memory chunk (RMA_START through boot_memory_size) as
@@ -643,7 +651,8 @@ static int fadump_setup_crash_memory_ranges(void)
 	 * specified during fadump registration. We need to create a separate
 	 * program header for this chunk with the correct offset.
 	 */
-	ret = fadump_add_crash_memory(RMA_START, fw_dump.boot_memory_size);
+	ret = fadump_add_mem_range(&crash_mrange_info,
+				   RMA_START, fw_dump.boot_memory_size);
 	if (ret)
 		return ret;
 
@@ -734,10 +743,10 @@ static int fadump_create_elfcore_headers(char *bufp)
 
 	/* setup PT_LOAD sections. */
 
-	for (i = 0; i < crash_mem_ranges; i++) {
+	for (i = 0; i < crash_mrange_info.mem_range_cnt; i++) {
 		unsigned long long mbase, msize;
-		mbase = crash_memory_ranges[i].base;
-		msize = crash_memory_ranges[i].size;
+		mbase = crash_mrange_info.mem_ranges[i].base;
+		msize = crash_mrange_info.mem_ranges[i].size;
 
 		if (!msize)
 			continue;
@@ -828,7 +837,7 @@ void fadump_cleanup(void)
 	} else if (fw_dump.dump_registered) {
 		/* Un-register Firmware-assisted dump if it was registered. */
 		fw_dump.ops->fadump_unregister(&fw_dump);
-		free_crash_memory_ranges();
+		fadump_free_mem_ranges(&crash_mrange_info);
 	}
 
 	fw_dump.ops->fadump_cleanup(&fw_dump);

