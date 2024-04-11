Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 376688A19BE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 18:19:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eRW/q4WS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFlJ406SDz3vxK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 02:19:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eRW/q4WS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFl1w1gD0z3vfF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 02:06:44 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7DC02620F0;
	Thu, 11 Apr 2024 16:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A810C4AF09;
	Thu, 11 Apr 2024 16:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712851602;
	bh=GpS8ytfjSzE76nC42qU8VRxGL9fjdKFDqm8vIE1x4YY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eRW/q4WS++c0r4pBuIO3O4Xg4RhucjdHqnNZoi79AHoLhQPJWC7o5buwGGFBPvniC
	 VKRspPAvG+oxGO/Mu52T5QZWLHipAdpse5TDkTXl4UCRQQbTzoV2tVhPjQUCAlmNo0
	 NG232/NssiPa7JNKn0tv4mghHev6HdVbKr+LbbRCokaCTTwVdChPLdcxxCtgfIMnpO
	 Z1hyZ7UoVGi2N4el/7GuNUEzPhXZ5vzgMOKVlVVadMtRh3z+39u712GiPM9IWHw2qe
	 adjgDWeIItjJVb1bdKVNluXidKTvt1LLI9M1CnLR4urws3bFChygnRYjAkvNDCL/IG
	 2uw/kGGX3wdrg==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 7/7] x86/module: enable ROX caches for module text
Date: Thu, 11 Apr 2024 19:05:26 +0300
Message-ID: <20240411160526.2093408-8-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240411160526.2093408-1-rppt@kernel.org>
References: <20240411160526.2093408-1-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Christoph Hellwig <hch@infradead.org>, linux-trace-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, Luis Chamberlain <mcgrof@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-modules@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
 , Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Enable execmem's cache of PMD_SIZE'ed pages mapped as ROX for module
text allocations.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/x86/mm/init.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index 8e8cd0de3af6..049a8b4c64e2 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -1102,9 +1102,23 @@ unsigned long arch_max_swapfile_size(void)
 #endif
 
 #ifdef CONFIG_EXECMEM
+static void execmem_invalidate(void *ptr, size_t size, bool writeable)
+{
+	/* fill memory with INT3 instructions */
+	if (writeable)
+		memset(ptr, 0xcc, size);
+	else
+		text_poke_set(ptr, 0xcc, size);
+}
+
 static struct execmem_info execmem_info __ro_after_init = {
+	.invalidate = execmem_invalidate,
 	.ranges = {
-		[EXECMEM_DEFAULT] = {
+		[EXECMEM_MODULE_TEXT] = {
+			.flags = EXECMEM_KASAN_SHADOW | EXECMEM_ROX_CACHE,
+			.alignment = MODULE_ALIGN,
+		},
+		[EXECMEM_KPROBES...EXECMEM_MODULE_DATA] = {
 			.flags = EXECMEM_KASAN_SHADOW,
 			.alignment = MODULE_ALIGN,
 		},
@@ -1119,9 +1133,16 @@ struct execmem_info __init *execmem_arch_setup(void)
 		offset = get_random_u32_inclusive(1, 1024) * PAGE_SIZE;
 
 	start = MODULES_VADDR + offset;
-	execmem_info.ranges[EXECMEM_DEFAULT].start = start;
-	execmem_info.ranges[EXECMEM_DEFAULT].end = MODULES_END;
-	execmem_info.ranges[EXECMEM_DEFAULT].pgprot = PAGE_KERNEL;
+
+	for (int i = EXECMEM_MODULE_TEXT; i < EXECMEM_TYPE_MAX; i++) {
+		struct execmem_range *r = &execmem_info.ranges[i];
+
+		r->start = start;
+		r->end = MODULES_END;
+		r->pgprot = PAGE_KERNEL;
+	}
+
+	execmem_info.ranges[EXECMEM_MODULE_TEXT].pgprot = PAGE_KERNEL_ROX;
 
 	return &execmem_info;
 }
-- 
2.43.0

