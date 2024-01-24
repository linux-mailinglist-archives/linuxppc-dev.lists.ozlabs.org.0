Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAFE83A115
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 06:15:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B0pQIcdU;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B0pQIcdU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TKXGZ1bZxz3cVL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 16:15:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B0pQIcdU;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B0pQIcdU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TKXDB0G6Pz3btl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jan 2024 16:13:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706073207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ABKl7G27cjBny4iirK+UmUV6u88HTFKt/GmyfhqNRM=;
	b=B0pQIcdUwqF4AOivrA0D8OrATtt4v0xPCeKOCG9r432h1h57N2O+ufFd6/1y+S1sFL8yOn
	kgNhs2ANiZR72xDvVY6ke4doQVkA0QHpQnCi/ez/dD8YXtw1vf0QemrnEZf3FTyYyIjw+U
	1zbzOgZXxdnn9UAeky7wBBc/tFoFe08=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706073207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ABKl7G27cjBny4iirK+UmUV6u88HTFKt/GmyfhqNRM=;
	b=B0pQIcdUwqF4AOivrA0D8OrATtt4v0xPCeKOCG9r432h1h57N2O+ufFd6/1y+S1sFL8yOn
	kgNhs2ANiZR72xDvVY6ke4doQVkA0QHpQnCi/ez/dD8YXtw1vf0QemrnEZf3FTyYyIjw+U
	1zbzOgZXxdnn9UAeky7wBBc/tFoFe08=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-pPuTSnNwMrO1zQ-VJ6TD5w-1; Wed, 24 Jan 2024 00:13:22 -0500
X-MC-Unique: pPuTSnNwMrO1zQ-VJ6TD5w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78F1A85A58A;
	Wed, 24 Jan 2024 05:13:18 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD7551C060AF;
	Wed, 24 Jan 2024 05:13:12 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH linux-next v3 02/14] crash: split vmcoreinfo exporting code out from crash_core.c
Date: Wed, 24 Jan 2024 13:12:42 +0800
Message-ID: <20240124051254.67105-3-bhe@redhat.com>
In-Reply-To: <20240124051254.67105-1-bhe@redhat.com>
References: <20240124051254.67105-1-bhe@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
Cc: linux-s390@vger.kernel.org, Baoquan He <bhe@redhat.com>, piliu@redhat.com, linux-sh@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-mips@vger.kernel.org, ebiederm@xmission.com, loongarch@lists.linux.dev, hbathini@linux.ibm.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org, viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now move the relevant codes into separate files:
kernel/crash_reserve.c, include/linux/crash_reserve.h.

And add config item CRASH_RESERVE to control its enabling.

And also update the old ifdeffery of CONFIG_CRASH_CORE, including of
<linux/crash_core.h> and config item dependency on CRASH_CORE
accordingly.

And also do renaming as follows:
 - arch/xxx/kernel/{crash_core.c => vmcore_info.c}
because they are only related to vmcoreinfo exporting on x86, arm64,
riscv.

