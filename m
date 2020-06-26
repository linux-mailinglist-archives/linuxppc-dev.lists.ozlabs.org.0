Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF9820B928
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 21:15:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tmmW6N2GzDqDF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 05:15:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tmYQ19TxzDqvt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 05:05:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49tmYP1Lr4z9CcW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 05:05:29 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49tmYN58M3z9sPF; Sat, 27 Jun 2020 05:05:28 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49tmYM1M3cz9sT2
 for <linuxppc-dev@ozlabs.org>; Sat, 27 Jun 2020 05:05:26 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05QJ2aQ6084315; Fri, 26 Jun 2020 15:05:21 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31wm7x43xd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 15:05:21 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05QJ36hs086685;
 Fri, 26 Jun 2020 15:05:21 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31wm7x43wp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 15:05:21 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05QJ1i5S003736;
 Fri, 26 Jun 2020 19:05:19 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 31uusjk8gg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 19:05:19 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05QJ5GnV56295610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jun 2020 19:05:16 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C02C42045;
 Fri, 26 Jun 2020 19:05:16 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17C274203F;
 Fri, 26 Jun 2020 19:05:13 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.0.159])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jun 2020 19:05:12 +0000 (GMT)
Subject: [PATCH 04/11] ppc64/kexec_file: avoid stomping memory used by
 special regions
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Sat, 27 Jun 2020 00:35:11 +0530
Message-ID: <159319831192.16351.17443438699302756548.stgit@hbathini.in.ibm.com>
In-Reply-To: <159319825403.16351.7253978047621755765.stgit@hbathini.in.ibm.com>
References: <159319825403.16351.7253978047621755765.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-26_10:2020-06-26,
 2020-06-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 cotscore=-2147483648 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006260130
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
 Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

crashkernel region could have an overlap with special memory regions
like  opal, rtas, tce-table & such. These regions are referred to as
exclude memory ranges. Setup this ranges during image probe in order
to avoid them while finding the buffer for different kdump segments.
Implement kexec_locate_mem_hole_ppc64() that locates a memory hole
accounting for these ranges. Also, override arch_kexec_add_buffer()
to locate a memory hole & later call __kexec_add_buffer() function
with kbuf->mem set to skip the generic locate memory hole lookup.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/include/asm/crashdump-ppc64.h |   10 +
 arch/powerpc/include/asm/kexec.h           |    7 -
 arch/powerpc/kexec/elf_64.c                |    7 +
 arch/powerpc/kexec/file_load_64.c          |  292 ++++++++++++++++++++++++++++
 4 files changed, 312 insertions(+), 4 deletions(-)
 create mode 100644 arch/powerpc/include/asm/crashdump-ppc64.h

diff --git a/arch/powerpc/include/asm/crashdump-ppc64.h b/arch/powerpc/include/asm/crashdump-ppc64.h
new file mode 100644
index 0000000..3596c25
--- /dev/null
+++ b/arch/powerpc/include/asm/crashdump-ppc64.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _ARCH_POWERPC_KEXEC_CRASHDUMP_PPC64_H
+#define _ARCH_POWERPC_KEXEC_CRASHDUMP_PPC64_H
+
+/* min & max addresses for kdump load segments */
+#define KDUMP_BUF_MIN		(crashk_res.start)
+#define KDUMP_BUF_MAX		((crashk_res.end < ppc64_rma_size) ? \
+				 crashk_res.end : (ppc64_rma_size - 1))
+
+#endif /* __ARCH_POWERPC_KEXEC_CRASHDUMP_PPC64_H */
diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 7008ea1..bf47a01 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -100,14 +100,16 @@ void relocate_new_kernel(unsigned long indirection_page, unsigned long reboot_co
 #ifdef CONFIG_KEXEC_FILE
 extern const struct kexec_file_ops kexec_elf64_ops;
 
-#ifdef CONFIG_IMA_KEXEC
 #define ARCH_HAS_KIMAGE_ARCH
 
 struct kimage_arch {
+	struct crash_mem *exclude_ranges;
+
+#ifdef CONFIG_IMA_KEXEC
 	phys_addr_t ima_buffer_addr;
 	size_t ima_buffer_size;
-};
 #endif
+};
 
 int setup_purgatory(struct kimage *image, const void *slave_code,
 		    const void *fdt, unsigned long kernel_load_addr,
@@ -125,6 +127,7 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 			unsigned long initrd_load_addr,
 			unsigned long initrd_len, const char *cmdline);
 #endif /* CONFIG_PPC64 */
