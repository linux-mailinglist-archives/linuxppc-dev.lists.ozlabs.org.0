Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 268D58B5817
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 14:20:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sKwLHX22;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VSj8x5BNKz3w25
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 22:20:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sKwLHX22;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VSj5G2PBxz3dHj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 22:17:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 93C0160C8B;
	Mon, 29 Apr 2024 12:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98887C4AF19;
	Mon, 29 Apr 2024 12:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714393056;
	bh=et4MgsnYGm8cVKv9jXBAzJOVzMpXCbC7LVUAQwPu1L8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sKwLHX22IdeW62736wZ9r1Ikc2SqCJi9L5yjGR/7xI3GLyv4B4elzDchb1SGl++Wj
	 hXWds1Pah1tt9zbAlLSRB2sxYnf5jMZYuc72yLTyQybTOBcpZ4kHzM8kl0uxUW68wJ
	 bMhxoiVvvVzrkF7bXlTe8iq0Ts/IbyOLtbViwz2+g5SMGZezqxFY1WPTCsn82Q6rCL
	 40jrR0zhHdgWUMckJl4r/6m3yRk0TwmQEqcecKSZfwHa8lk0f+PQ87hN6JGasuPxOs
	 1L5Ek4JLmOmVkLuztUzltVHerGBETMLdq9JzO8Y60eATC+Y6+We/ipxX/x3WGFdGlw
	 RmkGLgOWCS7Vg==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 05/16] module: make module_memory_{alloc,free} more self-contained
Date: Mon, 29 Apr 2024 15:16:09 +0300
Message-ID: <20240429121620.1186447-6-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429121620.1186447-1-rppt@kernel.org>
References: <20240429121620.1186447-1-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Sam Ravnborg <sam@ravnborg.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Move the logic related to the memory allocation and freeing into
module_memory_alloc() and module_memory_free().

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 kernel/module/main.c | 64 +++++++++++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 25 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index e1e8a7a9d6c1..5b82b069e0d3 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1203,15 +1203,44 @@ static bool mod_mem_use_vmalloc(enum mod_mem_type type)
 		mod_mem_type_is_core_data(type);
 }
 
-static void *module_memory_alloc(unsigned int size, enum mod_mem_type type)
+static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
 {
+	unsigned int size = PAGE_ALIGN(mod->mem[type].size);
+	void *ptr;
+
+	mod->mem[type].size = size;
+
 	if (mod_mem_use_vmalloc(type))
-		return vzalloc(size);
-	return module_alloc(size);
+		ptr = vmalloc(size);
+	else
+		ptr = module_alloc(size);
+
+	if (!ptr)
+		return -ENOMEM;
+
+	/*
+	 * The pointer to these blocks of memory are stored on the module
+	 * structure and we keep that around so long as the module is
+	 * around. We only free that memory when we unload the module.
+	 * Just mark them as not being a leak then. The .init* ELF
+	 * sections *do* get freed after boot so we *could* treat them
+	 * slightly differently with kmemleak_ignore() and only grey
+	 * them out as they work as typical memory allocations which
+	 * *do* eventually get freed, but let's just keep things simple
+	 * and avoid *any* false positives.
+	 */
+	kmemleak_not_leak(ptr);
+
+	memset(ptr, 0, size);
+	mod->mem[type].base = ptr;
+
+	return 0;
 }
 
-static void module_memory_free(void *ptr, enum mod_mem_type type)
+static void module_memory_free(struct module *mod, enum mod_mem_type type)
 {
+	void *ptr = mod->mem[type].base;
+
 	if (mod_mem_use_vmalloc(type))
 		vfree(ptr);
 	else
@@ -1229,12 +1258,12 @@ static void free_mod_mem(struct module *mod)
 		/* Free lock-classes; relies on the preceding sync_rcu(). */
 		lockdep_free_key_range(mod_mem->base, mod_mem->size);
 		if (mod_mem->size)
-			module_memory_free(mod_mem->base, type);
+			module_memory_free(mod, type);
 	}
 
 	/* MOD_DATA hosts mod, so free it at last */
 	lockdep_free_key_range(mod->mem[MOD_DATA].base, mod->mem[MOD_DATA].size);
-	module_memory_free(mod->mem[MOD_DATA].base, MOD_DATA);
+	module_memory_free(mod, MOD_DATA);
 }
 
 /* Free a module, remove from lists, etc. */
@@ -2225,7 +2254,6 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 static int move_module(struct module *mod, struct load_info *info)
 {
 	int i;
-	void *ptr;
 	enum mod_mem_type t = 0;
 	int ret = -ENOMEM;
 
@@ -2234,26 +2262,12 @@ static int move_module(struct module *mod, struct load_info *info)
 			mod->mem[type].base = NULL;
 			continue;
 		}
-		mod->mem[type].size = PAGE_ALIGN(mod->mem[type].size);
-		ptr = module_memory_alloc(mod->mem[type].size, type);
-		/*
-                 * The pointer to these blocks of memory are stored on the module
-                 * structure and we keep that around so long as the module is
-                 * around. We only free that memory when we unload the module.
-                 * Just mark them as not being a leak then. The .init* ELF
-                 * sections *do* get freed after boot so we *could* treat them
-                 * slightly differently with kmemleak_ignore() and only grey
-                 * them out as they work as typical memory allocations which
-                 * *do* eventually get freed, but let's just keep things simple
-                 * and avoid *any* false positives.
-		 */
-		kmemleak_not_leak(ptr);
-		if (!ptr) {
+
+		ret = module_memory_alloc(mod, type);
+		if (ret) {
 			t = type;
 			goto out_enomem;
 		}
-		memset(ptr, 0, mod->mem[type].size);
-		mod->mem[type].base = ptr;
 	}
 
 	/* Transfer each section which specifies SHF_ALLOC */
@@ -2296,7 +2310,7 @@ static int move_module(struct module *mod, struct load_info *info)
 	return 0;
 out_enomem:
 	for (t--; t >= 0; t--)
-		module_memory_free(mod->mem[t].base, t);
+		module_memory_free(mod, t);
 	return ret;
 }
 
-- 
2.43.0