And also Remove config item CRASH_CORE, and rely on CONFIG_KEXEC_CORE to
decide if build in crash_core.c.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
v2->v3:
- There's conflict when rebasing to linux-next in kernel/crash_core.c
  because of below commits from Uladzislau:
  commit 699d9351822e ("mm: vmalloc: Fix a warning in the crash_save_vmcoreinfo_init()")
  commit 5f4c0c1e2a51 (:mm/vmalloc: remove vmap_area_list")

 arch/arm64/kernel/Makefile                    |   2 +-
 .../kernel/{crash_core.c => vmcore_info.c}    |   2 +-
 arch/powerpc/Kconfig                          |   2 +-
 arch/powerpc/kernel/setup-common.c            |   2 +-
 arch/powerpc/platforms/powernv/opal-core.c    |   2 +-
 arch/riscv/kernel/Makefile                    |   2 +-
 .../kernel/{crash_core.c => vmcore_info.c}    |   2 +-
 arch/x86/kernel/Makefile                      |   2 +-
 .../{crash_core_32.c => vmcore_info_32.c}     |   2 +-
 .../{crash_core_64.c => vmcore_info_64.c}     |   2 +-
 drivers/firmware/qemu_fw_cfg.c                |  14 +-
 fs/proc/Kconfig                               |   2 +-
 fs/proc/kcore.c                               |   2 +-
 include/linux/buildid.h                       |   2 +-
 include/linux/crash_core.h                    |  73 ------
 include/linux/kexec.h                         |   1 +
 include/linux/vmcore_info.h                   |  81 ++++++
 kernel/Kconfig.kexec                          |   4 +-
 kernel/Makefile                               |   4 +-
 kernel/crash_core.c                           | 206 ----------------
 kernel/ksysfs.c                               |   6 +-
 kernel/printk/printk.c                        |   4 +-
 kernel/vmcore_info.c                          | 231 ++++++++++++++++++
 lib/buildid.c                                 |   2 +-
 24 files changed, 343 insertions(+), 309 deletions(-)
 rename arch/arm64/kernel/{crash_core.c => vmcore_info.c} (97%)
 rename arch/riscv/kernel/{crash_core.c => vmcore_info.c} (96%)
 rename arch/x86/kernel/{crash_core_32.c => vmcore_info_32.c} (90%)
 rename arch/x86/kernel/{crash_core_64.c => vmcore_info_64.c} (94%)
 create mode 100644 include/linux/vmcore_info.h
 create mode 100644 kernel/vmcore_info.c

diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index e5d03a7039b4..9fd638b91f38 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -66,7 +66,7 @@ obj-$(CONFIG_KEXEC_FILE)		+= machine_kexec_file.o kexec_image.o
 obj-$(CONFIG_ARM64_RELOC_TEST)		+= arm64-reloc-test.o
 arm64-reloc-test-y := reloc_test_core.o reloc_test_syms.o
 obj-$(CONFIG_CRASH_DUMP)		+= crash_dump.o
-obj-$(CONFIG_CRASH_CORE)		+= crash_core.o
+obj-$(CONFIG_VMCORE_INFO)		+= vmcore_info.o
 obj-$(CONFIG_ARM_SDE_INTERFACE)		+= sdei.o
 obj-$(CONFIG_ARM64_PTR_AUTH)		+= pointer_auth.o
 obj-$(CONFIG_ARM64_MTE)			+= mte.o
diff --git a/arch/arm64/kernel/crash_core.c b/arch/arm64/kernel/vmcore_info.c
similarity index 97%
rename from arch/arm64/kernel/crash_core.c
rename to arch/arm64/kernel/vmcore_info.c
index 2a24199a9b81..b19d5d6cb8b3 100644
--- a/arch/arm64/kernel/crash_core.c
+++ b/arch/arm64/kernel/vmcore_info.c
@@ -4,7 +4,7 @@
  * Copyright (C) Huawei Futurewei Technologies.
  */
 
-#include <linux/crash_core.h>
+#include <linux/vmcore_info.h>
 #include <asm/cpufeature.h>
 #include <asm/memory.h>
 #include <asm/pgtable-hwdef.h>
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 7f704ae5c5ef..495d197c9b27 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -690,7 +690,7 @@ config ARCH_SELECTS_CRASH_DUMP
 config FA_DUMP
 	bool "Firmware-assisted dump"
 	depends on PPC64 && (PPC_RTAS || PPC_POWERNV)
-	select CRASH_CORE
+	select VMCORE_INFO
 	select CRASH_RESERVE
 	select CRASH_DUMP
 	help
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 9b142b9d5187..733f210ffda1 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -109,7 +109,7 @@ int ppc_do_canonicalize_irqs;
 EXPORT_SYMBOL(ppc_do_canonicalize_irqs);
 #endif
 
-#ifdef CONFIG_CRASH_CORE
+#ifdef CONFIG_VMCORE_INFO
 /* This keeps a track of which one is the crashing cpu. */
 int crashing_cpu = -1;
 #endif
diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
index bb7657115f1d..c9a9b759cc92 100644
--- a/arch/powerpc/platforms/powernv/opal-core.c
+++ b/arch/powerpc/platforms/powernv/opal-core.c
@@ -16,7 +16,7 @@
 #include <linux/kobject.h>
 #include <linux/sysfs.h>
 #include <linux/slab.h>
-#include <linux/crash_core.h>
+#include <linux/vmcore_info.h>
 #include <linux/of.h>
 
 #include <asm/page.h>
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index f71910718053..d6fd8dcfceb5 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -92,7 +92,7 @@ obj-$(CONFIG_KGDB)		+= kgdb.o
 obj-$(CONFIG_KEXEC_CORE)	+= kexec_relocate.o crash_save_regs.o machine_kexec.o
 obj-$(CONFIG_KEXEC_FILE)	+= elf_kexec.o machine_kexec_file.o
 obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
-obj-$(CONFIG_CRASH_CORE)	+= crash_core.o
+obj-$(CONFIG_VMCORE_INFO)	+= vmcore_info.o
 
 obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
 
diff --git a/arch/riscv/kernel/crash_core.c b/arch/riscv/kernel/vmcore_info.c
similarity index 96%
rename from arch/riscv/kernel/crash_core.c
rename to arch/riscv/kernel/vmcore_info.c
index d18d529fd9b9..6d7a22522d63 100644
--- a/arch/riscv/kernel/crash_core.c
+++ b/arch/riscv/kernel/vmcore_info.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
-#include <linux/crash_core.h>
+#include <linux/vmcore_info.h>
 #include <linux/pagemap.h>
 
 void arch_crash_save_vmcoreinfo(void)
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 0000325ab98f..913d4022131e 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -98,7 +98,7 @@ obj-$(CONFIG_FTRACE_SYSCALLS)	+= ftrace.o
 obj-$(CONFIG_X86_TSC)		+= trace_clock.o
 obj-$(CONFIG_TRACING)		+= trace.o
 obj-$(CONFIG_RETHOOK)		+= rethook.o
-obj-$(CONFIG_CRASH_CORE)	+= crash_core_$(BITS).o
+obj-$(CONFIG_VMCORE_INFO)	+= vmcore_info_$(BITS).o
 obj-$(CONFIG_KEXEC_CORE)	+= machine_kexec_$(BITS).o
 obj-$(CONFIG_KEXEC_CORE)	+= relocate_kernel_$(BITS).o crash.o
 obj-$(CONFIG_KEXEC_FILE)	+= kexec-bzimage64.o
diff --git a/arch/x86/kernel/crash_core_32.c b/arch/x86/kernel/vmcore_info_32.c
similarity index 90%
rename from arch/x86/kernel/crash_core_32.c
rename to arch/x86/kernel/vmcore_info_32.c
index 8a89c109e20a..5995a749288a 100644
--- a/arch/x86/kernel/crash_core_32.c
+++ b/arch/x86/kernel/vmcore_info_32.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
-#include <linux/crash_core.h>
+#include <linux/vmcore_info.h>
 #include <linux/pgtable.h>
 
 #include <asm/setup.h>
diff --git a/arch/x86/kernel/crash_core_64.c b/arch/x86/kernel/vmcore_info_64.c
similarity index 94%
rename from arch/x86/kernel/crash_core_64.c
rename to arch/x86/kernel/vmcore_info_64.c
index 7d255f882afe..0dec7d868754 100644
--- a/arch/x86/kernel/crash_core_64.c
+++ b/arch/x86/kernel/vmcore_info_64.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
-#include <linux/crash_core.h>
+#include <linux/vmcore_info.h>
 #include <linux/pgtable.h>
 
 #include <asm/setup.h>
diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
index 03da9a4354f8..5f43dfa22f79 100644
--- a/drivers/firmware/qemu_fw_cfg.c
+++ b/drivers/firmware/qemu_fw_cfg.c
@@ -37,7 +37,7 @@
 #include <uapi/linux/qemu_fw_cfg.h>
 #include <linux/delay.h>
 #include <linux/crash_dump.h>
-#include <linux/crash_core.h>
+#include <linux/vmcore_info.h>
 
 MODULE_AUTHOR("Gabriel L. Somlo <somlo@cmu.edu>");
 MODULE_DESCRIPTION("QEMU fw_cfg sysfs support");
@@ -67,7 +67,7 @@ static void fw_cfg_sel_endianness(u16 key)
 		iowrite16(key, fw_cfg_reg_ctrl);
 }
 
