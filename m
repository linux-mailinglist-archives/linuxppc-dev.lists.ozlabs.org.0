Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D0B8BC170
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 May 2024 16:34:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HouVCimm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VXRrk4Zc1z3fyc
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 00:34:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HouVCimm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VXRjc1B8zz3d2c
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 00:28:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 775C560C85;
	Sun,  5 May 2024 14:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E8EC4AF68;
	Sun,  5 May 2024 14:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714919314;
	bh=QWGTfmxM6u4L/G8sJRSYS9LtFcq3UHArwE9pGA7ZHH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HouVCimm5zjabPrPHbBxrJVWmW8jUHhus9RmA0vBjK24AhE+RiRRAmw6fnLtV9+mB
	 E8Zf6Qm/XH2RCzAzq6T2PoUko9u8kIBmzdN7a+qj2rZ9hJ7Ba09sdtGK8jnrLMrhfk
	 sfGbpF4bpAMeeLGuBF2UAemlSDdzUQifI5IDFYqMeZU86qvygTwnzqmd4UsljDVczA
	 8ULLCYI6frEKwv4cYmKbYL4WV0lkCL1DWorVc1kzahSkFadNEQDClCW8rIrO8p0cGu
	 yZuimlp3U1GOmPiigwpQc55F5FF/VKyrWPTNPAxZE25KpJ39SDIk3tsah1lyz5HRN+
	 SuLfdNBz4BL4g==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 11/17] powerpc: extend execmem_params for kprobes allocations
Date: Sun,  5 May 2024 17:25:54 +0300
Message-ID: <20240505142600.2322517-12-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240505142600.2322517-1-rppt@kernel.org>
References: <20240505142600.2322517-1-rppt@kernel.org>
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

powerpc overrides kprobes::alloc_insn_page() to remove writable
permissions when STRICT_MODULE_RWX is on.

Add definition of EXECMEM_KRPOBES to execmem_params to allow using the
generic kprobes::alloc_insn_page() with the desired permissions.

As powerpc uses breakpoint instructions to inject kprobes, it does not
need to constrain kprobe allocations to the modules area and can use the
entire vmalloc address space.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/powerpc/kernel/kprobes.c | 20 --------------------
 arch/powerpc/kernel/module.c  |  7 +++++++
 2 files changed, 7 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 9fcd01bb2ce6..14c5ddec3056 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -126,26 +126,6 @@ kprobe_opcode_t *arch_adjust_kprobe_addr(unsigned long addr, unsigned long offse
 	return (kprobe_opcode_t *)(addr + offset);
 }
 
-void *alloc_insn_page(void)
-{
-	void *page;
-
-	page = execmem_alloc(EXECMEM_KPROBES, PAGE_SIZE);
-	if (!page)
-		return NULL;
-
-	if (strict_module_rwx_enabled()) {
-		int err = set_memory_rox((unsigned long)page, 1);
-
-		if (err)
-			goto error;
-	}
-	return page;
-error:
-	execmem_free(page);
-	return NULL;
-}
-
 int arch_prepare_kprobe(struct kprobe *p)
 {
 	int ret = 0;
diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index ac80559015a3..2a23cf7e141b 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -94,6 +94,7 @@ static struct execmem_info execmem_info __ro_after_init;
 
 struct execmem_info __init *execmem_arch_setup(void)
 {
+	pgprot_t kprobes_prot = strict_module_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
 	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
 	unsigned long fallback_start = 0, fallback_end = 0;
 	unsigned long start, end;
@@ -132,6 +133,12 @@ struct execmem_info __init *execmem_arch_setup(void)
 				.fallback_start	= fallback_start,
 				.fallback_end	= fallback_end,
 			},
+			[EXECMEM_KPROBES] = {
+				.start	= VMALLOC_START,
+				.end	= VMALLOC_END,
+				.pgprot	= kprobes_prot,
+				.alignment = 1,
+			},
 			[EXECMEM_MODULE_DATA] = {
 				.start	= VMALLOC_START,
 				.end	= VMALLOC_END,
-- 
2.43.0

