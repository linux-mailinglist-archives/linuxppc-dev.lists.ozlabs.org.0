Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 459A735B63B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 18:51:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJHvf1bjPz3bp4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 02:51:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u92ZNmVK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=u92ZNmVK; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJHvC6F27z300b
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 02:51:19 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EC1B610E9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 16:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618159877;
 bh=hdSLHeSFPSGynlGflxt+p7hzQD3ysw8VuEPN1TxHROo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=u92ZNmVK9Okwh6sssywhSfccMkrhyVbN0i1TzFQL6ubJe69Tup7uioO2B9iqMd86R
 PyZ0nIQIDEDoAUcp4VH3s3x2J9YyjO1zaUEf9DXia28SOTL+AZwrnhWgZObeZK35IP
 Mworx49ICMEC1ZgjZOImQCDKTztZLllqG/G/tp0f0ABdVW6WKi7ogEnZtNlnYGmPa+
 MD6EfRtXCYXjrj3jRMIr4dmsz4f0usPxap0g6auXFA0M/p8yMcdcHUVSzB1kZJoz1R
 fipLWLnhth24IQWAQi0DnJ53iaGzHPfzM1CfxsJ9DLxzUApTJSn1eIRnqbr7xsq9Gx
 f15Nu2dLaaTdA==
Received: by mail-lf1-f53.google.com with SMTP id b4so17503664lfi.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 09:51:16 -0700 (PDT)
X-Gm-Message-State: AOAM533qat+8EQZrSNNqe1Y4iZyv2JoG0bDvo/LQDrkujX5jXhaGnNxK
 LnJk+8EaLgdtmwW8Kfq1wjV1x0+lL646+ES1yFc=
X-Google-Smtp-Source: ABdhPJwytlwOM+Rr5ik6o9Gt0Np/mypGW3IwYId67m7mmduUv1Bjo9G3FOhKEOOdYbF0Wmx6IQxmHYMGzhwXowpdgyc=
X-Received: by 2002:ac2:4191:: with SMTP id z17mr5521549lfh.557.1618159875345; 
 Sun, 11 Apr 2021 09:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
 <1617201040-83905-4-git-send-email-guoren@kernel.org>
 <CAJF2gTQRGWetpvvtXOn8_KzH8EQwL6VG02AoKBUWTkE69Xn6Kg@mail.gmail.com>
