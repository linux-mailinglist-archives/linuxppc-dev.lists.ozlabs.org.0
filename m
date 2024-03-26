Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7F388BA20
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 07:00:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mDUF9eCi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3fL84M1Gz3vqZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 17:00:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mDUF9eCi;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3fF05ncrz3vYK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 16:56:20 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4V3fF05M0lz4wcK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 16:56:20 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4V3fF05HF8z4wcs; Tue, 26 Mar 2024 16:56:20 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mDUF9eCi;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4V3fF02JJwz4wcK
	for <linuxppc-dev@ozlabs.org>; Tue, 26 Mar 2024 16:56:20 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42Q5retR025443;
	Tue, 26 Mar 2024 05:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=OrtwPtgnPaq5YVseXK1eUpNBW/Gk7gKRJSeUnRnCqv4=;
 b=mDUF9eCisCEpVfT1zqYBZspgcnBjQuuolO+2lkLwE1ug/PViWaJOZDo+q8W4uQM/vGIQ
 q5Sbwylfm/EOvfFiBaY0SdBqxLEUHz1RxdUsSJ0ExDuHfe+Gr9QKjjijACduxX+H21LW
 FIDF1gZhXxMLAuxxD2GHNZcf6ceKI8UdR8nmtUYVOU2SgDE0OqeazVaBk5oNeUAyiQ/r
 X9DccjmsifaK0tPIoPAqMOBAbjDDBUnaHsy0JCtSraimL5FQ9Ir5WHp+MZ3vO8ByCmZC
 BIDALLxFUbMQ1Nr2vXX+QmA+e/+Nx9oo+LURXxp1KXFC2ToyTAdDhbj2ja1pKb7fJdgJ dA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x3r0nr2vp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 05:55:58 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42Q5twDD029386;
	Tue, 26 Mar 2024 05:55:58 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x3r0nr2v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 05:55:57 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42Q34VGr025458;
	Tue, 26 Mar 2024 05:55:42 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3x2awmnr83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 05:55:42 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42Q5tb2u42140004
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 26 Mar 2024 05:55:39 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4D3E2004B;
	Tue, 26 Mar 2024 05:55:36 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EAFF920049;
	Tue, 26 Mar 2024 05:55:28 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.19.10])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 26 Mar 2024 05:55:28 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v18 6/6] powerpc/crash: add crash memory hotplug support
Date: Tue, 26 Mar 2024 11:24:13 +0530
Message-ID: <20240326055413.186534-7-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240326055413.186534-1-sourabhjain@linux.ibm.com>
References: <20240326055413.186534-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cl5gd9WSBdvqAYpdA0dnUGYXjM-J9Iwo
X-Proofpoint-GUID: 7uB8CTUSHCZyjyfP1sJXUEmBEnlsmezD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_02,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2403210000
 definitions=main-2403260038
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Valentin Schneider <vschneid@redhat.com>, Baoquan He <bhe@redhat.com>, x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Naveen N Rao <naveen@kernel.org>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Extend the arch crash hotplug handler, as introduced by the patch title
("powerpc: add crash CPU hotplug support"), to also support memory
add/remove events.

Elfcorehdr describes the memory of the crash kernel to capture the
kernel; hence, it needs to be updated if memory resources change due to
memory add/remove events. Therefore, arch_crash_handle_hotplug_event()
is updated to recreate the elfcorehdr and replace it with the previous
one on memory add/remove events.

The memblock list is used to prepare the elfcorehdr. In the case of
memory hot remove, the memblock list is updated after the arch crash
hotplug handler is triggered, as depicted in Figure 1. Thus, the
hot-removed memory is explicitly removed from the crash memory ranges
to ensure that the memory ranges added to elfcorehdr do not include the
hot-removed memory.

    Memory remove
          |
          v
    Offline pages
          |
          v
 Initiate memory notify call <----> crash hotplug handler
 chain for MEM_OFFLINE event
          |
          v
 Update memblock list

 	Figure 1

