Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B88832BF7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 15:57:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ti0WaV9a;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ti0WaV9a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGjQ402mHz3cX9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 01:57:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ti0WaV9a;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ti0WaV9a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGjKn5rRvz3c5j
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jan 2024 01:53:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705676011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qOsO/Lf7sVxy4fhdSPqohLoRNhvM4CLG9JfiEjyNKTw=;
	b=Ti0WaV9a2lWUe/MuFQwlT/X9zSVFMMgQXh8gP8/3HTE5fyS7UV0Dbn0CRQUqKMbZgvzl5E
	iJ4h/1myBqkenPHGKVDWO2Vnt3kLznidY5pfwYiymnx+cGzXEefFZC588o89daQwNvLUJe
	O+rCkr6txo0bAgtp/YFGcHoLpvG00Vs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705676011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qOsO/Lf7sVxy4fhdSPqohLoRNhvM4CLG9JfiEjyNKTw=;
	b=Ti0WaV9a2lWUe/MuFQwlT/X9zSVFMMgQXh8gP8/3HTE5fyS7UV0Dbn0CRQUqKMbZgvzl5E
	iJ4h/1myBqkenPHGKVDWO2Vnt3kLznidY5pfwYiymnx+cGzXEefFZC588o89daQwNvLUJe
	O+rCkr6txo0bAgtp/YFGcHoLpvG00Vs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-677-bMRp3DFdOPqN7YAziA51gw-1; Fri,
 19 Jan 2024 09:53:27 -0500
X-MC-Unique: bMRp3DFdOPqN7YAziA51gw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE52A3C025B8;
	Fri, 19 Jan 2024 14:53:25 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.4])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 88F5251D5;
	Fri, 19 Jan 2024 14:53:19 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/14] crash: split crash dumping code out from kexec_core.c
Date: Fri, 19 Jan 2024 22:52:31 +0800
Message-ID: <20240119145241.769622-5-bhe@redhat.com>
In-Reply-To: <20240119145241.769622-1-bhe@redhat.com>
References: <20240119145241.769622-1-bhe@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

Currently, KEXEC_CORE select CRASH_CORE automatically because crash codes
need be built in to avoid compiling error when building kexec code even
though the crash dumping functionality is not enabled. E.g
--------------------
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_KEXEC=y
CONFIG_KEXEC_FILE=y
---------------------

After splitting out crashkernel reservation code and vmcoreinfo exporting
code, there's only crash related code left in kernel/crash_core.c. Now
move crash related codes from kexec_core.c to crash_core.c and only build it
in when CONFIG_CRASH_DUMP=y.

And also wrap up crash codes inside CONFIG_CRASH_DUMP ifdeffery scope,
or replace inappropriate CONFIG_KEXEC_CORE ifdef with CONFIG_CRASH_DUMP
ifdef in generic kernel files.

With these changes, crash_core codes are abstracted from kexec codes and
can be disabled at all if only kexec reboot feature is wanted.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 drivers/base/cpu.c         |   6 +-
 include/linux/crash_core.h |  61 +++++++++
 include/linux/kexec.h      |  45 +------
 init/initramfs.c           |   2 +-
 kernel/Makefile            |   3 +-
 kernel/crash_core.c        | 256 +++++++++++++++++++++++++++++++++++++
 kernel/kexec.c             |  11 +-
 kernel/kexec_core.c        | 250 ++----------------------------------
 kernel/kexec_file.c        |  13 +-
 kernel/ksysfs.c            |   4 +
 10 files changed, 359 insertions(+), 292 deletions(-)

diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index 47de0f140ba6..b621a0fc75e1 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -144,7 +144,7 @@ static DEVICE_ATTR(release, S_IWUSR, NULL, cpu_release_store);
 #endif /* CONFIG_ARCH_CPU_PROBE_RELEASE */
 #endif /* CONFIG_HOTPLUG_CPU */
 
