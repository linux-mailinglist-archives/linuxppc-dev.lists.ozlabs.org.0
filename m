Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD4A852F67
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 12:34:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TBvV9tPb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYzkL1426z3vZB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 22:34:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TBvV9tPb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYzh136P1z3c1C
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 22:32:17 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41DBHcr7004312;
	Tue, 13 Feb 2024 11:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xMCXWpSIWfh0AvPDPc3O3XCJuP0kVd20cqwYAvrRtFk=;
 b=TBvV9tPbSQKX8g17x27beMuBNxkc8Zn36keDkSdoJJBS3fc1CzTlzczHHDw30Gssr5lK
 KxjIm9RxixHwRcgtKihJg0xvd8iouwa5EsXKTjNBJ3d4smZN0vDOMfIs7rDRUcqPpnHP
 0tqHupB0Uj9gy1b5IGoRXetG/uE0HN8Gag3Wc9ijeGJrDrMp0j6Vkc/VKyPFFELrlcqa
 bw8hzyzxVkg9LlEfdb5Z3MeHzv0MnEKxtazPfMoaAL9t9b458lou4w8TwqbKWuFNoz1Z
 fIgna1YumdDh2+wKTo/7Swf8/KXsfTI8IJyi9eIlaUHaAs44txMMaSKJbf5/B9FH24NN GQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w87dt8cfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 11:32:07 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41DBRJ9f002586;
	Tue, 13 Feb 2024 11:32:07 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w87dt8cew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 11:32:06 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41DAkjfL004339;
	Tue, 13 Feb 2024 11:32:05 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w6kv077dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 11:32:05 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41DBW0j138339226
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Feb 2024 11:32:02 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 442B42004B;
	Tue, 13 Feb 2024 11:32:00 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C14920040;
	Tue, 13 Feb 2024 11:31:57 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.203.115.195])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Feb 2024 11:31:57 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Kexec-ml <kexec@lists.infradead.org>
Subject: [PATCH linux-next 2/3] powerpc/kexec: split CONFIG_KEXEC_FILE and CONFIG_CRASH_DUMP
Date: Tue, 13 Feb 2024 17:01:48 +0530
Message-ID: <20240213113150.1148276-3-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213113150.1148276-1-hbathini@linux.ibm.com>
References: <20240213113150.1148276-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3193L62DtuJAlOF_L_Im9xfyr1QByt3f
X-Proofpoint-ORIG-GUID: V-L-A75iGSaer0gZMAhtVbta7YthJ7fM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_06,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402130091
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
Cc: Baoquan He <bhe@redhat.com>, lkml <linux-kernel@vger.kernel.org>, Sourabh Jain <sourabhjain@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CONFIG_KEXEC_FILE does not have to select CONFIG_CRASH_DUMP. Move
some code under CONFIG_CRASH_DUMP to support CONFIG_KEXEC_FILE and
!CONFIG_CRASH_DUMP case.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kexec/elf_64.c       |   4 +-
 arch/powerpc/kexec/file_load_64.c | 269 ++++++++++++++++--------------
 2 files changed, 142 insertions(+), 131 deletions(-)

diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index 904016cf89ea..6d8951e8e966 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -47,7 +47,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	if (ret)
 		return ERR_PTR(ret);
 
