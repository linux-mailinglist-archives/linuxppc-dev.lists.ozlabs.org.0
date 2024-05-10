Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 783D28C2200
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 12:24:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mJWKkjJK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VbQ3L0W3xz3ftM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 20:24:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mJWKkjJK;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VbQ1s4Fg4z3fQj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 20:22:57 +1000 (AEST)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4VbQ1r1hwkz4x2v
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 20:22:56 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4VbQ1r1fplz4x2g; Fri, 10 May 2024 20:22:56 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mJWKkjJK;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4VbQ1q6JJBz4x2d;
	Fri, 10 May 2024 20:22:55 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44A90662027385;
	Fri, 10 May 2024 10:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=J85+vBZubt8vjFCmKf+78oP5crkxSgbd2/p/EOOw284=;
 b=mJWKkjJK8KvVWc/D9vkd/U3JAHwtGhCW1dB7tUzVx/mY+tsHj1GohGWMMEBYpudmnbEg
 wXDHNTmNHF5lAhKbCnebS9pBmrjF1jAFUQe9uKTMEbU4nv6Y7UwLzYm9c1kR5Jo7lXPC
 sCkh4I0AwD6Qo2zfdcJulK/hEpNB7f0OWKCEknurOFqwZfRYvGwtwsDzIKdlUPbDm/1/
 s3ZCdL9kCs7LUYS0TQH6+uUTSnabnEzIqzJyPcHaD89JQ4MDgq68wz47EkJvxllRmarp
 TS7/1XZsLLBWmpy2xhXaU8gg55Z962usVYwBn+c3zkLKd6YAJtQKXXu5R56spz2ovCaX TQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y1fvg8ay7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 10:22:53 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44A7CoF9026393;
	Fri, 10 May 2024 10:22:53 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xysfx0ndu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 10:22:52 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44AAMlbZ20054526
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 May 2024 10:22:49 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 380DC20040;
	Fri, 10 May 2024 10:22:47 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 707F22004D;
	Fri, 10 May 2024 10:22:44 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.57.122])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 May 2024 10:22:44 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 1/2] powerpc/kexec_file: fix extra size calculation for kexec FDT
Date: Fri, 10 May 2024 15:52:34 +0530
Message-ID: <20240510102235.2269496-2-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240510102235.2269496-1-sourabhjain@linux.ibm.com>
References: <20240510102235.2269496-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vdGa_taPN4SZD3hnnpooU8CZJRG-OHFb
X-Proofpoint-GUID: vdGa_taPN4SZD3hnnpooU8CZJRG-OHFb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_07,2024-05-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405100074
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
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Aditya Gupta <adityag@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While setting up the FDT for kexec, CPU nodes that are added after the
system boots and reserved memory ranges are incorporated into the
initial_boot_params (base FDT).

However, they are not taken into account when determining the additional
size needed for the kexec FDT. As a result, kexec fails to load,
generating the following error:

[1116.774451] Error updating memory reserve map: FDT_ERR_NOSPACE
kexec_file_load failed: No such process

Therefore, consider the extra size for CPU nodes added post-system boot
and reserved memory ranges while preparing the kexec FDT.

While adding a new parameter to the setup_new_fdt_ppc64 function, it was
noticed that there were a couple of unused parameters, so they were
removed.

Cc: Aditya Gupta <adityag@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---

Changelog:

Since v1:
  - Initialize local variable `cpu_nodes` before using it. 01/02

---

 arch/powerpc/include/asm/kexec.h  |  6 ++--
 arch/powerpc/kexec/elf_64.c       | 12 +++++--
 arch/powerpc/kexec/file_load_64.c | 53 +++++++++++++------------------
 3 files changed, 33 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 95a98b390d62..270ee93a0f7d 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -103,10 +103,8 @@ int load_crashdump_segments_ppc64(struct kimage *image,
 int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 			  const void *fdt, unsigned long kernel_load_addr,
 			  unsigned long fdt_load_addr);
-unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image);
-int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
-			unsigned long initrd_load_addr,
-			unsigned long initrd_len, const char *cmdline);
+unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image, struct crash_mem *rmem);
+int setup_new_fdt_ppc64(const struct kimage *image, void *fdt, struct crash_mem *rmem);
 #endif /* CONFIG_PPC64 */
 
 #endif /* CONFIG_KEXEC_FILE */
diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index 214c071c58ed..5d6d616404cf 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -23,6 +23,7 @@
 #include <linux/of_fdt.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <asm/kexec_ranges.h>
 
 static void *elf64_load(struct kimage *image, char *kernel_buf,
 			unsigned long kernel_len, char *initrd,
@@ -36,6 +37,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	const void *slave_code;
 	struct elfhdr ehdr;
 	char *modified_cmdline = NULL;
+	struct crash_mem *rmem = NULL;
 	struct kexec_elf_info elf_info;
 	struct kexec_buf kbuf = { .image = image, .buf_min = 0,
 				  .buf_max = ppc64_rma_size };
@@ -102,17 +104,20 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 		kexec_dprintk("Loaded initrd at 0x%lx\n", initrd_load_addr);
 	}
 
