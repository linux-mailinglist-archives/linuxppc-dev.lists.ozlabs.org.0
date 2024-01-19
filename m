Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80660832C00
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 15:59:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PO96abV3;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UaQ9bXjF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGjS22nmsz3dC2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 01:58:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PO96abV3;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UaQ9bXjF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGjL32tydz3cP7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jan 2024 01:53:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705676024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mXutH6nMiiYvXWsHK3Zzjdb+v7CRXJKap85iSD6yYuk=;
	b=PO96abV3TaLyahroU0TAvitOIQ3z3vzXYqujikjphmGtc2b/hi1lwM7/ZhsorAPKITUyvE
	SdtHpiZPnxvYSepXw4cpl8ekGjDAc+zNb6/ZqwixeQUpZqGW0jYj74Zmh3yuUQ1A4h43+n
	4+yv5ndjBbDKmniupEKAwNUSg59S6oA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705676025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mXutH6nMiiYvXWsHK3Zzjdb+v7CRXJKap85iSD6yYuk=;
	b=UaQ9bXjFJg0KUiATjT9y4aE2t318YHAclU6C7km4f8s0CfJq8flnEA2q5zOsMPbPgVZ9uA
	HdXjlmj0w6kvVnvoM/2qbBeiw3ddyufYWNSmK+YQ2Ze0erNqrigACYyXwyF34QMAztqXT9
	6RvLHIDRxAyTQhITxaQfqhmv7op7SEo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-158-srDGVP4bO42I1nCXCEQh-w-1; Fri,
 19 Jan 2024 09:53:40 -0500
X-MC-Unique: srDGVP4bO42I1nCXCEQh-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E88D729AA385;
	Fri, 19 Jan 2024 14:53:39 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.4])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F8A05012;
	Fri, 19 Jan 2024 14:53:33 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/14] x86, crash: wrap crash dumping code into crash related ifdefs
Date: Fri, 19 Jan 2024 22:52:33 +0800
Message-ID: <20240119145241.769622-7-bhe@redhat.com>
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

Now crash codes under kernel/ folder has been split out from kexec
code, crash dumping can be separated from kexec reboot in config
items on x86 with some adjustments.

Here, also change some ifdefs or IS_ENABLED() check to more appropriate
ones, e,g
 - #ifdef CONFIG_KEXEC_CORE -> #ifdef CONFIG_CRASH_DUMP
 - (!IS_ENABLED(CONFIG_KEXEC_CORE)) - > (!IS_ENABLED(CONFIG_CRASH_RESERVE))

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/x86/kernel/Makefile           | 4 ++--
 arch/x86/kernel/cpu/mshyperv.c     | 4 ++++
 arch/x86/kernel/kexec-bzimage64.c  | 4 ++++
 arch/x86/kernel/kvm.c              | 4 ++--
 arch/x86/kernel/machine_kexec_64.c | 3 +++
 arch/x86/kernel/reboot.c           | 2 +-
 arch/x86/kernel/setup.c            | 2 +-
 arch/x86/kernel/smp.c              | 2 +-
 arch/x86/xen/enlighten_hvm.c       | 4 ++++
 9 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 913d4022131e..3668b1edef2d 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -100,9 +100,9 @@ obj-$(CONFIG_TRACING)		+= trace.o
 obj-$(CONFIG_RETHOOK)		+= rethook.o
 obj-$(CONFIG_VMCORE_INFO)	+= vmcore_info_$(BITS).o
 obj-$(CONFIG_KEXEC_CORE)	+= machine_kexec_$(BITS).o
-obj-$(CONFIG_KEXEC_CORE)	+= relocate_kernel_$(BITS).o crash.o
+obj-$(CONFIG_KEXEC_CORE)	+= relocate_kernel_$(BITS).o
 obj-$(CONFIG_KEXEC_FILE)	+= kexec-bzimage64.o
-obj-$(CONFIG_CRASH_DUMP)	+= crash_dump_$(BITS).o
+obj-$(CONFIG_CRASH_DUMP)	+= crash_dump_$(BITS).o crash.o
 obj-y				+= kprobes/
 obj-$(CONFIG_MODULES)		+= module.o
 obj-$(CONFIG_X86_32)		+= doublefault_32.o
diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index 01fa06dd06b6..f8163a59026b 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -210,6 +210,7 @@ static void hv_machine_shutdown(void)
 		hyperv_cleanup();
 }
 
+#ifdef CONFIG_CRASH_DUMP
 static void hv_machine_crash_shutdown(struct pt_regs *regs)
 {
 	if (hv_crash_handler)
@@ -221,6 +222,7 @@ static void hv_machine_crash_shutdown(struct pt_regs *regs)
 	/* Disable the hypercall page when there is only 1 active CPU. */
 	hyperv_cleanup();
 }
+#endif
 #endif /* CONFIG_KEXEC_CORE */
 #endif /* CONFIG_HYPERV */
 
@@ -497,7 +499,9 @@ static void __init ms_hyperv_init_platform(void)
 
 #if IS_ENABLED(CONFIG_HYPERV) && defined(CONFIG_KEXEC_CORE)
 	machine_ops.shutdown = hv_machine_shutdown;
+#ifdef CONFIG_CRASH_DUMP
 	machine_ops.crash_shutdown = hv_machine_crash_shutdown;
