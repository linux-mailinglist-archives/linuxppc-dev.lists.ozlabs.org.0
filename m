Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DCF685FE5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 07:46:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6C9x28Rgz3fJc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 17:46:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FihBAfuN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6C1s3PPxz3cgv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 17:39:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FihBAfuN;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4P6C1s30Bcz4xyp
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 17:39:13 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4P6C1s2xLzz4xyj; Wed,  1 Feb 2023 17:39:13 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FihBAfuN;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4P6C1r71V5z4xyp
	for <linuxppc-dev@ozlabs.org>; Wed,  1 Feb 2023 17:39:12 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3116W1jS011714;
	Wed, 1 Feb 2023 06:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=A/kt6byEktKQ3lC75ieEFgLBZS8YGosF/f9n6S/SaM8=;
 b=FihBAfuNUFoHqehy82ztg1NExbVJBzXXFUGDPd4Euho4CLYXU1unqwU4ZnM/n6lksQkM
 hWOnv0kC+nPKFWDbvGAQL1RzpGgjPN9Xed5oMp6oZO5gM5JMZ5DhhElKOf3QgCwA2sFb
 +Vpl1Iam5u/8MzYIvJpBh0oemlobzFMQWxAOwRM2T6+ZmsFT2NNhIjwYLZ1EwSuldQ03
 BYHloXtNieZ1fSWZAPJcOU5uUkHfe7r6jjrbGQbGXATWmw6mjBGH02aH9GixA35FsXdi
 j82cfrv0hxoDiZrkkezS5R00t7szQ+aP5h30b30kFP4AEuY9GknPUs1D0jazVr1K6HnF dA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfjw7g5tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 06:39:04 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3116YVbU018195;
	Wed, 1 Feb 2023 06:39:03 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfjw7g5ru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 06:39:03 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30VKL9AA012974;
	Wed, 1 Feb 2023 06:39:01 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3ncvt7k5uj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 06:39:00 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3116cvN246792964
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Feb 2023 06:38:57 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB6972005A;
	Wed,  1 Feb 2023 06:38:56 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E5412004F;
	Wed,  1 Feb 2023 06:38:55 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.109.52])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Feb 2023 06:38:54 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v8 6/8] powerpc/crash: add crash CPU hotplug support
Date: Wed,  1 Feb 2023 12:08:39 +0530
Message-Id: <20230201063841.965316-7-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201063841.965316-1-sourabhjain@linux.ibm.com>
References: <20230201063841.965316-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7UoRPnMA88SGO8OtHOtGLVUuVP_7xiHu
X-Proofpoint-GUID: tM8hBS-WZzlvwtzwU6JCRiwMYzi6ERfy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_02,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 phishscore=0 malwarescore=0
 adultscore=0 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302010056
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

Introduce powerpc crash hotplug handler to update the necessary kexec
segments on CPU/Memory hotplug events. A common crash hotplug handler is
triggered from generic infrastructure for both CPU/Memory hot un/plugged
events but in this patch, only CPU hot un/plugged events are introduced.
The memory hotplug support is added in upcoming patches.

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
 arch/powerpc/include/asm/kexec.h  |  5 ++
 arch/powerpc/kexec/core_64.c      | 82 +++++++++++++++++++++++++++++++
 arch/powerpc/kexec/elf_64.c       | 19 ++++++-
 arch/powerpc/kexec/file_load_64.c | 39 ---------------
 4 files changed, 105 insertions(+), 40 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 5a322c1737661..c2b8debc11a61 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -101,11 +101,16 @@ void kexec_copy_flush(struct kimage *image);
 
 #ifdef CONFIG_PPC64
 struct crash_mem;
+unsigned int cpu_node_size(void);
 int update_cpus_node(void *fdt);
 int get_crash_memory_ranges(struct crash_mem **mem_ranges);
 #if defined(CONFIG_CRASH_HOTPLUG)
 int machine_kexec_post_load(struct kimage *image);
 #define machine_kexec_post_load machine_kexec_post_load
+
+void arch_crash_handle_hotplug_event(struct kimage *image, unsigned int hp_action);
+#define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
+
 #endif
 #endif
 
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index a9918084b1eba..5fdc9fe4e7fe0 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -516,6 +516,45 @@ static int add_node_props(void *fdt, int node_offset, const struct device_node *
 	return ret;
 }
 
