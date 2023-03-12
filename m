Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C76166B69F4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Mar 2023 19:15:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZSdl4JvFz3cFn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 05:15:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mM3Z7jyy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PZSYj5vWvz3bT0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 05:12:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mM3Z7jyy;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4PZSYj5m7vz4xDh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 05:12:25 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4PZSYj5hDzz4xFQ; Mon, 13 Mar 2023 05:12:25 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mM3Z7jyy;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4PZSYj3QRyz4xDh
	for <linuxppc-dev@ozlabs.org>; Mon, 13 Mar 2023 05:12:25 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32CI9OK4022447;
	Sun, 12 Mar 2023 18:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=iz3CSa2TfmLoWgYkv8fI6av2R4qo0jU0XhbtLAFiq7k=;
 b=mM3Z7jyyutJ9IvvA19JuxnGNZP/vJau1rjiPn40n17Zm/5UulrlWBGbk+C4sSrGWNids
 T6wB+jTrBVADdsVoByWciQ3Ip451H0DfmZ0TOVKMbmdj38l/N7otSTuERk5TlKHZqMf2
 vmfuPUavuAofJfcUPGoGbeLm5J8+vxc5Pp/7KFsrXK6G/P4jPQ/uhAodTCfMcbY/GhGZ
 jOzfG6NhB4+RY4/OHNSqoTGpsWsJ37L9VAIeo134FUbAX3v8yxjW/qRxdn+aTGpIfG5p
 pMOq8yk+r00f2ri6IU5jsgzCtOezWW/uMmd7Q3I7c1boOxn6uXeG7LuORCMWUOsj1/a0 tw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p93frr8n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Mar 2023 18:12:15 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32CI079A009019;
	Sun, 12 Mar 2023 18:12:15 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p93frr8mm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Mar 2023 18:12:14 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32CAKcdi030084;
	Sun, 12 Mar 2023 18:12:12 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3p8gwfa75v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Mar 2023 18:12:12 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32CIC96k656092
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 12 Mar 2023 18:12:09 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34B2420043;
	Sun, 12 Mar 2023 18:12:09 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 05AF320040;
	Sun, 12 Mar 2023 18:12:07 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.41.125])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 12 Mar 2023 18:12:06 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v9 4/6] powerpc/crash: add crash CPU hotplug support
Date: Sun, 12 Mar 2023 23:41:52 +0530
Message-Id: <20230312181154.278900-5-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230312181154.278900-1-sourabhjain@linux.ibm.com>
References: <20230312181154.278900-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LJrPiVS7dDqpvV4Vvu-qXt_A2XcpqWV_
X-Proofpoint-ORIG-GUID: QWv8at2OVER6vPJbHVQX9dZNUthZawBk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-12_04,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 mlxscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303120157
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

Introduce PowerPC crash hotplug handler to update the necessary kexec
segments in the kernel on CPU/Memory hotplug events. Currently, these
updates are done by monitoring CPU/Memory hotplug events in userspace.

A common crash hotplug handler is triggered from generic infrastructure
for both CPU/Memory hotplug events. But in this patch, crash updates are
handled only for CPU hotplug events. Support for the crash update on
memory hotplug events is added in upcoming patches.

The elfcorehdr segment is used to exchange the CPU and other
dump-related information between the kernels. Ideally, the elfcorehdr
segment needs to be recreated on CPU hotplug events to reflect the
changes. But on PowerPC, the elfcorehdr is built for possible CPUs hence
there is no need to update/recreate the elfcorehdr on CPU hotplug
events.

In addition to elfcorehdr, there is another kexec segment that holds CPU
data on PowerPC FDT (Flattened Device Tree). During the kdump kernel
boot, it is expected that the crashing CPU must be present in FDT, else
kdump kernel boot fails.

Now the only action needed on PowerPC to handle the crash CPU hotplug
events are to add hot added CPUs in the FDT segment to avoid the kdump
kernel boot failure in case the system crashes on hot added CPU. So for
the CPU hot add events, the FDT segment is updated with hot added CPU
and Since there is no need to remove the hot unplugged CPUs from the FDT
segment hence no action was taken on the CPU hot remove event in the
PowerPC arch crash hotplug handler.

