Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA027734A5F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 04:52:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z5UuS7Vq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QkvSp4tTVz3bNq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 12:52:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z5UuS7Vq;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QkvPx1ZhWz30fk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 12:50:13 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4QkvPx0r0wz4x0G
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 12:50:13 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4QkvPx0hJhz4x2c; Mon, 19 Jun 2023 12:50:13 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z5UuS7Vq;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4QkvPw5WFBz4x0G
	for <linuxppc-dev@ozlabs.org>; Mon, 19 Jun 2023 12:50:12 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J2MIrq021726;
	Mon, 19 Jun 2023 02:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1vZAiIeF8PY8O23m8NeNFdj0mi9w57QpugXmzyz5Yps=;
 b=Z5UuS7Vq40Z201mS1PUu5gPMceAl3QrOwgBY56ug+XqJxanw8I3YYjhvOLZvEcVNPsC8
 3nNzBUSst1jUHRB4jRD56vtaRhkvSDMRCDVI5qFJu6fIda2I45qPZ62cnjrlQDoiqQfW
 3uKLS/Zj/SEjtBWcEhrMn2k2i+Yoxt3AHj2Dm78cSHp2ugstqSsBdCIpAoZ8I0rRUVKY
 xH5or4RKd4bvEeoTC5YLZjkgEk3LiW11vHcjPiyggkblFskBbb9Fof/UFrblPUF0Fd16
 EaZaoEW6Yz+uJOfrsQnp62B/oKvkjB72eeWU8FhynriQ7vk8m6UsrM4mC3juEjF+xh0B HQ== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rae5x8d68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jun 2023 02:49:51 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35J2McsZ011993;
	Mon, 19 Jun 2023 02:49:49 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3r94f50tuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jun 2023 02:49:49 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35J2nj4614615160
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 02:49:45 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B0BC2004D;
	Mon, 19 Jun 2023 02:49:45 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 731012004B;
	Mon, 19 Jun 2023 02:49:43 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.70.141])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 19 Jun 2023 02:49:43 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v11 4/4] powerpc/crash: add crash memory hotplug support
Date: Mon, 19 Jun 2023 08:19:34 +0530
Message-Id: <20230619024934.567046-5-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230619024934.567046-1-sourabhjain@linux.ibm.com>
References: <20230619024934.567046-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: m_6zJl27kjEoDavRiVfRgGyMhmoQJwaj
X-Proofpoint-ORIG-GUID: m_6zJl27kjEoDavRiVfRgGyMhmoQJwaj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-18_16,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190022
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
Cc: mahesh@linux.vnet.ibm.com, ldufour@linux.ibm.com, eric.devolder@oracle.com, kexec@lists.infradead.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Extend PowerPC arch crash hotplug handler to support memory hotplug
events. Since elfcorehdr is used to exchange the memory info between the
kernels hence it needs to be recreated to reflect the changes due to
memory hotplug events.

The way memory hotplug events are handled on PowerPC and the notifier
call chain used in generic code to trigger the arch crash handler, the
process to recreate the elfcorehdr is different for memory add and
remove case.

For memory remove case the memory change notifier call chain is
triggered first and then memblock regions is updated. Whereas for the
memory hot add case, memblock regions are updated before invoking the
memory change notifier call chain.

On PowerPC, memblock regions list is used to prepare the elfcorehdr. In
case of memory hot remove the memblock regions are updated after the
arch crash hotplug handler is triggered, hence an additional step is
taken to ensure that memory ranges used to prepare elfcorehdr do not
include hot removed memory.

When memory is hot removed it possible that memory regions count may
increase. So to accommodate a growing number of memory regions, the
elfcorehdr kexec segment is built with additional buffer space.

The changes done here will also work for the kexec_load system call given
that the kexec tool builds the elfcoredhr with additional space to
accommodate future memory regions as it is done for kexec_file_load
system call in the kernel.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/include/asm/kexec.h        |  6 ++
 arch/powerpc/include/asm/kexec_ranges.h |  1 +
 arch/powerpc/kexec/core_64.c            | 77 +++++++++++++++++++++-
 arch/powerpc/kexec/file_load_64.c       | 36 ++++++++++-
 arch/powerpc/kexec/ranges.c             | 85 +++++++++++++++++++++++++
 5 files changed, 201 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index d3ff481aa9f8..10017880571c 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -112,6 +112,12 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
 static inline int crash_hotplug_cpu_support(void) { return 1; }
 #define crash_hotplug_cpu_support crash_hotplug_cpu_support
 #endif
+
+#ifdef CONFIG_MEMORY_HOTPLUG
+static inline int crash_hotplug_memory_support(void) { return 1; }
+#define crash_hotplug_memory_support crash_hotplug_memory_support
+#endif
+
 #endif
 #endif
 
