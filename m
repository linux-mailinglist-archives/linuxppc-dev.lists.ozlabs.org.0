Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 108105E8084
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 19:12:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYzH25C1wz3f4x
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 03:12:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=raLQQC9M;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=T8MLpD0M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=raLQQC9M;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=T8MLpD0M;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYzF73k5Fz3cDs
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Sep 2022 03:10:51 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id A442F219F6;
	Fri, 23 Sep 2022 17:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1663953048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xRNAJ6WoOj4XE/anYgf0uFQPiWuSiXd20sifVlYbfSI=;
	b=raLQQC9M+NzAUGzZFkbPA9XJ9mNXXka8R75/HBvzUQ6LQ1EqP2jMZKX8+PlAMp1JpqYoyz
	bmv4ymVMtZfRyBkOBVgAn4gQX2XCOBVQDNSmbfOhaZi5o9LkURAtoAgbQb2ikdKJw2pFkW
	bhLCtvOtcxJ/NMmn2OFi1H1a1blu4d4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1663953048;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xRNAJ6WoOj4XE/anYgf0uFQPiWuSiXd20sifVlYbfSI=;
	b=T8MLpD0MTfFbi3ordJMRqnganxXt+cxKyxAcaIYAdpQ5MCo4ULGuWBeEmaSCDpjS/I8xzy
	ciH2UhVi66W9CEAA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	by relay2.suse.de (Postfix) with ESMTP id 372302C15F;
	Fri, 23 Sep 2022 17:10:48 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 5.15 3/6] kexec: drop weak attribute from functions
Date: Fri, 23 Sep 2022 19:10:31 +0200
Message-Id: <bd917b12ca9d86bad38567fa3615dcc23de36c9c.1663951201.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1663951201.git.msuchanek@suse.de>
References: <cover.1663951201.git.msuchanek@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, "open list:S390" <linux-s390@vger.kernel.org>, Baoquan He <bhe@redhat.com>, "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>, Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Michal Suchanek <msuchanek@suse.de>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, "moderated list:ARM64 PORT AARCH64 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:KEXEC" <kexec@lists.infradead.org>, Eric Biederman <ebiederm@xmission.com>, Andrew Morton <akpm@linux-foundation.org>, "open list:
 LINUX FOR POWERPC 32-BIT AND 64-BIT" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>

commit 0738eceb6201691534df07e0928d0a6168a35787 upstream.

Drop __weak attribute from functions in kexec_core.c:
- machine_kexec_post_load()
- arch_kexec_protect_crashkres()
- arch_kexec_unprotect_crashkres()
- crash_free_reserved_phys_range()

Link: https://lkml.kernel.org/r/c0f6219e03cb399d166d518ab505095218a902dd.1656659357.git.naveen.n.rao@linux.vnet.ibm.com
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Suggested-by: Eric Biederman <ebiederm@xmission.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Mimi Zohar <zohar@linux.ibm.com>
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 arch/arm64/include/asm/kexec.h   | 18 ++++++++++++++++--
 arch/powerpc/include/asm/kexec.h |  5 +++++
 arch/s390/include/asm/kexec.h    | 11 +++++++++++
 arch/x86/include/asm/kexec.h     |  6 ++++++
 include/linux/kexec.h            | 32 ++++++++++++++++++++++++++++----
 kernel/kexec_core.c              | 27 ---------------------------
 6 files changed, 66 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/include/asm/kexec.h b/arch/arm64/include/asm/kexec.h
