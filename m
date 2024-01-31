Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 915EF84439F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 17:03:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=kylWRKZt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQ6Jm3YKYz3vqP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 03:03:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=kylWRKZt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=alexghiti@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQ6J14H9Tz3cbQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Feb 2024 03:02:41 +1100 (AEDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-55f7b91ce4fso1697129a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 08:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706716957; x=1707321757; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=roEDJI/JlVTVXh0TwtWic11MC5sMgNCSBaun+agzxOw=;
        b=kylWRKZtiXb3ayv7WTwy60x4SsTSdGJcbFvlKikClYkzgpW8Oc0fhxIdR7tWHJ+FCg
         xbMusRNuiOHvd5pCaClF8nVfdlc1hrBqWnMtZH5iPCgy1nBqXVWHf6OBRfWBsmUIbHqI
         2x8FIpJPam5LRVrvRgvYL0VMqOBqvZHUU6ueYw+Fk9DIwiHrszZOYq4FN37qPZ5Bp4SQ
         pVi+3WXcv+GxZQijNbx7knimsFhm3XL64ouRdxDPClPxCc5FHyBjvetuDFi7QSGLN9y+
         yuXwSmZd7NHp4vkU9d2ZVfU9koMISRV/21O0xDzvfvpf0ArnBFiG1HdXWU8DpGABC0Ea
         EClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706716957; x=1707321757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=roEDJI/JlVTVXh0TwtWic11MC5sMgNCSBaun+agzxOw=;
        b=sbM5MbJfI0PUyU5/xfzm59NaTPyVPpYDSdAULJ7X6U+v5Dhv4E++FdaJckLT7Dv34T
         tpczy/YjFxg6FncMXa68DrI4sB7hpS2q6Kr8gE+fOvJoeppeYc3xHNYtimNg7FzZDg+z
         v/8qIYwp78a3HoXUcKkAquc4TsSppQuBtVJE4ve56BY9RNFKdO2QkAJ0JvxjXtm2V836
         SY9FFf0J44tbFcNL2ydnk7Ja7shjORoTyBkXPNziBTbgN+53/lrCIBDKbl8AVryEk+wW
         E2HJQ8kcw7wzC2jP7RxWQCQ/1xw18nYzVll2tMYOgOmSbDIcBb6s+BT4Fn5oc4YnWhqr
         7/yQ==
X-Gm-Message-State: AOJu0YxSPPdUr26ZmRKq9Sy5IzgjW9zB1CZTvhPS+ciocgJ1u3yPA6Ls
	xV0BOvFxbvhpcwB061mclVaQm+lyIGzF8heVb46SmcJwxWjYiQbFrNvCGGTMsBo=
X-Google-Smtp-Source: AGHT+IGv2jgdsIvvr3em1Asod7wMzF0cwySX89l1VDTNJRgzTu/LSzdp9sUvQ6blXvUGsP80SoaKkg==
X-Received: by 2002:a17:907:a642:b0:a33:8fed:b9d5 with SMTP id vu2-20020a170907a64200b00a338fedb9d5mr4201411ejc.3.1706716957070;
        Wed, 31 Jan 2024 08:02:37 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXfm71N3T9h/F/CiQJuplDKsyuZZyOxCnpmTyjV18wHTQsMSdQnNkDDdJ4IMI8MOZMMdnUoibCHWjlKo3QMlFwAcKN2+h/dhl9NOsGzXN1JsWeY0jSAXt6kygdx5jmO3bK8iZoFHuM2PCTSYsG7ZfsOCsijcVgRagvcQVE7W3iHU8yMR10JnIGM7RSSzqhflRVpTacDW+JT62844/5FGpifmIx9ZrJrM32TGTe40Mjtw8mBvhFaS6bJSQuAKlFrcU4DEPoIWsMIUm9fjVLrTF8RvqX/J91AqrinE9UD4tO4ISOhc5MQDo4RKGEVsopkso7aPjriJ0cD9+Fss4m7V8IDYYZMnwGS9GvlGIDV9Lpae7a5DoYsVx56yheDZ7eUUC3WsLxo3l24ZoumYteEnZZiZMbL+5fvvxzGV7neS1WG53zX6tmFIdvnLEkuWqR6qDg47MOvifLiRGbtfsAarzJgey4UMkS9f6zlL5NDt6UJmERiwr0V+mC8T+2+z3IXDIyygRYyz24aCKxBXWJVx+XxUH3fJWDXb0YlsqC+SlGK4xdQccCUJyTO8t+9ksDUDrwdR5XNwyKgcWRZY7NyfNHedMNeXUVCCVKsxJI5vH9PqtlKzjTXdPyWbekeU+53OewZjRnfybXkDRYbEg==
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id vh8-20020a170907d38800b00a3040040011sm180335ejc.45.2024.01.31.08.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 08:02:36 -0800 (PST)
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
Subject: [PATCH RFC/RFT v2 3/4] riscv: Stop emitting preventive sfence.vma for new vmalloc mappings
Date: Wed, 31 Jan 2024 16:59:28 +0100
Message-Id: <20240131155929.169961-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131155929.169961-1-alexghiti@rivosinc.com>
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
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

Link: https://lore.kernel.org/linux-riscv/20230531093817.665799-1-bjorn@kernel.org/ [1]
Link: https://lore.kernel.org/linux-riscv/20230801090927.2018653-1-dylan@andestech.com [2]
Link: https://lore.kernel.org/linux-riscv/20230725132246.817726-1-alexghiti@rivosinc.com/ [3]
Link: https://lore.kernel.org/lkml/20200508144043.13893-1-joro@8bytes.org/ [4]
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/cacheflush.h  | 18 +++++-
 arch/riscv/include/asm/thread_info.h |  5 ++
 arch/riscv/kernel/asm-offsets.c      |  5 ++
 arch/riscv/kernel/entry.S            | 84 ++++++++++++++++++++++++++++
 arch/riscv/mm/init.c                 |  2 +
 5 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index a129dac4521d..b0d631701757 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -37,7 +37,23 @@ static inline void flush_dcache_page(struct page *page)
 	flush_icache_mm(vma->vm_mm, 0)
 
 #ifdef CONFIG_64BIT
-#define flush_cache_vmap(start, end)		flush_tlb_kernel_range(start, end)
+extern u64 new_vmalloc[NR_CPUS / sizeof(u64) + 1];
+extern char _end[];
+#define flush_cache_vmap flush_cache_vmap
+static inline void flush_cache_vmap(unsigned long start, unsigned long end)
+{
+	if (is_vmalloc_or_module_addr((void *)start)) {
+		int i;
+
+		/*
+		 * We don't care if concurrently a cpu resets this value since
+		 * the only place this can happen is in handle_exception() where
+		 * an sfence.vma is emitted.
+		 */
+		for (i = 0; i < ARRAY_SIZE(new_vmalloc); ++i)
+			new_vmalloc[i] = -1ULL;
+	}
+}
 #define flush_cache_vmap_early(start, end)	local_flush_tlb_kernel_range(start, end)
 #endif
 
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 5d473343634b..32631acdcdd4 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -60,6 +60,11 @@ struct thread_info {
 	void			*scs_base;
 	void			*scs_sp;
 #endif
+	/*
+	 * Used in handle_exception() to save a0, a1 and a2 before knowing if we
+	 * can access the kernel stack.
+	 */
+	unsigned long		a0, a1, a2;
 };
 
 #ifdef CONFIG_SHADOW_CALL_STACK
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index a03129f40c46..939ddc0e3c6e 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -35,6 +35,8 @@ void asm_offsets(void)
 	OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
 	OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
 	OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
+
+	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
 	OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
@@ -42,6 +44,9 @@ void asm_offsets(void)
 #ifdef CONFIG_SHADOW_CALL_STACK
 	OFFSET(TASK_TI_SCS_SP, task_struct, thread_info.scs_sp);
 #endif
+	OFFSET(TASK_TI_A0, task_struct, thread_info.a0);
+	OFFSET(TASK_TI_A1, task_struct, thread_info.a1);
+	OFFSET(TASK_TI_A2, task_struct, thread_info.a2);
 
 	OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
 	OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 9d1a305d5508..c1ffaeaba7aa 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -19,6 +19,78 @@
 
 	.section .irqentry.text, "ax"
 
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
+	REG_L	a2, 0(a0)
+	and	a2, a2, a1
+	beq	a2, zero, _new_vmalloc_restore_context
+
+	/* Atomically reset the current cpu bit in new_vmalloc */
+	amoxor.w	a0, a1, (a0)
+
+	/* Only emit a sfence.vma if the uarch caches invalid entries */
+	ALTERNATIVE("sfence.vma", "nop", 0, RISCV_ISA_EXT_SVVPTC, 1)
+
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
@@ -30,6 +102,18 @@ SYM_CODE_START(handle_exception)
 
 .Lrestore_kernel_tpsp:
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
index eafc4c2200f2..54c9fdeda11e 100644
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

