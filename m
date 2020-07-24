Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3539A22D02F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 23:06:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BD1wF360HzDqMr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 07:06:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BD1nv0tf1zF1SF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 07:01:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BD1nt5By7z8tTY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 07:01:06 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BD1nt3CwCz9sRX; Sat, 25 Jul 2020 07:01:06 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 4BD1ns6vBgz9sRW
 for <linuxppc-dev@ozlabs.org>; Sat, 25 Jul 2020 07:01:05 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06OKZxiD153830; Fri, 24 Jul 2020 17:01:00 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32fac4frad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 17:00:59 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06OKaDu2154902;
 Fri, 24 Jul 2020 17:00:59 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32fac4fr95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 17:00:58 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06OL0ufb017066;
 Fri, 24 Jul 2020 21:00:56 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 32brq848p3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 21:00:56 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06OKxSH264749940
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jul 2020 20:59:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36D1911C064;
 Fri, 24 Jul 2020 21:00:53 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 696D511C054;
 Fri, 24 Jul 2020 21:00:49 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.85.71.136])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 24 Jul 2020 21:00:49 +0000 (GMT)
Subject: [PATCH v5 02/11] powerpc/kexec_file: mark PPC64 specific code
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Sat, 25 Jul 2020 02:30:48 +0530
Message-ID: <159562444028.7836.12305989499492668243.stgit@hbathini.in.ibm.com>
In-Reply-To: <159562433305.7836.11742488792509689660.stgit@hbathini.in.ibm.com>
References: <159562433305.7836.11742488792509689660.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_09:2020-07-24,
 2020-07-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007240142
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
 Nayna Jain <nayna@linux.ibm.com>, Petr Tesarik <ptesarik@suse.cz>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Vivek Goyal <vgoyal@redhat.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, Dave Young <dyoung@redhat.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some of the kexec_file_load code isn't PPC64 specific. Move PPC64
specific code from kexec/file_load.c to kexec/file_load_64.c. Also,
rename purgatory/trampoline.S to purgatory/trampoline_64.S in the
same spirit. No functional changes.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Tested-by: Pingfan Liu <piliu@redhat.com>
Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>
Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---

v4 -> v5:
* Unchanged.

v3 -> v4:
* Moved common code back to set_new_fdt() from setup_new_fdt_ppc64()
  function. Added Reviewed-by tags from Laurent & Thiago.

v2 -> v3:
* Unchanged. Added Tested-by tag from Pingfan.

v1 -> v2:
* No changes.


 arch/powerpc/include/asm/kexec.h       |    9 ++
 arch/powerpc/kexec/Makefile            |    2 -
 arch/powerpc/kexec/elf_64.c            |    7 +-
 arch/powerpc/kexec/file_load.c         |   19 +----
 arch/powerpc/kexec/file_load_64.c      |   87 ++++++++++++++++++++++++
 arch/powerpc/purgatory/Makefile        |    4 +
 arch/powerpc/purgatory/trampoline.S    |  117 --------------------------------
 arch/powerpc/purgatory/trampoline_64.S |  117 ++++++++++++++++++++++++++++++++
 8 files changed, 222 insertions(+), 140 deletions(-)
 create mode 100644 arch/powerpc/kexec/file_load_64.c
 delete mode 100644 arch/powerpc/purgatory/trampoline.S
 create mode 100644 arch/powerpc/purgatory/trampoline_64.S

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index c684768..ac8fd48 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -116,6 +116,15 @@ int setup_new_fdt(const struct kimage *image, void *fdt,
 		  unsigned long initrd_load_addr, unsigned long initrd_len,
 		  const char *cmdline);
 int delete_fdt_mem_rsv(void *fdt, unsigned long start, unsigned long size);
+
+#ifdef CONFIG_PPC64
+int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
+			  const void *fdt, unsigned long kernel_load_addr,
+			  unsigned long fdt_load_addr);
+int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
+			unsigned long initrd_load_addr,
+			unsigned long initrd_len, const char *cmdline);
+#endif /* CONFIG_PPC64 */
 #endif /* CONFIG_KEXEC_FILE */
 
 #else /* !CONFIG_KEXEC_CORE */