index 91d81824f869..ae3695a15610 100644
--- a/arch/arm64/include/asm/kexec.h
+++ b/arch/arm64/include/asm/kexec.h
@@ -84,12 +84,28 @@ static inline void crash_setup_regs(struct pt_regs *newregs,
 extern bool crash_is_nosave(unsigned long pfn);
 extern void crash_prepare_suspend(void);
 extern void crash_post_resume(void);
+
+void crash_free_reserved_phys_range(unsigned long begin, unsigned long end);
+#define crash_free_reserved_phys_range crash_free_reserved_phys_range
 #else
 static inline bool crash_is_nosave(unsigned long pfn) {return false; }
 static inline void crash_prepare_suspend(void) {}
 static inline void crash_post_resume(void) {}
 #endif
 
+struct kimage;
+
+#if defined(CONFIG_KEXEC_CORE)
+int machine_kexec_post_load(struct kimage *image);
+#define machine_kexec_post_load machine_kexec_post_load
+
+void arch_kexec_protect_crashkres(void);
+#define arch_kexec_protect_crashkres arch_kexec_protect_crashkres
+
+void arch_kexec_unprotect_crashkres(void);
+#define arch_kexec_unprotect_crashkres arch_kexec_unprotect_crashkres
+#endif
+
 #define ARCH_HAS_KIMAGE_ARCH
 
 struct kimage_arch {
@@ -101,8 +117,6 @@ struct kimage_arch {
 #ifdef CONFIG_KEXEC_FILE
 extern const struct kexec_file_ops kexec_image_ops;
 
-struct kimage;
-
 int arch_kimage_file_post_load_cleanup(struct kimage *image);
 #define arch_kimage_file_post_load_cleanup arch_kimage_file_post_load_cleanup
 
diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 6152fa220054..d8394e77e987 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -97,6 +97,11 @@ static inline bool kdump_in_progress(void)
 void relocate_new_kernel(unsigned long indirection_page, unsigned long reboot_code_buffer,
 			 unsigned long start_address) __noreturn;
 
+#if defined(CONFIG_CRASH_DUMP) && defined(CONFIG_PPC_RTAS)
+void crash_free_reserved_phys_range(unsigned long begin, unsigned long end);
+#define crash_free_reserved_phys_range crash_free_reserved_phys_range
+#endif
+
 #ifdef CONFIG_KEXEC_FILE
 extern const struct kexec_file_ops kexec_elf64_ops;
 
diff --git a/arch/s390/include/asm/kexec.h b/arch/s390/include/asm/kexec.h
index d13bd221cd37..4f713092e68c 100644
--- a/arch/s390/include/asm/kexec.h
+++ b/arch/s390/include/asm/kexec.h
@@ -85,6 +85,17 @@ struct kimage_arch {
 extern const struct kexec_file_ops s390_kexec_image_ops;
 extern const struct kexec_file_ops s390_kexec_elf_ops;
 
+#ifdef CONFIG_CRASH_DUMP
+void crash_free_reserved_phys_range(unsigned long begin, unsigned long end);
+#define crash_free_reserved_phys_range crash_free_reserved_phys_range
+
+void arch_kexec_protect_crashkres(void);
+#define arch_kexec_protect_crashkres arch_kexec_protect_crashkres
+
+void arch_kexec_unprotect_crashkres(void);
+#define arch_kexec_unprotect_crashkres arch_kexec_unprotect_crashkres
+#endif
+
 #ifdef CONFIG_KEXEC_FILE
 struct purgatory_info;
 int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
index 5b6e2ae54906..4fd92330f23d 100644
--- a/arch/x86/include/asm/kexec.h
+++ b/arch/x86/include/asm/kexec.h
@@ -186,6 +186,12 @@ extern int arch_kexec_post_alloc_pages(void *vaddr, unsigned int pages,
 extern void arch_kexec_pre_free_pages(void *vaddr, unsigned int pages);
 #define arch_kexec_pre_free_pages arch_kexec_pre_free_pages
 
+void arch_kexec_protect_crashkres(void);
+#define arch_kexec_protect_crashkres arch_kexec_protect_crashkres
+
+void arch_kexec_unprotect_crashkres(void);
+#define arch_kexec_unprotect_crashkres arch_kexec_unprotect_crashkres
+
 #ifdef CONFIG_KEXEC_FILE
 struct purgatory_info;
 int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index f1e5327a7bf8..1638c8d7d216 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -384,7 +384,10 @@ extern void machine_kexec_cleanup(struct kimage *image);
 extern int kernel_kexec(void);
 extern struct page *kimage_alloc_control_pages(struct kimage *image,
 						unsigned int order);
-int machine_kexec_post_load(struct kimage *image);
+
+#ifndef machine_kexec_post_load
+static inline int machine_kexec_post_load(struct kimage *image) { return 0; }
+#endif
 
 extern void __crash_kexec(struct pt_regs *);
 extern void crash_kexec(struct pt_regs *);
@@ -423,10 +426,21 @@ extern bool kexec_in_progress;
 
 int crash_shrink_memory(unsigned long new_size);
 size_t crash_get_memory_size(void);
-void crash_free_reserved_phys_range(unsigned long begin, unsigned long end);
 
-void arch_kexec_protect_crashkres(void);
-void arch_kexec_unprotect_crashkres(void);
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
 
 #ifndef page_to_boot_pfn
 static inline unsigned long page_to_boot_pfn(struct page *page)
@@ -456,6 +470,16 @@ static inline phys_addr_t boot_phys_to_phys(unsigned long boot_phys)
 }
 #endif
 
+#ifndef crash_free_reserved_phys_range
+static inline void crash_free_reserved_phys_range(unsigned long begin, unsigned long end)
+{
+	unsigned long addr;
+
+	for (addr = begin; addr < end; addr += PAGE_SIZE)
+		free_reserved_page(boot_pfn_to_page(addr >> PAGE_SHIFT));
+}
+#endif
+
 static inline unsigned long virt_to_boot_phys(void *addr)
 {
 	return phys_to_boot_phys(__pa((unsigned long)addr));
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index 5a5d192a89ac..0951df148c1e 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -591,11 +591,6 @@ static void kimage_free_extra_pages(struct kimage *image)
 
 }
 
-int __weak machine_kexec_post_load(struct kimage *image)
-{
-	return 0;
-}
-
 void kimage_terminate(struct kimage *image)
 {
 	if (*image->entry != 0)
@@ -1000,15 +995,6 @@ size_t crash_get_memory_size(void)
 	return size;
 }
 
-void __weak crash_free_reserved_phys_range(unsigned long begin,
-					   unsigned long end)
-{
-	unsigned long addr;
-
-	for (addr = begin; addr < end; addr += PAGE_SIZE)
-		free_reserved_page(boot_pfn_to_page(addr >> PAGE_SHIFT));
-}
-
 int crash_shrink_memory(unsigned long new_size)
 {
 	int ret = 0;
@@ -1205,16 +1191,3 @@ int kernel_kexec(void)
 	mutex_unlock(&kexec_mutex);
 	return error;
 }
-
-/*
- * Protection mechanism for crashkernel reserved memory after
- * the kdump kernel is loaded.
- *
- * Provide an empty default implementation here -- architecture
- * code may override this
- */
-void __weak arch_kexec_protect_crashkres(void)
-{}
-
-void __weak arch_kexec_unprotect_crashkres(void)
-{}
-- 
2.35.3

