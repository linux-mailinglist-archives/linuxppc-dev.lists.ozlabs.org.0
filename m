Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E9921DEE2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 19:39:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B59rf2XShzDqWl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 03:39:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B59Td4BgqzDqM9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 03:23:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B59Td2YpKz8vnS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 03:23:17 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B59Tc6nzCz9sSt; Tue, 14 Jul 2020 03:23:16 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 4B59Tb1dWTz9sRk
 for <linuxppc-dev@ozlabs.org>; Tue, 14 Jul 2020 03:23:15 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06DH1x0Y017435; Mon, 13 Jul 2020 13:23:08 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3279k3bm5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 13:23:08 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06DH3KKq022254;
 Mon, 13 Jul 2020 13:23:07 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3279k3bm4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 13:23:07 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06DHHRC1026818;
 Mon, 13 Jul 2020 17:23:05 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3274pgtcyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 17:23:05 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06DHN2gU61866478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jul 2020 17:23:02 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23A2B42049;
 Mon, 13 Jul 2020 17:23:02 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EE134203F;
 Mon, 13 Jul 2020 17:22:58 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.3.11])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jul 2020 17:22:58 +0000 (GMT)
Subject: [PATCH v3 09/12] ppc64/kexec_file: setup backup region for kdump
 kernel
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 13 Jul 2020 22:52:57 +0530
Message-ID: <159466096898.24747.16701009925943468066.stgit@hbathini.in.ibm.com>
In-Reply-To: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
References: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-13_15:2020-07-13,
 2020-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007130120
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
Cc: kernel test robot <lkp@intel.com>, Pingfan Liu <piliu@redhat.com>,
 Kexec-ml <kexec@lists.infradead.org>, Nayna Jain <nayna@linux.ibm.com>,
 Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Mimi Zohar <zohar@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Though kdump kernel boots from loaded address, the first 64K bytes
of it is copied down to real 0. So, setup a backup region to copy
the first 64K bytes of crashed kernel, in purgatory, before booting
into kdump kernel. Also, update reserve map with backup region and
crashed kernel's memory to avoid kdump kernel from accidentially
using that memory.

Reported-by: kernel test robot <lkp@intel.com>
[lkp: In v1, purgatory() declaration was missing]
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

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


 arch/powerpc/include/asm/crashdump-ppc64.h |    5 +
 arch/powerpc/include/asm/kexec.h           |    7 ++
 arch/powerpc/include/asm/purgatory.h       |   11 +++
 arch/powerpc/kexec/elf_64.c                |    9 +++
 arch/powerpc/kexec/file_load_64.c          |   95 ++++++++++++++++++++++++++++
 arch/powerpc/purgatory/Makefile            |   28 ++++++++
 arch/powerpc/purgatory/purgatory_64.c      |   36 +++++++++++
 arch/powerpc/purgatory/trampoline_64.S     |   23 +++++--
 8 files changed, 206 insertions(+), 8 deletions(-)
 create mode 100644 arch/powerpc/include/asm/purgatory.h
 create mode 100644 arch/powerpc/purgatory/purgatory_64.c

diff --git a/arch/powerpc/include/asm/crashdump-ppc64.h b/arch/powerpc/include/asm/crashdump-ppc64.h
index 90deb46..fcc5fce 100644
--- a/arch/powerpc/include/asm/crashdump-ppc64.h
+++ b/arch/powerpc/include/asm/crashdump-ppc64.h
@@ -2,6 +2,11 @@
 #ifndef _ASM_POWERPC_CRASHDUMP_PPC64_H
 #define _ASM_POWERPC_CRASHDUMP_PPC64_H
 
+/* Backup region - first 64K bytes of System RAM. */
+#define BACKUP_SRC_START	0
+#define BACKUP_SRC_END		0xffff
+#define BACKUP_SRC_SIZE		(BACKUP_SRC_END - BACKUP_SRC_START + 1)
+
 /* min & max addresses for kdump load segments */
 #define KDUMP_BUF_MIN		(crashk_res.start)
 #define KDUMP_BUF_MAX		((crashk_res.end < ppc64_rma_size) ? \
diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index e78cd0a..037cf2b 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -109,6 +109,9 @@ extern const struct kexec_file_ops kexec_elf64_ops;
 struct kimage_arch {
 	struct crash_mem *exclude_ranges;
 
+	unsigned long backup_start;
+	void *backup_buf;
+
 #ifdef CONFIG_IMA_KEXEC
 	phys_addr_t ima_buffer_addr;
 	size_t ima_buffer_size;
@@ -124,6 +127,10 @@ int setup_new_fdt(const struct kimage *image, void *fdt,
 int delete_fdt_mem_rsv(void *fdt, unsigned long start, unsigned long size);
 
 #ifdef CONFIG_PPC64
+struct kexec_buf;
+
+int load_crashdump_segments_ppc64(struct kimage *image,
+				  struct kexec_buf *kbuf);
 int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 			  const void *fdt, unsigned long kernel_load_addr,
 			  unsigned long fdt_load_addr);
diff --git a/arch/powerpc/include/asm/purgatory.h b/arch/powerpc/include/asm/purgatory.h
new file mode 100644
index 0000000..076d150
--- /dev/null
+++ b/arch/powerpc/include/asm/purgatory.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_POWERPC_PURGATORY_H
+#define _ASM_POWERPC_PURGATORY_H
+
+#ifndef __ASSEMBLY__
+#include <linux/purgatory.h>
+
+void purgatory(void);
+#endif	/* __ASSEMBLY__ */
+
+#endif /* _ASM_POWERPC_PURGATORY_H */
diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index c695f94..4838b42 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -67,6 +67,15 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 
 	pr_debug("Loaded purgatory at 0x%lx\n", pbuf.mem);
 
+	/* Setup additional segments needed for panic kernel */
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
index adad297..152f61a 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -20,6 +20,7 @@
 #include <linux/of_device.h>
 #include <linux/memblock.h>
 #include <linux/slab.h>
+#include <linux/vmalloc.h>
 #include <asm/types.h>
 #include <asm/drmem.h>
 #include <asm/kexec_ranges.h>
@@ -860,6 +861,69 @@ static int __kexec_do_relocs(unsigned long my_r2, const Elf_Sym *sym,
 }
 
 /**
+ * load_backup_segment - Initialize backup segment of crashing kernel.
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
+/**
  * setup_purgatory_ppc64 - initialize PPC64 specific purgatory's global
  *                         variables and call setup_purgatory() to initialize
  *                         common global variable.
@@ -900,6 +964,14 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
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
 	/* Setup the stack top */
 	stack_buf = kexec_purgatory_get_symbol_addr(image, "stack_buf");
 	if (!stack_buf)
@@ -968,7 +1040,7 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 
 	/*
 	 * Restrict memory usage for kdump kernel by setting up
-	 * usable memory ranges.
+	 * usable memory ranges and memory reserve map.
 	 */
 	if (image->type == KEXEC_TYPE_CRASH) {
 		ret = get_usable_memory_ranges(&umem);
@@ -980,6 +1052,24 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 			pr_err("Error setting up usable-memory property for kdump kernel\n");
 			goto out;
 		}
+
+		ret = fdt_add_mem_rsv(fdt, BACKUP_SRC_START + BACKUP_SRC_SIZE,
+				      crashk_res.start - BACKUP_SRC_SIZE);
+		if (ret) {
+			pr_err("Error reserving crash memory: %s\n",
+			       fdt_strerror(ret));
+			goto out;
+		}
+	}
+
+	if (image->arch.backup_start) {
+		ret = fdt_add_mem_rsv(fdt, image->arch.backup_start,
+				      BACKUP_SRC_SIZE);
+		if (ret) {
+			pr_err("Error reserving memory for backup: %s\n",
+			       fdt_strerror(ret));
+			goto out;
+		}
 	}
 
 	ret = setup_new_fdt(image, fdt, initrd_load_addr, initrd_len,
@@ -1187,5 +1277,8 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 	kfree(image->arch.exclude_ranges);
 	image->arch.exclude_ranges = NULL;
 
+	vfree(image->arch.backup_buf);
+	image->arch.backup_buf = NULL;
+
 	return kexec_image_post_load_cleanup_default(image);
 }
diff --git a/arch/powerpc/purgatory/Makefile b/arch/powerpc/purgatory/Makefile
index 348f5958..a494413 100644
--- a/arch/powerpc/purgatory/Makefile
+++ b/arch/powerpc/purgatory/Makefile
@@ -2,13 +2,37 @@
 
 KASAN_SANITIZE := n
 
-targets += trampoline_$(BITS).o purgatory.ro kexec-purgatory.c
+purgatory-y := purgatory_$(BITS).o trampoline_$(BITS).o
+
+targets += $(purgatory-y)
+PURGATORY_OBJS = $(addprefix $(obj)/,$(purgatory-y))
 
 LDFLAGS_purgatory.ro := -e purgatory_start -r --no-undefined
