Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B89A77A42DA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 09:35:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ojfgNgsu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RpxRB3ygqz3dL9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 17:35:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ojfgNgsu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RpxL16hV3z3cDr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 17:31:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 44E2A60E15;
	Mon, 18 Sep 2023 07:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68ED7C433C8;
	Mon, 18 Sep 2023 07:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695022263;
	bh=mbiiTE+Ax/Si/BZxcJVEdVXi15nThNmQlUqiyILb0zo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ojfgNgsup07S+iaZErkHdPn6pFXvUxpfd0rqcJ0g/fFjdgDTdp5RCwZChtRwqs+hU
	 358zdLhiRZXyw3aIFuKwPq3ciyzug59B+euqQg31hDJF2IYAsE+6D264chrRpy0JCv
	 lIJDaEg0ezBhP+IOLDXi95uXUolbh37QjiMgyCp6vToq0/niAQX3TSUJ4+A3chXFuR
	 Fz6pQnaNxbhFzVVMJL+/JI6h0Va38Wr9Y8Zzq0rWzkuGOl0+j0c7QpIR3g6g0WJ4vh
	 Na6tomyrzTQLlYxetqXYeBzvBjSJ3J7TMO8PQeFVdg4iyOutejtYTgrDjMGzC7l/J1
	 0uZomhqve3rWw==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/13] modules, execmem: drop module_alloc
Date: Mon, 18 Sep 2023 10:29:47 +0300
Message-Id: <20230918072955.2507221-6-rppt@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230918072955.2507221-1-rppt@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis
  Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Define default parameters for address range for code allocations using
the current values in module_alloc() and make execmem_text_alloc() use
these defaults when an architecture does not supply its specific
parameters.

With this, execmem_text_alloc() implements memory allocation in a way
compatible with module_alloc() and can be used as a replacement for
module_alloc().

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/execmem.h      |  8 ++++++++
 include/linux/moduleloader.h | 12 ------------
 kernel/module/main.c         |  7 -------
 mm/execmem.c                 | 12 ++++++++----
 4 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/include/linux/execmem.h b/include/linux/execmem.h
index 806ad1a0088d..519bdfdca595 100644
--- a/include/linux/execmem.h
+++ b/include/linux/execmem.h
@@ -4,6 +4,14 @@
 
 #include <linux/types.h>
 
+#if (defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)) && \
+		!defined(CONFIG_KASAN_VMALLOC)
+#include <linux/kasan.h>
+#define MODULE_ALIGN (PAGE_SIZE << KASAN_SHADOW_SCALE_SHIFT)
+#else
+#define MODULE_ALIGN PAGE_SIZE
+#endif
+
 /**
  * enum execmem_type - types of executable memory ranges
  *
diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
index a23718aa2f4d..8c81f389117d 100644
--- a/include/linux/moduleloader.h
+++ b/include/linux/moduleloader.h
@@ -25,10 +25,6 @@ int module_frob_arch_sections(Elf_Ehdr *hdr,
 /* Additional bytes needed by arch in front of individual sections */
 unsigned int arch_mod_section_prepend(struct module *mod, unsigned int section);
 
-/* Allocator used for allocating struct module, core sections and init
-   sections.  Returns NULL on failure. */
-void *module_alloc(unsigned long size);
-
 /* Determines if the section name is an init section (that is only used during
  * module loading).
  */
@@ -118,12 +114,4 @@ void module_arch_cleanup(struct module *mod);
 /* Any cleanup before freeing mod->module_init */
 void module_arch_freeing_init(struct module *mod);
 
-#if (defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)) && \
-		!defined(CONFIG_KASAN_VMALLOC)
-#include <linux/kasan.h>
-#define MODULE_ALIGN (PAGE_SIZE << KASAN_SHADOW_SCALE_SHIFT)
-#else
-#define MODULE_ALIGN PAGE_SIZE
-#endif
-
 #endif
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 4ec982cc943c..c4146bfcd0a7 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1601,13 +1601,6 @@ static void free_modinfo(struct module *mod)
 	}
 }
 
-void * __weak module_alloc(unsigned long size)
-{
-	return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
-			GFP_KERNEL, PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS,
-			NUMA_NO_NODE, __builtin_return_address(0));
-}
-
 bool __weak module_init_section(const char *name)
 {
 	return strstarts(name, ".init");
diff --git a/mm/execmem.c b/mm/execmem.c
index a8c2f44d0133..abcbd07e05ac 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -55,9 +55,6 @@ static void *execmem_alloc(size_t size, struct execmem_range *range)
 
 void *execmem_text_alloc(enum execmem_type type, size_t size)
 {
-	if (!execmem_params.ranges[type].start)
-		return module_alloc(size);
-
 	return execmem_alloc(size, &execmem_params.ranges[type]);
 }
 
@@ -111,8 +108,15 @@ void __init execmem_init(void)
 {
 	struct execmem_params *p = execmem_arch_params();
 
-	if (!p)
+	if (!p) {
+		p = &execmem_params;
+		p->ranges[EXECMEM_DEFAULT].start = VMALLOC_START;
+		p->ranges[EXECMEM_DEFAULT].end = VMALLOC_END;
+		p->ranges[EXECMEM_DEFAULT].pgprot = PAGE_KERNEL_EXEC;
+		p->ranges[EXECMEM_DEFAULT].alignment = 1;
+
 		return;
+	}
 
 	if (!execmem_validate_params(p))
 		return;
-- 
2.39.2

