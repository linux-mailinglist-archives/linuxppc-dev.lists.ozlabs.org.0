Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A9E8D7A14
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 04:27:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=kghQZjD/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VsyKp0bmPz3cRK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 12:27:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=kghQZjD/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com; envelope-from=cuiyunhui@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VsyK207Ssz30Ss
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2024 12:26:27 +1000 (AEST)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-24ca0876a83so2118735fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Jun 2024 19:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1717381580; x=1717986380; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FVO8FfbvRSq3lInIu0BX0h7ckGi2C3dp5Cu4roUh7Y=;
        b=kghQZjD/GFyvXdxDfeOjvmAH8rNsNbGnEGBLTTn5ZJkhM9dtmcV5/hTNQ/UpLYdtpa
         tEaqAB/qsp2EEnnJLus2E19mDK/Levej05H/dow5s4sbYjzmSPlJWimGeOrY2xhljVoh
         rwgMMuLNd6iFBLbtnU6carUyo6kmWWjL523XauIgRdXtlGdxDtGCgBOxziia/k0WnyR/
         6m4o27qX9O6brqtQRXrJWpzx6aL+TLA240SJHCxj/xp1pIgtLciYs0+Ywz2xT96kzk5/
         cxzTvokL1hwwKSGsrf7r5vUay5PYIWCLJnQfbvrodQqwOWBkWchrim025T0w+4ydTtM5
         eyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717381580; x=1717986380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FVO8FfbvRSq3lInIu0BX0h7ckGi2C3dp5Cu4roUh7Y=;
        b=Gcukgof3KKMZjPncwD2zJxPVOlmMNtj7B/lV+rTwRYCLvfXGnAdCp6kmrLNA9F2osZ
         g/iXng0T7R9QUvYnD5UzGd8VI5DawZ8/DIE+LgVlc4Ww4kdcaoeQKkjZr7r371iKZV4r
         v629uAvZbHSkzZqVrRAmHsIbJHq0wpkyH8uLxxi7PBWXRjsCwfBZsNkvTwdaKAOXNh6k
         ZYbYyAX9QuTs1OR769Nw8UQ5zLYLuXhV43RdOoykE7Mld0Gpn1oKosSkS2AwgzxTsZxD
         cWyvhXo45A0UYz5JnSHxMp/7bwaDxZglaXnnzWDl1ECu0FzXR80Ai4FR6ffxCg7JN6gT
         UxHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG4fXjRJoBOaP79nAlLHU7l8rmlJkCH4lIFqF7/xGzM3whrOzfgOSTvfWISL9pQzDs4atFMVkayWZ5/7lDKdPlsTGZoEArSEz8DJk8IA==
X-Gm-Message-State: AOJu0YxQ2Vb3jigPWLlDeIUFNRr/9A/32O/WxxMx8EU4eSjLKXc2cmcj
	/c9usWq/JwPCH5iCTY01/MiO7y5ZZYqJrqnAgBiJPf/M/ZS2/S+z+c4Cv1I/El3Dngx6ok9jhHy
	tjJfitLGRUgOO5GpQYmD0aF2RB1AQqUbHCorgvg==
X-Google-Smtp-Source: AGHT+IGCM0LMNQOovDp9kRtkZJlNH3sjfjIsZCkVxfHkVGktafrBKJCLQKJDpHSDg3IP3UkbyTARIWGa6hF9KT8otKE=
X-Received: by 2002:a05:6870:55ce:b0:24f:df31:9bbf with SMTP id
 586e51a60fabf-2508bcb8b9bmr9214174fac.39.1717381580128; Sun, 02 Jun 2024
 19:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240131155929.169961-1-alexghiti@rivosinc.com> <20240131155929.169961-4-alexghiti@rivosinc.com>
In-Reply-To: <20240131155929.169961-4-alexghiti@rivosinc.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 3 Jun 2024 10:26:09 +0800
Message-ID: <CAEEQ3wnT-K18R1KQjJbeSdnFnRFQZt=wCuAHeDrf7EohwZ7n=w@mail.gmail.com>
Subject: Re: [External] [PATCH RFC/RFT v2 3/4] riscv: Stop emitting preventive
 sfence.vma for new vmalloc mappings
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-riscv@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Matt Evans <mev@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Nicholas Piggin <npiggin@gmail.com>, Ved Shanbhogue <ved@rivosinc.com>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, Dylan Jhong <dylan@andestech.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Alexandre,

