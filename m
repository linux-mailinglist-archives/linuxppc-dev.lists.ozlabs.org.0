Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0296422E262
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 21:53:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFDCP0Z9NzDr6S
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 05:53:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFCv03KDczDrPS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 05:39:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BFCv02Yh5z8tRl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 05:39:40 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BFCv01gvfz9sRN; Mon, 27 Jul 2020 05:39:40 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BFCtz4x9Fz9sRR
 for <linuxppc-dev@ozlabs.org>; Mon, 27 Jul 2020 05:39:39 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06QJVlFc028843; Sun, 26 Jul 2020 15:39:34 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32ggw3y08q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 15:39:34 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06QJWGDN029649;
 Sun, 26 Jul 2020 15:39:33 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32ggw3y085-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 15:39:33 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06QJaJ5k000762;
 Sun, 26 Jul 2020 19:39:31 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 32gcqghf2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 19:39:31 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06QJdSHx61211116
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 26 Jul 2020 19:39:28 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 949AD5204F;
 Sun, 26 Jul 2020 19:39:28 +0000 (GMT)
Received: from [192.168.0.8] (unknown [9.85.82.224])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 50A1E5204E;
 Sun, 26 Jul 2020 19:39:25 +0000 (GMT)
Subject: [RESEND PATCH v5 08/11] ppc64/kexec_file: setup backup region for
 kdump kernel
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 27 Jul 2020 01:09:24 +0530
Message-ID: <159579235754.5790.5203600072984600891.stgit@hbathini>
In-Reply-To: <159579157320.5790.6748078824637688685.stgit@hbathini>
References: <159579157320.5790.6748078824637688685.stgit@hbathini>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-26_09:2020-07-24,
 2020-07-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007260150
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
Cc: Pingfan Liu <piliu@redhat.com>, Kexec-ml <kexec@lists.infradead.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Eric Biederman <ebiederm@xmission.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Though kdump kernel boots from loaded address, the first 64KB of it is
copied down to real 0. So, setup a backup region and let purgatory
copy the first 64KB of crashed kernel into this backup region before
booting into kdump kernel. Update reserve map with backup region and
crashed kernel's memory to avoid kdump kernel from accidentially using
that memory.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

v4 -> v5:
* Did not add Reviewed-by tag from Thiago yet as he might want to reconsider
  it with the changes in this patch.
* Wrote backup region copy code in assembler. Also, dropped the patch that
  applies RELA relocations & the patch that sets up stack as they are no
  longer needed.
* For correctness, updated fdt_add_mem_rsv() to take "BACKUP_SRC_END + 1"
  as start address instead of BACKUP_SRC_SIZE.

v3 -> v4:
* Moved fdt_add_mem_rsv() for backup region under kdump flag, on Thiago's
  suggestion, as it is only relevant for kdump.

v2 -> v3:
* Dropped check for backup_start in trampoline_64.S as purgatory() takes
  care of it anyway.

v1 -> v2:
* Check if backup region is available before branching out. This is
  to keep `kexec -l -s` flow as before as much as possible. This would
  eventually change with more testing and addition of sha256 digest
  verification support.
* Fixed missing prototype for purgatory() as reported by lkp.
  lkp report for reference:
    - https://lore.kernel.org/patchwork/patch/1264423/


 arch/powerpc/include/asm/crashdump-ppc64.h |   19 ++++++
 arch/powerpc/include/asm/kexec.h           |    7 ++
 arch/powerpc/kexec/elf_64.c                |    9 +++
 arch/powerpc/kexec/file_load_64.c          |   95 +++++++++++++++++++++++++++-
 arch/powerpc/purgatory/trampoline_64.S     |   38 ++++++++++-
 5 files changed, 161 insertions(+), 7 deletions(-)
 create mode 100644 arch/powerpc/include/asm/crashdump-ppc64.h

