Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D63C7199A0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 12:24:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX2Lq6qd2z3fq9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 20:24:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PpK9bveS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PpK9bveS;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QX27m3QXNz3dwP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 20:15:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A2B4564322;
	Thu,  1 Jun 2023 10:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881EDC433A8;
	Thu,  1 Jun 2023 10:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685614514;
	bh=KP9HX6DBOdeXbh1b+aKLs5zgkX2POLO57m2Kdhv+uBE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PpK9bveSqvpewvjbyZorKqSi3Q/F2n/LjJbM2xuj27cyV2j16y21onV4vnPjeZgTl
	 zE9e28Ev7BFmducrk1/4dDKq3oOIJdBaX0QRyCLXbMWkq7hyE5K3/dP7zLmKJI/u+J
	 lhU+vPxA/p2Jf8kS/aFYDSo6FeVktlpcm+nCEuVDQIry8EXyK9YUnYblgPqXCgLqeR
	 2j1GLCveGyj3OVEyE2BDq2GHbbfSv+yRuLfu/Nry87svP0BgLxAfXOGT4DOJSO+sz1
	 hW3iK555Pl8OaMr8Z+t77LXxqmLIyxUXr+Y3h+YIQv8TpNf780OllbwDGe20NNxSf6
	 l3zqIrjNIFEhQ==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 13/13] x86/jitalloc: make memory allocated for code ROX
Date: Thu,  1 Jun 2023 13:12:57 +0300
Message-Id: <20230601101257.530867-14-rppt@kernel.org>
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

When STRICT_KERNEL_RWX or STRICT_MODULE_RWX is enabled, force text
allocations to use KERNEL_PAGE_ROX.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/Kconfig             |  3 +++
 arch/x86/Kconfig         |  1 +
 arch/x86/kernel/ftrace.c |  3 ---
 arch/x86/mm/init.c       |  6 ++++++
 include/linux/jitalloc.h |  2 ++
 mm/jitalloc.c            | 21 +++++++++++++++++++++
 6 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 479a7b8be191..e7c4b01307d7 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1307,6 +1307,9 @@ config STRICT_MODULE_RWX
 	  and non-text memory will be made non-executable. This provides
 	  protection against certain security exploits (e.g. writing to text)
 
+config ARCH_HAS_TEXT_POKE
+	def_bool n
+
 # select if the architecture provides an asm/dma-direct.h header
 config ARCH_HAS_PHYS_TO_DMA
 	bool
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index fac4add6ce16..e1a512f557de 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -96,6 +96,7 @@ config X86
 	select ARCH_HAS_SET_DIRECT_MAP
 	select ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_HAS_STRICT_MODULE_RWX
+	select ARCH_HAS_TEXT_POKE
 	select ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
 	select ARCH_HAS_SYSCALL_WRAPPER
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index d50595f2c1a6..bd4dd8974ee6 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -313,7 +313,6 @@ create_trampoline(struct ftrace_ops *ops, unsigned int *tramp_size)
 	unsigned long call_offset;
 	unsigned long jmp_offset;
 	unsigned long offset;
-	unsigned long npages;
 	unsigned long size;
 	unsigned long *ptr;
 	void *trampoline;
@@ -350,7 +349,6 @@ create_trampoline(struct ftrace_ops *ops, unsigned int *tramp_size)
 		return 0;
 
 	*tramp_size = size + RET_SIZE + sizeof(void *);
-	npages = DIV_ROUND_UP(*tramp_size, PAGE_SIZE);
 
 	/* Copy ftrace_caller onto the trampoline memory */
 	ret = text_poke_copy(trampoline, (void *)start_offset, size);
@@ -416,7 +414,6 @@ create_trampoline(struct ftrace_ops *ops, unsigned int *tramp_size)
 	/* ALLOC_TRAMP flags lets us know we created it */
 	ops->flags |= FTRACE_OPS_FL_ALLOC_TRAMP;
 
-	set_memory_rox((unsigned long)trampoline, npages);
 	return (unsigned long)trampoline;
 fail:
 	tramp_free(trampoline);
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index ffaf9a3840ce..c314738991fa 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -1127,6 +1127,12 @@ struct jit_alloc_params *jit_alloc_arch_params(void)
 	jit_alloc_params.text.start = MODULES_VADDR + get_jit_load_offset();
 	jit_alloc_params.text.end = MODULES_END;
 
+	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) ||
+	    IS_ENABLED(CONFIG_STRICT_MODULE_RWX)) {
+		jit_alloc_params.text.pgprot = PAGE_KERNEL_ROX;
+		jit_alloc_params.flags |= JIT_ALLOC_USE_TEXT_POKE;
+	}
+
 	return &jit_alloc_params;
 }
 #endif /* CONFIG_JIT_ALLOC */
diff --git a/include/linux/jitalloc.h b/include/linux/jitalloc.h
index 0ba5ef785a85..0e29e87acefe 100644
--- a/include/linux/jitalloc.h
+++ b/include/linux/jitalloc.h
@@ -15,9 +15,11 @@
 /**
  * enum jit_alloc_flags - options for executable memory allocations
  * @JIT_ALLOC_KASAN_SHADOW:	allocate kasan shadow
+ * @JIT_ALLOC_USE_TEXT_POKE:	use text poking APIs to update memory
  */
 enum jit_alloc_flags {
 	JIT_ALLOC_KASAN_SHADOW	= (1 << 0),
+	JIT_ALLOC_USE_TEXT_POKE	= (1 << 1),
 };
 
 /**
diff --git a/mm/jitalloc.c b/mm/jitalloc.c
index a8ae64364d56..15d1067faf3f 100644
--- a/mm/jitalloc.c
+++ b/mm/jitalloc.c
@@ -7,6 +7,26 @@
 
 static struct jit_alloc_params jit_alloc_params;
 
+#ifdef CONFIG_ARCH_HAS_TEXT_POKE
+#include <asm/text-patching.h>
+
+static inline void jit_text_poke_copy(void *dst, const void *src, size_t len)
+{
+	if (jit_alloc_params.flags & JIT_ALLOC_USE_TEXT_POKE)
+		text_poke_copy(dst, src, len);
+	else
+		memcpy(dst, src, len);
+}
+
+static inline void jit_text_poke_set(void *addr, int c, size_t len)
+{
+	if (jit_alloc_params.flags & JIT_ALLOC_USE_TEXT_POKE)
+		text_poke_set(addr, c, len);
+	else
+		memset(addr, c, len);
+}
+
+#else
 static inline void jit_text_poke_copy(void *dst, const void *src, size_t len)
 {
 	memcpy(dst, src, len);
@@ -16,6 +36,7 @@ static inline void jit_text_poke_set(void *addr, int c, size_t len)
 {
 	memset(addr, c, len);
 }
+#endif
 
 static void *jit_alloc(size_t len, unsigned int alignment, pgprot_t pgprot,
 		       unsigned long start, unsigned long end,
-- 
2.35.1

