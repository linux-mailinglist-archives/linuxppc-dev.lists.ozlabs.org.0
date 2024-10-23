Return-Path: <linuxppc-dev+bounces-2518-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8929A9AD094
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 18:28:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYZHL3YLJz307y;
	Thu, 24 Oct 2024 03:28:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729700926;
	cv=none; b=Rja3r4gj5+ETSUEHOdLe2cr/HfD8ceci/HfNhabIm2P5YFyim21UTtMy7Qw3xUEsx+Hsr5BNdmyXZgKj9jGkmKzvaNLNM9+C5UqOop4nuFY9YvdxG/baQ0JwsyHSsbyMZmmh4hAx+LXNJ5YMOskxvqShl5imMPtcBtSvfOlzAL7qJsRL8W2H6eD5xBkbciCpPUW893DEBaWJsy5YmZKN9DKYcK2saM25JFS63YnAKYe1mjBqp/8QxrH+GV6oC1M3nEN7GLx1uO012Oyghq2ceJhaTr3Cn+XG60pHTArDqgI7skZACpC2+DemM1mcXsKkOHSMoLJfqv/KnJ6HJxUdMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729700926; c=relaxed/relaxed;
	bh=IHrllgw94TednsDUYeOvlG/hVkV2Q1ghpFG/eOFaW58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PPvo27XoCHIAmB09xUIUulQT8m3dYAG4hLDGRrtj4m72daxz+Z7TrgCcQ5/vU/8j6gdrDe+HliRVS/2LdiosljV0oZK8tGoh2pOvb6sf6qx81uedRku3i4S9QQaqCnvyCYrngQVyanUvYFwJvt0b5cWTbxgeMwbW8TyC0Fm19mf9yDv312qLqGT7grgxBOIqlKi/QKiDOYu9gX524ovqvF/iBMOgQKZHzEDVEMAEW1cDgxKGlSl9TfXUrGXJ5nHY/Z3xT3Ww5yNth4EosKMXLpfeXz9Koz67WvHKC3L8FyGj2s3TCuocsJbb/aL6eNlLgZkzSwdUjwpQOQRv+CM5AQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DWJBcVWM; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DWJBcVWM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYZHK33Xyz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 03:28:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 61645A41B5B;
	Wed, 23 Oct 2024 16:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6313BC4CEE6;
	Wed, 23 Oct 2024 16:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729700922;
	bh=xb4svDXwFaBxninI5I+0LNtfAySGXZnMRdp5fkel8t8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DWJBcVWMJM+2XvLsPWqvMDvcMLPrCfAisg4mS38/DaGVrHFraG/T0LyRWjmnMW3YQ
	 6K4yoL+Jy2tksBnKk+p+o1VWMTYELJNvrl4+GQ9xwQbA8dPta2mwhb30Kvftw9Jjc5
	 q7Xk2Y30pj+8msd4ifQeu69k1ePJV/eOdN2WUUUj7+l13tFClJ7KgfqSJ4iksyWcbE
	 OPOnQct+s1MyXqH8VAEC1U6/GMos1tYg/95JGkKQN20y3FQk8VlXYuYjLngQyklXzA
	 vNZV7bXiVqwH81GW1G22p3XhUzgHyvZq4w/9jYJne6g1s8hRM56G0jlA9cHHjEkzch
	 swuz7EyS0soiA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>
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
	Suren Baghdasaryan <surenb@google.com>,
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
Subject: [PATCH v7 4/8] module: prepare to handle ROX allocations for text
Date: Wed, 23 Oct 2024 19:27:07 +0300
Message-ID: <20241023162711.2579610-5-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023162711.2579610-1-rppt@kernel.org>
References: <20241023162711.2579610-1-rppt@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
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
Reviewd-by: Luis Chamberlain <mcgrof@kernel.org>
Tested-by: kdevops <kdevops@lists.linux.dev>
---
 include/linux/execmem.h        | 23 +++++++++++
 include/linux/module.h         | 16 ++++++++
 include/linux/moduleloader.h   |  4 ++
 kernel/module/debug_kmemleak.c |  3 +-
 kernel/module/main.c           | 74 ++++++++++++++++++++++++++++++----
 kernel/module/strict_rwx.c     |  3 ++
 mm/execmem.c                   | 11 +++++
 7 files changed, 126 insertions(+), 8 deletions(-)

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
index 88ecc5e9f523..2a9386cbdf85 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -367,6 +367,8 @@ enum mod_mem_type {
 
 struct module_memory {
 	void *base;
+	void *rw_copy;
+	bool is_rox;
 	unsigned int size;
 
 #ifdef CONFIG_MODULES_TREE_LOOKUP
@@ -767,6 +769,15 @@ static inline bool is_livepatch_module(struct module *mod)
 
 void set_module_sig_enforced(void);
 
+void *__module_writable_address(struct module *mod, void *loc);
+
+static inline void *module_writable_address(struct module *mod, void *loc)
+{
+	if (!IS_ENABLED(CONFIG_ARCH_HAS_EXECMEM_ROX) || !mod)
+		return loc;
+	return __module_writable_address(mod, loc);
+}
+
 #else /* !CONFIG_MODULES... */
 
 static inline struct module *__module_address(unsigned long addr)
@@ -874,6 +885,11 @@ static inline bool module_is_coming(struct module *mod)
 {
 	return false;
 }
+
+static inline void *module_writable_address(struct module *mod, void *loc)
+{
+	return loc;
+}
 #endif /* CONFIG_MODULES */
 
 #ifdef CONFIG_SYSFS
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
diff --git a/kernel/module/debug_kmemleak.c b/kernel/module/debug_kmemleak.c
index b4cc03842d70..df873dad049d 100644
--- a/kernel/module/debug_kmemleak.c
+++ b/kernel/module/debug_kmemleak.c
@@ -14,7 +14,8 @@ void kmemleak_load_module(const struct module *mod,
 {
 	/* only scan writable, non-executable sections */
 	for_each_mod_mem_type(type) {
-		if (type != MOD_DATA && type != MOD_INIT_DATA)
+		if (type != MOD_DATA && type != MOD_INIT_DATA &&
+		    !mod->mem[type].is_rox)
 			kmemleak_no_scan(mod->mem[type].base);
 	}
 }
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 49b9bca9de12..73b588fe98d4 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1189,6 +1189,18 @@ void __weak module_arch_freeing_init(struct module *mod)
 {
 }
 
+void *__module_writable_address(struct module *mod, void *loc)
+{
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
@@ -1206,6 +1218,23 @@ static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
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
@@ -1219,16 +1248,17 @@ static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
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
@@ -2251,6 +2281,7 @@ static int move_module(struct module *mod, struct load_info *info)
 	for_each_mod_mem_type(type) {
 		if (!mod->mem[type].size) {
 			mod->mem[type].base = NULL;
+			mod->mem[type].rw_copy = NULL;
 			continue;
 		}
 
@@ -2267,11 +2298,14 @@ static int move_module(struct module *mod, struct load_info *info)
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
@@ -2293,7 +2327,7 @@ static int move_module(struct module *mod, struct load_info *info)
 		 * users of info can keep taking advantage and using the newly
 		 * minted official memory area.
 		 */
-		shdr->sh_addr = (unsigned long)dest;
+		shdr->sh_addr = addr;
 		pr_debug("\t0x%lx 0x%.8lx %s\n", (long)shdr->sh_addr,
 			 (long)shdr->sh_size, info->secstrings + shdr->sh_name);
 	}
@@ -2441,8 +2475,17 @@ int __weak module_finalize(const Elf_Ehdr *hdr,
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
 
@@ -2454,7 +2497,24 @@ static int post_relocation(struct module *mod, const struct load_info *info)
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


