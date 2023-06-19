Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17260734A63
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 04:53:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GQe/jnMT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QkvTy017Dz3bZr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 12:53:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GQe/jnMT;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QkvQ61XqRz30Xf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 12:50:22 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4QkvQ615CNz4wg8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 12:50:22 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4QkvQ60vm8z4x0L; Mon, 19 Jun 2023 12:50:22 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GQe/jnMT;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4QkvQ54wfqz4wg8
	for <linuxppc-dev@ozlabs.org>; Mon, 19 Jun 2023 12:50:21 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J1rPGC020370;
	Mon, 19 Jun 2023 02:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=44NntPtwanWBnhVEhxAVjvyqHlt14FXL4khpqBdJBp8=;
 b=GQe/jnMT61E5RLvd8GtmlUX1nMpGWkOSX8Wgz59oukeEkbCMIxMJ5btp//otAYHcWFaY
 XFTszImwOvUnsfX2rUR0cnx14IvWBbkUQeQBAyOWTAeVPiMaTC8g2mWqxD96m5zNbHno
 F583FLxxeXrOEoEvN6bqtQPeaB6BVW6drLtQcRIRFPFP1VDujHY8noA/1wY+g6ghZ2N2
 qvMqOIgJPwZc74kChshLo9gsXW1K81W3auQb3QrKVgeUF6LL2T0FT7k+1zr7dW3s34VS
 e/C0P2L7Xsm9jIN9kcIh95Mr5UXEQMhbyZA4N82swSQShbElrNYNTHbIyEshZQBk02LF Xg== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3radra0u5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jun 2023 02:49:46 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35J2Gnhe001895;
	Mon, 19 Jun 2023 02:49:44 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3r94f58ty9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jun 2023 02:49:44 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35J2nfRj60752160
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 02:49:41 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0FDDC20043;
	Mon, 19 Jun 2023 02:49:41 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D50520040;
	Mon, 19 Jun 2023 02:49:39 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.70.141])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 19 Jun 2023 02:49:39 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v11 2/4] powerpc/crash: add crash CPU hotplug support
Date: Mon, 19 Jun 2023 08:19:32 +0530
Message-Id: <20230619024934.567046-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230619024934.567046-1-sourabhjain@linux.ibm.com>
References: <20230619024934.567046-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: D4bmSDx3YNjeGmuMstqDpbwd8g4dJxqJ
X-Proofpoint-ORIG-GUID: D4bmSDx3YNjeGmuMstqDpbwd8g4dJxqJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-18_16,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
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

Introduce powerpc crash hotplug handler to update the necessary kexec
segments in the kernel on CPU/Memory hotplug events. Currently, these
updates are done by monitoring CPU/Memory hotplug events in userspace.

In the generic infrastructure, a shared crash hotplug handler is
triggered for both CPU and Memory hotplug events. However, in this
particular patch, only CPU hotplug events are handled for crash updates.
Support for crash updates during memory hotplug events will be
introduced in subsequent patches.

The elfcorehdr segment facilitates the exchange of CPU and other
relevant dump information between kernels. Ideally, this segment should
be regenerated during CPU hotplug events to reflect any changes.
However, on powerpc systems, the elfcorehdr is initially constructed
with all possible CPUs, rendering it unnecessary to update or recreate
it when CPU hotplug events occur.

Additionally, on powerpc, there is another segment called the FDT
(Flattened Device Tree) that holds CPU data. During the boot of the
kdump kernel, it is crucial for the crashing CPU to be present in the
FDT. Failure to have the crashing CPU in the FDT would result in a
boot failure of the kdump kernel.

Therefore, the only action required on powerpc to handle a crash CPU
hotplug event is to add the hot-added CPUs to the kdump FDT segment,
ensuring that the kdump kernel boots successfully. However, there is
no need to remove the hot-unplugged CPUs from the FDT segment, so no
action is taken for a CPU hot removal event.

In order to support an increasing number of CPUs, the FDT is constructed
with extra buffer space to ensure it can accommodate possible number of
CPUs nodes. Also do not pack the FDT and shrik its size once prepared.

The changes introduced here will also work for the kexec_load system
call, considering that the kexec tool constructs the FDT segment with
extra space to accommodate possible number CPUs nodes.

Since memory crash hotplug support is not there yet the crash hotplug
the handler simply warns the user and returns.