There are two system calls, `kexec_file_load` and `kexec_load`, used to
load the kdump image. A few changes have been made to ensure that the
kernel can safely update the elfcorehdr component of the kdump image for
both system calls.

For the kexec_file_load syscall, kdump image is prepared in the kernel.
To support an increasing number of memory regions, the elfcorehdr is
built with extra buffer space to ensure that it can accommodate
additional memory ranges in future.

For the kexec_load syscall, the elfcorehdr is updated only if the
KEXEC_CRASH_HOTPLUG_SUPPORT kexec flag is passed to the kernel by the
kexec tool. Passing this flag to the kernel indicates that the
elfcorehdr is built to accommodate additional memory ranges and the
elfcorehdr segment is not considered for SHA calculation, making it safe
to update.

The changes related to this feature are kept under the CRASH_HOTPLUG
config, and it is enabled by default.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Acked-by: Hari Bathini <hbathini@linux.ibm.com>
Cc: Akhil Raj <lf32.dev@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Baoquan He <bhe@redhat.com>
Cc: Borislav Petkov (AMD) <bp@alien8.de>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Dufour <laurent.dufour@fr.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Mimi Zohar <zohar@linux.ibm.com>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: kexec@lists.infradead.org
Cc: x86@kernel.org
---
* No changes in v18.

 arch/powerpc/include/asm/kexec.h        |  3 +
 arch/powerpc/include/asm/kexec_ranges.h |  1 +
 arch/powerpc/kexec/crash.c              | 95 ++++++++++++++++++++++++-
 arch/powerpc/kexec/file_load_64.c       | 20 +++++-
 arch/powerpc/kexec/ranges.c             | 85 ++++++++++++++++++++++
 5 files changed, 202 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index e75970351bcd..95a98b390d62 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -141,6 +141,9 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
 
 int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags);
 #define arch_crash_hotplug_support arch_crash_hotplug_support
+
+unsigned int arch_crash_get_elfcorehdr_size(void);
+#define crash_get_elfcorehdr_size arch_crash_get_elfcorehdr_size
 #endif /* CONFIG_CRASH_HOTPLUG */
 
 extern int crashing_cpu;
diff --git a/arch/powerpc/include/asm/kexec_ranges.h b/arch/powerpc/include/asm/kexec_ranges.h
index 8489e844b447..14055896cbcb 100644
--- a/arch/powerpc/include/asm/kexec_ranges.h
+++ b/arch/powerpc/include/asm/kexec_ranges.h
@@ -7,6 +7,7 @@
 void sort_memory_ranges(struct crash_mem *mrngs, bool merge);
 struct crash_mem *realloc_mem_ranges(struct crash_mem **mem_ranges);
 int add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size);
+int remove_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size);
 int get_exclude_memory_ranges(struct crash_mem **mem_ranges);
 int get_reserved_memory_ranges(struct crash_mem **mem_ranges);
 int get_crash_memory_ranges(struct crash_mem **mem_ranges);
diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index 8938a19af12f..21b193e938a3 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -17,6 +17,7 @@
 #include <linux/irq.h>
 #include <linux/types.h>
 #include <linux/libfdt.h>
+#include <linux/memory.h>
 
 #include <asm/processor.h>
 #include <asm/machdep.h>
@@ -25,6 +26,7 @@
 #include <asm/setjmp.h>
 #include <asm/debug.h>
 #include <asm/interrupt.h>
