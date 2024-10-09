Return-Path: <linuxppc-dev+bounces-1902-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27470997432
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 20:10:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XP1Bg2XPcz3bdj;
	Thu, 10 Oct 2024 05:10:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728497403;
	cv=none; b=eaj/yi4moNf5ZXlUhIkpstBsJymGszzqsjcaIzmOFfFxvW5fBAdEjGh8/QdkeIcKP0+seM7n6mIxJs+wgx1TJ30iuEu74/wbfNdKZi79qwQZRbVnrwCNa0Lt4Zsc2lMnEM1MCKuO7ld7Ae7MMfq2x3cWSv/3U7lXIJBdqL31WvBpXSv157ZXAMpPkqStmdwjW6hcuHZCal2Ydf2pnZBnwF7xEtTvvV300GA8MLSaLRX4XbIT4U+HWRDBeqxn54i90v3JaIgHxtMdkNsoRiSfrr80tmOucor2ThBs+bSdJ1zmbwvqkK6mRmWZ3xNzvbFA2xhhFUqdtSeTbt3KPgIgTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728497403; c=relaxed/relaxed;
	bh=x461ZkI67QT8l0AFcGJgiTn6xfNJTj8cISvfJrUexWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ns7m8Do4QVX6/cKnn/ofvPt98TKwtl8NxjuTGamJz8nyYGzy0d4oiUvdhPN/uKCXjniDnPof8jRT7/ZTrbwo3gN1DP2pydM/59NBNd8pG0clQy5IPvSpaTLmIcPn1IgEm8CGiKSrasehUrxKV76XNFCCLXOixlpVLUx1l7Xx565WnVFO2w5VdY9659xERIbyay2U2stzAZvbnOt4D5T1XssKyl5lwgq9LrMUQGRwBwcbmCWB48FO8qTgTm+EK7owM6rLx2H/WALja96KgJWw2Drq1orb6L9BmeKYI/br7irFC0/XAE0vTfKGO4xz0Pu/15nElClIaoltMq2122iBXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g1PY1a0u; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g1PY1a0u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XP1Bf23f0z3bcs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 05:10:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B20585C5440;
	Wed,  9 Oct 2024 18:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF86C4CED4;
	Wed,  9 Oct 2024 18:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728497399;
	bh=i3ln8mXpImXR/qcZLQ0qXibB8rQo6xUsbdwMT86PTDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g1PY1a0uW6njUfw5X7qN5yyNgJbEftEpjYRQOMMYGtdA/UJ+9aaO0c0uMZgqcjaai
	 g0NMqxVWVpNunD7hDIh9G8cgKJ7gGRqW11sulJ5jdanfaLhcUlWnan3aVekkFoxP4a
	 5D+2UYDF/WjF8Viw0uoURp/BbV0MJXFh6r7B4Lm+3xfbGtqq87nkZOJNWY1DKcxtV0
	 rdYmj0oi0mG96Qb10vMOgKYDUrVe/C7L5Ql/9iJCzG1S+Y+raOJ78gQF+ydoaZdUdy
	 oWR6VQDu6TPTsEn1kQ9HEM7NEPx/msKwnV8giiyvwtJuXhfwyfcFZI+cpm/zr29A62
	 jrJmehTveYCfw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-modules@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v5 4/8] module: prepare to handle ROX allocations for text
Date: Wed,  9 Oct 2024 21:08:12 +0300
Message-ID: <20241009180816.83591-5-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009180816.83591-1-rppt@kernel.org>
References: <20241009180816.83591-1-rppt@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

In order to support ROX allocations for module text, it is necessary to
handle modifications to the code, such as relocations and alternatives
patching, without write access to that memory.

One option is to use text patching, but this would make module loading
extremely slow and will expose executable code that is not finally formed.

A better way is to have memory allocated with ROX permissions contain
invalid instructions and keep a writable, but not executable copy of the
module text. The relocations and alternative patches would be done on the
writable copy using the addresses of the ROX memory.
Once the module is completely ready, the updated text will be copied to ROX
memory using text patching in one go and the writable copy will be freed.

Add support for that to module initialization code and provide necessary
interfaces in execmem.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/execmem.h      | 23 +++++++++++
 include/linux/module.h       | 11 ++++++
 include/linux/moduleloader.h |  4 ++
 kernel/module/main.c         | 77 ++++++++++++++++++++++++++++++++----
 kernel/module/strict_rwx.c   |  3 ++
 mm/execmem.c                 | 11 ++++++
 6 files changed, 122 insertions(+), 7 deletions(-)

diff --git a/include/linux/execmem.h b/include/linux/execmem.h
index 32cef1144117..dfdf19f8a5e8 100644
--- a/include/linux/execmem.h
+++ b/include/linux/execmem.h
@@ -46,9 +46,11 @@ enum execmem_type {
 /**
  * enum execmem_range_flags - options for executable memory allocations
  * @EXECMEM_KASAN_SHADOW:	allocate kasan shadow
+ * @EXECMEM_ROX_CACHE:		allocations should use ROX cache of huge pages
  */
 enum execmem_range_flags {
 	EXECMEM_KASAN_SHADOW	= (1 << 0),
+	EXECMEM_ROX_CACHE	= (1 << 1),
 };
 
 /**
@@ -123,6 +125,27 @@ void *execmem_alloc(enum execmem_type type, size_t size);
  */
 void execmem_free(void *ptr);
 
+/**
+ * execmem_update_copy - copy an update to executable memory
+ * @dst:  destination address to update
+ * @src:  source address containing the data
+ * @size: how many bytes of memory shold be copied
+ *
+ * Copy @size bytes from @src to @dst using text poking if the memory at
+ * @dst is read-only.
+ *
+ * Return: a pointer to @dst or NULL on error
+ */
+void *execmem_update_copy(void *dst, const void *src, size_t size);
+
+/**
+ * execmem_is_rox - check if execmem is read-only
+ * @type - the execmem type to check
+ *
+ * Return: %true if the @type is read-only, %false if it's writable
+ */
+bool execmem_is_rox(enum execmem_type type);
+
 #if defined(CONFIG_EXECMEM) && !defined(CONFIG_ARCH_WANTS_EXECMEM_LATE)
 void execmem_init(void);
 #else
diff --git a/include/linux/module.h b/include/linux/module.h
index 88ecc5e9f523..7039f609c6ef 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -367,6 +367,8 @@ enum mod_mem_type {
 
 struct module_memory {
 	void *base;
+	void *rw_copy;
+	bool is_rox;
 	unsigned int size;
 
 #ifdef CONFIG_MODULES_TREE_LOOKUP
@@ -374,6 +376,15 @@ struct module_memory {
 #endif
 };
 
+#ifdef CONFIG_MODULES
+void *module_writable_address(struct module *mod, void *loc);
+#else
+static inline void *module_writable_address(struct module *mod, void *loc)
+{
+	return loc;
+}
+#endif
+
 #ifdef CONFIG_MODULES_TREE_LOOKUP
 /* Only touch one cacheline for common rbtree-for-core-layout case. */
 #define __module_memory_align ____cacheline_aligned
diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
index e395461d59e5..1f5507ba5a12 100644
--- a/include/linux/moduleloader.h
+++ b/include/linux/moduleloader.h
@@ -108,6 +108,10 @@ int module_finalize(const Elf_Ehdr *hdr,
 		    const Elf_Shdr *sechdrs,
 		    struct module *mod);
 
+int module_post_finalize(const Elf_Ehdr *hdr,
+			 const Elf_Shdr *sechdrs,
+			 struct module *mod);
+
 #ifdef CONFIG_MODULES
 void flush_module_init_free_work(void);
 #else
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 49b9bca9de12..ef54733bd7d2 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1189,6 +1189,21 @@ void __weak module_arch_freeing_init(struct module *mod)
 {
 }
 
+void *module_writable_address(struct module *mod, void *loc)
+{
+	if (!mod)
+		return loc;
+
+	for_class_mod_mem_type(type, text) {
+		struct module_memory *mem = &mod->mem[type];
+
+		if (loc >= mem->base && loc < mem->base + mem->size)
+			return loc + (mem->rw_copy - mem->base);
+	}
+
+	return loc;
+}
+
 static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
 {
 	unsigned int size = PAGE_ALIGN(mod->mem[type].size);
@@ -1206,6 +1221,23 @@ static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
 	if (!ptr)
 		return -ENOMEM;
 
+	mod->mem[type].base = ptr;
+
+	if (execmem_is_rox(execmem_type)) {
+		ptr = vzalloc(size);
+
+		if (!ptr) {
+			execmem_free(mod->mem[type].base);
+			return -ENOMEM;
+		}
+
+		mod->mem[type].rw_copy = ptr;
+		mod->mem[type].is_rox = true;
+	} else {
+		mod->mem[type].rw_copy = mod->mem[type].base;
+		memset(mod->mem[type].base, 0, size);
+	}
+
 	/*
 	 * The pointer to these blocks of memory are stored on the module
 	 * structure and we keep that around so long as the module is
@@ -1219,16 +1251,17 @@ static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
 	 */
 	kmemleak_not_leak(ptr);
 
-	memset(ptr, 0, size);
-	mod->mem[type].base = ptr;
-
 	return 0;
 }
 
 static void module_memory_free(struct module *mod, enum mod_mem_type type,
 			       bool unload_codetags)
 {
-	void *ptr = mod->mem[type].base;
+	struct module_memory *mem = &mod->mem[type];
+	void *ptr = mem->base;
+
+	if (mem->is_rox)
+		vfree(mem->rw_copy);
 
 	if (!unload_codetags && mod_mem_type_is_core_data(type))
 		return;
@@ -2251,6 +2284,7 @@ static int move_module(struct module *mod, struct load_info *info)
 	for_each_mod_mem_type(type) {
 		if (!mod->mem[type].size) {
 			mod->mem[type].base = NULL;
+			mod->mem[type].rw_copy = NULL;
 			continue;
 		}
 
@@ -2267,11 +2301,14 @@ static int move_module(struct module *mod, struct load_info *info)
 		void *dest;
 		Elf_Shdr *shdr = &info->sechdrs[i];
 		enum mod_mem_type type = shdr->sh_entsize >> SH_ENTSIZE_TYPE_SHIFT;
+		unsigned long offset = shdr->sh_entsize & SH_ENTSIZE_OFFSET_MASK;
+		unsigned long addr;
 
 		if (!(shdr->sh_flags & SHF_ALLOC))
 			continue;
 
-		dest = mod->mem[type].base + (shdr->sh_entsize & SH_ENTSIZE_OFFSET_MASK);
+		addr = (unsigned long)mod->mem[type].base + offset;
+		dest = mod->mem[type].rw_copy + offset;
 
 		if (shdr->sh_type != SHT_NOBITS) {
 			/*
@@ -2293,7 +2330,7 @@ static int move_module(struct module *mod, struct load_info *info)
 		 * users of info can keep taking advantage and using the newly
 		 * minted official memory area.
 		 */
-		shdr->sh_addr = (unsigned long)dest;
+		shdr->sh_addr = addr;
 		pr_debug("\t0x%lx 0x%.8lx %s\n", (long)shdr->sh_addr,
 			 (long)shdr->sh_size, info->secstrings + shdr->sh_name);
 	}
@@ -2441,8 +2478,17 @@ int __weak module_finalize(const Elf_Ehdr *hdr,
 	return 0;
 }
 
+int __weak module_post_finalize(const Elf_Ehdr *hdr,
+				const Elf_Shdr *sechdrs,
+				struct module *me)
+{
+	return 0;
+}
+
 static int post_relocation(struct module *mod, const struct load_info *info)
 {
+	int ret;
+
 	/* Sort exception table now relocations are done. */
 	sort_extable(mod->extable, mod->extable + mod->num_exentries);
 
@@ -2454,7 +2500,24 @@ static int post_relocation(struct module *mod, const struct load_info *info)
 	add_kallsyms(mod, info);
 
 	/* Arch-specific module finalizing. */
-	return module_finalize(info->hdr, info->sechdrs, mod);
+	ret = module_finalize(info->hdr, info->sechdrs, mod);
+	if (ret)
+		return ret;
+
+	for_each_mod_mem_type(type) {
+		struct module_memory *mem = &mod->mem[type];
+
+		if (mem->is_rox) {
+			if (!execmem_update_copy(mem->base, mem->rw_copy,
+						 mem->size))
+				return -ENOMEM;
+
+			vfree(mem->rw_copy);
+			mem->rw_copy = NULL;
+		}
+	}
+
+	return module_post_finalize(info->hdr, info->sechdrs, mod);
 }
 
 /* Call module constructors. */
diff --git a/kernel/module/strict_rwx.c b/kernel/module/strict_rwx.c
index c45caa4690e5..239e5013359d 100644
--- a/kernel/module/strict_rwx.c
+++ b/kernel/module/strict_rwx.c
@@ -34,6 +34,9 @@ int module_enable_text_rox(const struct module *mod)
 	for_class_mod_mem_type(type, text) {
 		int ret;
 
+		if (mod->mem[type].is_rox)
+			continue;
+
 		if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
 			ret = module_set_memory(mod, type, set_memory_rox);
 		else
diff --git a/mm/execmem.c b/mm/execmem.c
index 0c4b36bc6d10..0f6691e9ffe6 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -10,6 +10,7 @@
 #include <linux/vmalloc.h>
 #include <linux/execmem.h>
 #include <linux/moduleloader.h>
+#include <linux/text-patching.h>
 
 static struct execmem_info *execmem_info __ro_after_init;
 static struct execmem_info default_execmem_info __ro_after_init;
@@ -69,6 +70,16 @@ void execmem_free(void *ptr)
 	vfree(ptr);
 }
 
+void *execmem_update_copy(void *dst, const void *src, size_t size)
+{
+	return text_poke_copy(dst, src, size);
+}
+
+bool execmem_is_rox(enum execmem_type type)
+{
+	return !!(execmem_info->ranges[type].flags & EXECMEM_ROX_CACHE);
+}
+
 static bool execmem_validate(struct execmem_info *info)
 {
 	struct execmem_range *r = &info->ranges[EXECMEM_DEFAULT];
-- 
2.43.0