-	if (image->type == KEXEC_TYPE_CRASH) {
+	if (IS_ENABLED(CONFIG_CRASH_DUMP) && image->type == KEXEC_TYPE_CRASH) {
 		/* min & max buffer values for kdump case */
 		kbuf.buf_min = pbuf.buf_min = crashk_res.start;
 		kbuf.buf_max = pbuf.buf_max =
@@ -70,7 +70,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	kexec_dprintk("Loaded purgatory at 0x%lx\n", pbuf.mem);
 
 	/* Load additional segments needed for panic kernel */
-	if (image->type == KEXEC_TYPE_CRASH) {
+	if (IS_ENABLED(CONFIG_CRASH_DUMP) && image->type == KEXEC_TYPE_CRASH) {
 		ret = load_crashdump_segments_ppc64(image, &kbuf);
 		if (ret) {
 			pr_err("Failed to load kdump kernel segments\n");
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 5b4c5cb23354..1bc65de6174f 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -96,119 +96,6 @@ static int get_exclude_memory_ranges(struct crash_mem **mem_ranges)
 	return ret;
 }
 
-/**
- * get_usable_memory_ranges - Get usable memory ranges. This list includes
- *                            regions like crashkernel, opal/rtas & tce-table,
- *                            that kdump kernel could use.
- * @mem_ranges:               Range list to add the memory ranges to.
- *
- * Returns 0 on success, negative errno on error.
- */
-static int get_usable_memory_ranges(struct crash_mem **mem_ranges)
-{
-	int ret;
-
-	/*
-	 * Early boot failure observed on guests when low memory (first memory
-	 * block?) is not added to usable memory. So, add [0, crashk_res.end]
-	 * instead of [crashk_res.start, crashk_res.end] to workaround it.
-	 * Also, crashed kernel's memory must be added to reserve map to
-	 * avoid kdump kernel from using it.
-	 */
-	ret = add_mem_range(mem_ranges, 0, crashk_res.end + 1);
-	if (ret)
-		goto out;
-
-	ret = add_rtas_mem_range(mem_ranges);
-	if (ret)
-		goto out;
-
-	ret = add_opal_mem_range(mem_ranges);
-	if (ret)
-		goto out;
-
-	ret = add_tce_mem_ranges(mem_ranges);
-out:
-	if (ret)
-		pr_err("Failed to setup usable memory ranges\n");
-	return ret;
-}
-
-/**
- * get_crash_memory_ranges - Get crash memory ranges. This list includes
- *                           first/crashing kernel's memory regions that
- *                           would be exported via an elfcore.
- * @mem_ranges:              Range list to add the memory ranges to.
- *
- * Returns 0 on success, negative errno on error.
- */
-static int get_crash_memory_ranges(struct crash_mem **mem_ranges)
-{
-	phys_addr_t base, end;
-	struct crash_mem *tmem;
-	u64 i;
-	int ret;
-
-	for_each_mem_range(i, &base, &end) {
-		u64 size = end - base;
-
-		/* Skip backup memory region, which needs a separate entry */
-		if (base == BACKUP_SRC_START) {
-			if (size > BACKUP_SRC_SIZE) {
-				base = BACKUP_SRC_END + 1;
-				size -= BACKUP_SRC_SIZE;
-			} else
-				continue;
-		}
-
-		ret = add_mem_range(mem_ranges, base, size);
-		if (ret)
-			goto out;
-
-		/* Try merging adjacent ranges before reallocation attempt */
-		if ((*mem_ranges)->nr_ranges == (*mem_ranges)->max_nr_ranges)
-			sort_memory_ranges(*mem_ranges, true);
-	}
-
-	/* Reallocate memory ranges if there is no space to split ranges */
-	tmem = *mem_ranges;
-	if (tmem && (tmem->nr_ranges == tmem->max_nr_ranges)) {
-		tmem = realloc_mem_ranges(mem_ranges);
-		if (!tmem)
-			goto out;
-	}
-
-	/* Exclude crashkernel region */
-	ret = crash_exclude_mem_range(tmem, crashk_res.start, crashk_res.end);
-	if (ret)
-		goto out;
-
-	/*
-	 * FIXME: For now, stay in parity with kexec-tools but if RTAS/OPAL
-	 *        regions are exported to save their context at the time of
-	 *        crash, they should actually be backed up just like the
-	 *        first 64K bytes of memory.
-	 */
-	ret = add_rtas_mem_range(mem_ranges);
-	if (ret)
-		goto out;
-
-	ret = add_opal_mem_range(mem_ranges);
-	if (ret)
-		goto out;
-
-	/* create a separate program header for the backup region */
-	ret = add_mem_range(mem_ranges, BACKUP_SRC_START, BACKUP_SRC_SIZE);
-	if (ret)
-		goto out;
-
-	sort_memory_ranges(*mem_ranges, false);
-out:
-	if (ret)
-		pr_err("Failed to setup crash memory ranges\n");
-	return ret;
-}
-
 /**
  * get_reserved_memory_ranges - Get reserve memory ranges. This list includes
  *                              memory regions that should be added to the
@@ -434,6 +321,120 @@ static int locate_mem_hole_bottom_up_ppc64(struct kexec_buf *kbuf,
 	return ret;
 }
 
+#ifdef CONFIG_CRASH_DUMP
+/**
+ * get_usable_memory_ranges - Get usable memory ranges. This list includes
+ *                            regions like crashkernel, opal/rtas & tce-table,
+ *                            that kdump kernel could use.
+ * @mem_ranges:               Range list to add the memory ranges to.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int get_usable_memory_ranges(struct crash_mem **mem_ranges)
+{
+	int ret;
+
+	/*
+	 * Early boot failure observed on guests when low memory (first memory
+	 * block?) is not added to usable memory. So, add [0, crashk_res.end]
+	 * instead of [crashk_res.start, crashk_res.end] to workaround it.
+	 * Also, crashed kernel's memory must be added to reserve map to
+	 * avoid kdump kernel from using it.
+	 */
+	ret = add_mem_range(mem_ranges, 0, crashk_res.end + 1);
+	if (ret)
+		goto out;
+
+	ret = add_rtas_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_opal_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_tce_mem_ranges(mem_ranges);
+out:
+	if (ret)
+		pr_err("Failed to setup usable memory ranges\n");
+	return ret;
+}
+
+/**
+ * get_crash_memory_ranges - Get crash memory ranges. This list includes
+ *                           first/crashing kernel's memory regions that
+ *                           would be exported via an elfcore.
+ * @mem_ranges:              Range list to add the memory ranges to.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int get_crash_memory_ranges(struct crash_mem **mem_ranges)
+{
+	phys_addr_t base, end;
+	struct crash_mem *tmem;
+	u64 i;
+	int ret;
+
+	for_each_mem_range(i, &base, &end) {
+		u64 size = end - base;
+
+		/* Skip backup memory region, which needs a separate entry */
+		if (base == BACKUP_SRC_START) {
+			if (size > BACKUP_SRC_SIZE) {
+				base = BACKUP_SRC_END + 1;
+				size -= BACKUP_SRC_SIZE;
+			} else
+				continue;
+		}
+
+		ret = add_mem_range(mem_ranges, base, size);
+		if (ret)
+			goto out;
+
+		/* Try merging adjacent ranges before reallocation attempt */
+		if ((*mem_ranges)->nr_ranges == (*mem_ranges)->max_nr_ranges)
+			sort_memory_ranges(*mem_ranges, true);
+	}
+
+	/* Reallocate memory ranges if there is no space to split ranges */
+	tmem = *mem_ranges;
+	if (tmem && (tmem->nr_ranges == tmem->max_nr_ranges)) {
+		tmem = realloc_mem_ranges(mem_ranges);
+		if (!tmem)
+			goto out;
+	}
+
+	/* Exclude crashkernel region */
+	ret = crash_exclude_mem_range(tmem, crashk_res.start, crashk_res.end);
+	if (ret)
+		goto out;
+
+	/*
+	 * FIXME: For now, stay in parity with kexec-tools but if RTAS/OPAL
+	 *        regions are exported to save their context at the time of
+	 *        crash, they should actually be backed up just like the
+	 *        first 64K bytes of memory.
+	 */
+	ret = add_rtas_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_opal_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	/* create a separate program header for the backup region */
+	ret = add_mem_range(mem_ranges, BACKUP_SRC_START, BACKUP_SRC_SIZE);
+	if (ret)
+		goto out;
+
+	sort_memory_ranges(*mem_ranges, false);
+out:
+	if (ret)
+		pr_err("Failed to setup crash memory ranges\n");
+	return ret;
+}
+
 /**
  * check_realloc_usable_mem - Reallocate buffer if it can't accommodate entries
  * @um_info:                  Usable memory buffer and ranges info.
@@ -863,6 +864,7 @@ int load_crashdump_segments_ppc64(struct kimage *image,
 
 	return 0;
 }
+#endif
 
 /**
  * setup_purgatory_ppc64 - initialize PPC64 specific purgatory's global
@@ -972,26 +974,14 @@ static unsigned int cpu_node_size(void)
 	return size;
 }
 
-/**
- * kexec_extra_fdt_size_ppc64 - Return the estimated additional size needed to
- *                              setup FDT for kexec/kdump kernel.
- * @image:                      kexec image being loaded.
- *
- * Returns the estimated extra size needed for kexec/kdump kernel FDT.
- */
-unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
+static unsigned int kdump_extra_fdt_size_ppc64(struct kimage *image)
 {
 	unsigned int cpu_nodes, extra_size = 0;
 	struct device_node *dn;
 	u64 usm_entries;
 
-	// Budget some space for the password blob. There's already extra space
-	// for the key name
-	if (plpks_is_available())
-		extra_size += (unsigned int)plpks_get_passwordlen();
-
-	if (image->type != KEXEC_TYPE_CRASH)
-		return extra_size;
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP) || image->type != KEXEC_TYPE_CRASH)
+		return 0;
 
 	/*
 	 * For kdump kernel, account for linux,usable-memory and
@@ -1019,6 +1009,25 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
 	return extra_size;
 }
 
+/**
+ * kexec_extra_fdt_size_ppc64 - Return the estimated additional size needed to
+ *                              setup FDT for kexec/kdump kernel.
+ * @image:                      kexec image being loaded.
+ *
+ * Returns the estimated extra size needed for kexec/kdump kernel FDT.
+ */
+unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
+{
+	unsigned int extra_size = 0;
+
+	// Budget some space for the password blob. There's already extra space
+	// for the key name
+	if (plpks_is_available())
+		extra_size += (unsigned int)plpks_get_passwordlen();
+
+	return extra_size + kdump_extra_fdt_size_ppc64(image);
+}
+
 /**
  * add_node_props - Reads node properties from device node structure and add
  *                  them to fdt.
@@ -1171,6 +1180,7 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 	struct crash_mem *umem = NULL, *rmem = NULL;
 	int i, nr_ranges, ret;
 
+#ifdef CONFIG_CRASH_DUMP
 	/*
 	 * Restrict memory usage for kdump kernel by setting up
 	 * usable memory ranges and memory reserve map.
@@ -1207,6 +1217,7 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 			goto out;
 		}
 	}
+#endif
 
 	/* Update cpus nodes information to account hotplug CPUs. */
 	ret =  update_cpus_node(fdt);
@@ -1278,7 +1289,7 @@ int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
 	buf_min = kbuf->buf_min;
 	buf_max = kbuf->buf_max;
 	/* Segments for kdump kernel should be within crashkernel region */
-	if (kbuf->image->type == KEXEC_TYPE_CRASH) {
+	if (IS_ENABLED(CONFIG_CRASH_DUMP) && kbuf->image->type == KEXEC_TYPE_CRASH) {
 		buf_min = (buf_min < crashk_res.start ?
 			   crashk_res.start : buf_min);
 		buf_max = (buf_max > crashk_res.end ?
-- 
2.43.0

