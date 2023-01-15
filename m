Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAA666B1DF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jan 2023 16:10:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nvz9y4sdkz3fQP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 02:10:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mXe2ijsk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nvz0s5MMxz3cd5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 02:02:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mXe2ijsk;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Nvz0s4vljz4xwt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 02:02:53 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Nvz0s4s4yz4xyZ; Mon, 16 Jan 2023 02:02:53 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mXe2ijsk;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Nvz0s2ctBz4xwt
	for <linuxppc-dev@ozlabs.org>; Mon, 16 Jan 2023 02:02:53 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30FBCBog028902;
	Sun, 15 Jan 2023 15:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cDQq49eWA5yZxK7uGmk3KFF/POt1WhzrerVrW0bbOxw=;
 b=mXe2ijskywI8XmVhWy1ln229zEJmQYH1feIub/GOR9aC0TerXu1g6zKiZgI0Vi/JvZKE
 zvhIJjFdCjpARRVtKCeiq77msKHq8NiT99re2OlJTGz0GVrP9NMreoTJBr7h6QfnXnKJ
 cq+aFG3o0z35fizdQHA9oKEQFO2kDEM0T3oEoDaZ0DhfmJ/R6h624/cXEstv7Uo3OqHA
 pCNcZJWAM1Z0meNW//rnL0AAfBp63IScfIHNrperTq5SW7MALaIh45r/hnAoFds/ygiH
 M88tC+w2AQEf0nutU5R8qAxHqM7nBacpk/urpdq4bnkiXn3fEmAvDrudB8NTp8MXymV7 xA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n4gdbtkqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jan 2023 15:02:46 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30FF1CNs002657;
	Sun, 15 Jan 2023 15:02:45 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n4gdbtkq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jan 2023 15:02:45 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30FAXwDX006702;
	Sun, 15 Jan 2023 15:02:43 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3n3m16h0n1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jan 2023 15:02:42 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30FF2daK21168518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Jan 2023 15:02:39 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 460A22004E;
	Sun, 15 Jan 2023 15:02:39 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C96920040;
	Sun, 15 Jan 2023 15:02:36 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.71.156])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 15 Jan 2023 15:02:35 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v7 8/8] powerpc/kexec: add crash memory hotplug support
Date: Sun, 15 Jan 2023 20:32:06 +0530
Message-Id: <20230115150206.431528-9-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115150206.431528-1-sourabhjain@linux.ibm.com>
References: <20230115150206.431528-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lOrSzKXvCulCQ0K7Y6IV_CrU5DpLGgE9
X-Proofpoint-ORIG-GUID: a7aVh0Xa50-T_A3u2QQHf3dWwU4xanVP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-15_11,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301150116
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
Cc: eric.devolder@oracle.com, bhe@redhat.com, mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org, ldufour@linux.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Extend PowerPC arch crash hotplug handler to support memory hotplug
events. Since elfcorehdr is used to exchange the memory info between the
kernels hence it needs to be recreated to reflect the changes due to
memory hotplug events.

The way memory hotplug events are handled on PowerPC and the notifier call
chain used in generic code to trigger the arch crash handler, the process
to recreate the elfcorehdr is different for memory add and remove events.

In the hot remove case, the memory region is first marked offline then the
notifier call chain is triggered (same is used to initiate arch crash
hotplug handler) and at last the memblock structure is updated. Whereas
in the hot add case, memblock structure is updated before the notifier
call chain is triggered.

On PowerPC, memblock structure is used to identify the memory ranges for
elfcorehdr. In case of memory hot remove the memblock structure is updated
after the arch crash hotplug handler is triggered, hence an additional
step is taken to ensure that memory ranges used to build elfcorehdr do
not include hot removed memory. Whereas no such extra steps are needed
for the hot add case because memblock structure is updated before the
arch crash hotplug handler is triggered.

The hot removed memory is explicitly removed from the memory ranges list
before creating elfcorehdr for the hot remove case.

To accommodate a growing number of memory regions, elfcorehdr is built
with additional buffer space to hold max memory regions.

The changes done here will also work for the kexec_load system call given
that the kexec tool builds the elfcoredhr with additional space to
accommodate future memory regions as it is done for kexec_file_load
system call.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/include/asm/kexec_ranges.h |  1 +
 arch/powerpc/kexec/core_64.c            | 59 ++++++++++++++++++++++--
 arch/powerpc/kexec/file_load_64.c       | 12 ++++-
 arch/powerpc/kexec/ranges.c             | 60 +++++++++++++++++++++++++
 4 files changed, 127 insertions(+), 5 deletions(-)

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
index 1f807b29db93f..0516fb5dd543f 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/libfdt.h>
 #include <linux/memblock.h>
+#include <linux/memory.h>
 
 #include <asm/page.h>
 #include <asm/current.h>
@@ -571,6 +572,60 @@ int update_cpus_node(void *fdt)
 }
 
 #if defined(CONFIG_CRASH_HOTPLUG)
