Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6562682AC8A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jan 2024 11:54:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZwwwNXG8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T9hPg6Twrz3cgl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jan 2024 21:54:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZwwwNXG8;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T9hNf0KWtz3cVW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jan 2024 21:53:38 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4T9hNf2LzXz4wcH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jan 2024 21:53:38 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4T9hNf2JVfz4wdC; Thu, 11 Jan 2024 21:53:38 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZwwwNXG8;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4T9hNd6zLxz4wcH
	for <linuxppc-dev@ozlabs.org>; Thu, 11 Jan 2024 21:53:37 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40BAaDSm004487;
	Thu, 11 Jan 2024 10:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=AGmOTRVEz3AOdEzjKW2bSuVnz2FgGn5gLXQjbPWZMKA=;
 b=ZwwwNXG8tUtk8Df33x6BnyMcz3INeQGr9SFmuKZFxjKpPdF9No6XS0SEaXq/auPdrjxz
 zWLO7nq3PSTAq73TRgnKqpe1nVf8AxyCl0HjFHd/J3MQB86wsNPKxQfmKiHOJnfYvYZw
 XcBXLOKf6QjngUC2QcNcj9WSkgZ39AEhhGNJq39ejUwLaQBJqhz3J7CiGxfp2ZUbfd1g
 cFeiuJjewNHW+drq9evdiV/tpkEJC/CBQn/EHbS2pLSJtoao/nG75KLH8iTmmzxpWlMt
 cy7OthUmc4c+sKwSoTDruB1Oc3tDfINin/I76PaRxwJZSQlLdIpoCv093KyGW4yiD6yM Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vjbc55fnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 10:52:25 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40BApYBJ015969;
	Thu, 11 Jan 2024 10:52:24 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vjbc55fn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 10:52:24 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40B8jwkY004427;
	Thu, 11 Jan 2024 10:52:23 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vfjpm2teg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 10:52:23 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40BAqIOT8127060
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jan 2024 10:52:19 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C75CA2005A;
	Thu, 11 Jan 2024 10:52:18 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 904BF2004E;
	Thu, 11 Jan 2024 10:52:14 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.79.182.66])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 11 Jan 2024 10:52:14 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v15 4/5] powerpc: add crash CPU hotplug support
Date: Thu, 11 Jan 2024 16:21:37 +0530
Message-ID: <20240111105138.251366-5-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240111105138.251366-1-sourabhjain@linux.ibm.com>
References: <20240111105138.251366-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: aLShd36ObraPLSUJ1Evd5UqhfBIG1Lxh
X-Proofpoint-GUID: 9-g_PleCw6di_tYHSMRLF6rhaGwmqn6C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-11_05,2024-01-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 adultscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401110088
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

Due to CPU/Memory hotplug or online/offline events, the elfcorehdr
(which describes the CPUs and memory of the crashed kernel) and FDT
(Flattened Device Tree) of kdump image becomes outdated. Consequently,
attempting dump collection with an outdated elfcorehdr or FDT can lead
to failed or inaccurate dump collection.

Going forward, CPU hotplug or online/offline events are referred as
CPU/Memory add/remove events.

The current solution to address the above issue involves monitoring the
CPU/Memory add/remove events in userspace using udev rules and whenever
there are changes in CPU and memory resources, the entire kdump image
is loaded again. The kdump image includes kernel, initrd, elfcorehdr,
FDT, purgatory. Given that only elfcorehdr and FDT get outdated due to
CPU/Memory add/remove events, reloading the entire kdump image is
inefficient. More importantly, kdump remains inactive for a substantial
amount of time until the kdump reload completes.