-#ifdef CONFIG_CRASH_CORE
+#ifdef CONFIG_VMCORE_INFO
 static inline bool fw_cfg_dma_enabled(void)
 {
 	return (fw_cfg_rev & FW_CFG_VERSION_DMA) && fw_cfg_reg_dma;
@@ -156,7 +156,7 @@ static ssize_t fw_cfg_read_blob(u16 key,
 	return count;
 }
 
-#ifdef CONFIG_CRASH_CORE
+#ifdef CONFIG_VMCORE_INFO
 /* write chunk of given fw_cfg blob (caller responsible for sanity-check) */
 static ssize_t fw_cfg_write_blob(u16 key,
 				 void *buf, loff_t pos, size_t count)
@@ -195,7 +195,7 @@ static ssize_t fw_cfg_write_blob(u16 key,
 
 	return ret;
 }
-#endif /* CONFIG_CRASH_CORE */
+#endif /* CONFIG_VMCORE_INFO */
 
 /* clean up fw_cfg device i/o */
 static void fw_cfg_io_cleanup(void)
@@ -319,7 +319,7 @@ struct fw_cfg_sysfs_entry {
 	struct list_head list;
 };
 
-#ifdef CONFIG_CRASH_CORE
+#ifdef CONFIG_VMCORE_INFO
 static ssize_t fw_cfg_write_vmcoreinfo(const struct fw_cfg_file *f)
 {
 	static struct fw_cfg_vmcoreinfo *data;
@@ -343,7 +343,7 @@ static ssize_t fw_cfg_write_vmcoreinfo(const struct fw_cfg_file *f)
 	kfree(data);
 	return ret;
 }
-#endif /* CONFIG_CRASH_CORE */
+#endif /* CONFIG_VMCORE_INFO */
 
 /* get fw_cfg_sysfs_entry from kobject member */
 static inline struct fw_cfg_sysfs_entry *to_entry(struct kobject *kobj)
@@ -583,7 +583,7 @@ static int fw_cfg_register_file(const struct fw_cfg_file *f)
 	int err;
 	struct fw_cfg_sysfs_entry *entry;
 
-#ifdef CONFIG_CRASH_CORE
+#ifdef CONFIG_VMCORE_INFO
 	if (fw_cfg_dma_enabled() &&
 		strcmp(f->name, FW_CFG_VMCOREINFO_FILENAME) == 0 &&
 		!is_kdump_kernel()) {
diff --git a/fs/proc/Kconfig b/fs/proc/Kconfig
index 32b1116ae137..d80a1431ef7b 100644
--- a/fs/proc/Kconfig
+++ b/fs/proc/Kconfig
@@ -32,7 +32,7 @@ config PROC_FS
 config PROC_KCORE
 	bool "/proc/kcore support" if !ARM
 	depends on PROC_FS && MMU
-	select CRASH_CORE
+	select VMCORE_INFO
 	help
 	  Provides a virtual ELF core file of the live kernel.  This can
 	  be read with gdb and other ELF tools.  No modifications can be
diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
index 6422e569b080..8e08a9a1b7ed 100644
--- a/fs/proc/kcore.c
+++ b/fs/proc/kcore.c
@@ -10,7 +10,7 @@
  *	Safe accesses to vmalloc/direct-mapped discontiguous areas, Kanoj Sarcar <kanoj@sgi.com>
  */
 
-#include <linux/crash_core.h>
+#include <linux/vmcore_info.h>
 #include <linux/mm.h>
 #include <linux/proc_fs.h>
 #include <linux/kcore.h>
diff --git a/include/linux/buildid.h b/include/linux/buildid.h
index 8a582d242f06..20aa3c2d89f7 100644
--- a/include/linux/buildid.h
+++ b/include/linux/buildid.h
@@ -11,7 +11,7 @@ int build_id_parse(struct vm_area_struct *vma, unsigned char *build_id,
 		   __u32 *size);
 int build_id_parse_buf(const void *buf, unsigned char *build_id, u32 buf_size);
 
-#if IS_ENABLED(CONFIG_STACKTRACE_BUILD_ID) || IS_ENABLED(CONFIG_CRASH_CORE)
+#if IS_ENABLED(CONFIG_STACKTRACE_BUILD_ID) || IS_ENABLED(CONFIG_VMCORE_INFO)
 extern unsigned char vmlinux_build_id[BUILD_ID_SIZE_MAX];
 void init_vmlinux_build_id(void);
 #else
diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index 1fde49246fa6..7f19f62018ef 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -6,79 +6,6 @@
 #include <linux/elfcore.h>
 #include <linux/elf.h>
 
-#define CRASH_CORE_NOTE_NAME	   "CORE"
-#define CRASH_CORE_NOTE_HEAD_BYTES ALIGN(sizeof(struct elf_note), 4)
-#define CRASH_CORE_NOTE_NAME_BYTES ALIGN(sizeof(CRASH_CORE_NOTE_NAME), 4)
-#define CRASH_CORE_NOTE_DESC_BYTES ALIGN(sizeof(struct elf_prstatus), 4)
-
-/*
- * The per-cpu notes area is a list of notes terminated by a "NULL"
- * note header.  For kdump, the code in vmcore.c runs in the context
- * of the second kernel to combine them into one note.
- */
-#define CRASH_CORE_NOTE_BYTES	   ((CRASH_CORE_NOTE_HEAD_BYTES * 2) +	\
-				     CRASH_CORE_NOTE_NAME_BYTES +	\
-				     CRASH_CORE_NOTE_DESC_BYTES)
-
-#define VMCOREINFO_BYTES	   PAGE_SIZE
-#define VMCOREINFO_NOTE_NAME	   "VMCOREINFO"
-#define VMCOREINFO_NOTE_NAME_BYTES ALIGN(sizeof(VMCOREINFO_NOTE_NAME), 4)
-#define VMCOREINFO_NOTE_SIZE	   ((CRASH_CORE_NOTE_HEAD_BYTES * 2) +	\
-				     VMCOREINFO_NOTE_NAME_BYTES +	\
-				     VMCOREINFO_BYTES)
-
-typedef u32 note_buf_t[CRASH_CORE_NOTE_BYTES/4];
-/* Per cpu memory for storing cpu states in case of system crash. */
-extern note_buf_t __percpu *crash_notes;
-
-void crash_update_vmcoreinfo_safecopy(void *ptr);
-void crash_save_vmcoreinfo(void);
-void arch_crash_save_vmcoreinfo(void);
-__printf(1, 2)
-void vmcoreinfo_append_str(const char *fmt, ...);
-phys_addr_t paddr_vmcoreinfo_note(void);
-
-#define VMCOREINFO_OSRELEASE(value) \
-	vmcoreinfo_append_str("OSRELEASE=%s\n", value)
-#define VMCOREINFO_BUILD_ID()						\
-	({								\
-		static_assert(sizeof(vmlinux_build_id) == 20);		\
-		vmcoreinfo_append_str("BUILD-ID=%20phN\n", vmlinux_build_id); \
-	})
-
-#define VMCOREINFO_PAGESIZE(value) \
-	vmcoreinfo_append_str("PAGESIZE=%ld\n", value)
-#define VMCOREINFO_SYMBOL(name) \
-	vmcoreinfo_append_str("SYMBOL(%s)=%lx\n", #name, (unsigned long)&name)
-#define VMCOREINFO_SYMBOL_ARRAY(name) \
-	vmcoreinfo_append_str("SYMBOL(%s)=%lx\n", #name, (unsigned long)name)
-#define VMCOREINFO_SIZE(name) \
-	vmcoreinfo_append_str("SIZE(%s)=%lu\n", #name, \
-			      (unsigned long)sizeof(name))
-#define VMCOREINFO_STRUCT_SIZE(name) \
-	vmcoreinfo_append_str("SIZE(%s)=%lu\n", #name, \
-			      (unsigned long)sizeof(struct name))
-#define VMCOREINFO_OFFSET(name, field) \
-	vmcoreinfo_append_str("OFFSET(%s.%s)=%lu\n", #name, #field, \
-			      (unsigned long)offsetof(struct name, field))
-#define VMCOREINFO_TYPE_OFFSET(name, field) \
-	vmcoreinfo_append_str("OFFSET(%s.%s)=%lu\n", #name, #field, \
-			      (unsigned long)offsetof(name, field))
-#define VMCOREINFO_LENGTH(name, value) \
-	vmcoreinfo_append_str("LENGTH(%s)=%lu\n", #name, (unsigned long)value)
-#define VMCOREINFO_NUMBER(name) \
-	vmcoreinfo_append_str("NUMBER(%s)=%ld\n", #name, (long)name)
-#define VMCOREINFO_CONFIG(name) \
-	vmcoreinfo_append_str("CONFIG_%s=y\n", #name)
-
-extern unsigned char *vmcoreinfo_data;
-extern size_t vmcoreinfo_size;
-extern u32 *vmcoreinfo_note;
-
-Elf_Word *append_elf_note(Elf_Word *buf, char *name, unsigned int type,
-			  void *data, size_t data_len);
-void final_note(Elf_Word *buf);
-
 /* Alignment required for elf header segment */
 #define ELF_CORE_HEADER_ALIGN   4096
 
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 6d79bfb52e5b..9c7bb8b56ed6 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -16,6 +16,7 @@
 #if !defined(__ASSEMBLY__)
 
 #include <linux/crash_core.h>
+#include <linux/vmcore_info.h>
 #include <linux/crash_reserve.h>
 #include <asm/io.h>
 #include <linux/range.h>
diff --git a/include/linux/vmcore_info.h b/include/linux/vmcore_info.h
new file mode 100644
index 000000000000..e1dec1a6a749
--- /dev/null
+++ b/include/linux/vmcore_info.h
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef LINUX_VMCORE_INFO_H
+#define LINUX_VMCORE_INFO_H
+
+#include <linux/linkage.h>
+#include <linux/elfcore.h>
+#include <linux/elf.h>
+
+#define CRASH_CORE_NOTE_NAME	   "CORE"
+#define CRASH_CORE_NOTE_HEAD_BYTES ALIGN(sizeof(struct elf_note), 4)
+#define CRASH_CORE_NOTE_NAME_BYTES ALIGN(sizeof(CRASH_CORE_NOTE_NAME), 4)
+#define CRASH_CORE_NOTE_DESC_BYTES ALIGN(sizeof(struct elf_prstatus), 4)
+
+/*
+ * The per-cpu notes area is a list of notes terminated by a "NULL"
+ * note header.  For kdump, the code in vmcore.c runs in the context
+ * of the second kernel to combine them into one note.
+ */
+#define CRASH_CORE_NOTE_BYTES	   ((CRASH_CORE_NOTE_HEAD_BYTES * 2) +	\
+				     CRASH_CORE_NOTE_NAME_BYTES +	\
+				     CRASH_CORE_NOTE_DESC_BYTES)
+
+#define VMCOREINFO_BYTES	   PAGE_SIZE
+#define VMCOREINFO_NOTE_NAME	   "VMCOREINFO"
+#define VMCOREINFO_NOTE_NAME_BYTES ALIGN(sizeof(VMCOREINFO_NOTE_NAME), 4)
+#define VMCOREINFO_NOTE_SIZE	   ((CRASH_CORE_NOTE_HEAD_BYTES * 2) +	\
+				     VMCOREINFO_NOTE_NAME_BYTES +	\
+				     VMCOREINFO_BYTES)
+
+typedef u32 note_buf_t[CRASH_CORE_NOTE_BYTES/4];
+/* Per cpu memory for storing cpu states in case of system crash. */
+extern note_buf_t __percpu *crash_notes;
+
+void crash_update_vmcoreinfo_safecopy(void *ptr);
+void crash_save_vmcoreinfo(void);
+void arch_crash_save_vmcoreinfo(void);
+__printf(1, 2)
+void vmcoreinfo_append_str(const char *fmt, ...);
+phys_addr_t paddr_vmcoreinfo_note(void);
+
+#define VMCOREINFO_OSRELEASE(value) \
+	vmcoreinfo_append_str("OSRELEASE=%s\n", value)
+#define VMCOREINFO_BUILD_ID()						\
+	({								\
+		static_assert(sizeof(vmlinux_build_id) == 20);		\
+		vmcoreinfo_append_str("BUILD-ID=%20phN\n", vmlinux_build_id); \
+	})
+
+#define VMCOREINFO_PAGESIZE(value) \
+	vmcoreinfo_append_str("PAGESIZE=%ld\n", value)
+#define VMCOREINFO_SYMBOL(name) \
+	vmcoreinfo_append_str("SYMBOL(%s)=%lx\n", #name, (unsigned long)&name)
+#define VMCOREINFO_SYMBOL_ARRAY(name) \
+	vmcoreinfo_append_str("SYMBOL(%s)=%lx\n", #name, (unsigned long)name)
+#define VMCOREINFO_SIZE(name) \
+	vmcoreinfo_append_str("SIZE(%s)=%lu\n", #name, \
+			      (unsigned long)sizeof(name))
+#define VMCOREINFO_STRUCT_SIZE(name) \
+	vmcoreinfo_append_str("SIZE(%s)=%lu\n", #name, \
+			      (unsigned long)sizeof(struct name))
+#define VMCOREINFO_OFFSET(name, field) \
+	vmcoreinfo_append_str("OFFSET(%s.%s)=%lu\n", #name, #field, \
+			      (unsigned long)offsetof(struct name, field))
+#define VMCOREINFO_TYPE_OFFSET(name, field) \
+	vmcoreinfo_append_str("OFFSET(%s.%s)=%lu\n", #name, #field, \
+			      (unsigned long)offsetof(name, field))
+#define VMCOREINFO_LENGTH(name, value) \
+	vmcoreinfo_append_str("LENGTH(%s)=%lu\n", #name, (unsigned long)value)
+#define VMCOREINFO_NUMBER(name) \
+	vmcoreinfo_append_str("NUMBER(%s)=%ld\n", #name, (long)name)
+#define VMCOREINFO_CONFIG(name) \
+	vmcoreinfo_append_str("CONFIG_%s=y\n", #name)
+
+extern unsigned char *vmcoreinfo_data;
+extern size_t vmcoreinfo_size;
+extern u32 *vmcoreinfo_note;
+
+Elf_Word *append_elf_note(Elf_Word *buf, char *name, unsigned int type,
+			  void *data, size_t data_len);
+void final_note(Elf_Word *buf);
+#endif /* LINUX_VMCORE_INFO_H */
diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index 8b7be71edd85..8faf27043432 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -5,11 +5,11 @@ menu "Kexec and crash features"
 config CRASH_RESERVE
 	bool
 
-config CRASH_CORE
+config VMCORE_INFO
 	bool
 
 config KEXEC_CORE
-	select CRASH_CORE
+	select VMCORE_INFO
 	select CRASH_RESERVE
 	bool
 
diff --git a/kernel/Makefile b/kernel/Makefile
index 05fa88b3ab74..649272a1d6b9 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -68,9 +68,9 @@ obj-$(CONFIG_MODULE_SIG_FORMAT) += module_signature.o
 obj-$(CONFIG_KALLSYMS) += kallsyms.o
 obj-$(CONFIG_KALLSYMS_SELFTEST) += kallsyms_selftest.o
 obj-$(CONFIG_BSD_PROCESS_ACCT) += acct.o
-obj-$(CONFIG_CRASH_CORE) += crash_core.o
+obj-$(CONFIG_VMCORE_INFO) += vmcore_info.o
 obj-$(CONFIG_CRASH_RESERVE) += crash_reserve.o
-obj-$(CONFIG_KEXEC_CORE) += kexec_core.o
+obj-$(CONFIG_KEXEC_CORE) += kexec_core.o crash_core.o
 obj-$(CONFIG_KEXEC) += kexec.o
 obj-$(CONFIG_KEXEC_FILE) += kexec_file.o
 obj-$(CONFIG_KEXEC_ELF) += kexec_elf.o
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index ae0d1ce89b46..2f4df1fe6f7a 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -26,14 +26,6 @@
 /* Per cpu memory for storing cpu states in case of system crash. */
 note_buf_t __percpu *crash_notes;
 
-/* vmcoreinfo stuff */
-unsigned char *vmcoreinfo_data;
-size_t vmcoreinfo_size;
-u32 *vmcoreinfo_note;
-
-/* trusted vmcoreinfo, e.g. we can make a copy in the crash memory */
-static unsigned char *vmcoreinfo_data_safecopy;
-
 int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 			  void **addr, unsigned long *sz)
 {
@@ -195,204 +187,6 @@ int crash_exclude_mem_range(struct crash_mem *mem,
 	return 0;
 }
 
-Elf_Word *append_elf_note(Elf_Word *buf, char *name, unsigned int type,
-			  void *data, size_t data_len)
-{
-	struct elf_note *note = (struct elf_note *)buf;
-
-	note->n_namesz = strlen(name) + 1;
-	note->n_descsz = data_len;
-	note->n_type   = type;
-	buf += DIV_ROUND_UP(sizeof(*note), sizeof(Elf_Word));
-	memcpy(buf, name, note->n_namesz);
-	buf += DIV_ROUND_UP(note->n_namesz, sizeof(Elf_Word));
-	memcpy(buf, data, data_len);
-	buf += DIV_ROUND_UP(data_len, sizeof(Elf_Word));
-
-	return buf;
-}
-
-void final_note(Elf_Word *buf)
-{
-	memset(buf, 0, sizeof(struct elf_note));
-}
-
-static void update_vmcoreinfo_note(void)
-{
-	u32 *buf = vmcoreinfo_note;
-
-	if (!vmcoreinfo_size)
-		return;
-	buf = append_elf_note(buf, VMCOREINFO_NOTE_NAME, 0, vmcoreinfo_data,
-			      vmcoreinfo_size);
-	final_note(buf);
-}
-
-void crash_update_vmcoreinfo_safecopy(void *ptr)
-{
-	if (ptr)
-		memcpy(ptr, vmcoreinfo_data, vmcoreinfo_size);
-
-	vmcoreinfo_data_safecopy = ptr;
-}
-
-void crash_save_vmcoreinfo(void)
-{
-	if (!vmcoreinfo_note)
-		return;
-
-	/* Use the safe copy to generate vmcoreinfo note if have */
-	if (vmcoreinfo_data_safecopy)
-		vmcoreinfo_data = vmcoreinfo_data_safecopy;
-
-	vmcoreinfo_append_str("CRASHTIME=%lld\n", ktime_get_real_seconds());
-	update_vmcoreinfo_note();
-}
-
-void vmcoreinfo_append_str(const char *fmt, ...)
-{
-	va_list args;
-	char buf[0x50];
-	size_t r;
-
-	va_start(args, fmt);
-	r = vscnprintf(buf, sizeof(buf), fmt, args);
-	va_end(args);
-
-	r = min(r, (size_t)VMCOREINFO_BYTES - vmcoreinfo_size);
-
-	memcpy(&vmcoreinfo_data[vmcoreinfo_size], buf, r);
-
-	vmcoreinfo_size += r;
-
-	WARN_ONCE(vmcoreinfo_size == VMCOREINFO_BYTES,
-		  "vmcoreinfo data exceeds allocated size, truncating");
-}
-
-/*
- * provide an empty default implementation here -- architecture
- * code may override this
- */
-void __weak arch_crash_save_vmcoreinfo(void)
-{}
-
-phys_addr_t __weak paddr_vmcoreinfo_note(void)
-{
-	return __pa(vmcoreinfo_note);
-}
-EXPORT_SYMBOL(paddr_vmcoreinfo_note);
-
-static int __init crash_save_vmcoreinfo_init(void)
-{
-	vmcoreinfo_data = (unsigned char *)get_zeroed_page(GFP_KERNEL);
-	if (!vmcoreinfo_data) {
-		pr_warn("Memory allocation for vmcoreinfo_data failed\n");
-		return -ENOMEM;
-	}
-
-	vmcoreinfo_note = alloc_pages_exact(VMCOREINFO_NOTE_SIZE,
-						GFP_KERNEL | __GFP_ZERO);
-	if (!vmcoreinfo_note) {
-		free_page((unsigned long)vmcoreinfo_data);
-		vmcoreinfo_data = NULL;
-		pr_warn("Memory allocation for vmcoreinfo_note failed\n");
-		return -ENOMEM;
-	}
-
-	VMCOREINFO_OSRELEASE(init_uts_ns.name.release);
-	VMCOREINFO_BUILD_ID();
-	VMCOREINFO_PAGESIZE(PAGE_SIZE);
-
-	VMCOREINFO_SYMBOL(init_uts_ns);
-	VMCOREINFO_OFFSET(uts_namespace, name);
-	VMCOREINFO_SYMBOL(node_online_map);
-#ifdef CONFIG_MMU
-	VMCOREINFO_SYMBOL_ARRAY(swapper_pg_dir);
-#endif
-	VMCOREINFO_SYMBOL(_stext);
-	vmcoreinfo_append_str("NUMBER(VMALLOC_START)=0x%lx\n", (unsigned long) VMALLOC_START);
-
-#ifndef CONFIG_NUMA
-	VMCOREINFO_SYMBOL(mem_map);
-	VMCOREINFO_SYMBOL(contig_page_data);
-#endif
-#ifdef CONFIG_SPARSEMEM
-	VMCOREINFO_SYMBOL_ARRAY(mem_section);
-	VMCOREINFO_LENGTH(mem_section, NR_SECTION_ROOTS);
-	VMCOREINFO_STRUCT_SIZE(mem_section);
-	VMCOREINFO_OFFSET(mem_section, section_mem_map);
-	VMCOREINFO_NUMBER(SECTION_SIZE_BITS);
-	VMCOREINFO_NUMBER(MAX_PHYSMEM_BITS);
-#endif
-	VMCOREINFO_STRUCT_SIZE(page);
-	VMCOREINFO_STRUCT_SIZE(pglist_data);
-	VMCOREINFO_STRUCT_SIZE(zone);
-	VMCOREINFO_STRUCT_SIZE(free_area);
-	VMCOREINFO_STRUCT_SIZE(list_head);
-	VMCOREINFO_SIZE(nodemask_t);
-	VMCOREINFO_OFFSET(page, flags);
-	VMCOREINFO_OFFSET(page, _refcount);
-	VMCOREINFO_OFFSET(page, mapping);
-	VMCOREINFO_OFFSET(page, lru);
-	VMCOREINFO_OFFSET(page, _mapcount);
-	VMCOREINFO_OFFSET(page, private);
-	VMCOREINFO_OFFSET(page, compound_head);
-	VMCOREINFO_OFFSET(pglist_data, node_zones);
-	VMCOREINFO_OFFSET(pglist_data, nr_zones);
-#ifdef CONFIG_FLATMEM
-	VMCOREINFO_OFFSET(pglist_data, node_mem_map);
-#endif
-	VMCOREINFO_OFFSET(pglist_data, node_start_pfn);
-	VMCOREINFO_OFFSET(pglist_data, node_spanned_pages);
-	VMCOREINFO_OFFSET(pglist_data, node_id);
-	VMCOREINFO_OFFSET(zone, free_area);
-	VMCOREINFO_OFFSET(zone, vm_stat);
-	VMCOREINFO_OFFSET(zone, spanned_pages);
-	VMCOREINFO_OFFSET(free_area, free_list);
-	VMCOREINFO_OFFSET(list_head, next);
-	VMCOREINFO_OFFSET(list_head, prev);
-	VMCOREINFO_LENGTH(zone.free_area, NR_PAGE_ORDERS);
-	log_buf_vmcoreinfo_setup();
-	VMCOREINFO_LENGTH(free_area.free_list, MIGRATE_TYPES);
-	VMCOREINFO_NUMBER(NR_FREE_PAGES);
-	VMCOREINFO_NUMBER(PG_lru);
-	VMCOREINFO_NUMBER(PG_private);
-	VMCOREINFO_NUMBER(PG_swapcache);
-	VMCOREINFO_NUMBER(PG_swapbacked);
-	VMCOREINFO_NUMBER(PG_slab);
-#ifdef CONFIG_MEMORY_FAILURE
-	VMCOREINFO_NUMBER(PG_hwpoison);
-#endif
-	VMCOREINFO_NUMBER(PG_head_mask);
-#define PAGE_BUDDY_MAPCOUNT_VALUE	(~PG_buddy)
-	VMCOREINFO_NUMBER(PAGE_BUDDY_MAPCOUNT_VALUE);
-#ifdef CONFIG_HUGETLB_PAGE
-	VMCOREINFO_NUMBER(PG_hugetlb);
-#define PAGE_OFFLINE_MAPCOUNT_VALUE	(~PG_offline)
-	VMCOREINFO_NUMBER(PAGE_OFFLINE_MAPCOUNT_VALUE);
-#endif
-
-#ifdef CONFIG_KALLSYMS
-	VMCOREINFO_SYMBOL(kallsyms_names);
-	VMCOREINFO_SYMBOL(kallsyms_num_syms);
-	VMCOREINFO_SYMBOL(kallsyms_token_table);
-	VMCOREINFO_SYMBOL(kallsyms_token_index);
-#ifdef CONFIG_KALLSYMS_BASE_RELATIVE
-	VMCOREINFO_SYMBOL(kallsyms_offsets);
-	VMCOREINFO_SYMBOL(kallsyms_relative_base);
-#else
-	VMCOREINFO_SYMBOL(kallsyms_addresses);
-#endif /* CONFIG_KALLSYMS_BASE_RELATIVE */
-#endif /* CONFIG_KALLSYMS */
-
-	arch_crash_save_vmcoreinfo();
-	update_vmcoreinfo_note();
-
-	return 0;
-}
-
-subsys_initcall(crash_save_vmcoreinfo_init);
-
 static int __init crash_notes_memory_init(void)
 {
 	/* Allocate memory for saving cpu registers. */
diff --git a/kernel/ksysfs.c b/kernel/ksysfs.c
index 1d4bc493b2f4..11526fc42bc2 100644
--- a/kernel/ksysfs.c
+++ b/kernel/ksysfs.c
@@ -154,7 +154,7 @@ KERNEL_ATTR_RW(kexec_crash_size);
 
 #endif /* CONFIG_KEXEC_CORE */
 
-#ifdef CONFIG_CRASH_CORE
+#ifdef CONFIG_VMCORE_INFO
 
 static ssize_t vmcoreinfo_show(struct kobject *kobj,
 			       struct kobj_attribute *attr, char *buf)
@@ -177,7 +177,7 @@ KERNEL_ATTR_RO(crash_elfcorehdr_size);
 
 #endif
 
-#endif /* CONFIG_CRASH_CORE */
+#endif /* CONFIG_VMCORE_INFO */
 
 /* whether file capabilities are enabled */
 static ssize_t fscaps_show(struct kobject *kobj,
@@ -265,7 +265,7 @@ static struct attribute * kernel_attrs[] = {
 	&kexec_crash_loaded_attr.attr,
 	&kexec_crash_size_attr.attr,
 #endif
-#ifdef CONFIG_CRASH_CORE
+#ifdef CONFIG_VMCORE_INFO
 	&vmcoreinfo_attr.attr,
 #ifdef CONFIG_CRASH_HOTPLUG
 	&crash_elfcorehdr_size_attr.attr,
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index f2444b581e16..7d74b000b43a 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -34,7 +34,7 @@
 #include <linux/security.h>
 #include <linux/memblock.h>
 #include <linux/syscalls.h>
-#include <linux/crash_core.h>
+#include <linux/vmcore_info.h>
 #include <linux/ratelimit.h>
 #include <linux/kmsg_dump.h>
 #include <linux/syslog.h>
@@ -951,7 +951,7 @@ const struct file_operations kmsg_fops = {
 	.release = devkmsg_release,
 };
 
-#ifdef CONFIG_CRASH_CORE
+#ifdef CONFIG_VMCORE_INFO
 /*
  * This appends the listed symbols to /proc/vmcore
  *
diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
new file mode 100644
index 000000000000..8f48c0a42e2e
--- /dev/null
+++ b/kernel/vmcore_info.c
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * crash.c - kernel crash support code.
+ * Copyright (C) 2002-2004 Eric Biederman  <ebiederm@xmission.com>
+ */
+
+#include <linux/buildid.h>
+#include <linux/init.h>
+#include <linux/utsname.h>
+#include <linux/vmalloc.h>
+#include <linux/sizes.h>
+#include <linux/kexec.h>
+#include <linux/memory.h>
+#include <linux/cpuhotplug.h>
+#include <linux/memblock.h>
+#include <linux/kexec.h>
+#include <linux/kmemleak.h>
+
+#include <asm/page.h>
+#include <asm/sections.h>
+
+#include <crypto/sha1.h>
+
+#include "kallsyms_internal.h"
+#include "kexec_internal.h"
+
+/* vmcoreinfo stuff */
+unsigned char *vmcoreinfo_data;
+size_t vmcoreinfo_size;
+u32 *vmcoreinfo_note;
+
+/* trusted vmcoreinfo, e.g. we can make a copy in the crash memory */
+static unsigned char *vmcoreinfo_data_safecopy;
+
+Elf_Word *append_elf_note(Elf_Word *buf, char *name, unsigned int type,
+			  void *data, size_t data_len)
+{
+	struct elf_note *note = (struct elf_note *)buf;
+
+	note->n_namesz = strlen(name) + 1;
+	note->n_descsz = data_len;
+	note->n_type   = type;
+	buf += DIV_ROUND_UP(sizeof(*note), sizeof(Elf_Word));
+	memcpy(buf, name, note->n_namesz);
+	buf += DIV_ROUND_UP(note->n_namesz, sizeof(Elf_Word));
+	memcpy(buf, data, data_len);
+	buf += DIV_ROUND_UP(data_len, sizeof(Elf_Word));
+
+	return buf;
+}
+
+void final_note(Elf_Word *buf)
+{
+	memset(buf, 0, sizeof(struct elf_note));
+}
+
+static void update_vmcoreinfo_note(void)
+{
+	u32 *buf = vmcoreinfo_note;
+
+	if (!vmcoreinfo_size)
+		return;
+	buf = append_elf_note(buf, VMCOREINFO_NOTE_NAME, 0, vmcoreinfo_data,
+			      vmcoreinfo_size);
+	final_note(buf);
+}
+
+void crash_update_vmcoreinfo_safecopy(void *ptr)
+{
+	if (ptr)
+		memcpy(ptr, vmcoreinfo_data, vmcoreinfo_size);
+
+	vmcoreinfo_data_safecopy = ptr;
+}
+
+void crash_save_vmcoreinfo(void)
+{
+	if (!vmcoreinfo_note)
+		return;
+
+	/* Use the safe copy to generate vmcoreinfo note if have */
+	if (vmcoreinfo_data_safecopy)
+		vmcoreinfo_data = vmcoreinfo_data_safecopy;
+
+	vmcoreinfo_append_str("CRASHTIME=%lld\n", ktime_get_real_seconds());
+	update_vmcoreinfo_note();
+}
+
+void vmcoreinfo_append_str(const char *fmt, ...)
+{
+	va_list args;
+	char buf[0x50];
+	size_t r;
+
+	va_start(args, fmt);
+	r = vscnprintf(buf, sizeof(buf), fmt, args);
+	va_end(args);
+
+	r = min(r, (size_t)VMCOREINFO_BYTES - vmcoreinfo_size);
+
+	memcpy(&vmcoreinfo_data[vmcoreinfo_size], buf, r);
+
+	vmcoreinfo_size += r;
+
+	WARN_ONCE(vmcoreinfo_size == VMCOREINFO_BYTES,
+		  "vmcoreinfo data exceeds allocated size, truncating");
+}
+
+/*
+ * provide an empty default implementation here -- architecture
+ * code may override this
+ */
+void __weak arch_crash_save_vmcoreinfo(void)
+{}
+
+phys_addr_t __weak paddr_vmcoreinfo_note(void)
+{
+	return __pa(vmcoreinfo_note);
+}
+EXPORT_SYMBOL(paddr_vmcoreinfo_note);
+
+static int __init crash_save_vmcoreinfo_init(void)
+{
+	vmcoreinfo_data = (unsigned char *)get_zeroed_page(GFP_KERNEL);
+	if (!vmcoreinfo_data) {
+		pr_warn("Memory allocation for vmcoreinfo_data failed\n");
+		return -ENOMEM;
+	}
+
+	vmcoreinfo_note = alloc_pages_exact(VMCOREINFO_NOTE_SIZE,
+						GFP_KERNEL | __GFP_ZERO);
+	if (!vmcoreinfo_note) {
+		free_page((unsigned long)vmcoreinfo_data);
+		vmcoreinfo_data = NULL;
+		pr_warn("Memory allocation for vmcoreinfo_note failed\n");
+		return -ENOMEM;
+	}
+
+	VMCOREINFO_OSRELEASE(init_uts_ns.name.release);
+	VMCOREINFO_BUILD_ID();
+	VMCOREINFO_PAGESIZE(PAGE_SIZE);
+
+	VMCOREINFO_SYMBOL(init_uts_ns);
+	VMCOREINFO_OFFSET(uts_namespace, name);
+	VMCOREINFO_SYMBOL(node_online_map);
+#ifdef CONFIG_MMU
+	VMCOREINFO_SYMBOL_ARRAY(swapper_pg_dir);
+#endif
+	VMCOREINFO_SYMBOL(_stext);
+	vmcoreinfo_append_str("NUMBER(VMALLOC_START)=0x%lx\n", (unsigned long) VMALLOC_START);
+
+#ifndef CONFIG_NUMA
+	VMCOREINFO_SYMBOL(mem_map);
+	VMCOREINFO_SYMBOL(contig_page_data);
+#endif
+#ifdef CONFIG_SPARSEMEM
+	VMCOREINFO_SYMBOL_ARRAY(mem_section);
+	VMCOREINFO_LENGTH(mem_section, NR_SECTION_ROOTS);
+	VMCOREINFO_STRUCT_SIZE(mem_section);
+	VMCOREINFO_OFFSET(mem_section, section_mem_map);
+	VMCOREINFO_NUMBER(SECTION_SIZE_BITS);
+	VMCOREINFO_NUMBER(MAX_PHYSMEM_BITS);
+#endif
+	VMCOREINFO_STRUCT_SIZE(page);
+	VMCOREINFO_STRUCT_SIZE(pglist_data);
+	VMCOREINFO_STRUCT_SIZE(zone);
+	VMCOREINFO_STRUCT_SIZE(free_area);
+	VMCOREINFO_STRUCT_SIZE(list_head);
+	VMCOREINFO_SIZE(nodemask_t);
+	VMCOREINFO_OFFSET(page, flags);
+	VMCOREINFO_OFFSET(page, _refcount);
+	VMCOREINFO_OFFSET(page, mapping);
+	VMCOREINFO_OFFSET(page, lru);
+	VMCOREINFO_OFFSET(page, _mapcount);
+	VMCOREINFO_OFFSET(page, private);
+	VMCOREINFO_OFFSET(page, compound_head);
+	VMCOREINFO_OFFSET(pglist_data, node_zones);
+	VMCOREINFO_OFFSET(pglist_data, nr_zones);
+#ifdef CONFIG_FLATMEM
+	VMCOREINFO_OFFSET(pglist_data, node_mem_map);
+#endif
+	VMCOREINFO_OFFSET(pglist_data, node_start_pfn);
+	VMCOREINFO_OFFSET(pglist_data, node_spanned_pages);
+	VMCOREINFO_OFFSET(pglist_data, node_id);
+	VMCOREINFO_OFFSET(zone, free_area);
+	VMCOREINFO_OFFSET(zone, vm_stat);
+	VMCOREINFO_OFFSET(zone, spanned_pages);
+	VMCOREINFO_OFFSET(free_area, free_list);
+	VMCOREINFO_OFFSET(list_head, next);
+	VMCOREINFO_OFFSET(list_head, prev);
+	VMCOREINFO_LENGTH(zone.free_area, NR_PAGE_ORDERS);
+	log_buf_vmcoreinfo_setup();
+	VMCOREINFO_LENGTH(free_area.free_list, MIGRATE_TYPES);
+	VMCOREINFO_NUMBER(NR_FREE_PAGES);
+	VMCOREINFO_NUMBER(PG_lru);
+	VMCOREINFO_NUMBER(PG_private);
+	VMCOREINFO_NUMBER(PG_swapcache);
+	VMCOREINFO_NUMBER(PG_swapbacked);
+	VMCOREINFO_NUMBER(PG_slab);
+#ifdef CONFIG_MEMORY_FAILURE
+	VMCOREINFO_NUMBER(PG_hwpoison);
+#endif
+	VMCOREINFO_NUMBER(PG_head_mask);
+#define PAGE_BUDDY_MAPCOUNT_VALUE	(~PG_buddy)
+	VMCOREINFO_NUMBER(PAGE_BUDDY_MAPCOUNT_VALUE);
+#ifdef CONFIG_HUGETLB_PAGE
+	VMCOREINFO_NUMBER(PG_hugetlb);
+#define PAGE_OFFLINE_MAPCOUNT_VALUE	(~PG_offline)
+	VMCOREINFO_NUMBER(PAGE_OFFLINE_MAPCOUNT_VALUE);
+#endif
+
+#ifdef CONFIG_KALLSYMS
+	VMCOREINFO_SYMBOL(kallsyms_names);
+	VMCOREINFO_SYMBOL(kallsyms_num_syms);
+	VMCOREINFO_SYMBOL(kallsyms_token_table);
+	VMCOREINFO_SYMBOL(kallsyms_token_index);
+#ifdef CONFIG_KALLSYMS_BASE_RELATIVE
+	VMCOREINFO_SYMBOL(kallsyms_offsets);
+	VMCOREINFO_SYMBOL(kallsyms_relative_base);
+#else
+	VMCOREINFO_SYMBOL(kallsyms_addresses);
+#endif /* CONFIG_KALLSYMS_BASE_RELATIVE */
+#endif /* CONFIG_KALLSYMS */
+
+	arch_crash_save_vmcoreinfo();
+	update_vmcoreinfo_note();
+
+	return 0;
+}
+
+subsys_initcall(crash_save_vmcoreinfo_init);
diff --git a/lib/buildid.c b/lib/buildid.c
index e3a7acdeef0e..3e6868c86b45 100644
--- a/lib/buildid.c
+++ b/lib/buildid.c
@@ -174,7 +174,7 @@ int build_id_parse_buf(const void *buf, unsigned char *build_id, u32 buf_size)
 	return parse_build_id_buf(build_id, NULL, buf, buf_size);
 }
 
-#if IS_ENABLED(CONFIG_STACKTRACE_BUILD_ID) || IS_ENABLED(CONFIG_CRASH_CORE)
+#if IS_ENABLED(CONFIG_STACKTRACE_BUILD_ID) || IS_ENABLED(CONFIG_VMCORE_INFO)
 unsigned char vmlinux_build_id[BUILD_ID_SIZE_MAX] __ro_after_init;
 
 /**
-- 
2.41.0