diff --git a/arch/powerpc/kexec/Makefile b/arch/powerpc/kexec/Makefile
index 86380c6..67c3553 100644
--- a/arch/powerpc/kexec/Makefile
+++ b/arch/powerpc/kexec/Makefile
@@ -7,7 +7,7 @@ obj-y				+= core.o crash.o core_$(BITS).o
 
 obj-$(CONFIG_PPC32)		+= relocate_32.o
 
-obj-$(CONFIG_KEXEC_FILE)	+= file_load.o elf_$(BITS).o
+obj-$(CONFIG_KEXEC_FILE)	+= file_load.o file_load_$(BITS).o elf_$(BITS).o
 
 ifdef CONFIG_HAVE_IMA_KEXEC
 ifdef CONFIG_IMA
diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index 3072fd6..23ad04c 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -88,7 +88,8 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 		goto out;
 	}
 
-	ret = setup_new_fdt(image, fdt, initrd_load_addr, initrd_len, cmdline);
+	ret = setup_new_fdt_ppc64(image, fdt, initrd_load_addr,
+				  initrd_len, cmdline);
 	if (ret)
 		goto out;
 
@@ -107,8 +108,8 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	pr_debug("Loaded device tree at 0x%lx\n", fdt_load_addr);
 
 	slave_code = elf_info.buffer + elf_info.proghdrs[0].p_offset;
-	ret = setup_purgatory(image, slave_code, fdt, kernel_load_addr,
-			      fdt_load_addr);
+	ret = setup_purgatory_ppc64(image, slave_code, fdt, kernel_load_addr,
+				    fdt_load_addr);
 	if (ret)
 		pr_err("Error setting up the purgatory.\n");
 
diff --git a/arch/powerpc/kexec/file_load.c b/arch/powerpc/kexec/file_load.c
index 143c917..38439ab 100644
--- a/arch/powerpc/kexec/file_load.c
+++ b/arch/powerpc/kexec/file_load.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * ppc64 code to implement the kexec_file_load syscall
+ * powerpc code to implement the kexec_file_load syscall
  *
  * Copyright (C) 2004  Adam Litke (agl@us.ibm.com)
  * Copyright (C) 2004  IBM Corp.
@@ -20,22 +20,7 @@
 #include <linux/libfdt.h>
 #include <asm/ima.h>
 
