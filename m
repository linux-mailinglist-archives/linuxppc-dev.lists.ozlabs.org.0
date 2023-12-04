Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA75802B5D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 06:39:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iZ5sjlks;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkCCB68rMz3vX9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 16:39:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iZ5sjlks;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkC5W0K3Kz3cM5
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Dec 2023 16:34:07 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SkC5V6zDlz4xjT
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Dec 2023 16:34:06 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SkC5V6vXKz4xjc; Mon,  4 Dec 2023 16:34:06 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iZ5sjlks;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SkC5V4ZHSz4xjT
	for <linuxppc-dev@ozlabs.org>; Mon,  4 Dec 2023 16:34:06 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B42STib018449;
	Mon, 4 Dec 2023 05:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=O+p1RPQYj0iQiMBN+9wiVEEOngUE7DmExepimze7EU4=;
 b=iZ5sjlksyVDpqEYm/bm0ALRI0VyqXwKuy9RJIP/4OPAWCNZ2//WCeQ1zBceVzzkqmncj
 +9h2GlaDvuehRGSxmN5XVlf4uBr/dQqw6+rLt2m976bhb4VQCvNxVvTJqrz0e6PbvZoj
 uSgDeX6kPXq/D9gdEJQq1DTPX2gZXXbZS9/7Sd+socUHLizffJ8Dl2JntkpDiKgcMuEd
 VLxq2uXQiv7cGwNH9o8b96xIXCrPOoWes8D79tzsVO1TSHp+tn0ihpqtE9JP3EK274KM
 5FpWSiP8AqCZlOJn5mdkEMkwOTUvVNxA8FyrXQejxbhBwWBX0UvX+m8nCXl0kGnPMZsO Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3us142avpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 05:33:46 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3B45R7Bp004172;
	Mon, 4 Dec 2023 05:33:46 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3us142avp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 05:33:45 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3B44nc9V019433;
	Mon, 4 Dec 2023 05:33:44 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3urewt6g5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 05:33:43 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3B45Xewc5571072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Dec 2023 05:33:40 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 82B3020043;
	Mon,  4 Dec 2023 05:33:40 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4871220040;
	Mon,  4 Dec 2023 05:33:35 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.c4p-in.ibmmobiledemo.com (unknown [9.43.24.184])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  4 Dec 2023 05:33:35 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v13 5/6] powerpc: add crash CPU hotplug support
Date: Mon,  4 Dec 2023 11:02:52 +0530
Message-ID: <20231204053253.25305-6-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231204053253.25305-1-sourabhjain@linux.ibm.com>
References: <20231204053253.25305-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: d-jE-sM8iAyGOsqDDpZRHSVxB2ed9JE8
X-Proofpoint-GUID: OGZmgWHyQY_wRWTpVjrDiHpU9l86epuG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_03,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2312040039
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, Eric DeVolder <eric.devolder@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Valentin Schneider <vschneid@redhat.com>, Baoquan He <bhe@redhat.com>, x86@kernel.org, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Due to CPU/Memory hotplug or online/offline events the elfcorehdr
(which describes the CPUs and memory of the crashed kernel) and FDT
(Flattened Device Tree) of kdump image becomes outdated. Consequently,
attempting dump collection with an outdated elfcorehdr or FDT can lead
to failed or inaccurate dump collection.

Going forward CPU hotplug or online/offlice events are referred as
CPU/Memory add/remvoe events.

The current solution to address the above issue involves monitoring the
CPU/memory add/remove events in userspace using udev rules and whenever
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

In the event of a CPU or memory add/remove event, the generic crash
hotplug event handler, `crash_handle_hotplug_event()`, is triggered. It
then acquires the necessary locks to update the kdump image and invokes
the architecture-specific crash hotplug handler,
`arch_crash_handle_hotplug_event()`, to update the required kdump image
components.

This patch adds crash hotplug handler for PowerPC and enable support to
update the kdump image on CPU add/remove events. Support for memory
add/remove events is added in a subsequent patch with the title
"powerpc: add crash memory hotplug support."

As mentioned earlier, only the elfcorehdr and FDT kdump image components
need to be updated in the event of CPU or memory add/remove events.
However, the PowerPC architecture crash hotplug handler only updates the
FDT to enable crash hotplug support for CPU add/remove events. Here's
why.

The Elfcorehdr on PowerPC is built with possible CPUs, and thus, it does
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
safely update the kdump FDT for both system calls.