To address the aforementioned issue, commit 247262756121 ("crash: add
generic infrastructure for crash hotplug support") added a generic
infrastructure that allows architectures to selectively update the kdump
image component during CPU or memory add/remove events within the kernel
itself.

In the event of a CPU or memory add/remove events, the generic crash
hotplug event handler, `crash_handle_hotplug_event()`, is triggered. It
then acquires the necessary locks to update the kdump image and invokes
the architecture-specific crash hotplug handler,
`arch_crash_handle_hotplug_event()`, to update the required kdump image
components.

This patch adds crash hotplug handler for PowerPC and enable support to
update the kdump image on CPU add/remove events. Support for memory
add/remove events is added in a subsequent patch with the title
"powerpc: add crash memory hotplug support"

As mentioned earlier, only the elfcorehdr and FDT kdump image components
need to be updated in the event of CPU or memory add/remove events.
However, on PowerPC architecture crash hotplug handler only updates the
FDT to enable crash hotplug support for CPU add/remove events. Here's
why.

The elfcorehdr on PowerPC is built with possible CPUs, and thus, it does
not need an update on CPU add/remove events. On the other hand, the FDT
needs to be updated on CPU add events to include the newly added CPU. If
the FDT is not updated and the kernel crashes on a newly added CPU, the
kdump kernel will fail to boot due to the unavailability of the crashing
CPU in the FDT. During the early boot, it is expected that the boot CPU
must be a part of the FDT; otherwise, the kernel will raise a BUG and
fail to boot. For more information, refer to commit 36ae37e3436b0
("powerpc: Make boot_cpuid common between 32 and 64-bit"). Since it is
okay to have an offline CPU in the kdump FDT, no action is taken in case
of CPU removal.

There are two system calls, `kexec_file_load` and `kexec_load`, used to
load the kdump image. Few changes have been made to ensure kernel can
safely update the FDT of kdump image loaded using both system calls.

For kexec_file_load syscall the kdump image is prepared in kernel. So to
support an increasing number of CPUs, the FDT is constructed with extra
buffer space to ensure it can accommodate a possible number of CPU
nodes. Additionally, a call to fdt_pack (which trims the unused space
once the FDT is prepared) is avoided if this feature is enabled.

For the kexec_load syscall, the FDT is updated only if the
KEXEC_CRASH_HOTPLUG_SUPPORT kexec flag is passed to the kernel by
userspace (kexec tools). When userspace passes this flag to the kernel,
it indicates that the FDT is built to accommodate possible CPUs, and the
FDT segment is excluded from SHA calculation, making it safe to update.

The changes related to this feature are kept under the CRASH_HOTPLUG
config, and it is enabled by default.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
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
Cc: Hari Bathini <hbathini@linux.ibm.com>
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
 arch/powerpc/Kconfig              |  4 ++
 arch/powerpc/include/asm/kexec.h  |  6 +++
 arch/powerpc/kexec/core_64.c      | 69 +++++++++++++++++++++++++++++++
 arch/powerpc/kexec/elf_64.c       | 12 +++++-
 arch/powerpc/kexec/file_load_64.c | 15 +++++++
 5 files changed, 105 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 414b978b8010..91d7bb0b81ee 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -682,6 +682,10 @@ config RELOCATABLE_TEST
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
 
+config ARCH_SUPPORTS_CRASH_HOTPLUG
+	def_bool y
+	depends on PPC64
+
 config ARCH_SELECTS_CRASH_DUMP
 	def_bool y
 	depends on CRASH_DUMP
diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 562e1bb689da..943e58eb9bff 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -112,6 +112,12 @@ void crash_free_reserved_phys_range(unsigned long begin, unsigned long end);
 struct crash_mem;
 int update_cpus_node(void *fdt);
 int get_crash_memory_ranges(struct crash_mem **mem_ranges);
+
+#ifdef CONFIG_CRASH_HOTPLUG
+void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
+#define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
+#endif /*CONFIG_CRASH_HOTPLUG */
+
 #endif /* CONFIG_PPC64 */
 
 #ifdef CONFIG_KEXEC_FILE
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 48beaadcfb70..43fcd78c2102 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -542,6 +542,75 @@ int update_cpus_node(void *fdt)
 	return ret;
 }
 