On Thu, Feb 1, 2024 at 12:03=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosinc=
.com> wrote:
>
> In 6.5, we removed the vmalloc fault path because that can't work (see
> [1] [2]). Then in order to make sure that new page table entries were
> seen by the page table walker, we had to preventively emit a sfence.vma
> on all harts [3] but this solution is very costly since it relies on IPI.
>
> And even there, we could end up in a loop of vmalloc faults if a vmalloc
> allocation is done in the IPI path (for example if it is traced, see
> [4]), which could result in a kernel stack overflow.
>
> Those preventive sfence.vma needed to be emitted because:
>
> - if the uarch caches invalid entries, the new mapping may not be
>   observed by the page table walker and an invalidation may be needed.
> - if the uarch does not cache invalid entries, a reordered access
>   could "miss" the new mapping and traps: in that case, we would actually
>   only need to retry the access, no sfence.vma is required.
>
> So this patch removes those preventive sfence.vma and actually handles
> the possible (and unlikely) exceptions. And since the kernel stacks
> mappings lie in the vmalloc area, this handling must be done very early
> when the trap is taken, at the very beginning of handle_exception: this
> also rules out the vmalloc allocations in the fault path.
>
> Link: https://lore.kernel.org/linux-riscv/20230531093817.665799-1-bjorn@k=
ernel.org/ [1]
> Link: https://lore.kernel.org/linux-riscv/20230801090927.2018653-1-dylan@=
andestech.com [2]
> Link: https://lore.kernel.org/linux-riscv/20230725132246.817726-1-alexghi=
ti@rivosinc.com/ [3]
> Link: https://lore.kernel.org/lkml/20200508144043.13893-1-joro@8bytes.org=
/ [4]
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/cacheflush.h  | 18 +++++-
>  arch/riscv/include/asm/thread_info.h |  5 ++
>  arch/riscv/kernel/asm-offsets.c      |  5 ++
>  arch/riscv/kernel/entry.S            | 84 ++++++++++++++++++++++++++++
>  arch/riscv/mm/init.c                 |  2 +
>  5 files changed, 113 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm=
/cacheflush.h
> index a129dac4521d..b0d631701757 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -37,7 +37,23 @@ static inline void flush_dcache_page(struct page *page=
)
>         flush_icache_mm(vma->vm_mm, 0)
>
>  #ifdef CONFIG_64BIT
> -#define flush_cache_vmap(start, end)           flush_tlb_kernel_range(st=
art, end)
> +extern u64 new_vmalloc[NR_CPUS / sizeof(u64) + 1];
> +extern char _end[];
> +#define flush_cache_vmap flush_cache_vmap
> +static inline void flush_cache_vmap(unsigned long start, unsigned long e=
nd)
> +{
> +       if (is_vmalloc_or_module_addr((void *)start)) {
> +               int i;
> +
> +               /*
> +                * We don't care if concurrently a cpu resets this value =
since
> +                * the only place this can happen is in handle_exception(=
) where
> +                * an sfence.vma is emitted.
> +                */
> +               for (i =3D 0; i < ARRAY_SIZE(new_vmalloc); ++i)
> +                       new_vmalloc[i] =3D -1ULL;
> +       }
> +}
>  #define flush_cache_vmap_early(start, end)     local_flush_tlb_kernel_ra=
nge(start, end)
>  #endif
>
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/as=
m/thread_info.h
> index 5d473343634b..32631acdcdd4 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -60,6 +60,11 @@ struct thread_info {
>         void                    *scs_base;
>         void                    *scs_sp;
>  #endif
> +       /*
> +        * Used in handle_exception() to save a0, a1 and a2 before knowin=
g if we
> +        * can access the kernel stack.
> +        */
> +       unsigned long           a0, a1, a2;
>  };
>
>  #ifdef CONFIG_SHADOW_CALL_STACK
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offs=
ets.c
> index a03129f40c46..939ddc0e3c6e 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -35,6 +35,8 @@ void asm_offsets(void)
>         OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
>         OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
>         OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
> +
> +       OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
>         OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
>         OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_co=
unt);
>         OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
> @@ -42,6 +44,9 @@ void asm_offsets(void)
>  #ifdef CONFIG_SHADOW_CALL_STACK
>         OFFSET(TASK_TI_SCS_SP, task_struct, thread_info.scs_sp);
>  #endif
> +       OFFSET(TASK_TI_A0, task_struct, thread_info.a0);
> +       OFFSET(TASK_TI_A1, task_struct, thread_info.a1);
> +       OFFSET(TASK_TI_A2, task_struct, thread_info.a2);
>
>         OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
>         OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 9d1a305d5508..c1ffaeaba7aa 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -19,6 +19,78 @@
>
>         .section .irqentry.text, "ax"
>
> +.macro new_vmalloc_check
> +       REG_S   a0, TASK_TI_A0(tp)
> +       REG_S   a1, TASK_TI_A1(tp)
> +       REG_S   a2, TASK_TI_A2(tp)
> +
> +       csrr    a0, CSR_CAUSE
> +       /* Exclude IRQs */
> +       blt     a0, zero, _new_vmalloc_restore_context
> +       /* Only check new_vmalloc if we are in page/protection fault */
> +       li      a1, EXC_LOAD_PAGE_FAULT
> +       beq     a0, a1, _new_vmalloc_kernel_address
> +       li      a1, EXC_STORE_PAGE_FAULT
> +       beq     a0, a1, _new_vmalloc_kernel_address
> +       li      a1, EXC_INST_PAGE_FAULT
> +       bne     a0, a1, _new_vmalloc_restore_context
> +
> +_new_vmalloc_kernel_address:
> +       /* Is it a kernel address? */
> +       csrr    a0, CSR_TVAL
> +       bge     a0, zero, _new_vmalloc_restore_context
> +
> +       /* Check if a new vmalloc mapping appeared that could explain the=
 trap */
