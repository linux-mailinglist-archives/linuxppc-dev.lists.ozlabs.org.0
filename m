Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D506879429A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Sep 2023 20:00:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S/PW7Dfh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rgqsm4D0Dz3c4R
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 04:00:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S/PW7Dfh;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rgqrr2Cxrz2xdp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Sep 2023 03:59:40 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Rgqrp3fmlz4wxR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Sep 2023 03:59:38 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Rgqrp3XXpz4wxQ; Thu,  7 Sep 2023 03:59:38 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S/PW7Dfh;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Rgqrn3cYpz4wb1;
	Thu,  7 Sep 2023 03:59:37 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 386HsnPc015747;
	Wed, 6 Sep 2023 17:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=CP6KwSnJrYBg9tVI9KThSmtIqj0ajHxqtrdbyJBzDFg=;
 b=S/PW7DfhlVB8QWnSFs7rS5FYUGQooaHa8nVGTnObvjeBLLsTbvolnx6Ncb6/qgX63pi/
 i42+jj6Iuw6dssEKebPyQx5asiU2oY4vYczUTkDOVy7NHmAW48JjFLwOJ9lTnU/giq1a
 CyBZNK7F26DXcu2xdNCWxZU+DcQzM0fT13Y5aU6a82zyD+JRVgqqtj0POU41O4jgywOU
 XKHkPDKw7+wxHhbHEM7pf0D12URoOgxO7nfrhl/lJb1YTLHhyQWz22xWya38eYe5g04n
 yrxWsCOUh+QA9oxFNkOndywZmPksitkpcuI7V04gBKbqTFnZs8RQsymr6liDO2nL5gTU 9w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sxx8983u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Sep 2023 17:59:32 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 386Hswtn016808;
	Wed, 6 Sep 2023 17:59:31 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sxx8983tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Sep 2023 17:59:31 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 386Gs97C012209;
	Wed, 6 Sep 2023 17:59:30 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svhkk4u8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Sep 2023 17:59:30 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 386HxR6o19792384
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 6 Sep 2023 17:59:27 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9301B2004B;
	Wed,  6 Sep 2023 17:59:27 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9635720043;
	Wed,  6 Sep 2023 17:59:25 +0000 (GMT)
Received: from [192.168.0.66] (unknown [9.171.62.178])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  6 Sep 2023 17:59:25 +0000 (GMT)
Subject: [RFC PATCH] powerpc: Make crashing cpu to be discovered first in
 kdump kernel.
From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 06 Sep 2023 23:29:24 +0530
Message-ID: <169402313576.1071869.18233618318394691773.stgit@jupiter>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AfRJ3p86AxCJusn4JPref8ouLSJCl6eM
X-Proofpoint-GUID: 14ZftiPy07ykhwGbVZUlVThMmu6jRhNI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1011
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309060151
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
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>, Baoquan He <bhe@redhat.com>, Pingfan Liu <kernelfans@gmail.com>, Wen Xiong <wenxiong@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Dave Young <dyoung@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The kernel boot parameter 'nr_cpus=' allows one to specify number of
possible cpus in the system. In the normal scenario the first cpu (cpu0)
that shows up is the boot cpu and hence it gets covered under nr_cpus
limit.

But this assumption is broken in kdump scenario where kdump kernel after a
crash can boot up on an non-zero boot cpu. The paca structure allocation
depends on value of nr_cpus and is indexed using logical cpu ids. The cpu
discovery code brings up the cpus as they appear sequentially on device
tree and assigns logical cpu ids starting from 0. This definitely becomes
an issue if boot cpu id > nr_cpus. When this occurs it results into

In past there were proposals to fix this by making changes to cpu discovery
code to identify non-zero boot cpu and map it to logical cpu 0. However,
the changes were very invasive, making discovery code more complicated and
risky.

Considering that the non-zero boot cpu scenario is more specific to kdump
kernel, limiting the changes in panic/crash kexec path would probably be a
best approach to have.

Hence proposed change is, in crash kexec path, move the crashing cpu's
device node to the first position under '/cpus' node, which will make the
crashing cpu to be discovered as part of the first core in kdump kernel.