+#ifdef CONFIG_CRASH_HOTPLUG
+#undef pr_fmt
+#define pr_fmt(fmt) "crash hp: " fmt
+
+/**
+ * arch_crash_handle_hotplug_event - Handle crash CPU/Memory hotplug events to update the
+ *				     necessary kexec segments based on the hotplug event.
+ * @image: a pointer to kexec_crash_image
+ * @arg: struct memory_notify handler for memory hotplug case and NULL for CPU hotplug case.
+ *
+ * Update the kdump image based on the type of hotplug event, represented by image->hp_action.
+ * CPU addition: Update the FDT segment to include the newly added CPU.
+ * CPU removal: No action is needed, with the assumption that it's okay to have offline CPUs
+ *		as part of the FDT.
+ * Memory addition/removal: No action is taken as this is not yet supported.
+ */
+void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
+{
+	unsigned int hp_action = image->hp_action;
+
+	/*
+	 * Since the hot-unplugged CPU is already part of crash FDT,
+	 * no action is needed for CPU remove case.
+	 */
+	if (hp_action == KEXEC_CRASH_HP_REMOVE_CPU) {
+		return;
+
+	} else if (hp_action == KEXEC_CRASH_HP_ADD_CPU) {
+
+		void *fdt, *ptr;
+		unsigned long mem;
+		int i, fdt_index = -1;
+
+		/* Find the FDT segment index in kexec segment array. */
+		for (i = 0; i < image->nr_segments; i++) {
+			mem = image->segment[i].mem;
+			ptr = __va(mem);
+
+			if (ptr && fdt_magic(ptr) == FDT_MAGIC) {
+				fdt_index = i;
+				break;
+			}
+		}
+
+		if (fdt_index < 0) {
+			pr_err("Unable to locate FDT segment.\n");
+			return;
+		}
+
+		fdt = __va((void *)image->segment[fdt_index].mem);
+
+		/* Temporarily invalidate the crash image while it is replaced */
+		xchg(&kexec_crash_image, NULL);
+
+		/* update FDT to refelect changes in CPU resrouces */
+		if (update_cpus_node(fdt))
+			pr_err("Failed to update crash FDT");
+
+		/* The crash image is now valid once again */
+		xchg(&kexec_crash_image, image);
+
+	} else if (hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY ||
+		   hp_action == KEXEC_CRASH_HP_ADD_MEMORY) {
+		pr_info_once("Crash update is not supported for memory hotplug\n");
+		return;
+	}
+}
+#endif
+
 #ifdef CONFIG_PPC_64S_HASH_MMU
 /* Values we need to export to the second kernel via the device tree. */
 static __be64 htab_base;
diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index 904016cf89ea..386b3cc802a4 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -30,6 +30,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 			unsigned long cmdline_len)
 {
 	int ret;
+	bool do_pack_fdt = true;
 	unsigned long kernel_load_addr;
 	unsigned long initrd_load_addr = 0, fdt_load_addr;
 	void *fdt;
@@ -116,7 +117,16 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	if (ret)
 		goto out_free_fdt;
 
-	fdt_pack(fdt);
+#ifdef CONFIG_CRASH_HOTPLG
+	/*
+	 * Do not pack FDT, additional space is reserved to accommodate
+	 * possible CPU nodes which are not yet present in the system yet.
+	 */
+	if (image->type == KEXEC_TYPE_CRASH)
+		do_pack_fdt = false;
+#endif
+	if (do_pack_fdt)
+		fdt_pack(fdt);
 
 	kbuf.buffer = fdt;
 	kbuf.bufsz = kbuf.memsz = fdt_totalsize(fdt);
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 923e24103808..3fb0500fee16 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 #include <asm/setup.h>
+#include <asm/cputhreads.h>
 #include <asm/drmem.h>
 #include <asm/firmware.h>
 #include <asm/kexec_ranges.h>
@@ -909,6 +910,9 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
 	unsigned int cpu_nodes, extra_size = 0;
 	struct device_node *dn;
 	u64 usm_entries;
+#ifdef CONFIG_CRASH_HOTPLUG
+	unsigned int possible_cpu_nodes;
+#endif
 
 	// Budget some space for the password blob. There's already extra space
 	// for the key name
@@ -941,6 +945,17 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
 	if (cpu_nodes > boot_cpu_node_count)
 		extra_size += (cpu_nodes - boot_cpu_node_count) * cpu_node_size();
 
+#ifdef CONFIG_CRASH_HOTPLUG
+	/*
+	 * Make sure enough space is reserved to accommodate possible CPU nodes
+	 * in the crash FDT. This allows packing possible CPU nodes which are
+	 * not yet present in the system without regenerating the entire FDT.
+	 */
+	possible_cpu_nodes = num_possible_cpus() / threads_per_core;
+	if (image->type == KEXEC_TYPE_CRASH && possible_cpu_nodes > cpu_nodes)
+		extra_size += (possible_cpu_nodes - cpu_nodes) * cpu_node_size();
+#endif
+
 	return extra_size;
 }
 
-- 
2.41.0