For kexec_file_load syscall the kdump image is prepared in kernel. So to
support an increasing number of CPUs, the FDT is constructed with extra
buffer space to ensure it can accommodate a possible number of CPU
nodes. Additionally, a call to fdt_pack (which trims the unused space
once the FDT is prepared) is avoided for kdump image loading if this
feature is enabled.

For the kexec_load syscall, the FDT is updated only if both the
KEXEC_UPDATE_FDT and KEXEC_UPDATE_ELFCOREHDR kexec flags are passed to
the kernel by the kexec tool. Passing these flags to the kernel
indicates that the FDT is built to accommodate possible CPUs, and the
FDT segment is not considered for SHA calculation, making it safe to
update the FDT.

Commit 88a6f8994421 ("crash: memory and CPU hotplug sysfs attributes")
added a sysfs interface to indicate userspace (kdump udev rule) that
kernel will update the kdump image on CPU hotplug events, so kdump
reload can be avoided. Implement arch specific function
`arch_crash_hotplug_cpu_support()` to correctly advertise kernel
capability to update kdump image.

This feature is advertised to userspace when the following conditions
are met:

1. Kdump image is loaded using kexec_file_load system call.
2. Kdump image is loaded using kexec_load system and both
   KEXEC_UPATE_ELFCOREHDR and KEXEC_UPDATE_FDT kexec flags are
   passed to kernel.

The changes related to this feature are kept under the CRASH_HOTPLUG
config, and it is enabled by default.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Akhil Raj <lf32.dev@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <bhe@redhat.com>
Cc: Borislav Petkov (AMD) <bp@alien8.de>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Eric DeVolder <eric.devolder@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Laurent Dufour <laurent.dufour@fr.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Mimi Zohar <zohar@linux.ibm.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: kexec@lists.infradead.org
Cc: x86@kernel.org
---
 arch/powerpc/Kconfig              |  4 ++
 arch/powerpc/include/asm/kexec.h  | 11 ++++
 arch/powerpc/kexec/core_64.c      | 91 +++++++++++++++++++++++++++++++
 arch/powerpc/kexec/elf_64.c       | 12 +++-
 arch/powerpc/kexec/file_load_64.c | 14 +++++
 5 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6f105ee4f3cf..29949c0d301e 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -681,6 +681,10 @@ config RELOCATABLE_TEST
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
index 562e1bb689da..7823ab10d323 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -112,6 +112,17 @@ void crash_free_reserved_phys_range(unsigned long begin, unsigned long end);
 struct crash_mem;
 int update_cpus_node(void *fdt);
 int get_crash_memory_ranges(struct crash_mem **mem_ranges);
+
+#ifdef CONFIG_CRASH_HOTPLUG
+void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
+#define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
+
+#ifdef CONFIG_HOTPLUG_CPU
+int arch_crash_hotplug_cpu_support(struct kimage *image);
+#define arch_crash_hotplug_cpu_support arch_crash_hotplug_cpu_support
+#endif
+
+#endif /*CONFIG_CRASH_HOTPLUG */
 #endif /* CONFIG_PPC64 */
 
 #ifdef CONFIG_KEXEC_FILE
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 9966b51d9aa8..9932793cd64b 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -543,6 +543,97 @@ int update_cpus_node(void *fdt)
 	return ret;
 }
 
+#ifdef CONFIG_CRASH_HOTPLUG
+#undef pr_fmt
+#define pr_fmt(fmt) "crash hp: " fmt
+
+#ifdef CONFIG_HOTPLUG_CPU
+ /* Provides the value for the sysfs crash_hotplug nodes */
+int arch_crash_hotplug_cpu_support(struct kimage *image)
+{
+	if (image->file_mode)
+		return 1;
+
+	/*
+	 * Crash CPU hotplug support is not available for kdump image loaded
+	 * using the kexec_load system and the required attributes are not set.
+	 */
+	return image->update_elfcorehdr && image->update_fdt;
+}
+#endif
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
+	 * Check if it is safe to update the FDT for the kexec_load syscall.
+	 * There's no need to check for the elfcorehdr; the generic crash
+	 * hotplug handler does that before calling this function.
+	 */
+	if (!(image->file_mode || image->update_fdt))
+		return;
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
index eeb258002d1e..b072f589b142 100644
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
index 9c29f913112d..97f0c6fdc45f 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -909,6 +909,9 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
 	unsigned int cpu_nodes, extra_size = 0;
 	struct device_node *dn;
 	u64 usm_entries;
+#ifdef CONFIG_CRASH_HOTPLUG
+	unsigned int possible_cpu_nodes;
+#endif
 
 	// Budget some space for the password blob. There's already extra space
 	// for the key name
@@ -941,6 +944,17 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
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