The changes realted to in-kernel update to kdump kernel kexec segments
on CPU/Memory hotplug and online/offline events are kept under
CRASH_HOTPLUG config and it is enabled by default on PowerPC platform.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/Kconfig              |  3 ++
 arch/powerpc/include/asm/kexec.h  | 10 +++++
 arch/powerpc/kexec/core_64.c      | 61 +++++++++++++++++++++++++++++++
 arch/powerpc/kexec/elf_64.c       | 12 +++++-
 arch/powerpc/kexec/file_load_64.c | 14 +++++++
 5 files changed, 99 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 36f2fe0cc8a5..87f1b569c682 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -665,6 +665,9 @@ config RELOCATABLE_TEST
 config ARCH_HAS_CRASH_DUMP
 	def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
 
+config ARCH_HAS_CRASH_HOTPLUG
+	def_bool y
+
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
 	depends on CRASH_DUMP
diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 8090ad7d97d9..154759bf0759 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -103,6 +103,16 @@ void kexec_copy_flush(struct kimage *image);
 struct crash_mem;
 int update_cpus_node(void *fdt);
 int get_crash_memory_ranges(struct crash_mem **mem_ranges);
+
+#ifdef CONFIG_CRASH_HOTPLUG
+void arch_crash_handle_hotplug_event(struct kimage *image);
+#define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
+
+#ifdef CONFIG_HOTPLUG_CPU
+static inline int crash_hotplug_cpu_support(void) { return 1; }
+#define crash_hotplug_cpu_support crash_hotplug_cpu_support
+#endif
+#endif
 #endif
 
 #if defined(CONFIG_CRASH_DUMP) && defined(CONFIG_PPC_RTAS)
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 0b292f93a74c..cb38da1c6dbe 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -543,6 +543,67 @@ int update_cpus_node(void *fdt)
 	return ret;
 }
 
+#ifdef CONFIG_CRASH_HOTPLUG
+#undef pr_fmt
+#define pr_fmt(fmt) "crash hp: " fmt
+
+/**
+ * arch_crash_handle_hotplug_event - Handle crash CPU/Memory hotplug events to update the
+ *				     necessary kexec segments based on the hotplug event.
+ * @image: the active struct kimage
+ *
+ * Update FDT segment to include newly added CPU. No action for CPU remove case.
+ */
+void arch_crash_handle_hotplug_event(struct kimage *image)
+{
+	void *fdt, *ptr;
+	unsigned long mem;
+	int i, fdt_index = -1;
+	unsigned int hp_action = image->hp_action;
+
+	/*
+	 * Since the hot-unplugged CPU is already part of crash FDT,
+	 * no action is needed for CPU remove case.
+	 */
+	if (hp_action == KEXEC_CRASH_HP_REMOVE_CPU)
+		return;
+
+	/* crash update on memory hotplug events is not supported yet */
+	if (hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY || hp_action == KEXEC_CRASH_HP_ADD_MEMORY) {
+		pr_info_once("Crash update is not supported for memory hotplug\n");
+		return;
+	}
+
+	/* Find the FDT segment index in kexec segment array. */
+	for (i = 0; i < image->nr_segments; i++) {
+		mem = image->segment[i].mem;
+		ptr = __va(mem);
+
+		if (ptr && fdt_magic(ptr) == FDT_MAGIC) {
+			fdt_index = i;
+			break;
+		}
+	}
+
+	if (fdt_index < 0) {
+		pr_err("Unable to locate FDT segment.\n");
+		return;
+	}
+
+	fdt = __va((void *)image->segment[fdt_index].mem);
+
+	/* Temporarily invalidate the crash image while it is replaced */
+	xchg(&kexec_crash_image, NULL);
+
+	/* update FDT to refelect changes in CPU resrouces */
+	if (update_cpus_node(fdt))
+		pr_err("Failed to update crash FDT");
+
+	/* The crash image is now valid once again */
+	xchg(&kexec_crash_image, image);
+}
+#endif
+
 #ifdef CONFIG_PPC_64S_HASH_MMU
 /* Values we need to export to the second kernel via the device tree. */
 static unsigned long htab_base;
diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index eeb258002d1e..4983d67efbf7 100644
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
+	 * possible CPU nodes which are not yet present in the system.
+	 */
+	if (image->type == KEXEC_TYPE_CRASH)
+		do_pack_fdt = false;
+#endif
+	if (do_pack_fdt)
+		fdt_pack(fdt);
 
 	kbuf.buffer = fdt;
 	kbuf.bufsz = kbuf.memsz = fdt_totalsize(fdt);
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 5b0b3f61e0e7..1757e7ba379a 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -908,6 +908,9 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
 	unsigned int cpu_nodes, extra_size = 0;
 	struct device_node *dn;
 	u64 usm_entries;
+#ifdef CONFIG_CRASH_HOTPLUG
+	unsigned int possible_cpu_nodes;
+#endif
 
 	// Budget some space for the password blob. There's already extra space
 	// for the key name
@@ -940,6 +943,17 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
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
2.40.1

