Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 252EA808B64
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 16:05:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=WpQC3mov;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmHdf4Bwpz3dWC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 02:05:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=WpQC3mov;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=alexghiti@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmHcm3nr2z3cYG
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 02:04:56 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-33348e711e0so1070424f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Dec 2023 07:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701961492; x=1702566292; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjO7lbfVOd3z5ovuMphYRbL/oKKYVGVFcCWOfr+CdbY=;
        b=WpQC3movOAYa7Ok2r6MN6VwmxWQZUMtOPUSMVYygGCLezX/yDE8kg6sxFbLsY1zHtv
         ksWTfp0LlW5UaPVXjgGYi9+2XaRldmgkTRihLA9T/pdwLvmkz+P/1N8mJjds4IlJDYto
         7BuT5AH5nWsC6AIlGI0UM3lnPk40naZm2fsJYDY9fqBKXnAh0nhNTPaTu/Xzgdks0mey
         mVonfbDHmP0d9tajC1ubw/DUkzv7v24NlLdHCA/rWqgtX7eC4V/lOAS2pkHBiU70qoQy
         u438ydVTuojoHCjELH6Csx0Sn7iWi5iKRMt32dAuQa6Bt7AQH322dxSUMlU6mzsIvMak
         v0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701961492; x=1702566292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjO7lbfVOd3z5ovuMphYRbL/oKKYVGVFcCWOfr+CdbY=;
        b=rmhsgYfuFF6acDaU0bdyB1xURwnWS70d76R5dxEVCQW5dLpS8FitKbJqhu4Q41ALW2
         ESF3zI4PybJJ8GyYhIIowMwewFTfknjR7FYrADSHyR1fiVtXxJyW0VzbnJeQTdhN97w6
         VRXeIasAjuLMjhC34TF6Is8n1OXVaKurGAAON41zIoWKKSivPtBt91OD2n82UE8W9bs6
         dOSC1YWuOvMxMNP0hY5ih9oXZzOrSe3a8JExLFT1ZirxxlKjCsXBJSgc+gYvAzQEKrFy
         1VXXRzK9TUd+3K47vEl+FxK1IMYSjlv26KMFYSRAhCrge+ZHj7If68rx4XBI/M2UhgRz
         lzqA==
X-Gm-Message-State: AOJu0YyOKOVOP4pWLCmVufimvZ+JtZDcDEh5d1cIVSGy1dXAJcXWVwYz
	ob4QxxbBWA1Sln2dez+LjUThaQ==
X-Google-Smtp-Source: AGHT+IHSI/0t5tXA9bwS1sCwP7hAVbXTwuyEMVxXnQWCRneQmLBavNOOSXDtGDpxWg7dQ2EGSdeIhg==
X-Received: by 2002:a05:600c:152:b0:40c:711:f492 with SMTP id w18-20020a05600c015200b0040c0711f492mr1593121wmm.181.1701961492195;
        Thu, 07 Dec 2023 07:04:52 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id gw18-20020a05600c851200b004053e9276easm2206857wmb.32.2023.12.07.07.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 07:04:51 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Matt Evans <mev@rivosinc.com>,
	Dylan Jhong <dylan@andestech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Subject: [PATCH RFC/RFT 1/4] riscv: Stop emitting preventive sfence.vma for new vmalloc mappings
Date: Thu,  7 Dec 2023 16:03:45 +0100
Message-Id: <20231207150348.82096-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207150348.82096-1-alexghiti@rivosinc.com>
References: <20231207150348.82096-1-alexghiti@rivosinc.com>
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In 6.5, we removed the vmalloc fault path because that can't work (see
[1] [2]). Then in order to make sure that new page table entries were
seen by the page table walker, we had to preventively emit a sfence.vma
on all harts [3] but this solution is very costly since it relies on IPI.

And even there, we could end up in a loop of vmalloc faults if a vmalloc
allocation is done in the IPI path (for example if it is traced, see
[4]), which could result in a kernel stack overflow.

Those preventive sfence.vma needed to be emitted because:

- if the uarch caches invalid entries, the new mapping may not be
  observed by the page table walker and an invalidation may be needed.
