Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 119A08B3267
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Apr 2024 10:30:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c24bKCQ5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQmBh52kWz3vj9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Apr 2024 18:30:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c24bKCQ5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQm9M5PTNz3vh0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 18:29:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA10F61DC2;
	Fri, 26 Apr 2024 08:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10782C2BD10;
	Fri, 26 Apr 2024 08:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714120165;
	bh=M6QQiy27Yx7cZTOC0617KB9Ln6pKKwikPWIcgenY/bM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c24bKCQ5nLfUTxCLWqOfgQrHZ66rXyNyy3K6/+7sZXY22/FWn10Lrl4zlYIe0pOUL
	 lMnQgr2DBeTE7Bdkj6zwaYAFThxItyYHuSMxTkR0gqtLqINDT0PqizlT6gcZfC4sUN
	 cieclkW2Qd72tX8Cj3W9rhCEbYpq2tQ2fcTxNT68cuSCVGGQF9jBPxBPfgkA9Q/udF
	 LO2K80uaKqbrLmZ/ItY6/g8LKcrRxJOXkN4u2sbfQDiJFWKzUulbs75isiDuLjTGaY
	 uzUNXOQZI0lkj3aD0OIRott2pxFL3MoWNBgluhl33vYY3U3o4rppM5pe3CB1zIuwEx
	 1m5Xuoq/+vTHA==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 01/16] arm64: module: remove unneeded call to kasan_alloc_module_shadow()
Date: Fri, 26 Apr 2024 11:28:39 +0300
Message-ID: <20240426082854.7355-2-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240426082854.7355-1-rppt@kernel.org>
References: <20240426082854.7355-1-rppt@kernel.org>
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

Since commit f6f37d9320a1 ("arm64: select KASAN_VMALLOC for SW/HW_TAGS
modes") KASAN_VMALLOC is always enabled when KASAN is on. This means
that allocations in module_alloc() will be tracked by KASAN protection
for vmalloc() and that kasan_alloc_module_shadow() will be always an
empty inline and there is no point in calling it.

Drop meaningless call to kasan_alloc_module_shadow() from
module_alloc().

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/arm64/kernel/module.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 47e0be610bb6..e92da4da1b2a 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -141,11 +141,6 @@ void *module_alloc(unsigned long size)
 				    __func__);
 	}
 
-	if (p && (kasan_alloc_module_shadow(p, size, GFP_KERNEL) < 0)) {
-		vfree(p);
-		return NULL;
-	}
-
 	/* Memory is intended to be executable, reset the pointer tag. */
 	return kasan_reset_tag(p);
 }
-- 
2.43.0

