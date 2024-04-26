Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 696C58B331E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Apr 2024 10:40:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NtDywaXn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQmQ90KpTz3wRw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Apr 2024 18:40:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NtDywaXn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQmDM466Nz3vv1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 18:32:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 09AABCE1BE6;
	Fri, 26 Apr 2024 08:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC87C113CD;
	Fri, 26 Apr 2024 08:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714120321;
	bh=D/LgKkA0Gob427zNusjsii4Fgukj7DrmwMiYlEjdnlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NtDywaXnqnWhuljILjD8vmTh9geXka1YAKmrSFvlc56Zd5ODWg+iM6Unoh+n3wcxI
	 L4E0HsSEB5v/LHXXRsLUtO0SO7LTmy+BAA3wAxIIVnvtSteMFuA2N3i/4UpIdklune
	 EzfCeM98t8Hc1qm9JZ+1FkFhN1OPt8udZCnF0Wvh3xAotBdjwQf97lT3sW1NeMNYoP
	 81DpiOWgN5sVjGNNODQSpRT/Lhjj+goH6mo+AYRgO1Kg7HDrhMX16dopMv0So1vXA8
	 dkFDq+I+68+VjdW3ccTkzktM4kS9aT3Iz/97vDr7gBlrvzvihqzr3gKlC/HdPVeUlA
	 USa/X+rEkZMSg==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 15/16] kprobes: remove dependency on CONFIG_MODULES
Date: Fri, 26 Apr 2024 11:28:53 +0300
Message-ID: <20240426082854.7355-16-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240426082854.7355-1-rppt@kernel.org>
References: <20240426082854.7355-1-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Sam Ravnborg <sam@ravnborg.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <ke
 nt.overstreet@linux.dev>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

kprobes depended on CONFIG_MODULES because it has to allocate memory for
code.

Since code allocations are now implemented with execmem, kprobes can be
enabled in non-modular kernels.

Add #ifdef CONFIG_MODULE guards for the code dealing with kprobes inside
modules, make CONFIG_KPROBES select CONFIG_EXECMEM and drop the
dependency of CONFIG_KPROBES on CONFIG_MODULES.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/Kconfig                |  2 +-
 include/linux/module.h      |  9 ++++++
 kernel/kprobes.c            | 55 +++++++++++++++++++++++--------------
 kernel/trace/trace_kprobe.c | 20 +++++++++++++-
 4 files changed, 63 insertions(+), 23 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 4fd0daa54e6c..caa459964f09 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -52,9 +52,9 @@ config GENERIC_ENTRY
 
 config KPROBES
 	bool "Kprobes"
-	depends on MODULES
 	depends on HAVE_KPROBES
 	select KALLSYMS
+	select EXECMEM
 	select TASKS_RCU if PREEMPTION
 	help
 	  Kprobes allows you to trap at almost any kernel address and
diff --git a/include/linux/module.h b/include/linux/module.h
index 1153b0d99a80..ffa1c603163c 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -605,6 +605,11 @@ static inline bool module_is_live(struct module *mod)
 	return mod->state != MODULE_STATE_GOING;
 }
 
+static inline bool module_is_coming(struct module *mod)
+{
+        return mod->state == MODULE_STATE_COMING;
+}
+
 struct module *__module_text_address(unsigned long addr);
 struct module *__module_address(unsigned long addr);
 bool is_module_address(unsigned long addr);
@@ -857,6 +862,10 @@ void *dereference_module_function_descriptor(struct module *mod, void *ptr)
 	return ptr;
 }
 
+static inline bool module_is_coming(struct module *mod)
+{
+	return false;
+}
 #endif /* CONFIG_MODULES */
 
 #ifdef CONFIG_SYSFS
diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index ddd7cdc16edf..ca2c6cbd42d2 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -1588,7 +1588,7 @@ static int check_kprobe_address_safe(struct kprobe *p,
 	}
 
 	/* Get module refcount and reject __init functions for loaded modules. */
-	if (*probed_mod) {
+	if (IS_ENABLED(CONFIG_MODULES) && *probed_mod) {
 		/*
 		 * We must hold a refcount of the probed module while updating
 		 * its code to prohibit unexpected unloading.
@@ -1603,12 +1603,13 @@ static int check_kprobe_address_safe(struct kprobe *p,
 		 * kprobes in there.
 		 */
 		if (within_module_init((unsigned long)p->addr, *probed_mod) &&
-		    (*probed_mod)->state != MODULE_STATE_COMING) {
+		    !module_is_coming(*probed_mod)) {
 			module_put(*probed_mod);
 			*probed_mod = NULL;
 			ret = -ENOENT;
 		}
 	}
+
 out:
 	preempt_enable();
 	jump_label_unlock();
@@ -2488,24 +2489,6 @@ int kprobe_add_area_blacklist(unsigned long start, unsigned long end)
 	return 0;
 }
 