diff --git a/arch/powerpc/include/asm/crashdump-ppc64.h b/arch/powerpc/include/asm/crashdump-ppc64.h
new file mode 100644
index 000000000000..68d9717cc5ee
--- /dev/null
+++ b/arch/powerpc/include/asm/crashdump-ppc64.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_POWERPC_CRASHDUMP_PPC64_H
+#define _ASM_POWERPC_CRASHDUMP_PPC64_H
+
+/*
+ * Backup region - first 64KB of System RAM
+ *
+ * If ever the below macros are to be changed, please be judicious.
+ * The implicit assumptions are:
+ *     - start, end & size are less than UINT32_MAX.
+ *     - start & size are at least 8 byte aligned.
+ *
+ * For implementation details: arch/powerpc/purgatory/trampoline_64.S
+ */
+#define BACKUP_SRC_START	0
+#define BACKUP_SRC_END		0xffff
+#define BACKUP_SRC_SIZE		(BACKUP_SRC_END - BACKUP_SRC_START + 1)
+
+#endif /* __ASM_POWERPC_CRASHDUMP_PPC64_H */
diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 835dc92e091c..f9514ebeffaa 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -105,6 +105,9 @@ extern const struct kexec_file_ops kexec_elf64_ops;
 struct kimage_arch {
 	struct crash_mem *exclude_ranges;
 
+	unsigned long backup_start;
+	void *backup_buf;
+
 #ifdef CONFIG_IMA_KEXEC
 	phys_addr_t ima_buffer_addr;
 	size_t ima_buffer_size;
@@ -120,6 +123,10 @@ int setup_new_fdt(const struct kimage *image, void *fdt,
 int delete_fdt_mem_rsv(void *fdt, unsigned long start, unsigned long size);
 
 #ifdef CONFIG_PPC64
+struct kexec_buf;
+
+int load_crashdump_segments_ppc64(struct kimage *image,
+				  struct kexec_buf *kbuf);
 int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 			  const void *fdt, unsigned long kernel_load_addr,
 			  unsigned long fdt_load_addr);
diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index 64c15a5a280b..76e2fc7e6dc3 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -68,6 +68,15 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 
 	pr_debug("Loaded purgatory at 0x%lx\n", pbuf.mem);
 
+	/* Load additional segments needed for panic kernel */
+	if (image->type == KEXEC_TYPE_CRASH) {
+		ret = load_crashdump_segments_ppc64(image, &kbuf);
+		if (ret) {
+			pr_err("Failed to load kdump kernel segments\n");
+			goto out;
+		}
+	}
+
 	if (initrd != NULL) {
 		kbuf.buffer = initrd;
 		kbuf.bufsz = kbuf.memsz = initrd_len;
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index a5c1442590b2..88408b17a7f6 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -20,8 +20,10 @@
 #include <linux/of_device.h>
 #include <linux/memblock.h>
 #include <linux/slab.h>
+#include <linux/vmalloc.h>
 #include <asm/drmem.h>
 #include <asm/kexec_ranges.h>
+#include <asm/crashdump-ppc64.h>
 
 struct umem_info {
 	uint64_t *buf; /* data buffer for usable-memory property */
@@ -697,6 +699,69 @@ static int update_usable_mem_fdt(void *fdt, struct crash_mem *usable_mem)
 	return ret;
 }
 
+/**
+ * load_backup_segment - Locate a memory hole to place the backup region.
+ * @image:               Kexec image.
+ * @kbuf:                Buffer contents and memory parameters.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int load_backup_segment(struct kimage *image, struct kexec_buf *kbuf)
+{
+	void *buf;
+	int ret;
+
+	/* Setup a segment for backup region */
+	buf = vzalloc(BACKUP_SRC_SIZE);
+	if (!buf)
+		return -ENOMEM;
+
+	/*
+	 * A source buffer has no meaning for backup region as data will
+	 * be copied from backup source, after crash, in the purgatory.
+	 * But as load segment code doesn't recognize such segments,
+	 * setup a dummy source buffer to keep it happy for now.
+	 */
+	kbuf->buffer = buf;
+	kbuf->mem = KEXEC_BUF_MEM_UNKNOWN;
+	kbuf->bufsz = kbuf->memsz = BACKUP_SRC_SIZE;
+	kbuf->top_down = false;
+
+	ret = kexec_add_buffer(kbuf);
+	if (ret) {
+		vfree(buf);
+		return ret;
+	}
+
+	image->arch.backup_buf = buf;
+	image->arch.backup_start = kbuf->mem;
+	return 0;
+}
+
+/**
+ * load_crashdump_segments_ppc64 - Initialize the additional segements needed
+ *                                 to load kdump kernel.
+ * @image:                         Kexec image.
+ * @kbuf:                          Buffer contents and memory parameters.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int load_crashdump_segments_ppc64(struct kimage *image,
+				  struct kexec_buf *kbuf)
+{
+	int ret;
+
+	/* Load backup segment - first 64K bytes of the crashing kernel */
+	ret = load_backup_segment(image, kbuf);
+	if (ret) {
+		pr_err("Failed to load backup segment\n");
+		return ret;
+	}
+	pr_debug("Loaded the backup region at 0x%lx\n", kbuf->mem);
+
+	return 0;
+}
+
 /**
  * setup_purgatory_ppc64 - initialize PPC64 specific purgatory's global
  *                         variables and call setup_purgatory() to initialize
@@ -737,6 +802,14 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 			goto out;
 	}
 
+	/* Tell purgatory where to look for backup region */
+	ret = kexec_purgatory_get_set_symbol(image, "backup_start",
+					     &image->arch.backup_start,
+					     sizeof(image->arch.backup_start),
+					     false);
+	if (ret)
+		goto out;
+
 	/* Setup OPAL base & entry values */
 	dn = of_find_node_by_path("/ibm,opal");
 	if (dn) {
@@ -782,7 +855,7 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 
 	/*
 	 * Restrict memory usage for kdump kernel by setting up
-	 * usable memory ranges.
+	 * usable memory ranges and memory reserve map.
 	 */
 	if (image->type == KEXEC_TYPE_CRASH) {
 		ret = get_usable_memory_ranges(&umem);
@@ -795,13 +868,26 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 			goto out;
 		}
 
-		/* Ensure we don't touch crashed kernel's memory */
-		ret = fdt_add_mem_rsv(fdt, 0, crashk_res.start);
+		/*
+		 * Ensure we don't touch crashed kernel's memory except the
+		 * first 64K of RAM, which will be backed up.
+		 */
+		ret = fdt_add_mem_rsv(fdt, BACKUP_SRC_END + 1,
+				      crashk_res.start - BACKUP_SRC_SIZE);
 		if (ret) {
 			pr_err("Error reserving crash memory: %s\n",
 			       fdt_strerror(ret));
 			goto out;
 		}
+
+		/* Ensure backup region is not used by kdump/capture kernel */
+		ret = fdt_add_mem_rsv(fdt, image->arch.backup_start,
+				      BACKUP_SRC_SIZE);
+		if (ret) {
+			pr_err("Error reserving memory for backup: %s\n",
+			       fdt_strerror(ret));
+			goto out;
+		}
 	}
 
 out:
@@ -908,5 +994,8 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 	kfree(image->arch.exclude_ranges);
 	image->arch.exclude_ranges = NULL;
 
+	vfree(image->arch.backup_buf);
+	image->arch.backup_buf = NULL;
+
 	return kexec_image_post_load_cleanup_default(image);
 }
diff --git a/arch/powerpc/purgatory/trampoline_64.S b/arch/powerpc/purgatory/trampoline_64.S
index 464af8e8a4cb..d4b52961f592 100644
--- a/arch/powerpc/purgatory/trampoline_64.S
+++ b/arch/powerpc/purgatory/trampoline_64.S
@@ -10,6 +10,7 @@
  */
 
 #include <asm/asm-compat.h>
+#include <asm/crashdump-ppc64.h>
 
 	.machine ppc64
 	.balign 256
@@ -43,14 +44,38 @@ master:
 	mr	%r17,%r3	/* save cpu id to r17 */
 	mr	%r15,%r4	/* save physical address in reg15 */
 
+	bl	0f		/* Work out where we're running */
+0:	mflr	%r18
+
+	/*
+	 * Copy BACKUP_SRC_SIZE bytes from BACKUP_SRC_START to
+	 * backup_start 8 bytes at a time.
+	 *
+	 * Use r3 = dest, r4 = src, r5 = size, r6 = count
+	 */
+	ld	%r3,(backup_start - 0b)(%r18)
+	cmpdi	%cr0,%r3,0
+	beq	80f		/* skip if there is no backup region */
+	lis	%r5,BACKUP_SRC_SIZE@h
+	ori	%r5,%r5,BACKUP_SRC_SIZE@l
+	cmpdi	%cr0,%r5,0
+	beq	80f		/* skip if copy size is zero */
+	lis	%r4,BACKUP_SRC_START@h
+	ori	%r4,%r4,BACKUP_SRC_START@l
+	li	%r6,0
+70:
+	ldx	%r0,%r6,%r4
+	stdx	%r0,%r6,%r3
+	addi	%r6,%r6,8
+	cmpld	%cr0,%r6,%r5
+	blt	70b
+
+80:
 	or	%r3,%r3,%r3	/* ok now to high priority, lets boot */
 	lis	%r6,0x1
 	mtctr	%r6		/* delay a bit for slaves to catch up */
 	bdnz	.		/* before we overwrite 0-100 again */
 
-	bl	0f		/* Work out where we're running */
-0:	mflr	%r18
-
 	/* load device-tree address */
 	ld	%r3, (dt_offset - 0b)(%r18)
 	mr	%r16,%r3	/* save dt address in reg16 */
@@ -93,7 +118,6 @@ master:
 
 	rfid			/* update MSR and start kernel */
 
-
 	.balign 8
 	.globl kernel
 kernel:
@@ -106,6 +130,12 @@ dt_offset:
 	.8byte  0x0
 	.size dt_offset, . - dt_offset
 
+	.balign 8
+	.globl backup_start
+backup_start:
+	.8byte  0x0
+	.size backup_start, . - backup_start
+
 	.balign 8
 	.globl opal_base
 opal_base:


