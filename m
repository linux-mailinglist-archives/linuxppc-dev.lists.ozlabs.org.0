Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F268A1966
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 18:08:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h/Pdoybv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFl3k4Hxxz3w1d
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 02:08:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h/Pdoybv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFkxq12Syz3vc9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 02:03:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D685620ED;
	Thu, 11 Apr 2024 16:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AAFAC32786;
	Thu, 11 Apr 2024 16:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712851389;
	bh=SKr2KE9uheUItEEdb+3dSNIPv9WQiBLJhcJ7LNHhua4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h/PdoybvhERinJCMHC+yQRAsmlncc6oU4utcSyu6AELKgJzyJVfzHf76aaTeaChXL
	 MpldlBly/9Jjz8av31uReShwgA9Wlq2qOfGfuBchPHxdljzoz5ojSKTJpFz36B8Zc1
	 2DsNtXjnq9CfKqqcXehaFdvhsqD42GyFk1ShEVXSbkFTR23dC8pO70bc8xYUW9wBzi
	 rRIEIbV18psznTztZqe/QTtYLOFeXNHkH8OQND+pcN7VGhqgRVfK5LTckwJ9fwgq3g
	 Q7po7BjAwo+Tu8x8tAJ4K4X4LQNucwifMC/HQQYPJ3qGF8eKjk76GPUw4vrFfWned9
	 MeSvQp+0Gx30w==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/15] arm64: extend execmem_info for generated code allocations
Date: Thu, 11 Apr 2024 19:00:44 +0300
Message-ID: <20240411160051.2093261-9-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240411160051.2093261-1-rppt@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-m
 ips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

The memory allocations for kprobes and BPF on arm64 can be placed
anywhere in vmalloc address space and currently this is implemented with
overrides of alloc_insn_page() and bpf_jit_alloc_exec() in arm64.

Define EXECMEM_KPROBES and EXECMEM_BPF ranges in arm64::execmem_info and
drop overrides of alloc_insn_page() and bpf_jit_alloc_exec().

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
Acked-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/module.c         | 14 ++++++++++++++
 arch/arm64/kernel/probes/kprobes.c |  7 -------
 arch/arm64/net/bpf_jit_comp.c      | 11 -----------
 3 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index a377a3217cf2..aa9e2b3d7459 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -115,6 +115,12 @@ static struct execmem_info execmem_info __ro_after_init = {
 		[EXECMEM_DEFAULT] = {
 			.alignment = MODULE_ALIGN,
 		},
+		[EXECMEM_KPROBES] = {
+			.alignment = 1,
+		},
+		[EXECMEM_BPF] = {
+			.alignment = 1,
+		},
 	},
 };
 
@@ -143,6 +149,14 @@ struct execmem_info __init *execmem_arch_setup(void)
 		r->end = module_plt_base + SZ_2G;
 	}
 
+	execmem_info.ranges[EXECMEM_KPROBES].pgprot = PAGE_KERNEL_ROX;
+	execmem_info.ranges[EXECMEM_KPROBES].start = VMALLOC_START;
+	execmem_info.ranges[EXECMEM_KPROBES].end = VMALLOC_END;
+
+	execmem_info.ranges[EXECMEM_BPF].pgprot = PAGE_KERNEL;
+	execmem_info.ranges[EXECMEM_BPF].start = VMALLOC_START;
+	execmem_info.ranges[EXECMEM_BPF].end = VMALLOC_END;
+
 	return &execmem_info;
 }
 
diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
index 327855a11df2..4268678d0e86 100644
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
index 122021f9bdfc..456f5af239fc 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -1793,17 +1793,6 @@ u64 bpf_jit_alloc_exec_limit(void)
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
2.43.0