-#define SLAVE_CODE_SIZE		256
-
-const struct kexec_file_ops * const kexec_file_loaders[] = {
-	&kexec_elf64_ops,
-	NULL
-};
-
-int arch_kexec_kernel_image_probe(struct kimage *image, void *buf,
-				  unsigned long buf_len)
-{
-	/* We don't support crash kernels yet. */
-	if (image->type == KEXEC_TYPE_CRASH)
-		return -EOPNOTSUPP;
-
-	return kexec_image_probe_default(image, buf, buf_len);
-}
+#define SLAVE_CODE_SIZE		256	/* First 0x100 bytes */
 
 /**
  * setup_purgatory - initialize the purgatory's global variables
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
new file mode 100644
index 0000000..41fe8b6
--- /dev/null
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ppc64 code to implement the kexec_file_load syscall
+ *
+ * Copyright (C) 2004  Adam Litke (agl@us.ibm.com)
+ * Copyright (C) 2004  IBM Corp.
+ * Copyright (C) 2004,2005  Milton D Miller II, IBM Corporation
+ * Copyright (C) 2005  R Sharada (sharada@in.ibm.com)
+ * Copyright (C) 2006  Mohan Kumar M (mohan@in.ibm.com)
+ * Copyright (C) 2020  IBM Corporation
+ *
+ * Based on kexec-tools' kexec-ppc64.c, kexec-elf-rel-ppc64.c, fs2dt.c.
+ * Heavily modified for the kernel by
+ * Hari Bathini <hbathini@linux.ibm.com>.
+ */
+
+#include <linux/kexec.h>
+#include <linux/of_fdt.h>
+#include <linux/libfdt.h>
+
+const struct kexec_file_ops * const kexec_file_loaders[] = {
+	&kexec_elf64_ops,
+	NULL
+};
+
+/**
+ * setup_purgatory_ppc64 - initialize PPC64 specific purgatory's global
+ *                         variables and call setup_purgatory() to initialize
+ *                         common global variable.
+ * @image:                 kexec image.
+ * @slave_code:            Slave code for the purgatory.
+ * @fdt:                   Flattened device tree for the next kernel.
+ * @kernel_load_addr:      Address where the kernel is loaded.
+ * @fdt_load_addr:         Address where the flattened device tree is loaded.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
+			  const void *fdt, unsigned long kernel_load_addr,
+			  unsigned long fdt_load_addr)
+{
+	int ret;
+
+	ret = setup_purgatory(image, slave_code, fdt, kernel_load_addr,
+			      fdt_load_addr);
+	if (ret)
+		pr_err("Failed to setup purgatory symbols");
+	return ret;
+}
+
+/**
+ * setup_new_fdt_ppc64 - Update the flattend device-tree of the kernel
+ *                       being loaded.
+ * @image:               kexec image being loaded.
+ * @fdt:                 Flattened device tree for the next kernel.
+ * @initrd_load_addr:    Address where the next initrd will be loaded.
+ * @initrd_len:          Size of the next initrd, or 0 if there will be none.
+ * @cmdline:             Command line for the next kernel, or NULL if there will
+ *                       be none.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
+			unsigned long initrd_load_addr,
+			unsigned long initrd_len, const char *cmdline)
+{
+	return setup_new_fdt(image, fdt, initrd_load_addr, initrd_len, cmdline);
+}
+
+/**
+ * arch_kexec_kernel_image_probe - Does additional handling needed to setup
+ *                                 kexec segments.
+ * @image:                         kexec image being loaded.
+ * @buf:                           Buffer pointing to elf data.
+ * @buf_len:                       Length of the buffer.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int arch_kexec_kernel_image_probe(struct kimage *image, void *buf,
+				  unsigned long buf_len)
+{
+	/* We don't support crash kernels yet. */
+	if (image->type == KEXEC_TYPE_CRASH)
+		return -EOPNOTSUPP;
+
+	return kexec_image_probe_default(image, buf, buf_len);
+}
diff --git a/arch/powerpc/purgatory/Makefile b/arch/powerpc/purgatory/Makefile
index 7c6d8b1..348f5958 100644
--- a/arch/powerpc/purgatory/Makefile
+++ b/arch/powerpc/purgatory/Makefile
@@ -2,11 +2,11 @@
 
 KASAN_SANITIZE := n
 
-targets += trampoline.o purgatory.ro kexec-purgatory.c
+targets += trampoline_$(BITS).o purgatory.ro kexec-purgatory.c
 
 LDFLAGS_purgatory.ro := -e purgatory_start -r --no-undefined
 
-$(obj)/purgatory.ro: $(obj)/trampoline.o FORCE
+$(obj)/purgatory.ro: $(obj)/trampoline_$(BITS).o FORCE
 		$(call if_changed,ld)
 
 quiet_cmd_bin2c = BIN2C   $@