> +
> +       /*
> +        * Computes:
> +        * a0 =3D &new_vmalloc[BIT_WORD(cpu)]
> +        * a1 =3D BIT_MASK(cpu)
> +        */
> +       REG_L   a2, TASK_TI_CPU(tp)
> +       /*
> +        * Compute the new_vmalloc element position:
> +        * (cpu / 64) * 8 =3D (cpu >> 6) << 3
> +        */
> +       srli    a1, a2, 6
> +       slli    a1, a1, 3
> +       la      a0, new_vmalloc
> +       add     a0, a0, a1
> +       /*
> +        * Compute the bit position in the new_vmalloc element:
> +        * bit_pos =3D cpu % 64 =3D cpu - (cpu / 64) * 64 =3D cpu - (cpu =
>> 6) << 6
> +        *         =3D cpu - ((cpu >> 6) << 3) << 3
> +        */
> +       slli    a1, a1, 3
> +       sub     a1, a2, a1
> +       /* Compute the "get mask": 1 << bit_pos */
> +       li      a2, 1
> +       sll     a1, a2, a1
> +
> +       /* Check the value of new_vmalloc for this cpu */
> +       REG_L   a2, 0(a0)
> +       and     a2, a2, a1
> +       beq     a2, zero, _new_vmalloc_restore_context
> +
> +       /* Atomically reset the current cpu bit in new_vmalloc */
> +       amoxor.w        a0, a1, (a0)
> +
> +       /* Only emit a sfence.vma if the uarch caches invalid entries */
> +       ALTERNATIVE("sfence.vma", "nop", 0, RISCV_ISA_EXT_SVVPTC, 1)
> +
> +       REG_L   a0, TASK_TI_A0(tp)
> +       REG_L   a1, TASK_TI_A1(tp)
> +       REG_L   a2, TASK_TI_A2(tp)
> +       csrw    CSR_SCRATCH, x0
> +       sret
> +
> +_new_vmalloc_restore_context:
> +       REG_L   a0, TASK_TI_A0(tp)
> +       REG_L   a1, TASK_TI_A1(tp)
> +       REG_L   a2, TASK_TI_A2(tp)
> +.endm
> +
> +
>  SYM_CODE_START(handle_exception)
>         /*
>          * If coming from userspace, preserve the user thread pointer and=
 load
> @@ -30,6 +102,18 @@ SYM_CODE_START(handle_exception)
>
>  .Lrestore_kernel_tpsp:
>         csrr tp, CSR_SCRATCH
> +
> +       /*
> +        * The RISC-V kernel does not eagerly emit a sfence.vma after eac=
h
> +        * new vmalloc mapping, which may result in exceptions:
> +        * - if the uarch caches invalid entries, the new mapping would n=
ot be
> +        *   observed by the page table walker and an invalidation is nee=
ded.
> +        * - if the uarch does not cache invalid entries, a reordered acc=
ess
> +        *   could "miss" the new mapping and traps: in that case, we onl=
y need
> +        *   to retry the access, no sfence.vma is required.
> +        */
> +       new_vmalloc_check
> +
>         REG_S sp, TASK_TI_KERNEL_SP(tp)
>
>  #ifdef CONFIG_VMAP_STACK
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index eafc4c2200f2..54c9fdeda11e 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -36,6 +36,8 @@
>
>  #include "../kernel/head.h"
>
> +u64 new_vmalloc[NR_CPUS / sizeof(u64) + 1];
> +
>  struct kernel_mapping kernel_map __ro_after_init;
>  EXPORT_SYMBOL(kernel_map);
>  #ifdef CONFIG_XIP_KERNEL
> --
> 2.39.2
>
>

Can we consider using new_vmalloc as a percpu variable, so that we
don't need to add a0/1/2 in thread_info? Also, try not to do too much
calculation logic in new_vmalloc_check, after all, handle_exception is
a high-frequency path. In this case, can we consider writing
new_vmalloc_check in C language to increase readability?

Thanks,
Yunhui
