Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 290987A42E3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 09:37:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QwbKIwCm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RpxT50Rgrz3dSF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 17:37:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QwbKIwCm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RpxLP6bfcz3bVp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 17:31:25 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id B566CCE0BDB;
	Mon, 18 Sep 2023 07:31:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F8CC433BF;
	Mon, 18 Sep 2023 07:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695022283;
	bh=uhUpg7LkgDj87OPKWv+2ZQQTqeXwsgqGQfVhMMOlf6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QwbKIwCmsi/m+QIPzGWyDvn+Tk81CaEzaNlQaj1OrbfY6aH7VjNTOMfyqPjfbO3ZI
	 IrekkL8ga776lr+J3x8Ygyh2wVMU8QELU6aweeJeBpGEbBfrtJxHf+rNjrvDsHVs7+
	 6bm1TS2tPNGOkx/h7R28N2r8hennFfDFz6aE6FuiYGkO4GZPqz8JGrUJkS1iup7wLd
	 Isg0JWVRjOAmJTjw/rUuKi838+cqznX9dO82PejgtCEzU2RQuKCDDPVyOOKasyX6kb
	 8fpNnivohYt0YSrYt8tzLAAtD+1zq8pRlzkl8JhZ7kRPGcY2/LRuqibiB20CPobXX4
	 xLjJAnEDRG4hQ==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/13] arm64, execmem: extend execmem_params for generated code allocations
Date: Mon, 18 Sep 2023 10:29:49 +0300
Message-Id: <20230918072955.2507221-8-rppt@kernel.org>
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

The memory allocations for kprobes and BPF on arm64 can be placed
anywhere in vmalloc address space and currently this is implemented with
overrides of alloc_insn_page() and bpf_jit_alloc_exec() in arm64.

Define EXECMEM_KPROBES and EXECMEM_BPF ranges in arm64::execmem_params and
drop overrides of alloc_insn_page() and bpf_jit_alloc_exec().

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/arm64/kernel/module.c         | 13 +++++++++++++
 arch/arm64/kernel/probes/kprobes.c |  7 -------
 arch/arm64/net/bpf_jit_comp.c      | 11 -----------
 3 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index cd6320de1c54..d27db168d2a2 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -116,6 +116,16 @@ static struct execmem_params execmem_params __ro_after_init = {
 			.flags = EXECMEM_KASAN_SHADOW,
 			.alignment = MODULE_ALIGN,
 		},
+		[EXECMEM_KPROBES] = {
+			.start = VMALLOC_START,
+			.end = VMALLOC_END,
+			.alignment = 1,
+		},
+		[EXECMEM_BPF] = {
+			.start = VMALLOC_START,
+			.end = VMALLOC_END,
+			.alignment = 1,
+		},
 	},
 };
 
@@ -140,6 +150,9 @@ struct execmem_params __init *execmem_arch_params(void)
 		r->end = module_plt_base + SZ_2G;
 	}
 
+	execmem_params.ranges[EXECMEM_KPROBES].pgprot = PAGE_KERNEL_ROX;
+	execmem_params.ranges[EXECMEM_BPF].pgprot = PAGE_KERNEL;
+
 	return &execmem_params;
 }
 
diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
index 70b91a8c6bb3..6fccedd02b2a 100644
--- a/arch/arm64/kernel/probes/kprobes.c
+++ b/arch/arm64/kernel/probes/kprobes.c
@@ -129,13 +129,6 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
 	return 0;
 }
 
-void *alloc_insn_page(void)
-{
-	return __vmalloc_node_range(PAGE_SIZE, 1, VMALLOC_START, VMALLOC_END,
-			GFP_KERNEL, PAGE_KERNEL_ROX, VM_FLUSH_RESET_PERMS,
-			NUMA_NO_NODE, __builtin_return_address(0));
-}
-
 /* arm kprobe: install breakpoint in text */
 void __kprobes arch_arm_kprobe(struct kprobe *p)
 {
diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 150d1c6543f7..3a7590f828d1 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -1687,17 +1687,6 @@ u64 bpf_jit_alloc_exec_limit(void)
 	return VMALLOC_END - VMALLOC_START;
 }
 
-void *bpf_jit_alloc_exec(unsigned long size)
-{
-	/* Memory is intended to be executable, reset the pointer tag. */
-	return kasan_reset_tag(vmalloc(size));
-}
-
-void bpf_jit_free_exec(void *addr)
-{
-	return vfree(addr);
-}
-
 /* Indicate the JIT backend supports mixing bpf2bpf and tailcalls. */
 bool bpf_jit_supports_subprog_tailcalls(void)
 {
-- 
2.39.2