diff --git a/arch/powerpc/include/asm/kexec_ranges.h b/arch/powerpc/include/asm/kexec_ranges.h
index f83866a19e87..802abf580cf0 100644
--- a/arch/powerpc/include/asm/kexec_ranges.h
+++ b/arch/powerpc/include/asm/kexec_ranges.h
@@ -7,6 +7,7 @@
 void sort_memory_ranges(struct crash_mem *mrngs, bool merge);
 struct crash_mem *realloc_mem_ranges(struct crash_mem **mem_ranges);
 int add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size);
+int remove_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size);
 int add_tce_mem_ranges(struct crash_mem **mem_ranges);
 int add_initrd_mem_range(struct crash_mem **mem_ranges);
 #ifdef CONFIG_PPC_64S_HASH_MMU
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 4d1c53cc9a90..e5038f2769bb 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/libfdt.h>
 #include <linux/memblock.h>
+#include <linux/memory.h>
 
 #include <asm/page.h>
 #include <asm/current.h>
@@ -547,6 +548,76 @@ int update_cpus_node(void *fdt)
 #undef pr_fmt
 #define pr_fmt(fmt) "crash hp: " fmt
 
+/**
+ * update_crash_elfcorehdr() - Recreate the elfcorehdr and replace it with old
+ *			       elfcorehdr in the kexec segment array.
+ * @image: the active struct kimage
+ * @mn: struct memory_notify data handler
+ */
+static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *mn)
+{
+	int ret;
+	struct crash_mem *cmem = NULL;
+	struct kexec_segment *ksegment;
+	void *ptr, *mem, *elfbuf = NULL;
+	unsigned long elfsz, memsz, base_addr, size;
+
+	ksegment = &image->segment[image->elfcorehdr_index];
+	mem = (void *) ksegment->mem;
+	memsz = ksegment->memsz;
+
+	ret = get_crash_memory_ranges(&cmem);
+	if (ret) {
+		pr_err("Failed to get crash mem range\n");
+		return;
+	}
+
+	/*
+	 * The hot unplugged memory is part of crash memory ranges,
+	 * remove it here.
+	 */
+	if (image->hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY) {
+		base_addr = PFN_PHYS(mn->start_pfn);
+		size = mn->nr_pages * PAGE_SIZE;
+		ret = remove_mem_range(&cmem, base_addr, size);
+		if (ret) {
+			pr_err("Failed to remove hot-unplugged from crash memory ranges.\n");
+			return;
+		}
+	}
+
+	ret = crash_prepare_elf64_headers(cmem, false, &elfbuf, &elfsz);
+	if (ret) {
+		pr_err("Failed to prepare elf header\n");
+		return;
+	}
+
+	/*
+	 * It is unlikely that kernel hit this because elfcorehdr kexec
+	 * segment (memsz) is built with addition space to accommodate growing
+	 * number of crash memory ranges while loading the kdump kernel. It is
+	 * Just to avoid any unforeseen case.
+	 */
+	if (elfsz > memsz) {
+		pr_err("Updated crash elfcorehdr elfsz %lu > memsz %lu", elfsz, memsz);
+		goto out;
+	}
+
+	ptr = __va(mem);
+	if (ptr) {
+		/* Temporarily invalidate the crash image while it is replaced */
+		xchg(&kexec_crash_image, NULL);
+
+		/* Replace the old elfcorehdr with newly prepared elfcorehdr */
+		memcpy((void *)ptr, elfbuf, elfsz);
+
+		/* The crash image is now valid once again */
+		xchg(&kexec_crash_image, image);
+	}
+out:
+	vfree(elfbuf);
+}
+
 /**
  * arch_crash_handle_hotplug_event - Handle crash CPU/Memory hotplug events to update the
  *				     necessary kexec segments based on the hotplug event.
@@ -554,12 +625,14 @@ int update_cpus_node(void *fdt)
  * @arg: struct memory_notify handler for memory hotplug case and NULL for CPU hotplug case.
  *
  * Update FDT segment to include newly added CPU. No action for CPU remove case.
+ * Recreate the elfcorehdr for Memory add/remove case and replace it with old one.
  */
 void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 {
 	void *fdt, *ptr;
 	unsigned long mem;
 	int i, fdt_index = -1;
+	struct memory_notify *mn;
 	unsigned int hp_action = image->hp_action;
 
 	/*
@@ -569,9 +642,9 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 	if (hp_action == KEXEC_CRASH_HP_REMOVE_CPU)
 		return;
 
-	/* crash update on memory hotplug events is not supported yet */
 	if (hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY || hp_action == KEXEC_CRASH_HP_ADD_MEMORY) {
-		pr_info_once("Crash update is not supported for memory hotplug\n");
+		mn = (struct memory_notify *)arg;
+		update_crash_elfcorehdr(image, mn);
 		return;
 	}
 
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 1757e7ba379a..8853b7308ae9 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -21,6 +21,8 @@
 #include <linux/memblock.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <linux/elf.h>
+
 #include <asm/setup.h>
 #include <asm/drmem.h>
 #include <asm/firmware.h>
@@ -707,6 +709,30 @@ static void update_backup_region_phdr(struct kimage *image, Elf64_Ehdr *ehdr)
 	}
 }
 
