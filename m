Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D0A8BC20D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 May 2024 18:10:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mnzdUSuF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VXTyy5dD9z3fTv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 02:10:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mnzdUSuF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VXTvs4MWNz3ccL
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 02:07:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 50247CE0AB6;
	Sun,  5 May 2024 16:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556B2C4DDE6;
	Sun,  5 May 2024 16:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714925255;
	bh=S2WO9rrdnIu5PceUjVXVwYLrUCttkXy1oVefr4+OvH4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mnzdUSuFwZFr/+Ip2l7zLEpPo7HXw0QyaxcHIUqM8tYDbmvTYVi7whZRj6QYhAI5c
	 u+OLcnSpi7V7V0jzzVPB9rWa+rJA3dD3nlH+8wp77vvEuH9IEFWLpzyrsWjJPj/jKs
	 BDJmr/0582lWHgGlperk2Rs+BsENvYpmK5JvRFZoFvCPINOMHITRzkh8LcMznIdb8y
	 hOOVaEDM0UZeQGuU9MlrUVaRg389IJ8S7gihJymsFxUbKAYtkt7Avfm7rb5zhV1CaN
	 R6G5Pk6nhS/74iVs2XgCvdWj3a1mXB9GimpVhAzA7uDys6bqCeiKfazaVLcWk7io+d
	 ZIn5pR9SP9ZcA==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v8 04/16] sparc: simplify module_alloc()
Date: Sun,  5 May 2024 19:06:16 +0300
Message-ID: <20240505160628.2323363-5-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240505160628.2323363-1-rppt@kernel.org>
References: <20240505160628.2323363-1-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Sam Ravnborg <sam@ravnborg.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Liviu Dudau <liviu@dudau.co.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, =?UTF-8?q?Philippe=20Mathieu-D
 aud=C3=A9?= <philmd@linaro.org>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Define MODULES_VADDR and MODULES_END as VMALLOC_START and VMALLOC_END
for 32-bit and reduce module_alloc() to

	__vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END, ...)

as with the new defines the allocations becomes identical for both 32
and 64 bits.

While on it, drop unused include of <linux/jump_label.h>

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 arch/sparc/include/asm/pgtable_32.h |  2 ++
 arch/sparc/kernel/module.c          | 25 +------------------------
 2 files changed, 3 insertions(+), 24 deletions(-)

diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/pgtable_32.h
index 9e85d57ac3f2..62bcafe38b1f 100644
--- a/arch/sparc/include/asm/pgtable_32.h
+++ b/arch/sparc/include/asm/pgtable_32.h
@@ -432,6 +432,8 @@ static inline int io_remap_pfn_range(struct vm_area_struct *vma,
 
 #define VMALLOC_START           _AC(0xfe600000,UL)
 #define VMALLOC_END             _AC(0xffc00000,UL)
+#define MODULES_VADDR           VMALLOC_START
+#define MODULES_END             VMALLOC_END
 
 /* We provide our own get_unmapped_area to cope with VA holes for userland */
 #define HAVE_ARCH_UNMAPPED_AREA
diff --git a/arch/sparc/kernel/module.c b/arch/sparc/kernel/module.c
index 66c45a2764bc..d37adb2a0b54 100644
--- a/arch/sparc/kernel/module.c
+++ b/arch/sparc/kernel/module.c
@@ -21,35 +21,12 @@
 
 #include "entry.h"
 
-#ifdef CONFIG_SPARC64
-
-#include <linux/jump_label.h>
-
-static void *module_map(unsigned long size)
+void *module_alloc(unsigned long size)
 {
-	if (PAGE_ALIGN(size) > MODULES_LEN)
-		return NULL;
 	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
 				GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE,
 				__builtin_return_address(0));
 }
-#else
-static void *module_map(unsigned long size)
-{
-	return vmalloc(size);
-}
-#endif /* CONFIG_SPARC64 */
-
-void *module_alloc(unsigned long size)
-{
-	void *ret;
-
-	ret = module_map(size);
-	if (ret)
-		memset(ret, 0, size);
-
-	return ret;
-}
 
 /* Make generic code ignore STT_REGISTER dummy undefined symbols.  */
 int module_frob_arch_sections(Elf_Ehdr *hdr,
-- 
2.43.0

