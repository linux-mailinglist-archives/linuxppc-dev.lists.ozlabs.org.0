Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A62346EBEC8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Apr 2023 12:57:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q44wl47Z5z3fXt
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Apr 2023 20:57:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YMlUmVB9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q44q91761z3f7K
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Apr 2023 20:52:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YMlUmVB9;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Q44q90fjsz4xFh
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Apr 2023 20:52:53 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Q44q90c85z4xKS; Sun, 23 Apr 2023 20:52:53 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YMlUmVB9;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Q44q85Smmz4xFh
	for <linuxppc-dev@ozlabs.org>; Sun, 23 Apr 2023 20:52:52 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33NARP2i031343;
	Sun, 23 Apr 2023 10:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=sr9HkYOgW2s5m++cs6x6XTGC53BWeHi2/KRxTjayfyI=;
 b=YMlUmVB9WauyqGsOPSjutVzfytBcIdv3brjSmc3xVhQ672VN9wGexF+aTB9PQnujBj0F
 8tKy2W50Vx3FryYENKYjg7xGSK7Gm5hHhGkoyvaFumdHhGMLXeM+oEjGhcJJ061946Yp
 EkkDzDawf3jalGnXQMpb/TukUswsSAXAijo61GTQiF4h5/8CAj9UfpTOlMozSrwrRW02
 0CrEbpC0AQucAo/pbCxmWSKsHCyZY0Fttsrt/ZIfoKdQuHIJu+mUSUt4/d6LcYMf3Yf4
 XxYZdfpjvCH0y3zXeL9aJeP2j9wtcTsWtK8UtBsU5FLQXN3NzuurZVX5UUkh6HLpYJBM jw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q48jjq3s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Apr 2023 10:52:44 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33NAloFk014556;
	Sun, 23 Apr 2023 10:52:44 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q48jjq3re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Apr 2023 10:52:44 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33N30NnI030805;
	Sun, 23 Apr 2023 10:52:41 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3q47770jd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Apr 2023 10:52:41 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33NAqcgx21365386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 23 Apr 2023 10:52:38 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C2D120043;
	Sun, 23 Apr 2023 10:52:38 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 18FD320040;
	Sun, 23 Apr 2023 10:52:35 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.22.217])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 23 Apr 2023 10:52:34 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v10 5/5] powerpc/kexec: add crash memory hotplug support
Date: Sun, 23 Apr 2023 16:22:13 +0530
Message-Id: <20230423105213.70795-6-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230423105213.70795-1-sourabhjain@linux.ibm.com>
References: <20230423105213.70795-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MpLcnz16uJKM99Yht7nUmoAI1v5B7hUd
X-Proofpoint-GUID: BfxVrRtjrmWAoowl91gybpq7R9QJU9la
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-23_06,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304230097
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
Cc: eric.devolder@oracle.com, bhe@redhat.com, mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org, Laurent Dufour <laurent.dufour@fr.ibm.com>, ldufour@linux.ibm.com, hbathini@linux.ibm.com
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
Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com>
---
 arch/powerpc/include/asm/kexec_ranges.h |  1 +
 arch/powerpc/kexec/core_64.c            | 77 +++++++++++++++++++++-
 arch/powerpc/kexec/file_load_64.c       | 36 ++++++++++-
 arch/powerpc/kexec/ranges.c             | 85 +++++++++++++++++++++++++
 4 files changed, 195 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec_ranges.h b/arch/powerpc/include/asm/kexec_ranges.h
index f83866a19e870..802abf580cf0f 100644
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
index 147ea6288a526..01a764b1c9b07 100644
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
+ * @arg: struct memory_notify data handler
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
+	 * The hot unplugged memory is not yet removed from crash memory
+	 * ranges, remove it here.
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
  * arch_crash_hotplug_handler() - Handle crash CPU/Memory hotplug events to update the
  *                                necessary kexec segments based on the hotplug event.
@@ -554,12 +625,14 @@ int update_cpus_node(void *fdt)
  * @arg: struct memory_notify handler for memory add/remove case and NULL for CPU case.
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
+		mn = (struct memory_notify *) arg;
+		update_crash_elfcorehdr(image, mn);
 		return;
 	}
 
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 3554168687869..db7ba1c8c5e0b 100644
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
+#if defined(CONFIG_MEMORY_HOTPLUG)
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
index 5fc53a5fcfdf6..d8007363cdc11 100644
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
2.39.2

