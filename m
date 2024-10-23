Return-Path: <linuxppc-dev+bounces-2522-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FBF9AD0BE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 18:29:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYZJc151lz2yyR;
	Thu, 24 Oct 2024 03:29:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729700992;
	cv=none; b=RbgxE4EIllC6JEPk5BpGwKK7cEHqqALqbCtLRMuyosHrVR3v7Q2pskREBEq5MpZHaAxi/LTxed2TcatGsGpzw0or5qiXNIaLx2u/jNzS0vhQOEHupDtp3oH1vDBmvSHS9cI3AEJAWATsoMeRlKJ63BpMwZXvkA7xLb/LX8UHB1ZXm8g+YqvOat/kHWwU3Qju3ZgcvN3ZRabBResLZCAPg1M+JqouA9oBu2JTDpJmLbAN+J4FawtUhcoFXRNq/44KIxz4JBiqHGIIDLMmKYxoienTNS8RL6Kc8+Qq5mDh63WIDZm5NJWKnmsbTQ3I11RCatvFKQzHRXzZ+9JCHKituA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729700992; c=relaxed/relaxed;
	bh=nMtx646qoAz8k0hrv0Ewms9p88A8qIHsv5cNI5fi5c0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LlMCUyhvWGr7/IuK12F6B04tRFbbWATDksoV9bGY2nYDCvSqgCFBqp+DEdt5EUU+knvQsYGT5zaWq0HAjKBXCqrAi1+d9W/BJN5/9u1FNtZelMI9yVj8c4IBPNllva/nqOFybOjeD7xNfS6ohfx0MbA/WNDIQnZS/sNZJPk0f6Y3HjLCYSnb55oWvznSyqG2xVNY+3KnZSJc38O83hC6b0UkdLCl1hnHPqFV+s0k4p6xSVEDyoTg6sPJTkutbZ4c50l90zFLP4y4xTchF6Y7aaEWyjUedX6dzvChgpBkH3rUPaNGBk5xrkiehrAxAxv2rGnfeTQVX93wFl/vdEgtcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CdMzqkFo; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CdMzqkFo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYZJb0hWHz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 03:29:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 49FACA41869;
	Wed, 23 Oct 2024 16:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 049B0C4CEE4;
	Wed, 23 Oct 2024 16:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729700987;
	bh=nyFGHJdxaOJGfMON4ADcqNZmm4B8ZcjCFybfUwv2QVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CdMzqkFoGWX2b7PqUYjaOLgPsSgx3plKCU2vqNIX57DWGYdA1jQq4ksX86hcp0Ugv
	 TTVaihtq3olFqvVRmH4ux8HQokYedngI7cAAhfPrCPYYsXHZZoiN6pzJ3nAylPiH7K
	 bb3YEyoMAywWZl5IK4NAIOnByYJRe15tMtAbd8c35ogVw5e7dfuIjpFNGGCC1fiF6J
	 /n44T1S2NIJoA2evc0gIvR+SyqVMDPqyfLYX2YcniiVUZMFhNwBT2CtJTAHhahGj3z
	 RBCgFt12Z6rRkFTgodgEgYga72XUQsWs+/9cBfVknah4t5l6IuPX9VAK7YH01aas8U
	 j3vCYJbVvZIxQ==
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
Subject: [PATCH v7 8/8] x86/module: enable ROX caches for module text on 64 bit
Date: Wed, 23 Oct 2024 19:27:11 +0300
Message-ID: <20241023162711.2579610-9-rppt@kernel.org>
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

Enable execmem's cache of PMD_SIZE'ed pages mapped as ROX for module
text allocations on 64 bit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Tested-by: kdevops <kdevops@lists.linux.dev>
---
 arch/x86/Kconfig   |  1 +
 arch/x86/mm/init.c | 37 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 2852fcd82cbd..ff71d18253ba 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -83,6 +83,7 @@ config X86
 	select ARCH_HAS_DMA_OPS			if GART_IOMMU || XEN
 	select ARCH_HAS_EARLY_DEBUG		if KGDB
 	select ARCH_HAS_ELF_RANDOMIZE
+	select ARCH_HAS_EXECMEM_ROX		if X86_64
 	select ARCH_HAS_FAST_MULTIPLIER
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index eb503f53c319..c2e4f389f47f 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -1053,18 +1053,53 @@ unsigned long arch_max_swapfile_size(void)
 #ifdef CONFIG_EXECMEM
 static struct execmem_info execmem_info __ro_after_init;
 
+#ifdef CONFIG_ARCH_HAS_EXECMEM_ROX
+void execmem_fill_trapping_insns(void *ptr, size_t size, bool writeable)
+{
+	/* fill memory with INT3 instructions */
+	if (writeable)
+		memset(ptr, INT3_INSN_OPCODE, size);
+	else
+		text_poke_set(ptr, INT3_INSN_OPCODE, size);
+}
+#endif
+
 struct execmem_info __init *execmem_arch_setup(void)
 {
 	unsigned long start, offset = 0;
+	enum execmem_range_flags flags;
+	pgprot_t pgprot;
 
 	if (kaslr_enabled())
 		offset = get_random_u32_inclusive(1, 1024) * PAGE_SIZE;
 
 	start = MODULES_VADDR + offset;
 
+	if (IS_ENABLED(CONFIG_ARCH_HAS_EXECMEM_ROX)) {
+		pgprot = PAGE_KERNEL_ROX;
+		flags = EXECMEM_KASAN_SHADOW | EXECMEM_ROX_CACHE;
+	} else {
+		pgprot = PAGE_KERNEL;
+		flags = EXECMEM_KASAN_SHADOW;
+	}
+
 	execmem_info = (struct execmem_info){
 		.ranges = {
-			[EXECMEM_DEFAULT] = {
+			[EXECMEM_MODULE_TEXT] = {
+				.flags	= flags,
+				.start	= start,
+				.end	= MODULES_END,
+				.pgprot	= pgprot,
+				.alignment = MODULE_ALIGN,
+			},
+			[EXECMEM_KPROBES ... EXECMEM_BPF] = {
+				.flags	= EXECMEM_KASAN_SHADOW,
+				.start	= start,
+				.end	= MODULES_END,
+				.pgprot	= PAGE_KERNEL,
+				.alignment = MODULE_ALIGN,
+			},
+			[EXECMEM_MODULE_DATA] = {
 				.flags	= EXECMEM_KASAN_SHADOW,
 				.start	= start,
 				.end	= MODULES_END,
-- 
2.43.0


