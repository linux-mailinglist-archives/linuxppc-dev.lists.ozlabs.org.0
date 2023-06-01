Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF7F719947
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 12:19:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX2DB174jz3dvx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 20:19:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O7CZPc6M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O7CZPc6M;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QX26Y1cktz3bdV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 20:14:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8048563EA6;
	Thu,  1 Jun 2023 10:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FAFFC433A4;
	Thu,  1 Jun 2023 10:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685614450;
	bh=uo4TstuV9eOgMvWG2HMh3EopMTe0NSijQ6dCLHFkzlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O7CZPc6MlEZU2IHEZeVkwJcIwQJEEB5iuuRczkSp9DPkVEs2CTsE2n+UlMJ78bjRb
	 bHx43pbJtvyCqQB2ppqa+4mtw9WtDOO7shncdZkW4UoVJqIpyddfjlp+zv8jSwtp42
	 olPg+ALemFonlyR2mBbGi7ynfKHEuoMygAQ14CkN2gqUPLF0e9eotDdkWwf3CJpO4P
	 MtlH9YB92zpcMsMjb4wZzxxVIBXMaAbZ3tiBdQ1y1vwxIU/L1EiwcIpjq0Q8AbeucT
	 fOc120em6tsqLyl1NTJ6DptdtOaFAD2VpQyQwJufWbj6SPI/CAMk57eeZGlrQb5uR+
	 zovU4757P3Cow==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 06/13] mm/jitalloc: introduce jit_data_alloc()
Date: Thu,  1 Jun 2023 13:12:50 +0300
Message-Id: <20230601101257.530867-7-rppt@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230601101257.530867-1-rppt@kernel.org>
References: <20230601101257.530867-1-rppt@kernel.org>
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
Cc: x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozl
 abs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Data related to code allocations, such as module data section, need to
comply with architecture constraints for its placement and its
allocation right now was done using jit_text_alloc().

Create a dedicated API for allocating data related to code allocations
and allow architectures to define address ranges for data allocations.

Since currently this is only relevant for powerpc variants that use the
VMALLOC address space for module data allocations, automatically reuse
address ranges defined for text unless address range for data is
explicitly defined by an architecture.

With separation of code and data allocations, data sections of the
modules are now mapped as PAGE_KERNEL rather than PAGE_KERNEL_EXEC which
was a default on many architectures.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/powerpc/kernel/module.c |  8 ++++++++
 include/linux/jitalloc.h     |  2 ++
 kernel/module/main.c         | 15 +++------------
 mm/jitalloc.c                | 36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 49 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index 83bdedc7eba0..b58af61e90c0 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -96,6 +96,10 @@ static struct jit_alloc_params jit_alloc_params = {
 
 struct jit_alloc_params *jit_alloc_arch_params(void)
 {
+	/*
+	 * BOOK3S_32 and 8xx define MODULES_VADDR for text allocations and
+	 * allow allocating data in the entire vmalloc space
+	 */
 #ifdef MODULES_VADDR
 	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
 	unsigned long limit = (unsigned long)_etext - SZ_32M;
@@ -112,6 +116,10 @@ struct jit_alloc_params *jit_alloc_arch_params(void)
 		jit_alloc_params.text.start = MODULES_VADDR;
 		jit_alloc_params.text.end = MODULES_END;
 	}
+
+	jit_alloc_params.data.pgprot	= PAGE_KERNEL;
+	jit_alloc_params.data.start	= VMALLOC_START;
+	jit_alloc_params.data.end	= VMALLOC_END;
 #else
 	jit_alloc_params.text.start = VMALLOC_START;
 	jit_alloc_params.text.end = VMALLOC_END;
diff --git a/include/linux/jitalloc.h b/include/linux/jitalloc.h
index 823b13706a90..7f8cafb3cfe9 100644
--- a/include/linux/jitalloc.h
+++ b/include/linux/jitalloc.h
@@ -45,6 +45,7 @@ struct jit_address_space {
  */
 struct jit_alloc_params {
 	struct jit_address_space	text;
+	struct jit_address_space	data;
 	enum jit_alloc_flags		flags;
 	unsigned int			alignment;
 };
@@ -53,6 +54,7 @@ struct jit_alloc_params *jit_alloc_arch_params(void);
 
 void jit_free(void *buf);
 void *jit_text_alloc(size_t len);
+void *jit_data_alloc(size_t len);
 
 #ifdef CONFIG_JIT_ALLOC
 void jit_alloc_init(void);
diff --git a/kernel/module/main.c b/kernel/module/main.c
index dfb7fa109f1a..91477aa5f671 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1195,25 +1195,16 @@ void __weak module_arch_freeing_init(struct module *mod)
 {
 }
 
-static bool mod_mem_use_vmalloc(enum mod_mem_type type)
-{
-	return IS_ENABLED(CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC) &&
-		mod_mem_type_is_core_data(type);
-}
-
 static void *module_memory_alloc(unsigned int size, enum mod_mem_type type)
 {
-	if (mod_mem_use_vmalloc(type))
-		return vzalloc(size);
+	if (mod_mem_type_is_data(type))
+		return jit_data_alloc(size);
 	return jit_text_alloc(size);
 }
 
 static void module_memory_free(void *ptr, enum mod_mem_type type)
 {
-	if (mod_mem_use_vmalloc(type))
-		vfree(ptr);
-	else
-		jit_free(ptr);
+	jit_free(ptr);
 }
 
 static void free_mod_mem(struct module *mod)
diff --git a/mm/jitalloc.c b/mm/jitalloc.c
index 221940e36b46..16fd715d501a 100644
--- a/mm/jitalloc.c
+++ b/mm/jitalloc.c
@@ -72,6 +72,20 @@ void *jit_text_alloc(size_t len)
 			 fallback_start, fallback_end, kasan);
 }
 