diff --git a/arch/powerpc/purgatory/trampoline.S b/arch/powerpc/purgatory/trampoline.S
deleted file mode 100644
index a5a83c3..0000000
--- a/arch/powerpc/purgatory/trampoline.S
+++ /dev/null
@@ -1,117 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * kexec trampoline
- *
- * Based on code taken from kexec-tools and kexec-lite.
- *
- * Copyright (C) 2004 - 2005, Milton D Miller II, IBM Corporation
- * Copyright (C) 2006, Mohan Kumar M, IBM Corporation
- * Copyright (C) 2013, Anton Blanchard, IBM Corporation
- */
-
-#include <asm/asm-compat.h>
-
-	.machine ppc64
-	.balign 256
-	.globl purgatory_start
-purgatory_start:
-	b	master
-
-	/* ABI: possible run_at_load flag at 0x5c */
-	.org purgatory_start + 0x5c
-	.globl run_at_load
-run_at_load:
-	.long 0
-	.size run_at_load, . - run_at_load
-
-	/* ABI: slaves start at 60 with r3=phys */
-	.org purgatory_start + 0x60
-slave:
-	b .
-	/* ABI: end of copied region */
-	.org purgatory_start + 0x100
-	.size purgatory_start, . - purgatory_start
-
-/*
- * The above 0x100 bytes at purgatory_start are replaced with the
- * code from the kernel (or next stage) by setup_purgatory().
- */
-
-master:
-	or	%r1,%r1,%r1	/* low priority to let other threads catchup */
-	isync
-	mr	%r17,%r3	/* save cpu id to r17 */
-	mr	%r15,%r4	/* save physical address in reg15 */
-
-	or	%r3,%r3,%r3	/* ok now to high priority, lets boot */
-	lis	%r6,0x1
-	mtctr	%r6		/* delay a bit for slaves to catch up */
-	bdnz	.		/* before we overwrite 0-100 again */
-
-	bl	0f		/* Work out where we're running */
-0:	mflr	%r18
-
-	/* load device-tree address */
-	ld	%r3, (dt_offset - 0b)(%r18)
-	mr	%r16,%r3	/* save dt address in reg16 */
-	li	%r4,20
-	LWZX_BE	%r6,%r3,%r4	/* fetch __be32 version number at byte 20 */
-	cmpwi	%cr0,%r6,2	/* v2 or later? */
-	blt	1f
-	li	%r4,28
-	STWX_BE	%r17,%r3,%r4	/* Store my cpu as __be32 at byte 28 */
-1:
-	/* load the kernel address */
-	ld	%r4,(kernel - 0b)(%r18)
-
-	/* load the run_at_load flag */
-	/* possibly patched by kexec */
-	ld	%r6,(run_at_load - 0b)(%r18)
-	/* and patch it into the kernel */
-	stw	%r6,(0x5c)(%r4)
-
-	mr	%r3,%r16	/* restore dt address */
-
-	li	%r5,0		/* r5 will be 0 for kernel */
-
-	mfmsr	%r11
-	andi.	%r10,%r11,1	/* test MSR_LE */
-	bne	.Little_endian
-
-	mtctr	%r4		/* prepare branch to */
-	bctr			/* start kernel */
-
-.Little_endian:
-	mtsrr0	%r4		/* prepare branch to */
-
-	clrrdi	%r11,%r11,1	/* clear MSR_LE */
-	mtsrr1	%r11
-
-	rfid			/* update MSR and start kernel */
-
-
-	.balign 8
-	.globl kernel
-kernel:
-	.8byte  0x0
-	.size kernel, . - kernel
-
-	.balign 8
-	.globl dt_offset
-dt_offset:
-	.8byte  0x0
-	.size dt_offset, . - dt_offset
-
-
-	.data
-	.balign 8
-.globl purgatory_sha256_digest
-purgatory_sha256_digest:
-	.skip	32
-	.size purgatory_sha256_digest, . - purgatory_sha256_digest
-
-	.balign 8
-.globl purgatory_sha_regions
-purgatory_sha_regions:
-	.skip	8 * 2 * 16
-	.size purgatory_sha_regions, . - purgatory_sha_regions
diff --git a/arch/powerpc/purgatory/trampoline_64.S b/arch/powerpc/purgatory/trampoline_64.S
new file mode 100644
index 0000000..a5a83c3
--- /dev/null
+++ b/arch/powerpc/purgatory/trampoline_64.S
@@ -0,0 +1,117 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * kexec trampoline
+ *
+ * Based on code taken from kexec-tools and kexec-lite.
+ *
+ * Copyright (C) 2004 - 2005, Milton D Miller II, IBM Corporation
+ * Copyright (C) 2006, Mohan Kumar M, IBM Corporation
+ * Copyright (C) 2013, Anton Blanchard, IBM Corporation
+ */
+
+#include <asm/asm-compat.h>
+
+	.machine ppc64
+	.balign 256
+	.globl purgatory_start
+purgatory_start:
+	b	master
+
+	/* ABI: possible run_at_load flag at 0x5c */
+	.org purgatory_start + 0x5c
+	.globl run_at_load
+run_at_load:
+	.long 0
+	.size run_at_load, . - run_at_load
+
+	/* ABI: slaves start at 60 with r3=phys */
+	.org purgatory_start + 0x60
+slave:
+	b .
+	/* ABI: end of copied region */
+	.org purgatory_start + 0x100
+	.size purgatory_start, . - purgatory_start
+
+/*
+ * The above 0x100 bytes at purgatory_start are replaced with the
+ * code from the kernel (or next stage) by setup_purgatory().
+ */
+
+master:
+	or	%r1,%r1,%r1	/* low priority to let other threads catchup */
+	isync
+	mr	%r17,%r3	/* save cpu id to r17 */
+	mr	%r15,%r4	/* save physical address in reg15 */
+
+	or	%r3,%r3,%r3	/* ok now to high priority, lets boot */
+	lis	%r6,0x1
+	mtctr	%r6		/* delay a bit for slaves to catch up */
+	bdnz	.		/* before we overwrite 0-100 again */
+
+	bl	0f		/* Work out where we're running */
+0:	mflr	%r18
+
+	/* load device-tree address */
+	ld	%r3, (dt_offset - 0b)(%r18)
+	mr	%r16,%r3	/* save dt address in reg16 */
+	li	%r4,20
+	LWZX_BE	%r6,%r3,%r4	/* fetch __be32 version number at byte 20 */
+	cmpwi	%cr0,%r6,2	/* v2 or later? */
+	blt	1f
+	li	%r4,28
+	STWX_BE	%r17,%r3,%r4	/* Store my cpu as __be32 at byte 28 */
+1:
+	/* load the kernel address */
+	ld	%r4,(kernel - 0b)(%r18)
+
+	/* load the run_at_load flag */
+	/* possibly patched by kexec */
+	ld	%r6,(run_at_load - 0b)(%r18)
+	/* and patch it into the kernel */
+	stw	%r6,(0x5c)(%r4)
+
+	mr	%r3,%r16	/* restore dt address */
+
+	li	%r5,0		/* r5 will be 0 for kernel */
+
+	mfmsr	%r11
+	andi.	%r10,%r11,1	/* test MSR_LE */
+	bne	.Little_endian
+
+	mtctr	%r4		/* prepare branch to */
+	bctr			/* start kernel */
+
+.Little_endian:
+	mtsrr0	%r4		/* prepare branch to */
+
+	clrrdi	%r11,%r11,1	/* clear MSR_LE */
+	mtsrr1	%r11
+
+	rfid			/* update MSR and start kernel */
+
+
+	.balign 8
+	.globl kernel
+kernel:
+	.8byte  0x0
+	.size kernel, . - kernel
+
+	.balign 8
+	.globl dt_offset
+dt_offset:
+	.8byte  0x0
+	.size dt_offset, . - dt_offset
+
+
+	.data
+	.balign 8
+.globl purgatory_sha256_digest
+purgatory_sha256_digest:
+	.skip	32
+	.size purgatory_sha256_digest, . - purgatory_sha256_digest
+
+	.balign 8
+.globl purgatory_sha_regions
+purgatory_sha_regions:
+	.skip	8 * 2 * 16
+	.size purgatory_sha_regions, . - purgatory_sha_regions