+targets += purgatory.ro
+
+PURGATORY_CFLAGS_REMOVE :=
+
+# Default KBUILD_CFLAGS can have -pg option set when FUNCTION_TRACE is
+# enabled leaving some undefined symbols like _mcount in purgatory.
+ifdef CONFIG_FUNCTION_TRACER
+PURGATORY_CFLAGS_REMOVE			+= $(CC_FLAGS_FTRACE)
+endif
+
+ifdef CONFIG_STACKPROTECTOR
+PURGATORY_CFLAGS_REMOVE		+= -fstack-protector
+endif
 
-$(obj)/purgatory.ro: $(obj)/trampoline_$(BITS).o FORCE
+ifdef CONFIG_STACKPROTECTOR_STRONG
+PURGATORY_CFLAGS_REMOVE		+= -fstack-protector-strong
+endif
+
+CFLAGS_REMOVE_purgatory_$(BITS).o	+= $(PURGATORY_CFLAGS_REMOVE)
+
+$(obj)/purgatory.ro: $(PURGATORY_OBJS) FORCE
 		$(call if_changed,ld)
 
+targets += kexec-purgatory.c
+
 quiet_cmd_bin2c = BIN2C   $@
       cmd_bin2c = $(objtree)/scripts/bin2c kexec_purgatory < $< > $@
 
diff --git a/arch/powerpc/purgatory/purgatory_64.c b/arch/powerpc/purgatory/purgatory_64.c
new file mode 100644
index 0000000..1eca74c
--- /dev/null
+++ b/arch/powerpc/purgatory/purgatory_64.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * purgatory: Runs between two kernels
+ *
+ * Copyright 2020, Hari Bathini, IBM Corporation.
+ */
+
+#include <asm/purgatory.h>
+#include <asm/crashdump-ppc64.h>
+
+extern unsigned long backup_start;
+
+static void *__memcpy(void *dest, const void *src, unsigned long n)
+{
+	unsigned long i;
+	unsigned char *d;
+	const unsigned char *s;
+
+	d = dest;
+	s = src;
+	for (i = 0; i < n; i++)
+		d[i] = s[i];
+
+	return dest;
+}
+
+void purgatory(void)
+{
+	void *dest, *src;
+
+	src = (void *)BACKUP_SRC_START;
+	if (backup_start) {
+		dest = (void *)backup_start;
+		__memcpy(dest, src, BACKUP_SRC_SIZE);
+	}
+}
diff --git a/arch/powerpc/purgatory/trampoline_64.S b/arch/powerpc/purgatory/trampoline_64.S
index 83e93b7..11061961 100644
--- a/arch/powerpc/purgatory/trampoline_64.S
+++ b/arch/powerpc/purgatory/trampoline_64.S
@@ -44,11 +44,6 @@ master:
 	mr	%r17,%r3	/* save cpu id to r17 */
 	mr	%r15,%r4	/* save physical address in reg15 */
 
-	or	%r3,%r3,%r3	/* ok now to high priority, lets boot */
-	lis	%r6,0x1
-	mtctr	%r6		/* delay a bit for slaves to catch up */
-	bdnz	.		/* before we overwrite 0-100 again */
-
 	bl	0f		/* Work out where we're running */
 0:	mflr	%r18
 
@@ -56,6 +51,19 @@ master:
 
 	ld	%r1,(stack - 0b)(%r18)		/* setup stack */
 
+	subi	%r1,%r1,112
+#if defined(_CALL_ELF) && _CALL_ELF == 2
+	bl	purgatory
+#else
+	bl	.purgatory
+#endif
+	nop
+80:
+	or	%r3,%r3,%r3	/* ok now to high priority, lets boot */
+	lis	%r6,0x1
+	mtctr	%r6		/* delay a bit for slaves to catch up */
+	bdnz	.		/* before we overwrite 0-100 again */
+
 	/* load device-tree address */
 	ld	%r3, (dt_offset - 0b)(%r18)
 	mr	%r16,%r3	/* save dt address in reg16 */
@@ -112,6 +120,11 @@ dt_offset:
 	.8byte  0x0
 	.size dt_offset, . - dt_offset
 
+	.balign 8
+	.globl backup_start
+backup_start:
+	.8byte  0x0
+	.size backup_start, . - backup_start
 
 	.balign 8
 	.globl my_toc