+void *jit_data_alloc(size_t len)
+{
+	unsigned int align = jit_alloc_params.alignment;
+	pgprot_t pgprot = jit_alloc_params.data.pgprot;
+	unsigned long start = jit_alloc_params.data.start;
+	unsigned long end = jit_alloc_params.data.end;
+	unsigned long fallback_start = jit_alloc_params.data.fallback_start;
+	unsigned long fallback_end = jit_alloc_params.data.fallback_end;
+	bool kasan = jit_alloc_params.flags & JIT_ALLOC_KASAN_SHADOW;
+
+	return jit_alloc(len, align, pgprot, start, end,
+			 fallback_start, fallback_end, kasan);
+}
+
 struct jit_alloc_params * __weak jit_alloc_arch_params(void)
 {
 	return NULL;
@@ -88,6 +102,23 @@ static bool jit_alloc_validate_params(struct jit_alloc_params *p)
 	return true;
 }
 
+static void jit_alloc_init_missing(struct jit_alloc_params *p)
+{
+	if (!pgprot_val(jit_alloc_params.data.pgprot))
+		jit_alloc_params.data.pgprot = PAGE_KERNEL;
+
+	if (!jit_alloc_params.data.start) {
+		jit_alloc_params.data.start = p->text.start;
+		jit_alloc_params.data.end = p->text.end;
+	}
+
+	if (!jit_alloc_params.data.fallback_start &&
+	    jit_alloc_params.text.fallback_start) {
+		jit_alloc_params.data.fallback_start = p->text.fallback_start;
+		jit_alloc_params.data.fallback_end = p->text.fallback_end;
+	}
+}
+
 void jit_alloc_init(void)
 {
 	struct jit_alloc_params *p = jit_alloc_arch_params();
@@ -97,6 +128,8 @@ void jit_alloc_init(void)
 			return;
 
 		jit_alloc_params = *p;
+		jit_alloc_init_missing(p);
+
 		return;
 	}
 
@@ -105,4 +138,7 @@ void jit_alloc_init(void)
 	jit_alloc_params.text.pgprot	= PAGE_KERNEL_EXEC;
 	jit_alloc_params.text.start	= VMALLOC_START;
 	jit_alloc_params.text.end	= VMALLOC_END;
+	jit_alloc_params.data.pgprot	= PAGE_KERNEL;
+	jit_alloc_params.data.start	= VMALLOC_START;
+	jit_alloc_params.data.end	= VMALLOC_END;
 }
-- 
2.35.1