-#ifdef CONFIG_KEXEC_CORE
+#ifdef CONFIG_CRASH_DUMP
 #include <linux/kexec.h>
 
 static ssize_t crash_notes_show(struct device *dev,
@@ -189,14 +189,14 @@ static const struct attribute_group crash_note_cpu_attr_group = {
 #endif
 
 static const struct attribute_group *common_cpu_attr_groups[] = {
-#ifdef CONFIG_KEXEC_CORE
+#ifdef CONFIG_CRASH_DUMP
 	&crash_note_cpu_attr_group,
 #endif
 	NULL
 };
 
 static const struct attribute_group *hotplugable_cpu_attr_groups[] = {
-#ifdef CONFIG_KEXEC_CORE
+#ifdef CONFIG_CRASH_DUMP
 	&crash_note_cpu_attr_group,
 #endif
 	NULL
diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index 7f19f62018ef..23270b16e1db 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -6,6 +6,48 @@
 #include <linux/elfcore.h>
 #include <linux/elf.h>
 
+struct kimage;
+
+#ifdef CONFIG_CRASH_DUMP
+
+int crash_shrink_memory(unsigned long new_size);
+ssize_t crash_get_memory_size(void);
+
+#ifndef arch_kexec_protect_crashkres
+/*
+ * Protection mechanism for crashkernel reserved memory after
+ * the kdump kernel is loaded.
+ *
+ * Provide an empty default implementation here -- architecture
+ * code may override this
+ */
+static inline void arch_kexec_protect_crashkres(void) { }
+#endif
+
+#ifndef arch_kexec_unprotect_crashkres
+static inline void arch_kexec_unprotect_crashkres(void) { }
+#endif
+
+
+
+#ifndef arch_crash_handle_hotplug_event
+static inline void arch_crash_handle_hotplug_event(struct kimage *image) { }
+#endif
+
+int crash_check_update_elfcorehdr(void);
+
+#ifndef crash_hotplug_cpu_support
+static inline int crash_hotplug_cpu_support(void) { return 0; }
+#endif
+
+#ifndef crash_hotplug_memory_support
+static inline int crash_hotplug_memory_support(void) { return 0; }
+#endif
+
+#ifndef crash_get_elfcorehdr_size
+static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
+#endif
+
 /* Alignment required for elf header segment */
 #define ELF_CORE_HEADER_ALIGN   4096
 
@@ -31,4 +73,23 @@ struct kexec_segment;
 #define KEXEC_CRASH_HP_REMOVE_MEMORY		4
 #define KEXEC_CRASH_HP_INVALID_CPU		-1U
 
+extern void __crash_kexec(struct pt_regs *regs);
+extern void crash_kexec(struct pt_regs *regs);
+int kexec_should_crash(struct task_struct *p);
+int kexec_crash_loaded(void);
+void crash_save_cpu(struct pt_regs *regs, int cpu);
+extern int kimage_crash_copy_vmcoreinfo(struct kimage *image);
+
+#else /* !CONFIG_CRASH_DUMP*/
+struct pt_regs;
+struct task_struct;
+struct kimage;
+static inline void __crash_kexec(struct pt_regs *regs) { }
+static inline void crash_kexec(struct pt_regs *regs) { }
+static inline int kexec_should_crash(struct task_struct *p) { return 0; }
+static inline int kexec_crash_loaded(void) { return 0; }
+static inline void crash_save_cpu(struct pt_regs *regs, int cpu) {};
+static inline int kimage_crash_copy_vmcoreinfo(struct kimage *image) { return 0; };
+#endif /* CONFIG_CRASH_DUMP*/
+
 #endif /* LINUX_CRASH_CORE_H */
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 9c7bb8b56ed6..060835bb82d5 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -15,7 +15,6 @@
 
 #if !defined(__ASSEMBLY__)
 
-#include <linux/crash_core.h>
 #include <linux/vmcore_info.h>
 #include <linux/crash_reserve.h>
 #include <asm/io.h>
@@ -33,6 +32,7 @@ extern note_buf_t __percpu *crash_notes;
 #include <linux/module.h>
 #include <linux/highmem.h>
 #include <asm/kexec.h>
+#include <linux/crash_core.h>
 
 /* Verify architecture specific macros are defined */
 
@@ -380,13 +380,6 @@ extern struct page *kimage_alloc_control_pages(struct kimage *image,
 static inline int machine_kexec_post_load(struct kimage *image) { return 0; }
 #endif
 
-extern void __crash_kexec(struct pt_regs *);
-extern void crash_kexec(struct pt_regs *);
-int kexec_should_crash(struct task_struct *);
-int kexec_crash_loaded(void);
-void crash_save_cpu(struct pt_regs *regs, int cpu);
-extern int kimage_crash_copy_vmcoreinfo(struct kimage *image);
-
 extern struct kimage *kexec_image;
 extern struct kimage *kexec_crash_image;
 
@@ -410,24 +403,6 @@ bool kexec_load_permitted(int kexec_image_type);
 /* flag to track if kexec reboot is in progress */
 extern bool kexec_in_progress;
 
-int crash_shrink_memory(unsigned long new_size);
-ssize_t crash_get_memory_size(void);
-
-#ifndef arch_kexec_protect_crashkres
-/*
- * Protection mechanism for crashkernel reserved memory after
- * the kdump kernel is loaded.
- *
- * Provide an empty default implementation here -- architecture
- * code may override this
- */
-static inline void arch_kexec_protect_crashkres(void) { }
-#endif
-
-#ifndef arch_kexec_unprotect_crashkres
-static inline void arch_kexec_unprotect_crashkres(void) { }
-#endif
-
 #ifndef page_to_boot_pfn
 static inline unsigned long page_to_boot_pfn(struct page *page)
 {
@@ -484,24 +459,6 @@ static inline int arch_kexec_post_alloc_pages(void *vaddr, unsigned int pages, g
 static inline void arch_kexec_pre_free_pages(void *vaddr, unsigned int pages) { }
 #endif
 
-#ifndef arch_crash_handle_hotplug_event
-static inline void arch_crash_handle_hotplug_event(struct kimage *image) { }
-#endif
-
-int crash_check_update_elfcorehdr(void);
-
-#ifndef crash_hotplug_cpu_support
-static inline int crash_hotplug_cpu_support(void) { return 0; }
-#endif
-
-#ifndef crash_hotplug_memory_support
-static inline int crash_hotplug_memory_support(void) { return 0; }
-#endif
-
-#ifndef crash_get_elfcorehdr_size
-static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
-#endif
-
 extern bool kexec_file_dbg_print;
 
 #define kexec_dprintk(fmt, ...)					\
diff --git a/init/initramfs.c b/init/initramfs.c
index 76deb48c38cb..6f095f54eec9 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -642,7 +642,7 @@ void __weak __init free_initrd_mem(unsigned long start, unsigned long end)
 			"initrd");
 }
 
-#ifdef CONFIG_KEXEC_CORE
+#ifdef CONFIG_CRASH_RESERVE
 static bool __init kexec_free_initrd(void)
 {
 	unsigned long crashk_start = (unsigned long)__va(crashk_res.start);
diff --git a/kernel/Makefile b/kernel/Makefile
index 35abc65e1f1a..3c13240dfc9f 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -70,7 +70,8 @@ obj-$(CONFIG_KALLSYMS_SELFTEST) += kallsyms_selftest.o
 obj-$(CONFIG_BSD_PROCESS_ACCT) += acct.o
 obj-$(CONFIG_VMCORE_INFO) += vmcore_info.o elfcorehdr.o
 obj-$(CONFIG_CRASH_RESERVE) += crash_reserve.o
-obj-$(CONFIG_KEXEC_CORE) += kexec_core.o crash_core.o
+obj-$(CONFIG_KEXEC_CORE) += kexec_core.o
+obj-$(CONFIG_CRASH_DUMP) += crash_core.o
 obj-$(CONFIG_KEXEC) += kexec.o
 obj-$(CONFIG_KEXEC_FILE) += kexec_file.o
 obj-$(CONFIG_KEXEC_ELF) += kexec_elf.o
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 2f4df1fe6f7a..78b5dc7cee3a 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -11,9 +11,14 @@
 #include <linux/sizes.h>
 #include <linux/kexec.h>
 #include <linux/memory.h>
+#include <linux/mm.h>
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
+#include <linux/crash_core.h>
+#include <linux/reboot.h>
+#include <linux/btf.h>
+#include <linux/objtool.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -26,6 +31,131 @@
 /* Per cpu memory for storing cpu states in case of system crash. */
 note_buf_t __percpu *crash_notes;
 
+#ifdef CONFIG_CRASH_DUMP
+
+int kimage_crash_copy_vmcoreinfo(struct kimage *image)
+{
+	struct page *vmcoreinfo_page;
+	void *safecopy;
+
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
+		return 0;
+	if (image->type != KEXEC_TYPE_CRASH)
+		return 0;
+
+	/*
+	 * For kdump, allocate one vmcoreinfo safe copy from the
+	 * crash memory. as we have arch_kexec_protect_crashkres()
+	 * after kexec syscall, we naturally protect it from write
+	 * (even read) access under kernel direct mapping. But on
+	 * the other hand, we still need to operate it when crash
+	 * happens to generate vmcoreinfo note, hereby we rely on
+	 * vmap for this purpose.
+	 */
+	vmcoreinfo_page = kimage_alloc_control_pages(image, 0);
+	if (!vmcoreinfo_page) {
+		pr_warn("Could not allocate vmcoreinfo buffer\n");
+		return -ENOMEM;
+	}
+	safecopy = vmap(&vmcoreinfo_page, 1, VM_MAP, PAGE_KERNEL);
+	if (!safecopy) {
+		pr_warn("Could not vmap vmcoreinfo buffer\n");
+		return -ENOMEM;
+	}
+
+	image->vmcoreinfo_data_copy = safecopy;
+	crash_update_vmcoreinfo_safecopy(safecopy);
+
+	return 0;
+}
+
+
+
+int kexec_should_crash(struct task_struct *p)
+{
+	/*
+	 * If crash_kexec_post_notifiers is enabled, don't run
+	 * crash_kexec() here yet, which must be run after panic
+	 * notifiers in panic().
+	 */
+	if (crash_kexec_post_notifiers)
+		return 0;
+	/*
+	 * There are 4 panic() calls in make_task_dead() path, each of which
+	 * corresponds to each of these 4 conditions.
+	 */
+	if (in_interrupt() || !p->pid || is_global_init(p) || panic_on_oops)
+		return 1;
+	return 0;
+}
+
+int kexec_crash_loaded(void)
+{
+	return !!kexec_crash_image;
+}
+EXPORT_SYMBOL_GPL(kexec_crash_loaded);
+
+/*
+ * No panic_cpu check version of crash_kexec().  This function is called
+ * only when panic_cpu holds the current CPU number; this is the only CPU
+ * which processes crash_kexec routines.
+ */
+void __noclone __crash_kexec(struct pt_regs *regs)
+{
+	/* Take the kexec_lock here to prevent sys_kexec_load
+	 * running on one cpu from replacing the crash kernel
+	 * we are using after a panic on a different cpu.
+	 *
+	 * If the crash kernel was not located in a fixed area
+	 * of memory the xchg(&kexec_crash_image) would be
+	 * sufficient.  But since I reuse the memory...
+	 */
+	if (kexec_trylock()) {
+		if (kexec_crash_image) {
+			struct pt_regs fixed_regs;
+
+			crash_setup_regs(&fixed_regs, regs);
+			crash_save_vmcoreinfo();
+			machine_crash_shutdown(&fixed_regs);
+			machine_kexec(kexec_crash_image);
+		}
+		kexec_unlock();
+	}
+}
+STACK_FRAME_NON_STANDARD(__crash_kexec);
+
+__bpf_kfunc void crash_kexec(struct pt_regs *regs)
+{
+	int old_cpu, this_cpu;
+
+	/*
+	 * Only one CPU is allowed to execute the crash_kexec() code as with
+	 * panic().  Otherwise parallel calls of panic() and crash_kexec()
+	 * may stop each other.  To exclude them, we use panic_cpu here too.
+	 */
+	old_cpu = PANIC_CPU_INVALID;
+	this_cpu = raw_smp_processor_id();
+
+	if (atomic_try_cmpxchg(&panic_cpu, &old_cpu, this_cpu)) {
+		/* This is the 1st CPU which comes here, so go ahead. */
+		__crash_kexec(regs);
+
+		/*
+		 * Reset panic_cpu to allow another panic()/crash_kexec()
+		 * call.
+		 */
+		atomic_set(&panic_cpu, PANIC_CPU_INVALID);
+	}
+}
+
+static inline resource_size_t crash_resource_size(const struct resource *res)
+{
+	return !res->end ? 0 : resource_size(res);
+}
+
+
+
+
 int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 			  void **addr, unsigned long *sz)
 {
@@ -187,6 +317,130 @@ int crash_exclude_mem_range(struct crash_mem *mem,
 	return 0;
 }
 
+ssize_t crash_get_memory_size(void)
+{
+	ssize_t size = 0;
+
+	if (!kexec_trylock())
+		return -EBUSY;
+
+	size += crash_resource_size(&crashk_res);
+	size += crash_resource_size(&crashk_low_res);
+
+	kexec_unlock();
+	return size;
+}
+
+static int __crash_shrink_memory(struct resource *old_res,
+				 unsigned long new_size)
+{
+	struct resource *ram_res;
+
+	ram_res = kzalloc(sizeof(*ram_res), GFP_KERNEL);
+	if (!ram_res)
+		return -ENOMEM;
+
+	ram_res->start = old_res->start + new_size;
+	ram_res->end   = old_res->end;
+	ram_res->flags = IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM;
+	ram_res->name  = "System RAM";
+
+	if (!new_size) {
+		release_resource(old_res);
+		old_res->start = 0;
+		old_res->end   = 0;
+	} else {
+		crashk_res.end = ram_res->start - 1;
+	}
+
+	crash_free_reserved_phys_range(ram_res->start, ram_res->end);
+	insert_resource(&iomem_resource, ram_res);
+
+	return 0;
+}
+
+int crash_shrink_memory(unsigned long new_size)
+{
+	int ret = 0;
+	unsigned long old_size, low_size;
+
+	if (!kexec_trylock())
+		return -EBUSY;
+
+	if (kexec_crash_image) {
+		ret = -ENOENT;
+		goto unlock;
+	}
+
+	low_size = crash_resource_size(&crashk_low_res);
+	old_size = crash_resource_size(&crashk_res) + low_size;
+	new_size = roundup(new_size, KEXEC_CRASH_MEM_ALIGN);
+	if (new_size >= old_size) {
+		ret = (new_size == old_size) ? 0 : -EINVAL;
+		goto unlock;
+	}
+
+	/*
+	 * (low_size > new_size) implies that low_size is greater than zero.
+	 * This also means that if low_size is zero, the else branch is taken.
+	 *
+	 * If low_size is greater than 0, (low_size > new_size) indicates that
+	 * crashk_low_res also needs to be shrunken. Otherwise, only crashk_res
+	 * needs to be shrunken.
+	 */
+	if (low_size > new_size) {
+		ret = __crash_shrink_memory(&crashk_res, 0);
+		if (ret)
+			goto unlock;
+
+		ret = __crash_shrink_memory(&crashk_low_res, new_size);
+	} else {
+		ret = __crash_shrink_memory(&crashk_res, new_size - low_size);
+	}
+
+	/* Swap crashk_res and crashk_low_res if needed */
+	if (!crashk_res.end && crashk_low_res.end) {
+		crashk_res.start = crashk_low_res.start;
+		crashk_res.end   = crashk_low_res.end;
+		release_resource(&crashk_low_res);
+		crashk_low_res.start = 0;
+		crashk_low_res.end   = 0;
+		insert_resource(&iomem_resource, &crashk_res);
+	}
+
+unlock:
+	kexec_unlock();
+	return ret;
+}
+
+void crash_save_cpu(struct pt_regs *regs, int cpu)
+{
+	struct elf_prstatus prstatus;
+	u32 *buf;
+
+	if ((cpu < 0) || (cpu >= nr_cpu_ids))
+		return;
+
+	/* Using ELF notes here is opportunistic.
+	 * I need a well defined structure format
+	 * for the data I pass, and I need tags
+	 * on the data to indicate what information I have
+	 * squirrelled away.  ELF notes happen to provide
+	 * all of that, so there is no need to invent something new.
+	 */
+	buf = (u32 *)per_cpu_ptr(crash_notes, cpu);
+	if (!buf)
+		return;
+	memset(&prstatus, 0, sizeof(prstatus));
+	prstatus.common.pr_pid = current->pid;
+	elf_core_copy_regs(&prstatus.pr_reg, regs);
+	buf = append_elf_note(buf, KEXEC_CORE_NOTE_NAME, NT_PRSTATUS,
+			      &prstatus, sizeof(prstatus));
+	final_note(buf);
+}
+
+
+
 static int __init crash_notes_memory_init(void)
 {
 	/* Allocate memory for saving cpu registers. */
@@ -220,6 +474,8 @@ static int __init crash_notes_memory_init(void)
 }
 subsys_initcall(crash_notes_memory_init);
 
+#endif /*CONFIG_CRASH_DUMP*/
+
 #ifdef CONFIG_CRASH_HOTPLUG
 #undef pr_fmt
 #define pr_fmt(fmt) "crash hp: " fmt
diff --git a/kernel/kexec.c b/kernel/kexec.c
index 8f35a5a42af8..bab542fc1463 100644
--- a/kernel/kexec.c
+++ b/kernel/kexec.c
@@ -28,12 +28,14 @@ static int kimage_alloc_init(struct kimage **rimage, unsigned long entry,
 	struct kimage *image;
 	bool kexec_on_panic = flags & KEXEC_ON_CRASH;
 
+#ifdef CONFIG_CRASH_DUMP
 	if (kexec_on_panic) {
 		/* Verify we have a valid entry point */
 		if ((entry < phys_to_boot_phys(crashk_res.start)) ||
 		    (entry > phys_to_boot_phys(crashk_res.end)))
 			return -EADDRNOTAVAIL;
 	}
+#endif
 
 	/* Allocate and initialize a controlling structure */
 	image = do_kimage_alloc_init();
@@ -44,11 +46,13 @@ static int kimage_alloc_init(struct kimage **rimage, unsigned long entry,
 	image->nr_segments = nr_segments;
 	memcpy(image->segment, segments, nr_segments * sizeof(*segments));
 
+#ifdef CONFIG_CRASH_DUMP
 	if (kexec_on_panic) {
 		/* Enable special crash kernel control page alloc policy. */
 		image->control_page = crashk_res.start;
 		image->type = KEXEC_TYPE_CRASH;
 	}
+#endif
 
 	ret = sanity_check_segment_list(image);
 	if (ret)
@@ -99,13 +103,14 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
 	if (!kexec_trylock())
 		return -EBUSY;
 
+#ifdef CONFIG_CRASH_DUMP
 	if (flags & KEXEC_ON_CRASH) {
 		dest_image = &kexec_crash_image;
 		if (kexec_crash_image)
 			arch_kexec_unprotect_crashkres();
-	} else {
+	} else
+#endif
 		dest_image = &kexec_image;
-	}
 
 	if (nr_segments == 0) {
 		/* Uninstall image */
@@ -162,8 +167,10 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
 	image = xchg(dest_image, image);
 
 out:
+#ifdef CONFIG_CRASH_DUMP
 	if ((flags & KEXEC_ON_CRASH) && kexec_crash_image)
 		arch_kexec_protect_crashkres();
+#endif
 
 	kimage_free(image);
 out_unlock:
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index d08fc7b5db97..ce3429e7972c 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -54,30 +54,6 @@ bool kexec_in_progress = false;
 
 bool kexec_file_dbg_print;
 
-int kexec_should_crash(struct task_struct *p)
-{
-	/*
-	 * If crash_kexec_post_notifiers is enabled, don't run
-	 * crash_kexec() here yet, which must be run after panic
-	 * notifiers in panic().
-	 */
-	if (crash_kexec_post_notifiers)
-		return 0;
-	/*
-	 * There are 4 panic() calls in make_task_dead() path, each of which
-	 * corresponds to each of these 4 conditions.
-	 */
-	if (in_interrupt() || !p->pid || is_global_init(p) || panic_on_oops)
-		return 1;
-	return 0;
-}
-
-int kexec_crash_loaded(void)
-{
-	return !!kexec_crash_image;
-}
-EXPORT_SYMBOL_GPL(kexec_crash_loaded);
-
 /*
  * When kexec transitions to the new kernel there is a one-to-one
  * mapping between physical and virtual addresses.  On processors
@@ -209,6 +185,7 @@ int sanity_check_segment_list(struct kimage *image)
 	if (total_pages > nr_pages / 2)
 		return -EINVAL;
 
+#ifdef CONFIG_CRASH_DUMP
 	/*
 	 * Verify we have good destination addresses.  Normally
 	 * the caller is responsible for making certain we don't
@@ -231,6 +208,7 @@ int sanity_check_segment_list(struct kimage *image)
 				return -EADDRNOTAVAIL;
 		}
 	}
+#endif
 
 	return 0;
 }
@@ -403,6 +381,7 @@ static struct page *kimage_alloc_normal_control_pages(struct kimage *image,
 	return pages;
 }
 
+#ifdef CONFIG_CRASH_DUMP
 static struct page *kimage_alloc_crash_control_pages(struct kimage *image,
 						      unsigned int order)
 {
@@ -468,6 +447,7 @@ static struct page *kimage_alloc_crash_control_pages(struct kimage *image,
 
 	return pages;
 }
+#endif
 
 
 struct page *kimage_alloc_control_pages(struct kimage *image,
@@ -479,48 +459,16 @@ struct page *kimage_alloc_control_pages(struct kimage *image,
 	case KEXEC_TYPE_DEFAULT:
 		pages = kimage_alloc_normal_control_pages(image, order);
 		break;
+#ifdef CONFIG_CRASH_DUMP
 	case KEXEC_TYPE_CRASH:
 		pages = kimage_alloc_crash_control_pages(image, order);
 		break;
+#endif
 	}
 
 	return pages;
 }
 
-int kimage_crash_copy_vmcoreinfo(struct kimage *image)
-{
-	struct page *vmcoreinfo_page;
-	void *safecopy;
-
-	if (image->type != KEXEC_TYPE_CRASH)
-		return 0;
-
-	/*
-	 * For kdump, allocate one vmcoreinfo safe copy from the
-	 * crash memory. as we have arch_kexec_protect_crashkres()
-	 * after kexec syscall, we naturally protect it from write
-	 * (even read) access under kernel direct mapping. But on
-	 * the other hand, we still need to operate it when crash
-	 * happens to generate vmcoreinfo note, hereby we rely on
-	 * vmap for this purpose.
-	 */
-	vmcoreinfo_page = kimage_alloc_control_pages(image, 0);
-	if (!vmcoreinfo_page) {
-		pr_warn("Could not allocate vmcoreinfo buffer\n");
-		return -ENOMEM;
-	}
-	safecopy = vmap(&vmcoreinfo_page, 1, VM_MAP, PAGE_KERNEL);
-	if (!safecopy) {
-		pr_warn("Could not vmap vmcoreinfo buffer\n");
-		return -ENOMEM;
-	}
-
-	image->vmcoreinfo_data_copy = safecopy;
-	crash_update_vmcoreinfo_safecopy(safecopy);
-
-	return 0;
-}
-
 static int kimage_add_entry(struct kimage *image, kimage_entry_t entry)
 {
 	if (*image->entry != 0)
@@ -603,10 +551,12 @@ void kimage_free(struct kimage *image)
 	if (!image)
 		return;
 
+#ifdef CONFIG_CRASH_DUMP
 	if (image->vmcoreinfo_data_copy) {
 		crash_update_vmcoreinfo_safecopy(NULL);
 		vunmap(image->vmcoreinfo_data_copy);
 	}
+#endif
 
 	kimage_free_extra_pages(image);
 	for_each_kimage_entry(image, ptr, entry) {
@@ -824,6 +774,7 @@ static int kimage_load_normal_segment(struct kimage *image,
 	return result;
 }
 
+#ifdef CONFIG_CRASH_DUMP
 static int kimage_load_crash_segment(struct kimage *image,
 					struct kexec_segment *segment)
 {
@@ -891,6 +842,7 @@ static int kimage_load_crash_segment(struct kimage *image,
 out:
 	return result;
 }
+#endif
 
 int kimage_load_segment(struct kimage *image,
 				struct kexec_segment *segment)
@@ -901,9 +853,11 @@ int kimage_load_segment(struct kimage *image,
 	case KEXEC_TYPE_DEFAULT:
 		result = kimage_load_normal_segment(image, segment);
 		break;
+#ifdef CONFIG_CRASH_DUMP
 	case KEXEC_TYPE_CRASH:
 		result = kimage_load_crash_segment(image, segment);
 		break;
+#endif
 	}
 
 	return result;
@@ -1027,186 +981,6 @@ bool kexec_load_permitted(int kexec_image_type)
 	return true;
 }
 
-/*
- * No panic_cpu check version of crash_kexec().  This function is called
- * only when panic_cpu holds the current CPU number; this is the only CPU
- * which processes crash_kexec routines.
- */
-void __noclone __crash_kexec(struct pt_regs *regs)
-{
-	/* Take the kexec_lock here to prevent sys_kexec_load
-	 * running on one cpu from replacing the crash kernel
-	 * we are using after a panic on a different cpu.
-	 *
-	 * If the crash kernel was not located in a fixed area
-	 * of memory the xchg(&kexec_crash_image) would be
-	 * sufficient.  But since I reuse the memory...
-	 */
-	if (kexec_trylock()) {
-		if (kexec_crash_image) {
-			struct pt_regs fixed_regs;
-
-			crash_setup_regs(&fixed_regs, regs);
-			crash_save_vmcoreinfo();
-			machine_crash_shutdown(&fixed_regs);
-			machine_kexec(kexec_crash_image);
-		}
-		kexec_unlock();
-	}
-}
-STACK_FRAME_NON_STANDARD(__crash_kexec);
-
-__bpf_kfunc void crash_kexec(struct pt_regs *regs)
-{
-	int old_cpu, this_cpu;
-
-	/*
-	 * Only one CPU is allowed to execute the crash_kexec() code as with
-	 * panic().  Otherwise parallel calls of panic() and crash_kexec()
-	 * may stop each other.  To exclude them, we use panic_cpu here too.
-	 */
-	old_cpu = PANIC_CPU_INVALID;
-	this_cpu = raw_smp_processor_id();
-
-	if (atomic_try_cmpxchg(&panic_cpu, &old_cpu, this_cpu)) {
-		/* This is the 1st CPU which comes here, so go ahead. */
-		__crash_kexec(regs);
-
-		/*
-		 * Reset panic_cpu to allow another panic()/crash_kexec()
-		 * call.
-		 */
-		atomic_set(&panic_cpu, PANIC_CPU_INVALID);
-	}
-}
-
-static inline resource_size_t crash_resource_size(const struct resource *res)
-{
-	return !res->end ? 0 : resource_size(res);
-}
-
-ssize_t crash_get_memory_size(void)
-{
-	ssize_t size = 0;
-
-	if (!kexec_trylock())
-		return -EBUSY;
-
-	size += crash_resource_size(&crashk_res);
-	size += crash_resource_size(&crashk_low_res);
-
-	kexec_unlock();
-	return size;
-}
-
-static int __crash_shrink_memory(struct resource *old_res,
-				 unsigned long new_size)
-{
-	struct resource *ram_res;
-
-	ram_res = kzalloc(sizeof(*ram_res), GFP_KERNEL);
-	if (!ram_res)
-		return -ENOMEM;
-
-	ram_res->start = old_res->start + new_size;
-	ram_res->end   = old_res->end;
-	ram_res->flags = IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM;
-	ram_res->name  = "System RAM";
-
-	if (!new_size) {
-		release_resource(old_res);
-		old_res->start = 0;
-		old_res->end   = 0;
-	} else {
-		crashk_res.end = ram_res->start - 1;
-	}
-
-	crash_free_reserved_phys_range(ram_res->start, ram_res->end);
-	insert_resource(&iomem_resource, ram_res);
-
-	return 0;
-}
-
-int crash_shrink_memory(unsigned long new_size)
-{
-	int ret = 0;
-	unsigned long old_size, low_size;
-
-	if (!kexec_trylock())
-		return -EBUSY;
-
-	if (kexec_crash_image) {
-		ret = -ENOENT;
-		goto unlock;
-	}
-
-	low_size = crash_resource_size(&crashk_low_res);
-	old_size = crash_resource_size(&crashk_res) + low_size;
-	new_size = roundup(new_size, KEXEC_CRASH_MEM_ALIGN);
-	if (new_size >= old_size) {
-		ret = (new_size == old_size) ? 0 : -EINVAL;
-		goto unlock;
-	}
-
-	/*
-	 * (low_size > new_size) implies that low_size is greater than zero.
-	 * This also means that if low_size is zero, the else branch is taken.
-	 *
-	 * If low_size is greater than 0, (low_size > new_size) indicates that
-	 * crashk_low_res also needs to be shrunken. Otherwise, only crashk_res
-	 * needs to be shrunken.
-	 */
-	if (low_size > new_size) {
-		ret = __crash_shrink_memory(&crashk_res, 0);
-		if (ret)
-			goto unlock;
-
-		ret = __crash_shrink_memory(&crashk_low_res, new_size);
-	} else {
-		ret = __crash_shrink_memory(&crashk_res, new_size - low_size);
-	}
-
-	/* Swap crashk_res and crashk_low_res if needed */
-	if (!crashk_res.end && crashk_low_res.end) {
-		crashk_res.start = crashk_low_res.start;
-		crashk_res.end   = crashk_low_res.end;
-		release_resource(&crashk_low_res);
-		crashk_low_res.start = 0;
-		crashk_low_res.end   = 0;
-		insert_resource(&iomem_resource, &crashk_res);
-	}
-
-unlock:
-	kexec_unlock();
-	return ret;
-}
-
-void crash_save_cpu(struct pt_regs *regs, int cpu)
-{
-	struct elf_prstatus prstatus;
-	u32 *buf;
-
-	if ((cpu < 0) || (cpu >= nr_cpu_ids))
-		return;
-
-	/* Using ELF notes here is opportunistic.
-	 * I need a well defined structure format
-	 * for the data I pass, and I need tags
-	 * on the data to indicate what information I have
-	 * squirrelled away.  ELF notes happen to provide
-	 * all of that, so there is no need to invent something new.
-	 */
-	buf = (u32 *)per_cpu_ptr(crash_notes, cpu);
-	if (!buf)
-		return;
-	memset(&prstatus, 0, sizeof(prstatus));
-	prstatus.common.pr_pid = current->pid;
-	elf_core_copy_regs(&prstatus.pr_reg, regs);
-	buf = append_elf_note(buf, KEXEC_CORE_NOTE_NAME, NT_PRSTATUS,
-			      &prstatus, sizeof(prstatus));
-	final_note(buf);
-}
-
 /*
  * Move into place and start executing a preloaded standalone
  * executable.  If nothing was preloaded return an error.
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index bef2f6f2571b..ce7ce2ae27cd 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -285,11 +285,13 @@ kimage_file_alloc_init(struct kimage **rimage, int kernel_fd,
 	kexec_file_dbg_print = !!(flags & KEXEC_FILE_DEBUG);
 	image->file_mode = 1;
 
+#ifdef CONFIG_CRASH_DUMP
 	if (kexec_on_panic) {
 		/* Enable special crash kernel control page alloc policy. */
 		image->control_page = crashk_res.start;
 		image->type = KEXEC_TYPE_CRASH;
 	}
+#endif
 
 	ret = kimage_file_prepare_segments(image, kernel_fd, initrd_fd,
 					   cmdline_ptr, cmdline_len, flags);
@@ -349,13 +351,14 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
 	if (!kexec_trylock())
 		return -EBUSY;
 
+#ifdef CONFIG_CRASH_DUMP
 	if (image_type == KEXEC_TYPE_CRASH) {
 		dest_image = &kexec_crash_image;
 		if (kexec_crash_image)
 			arch_kexec_unprotect_crashkres();
-	} else {
+	} else
+#endif
 		dest_image = &kexec_image;
-	}
 
 	if (flags & KEXEC_FILE_UNLOAD)
 		goto exchange;
@@ -419,8 +422,10 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
 exchange:
 	image = xchg(dest_image, image);
 out:
+#ifdef CONFIG_CRASH_DUMP
 	if ((flags & KEXEC_FILE_ON_CRASH) && kexec_crash_image)
 		arch_kexec_protect_crashkres();
+#endif
 
 	kexec_unlock();
 	kimage_free(image);
@@ -595,12 +600,14 @@ static int kexec_walk_memblock(struct kexec_buf *kbuf,
 static int kexec_walk_resources(struct kexec_buf *kbuf,
 				int (*func)(struct resource *, void *))
 {
+#ifdef CONFIG_CRASH_DUMP
 	if (kbuf->image->type == KEXEC_TYPE_CRASH)
 		return walk_iomem_res_desc(crashk_res.desc,
 					   IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY,
 					   crashk_res.start, crashk_res.end,
 					   kbuf, func);
-	else if (kbuf->top_down)
+#endif
+	if (kbuf->top_down)
 		return walk_system_ram_res_rev(0, ULONG_MAX, kbuf, func);
 	else
 		return walk_system_ram_res(0, ULONG_MAX, kbuf, func);
diff --git a/kernel/ksysfs.c b/kernel/ksysfs.c
index 11526fc42bc2..fe7a517fc4ab 100644
--- a/kernel/ksysfs.c
+++ b/kernel/ksysfs.c
@@ -120,6 +120,7 @@ static ssize_t kexec_loaded_show(struct kobject *kobj,
 }
 KERNEL_ATTR_RO(kexec_loaded);
 
+#ifdef CONFIG_CRASH_DUMP
 static ssize_t kexec_crash_loaded_show(struct kobject *kobj,
 				       struct kobj_attribute *attr, char *buf)
 {
@@ -152,6 +153,7 @@ static ssize_t kexec_crash_size_store(struct kobject *kobj,
 }
 KERNEL_ATTR_RW(kexec_crash_size);
 
+#endif /* CONFIG_CRASH_DUMP*/
 #endif /* CONFIG_KEXEC_CORE */
 
 #ifdef CONFIG_VMCORE_INFO
@@ -262,9 +264,11 @@ static struct attribute * kernel_attrs[] = {
 #endif
 #ifdef CONFIG_KEXEC_CORE
 	&kexec_loaded_attr.attr,
+#ifdef CONFIG_CRASH_DUMP
 	&kexec_crash_loaded_attr.attr,
 	&kexec_crash_size_attr.attr,
 #endif
+#endif
 #ifdef CONFIG_VMCORE_INFO
 	&vmcoreinfo_attr.attr,
 #ifdef CONFIG_CRASH_HOTPLUG
-- 
2.41.0