In order to accommodate boot cpu for the case where boot_cpuid > nr_cpu_ids,
align up the nr_cpu_ids to SMT threads in early_init_dt_scan_cpus(). This
will allow kdump kernel to work with nr_cpus=X where X will be aligned up
in multiple of SMT threads per core.

Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
---
 arch/powerpc/include/asm/kexec.h  |    1 
 arch/powerpc/kernel/prom.c        |   13 ++++
 arch/powerpc/kexec/core_64.c      |  128 +++++++++++++++++++++++++++++++++++++
 arch/powerpc/kexec/file_load_64.c |    2 -
 4 files changed, 143 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index a1ddba01e7d13..f5a6f4a1b8eb0 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -144,6 +144,7 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image);
 int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 			unsigned long initrd_load_addr,
 			unsigned long initrd_len, const char *cmdline);
+int add_node_props(void *fdt, int node_offset, const struct device_node *dn);
 #endif /* CONFIG_PPC64 */
 
 #endif /* CONFIG_KEXEC_FILE */
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 0b5878c3125b1..c2d4f55042d72 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -322,6 +322,9 @@ static void __init check_cpu_feature_properties(unsigned long node)
 	}
 }
 
+/* align addr on a size boundary - adjust address up */
+#define _ALIGN_UP(addr, size)   (((addr)+((size)-1))&(~((typeof(addr))(size)-1)))
+
 static int __init early_init_dt_scan_cpus(unsigned long node,
 					  const char *uname, int depth,
 					  void *data)
@@ -348,6 +351,16 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 
 	nthreads = len / sizeof(int);
 
