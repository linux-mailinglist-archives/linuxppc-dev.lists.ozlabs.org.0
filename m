Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 101B58FABA8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 09:16:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=fjE1CsCL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vthhc16f9z3cTD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 17:16:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=fjE1CsCL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=alexghiti@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vthgs42lbz2xjJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 17:15:19 +1000 (AEST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-57a20ccafc6so4555618a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2024 00:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717485311; x=1718090111; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGfwkYu7JVFXZOdUmCyYR2r+fVgJf4gONLr+u0dZ9y0=;
        b=fjE1CsCLKp5Al/0yMTVbw103NrG36+mNlVf6fE6FhsR76rKFsp3LjvMMoq4Wc4gPun
         iRR3H5wCTu+b0ug3codbXb45jiKmROO3XMfevNjWGhxnsBKgVkPO2dlkc3rzagwUYRN9
         S3/1zGXDF3DS5BYxC4b81XLBBtKwjoOITU6QaDC34dM2sJHfeOh901jX1e5X3p7kthVr
         eGaR/sV9uPGkWrU70cOIaj+ODV4KUfIMGAOB6UORbOFe6YPgmFSkJwKGkbpxwSRgt6ng
         MQFc45GeiJQVlgi5TrsmX+ueWV+VTVEPb+TLEUlt2cKOuNX8HP0Y7acqgrP9eLAbpsGg
         I9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717485311; x=1718090111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGfwkYu7JVFXZOdUmCyYR2r+fVgJf4gONLr+u0dZ9y0=;
        b=QxPujdI2RpN7QmSHv6AOfjuXsRNZCBD1Xgn6BEV7MJlfhy99rb7VJC+SGqMzzu/YzV
         hz6qG5u1+sBjxzodq+0v1C3vTxF4mvu5Ill37db3+R2qjZhoiiNt/8DnmjK+JKbHfd74
         cQ3/7fTTu8T2W6mIkJFcQIbe5p/SOp+4q1AHfxr6QuB3vBLx7boKBxIQu0JmCL3zRzNW
         Ft2orUdoddfu6KlnXd7MwoUJnMU7/vnlPlleUFx0qu5Wd3j2BohIRVHTp7fWNDN8ogyS
         yFEmXLAqhSEf82JLq4VI7KeWbi7j4YVlCg83r8Gu2lNRvUlJmJ9uFnqIBbako5LVhDmj
         0oVA==
X-Forwarded-Encrypted: i=1; AJvYcCXg2hQaWRJ3pnbM5Hd84B+2L5Vpp523hXAXtWNN0ypeACKUpGuecsBdZIRat/8VucVM2t/IeyuXlqlXZLzseeECV/xR4r/EYAtbxcR1xQ==
X-Gm-Message-State: AOJu0Yz2udedc09fetZjnA/Q5yHKrcey4L9nfj4PHPcCHnIVRxsouQ/N
	vN0K6roR2t79VigYQQRhJWGIOC6fDVmWUI8LrzmqZnO1h66CIA4i/kjlhrf/N0j6Wlr1enj6fV7
	KsJcsXj0sWOFoULHRe9TKcsbpIqPQ3eCBP4zhMA==
X-Google-Smtp-Source: AGHT+IHarWc6Pn5Ik6tsXrxjrWuTOVIndSB1/IuRfaYcNBnRUoto132QzfDv328/hbJp5jRKeRYQLyvJSTBmGsNUy1M=
X-Received: by 2002:a17:906:3656:b0:a68:b8cc:842f with SMTP id
 a640c23a62f3a-a68b8cc861dmr531801066b.56.1717485311250; Tue, 04 Jun 2024
 00:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
 <20240131155929.169961-4-alexghiti@rivosinc.com> <CAEEQ3wnT-K18R1KQjJbeSdnFnRFQZt=wCuAHeDrf7EohwZ7n=w@mail.gmail.com>
 <CAHVXubiKAY_L04ZwYSp-MpPPT5sPzxm4wB6HVFPzsMcB-3zq9w@mail.gmail.com> <CAEEQ3wkkNyrjVCDxprNP5Z=NzO=EYeKeWf3CDvVNJHY1uovmMQ@mail.gmail.com>
In-Reply-To: <CAEEQ3wkkNyrjVCDxprNP5Z=NzO=EYeKeWf3CDvVNJHY1uovmMQ@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 4 Jun 2024 09:15:00 +0200
Message-ID: <CAHVXubi+s2Q0y_xLbHpQJpz+yXvKWJ8e96wwAHP6A9C7U-He7g@mail.gmail.com>
Subject: Re: [External] [PATCH RFC/RFT v2 3/4] riscv: Stop emitting preventive
 sfence.vma for new vmalloc mappings
To: yunhui cui <cuiyunhui@bytedance.com>
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

Hi Yunhui,

On Tue, Jun 4, 2024 at 8:21=E2=80=AFAM yunhui cui <cuiyunhui@bytedance.com>=
 wrote:
>
> Hi Alexandre,
>
> On Mon, Jun 3, 2024 at 8:02=E2=80=AFPM Alexandre Ghiti <alexghiti@rivosin=
c.com> wrote:
> >
> > Hi Yunhui,
> >
> > On Mon, Jun 3, 2024 at 4:26=E2=80=AFAM yunhui cui <cuiyunhui@bytedance.=
com> wrote:
> > >
> > > Hi Alexandre,
> > >
> > > On Thu, Feb 1, 2024 at 12:03=E2=80=AFAM Alexandre Ghiti <alexghiti@ri=
vosinc.com> wrote:
> > > >
> > > > In 6.5, we removed the vmalloc fault path because that can't work (=
see
> > > > [1] [2]). Then in order to make sure that new page table entries we=
re
> > > > seen by the page table walker, we had to preventively emit a sfence=
.vma
> > > > on all harts [3] but this solution is very costly since it relies o=
n IPI.
> > > >
> > > > And even there, we could end up in a loop of vmalloc faults if a vm=
alloc
> > > > allocation is done in the IPI path (for example if it is traced, se=
e
> > > > [4]), which could result in a kernel stack overflow.
> > > >
> > > > Those preventive sfence.vma needed to be emitted because:
> > > >
> > > > - if the uarch caches invalid entries, the new mapping may not be
> > > >   observed by the page table walker and an invalidation may be need=
ed.
> > > > - if the uarch does not cache invalid entries, a reordered access
> > > >   could "miss" the new mapping and traps: in that case, we would ac=
tually
> > > >   only need to retry the access, no sfence.vma is required.
> > > >
> > > > So this patch removes those preventive sfence.vma and actually hand=
les
> > > > the possible (and unlikely) exceptions. And since the kernel stacks
> > > > mappings lie in the vmalloc area, this handling must be done very e=
arly
> > > > when the trap is taken, at the very beginning of handle_exception: =
this
> > > > also rules out the vmalloc allocations in the fault path.
> > > >
> > > > Link: https://lore.kernel.org/linux-riscv/20230531093817.665799-1-b=
jorn@kernel.org/ [1]
> > > > Link: https://lore.kernel.org/linux-riscv/20230801090927.2018653-1-=
dylan@andestech.com [2]
> > > > Link: https://lore.kernel.org/linux-riscv/20230725132246.817726-1-a=
lexghiti@rivosinc.com/ [3]
> > > > Link: https://lore.kernel.org/lkml/20200508144043.13893-1-joro@8byt=
es.org/ [4]
> > > > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > > ---
> > > >  arch/riscv/include/asm/cacheflush.h  | 18 +++++-
> > > >  arch/riscv/include/asm/thread_info.h |  5 ++
> > > >  arch/riscv/kernel/asm-offsets.c      |  5 ++
> > > >  arch/riscv/kernel/entry.S            | 84 ++++++++++++++++++++++++=
++++
> > > >  arch/riscv/mm/init.c                 |  2 +
> > > >  5 files changed, 113 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/inclu=
de/asm/cacheflush.h
> > > > index a129dac4521d..b0d631701757 100644
> > > > --- a/arch/riscv/include/asm/cacheflush.h
> > > > +++ b/arch/riscv/include/asm/cacheflush.h
> > > > @@ -37,7 +37,23 @@ static inline void flush_dcache_page(struct page=
 *page)
