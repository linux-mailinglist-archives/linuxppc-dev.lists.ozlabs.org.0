Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0B38AC81F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 10:56:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sO4wTbB+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNJy62dv2z3w1q
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 18:56:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sO4wTbB+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNJrM1nFmz3vXP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 18:51:15 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 661C260D39;
	Mon, 22 Apr 2024 08:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54B0C113CC;
	Mon, 22 Apr 2024 08:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713775873;
	bh=lHpN+d0QRuUVXJIB1eReja4FWUfXvpd+hME9aJI8tNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sO4wTbB+Milo3xS+lLBG3XWGzAtuQNj9vPNus4JsUmgfbe8gEP4GhjKuaPghll8ad
	 AIL4PHWve7PCKN2gpwuzIrT1A0qMYLaMmX9Mbk5GP1i+0ImBflhvG/HDKJ89MJLS7C
	 NSegGqr+fYAhlsYGHPsTd4qCsBTID69/OIaM+hwcwpdK/vdai/Cmc3WZQUIwFKMf2l
	 sH+rF9Y+jCRKBnnUGS6fxPjHVdYE9oR4TuuD1NzcbrL1Uo008iZkwtxC47vH1y20ws
	 N/AdwVXRGgfWFdYdBbqVwJ9sHu6lojECBJYUuES8MHpkRwaKf/ofhZDClHBd2mup1e
	 zf4ynpfxlW1VA==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 12/15] x86/ftrace: enable dynamic ftrace without CONFIG_MODULES
Date: Mon, 22 Apr 2024 11:50:25 +0300
Message-ID: <20240422085028.3602777-3-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422085028.3602777-1-rppt@kernel.org>
References: <20240422085028.3602777-1-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Sam Ravnborg <sam@ravnborg.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <ke
 nt.overstreet@linux.dev>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Dynamic ftrace must allocate memory for code and this was impossible
without CONFIG_MODULES.

With execmem separated from the modules code, execmem_text_alloc() is
available regardless of CONFIG_MODULES.

Remove dependency of dynamic ftrace on CONFIG_MODULES and make
CONFIG_DYNAMIC_FTRACE select CONFIG_EXECMEM in Kconfig.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/x86/Kconfig         |  1 +
 arch/x86/kernel/ftrace.c | 10 ----------
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 3f5ba72c9480..cd8addb96a0b 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -34,6 +34,7 @@ config X86_64
 	select SWIOTLB
 	select ARCH_HAS_ELFCORE_COMPAT
 	select ZONE_DMA32
+	select EXECMEM if DYNAMIC_FTRACE
 
 config FORCE_DYNAMIC_FTRACE
 	def_bool y
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index c8ddb7abda7c..8da0e66ca22d 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -261,8 +261,6 @@ void arch_ftrace_update_code(int command)
 /* Currently only x86_64 supports dynamic trampolines */
 #ifdef CONFIG_X86_64
 
-#ifdef CONFIG_MODULES
-/* Module allocation simplifies allocating memory for code */
 static inline void *alloc_tramp(unsigned long size)
 {
 	return execmem_alloc(EXECMEM_FTRACE, size);
@@ -271,14 +269,6 @@ static inline void tramp_free(void *tramp)
 {
 	execmem_free(tramp);
 }
-#else
-/* Trampolines can only be created if modules are supported */
-static inline void *alloc_tramp(unsigned long size)
-{
-	return NULL;
-}
-static inline void tramp_free(void *tramp) { }
-#endif
 
 /* Defined as markers to the end of the ftrace default trampolines */
 extern void ftrace_regs_caller_end(void);
-- 
2.43.0