+#include <asm/kexec_ranges.h>
 
 /*
  * The primary CPU waits a while for all secondary CPUs to enter. This is to
@@ -398,6 +400,94 @@ void default_machine_crash_shutdown(struct pt_regs *regs)
 #undef pr_fmt
 #define pr_fmt(fmt) "crash hp: " fmt
 
+/*
+ * Advertise preferred elfcorehdr size to userspace via
+ * /sys/kernel/crash_elfcorehdr_size sysfs interface.
+ */
+unsigned int arch_crash_get_elfcorehdr_size(void)
+{
+	unsigned long phdr_cnt;
+
+	/* A program header for possible CPUs + vmcoreinfo */
+	phdr_cnt = num_possible_cpus() + 1;
+	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
+		phdr_cnt += CONFIG_CRASH_MAX_MEMORY_RANGES;
+
+	return sizeof(struct elfhdr) + (phdr_cnt * sizeof(Elf64_Phdr));
+}
+
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
+			pr_err("Failed to remove hot-unplugged memory from crash memory ranges\n");
+			goto out;
+		}
+	}
+
+	ret = crash_prepare_elf64_headers(cmem, false, &elfbuf, &elfsz);
+	if (ret) {
+		pr_err("Failed to prepare elf header\n");
+		goto out;
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
+	kvfree(cmem);
+	if (elfbuf)
+		kvfree(elfbuf);
+}
+
 /**
  * get_fdt_index - Loop through the kexec segment array and find
  *		   the index of the FDT segment.
@@ -478,6 +568,8 @@ int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags)
  */
 void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 {
+	struct memory_notify *mn;
+
 	switch (image->hp_action) {
 	case KEXEC_CRASH_HP_REMOVE_CPU:
 		return;
@@ -488,7 +580,8 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 
 	case KEXEC_CRASH_HP_REMOVE_MEMORY:
 	case KEXEC_CRASH_HP_ADD_MEMORY:
-		pr_info_once("Crash update is not supported for memory hotplug\n");
+		mn = (struct memory_notify *)arg;
+		update_crash_elfcorehdr(image, mn);
 		return;
 	default:
 		pr_warn_once("Unknown hotplug action\n");
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 2640a804fcdf..925a69ad2468 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -595,6 +595,23 @@ static void update_backup_region_phdr(struct kimage *image, Elf64_Ehdr *ehdr)
 	}
 }
 
+static unsigned int kdump_extra_elfcorehdr_size(struct crash_mem *cmem)
+{
+#if defined(CONFIG_CRASH_HOTPLUG) && defined(CONFIG_MEMORY_HOTPLUG)
+	unsigned int extra_sz = 0;
+
+	if (CONFIG_CRASH_MAX_MEMORY_RANGES > (unsigned int)PN_XNUM)
+		pr_warn("Number of Phdrs %u exceeds max\n", CONFIG_CRASH_MAX_MEMORY_RANGES);
+	else if (cmem->nr_ranges >= CONFIG_CRASH_MAX_MEMORY_RANGES)
+		pr_warn("Configured crash mem ranges may not be enough\n");
+	else
+		extra_sz = (CONFIG_CRASH_MAX_MEMORY_RANGES - cmem->nr_ranges) * sizeof(Elf64_Phdr);
+
+	return extra_sz;
+#endif
+	return 0;
+}
+
 /**
  * load_elfcorehdr_segment - Setup crash memory ranges and initialize elfcorehdr
  *                           segment needed to load kdump kernel.
@@ -626,7 +643,8 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
 
 	kbuf->buffer = headers;
 	kbuf->mem = KEXEC_BUF_MEM_UNKNOWN;
-	kbuf->bufsz = kbuf->memsz = headers_sz;
+	kbuf->bufsz = headers_sz;
+	kbuf->memsz = headers_sz + kdump_extra_elfcorehdr_size(cmem);
 	kbuf->top_down = false;
 
 	ret = kexec_add_buffer(kbuf);
diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
index b1f4267d9b17..3702b0bdab14 100644
--- a/arch/powerpc/kexec/ranges.c
+++ b/arch/powerpc/kexec/ranges.c
@@ -620,4 +620,89 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges)
 		pr_err("Failed to setup crash memory ranges\n");
 	return ret;
 }
+
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
 #endif /* CONFIG_CRASH_DUMP */
-- 
2.43.0