+	ret = get_reserved_memory_ranges(&rmem);
+	if (ret)
+		goto out;
+
 	fdt = of_kexec_alloc_and_setup_fdt(image, initrd_load_addr,
 					   initrd_len, cmdline,
-					   kexec_extra_fdt_size_ppc64(image));
+					   kexec_extra_fdt_size_ppc64(image, rmem));
 	if (!fdt) {
 		pr_err("Error setting up the new device tree.\n");
 		ret = -EINVAL;
 		goto out;
 	}
 
-	ret = setup_new_fdt_ppc64(image, fdt, initrd_load_addr,
-				  initrd_len, cmdline);
+	ret = setup_new_fdt_ppc64(image, fdt, rmem);
 	if (ret)
 		goto out_free_fdt;
 
@@ -146,6 +151,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 out_free_fdt:
 	kvfree(fdt);
 out:
+	kfree(rmem);
 	kfree(modified_cmdline);
 	kexec_free_elf_info(&elf_info);
 
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 925a69ad2468..413c76de283d 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -803,10 +803,9 @@ static unsigned int cpu_node_size(void)
 	return size;
 }
 
-static unsigned int kdump_extra_fdt_size_ppc64(struct kimage *image)
+static unsigned int kdump_extra_fdt_size_ppc64(struct kimage *image, unsigned int cpu_nodes)
 {
-	unsigned int cpu_nodes, extra_size = 0;
-	struct device_node *dn;
+	unsigned int extra_size = 0;
 	u64 usm_entries;
 #ifdef CONFIG_CRASH_HOTPLUG
 	unsigned int possible_cpu_nodes;
@@ -826,18 +825,6 @@ static unsigned int kdump_extra_fdt_size_ppc64(struct kimage *image)
 		extra_size += (unsigned int)(usm_entries * sizeof(u64));
 	}
 
-	/*
-	 * Get the number of CPU nodes in the current DT. This allows to
-	 * reserve places for CPU nodes added since the boot time.
-	 */
-	cpu_nodes = 0;
-	for_each_node_by_type(dn, "cpu") {
-		cpu_nodes++;
-	}
-
-	if (cpu_nodes > boot_cpu_node_count)
-		extra_size += (cpu_nodes - boot_cpu_node_count) * cpu_node_size();
-
 #ifdef CONFIG_CRASH_HOTPLUG
 	/*
 	 * Make sure enough space is reserved to accommodate possible CPU nodes
@@ -861,16 +848,30 @@ static unsigned int kdump_extra_fdt_size_ppc64(struct kimage *image)
  *
  * Returns the estimated extra size needed for kexec/kdump kernel FDT.
  */
-unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
+unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image, struct crash_mem *rmem)
 {
-	unsigned int extra_size = 0;
+	struct device_node *dn;
+	unsigned int cpu_nodes = 0, extra_size = 0;
 
 	// Budget some space for the password blob. There's already extra space
 	// for the key name
 	if (plpks_is_available())
 		extra_size += (unsigned int)plpks_get_passwordlen();
 
-	return extra_size + kdump_extra_fdt_size_ppc64(image);
+	/* Get the number of CPU nodes in the current device tree */
+	for_each_node_by_type(dn, "cpu") {
+		cpu_nodes++;
+	}
+
+	/* Consider extra space for CPU nodes added since the boot time */
+	if (cpu_nodes > boot_cpu_node_count)
+		extra_size += (cpu_nodes - boot_cpu_node_count) * cpu_node_size();
+
+	/* Consider extra space for reserved memory ranges if any */
+	if (rmem->nr_ranges > 0)
+		extra_size += sizeof(struct fdt_reserve_entry) * rmem->nr_ranges;
+
+	return extra_size + kdump_extra_fdt_size_ppc64(image, cpu_nodes);
 }
 
 static int copy_property(void *fdt, int node_offset, const struct device_node *dn,
@@ -924,18 +925,13 @@ static int update_pci_dma_nodes(void *fdt, const char *dmapropname)
  *                       being loaded.
  * @image:               kexec image being loaded.
  * @fdt:                 Flattened device tree for the next kernel.
- * @initrd_load_addr:    Address where the next initrd will be loaded.
- * @initrd_len:          Size of the next initrd, or 0 if there will be none.
- * @cmdline:             Command line for the next kernel, or NULL if there will
- *                       be none.
+ * @rmem:                Reserved memory ranges.
  *
  * Returns 0 on success, negative errno on error.
  */
-int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
-			unsigned long initrd_load_addr,
-			unsigned long initrd_len, const char *cmdline)
+int setup_new_fdt_ppc64(const struct kimage *image, void *fdt, struct crash_mem *rmem)
 {
-	struct crash_mem *umem = NULL, *rmem = NULL;
+	struct crash_mem *umem = NULL;
 	int i, nr_ranges, ret;
 
 #ifdef CONFIG_CRASH_DUMP
@@ -991,10 +987,6 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 		goto out;
 
 	/* Update memory reserve map */
-	ret = get_reserved_memory_ranges(&rmem);
-	if (ret)
-		goto out;
-
 	nr_ranges = rmem ? rmem->nr_ranges : 0;
 	for (i = 0; i < nr_ranges; i++) {
 		u64 base, size;
@@ -1014,7 +1006,6 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 		ret = plpks_populate_fdt(fdt);
 
 out:
-	kfree(rmem);
 	kfree(umem);
 	return ret;
 }
-- 
2.44.0