+
 #endif /* CONFIG_KEXEC_FILE */
 
 #else /* !CONFIG_KEXEC_CORE */
diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index 23ad04c..c695f94 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -22,6 +22,7 @@
 #include <linux/of_fdt.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <asm/crashdump-ppc64.h>
 
 static void *elf64_load(struct kimage *image, char *kernel_buf,
 			unsigned long kernel_len, char *initrd,
@@ -46,6 +47,12 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	if (ret)
 		goto out;
 
+	if (image->type == KEXEC_TYPE_CRASH) {
+		/* min & max buffer values for kdump case */
+		kbuf.buf_min = pbuf.buf_min = KDUMP_BUF_MIN;
+		kbuf.buf_max = pbuf.buf_max = KDUMP_BUF_MAX;
+	}
+
 	ret = kexec_elf_load(image, &ehdr, &elf_info, &kbuf, &kernel_load_addr);
 	if (ret)
 		goto out;
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index e6bff960..f1d7160 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -17,6 +17,8 @@
 #include <linux/kexec.h>
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
+#include <asm/kexec_ranges.h>
+#include <asm/crashdump-ppc64.h>
 
 const struct kexec_file_ops * const kexec_file_loaders[] = {
 	&kexec_elf64_ops,
@@ -24,6 +26,247 @@ const struct kexec_file_ops * const kexec_file_loaders[] = {
 };
 
 /**
+ * get_exclude_memory_ranges - Get exclude memory ranges. This list includes
+ *                             regions like opal/rtas, tce-table, initrd,
+ *                             kernel, htab which should be avoided while
+ *                             setting up kexec load segments.
+ * @mem_ranges:                Range list to add the memory ranges to.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int get_exclude_memory_ranges(struct crash_mem **mem_ranges)
+{
+	int ret;
+
+	ret = add_tce_mem_ranges(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_initrd_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_htab_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_kernel_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_rtas_mem_range(mem_ranges, false);
+	if (ret)
+		goto out;
+
+	ret = add_opal_mem_range(mem_ranges, false);
+	if (ret)
+		goto out;
+
+	ret = add_reserved_ranges(mem_ranges);
+	if (ret)
+		goto out;
+
+	/* exclude memory ranges should be sorted for easy lookup */
+	sort_memory_ranges(*mem_ranges);
+out:
+	if (ret)
+		pr_err("Failed to setup exclude memory ranges\n");
+	return ret;
+}
+
+/**
+ * __locate_mem_hole_ppc64 - Tests if the memory hole between buf_min & buf_max
+ *                           is large enough for the buffer. If true, sets
+ *                           kbuf->mem to the buffer.
+ * @kbuf:                    Buffer contents and memory parameters.
+ * @buf_min:                 Minimum address for the buffer.
+ * @buf_max:                 Maximum address for the buffer.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int __locate_mem_hole_ppc64(struct kexec_buf *kbuf,
+				   u64 buf_min, u64 buf_max)
+{
+	int ret = -EADDRNOTAVAIL;
+
+	buf_min = ALIGN(buf_min, kbuf->buf_align);
+
+	if (buf_min < buf_max &&
+	    (buf_max - buf_min + 1) >= kbuf->memsz) {
+		/*
+		 * Suitable memory range found. Set kbuf->mem here to skip
+		 * locate memory hole routine in __kexec_add_buffer() call.
+		 */
+		ret = 0;
+		if (kbuf->top_down)
+			kbuf->mem = ALIGN_DOWN(buf_max - kbuf->memsz + 1,
+					       kbuf->buf_align);
+		else
+			kbuf->mem = buf_min;
+	}
+
+	return ret;
+}
+
+/**
+ * locate_mem_hole_top_down_ppc64 - Skip special memory regions to find a
+ *                                  suitable buffer with top down approach.
+ * @kbuf:                           Buffer contents and memory parameters.
+ * @buf_min:                        Minimum address for the buffer.
+ * @buf_max:                        Maximum address for the buffer.
+ * @emem:                           Exclude memory ranges.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int locate_mem_hole_top_down_ppc64(struct kexec_buf *kbuf,
+					  u64 buf_min, u64 buf_max,
+					  const struct crash_mem *emem)
+{
+	int i, ret = 0, err = -EADDRNOTAVAIL;
+	u64 start, end, tmin, tmax;
+
+	tmax = buf_max;
+	for (i = (emem->nr_ranges - 1); i >= 0; i--) {
+		start = emem->ranges[i].start;
+		end = emem->ranges[i].end;
+
+		if (start > tmax)
+			continue;
+
+		if (end < tmax) {
+			tmin = (end < buf_min ? buf_min : end + 1);
+			ret = __locate_mem_hole_ppc64(kbuf, tmin, tmax);
+			if (!ret)
+				return 0;
+		}
+
+		tmax = start - 1;
+
+		if (tmax < buf_min) {
+			ret = err;
+			break;
+		}
+		ret = 0;
+	}
+
+	if (!ret) {
+		tmin = buf_min;
+		ret = __locate_mem_hole_ppc64(kbuf, tmin, tmax);
+	}
+	return ret;
+}
+
+/**
+ * locate_mem_hole_bottom_up_ppc64 - Skip special memory regions to find a
+ *                                   suitable buffer with bottom up approach.
+ * @kbuf:                            Buffer contents and memory parameters.
+ * @buf_min:                         Minimum address for the buffer.
+ * @buf_max:                         Maximum address for the buffer.
+ * @emem:                            Exclude memory ranges.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int locate_mem_hole_bottom_up_ppc64(struct kexec_buf *kbuf,
+					   u64 buf_min, u64 buf_max,
+					   const struct crash_mem *emem)
+{
+	int i, ret = 0, err = -EADDRNOTAVAIL;
+	u64 start, end, tmin, tmax;
+
+	tmin = buf_min;
+	for (i = 0; i < emem->nr_ranges; i++) {
+		start = emem->ranges[i].start;
+		end = emem->ranges[i].end;
+
+		if (end < tmin)
+			continue;
+
+		if (start > tmin) {
+			tmax = (start > buf_max ? buf_max : start - 1);
+			ret = __locate_mem_hole_ppc64(kbuf, tmin, tmax);
+			if (!ret)
+				return 0;
+		}
+
+		tmin = end + 1;
+
+		if (tmin > buf_max) {
+			ret = err;
+			break;
+		}
+		ret = 0;
+	}
+
+	if (!ret) {
+		tmax = buf_max;
+		ret = __locate_mem_hole_ppc64(kbuf, tmin, tmax);
+	}
+	return ret;
+}
+
+/**
+ * kexec_locate_mem_hole_ppc64 - Skip special memory regions like rtas,
+ *                               tce-table, opal, reserved-ranges & such
+ *                               (exclude memory ranges) as they can't be
+ *                               used for kexec segment buffer. Use buf_min
+ *                               & buf_max fields in kexec_buf structure to
+ *                               skip regions. Sets kbuf->mem when a
+ *                               suitable memory hole is found.
+ * @kbuf:                        Buffer contents and memory parameters.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int kexec_locate_mem_hole_ppc64(struct kexec_buf *kbuf)
+{
+	struct crash_mem **emem;
+	u64 buf_min, buf_max;
+	int ret;
+
+	/*
+	 * Use the locate_mem_hole logic in kexec_add_buffer() for regular
+	 * kexec_file_load syscall
+	 */
+	if (kbuf->image->type != KEXEC_TYPE_CRASH)
+		return 0;
+
+	/* Look up the exclude ranges list while locating the memory hole */
+	emem = &(kbuf->image->arch.exclude_ranges);
+	if (!(*emem) || ((*emem)->nr_ranges == 0)) {
+		pr_warn("No exclude range list. Using the default locate mem hole method\n");
+		return 0;
+	}
+
+	/* Ensure minimum alignment needed for segments. */
+	kbuf->memsz = ALIGN(kbuf->memsz, PAGE_SIZE);
+	kbuf->buf_align = max(kbuf->buf_align, PAGE_SIZE);
+
+	/* Segments for kdump kernel should be within crashkernel region */
+	buf_min = (kbuf->buf_min < crashk_res.start ?
+		   crashk_res.start : kbuf->buf_min);
+	buf_max = (kbuf->buf_max > crashk_res.end ?
+		   crashk_res.end : kbuf->buf_max);
+
+	if (buf_min > buf_max) {
+		pr_err("Invalid buffer min and/or max values\n");
+		return -EINVAL;
+	}
+
+	if (kbuf->top_down)
+		ret = locate_mem_hole_top_down_ppc64(kbuf, buf_min, buf_max,
+						     *emem);
+	else
+		ret = locate_mem_hole_bottom_up_ppc64(kbuf, buf_min, buf_max,
+						      *emem);
+
+	/* Add the buffer allocated to the exclude list for the next lookup */
+	if (!ret) {
+		add_mem_range(emem, kbuf->mem, kbuf->memsz);
+		sort_memory_ranges(*emem);
+	}
+	return ret;
+}
+
+/**
  * setup_purgatory_ppc64 - initialize PPC64 specific purgatory's global
  *                         variables and call setup_purgatory() to initialize
  *                         common global variable.
@@ -89,6 +332,29 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 }
 
 /**
+ * arch_kexec_add_buffer - Locate memory hole before calling kexec_add_buffer().
+ *                         All kexec_add_buffer() callers should use this
+ *                         function instead.
+ * @kbuf:                  Buffer contents and memory parameters.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int arch_kexec_add_buffer(struct kexec_buf *kbuf)
+{
+	int ret;
+
+	ret = kexec_locate_mem_hole_ppc64(kbuf);
+	if (ret)
+		goto out;
+
+	ret = __kexec_add_buffer(kbuf);
+out:
+	if (ret)
+		pr_err("Failed to add buffer of size %lu\n", kbuf->memsz);
+	return ret;
+}
+
+/**
  * arch_kexec_kernel_image_probe - Does additional handling needed to setup
  *                                 kexec segments.
  * @image:                         kexec image being loaded.
@@ -100,9 +366,31 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 int arch_kexec_kernel_image_probe(struct kimage *image, void *buf,
 				  unsigned long buf_len)
 {
-	/* We don't support crash kernels yet. */
-	if (image->type == KEXEC_TYPE_CRASH)
+	if (image->type == KEXEC_TYPE_CRASH) {
+		int ret;
+
+		/* Get exclude memory ranges needed for setting up kdump segments */
+		ret = get_exclude_memory_ranges(&(image->arch.exclude_ranges));
+		if (ret)
+			pr_err("Failed to setup exclude memory ranges for buffer lookup\n");
+		/* Return this until all changes for panic kernel are in */
 		return -EOPNOTSUPP;
+	}
 
 	return kexec_image_probe_default(image, buf, buf_len);
 }
+
+/**
+ * arch_kimage_file_post_load_cleanup - Frees up all the allocations done
+ *                                      while loading the image.
+ * @image:                              kexec image being loaded.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int arch_kimage_file_post_load_cleanup(struct kimage *image)
+{
+	kfree(image->arch.exclude_ranges);
+	image->arch.exclude_ranges = NULL;
+
+	return kexec_image_post_load_cleanup_default(image);
+}