+/**
+ * cpu_node_size - Compute the size of a CPU node in the FDT.
+ *                 This should be done only once and the value is stored in
+ *                 a static variable.
+ * Returns the max size of a CPU node in the FDT.
+ */
+unsigned int cpu_node_size(void)
+{
+	static unsigned int size;
+	struct device_node *dn;
+	struct property *pp;
+
+	/*
+	 * Don't compute it twice, we are assuming that the per CPU node size
+	 * doesn't change during the system's life.
+	 */
+	if (size)
+		return size;
+
+	dn = of_find_node_by_type(NULL, "cpu");
+	if (WARN_ON_ONCE(!dn)) {
+		// Unlikely to happen
+		return 0;
+	}
+
+	/*
+	 * We compute the sub node size for a CPU node, assuming it
+	 * will be the same for all.
+	 */
+	size += strlen(dn->name) + 5;
+	for_each_property_of_node(dn, pp) {
+		size += strlen(pp->name);
+		size += pp->length;
+	}
+
+	of_node_put(dn);
+	return size;
+}
+
 /**
  * update_cpus_node - Update cpus node of flattened device tree using of_root
  *                    device node.
@@ -576,6 +615,49 @@ int update_cpus_node(void *fdt)
 	return ret;
 }
 
+#if defined(CONFIG_CRASH_HOTPLUG)
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
index eeb258002d1e0..ace48e517427e 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -42,6 +42,9 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	struct kexec_buf pbuf = { .image = image, .buf_min = 0,
 				  .buf_max = ppc64_rma_size, .top_down = true,
 				  .mem = KEXEC_BUF_MEM_UNKNOWN };
+#if defined(CONFIG_CRASH_HOTPLUG)
+	unsigned int offline_core_count;
+#endif
 
 	ret = kexec_build_elf_info(kernel_buf, kernel_len, &ehdr, &elf_info);
 	if (ret)
@@ -119,10 +122,24 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	fdt_pack(fdt);
 
 	kbuf.buffer = fdt;
-	kbuf.bufsz = kbuf.memsz = fdt_totalsize(fdt);
+	kbuf.bufsz = fdt_totalsize(fdt);
 	kbuf.buf_align = PAGE_SIZE;
 	kbuf.top_down = true;
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
+#if defined(CONFIG_CRASH_HOTPLUG)
+	if (image->type == KEXEC_TYPE_CRASH) {
+		/* Calculate the buffer space needed to accommodate more CPU nodes in
+		 * crash FDT post capture kernel load due to CPU hotplug events.
+		 */
+		offline_core_count = (num_possible_cpus() - num_present_cpus()) / threads_per_core;
+		kbuf.memsz = fdt_totalsize(fdt) + offline_core_count * cpu_node_size();
+		fdt_set_totalsize(fdt, kbuf.memsz);
+	} else
+#endif
+	{
+		kbuf.memsz = fdt_totalsize(fdt);
+	}
+
 	ret = kexec_add_buffer(&kbuf);
 	if (ret)
 		goto out_free_fdt;
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 9bc70b4d8eafc..ceac592be72b9 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -854,45 +854,6 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 	return ret;
 }
 
-/**
- * get_cpu_node_size - Compute the size of a CPU node in the FDT.
- *                     This should be done only once and the value is stored in
- *                     a static variable.
- * Returns the max size of a CPU node in the FDT.
- */
-static unsigned int cpu_node_size(void)
-{
-	static unsigned int size;
-	struct device_node *dn;
-	struct property *pp;
-
-	/*
-	 * Don't compute it twice, we are assuming that the per CPU node size
-	 * doesn't change during the system's life.
-	 */
-	if (size)
-		return size;
-
-	dn = of_find_node_by_type(NULL, "cpu");
-	if (WARN_ON_ONCE(!dn)) {
-		// Unlikely to happen
-		return 0;
-	}
-
-	/*
-	 * We compute the sub node size for a CPU node, assuming it
-	 * will be the same for all.
-	 */
-	size += strlen(dn->name) + 5;
-	for_each_property_of_node(dn, pp) {
-		size += strlen(pp->name);
-		size += pp->length;
-	}
-
-	of_node_put(dn);
-	return size;
-}
-
 /**
  * kexec_extra_fdt_size_ppc64 - Return the estimated additional size needed to
  *                              setup FDT for kexec/kdump kernel.
-- 
2.39.1

