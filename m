Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0501732AAD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 10:57:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tjvByEZn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjChn4bt6z3cN3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 18:57:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tjvByEZn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjCZm1bGxz3brC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 18:52:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 741B86298F;
	Fri, 16 Jun 2023 08:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EC5C433CB;
	Fri, 16 Jun 2023 08:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686905517;
	bh=B2AS/WR4xFCKseXYMdTiKKeL7nu8UkrYZoJGS68ejsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tjvByEZnMSDWipjUeKQ3Rwqa6Bnc8WsZduBUz1eLRzqSPfqzWN106gYEQSU//XIf1
	 l67itImeq52R36luGSQzNUsJ68sHZ/xmHrg629NgZZvqXUYlmGO3JQJj/bd/fFeFKl
	 +dlGyqNrFRTLxzqxLnHpKHTUupn5FXGtQixdRqD3nGt1Qtirqs9PgPm+ysYwFN3qmo
	 rha25n6IyjNvdT8LE44jnT/YRZtPrYlLNH+pSNZeEXCW+59woYzsm3x66jgLj3+4sx
	 07zO1nSgtuc4hukUEEfOmql504pMwv3/412mDRnU0Gqh/RXmgVKHo6runZks71Y/Zs
	 BiMhGWUvxJ+AQ==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/12] mm/execmem: introduce execmem_data_alloc()
Date: Fri, 16 Jun 2023 11:50:32 +0300
Message-Id: <20230616085038.4121892-7-rppt@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230616085038.4121892-1-rppt@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Data related to code allocations, such as module data section, need to
comply with architecture constraints for its placement and its
allocation right now was done using execmem_text_alloc().

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
 arch/powerpc/kernel/module.c |  8 +++++++
 include/linux/execmem.h      | 18 +++++++++++++++
 kernel/module/main.c         | 15 +++----------
 mm/execmem.c                 | 43 ++++++++++++++++++++++++++++++++++++
 4 files changed, 72 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index ba7abff77d98..4c6c15bf3947 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -103,6 +103,10 @@ struct execmem_params __init *execmem_arch_params(void)
 {
 	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
 
+	/*
+	 * BOOK3S_32 and 8xx define MODULES_VADDR for text allocations and
+	 * allow allocating data in the entire vmalloc space
+	 */
 #ifdef MODULES_VADDR
 	unsigned long limit = (unsigned long)_etext - SZ_32M;
 
@@ -116,6 +120,10 @@ struct execmem_params __init *execmem_arch_params(void)
 		execmem_params.modules.text.start = MODULES_VADDR;
 		execmem_params.modules.text.end = MODULES_END;
 	}
+	execmem_params.modules.data.start = VMALLOC_START;
+	execmem_params.modules.data.end = VMALLOC_END;
+	execmem_params.modules.data.pgprot = PAGE_KERNEL;
+	execmem_params.modules.data.alignment = 1;
 #else
 	execmem_params.modules.text.start = VMALLOC_START;
 	execmem_params.modules.text.end = VMALLOC_END;
diff --git a/include/linux/execmem.h b/include/linux/execmem.h
index b9a97fcdf3c5..2e1221310d13 100644
--- a/include/linux/execmem.h
+++ b/include/linux/execmem.h
@@ -44,10 +44,12 @@ enum execmem_module_flags {
  *				  space
  * @flags:	options for module memory allocations
  * @text:	address range for text allocations
+ * @data:	address range for data allocations
  */
 struct execmem_modules_range {
 	enum execmem_module_flags flags;
 	struct execmem_range text;
+	struct execmem_range data;
 };
 
 /**
@@ -89,6 +91,22 @@ struct execmem_params *execmem_arch_params(void);
  */
 void *execmem_text_alloc(size_t size);
 
+/**
+ * execmem_data_alloc - allocate memory for data coupled to code
+ * @size: how many bytes of memory are required
+ *
+ * Allocates memory that will contain data copupled with executable code,
+ * like data sections in kernel modules.
+ *
+ * The memory will have protections defined by architecture.
+ *
+ * The allocated memory will reside in an area that does not impose
+ * restrictions on the addressing modes.
+ *
+ * Return: a pointer to the allocated memory or %NULL
+ */
+void *execmem_data_alloc(size_t size);
+
 /**
  * execmem_free - free executable memory
  * @ptr: pointer to the memory that should be freed
diff --git a/kernel/module/main.c b/kernel/module/main.c
index b445c5ad863a..d6582bfec1f6 100644
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
+		return execmem_data_alloc(size);
 	return execmem_text_alloc(size);
 }
 
 static void module_memory_free(void *ptr, enum mod_mem_type type)
 {
-	if (mod_mem_use_vmalloc(type))
-		vfree(ptr);
-	else
-		execmem_free(ptr);
+	execmem_free(ptr);
 }
 
 static void free_mod_mem(struct module *mod)
diff --git a/mm/execmem.c b/mm/execmem.c
index a67acd75ffef..f7bf496ad4c3 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -63,6 +63,20 @@ void *execmem_text_alloc(size_t size)
 			     fallback_start, fallback_end, kasan);
 }
 
+void *execmem_data_alloc(size_t size)
+{
+	unsigned long start = execmem_params.modules.data.start;
+	unsigned long end = execmem_params.modules.data.end;
+	pgprot_t pgprot = execmem_params.modules.data.pgprot;
+	unsigned int align = execmem_params.modules.data.alignment;
+	unsigned long fallback_start = execmem_params.modules.data.fallback_start;
+	unsigned long fallback_end = execmem_params.modules.data.fallback_end;
+	bool kasan = execmem_params.modules.flags & EXECMEM_KASAN_SHADOW;
+
+	return execmem_alloc(size, start, end, align, pgprot,
+			     fallback_start, fallback_end, kasan);
+}
+
 void execmem_free(void *ptr)
 {
 	/*
@@ -101,6 +115,28 @@ static bool execmem_validate_params(struct execmem_params *p)
 	return true;
 }
 
+static void execmem_init_missing(struct execmem_params *p)
+{
+	struct execmem_modules_range *m = &p->modules;
+
+	if (!pgprot_val(execmem_params.modules.data.pgprot))
+		execmem_params.modules.data.pgprot = PAGE_KERNEL;
+
+	if (!execmem_params.modules.data.alignment)
+		execmem_params.modules.data.alignment = m->text.alignment;
+
+	if (!execmem_params.modules.data.start) {
+		execmem_params.modules.data.start = m->text.start;
+		execmem_params.modules.data.end = m->text.end;
+	}
+
+	if (!execmem_params.modules.data.fallback_start &&
+	    execmem_params.modules.text.fallback_start) {
+		execmem_params.modules.data.fallback_start = m->text.fallback_start;
+		execmem_params.modules.data.fallback_end = m->text.fallback_end;
+	}
+}
+
 void __init execmem_init(void)
 {
 	struct execmem_params *p = execmem_arch_params();
@@ -112,6 +148,11 @@ void __init execmem_init(void)
 		p->modules.text.pgprot = PAGE_KERNEL_EXEC;
 		p->modules.text.alignment = 1;
 
+		p->modules.data.start = VMALLOC_START;
+		p->modules.data.end = VMALLOC_END;
+		p->modules.data.pgprot = PAGE_KERNEL;
+		p->modules.data.alignment = 1;
+
 		return;
 	}
 
@@ -119,4 +160,6 @@ void __init execmem_init(void)
 		return;
 
 	execmem_params = *p;
+
+	execmem_init_missing(p);
 }
-- 
2.35.1