+#endif
 #endif
 	if (ms_hyperv.features & HV_ACCESS_TSC_INVARIANT) {
 		/*
diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
index 2a422e00ed4b..b55737b83a84 100644
--- a/arch/x86/kernel/kexec-bzimage64.c
+++ b/arch/x86/kernel/kexec-bzimage64.c
@@ -263,11 +263,13 @@ setup_boot_parameters(struct kimage *image, struct boot_params *params,
 	memset(&params->hd0_info, 0, sizeof(params->hd0_info));
 	memset(&params->hd1_info, 0, sizeof(params->hd1_info));
 
+#ifdef CONFIG_CRASH_DUMP
 	if (image->type == KEXEC_TYPE_CRASH) {
 		ret = crash_setup_memmap_entries(image, params);
 		if (ret)
 			return ret;
 	} else
+#endif
 		setup_e820_entries(params);
 
 	nr_e820_entries = params->e820_entries;
@@ -433,12 +435,14 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
 		return ERR_PTR(-EINVAL);
 	}
 
+#ifdef CONFIG_CRASH_DUMP
 	/* Allocate and load backup region */
 	if (image->type == KEXEC_TYPE_CRASH) {
 		ret = crash_load_segments(image);
 		if (ret)
 			return ERR_PTR(ret);
 	}
+#endif
 
 	/*
 	 * Load purgatory. For 64bit entry point, purgatory  code can be
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index dfe9945b9bec..acfc2d3183bc 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -769,7 +769,7 @@ static struct notifier_block kvm_pv_reboot_nb = {
  * won't be valid. In cases like kexec, in which you install a new kernel, this
  * means a random memory location will be kept being written.
  */
-#ifdef CONFIG_KEXEC_CORE
+#ifdef CONFIG_CRASH_DUMP
 static void kvm_crash_shutdown(struct pt_regs *regs)
 {
 	kvm_guest_cpu_offline(true);
@@ -852,7 +852,7 @@ static void __init kvm_guest_init(void)
 	kvm_guest_cpu_init();
 #endif
 
-#ifdef CONFIG_KEXEC_CORE
+#ifdef CONFIG_CRASH_DUMP
 	machine_ops.crash_shutdown = kvm_crash_shutdown;
 #endif
 
diff --git a/arch/x86/kernel/machine_kexec_64.c b/arch/x86/kernel/machine_kexec_64.c
index bc0a5348b4a6..b180d8e497c3 100644
--- a/arch/x86/kernel/machine_kexec_64.c
+++ b/arch/x86/kernel/machine_kexec_64.c
@@ -508,6 +508,8 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 #endif /* CONFIG_KEXEC_FILE */
 
+#ifdef CONFIG_CRASH_DUMP
+
 static int
 kexec_mark_range(unsigned long start, unsigned long end, bool protect)
 {
@@ -552,6 +554,7 @@ void arch_kexec_unprotect_crashkres(void)
 {
 	kexec_mark_crashkres(false);
 }
+#endif
 
 /*
  * During a traditional boot under SME, SME will encrypt the kernel,
diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index 830425e6d38e..1287b0d5962f 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -796,7 +796,7 @@ struct machine_ops machine_ops __ro_after_init = {
 	.emergency_restart = native_machine_emergency_restart,
 	.restart = native_machine_restart,
 	.halt = native_machine_halt,
-#ifdef CONFIG_KEXEC_CORE
+#ifdef CONFIG_CRASH_DUMP
 	.crash_shutdown = native_machine_crash_shutdown,
 #endif
 };
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 84201071dfac..899d839a2954 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -471,7 +471,7 @@ static void __init arch_reserve_crashkernel(void)
 	bool high = false;
 	int ret;
 
-	if (!IS_ENABLED(CONFIG_KEXEC_CORE))
+	if (!IS_ENABLED(CONFIG_CRASH_RESERVE))
 		return;
 
 	ret = parse_crashkernel(cmdline, memblock_phys_mem_size(),
diff --git a/arch/x86/kernel/smp.c b/arch/x86/kernel/smp.c
index 96a771f9f930..52c3823b7211 100644
--- a/arch/x86/kernel/smp.c
+++ b/arch/x86/kernel/smp.c
@@ -282,7 +282,7 @@ struct smp_ops smp_ops = {
 	.smp_cpus_done		= native_smp_cpus_done,
 
 	.stop_other_cpus	= native_stop_other_cpus,
-#if defined(CONFIG_KEXEC_CORE)
+#if defined(CONFIG_CRASH_DUMP)
 	.crash_stop_other_cpus	= kdump_nmi_shootdown_cpus,
 #endif
 	.smp_send_reschedule	= native_smp_send_reschedule,
diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index 3f8c34707c50..09e3db7ff990 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -149,12 +149,14 @@ static void xen_hvm_shutdown(void)
 		xen_reboot(SHUTDOWN_soft_reset);
 }
 
+#ifdef CONFIG_CRASH_DUMP
 static void xen_hvm_crash_shutdown(struct pt_regs *regs)
 {
 	native_machine_crash_shutdown(regs);
 	xen_reboot(SHUTDOWN_soft_reset);
 }
 #endif
+#endif
 
 static int xen_cpu_up_prepare_hvm(unsigned int cpu)
 {
@@ -236,8 +238,10 @@ static void __init xen_hvm_guest_init(void)
 
 #ifdef CONFIG_KEXEC_CORE
 	machine_ops.shutdown = xen_hvm_shutdown;
+#ifdef CONFIG_CRASH_DUMP
 	machine_ops.crash_shutdown = xen_hvm_crash_shutdown;
 #endif
+#endif
 }
 
 static __init int xen_parse_nopv(char *arg)
-- 
2.41.0