- if the uarch does not cache invalid entries, a reordered access
  could "miss" the new mapping and traps: in that case, we would actually
  only need to retry the access, no sfence.vma is required.

So this patch removes those preventive sfence.vma and actually handles
the possible (and unlikely) exceptions. And since the kernel stacks
mappings lie in the vmalloc area, this handling must be done very early
when the trap is taken, at the very beginning of handle_exception: this
also rules out the vmalloc allocations in the fault path.

Note that for now, we emit a sfence.vma even for uarchs that do not
cache invalid entries as we have no means to know that: that will be
fixed in the next patch.

Link: https://lore.kernel.org/linux-riscv/20230531093817.665799-1-bjorn@kernel.org/ [1]
Link: https://lore.kernel.org/linux-riscv/20230801090927.2018653-1-dylan@andestech.com [2]
Link: https://lore.kernel.org/linux-riscv/20230725132246.817726-1-alexghiti@rivosinc.com/ [3]
Link: https://lore.kernel.org/lkml/20200508144043.13893-1-joro@8bytes.org/ [4]
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/cacheflush.h  | 19 +++++-
 arch/riscv/include/asm/thread_info.h |  5 ++
 arch/riscv/kernel/asm-offsets.c      |  5 ++
 arch/riscv/kernel/entry.S            | 94 ++++++++++++++++++++++++++++
 arch/riscv/mm/init.c                 |  2 +
 5 files changed, 124 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 3cb53c4df27c..a916cbc69d47 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -37,7 +37,24 @@ static inline void flush_dcache_page(struct page *page)
 	flush_icache_mm(vma->vm_mm, 0)
 
 #ifdef CONFIG_64BIT