-/* Remove all symbols in given area from kprobe blacklist */
-static void kprobe_remove_area_blacklist(unsigned long start, unsigned long end)
-{
-	struct kprobe_blacklist_entry *ent, *n;
-
-	list_for_each_entry_safe(ent, n, &kprobe_blacklist, list) {
-		if (ent->start_addr < start || ent->start_addr >= end)
-			continue;
-		list_del(&ent->list);
-		kfree(ent);
-	}
-}
-
-static void kprobe_remove_ksym_blacklist(unsigned long entry)
-{
-	kprobe_remove_area_blacklist(entry, entry + 1);
-}
-
 int __weak arch_kprobe_get_kallsym(unsigned int *symnum, unsigned long *value,
 				   char *type, char *sym)
 {
@@ -2570,6 +2553,25 @@ static int __init populate_kprobe_blacklist(unsigned long *start,
 	return ret ? : arch_populate_kprobe_blacklist();
 }
 
+#ifdef CONFIG_MODULES
+/* Remove all symbols in given area from kprobe blacklist */
+static void kprobe_remove_area_blacklist(unsigned long start, unsigned long end)
+{
+	struct kprobe_blacklist_entry *ent, *n;
+
+	list_for_each_entry_safe(ent, n, &kprobe_blacklist, list) {
+		if (ent->start_addr < start || ent->start_addr >= end)
+			continue;
+		list_del(&ent->list);
+		kfree(ent);
+	}
+}
+
+static void kprobe_remove_ksym_blacklist(unsigned long entry)
+{
+	kprobe_remove_area_blacklist(entry, entry + 1);
+}
+
 static void add_module_kprobe_blacklist(struct module *mod)
 {
 	unsigned long start, end;
@@ -2672,6 +2674,17 @@ static struct notifier_block kprobe_module_nb = {
 	.priority = 0
 };
 
+static int kprobe_register_module_notifier(void)
+{
+	return register_module_notifier(&kprobe_module_nb);
+}
+#else
+static int kprobe_register_module_notifier(void)
+{
+	return 0;
+}
+#endif /* CONFIG_MODULES */
+
 void kprobe_free_init_mem(void)
 {
 	void *start = (void *)(&__init_begin);
@@ -2731,7 +2744,7 @@ static int __init init_kprobes(void)
 	if (!err)
 		err = register_die_notifier(&kprobe_exceptions_nb);
 	if (!err)
-		err = register_module_notifier(&kprobe_module_nb);
+		err = kprobe_register_module_notifier();
 
 	kprobes_initialized = (err == 0);
 	kprobe_sysctls_init();
diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
index 14099cc17fc9..2cb2a3951b4f 100644
--- a/kernel/trace/trace_kprobe.c
+++ b/kernel/trace/trace_kprobe.c
@@ -111,6 +111,7 @@ static nokprobe_inline bool trace_kprobe_within_module(struct trace_kprobe *tk,
 	return strncmp(module_name(mod), name, len) == 0 && name[len] == ':';
 }
 
+#ifdef CONFIG_MODULES
 static nokprobe_inline bool trace_kprobe_module_exist(struct trace_kprobe *tk)
 {
 	char *p;
@@ -129,6 +130,12 @@ static nokprobe_inline bool trace_kprobe_module_exist(struct trace_kprobe *tk)
 
 	return ret;
 }
+#else
+static inline bool trace_kprobe_module_exist(struct trace_kprobe *tk)
+{
+	return false;
+}
+#endif
 
 static bool trace_kprobe_is_busy(struct dyn_event *ev)
 {
@@ -670,6 +677,7 @@ static int register_trace_kprobe(struct trace_kprobe *tk)
 	return ret;
 }
 
+#ifdef CONFIG_MODULES
 /* Module notifier call back, checking event on the module */
 static int trace_kprobe_module_callback(struct notifier_block *nb,
 				       unsigned long val, void *data)
@@ -704,6 +712,16 @@ static struct notifier_block trace_kprobe_module_nb = {
 	.notifier_call = trace_kprobe_module_callback,
 	.priority = 1	/* Invoked after kprobe module callback */
 };
+static int trace_kprobe_register_module_notifier(void)
+{
+	return register_module_notifier(&trace_kprobe_module_nb);
+}
+#else
+static int trace_kprobe_register_module_notifier(void)
+{
+	return 0;
+}
+#endif /* CONFIG_MODULES */
 
 static int count_symbols(void *data, unsigned long unused)
 {
@@ -1933,7 +1951,7 @@ static __init int init_kprobe_trace_early(void)
 	if (ret)
 		return ret;
 
-	if (register_module_notifier(&trace_kprobe_module_nb))
+	if (trace_kprobe_register_module_notifier())
 		return -EINVAL;
 
 	return 0;
-- 
2.43.0