+int update_crash_elfcorehdr(struct kimage *image, unsigned int hp_action, void *arg)
+{
+	int ret;
+	struct crash_mem *cmem = NULL;
+	struct kexec_segment *ksegment;
+	unsigned long elfsz;
+	void *elfbuf = NULL;
+	void *mem;
+	unsigned long memsz;
+	char *ptr;
+	struct memory_notify *mn = (struct memory_notify *) arg;
+	unsigned long base_addr;
+	unsigned long size;
+
+	ksegment = &image->segment[image->elfcorehdr_index];
+	mem = (void *) ksegment->mem;
+	memsz = ksegment->memsz;
+
+	ret = get_crash_memory_ranges(&cmem);
+	if (ret) {
+		pr_err("crash hp: failed to get crash mem range\n");
+		return -1;
+	}
+
+	if (hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY) {
+		base_addr = PFN_PHYS(mn->start_pfn);
+		size = mn->nr_pages * PAGE_SIZE;
+		ret = remove_mem_range(&cmem, base_addr, size);
+		if (ret)
+			return -1;
+	}
+
+	ret = crash_prepare_elf64_headers(image, cmem, false, &elfbuf, &elfsz);
+	if (ret) {
+		pr_err("crash hp: failed to prepare elf header\n");
+		return -1;
+	}
+
+	if (elfsz > memsz) {
+		pr_err("crash hp: updated crash elfcorehdr elfsz %lu > memsz %lu", elfsz, memsz);
+		return -1;
+	}
+
+	ptr = __va(mem);
+	if (ptr) {
+		xchg(&kexec_crash_image, NULL);
+		memcpy((void *)ptr, elfbuf, elfsz);
+		xchg(&kexec_crash_image, image);
+	}
+
+	vfree(elfbuf);
+	return 0;
+}
+
 /**
  * arch_crash_hotplug_handler() - Handle hotplug kexec segements changes FDT, elfcorehdr
  * @image: the active struct kimage
@@ -588,9 +643,8 @@ void arch_crash_handle_hotplug_event(struct kimage *image, unsigned int hp_actio
 	if (hp_action == KEXEC_CRASH_HP_REMOVE_CPU)
 		return;
 
-	/* crash update on memory hotplug is not support yet */
 	if (hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY || hp_action == KEXEC_CRASH_HP_ADD_MEMORY) {
-		pr_info_once("crash hp: crash update is not supported with memory hotplug\n");
+		update_crash_elfcorehdr(image, hp_action, arg);
 		return;
 	}
 
@@ -605,7 +659,6 @@ void arch_crash_handle_hotplug_event(struct kimage *image, unsigned int hp_actio
 	/* Temporarily invalidate the crash image while it is replaced */
 	xchg(&kexec_crash_image, NULL);
 
-	/* update FDT to refelect changes to CPU resrouces */
 	if (update_cpus_node(fdt))
 		pr_err("crash hp: failed to update crash FDT");
 
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 725f74d1b928c..5ec5d0b1ec904 100644
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
@@ -735,7 +737,13 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
 
 	kbuf->buffer = headers;
 	kbuf->mem = KEXEC_BUF_MEM_UNKNOWN;
-	kbuf->bufsz = kbuf->memsz = headers_sz;
+	kbuf->bufsz = headers_sz;
+/* Additional buffer space to accommodate future memory ranges */
+#if defined(CONFIG_MEMORY_HOTPLUG)
+	kbuf->memsz = PN_XNUM * sizeof(Elf64_Phdr);
+#else
+	kbuf->memsz = headers_sz;
+#endif
 	kbuf->top_down = false;
 
 	ret = kexec_add_buffer(kbuf);
@@ -745,7 +753,7 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
 	}
 
 	image->elf_load_addr = kbuf->mem;
-	image->elf_headers_sz = headers_sz;
+	image->elf_headers_sz = kbuf->memsz;
 	image->elf_headers = headers;
 out:
 	kfree(cmem);
diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
index 5fc53a5fcfdf6..2bb90874df781 100644
--- a/arch/powerpc/kexec/ranges.c
+++ b/arch/powerpc/kexec/ranges.c
@@ -234,6 +234,66 @@ int add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size)
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
+	int ret = 0;
+	unsigned int i;
+	struct crash_mem *mem_rngs = *mem_ranges;
+	u64 mstart, mend;
+	u64 range_start, range_end;
+
+	if (!size)
+		return 0;
+
+	range_start = base;
+	range_end = base + size - 1;
+
+	for (i = 0; i < mem_rngs->nr_ranges; i++) {
+		mstart = mem_rngs->ranges[i].start;
+		mend = mem_rngs->ranges[i].end;
+
+		if (!(range_start >= mstart && range_end <= mend))
+			continue;
+
+		if (range_start == mstart) {
+			if (range_end == mend) {
+				for (; i < mem_rngs->nr_ranges - 1; i++) {
+					mem_rngs->ranges[i].start = mem_rngs->ranges[i+1].start;
+					mem_rngs->ranges[i].end = mem_rngs->ranges[i+1].end;
+				}
+				mem_rngs->nr_ranges--;
+				goto out;
+			}
+			mem_rngs->ranges[i].start = range_end + 1;
+			goto out;
+		} else if (range_end == mend)  {
+			mem_rngs->ranges[i].end = range_start - 1;
+			goto out;
+		} else {
+			size = mem_rngs->ranges[i].end - range_end;
+			mem_rngs->ranges[i].end = range_start - 1;
+			if (add_mem_range(mem_ranges, range_end + 1, size))
+				goto error;
+			goto out;
+		}
+	}
+error:
+	return -1;
+
+out:
+	return ret;
+}
+
 /**
  * add_tce_mem_ranges - Adds tce-table range to the given memory ranges list.
  * @mem_ranges:         Range list to add the memory range(s) to.
-- 
2.39.0