+	/*
+	 * Align nr_cpu_ids to correct SMT value. This will help us to allocate
+	 * pacas correctly to accomodate boot_cpu != 0 scenario e.g. in kdump
+	 * kernel the boot cpu can be any cpu between 0 through nthreads.
+	 */
+	if (nr_cpu_ids % nthreads) {
+		nr_cpu_ids = _ALIGN_UP(nr_cpu_ids, nthreads);
+		pr_info("Aligned nr_cpus to SMT=%d, nr_cpu_ids = %d\n", nthreads, nr_cpu_ids);
+	}
+
 	/*
 	 * Now see if any of these threads match our boot cpu.
 	 * NOTE: This must match the parsing done in smp_setup_cpu_maps.
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index a79e28c91e2be..168bef43e22c2 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -17,6 +17,7 @@
 #include <linux/cpu.h>
 #include <linux/hardirq.h>
 #include <linux/of.h>
+#include <linux/libfdt.h>
 
 #include <asm/page.h>
 #include <asm/current.h>
@@ -298,6 +299,119 @@ extern void kexec_sequence(void *newstack, unsigned long start,
 			   void (*clear_all)(void),
 			   bool copy_with_mmu_off) __noreturn;
 
+/*
+ * Move the crashing cpus FDT node as the first node under '/cpus' node.
+ *
+ * - Get the FDT segment from the crash image segments.
+ * - Locate the crashing CPUs fdt subnode 'A' under '/cpus' node.
+ * - Now locate the crashing cpu device node 'B' from of_root device tree.
+ * - Delete the crashing cpu FDT node 'A' from kexec FDT segment.
+ * - Insert the crashing cpu device node 'B' into kexec FDT segment as first
+ *   subnode under '/cpus' node.
+ */
+static void move_crashing_cpu(struct kimage *image)
+{
+	void *fdt, *ptr;
+	const char *pathp = NULL;
+	unsigned long mem;
+	const __be32 *intserv;
+	struct device_node *dn;
+	bool first_node = true;
+	int cpus_offset, offset, fdt_index = -1;
+	int initial_depth, depth, len, i, ret, nthreads;
+
+	/* Find the FDT segment index in kexec segment array. */
+	for (i = 0; i < image->nr_segments; i++) {
+		mem = image->segment[i].mem;
+		ptr = __va(mem);
+		if (ptr && fdt_magic(ptr) == FDT_MAGIC) {
+			fdt_index = i;
+			break;
+		}
+	}
+	if (fdt_index < 0) {
+		pr_err("Unable to locate FDT segment.\n");
+		return;
+	}
+
+	fdt = __va((void *)image->segment[fdt_index].mem);
+
+	offset = cpus_offset = fdt_path_offset(fdt, "/cpus");
+	if (cpus_offset < 0) {
+		if (cpus_offset != -FDT_ERR_NOTFOUND)
+			pr_err("Malformed device tree: error reading /cpus node: %s\n",
+				fdt_strerror(cpus_offset));
+		return;
+	}
+
+	/* Locate crashing cpus fdt node */
+        initial_depth = depth = 0;
+	for (offset = fdt_next_node(fdt, offset, &depth);
+		offset >= 0 && depth > initial_depth;
+		offset = fdt_next_node(fdt, offset, &depth)) {
+
+
+		intserv = fdt_getprop(fdt, offset, "ibm,ppc-interrupt-server#s", &len);
+		if (!intserv) {
+			pr_err("Unable to fetch ibm,ppc-interrupt-server#s property\n");
+			return;
+		}
+
+		/* Find the match for crashing cpus phys id. */
+		nthreads = len / sizeof(int);
+		for (i = 0; i < nthreads; i++) {
+			if (be32_to_cpu(intserv[i]) == get_paca()->hw_cpu_id)
+				break;
+		}
+		if (i < nthreads) {
+			/* Found the match */
+			pathp = fdt_get_name(fdt, offset, NULL);
+			break;
+		}
+
+		first_node = false;
+	}
+
+	/*
+	 * Nothing to be done if crashing cpu's fdt node is already at first
+	 * position OR crashing cpu's fdt node isn't present in kexec FDT
+	 * segment, which is not possible unless kexec FDT segment hasn't been
+	 * refreshed after DLPAR.
+	 */
+	if (first_node || offset < 0)
+		return;
+
+	/* Locate the device node of crashing cpu from of_root */
+	for_each_node_by_type(dn, "cpu") {
+		if (!strcmp(dn->full_name, pathp))
+			break;
+	}
+	if (!dn) {
+		pr_err("Could not locate device node of crashing cpu: %s\n", pathp);
+		return;
+	}
+
+	/* Delete the crashing cpu FDT node from kexec FDT segment */
+	ret = fdt_del_node(fdt, offset);
+	if (ret < 0) {
+		pr_err("Error deleting node /cpus/%s: %s\n", pathp, fdt_strerror(ret));
+		return;
+	}
+
+	/* Add it as first subnode under /cpus node. */
+	offset = fdt_add_subnode(fdt, cpus_offset, dn->full_name);
+	if (offset < 0) {
+		pr_err("Unable to add %s subnode: %s\n", dn->full_name,
+			fdt_strerror(offset));
+		return;
+	}
+
+	/* Copy rest of the properties of crashing cpus */
+	add_node_props(fdt, offset, dn);
+
+	return;
+}
+
 /* too late to fail here */
 void default_machine_kexec(struct kimage *image)
 {
@@ -341,6 +455,20 @@ void default_machine_kexec(struct kimage *image)
 		printk("kexec: Unshared all shared pages.\n");
 	}
 
+	/*
+	 * Move the crashing cpus FDT node as the first node under /cpus node.
+	 * This will make the core (where crashing cpu belongs) to
+	 * automatically become first core to show up in kdump kernel and
+	 * crashing cpu as boot cpu within first n threads of that core.
+	 *
+	 * Currently this will work with kexec_file_load only.
+	 *
+	 * XXX: For kexec_load, change is required in kexec tool to exclude FDT
+	 * segment from purgatory checksum check.
+	 */
+	if (image->type == KEXEC_TYPE_CRASH && image->file_mode)
+		move_crashing_cpu(image);
+
 	paca_ptrs[kexec_paca.paca_index] = &kexec_paca;
 
 	setup_paca(&kexec_paca);
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 110d28bede2a7..42d55a19454a7 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -1027,7 +1027,7 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
  *
  * Returns 0 on success, negative errno on error.
  */
-static int add_node_props(void *fdt, int node_offset, const struct device_node *dn)
+int add_node_props(void *fdt, int node_offset, const struct device_node *dn)
 {
 	int ret = 0;
 	struct property *pp;