-#define flush_cache_vmap(start, end)	flush_tlb_kernel_range(start, end)
+extern u64 new_vmalloc[];
+extern char _end[];
+#define flush_cache_vmap flush_cache_vmap
+static inline void flush_cache_vmap(unsigned long start, unsigned long end)
+{
+	if ((start < VMALLOC_END && end > VMALLOC_START) ||
+	    (start < MODULES_END && end > MODULES_VADDR)) {
+		int i;
+
+		/*
+		 * We don't care if concurrently a cpu resets this value since
+		 * the only place this can happen is in handle_exception() where
+		 * an sfence.vma is emitted.
+		 */
+		for (i = 0; i < NR_CPUS / sizeof(u64) + 1; ++i)
+			new_vmalloc[i] = -1ULL;
+	}
+}
 #endif
 
 #ifndef CONFIG_SMP
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 1833beb00489..8fe12fa6c329 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -60,6 +60,11 @@ struct thread_info {
 	long			user_sp;	/* User stack pointer */
 	int			cpu;
 	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
+	/*
+	 * Used in handle_exception() to save a0, a1 and a2 before knowing if we
+	 * can access the kernel stack.
+	 */
+	unsigned long		a0, a1, a2;
 };
 
 /*
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index d6a75aac1d27..340c1c84560d 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -34,10 +34,15 @@ void asm_offsets(void)
 	OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
 	OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
 	OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
+
+	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
 	OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
 	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
+	OFFSET(TASK_TI_A0, task_struct, thread_info.a0);
+	OFFSET(TASK_TI_A1, task_struct, thread_info.a1);
+	OFFSET(TASK_TI_A2, task_struct, thread_info.a2);
 
 	OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
 	OFFSET(TASK_THREAD_F1,  task_struct, thread.fstate.f[1]);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 143a2bb3e697..3a3c7b563816 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -14,6 +14,88 @@
 #include <asm/asm-offsets.h>
 #include <asm/errata_list.h>
 
+.macro new_vmalloc_check
+	REG_S 	a0, TASK_TI_A0(tp)
+	REG_S 	a1, TASK_TI_A1(tp)
+	REG_S	a2, TASK_TI_A2(tp)
+
+	csrr 	a0, CSR_CAUSE
+	/* Exclude IRQs */
+	blt  	a0, zero, _new_vmalloc_restore_context
+	/* Only check new_vmalloc if we are in page/protection fault */
+	li   	a1, EXC_LOAD_PAGE_FAULT
+	beq  	a0, a1, _new_vmalloc_kernel_address
+	li   	a1, EXC_STORE_PAGE_FAULT
+	beq  	a0, a1, _new_vmalloc_kernel_address
+	li   	a1, EXC_INST_PAGE_FAULT
+	bne  	a0, a1, _new_vmalloc_restore_context
+
+_new_vmalloc_kernel_address:
+	/* Is it a kernel address? */
+	csrr 	a0, CSR_TVAL
+	bge 	a0, zero, _new_vmalloc_restore_context
+
+	/* Check if a new vmalloc mapping appeared that could explain the trap */
+
+	/*
+	 * Computes:
+	 * a0 = &new_vmalloc[BIT_WORD(cpu)]
+	 * a1 = BIT_MASK(cpu)
+	 */
+	REG_L 	a2, TASK_TI_CPU(tp)
+	/*
+	 * Compute the new_vmalloc element position:
+	 * (cpu / 64) * 8 = (cpu >> 6) << 3
+	 */
+	srli	a1, a2, 6
+	slli	a1, a1, 3
+	la	a0, new_vmalloc
+	add	a0, a0, a1
+	/*
+	 * Compute the bit position in the new_vmalloc element:
+	 * bit_pos = cpu % 64 = cpu - (cpu / 64) * 64 = cpu - (cpu >> 6) << 6
+	 * 	   = cpu - ((cpu >> 6) << 3) << 3
+	 */
+	slli	a1, a1, 3
+	sub	a1, a2, a1
+	/* Compute the "get mask": 1 << bit_pos */
+	li	a2, 1
+	sll	a1, a2, a1
+
+	/* Check the value of new_vmalloc for this cpu */
+	ld	a2, 0(a0)
+	and	a2, a2, a1
+	beq	a2, zero, _new_vmalloc_restore_context
+
+	ld	a2, 0(a0)
+	not	a1, a1
+	and	a1, a2, a1
+	sd	a1, 0(a0)
+
+	/* Only emit a sfence.vma if the uarch caches invalid entries */
+	la	a0, tlb_caching_invalid_entries
+	lb	a0, 0(a0)
+	beqz	a0, _new_vmalloc_no_caching_invalid_entries
+	sfence.vma
+_new_vmalloc_no_caching_invalid_entries:
+	// debug
+	la	a0, nr_sfence_vma_handle_exception
+	li	a1, 1
+	amoadd.w    a0, a1, (a0)
+	// end debug
+	REG_L	a0, TASK_TI_A0(tp)
+	REG_L	a1, TASK_TI_A1(tp)
+	REG_L	a2, TASK_TI_A2(tp)
+	csrw	CSR_SCRATCH, x0
+	sret
+
+_new_vmalloc_restore_context:
+	REG_L	a0, TASK_TI_A0(tp)
+	REG_L 	a1, TASK_TI_A1(tp)
+	REG_L 	a2, TASK_TI_A2(tp)
+.endm
+
+
 SYM_CODE_START(handle_exception)
 	/*
 	 * If coming from userspace, preserve the user thread pointer and load
@@ -25,6 +107,18 @@ SYM_CODE_START(handle_exception)
 
 _restore_kernel_tpsp:
 	csrr tp, CSR_SCRATCH
+
+	/*
+	 * The RISC-V kernel does not eagerly emit a sfence.vma after each
+	 * new vmalloc mapping, which may result in exceptions:
+	 * - if the uarch caches invalid entries, the new mapping would not be
+	 *   observed by the page table walker and an invalidation is needed.
+	 * - if the uarch does not cache invalid entries, a reordered access
+	 *   could "miss" the new mapping and traps: in that case, we only need
+	 *   to retry the access, no sfence.vma is required.
+	 */
+	new_vmalloc_check
+
 	REG_S sp, TASK_TI_KERNEL_SP(tp)
 
 #ifdef CONFIG_VMAP_STACK
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0798bd861dcb..379403de6c6f 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -36,6 +36,8 @@
 
 #include "../kernel/head.h"
 
+u64 new_vmalloc[NR_CPUS / sizeof(u64) + 1];
+
 struct kernel_mapping kernel_map __ro_after_init;
 EXPORT_SYMBOL(kernel_map);
 #ifdef CONFIG_XIP_KERNEL
-- 
2.39.2

