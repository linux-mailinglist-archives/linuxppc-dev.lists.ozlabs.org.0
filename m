Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B367631753
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 00:29:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFmvm6Z69z2xJ6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 10:29:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Oj8AnefC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFmpl5vYPz30Bp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 10:25:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Oj8AnefC;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4NFmpl5V0Nz4x1V
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 10:25:35 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4NFmpl5RKXz4xN3; Mon, 21 Nov 2022 10:25:35 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Oj8AnefC;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4NFmpl2S0Zz4x1V
	for <linuxppc-dev@ozlabs.org>; Mon, 21 Nov 2022 10:25:35 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AKIkpg7011822;
	Sun, 20 Nov 2022 23:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=aAkS39ydzLZNTS5+a5oiZS8jFlZTwHNtovZcvecmMb8=;
 b=Oj8AnefCs6t50MsbKxsYJZsic8cVVKKVEkpf/VV+DERsOsXouBa22oLu8+EZZfz80THn
 kXidPnUuaVZLQZdIXGHgV9CNvjo28K9sumk5oKv0zTMbWZ1c7PHGoaakUXjVrv1JZvk0
 bndCWhXnGs47YyuMitFxHEzl4JFDnBh/9JMAyDdDSoR8463Kqp7b2EjpZn1JVvLTIH5U
 Hka5r6fV2gDQRxtyu4GHwlsbAo+v1H0IuHPP+YeCB61QAstiW3rGiMJCYjlJpn7enAgm
 KjBmBtQxDFiCdZeEBJuSQeskzoTs6CKPCFbsRwxaqk/xdAhSEKbzqbgY/R+MhUbw/XGT Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ky8qt23ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Nov 2022 23:25:26 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AKNPQxj010429;
	Sun, 20 Nov 2022 23:25:26 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ky8qt23e6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Nov 2022 23:25:26 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AKNL21V022145;
	Sun, 20 Nov 2022 23:25:24 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3kxpdhste3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Nov 2022 23:25:24 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AKNQ2qX32178528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Nov 2022 23:26:02 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D6F5AE051;
	Sun, 20 Nov 2022 23:25:22 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C683BAE04D;
	Sun, 20 Nov 2022 23:25:19 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.9.248])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Sun, 20 Nov 2022 23:25:19 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 4/6] powerpc/crash: add crash CPU hotplug support
Date: Mon, 21 Nov 2022 04:55:06 +0530
Message-Id: <20221120232508.327554-5-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221120232508.327554-1-sourabhjain@linux.ibm.com>
References: <20221120232508.327554-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9hCnRUVEbZgw-PN0vbwXWaw3uI5KICzp
X-Proofpoint-GUID: w3bjhh9K6pW84FGOGNQAFj1CcPXiDs4X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-20_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211200194
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
Cc: mahesh@linux.vnet.ibm.com, eric.devolder@oracle.com, kexec@lists.infradead.org, bhe@redhat.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce powerpc crash hotplug handler to update the necessary kexec
segments on CPU/Memory hotplug events. A common crash hotplug handler is
triggered from generic infrastructure for both CPU/Memory hot un/plugged
events but in this patch, only CPU un/plugged events are introduced. The
memory hotplug support is added in upcoming patches.

The elfcorehdr segment is used to exchange the CPU and other dump related
information between the kernels. Ideally, the elfcorehdr segment needs to
be recreated on CPU hotplug events to reflect the changes. But on PowerPC
elfcorehdr is built with all possible CPUs instead of just online CPUs
hence no elfcorehdr segment update/recreation is needed.

In addition to elfcorehdr there is one more kexec segment that holds CPU
data FDT (Flattened Device Tree). To boot the PowerPC kernel the crashing
CPU has to be part of the FDT segment. If the kdump kernel doesn't find
the crashing CPU in the FDT segment, it fails to boot.

The only action needed on PowerPC to handle the crash CPU hotplug event
is to add hot added CPUs in the FDT segment to avoid kdump kernel boot
failure in case the system crashes on hot added CPU.

So for the CPU hot add events, the FDT segment is updated with hot added
CPU and Since there is no need to remove the hot unplugged CPUs from the
FDT segment hence no action taken on CPU hot remove event in PowerPC arch
crash hotplug handler.

To accommodate a growing number of CPUs, FDT is built with additional
buffer space to ensure that it can hold all possible CPUs.

The changes done here will also work for kexec_load system call given
that the kexec tool builds the FDT segment with additional space to
accommodate all possible CPUs as it is done for kexec_file_load system
call in the kernel.

Since memory crash hotplug support is not there yet the crash hotplug
handler simply warns the user and returns.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/include/asm/kexec.h |  4 ++
 arch/powerpc/kexec/core_64.c     | 43 ++++++++++++++++++++
 arch/powerpc/kexec/elf_64.c      | 70 ++++++++++++++++++++++++++++++--
 3 files changed, 114 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index fee742ddaf9a6..a4c0a035cb407 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -108,6 +108,10 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges);
 
 int machine_kexec_post_load(struct kimage *image);
 #define machine_kexec_post_load machine_kexec_post_load
