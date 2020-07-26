Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA1B22E25B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 21:46:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFD2j31SKzDrCt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 05:46:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFCsc5d57zF0Vf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 05:38:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BFCsc4zlzz8tRl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 05:38:28 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BFCsc3zhJz9sRN; Mon, 27 Jul 2020 05:38:28 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 4BFCsc0fSKz9sRR
 for <linuxppc-dev@ozlabs.org>; Mon, 27 Jul 2020 05:38:27 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06QJWt5C016760; Sun, 26 Jul 2020 15:38:21 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32gg1sfvr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 15:38:20 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06QJY4Zn018281;
 Sun, 26 Jul 2020 15:38:20 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32gg1sfvqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 15:38:20 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06QJa8wX008646;
 Sun, 26 Jul 2020 19:38:17 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 32gcqk0vnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 19:38:17 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06QJcETY44564520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 26 Jul 2020 19:38:14 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FB27AE045;
 Sun, 26 Jul 2020 19:38:14 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43283AE04D;
 Sun, 26 Jul 2020 19:38:11 +0000 (GMT)
Received: from [192.168.0.8] (unknown [9.85.82.224])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 26 Jul 2020 19:38:11 +0000 (GMT)
Subject: [RESEND PATCH v5 04/11] ppc64/kexec_file: avoid stomping memory used
 by special regions
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 27 Jul 2020 01:08:09 +0530
Message-ID: <159579226194.5790.15098839436661702590.stgit@hbathini>
In-Reply-To: <159579157320.5790.6748078824637688685.stgit@hbathini>
References: <159579157320.5790.6748078824637688685.stgit@hbathini>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-26_12:2020-07-24,
 2020-07-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007260154
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
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

crashkernel region could have an overlap with special memory regions
like  opal, rtas, tce-table & such. These regions are referred to as
exclude memory ranges. Setup this ranges during image probe in order
to avoid them while finding the buffer for different kdump segments.
Override arch_kexec_locate_mem_hole() to locate a memory hole taking
these ranges into account.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---

v4 -> v5:
* Unchanged. Added Reviewed-by tag from Thiago.

v3 -> v4:
* Dropped KDUMP_BUF_MIN & KDUMP_BUF_MAX macros and fixed off-by-one error
  in arch_locate_mem_hole() helper routines.

v2 -> v3:
* If there are no exclude ranges, the right thing to do is fallbacking
  back to default kexec_locate_mem_hole() implementation instead of
  returning 0. Fixed that.

v1 -> v2:
* Did arch_kexec_locate_mem_hole() override to handle special regions.
* Ensured holes in the memory are accounted for while locating mem hole.
* Updated add_rtas_mem_range() & add_opal_mem_range() callsites based on
  the new prototype for these functions.


 arch/powerpc/include/asm/kexec.h  |    7 +
 arch/powerpc/kexec/elf_64.c       |    8 +
 arch/powerpc/kexec/file_load_64.c |  337 +++++++++++++++++++++++++++++++++++++
 3 files changed, 348 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index ac8fd4839171..835dc92e091c 100644
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
index 23ad04ccaf8e..64c15a5a280b 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -46,6 +46,14 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	if (ret)
 		goto out;
 
+	if (image->type == KEXEC_TYPE_CRASH) {
+		/* min & max buffer values for kdump case */
+		kbuf.buf_min = pbuf.buf_min = crashk_res.start;
+		kbuf.buf_max = pbuf.buf_max =
+				((crashk_res.end < ppc64_rma_size) ?
+				 crashk_res.end : (ppc64_rma_size - 1));
+	}
+
 	ret = kexec_elf_load(image, &ehdr, &elf_info, &kbuf, &kernel_load_addr);
 	if (ret)
 		goto out;
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 41fe8b6c72d6..2df6f4273ddd 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -17,12 +17,262 @@
 #include <linux/kexec.h>
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
+#include <linux/memblock.h>
+#include <asm/kexec_ranges.h>
 
 const struct kexec_file_ops * const kexec_file_loaders[] = {
 	&kexec_elf64_ops,
 	NULL
 };
 