In-Reply-To: <CAJF2gTQRGWetpvvtXOn8_KzH8EQwL6VG02AoKBUWTkE69Xn6Kg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 12 Apr 2021 00:51:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQpmgzXb+oi3uHuQ5e1awS2AwOtm4XJo8ce6pVkuXst+Q@mail.gmail.com>
Message-ID: <CAJF2gTQpmgzXb+oi3uHuQ5e1awS2AwOtm4XJo8ce6pVkuXst+Q@mail.gmail.com>
Subject: Re: [PATCH v6 3/9] riscv: locks: Introduce ticket-based spinlock
 implementation
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 12, 2021 at 12:02 AM Guo Ren <guoren@kernel.org> wrote:
>
> On Wed, Mar 31, 2021 at 10:32 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > This patch introduces a ticket lock implementation for riscv, along the
> > same lines as the implementation for arch/arm & arch/csky.
> >
> > We still use qspinlock as default.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Anup Patel <anup@brainfault.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  arch/riscv/Kconfig                      |  7 ++-
> >  arch/riscv/include/asm/spinlock.h       | 84 +++++++++++++++++++++++++
> >  arch/riscv/include/asm/spinlock_types.h | 17 +++++
> >  3 files changed, 107 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 67cc65ba1ea1..34d0276f01d5 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -34,7 +34,7 @@ config RISCV
> >         select ARCH_WANT_FRAME_POINTERS
> >         select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
> >         select ARCH_USE_QUEUED_RWLOCKS
> > -       select ARCH_USE_QUEUED_SPINLOCKS
> > +       select ARCH_USE_QUEUED_SPINLOCKS        if !RISCV_TICKET_LOCK
> >         select ARCH_USE_QUEUED_SPINLOCKS_XCHG32
> >         select CLONE_BACKWARDS
> >         select CLINT_TIMER if !MMU
> > @@ -344,6 +344,11 @@ config NEED_PER_CPU_EMBED_FIRST_CHUNK
> >         def_bool y
> >         depends on NUMA
> >
> > +config RISCV_TICKET_LOCK
> > +       bool "Ticket-based spin-locking"
> > +       help
> > +         Say Y here to use ticket-based spin-locking.
> > +
> >  config RISCV_ISA_C
> >         bool "Emit compressed instructions when building Linux"
> >         default y
> > diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
> > index a557de67a425..90b7eaa950cf 100644
> > --- a/arch/riscv/include/asm/spinlock.h
> > +++ b/arch/riscv/include/asm/spinlock.h
> > @@ -7,7 +7,91 @@
> >  #ifndef _ASM_RISCV_SPINLOCK_H
> >  #define _ASM_RISCV_SPINLOCK_H
> >
> > +#ifdef CONFIG_RISCV_TICKET_LOCK
> > +#ifdef CONFIG_32BIT
> > +#define __ASM_SLLIW "slli\t"
> > +#define __ASM_SRLIW "srli\t"
> > +#else
> > +#define __ASM_SLLIW "slliw\t"
> > +#define __ASM_SRLIW "srliw\t"
> > +#endif
> > +
> > +/*
> > + * Ticket-based spin-locking.
> > + */
> > +static inline void arch_spin_lock(arch_spinlock_t *lock)
> > +{
> > +       arch_spinlock_t lockval;
> > +       u32 tmp;
> > +
> > +       asm volatile (
> > +               "1:     lr.w    %0, %2          \n"
> > +               "       mv      %1, %0          \n"
> > +               "       addw    %0, %0, %3      \n"
> > +               "       sc.w    %0, %0, %2      \n"
> > +               "       bnez    %0, 1b          \n"
> > +               : "=&r" (tmp), "=&r" (lockval), "+A" (lock->lock)
> > +               : "r" (1 << TICKET_NEXT)
> > +               : "memory");
> > +
> > +       smp_cond_load_acquire(&lock->tickets.owner,
> > +                                       VAL == lockval.tickets.next);
> It's wrong, blew is fixup:
>
> diff --git a/arch/csky/include/asm/spinlock.h b/arch/csky/include/asm/spinlock.h
> index fe98ad8ece51..2be627ceb9df 100644
> --- a/arch/csky/include/asm/spinlock.h
> +++ b/arch/csky/include/asm/spinlock.h
> @@ -27,7 +27,8 @@ static inline void arch_spin_lock(arch_spinlock_t *lock)
>                 : "r"(p), "r"(ticket_next)
>                 : "cc");
>
> -       smp_cond_load_acquire(&lock->tickets.owner,
> +       if (lockval.owner != lockval.tickets.next)
> +               smp_cond_load_acquire(&lock->tickets.owner,
>                                         VAL == lockval.tickets.next);
eh... plus __smp_acquire_fence:

       if (lockval.owner != lockval.tickets.next)
               smp_cond_load_acquire(&lock->tickets.owner,
                                        VAL == lockval.tickets.next);
       else
               __smp_acquire_fence();

> > +}
> > +
> > +static inline int arch_spin_trylock(arch_spinlock_t *lock)
> > +{
> > +       u32 tmp, contended, res;
> > +
> > +       do {
> > +               asm volatile (
> > +               "       lr.w    %0, %3          \n"
> > +               __ASM_SRLIW    "%1, %0, %5      \n"
> > +               __ASM_SLLIW    "%2, %0, %5      \n"
> > +               "       or      %1, %2, %1      \n"
> > +               "       li      %2, 0           \n"
> > +               "       sub     %1, %1, %0      \n"
> > +               "       bnez    %1, 1f          \n"
> > +               "       addw    %0, %0, %4      \n"
> > +               "       sc.w    %2, %0, %3      \n"
> > +               "1:                             \n"
> > +               : "=&r" (tmp), "=&r" (contended), "=&r" (res),
> > +                 "+A" (lock->lock)
> > +               : "r" (1 << TICKET_NEXT), "I" (TICKET_NEXT)
> > +               : "memory");
> > +       } while (res);
> > +
> > +       if (!contended)
> > +               __atomic_acquire_fence();
> > +
> > +       return !contended;
> > +}
> > +
> > +static inline void arch_spin_unlock(arch_spinlock_t *lock)
> > +{
> > +       smp_store_release(&lock->tickets.owner, lock->tickets.owner + 1);
> > +}
> > +
> > +static inline int arch_spin_value_unlocked(arch_spinlock_t lock)
> > +{
> > +       return lock.tickets.owner == lock.tickets.next;
> > +}
> > +
> > +static inline int arch_spin_is_locked(arch_spinlock_t *lock)
> > +{
> > +       return !arch_spin_value_unlocked(READ_ONCE(*lock));
> > +}
> > +
> > +static inline int arch_spin_is_contended(arch_spinlock_t *lock)
> > +{
> > +       struct __raw_tickets tickets = READ_ONCE(lock->tickets);
> > +
> > +       return (tickets.next - tickets.owner) > 1;
> > +}
> > +#define arch_spin_is_contended arch_spin_is_contended
> > +#else /* CONFIG_RISCV_TICKET_LOCK */
> >  #include <asm/qspinlock.h>
> > +#endif /* CONFIG_RISCV_TICKET_LOCK */
> > +
> >  #include <asm/qrwlock.h>
> >
> >  #endif /* _ASM_RISCV_SPINLOCK_H */
> > diff --git a/arch/riscv/include/asm/spinlock_types.h b/arch/riscv/include/asm/spinlock_types.h
> > index d033a973f287..afbb19841d0f 100644
> > --- a/arch/riscv/include/asm/spinlock_types.h
> > +++ b/arch/riscv/include/asm/spinlock_types.h
> > @@ -10,7 +10,24 @@
> >  # error "please don't include this file directly"
> >  #endif
> >
> > +#ifdef CONFIG_RISCV_TICKET_LOCK
> > +#define TICKET_NEXT    16
> > +
> > +typedef struct {
> > +       union {
> > +               u32 lock;
> > +               struct __raw_tickets {
> > +                       /* little endian */
> > +                       u16 owner;
> > +                       u16 next;
> > +               } tickets;
> > +       };
> > +} arch_spinlock_t;
> > +
> > +#define __ARCH_SPIN_LOCK_UNLOCKED      { { 0 } }
> > +#else
> >  #include <asm-generic/qspinlock_types.h>
> > +#endif
> >  #include <asm-generic/qrwlock_types.h>
> >
> >  #endif /* _ASM_RISCV_SPINLOCK_TYPES_H */
> > --
> > 2.17.1
> >
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