To accommodate a growing number of CPUs, FDT is built with additional
buffer space to ensure that it can hold possible CPU nodes.

The changes done here will also work for the kexec_load system call
given that the kexec tool builds the FDT segment with additional space
to accommodate possible CPU nodes.

Since memory crash hotplug support is not there yet the crash hotplug
the handler simply warns the user and returns.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/include/asm/kexec.h  |  4 +++
 arch/powerpc/kexec/core_64.c      | 52 +++++++++++++++++++++++++++++++
 arch/powerpc/kexec/elf_64.c       | 13 +++++++-
 arch/powerpc/kexec/file_load_64.c | 14 +++++++++
 4 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 348eb96e8ca67..826671bd8ff97 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -105,6 +105,10 @@ int update_cpus_node(void *fdt);
 int get_crash_memory_ranges(struct crash_mem **mem_ranges);
 int machine_kexec_post_load(struct kimage *image);
 #define machine_kexec_post_load machine_kexec_post_load
+#if defined(CONFIG_CRASH_HOTPLUG)
+void arch_crash_handle_hotplug_event(struct kimage *image);
+#define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
+#endif
 #endif
 
 #if defined(CONFIG_CRASH_DUMP) && defined(CONFIG_PPC_RTAS)
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 531486c973988..35de0aa0fe375 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -574,6 +574,58 @@ int update_cpus_node(void *fdt)
 	return ret;
 }
 
+#if defined(CONFIG_CRASH_HOTPLUG)
+#undef pr_fmt
+#define pr_fmt(fmt) "crash hp: " fmt
+
+/**
+ * arch_crash_hotplug_handler() - Handle crash CPU/Memory hotplug events to update the
+ *                                necessary kexec segments based on the hotplug event.
+ * @image: the active struct kimage
+ */
+void arch_crash_handle_hotplug_event(struct kimage *image)
+{
+	void *fdt;
+	int fdt_index;
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
+	fdt_index = image->arch.fdt_index;
+	/* Must have valid FDT index, it is been discovered during
+	 * kdump kernel load for both kexec_load and kexec_file_load
+	 * system call.
+	 */
+	if (fdt_index < 0) {
+		pr_err("Invalid FDT index");
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
index eeb258002d1e0..486087e0c2ef8 100644
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
@@ -116,13 +117,23 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	if (ret)
 		goto out_free_fdt;
 
-	fdt_pack(fdt);
+#if defined(CONFIG_CRASH_HOTPLUG)
+	/*
+	 * Do not pack FDT, additional space is reserved to accommodate
+	 * possible CPU nodes which not yet present in the system.
+	 */
+	if (image->type == KEXEC_TYPE_CRASH)
+		do_pack_fdt = false;
+#endif
+	if (do_pack_fdt)
+		fdt_pack(fdt);
 
 	kbuf.buffer = fdt;
 	kbuf.bufsz = kbuf.memsz = fdt_totalsize(fdt);
 	kbuf.buf_align = PAGE_SIZE;
 	kbuf.top_down = true;
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
+
 	ret = kexec_add_buffer(&kbuf);
 	if (ret)
 		goto out_free_fdt;
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 5b0b3f61e0e72..3554168687869 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -908,6 +908,9 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
 	unsigned int cpu_nodes, extra_size = 0;
 	struct device_node *dn;
 	u64 usm_entries;
+#if defined(CONFIG_CRASH_HOTPLUG)
+	unsigned int possible_cpu_nodes;
+#endif
 
 	// Budget some space for the password blob. There's already extra space
 	// for the key name
@@ -940,6 +943,17 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
 	if (cpu_nodes > boot_cpu_node_count)
 		extra_size += (cpu_nodes - boot_cpu_node_count) * cpu_node_size();
 
+#if defined(CONFIG_CRASH_HOTPLUG)
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
2.39.1