> > > >         flush_icache_mm(vma->vm_mm, 0)
> > > >
> > > >  #ifdef CONFIG_64BIT
> > > > -#define flush_cache_vmap(start, end)           flush_tlb_kernel_ra=
nge(start, end)
> > > > +extern u64 new_vmalloc[NR_CPUS / sizeof(u64) + 1];
> > > > +extern char _end[];
> > > > +#define flush_cache_vmap flush_cache_vmap
> > > > +static inline void flush_cache_vmap(unsigned long start, unsigned =
long end)
> > > > +{
> > > > +       if (is_vmalloc_or_module_addr((void *)start)) {
> > > > +               int i;
> > > > +
> > > > +               /*
> > > > +                * We don't care if concurrently a cpu resets this =
value since
> > > > +                * the only place this can happen is in handle_exce=
ption() where
> > > > +                * an sfence.vma is emitted.
> > > > +                */
> > > > +               for (i =3D 0; i < ARRAY_SIZE(new_vmalloc); ++i)
> > > > +                       new_vmalloc[i] =3D -1ULL;
> > > > +       }
> > > > +}
> > > >  #define flush_cache_vmap_early(start, end)     local_flush_tlb_ker=
nel_range(start, end)
> > > >  #endif
> > > >
> > > > diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/incl=
ude/asm/thread_info.h
> > > > index 5d473343634b..32631acdcdd4 100644
> > > > --- a/arch/riscv/include/asm/thread_info.h
> > > > +++ b/arch/riscv/include/asm/thread_info.h
> > > > @@ -60,6 +60,11 @@ struct thread_info {
> > > >         void                    *scs_base;
> > > >         void                    *scs_sp;
> > > >  #endif
> > > > +       /*
> > > > +        * Used in handle_exception() to save a0, a1 and a2 before =
knowing if we
> > > > +        * can access the kernel stack.
> > > > +        */
> > > > +       unsigned long           a0, a1, a2;
> > > >  };
> > > >
> > > >  #ifdef CONFIG_SHADOW_CALL_STACK
> > > > diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/as=
m-offsets.c
> > > > index a03129f40c46..939ddc0e3c6e 100644
> > > > --- a/arch/riscv/kernel/asm-offsets.c
> > > > +++ b/arch/riscv/kernel/asm-offsets.c
> > > > @@ -35,6 +35,8 @@ void asm_offsets(void)
> > > >         OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
> > > >         OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
> > > >         OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
> > > > +
> > > > +       OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
> > > >         OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
> > > >         OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.pree=
mpt_count);
> > > >         OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_s=
p);
> > > > @@ -42,6 +44,9 @@ void asm_offsets(void)
> > > >  #ifdef CONFIG_SHADOW_CALL_STACK
> > > >         OFFSET(TASK_TI_SCS_SP, task_struct, thread_info.scs_sp);
> > > >  #endif
> > > > +       OFFSET(TASK_TI_A0, task_struct, thread_info.a0);
> > > > +       OFFSET(TASK_TI_A1, task_struct, thread_info.a1);
> > > > +       OFFSET(TASK_TI_A2, task_struct, thread_info.a2);
> > > >
> > > >         OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
> > > >         OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
> > > > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > > > index 9d1a305d5508..c1ffaeaba7aa 100644
> > > > --- a/arch/riscv/kernel/entry.S
> > > > +++ b/arch/riscv/kernel/entry.S
> > > > @@ -19,6 +19,78 @@
> > > >
> > > >         .section .irqentry.text, "ax"
> > > >
> > > > +.macro new_vmalloc_check
> > > > +       REG_S   a0, TASK_TI_A0(tp)
> > > > +       REG_S   a1, TASK_TI_A1(tp)
> > > > +       REG_S   a2, TASK_TI_A2(tp)
> > > > +
> > > > +       csrr    a0, CSR_CAUSE
> > > > +       /* Exclude IRQs */
> > > > +       blt     a0, zero, _new_vmalloc_restore_context
> > > > +       /* Only check new_vmalloc if we are in page/protection faul=
t */
> > > > +       li      a1, EXC_LOAD_PAGE_FAULT
> > > > +       beq     a0, a1, _new_vmalloc_kernel_address
> > > > +       li      a1, EXC_STORE_PAGE_FAULT
> > > > +       beq     a0, a1, _new_vmalloc_kernel_address
> > > > +       li      a1, EXC_INST_PAGE_FAULT
> > > > +       bne     a0, a1, _new_vmalloc_restore_context
> > > > +
> > > > +_new_vmalloc_kernel_address:
> > > > +       /* Is it a kernel address? */
> > > > +       csrr    a0, CSR_TVAL
> > > > +       bge     a0, zero, _new_vmalloc_restore_context
> > > > +
> > > > +       /* Check if a new vmalloc mapping appeared that could expla=
in the trap */
> > > > +
> > > > +       /*
> > > > +        * Computes:
> > > > +        * a0 =3D &new_vmalloc[BIT_WORD(cpu)]
> > > > +        * a1 =3D BIT_MASK(cpu)
> > > > +        */
> > > > +       REG_L   a2, TASK_TI_CPU(tp)
> > > > +       /*
> > > > +        * Compute the new_vmalloc element position:
> > > > +        * (cpu / 64) * 8 =3D (cpu >> 6) << 3
> > > > +        */
> > > > +       srli    a1, a2, 6
> > > > +       slli    a1, a1, 3
> > > > +       la      a0, new_vmalloc
> > > > +       add     a0, a0, a1
> > > > +       /*
> > > > +        * Compute the bit position in the new_vmalloc element:
> > > > +        * bit_pos =3D cpu % 64 =3D cpu - (cpu / 64) * 64 =3D cpu -=
 (cpu >> 6) << 6
> > > > +        *         =3D cpu - ((cpu >> 6) << 3) << 3
> > > > +        */
> > > > +       slli    a1, a1, 3
> > > > +       sub     a1, a2, a1
> > > > +       /* Compute the "get mask": 1 << bit_pos */
> > > > +       li      a2, 1
> > > > +       sll     a1, a2, a1
> > > > +
> > > > +       /* Check the value of new_vmalloc for this cpu */
> > > > +       REG_L   a2, 0(a0)
> > > > +       and     a2, a2, a1
> > > > +       beq     a2, zero, _new_vmalloc_restore_context
> > > > +
> > > > +       /* Atomically reset the current cpu bit in new_vmalloc */
> > > > +       amoxor.w        a0, a1, (a0)
> > > > +
> > > > +       /* Only emit a sfence.vma if the uarch caches invalid entri=
es */
> > > > +       ALTERNATIVE("sfence.vma", "nop", 0, RISCV_ISA_EXT_SVVPTC, 1=
)
> > > > +
> > > > +       REG_L   a0, TASK_TI_A0(tp)
> > > > +       REG_L   a1, TASK_TI_A1(tp)
> > > > +       REG_L   a2, TASK_TI_A2(tp)
> > > > +       csrw    CSR_SCRATCH, x0
> > > > +       sret
> > > > +
> > > > +_new_vmalloc_restore_context:
> > > > +       REG_L   a0, TASK_TI_A0(tp)
> > > > +       REG_L   a1, TASK_TI_A1(tp)
> > > > +       REG_L   a2, TASK_TI_A2(tp)
> > > > +.endm
> > > > +
> > > > +
> > > >  SYM_CODE_START(handle_exception)
> > > >         /*
> > > >          * If coming from userspace, preserve the user thread point=
er and load
> > > > @@ -30,6 +102,18 @@ SYM_CODE_START(handle_exception)
> > > >
> > > >  .Lrestore_kernel_tpsp:
> > > >         csrr tp, CSR_SCRATCH
> > > > +
> > > > +       /*
> > > > +        * The RISC-V kernel does not eagerly emit a sfence.vma aft=
er each
> > > > +        * new vmalloc mapping, which may result in exceptions:
> > > > +        * - if the uarch caches invalid entries, the new mapping w=
ould not be
> > > > +        *   observed by the page table walker and an invalidation =
is needed.
> > > > +        * - if the uarch does not cache invalid entries, a reorder=
ed access
> > > > +        *   could "miss" the new mapping and traps: in that case, =
we only need
> > > > +        *   to retry the access, no sfence.vma is required.
> > > > +        */
> > > > +       new_vmalloc_check
> > > > +
> > > >         REG_S sp, TASK_TI_KERNEL_SP(tp)
> > > >
> > > >  #ifdef CONFIG_VMAP_STACK
> > > > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > > index eafc4c2200f2..54c9fdeda11e 100644
> > > > --- a/arch/riscv/mm/init.c
> > > > +++ b/arch/riscv/mm/init.c
> > > > @@ -36,6 +36,8 @@
> > > >
> > > >  #include "../kernel/head.h"
> > > >
> > > > +u64 new_vmalloc[NR_CPUS / sizeof(u64) + 1];
> > > > +
> > > >  struct kernel_mapping kernel_map __ro_after_init;
> > > >  EXPORT_SYMBOL(kernel_map);
> > > >  #ifdef CONFIG_XIP_KERNEL
> > > > --
> > > > 2.39.2
> > > >
> > > >
> > >
> > > Can we consider using new_vmalloc as a percpu variable, so that we
> > > don't need to add a0/1/2 in thread_info?
> >
> > At first, I used percpu variables. But then I realized that percpu
> > areas are allocated in the vmalloc area, so if somehow we take a trap
> > when accessing the new_vmalloc percpu variable, we could not recover
> > from this as we would trap forever in new_vmalloc_check. But
> > admittedly, not sure that can happen.
> >
> > And how would that remove a0, a1 and a2 from thread_info? We'd still
> > need to save some registers somewhere to access the percpu variable
> > right?
> >
> > > Also, try not to do too much
> > > calculation logic in new_vmalloc_check, after all, handle_exception i=
s
> > > a high-frequency path. In this case, can we consider writing
> > > new_vmalloc_check in C language to increase readability?
> >
> > If we write that in C, we don't have the control over the allocated
> > registers and then we can't correctly save the context.
>
> If we use C language, new_vmalloc_check is written just like do_irq(),
> then we need _save_context, but for new_vmalloc_check, it is not worth
> the loss, because exceptions from user mode do not need
> new_vmalloc_check, which also shows that it is reasonable to put
> new_vmalloc_check after _restore_kernel_tpsp.
>
> Saving is necessary. We can save a0, a1, a2 without using thread_info.
> We can choose to save on the kernel stack of the current tp, but we
> need to add the following instructions:
> REG_S sp, TASK_TI_USER_SP(tp)
> REG_L sp, TASK_TI_KERNEL_SP(tp)
> addi sp, sp, -(PT_SIZE_ON_STACK)
> It seems that saving directly on thread_info is more direct, but
> saving on the kernel stack is more logically consistent, and there is
> no need to increase the size of thread_info.

You can't save on the kernel stack since kernel stacks are allocated
in the vmalloc area.

>
> As for the current status of the patch, there are two points that can
> be optimized:
> 1. Some chip hardware implementations may not cache TLB invalid
> entries, so it doesn't matter whether svvptc is available or not. Can
> we consider adding a CONFIG_RISCV_SVVPTC to control it?
>
> 2. .macro new_vmalloc_check
> REG_S a0, TASK_TI_A0(tp)
> REG_S a1, TASK_TI_A1(tp)
> REG_S a2, TASK_TI_A2(tp)
> When executing blt a0, zero, _new_vmalloc_restore_context, you can not
> save a1, a2 first

Ok, I can do that :)

Thanks again for your inputs,

Alex

>
> >
> > Thanks for your interest in this patchset :)
> >
> > Alex
> >
> > >
> > > Thanks,
> > > Yunhui
>
> Thanks,
> Yunhui