+/* get_max_phdr - Find the total number of Phdr needed to represent the
+ *		  max memory in the kdump elfcorehdr.
+ *
+ * @cmem: crash memory ranges in the system.
+ */
+static int get_max_phdr(struct crash_mem *cmem)
+{
+	int max_lmb;
+
+	/* In the worst case, a Phdr is needed for every other LMB to be represented
+	 * as an individual crash range.
+	 */
+	max_lmb = memory_hotplug_max() / 2 * drmem_lmb_size();
+
+	/* Do not cross the Phdr max limit of the elf header.
+	 * Avoid counting Phdr for crash ranges (cmem->nr_ranges) which
+	 * are already part of elfcorehdr.
+	 */
+	if (max_lmb > PN_XNUM)
+		return PN_XNUM - cmem->nr_ranges;
+
+	return max_lmb - cmem->nr_ranges;
+}
+
 /**
  * load_elfcorehdr_segment - Setup crash memory ranges and initialize elfcorehdr
  *                           segment needed to load kdump kernel.
@@ -738,7 +764,13 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
 
 	kbuf->buffer = headers;
 	kbuf->mem = KEXEC_BUF_MEM_UNKNOWN;
-	kbuf->bufsz = kbuf->memsz = headers_sz;
+	kbuf->bufsz = headers_sz;
+/* Additional buffer space to accommodate future memory ranges */
+#ifdef CONFIG_MEMORY_HOTPLUG
+	kbuf->memsz = headers_sz + get_max_phdr(cmem) * sizeof(Elf64_Phdr);
+#else
+	kbuf->memsz = headers_sz;
+#endif
 	kbuf->top_down = false;
 
 	ret = kexec_add_buffer(kbuf);
@@ -748,7 +780,7 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
 	}
 
 	image->elf_load_addr = kbuf->mem;
-	image->elf_headers_sz = headers_sz;
+	image->elf_headers_sz = kbuf->memsz;
 	image->elf_headers = headers;
 out:
 	kfree(cmem);
diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
index 5fc53a5fcfdf..d8007363cdc1 100644
--- a/arch/powerpc/kexec/ranges.c
+++ b/arch/powerpc/kexec/ranges.c
@@ -234,6 +234,91 @@ int add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size)
 	return __add_mem_range(mem_ranges, base, size);
 }
 
+/**
+ * remove_mem_range - Removes the given memory range from the range list.
+ * @mem_ranges:    Range list to remove the memory range to.
+ * @base:          Base address of the range to remove.
+ * @size:          Size of the memory range to remove.
+ *
+ * (Re)allocates memory, if needed.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int remove_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size)
+{
+	u64 end;
+	int ret = 0;
+	unsigned int i;
+	u64 mstart, mend;
+	struct crash_mem *mem_rngs = *mem_ranges;
+
+	if (!size)
+		return 0;
+
+	/*
+	 * Memory range are stored as start and end address, use
+	 * the same format to do remove operation.
+	 */
+	end = base + size - 1;
+
+	for (i = 0; i < mem_rngs->nr_ranges; i++) {
+		mstart = mem_rngs->ranges[i].start;
+		mend = mem_rngs->ranges[i].end;
+
+		/*
+		 * Memory range to remove is not part of this range entry
+		 * in the memory range list
+		 */
+		if (!(base >= mstart && end <= mend))
+			continue;
+
+		/*
+		 * Memory range to remove is equivalent to this entry in the
+		 * memory range list. Remove the range entry from the list.
+		 */
+		if (base == mstart && end == mend) {
+			for (; i < mem_rngs->nr_ranges - 1; i++) {
+				mem_rngs->ranges[i].start = mem_rngs->ranges[i+1].start;
+				mem_rngs->ranges[i].end = mem_rngs->ranges[i+1].end;
+			}
+			mem_rngs->nr_ranges--;
+			goto out;
+		}
+		/*
+		 * Start address of the memory range to remove and the
+		 * current memory range entry in the list is same. Just
+		 * move the start address of the current memory range
+		 * entry in the list to end + 1.
+		 */
+		else if (base == mstart) {
+			mem_rngs->ranges[i].start = end + 1;
+			goto out;
+		}
+		/*
+		 * End address of the memory range to remove and the
+		 * current memory range entry in the list is same.
+		 * Just move the end address of the current memory
+		 * range entry in the list to base - 1.
+		 */
+		else if (end == mend)  {
+			mem_rngs->ranges[i].end = base - 1;
+			goto out;
+		}
+		/*
+		 * Memory range to remove is not at the edge of current
+		 * memory range entry. Split the current memory entry into
+		 * two half.
+		 */
+		else {
+			mem_rngs->ranges[i].end = base - 1;
+			size = mem_rngs->ranges[i].end - end;
+			ret = add_mem_range(mem_ranges, end + 1, size);
+		}
+	}
+out:
+	return ret;
+}
+
 /**
  * add_tce_mem_ranges - Adds tce-table range to the given memory ranges list.
  * @mem_ranges:         Range list to add the memory range(s) to.
-- 
2.40.1