+
+void arch_crash_handle_hotplug_event(struct kimage *image, unsigned int hp_action);
+#define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
+
 #endif
 #endif
 
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 0b8e2f8084afb..3dea1ce6b469c 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -570,6 +570,49 @@ int update_cpus_node(void *fdt)
 	return ret;
 }
 
+#if defined(CONFIG_HOTPLUG_CPU)
+/**
+ * arch_crash_hotplug_handler() - Handle hotplug kexec segements changes FDT, elfcorehdr
+ * @image: the active struct kimage
+ * @hp_action: the hot un/plug action being handled
+ *
+ * To accurately reflect CPU hot un/plug changes, the FDT must be updated with the
+ * new list of CPUs.
+ */
+void arch_crash_handle_hotplug_event(struct kimage *image, unsigned int hp_action)
+{
+	void *fdt;
+
+	/* No action needed for CPU hot-unplug */
+	if (hp_action == KEXEC_CRASH_HP_REMOVE_CPU)
+		return;
+
+	/* crash update on memory hotplug is not support yet */
+	if (hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY || hp_action == KEXEC_CRASH_HP_ADD_MEMORY) {
+		pr_info_once("crash hp: crash update is not supported with memory hotplug\n");
+		return;
+	}
+
+	/* Must have valid FDT index */
+	if (image->arch.fdt_index < 0) {
+		pr_err("crash hp: unable to locate FDT segment");
+		return;
+	}
+
+	fdt = __va((void *)image->segment[image->arch.fdt_index].mem);
+
+	/* Temporarily invalidate the crash image while it is replaced */
+	xchg(&kexec_crash_image, NULL);
+
+	/* update FDT to refelect changes to CPU resrouces */
+	if (update_cpus_node(fdt))
+		pr_err("crash hp: failed to update crash FDT");
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
index 6272d49b49eb4..9af4072dbf220 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -24,6 +24,64 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include <asm/kvm_book3s_asm.h>
+
+#if defined(CONFIG_HOTPLUG_CPU)
+/**
+ * get_cpu_node_sz() - Calculate the space needed to store a CPU device
+ * type node in FDT. The calculation is done based on the existing CPU node
+ * in unflatten device tree. Loop through all the properties of the very
+ * first CPU type device node found in unflatten device tree and returns
+ * the sum of the property length and property string size of all properties
+ * of a CPU node.
+ */
+static int get_cpu_node_sz(void)
+{
+	struct device_node *dn;
+	struct property *pp;
+	int cpu_node_size = 0;
+
+	dn = of_find_node_by_type(NULL, "cpu");
+
+	if (!dn) {
+		pr_warn("Unable to locate cpu device_type node.\n");
+		return 0;
+	}
+
+	/* Every node in FDT starts with FDT_BEGIN_NODE and ends with
+	 * FDT_END_NODE that takes one byte each.
+	 */
+	cpu_node_size = 2;
+
+	for_each_property_of_node(dn, pp) {
+		/**
+		 * For each property add two bytes extra. One for string null
+		 * character for property name and other for FDT property start
+		 * tag FDT_PROP.
+		 */
+		cpu_node_size += pp->length + strlen(pp->name) + 2;
+	}
+	return cpu_node_size;
+}
+
+/*
+ * get_crash_fdt_mem_sz() - calcuate mem size for crash kernel FDT
+ * @fdt: pointer to crash kernel FDT
+ *
+ * Calculate the buffer space needed to accommodate more CPU nodes in
+ * crash FDT post capture kernel load due to CPU hotplug events.
+ */
+static unsigned int get_crash_fdt_mem_sz(void *fdt)
+{
+	int fdt_cpu_nodes_sz, offline_cpu_cnt;
+
+	offline_cpu_cnt = (num_possible_cpus() - num_present_cpus()) / MAX_SMT_THREADS;
+	fdt_cpu_nodes_sz = get_cpu_node_sz() * offline_cpu_cnt;
+
+	return fdt_totalsize(fdt) + fdt_cpu_nodes_sz;
+}
+#endif
+
 static void *elf64_load(struct kimage *image, char *kernel_buf,
 			unsigned long kernel_len, char *initrd,
 			unsigned long initrd_len, char *cmdline,
@@ -119,15 +177,21 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	fdt_pack(fdt);
 
 	kbuf.buffer = fdt;
-	kbuf.bufsz = kbuf.memsz = fdt_totalsize(fdt);
+	kbuf.bufsz = fdt_totalsize(fdt);
 	kbuf.buf_align = PAGE_SIZE;
 	kbuf.top_down = true;
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 
 #if defined(CONFIG_HOTPLUG_CPU) || defined(CONFIG_MEMORY_HOTPLUG)
-	image->arch.fdt_index = image->nr_segments;
+	if (image->type == KEXEC_TYPE_CRASH) {
+		kbuf.memsz = get_crash_fdt_mem_sz(fdt);
+		fdt_set_totalsize(fdt, kbuf.memsz);
+		image->arch.fdt_index = image->nr_segments;
+	} else
 #endif
-	kbuf.memsz = fdt_totalsize(fdt);
+	{
+		kbuf.memsz = fdt_totalsize(fdt);
+	}
 
 	ret = kexec_add_buffer(&kbuf);
 	if (ret)
-- 
2.38.1