+/**
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
+	ret = add_rtas_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_opal_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_reserved_ranges(mem_ranges);
+	if (ret)
+		goto out;
+
+	/* exclude memory ranges should be sorted for easy lookup */
+	sort_memory_ranges(*mem_ranges, true);
+out:
+	if (ret)
+		pr_err("Failed to setup exclude memory ranges\n");
+	return ret;
+}
+
+/**
+ * __locate_mem_hole_top_down - Looks top down for a large enough memory hole
+ *                              in the memory regions between buf_min & buf_max
+ *                              for the buffer. If found, sets kbuf->mem.
+ * @kbuf:                       Buffer contents and memory parameters.
+ * @buf_min:                    Minimum address for the buffer.
+ * @buf_max:                    Maximum address for the buffer.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int __locate_mem_hole_top_down(struct kexec_buf *kbuf,
+				      u64 buf_min, u64 buf_max)
+{
+	int ret = -EADDRNOTAVAIL;
+	phys_addr_t start, end;
+	u64 i;
+
+	for_each_mem_range_rev(i, &memblock.memory, NULL, NUMA_NO_NODE,
+			       MEMBLOCK_NONE, &start, &end, NULL) {
+		/*
+		 * memblock uses [start, end) convention while it is
+		 * [start, end] here. Fix the off-by-one to have the
+		 * same convention.
+		 */
+		end -= 1;
+
+		if (start > buf_max)
+			continue;
+
+		/* Memory hole not found */
+		if (end < buf_min)
+			break;
+
+		/* Adjust memory region based on the given range */
+		if (start < buf_min)
+			start = buf_min;
+		if (end > buf_max)
+			end = buf_max;
+
+		start = ALIGN(start, kbuf->buf_align);
+		if (start < end && (end - start + 1) >= kbuf->memsz) {
+			/* Suitable memory range found. Set kbuf->mem */
+			kbuf->mem = ALIGN_DOWN(end - kbuf->memsz + 1,
+					       kbuf->buf_align);
+			ret = 0;
+			break;
+		}
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
+			ret = __locate_mem_hole_top_down(kbuf, tmin, tmax);
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
+		ret = __locate_mem_hole_top_down(kbuf, tmin, tmax);
+	}
+	return ret;
+}
+
+/**
+ * __locate_mem_hole_bottom_up - Looks bottom up for a large enough memory hole
+ *                               in the memory regions between buf_min & buf_max
+ *                               for the buffer. If found, sets kbuf->mem.
+ * @kbuf:                        Buffer contents and memory parameters.
+ * @buf_min:                     Minimum address for the buffer.
+ * @buf_max:                     Maximum address for the buffer.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int __locate_mem_hole_bottom_up(struct kexec_buf *kbuf,
+				       u64 buf_min, u64 buf_max)
+{
+	int ret = -EADDRNOTAVAIL;
+	phys_addr_t start, end;
+	u64 i;
+
+	for_each_mem_range(i, &memblock.memory, NULL, NUMA_NO_NODE,
+			   MEMBLOCK_NONE, &start, &end, NULL) {
+		/*
+		 * memblock uses [start, end) convention while it is
+		 * [start, end] here. Fix the off-by-one to have the
+		 * same convention.
+		 */
+		end -= 1;
+
+		if (end < buf_min)
+			continue;
+
+		/* Memory hole not found */
+		if (start > buf_max)
+			break;
+
+		/* Adjust memory region based on the given range */
+		if (start < buf_min)
+			start = buf_min;
+		if (end > buf_max)
+			end = buf_max;
+
+		start = ALIGN(start, kbuf->buf_align);
+		if (start < end && (end - start + 1) >= kbuf->memsz) {
+			/* Suitable memory range found. Set kbuf->mem */
+			kbuf->mem = start;
+			ret = 0;
+			break;
+		}
+	}
+
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
+			ret = __locate_mem_hole_bottom_up(kbuf, tmin, tmax);
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
+		ret = __locate_mem_hole_bottom_up(kbuf, tmin, tmax);
+	}
+	return ret;
+}
+
 /**
  * setup_purgatory_ppc64 - initialize PPC64 specific purgatory's global
  *                         variables and call setup_purgatory() to initialize
@@ -67,6 +317,67 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 	return setup_new_fdt(image, fdt, initrd_load_addr, initrd_len, cmdline);
 }
 
+/**
+ * arch_kexec_locate_mem_hole - Skip special memory regions like rtas, opal,
+ *                              tce-table, reserved-ranges & such (exclude
+ *                              memory ranges) as they can't be used for kexec
+ *                              segment buffer. Sets kbuf->mem when a suitable
+ *                              memory hole is found.
+ * @kbuf:                       Buffer contents and memory parameters.
+ *
+ * Assumes minimum of PAGE_SIZE alignment for kbuf->memsz & kbuf->buf_align.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
+{
+	struct crash_mem **emem;
+	u64 buf_min, buf_max;
+	int ret;
+
+	/*
+	 * Use the generic kexec_locate_mem_hole for regular
+	 * kexec_file_load syscall
+	 */
+	if (kbuf->image->type != KEXEC_TYPE_CRASH)
+		return kexec_locate_mem_hole(kbuf);
+
+	/* Look up the exclude ranges list while locating the memory hole */
+	emem = &(kbuf->image->arch.exclude_ranges);
+	if (!(*emem) || ((*emem)->nr_ranges == 0)) {
+		pr_warn("No exclude range list. Using the default locate mem hole method\n");
+		return kexec_locate_mem_hole(kbuf);
+	}
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
+		sort_memory_ranges(*emem, true);
+	} else {
+		pr_err("Failed to locate memory buffer of size %lu\n",
+		       kbuf->memsz);
+	}
+	return ret;
+}
+
 /**
  * arch_kexec_kernel_image_probe - Does additional handling needed to setup
  *                                 kexec segments.
@@ -79,9 +390,31 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
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


