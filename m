Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A0670AE96
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 May 2023 17:31:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QPPgJ241Zz3c7s
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 May 2023 01:31:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mO11FJAL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mO11FJAL;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QPPfP2Ywyz3bd5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 May 2023 01:30:21 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1B21E61750
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 May 2023 15:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F027FC43442
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 May 2023 15:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684683017;
	bh=YPMM/8GlJbBOcfom5pOdN7LyjQ75t5SA5nQ04f6GwkY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mO11FJAL4r8D0kMZRd46uYx1Xli83ofHh+hlst3r2IWQiSr2efthW0UDDilhWb5J4
	 TBufuNw+KMqv+QWOWzbJ91HqLYirOZNhOeziKTs6mFvsBzbq4/Rh9998v7waFBKXQ/
	 LDbk8HCtZOCsm/0PLSC18CBVktLPbOVh97m5WGcA5U+rrFUILIedpBrHl5BiesvRc4
	 ILxWiKbrjOJ7k8qAHBkc0SyHuC7VcH23et+XIbb64kZ4A7dnDSFTgtwAkYOKmMPhv2
	 QZMGqUwsHNKxGVkiOZnxlSKNECbnQHk1HX/NCka1LKBxNnv49Q4LcGZR5nawIL91Yt
	 /lL358K44LExQ==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-96b4ed40d97so762512666b.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 May 2023 08:30:16 -0700 (PDT)
X-Gm-Message-State: AC+VfDzaCPGgcjoPawb7aOff7dfdr+gMoFLIOIr8cPHYQ7kBgGu9FZjZ
	TQEgZa+/tTc/Br7tEfN6NmGWewFrPtT3xhLzy2E=
X-Google-Smtp-Source: ACHHUZ7fC7VoTCmxVvgnj+XprmdOzTdADfx+p51AfUU2RX+IjuemmurGhjjXvb4ZOHMk5eyEyL8M50rHqnEzEEon25w=
X-Received: by 2002:a17:907:8a20:b0:96a:861:a2ac with SMTP id
 sc32-20020a1709078a2000b0096a0861a2acmr8333246ejc.0.1684683014948; Sun, 21
 May 2023 08:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230516200341.553413-1-arnd@kernel.org>
In-Reply-To: <20230516200341.553413-1-arnd@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 21 May 2023 23:30:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTqoE=Hty7q__m_4zvTOpC8cDpnK1ghEuFVZ+KrA7xmfA@mail.gmail.com>
Message-ID: <CAJF2gTTqoE=Hty7q__m_4zvTOpC8cDpnK1ghEuFVZ+KrA7xmfA@mail.gmail.com>
Subject: Re: [PATCH] irq_work: consolidate arch_irq_work_raise prototypes
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: linux-riscv@lists.infradead.org, x86@kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, linux-csky@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 17, 2023 at 4:03=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The prototype was hidden on x86, which causes a warning:
>
> kernel/irq_work.c:72:13: error: no previous prototype for 'arch_irq_work_=
raise' [-Werror=3Dmissing-prototypes]
>
> Fix this by providing it in only one place that is always visible.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/include/asm/irq_work.h     | 2 --
>  arch/arm64/include/asm/irq_work.h   | 2 --
>  arch/csky/include/asm/irq_work.h    | 2 +-
>  arch/powerpc/include/asm/irq_work.h | 1 -
>  arch/riscv/include/asm/irq_work.h   | 2 +-
>  arch/s390/include/asm/irq_work.h    | 2 --
>  arch/x86/include/asm/irq_work.h     | 1 -
>  include/linux/irq_work.h            | 3 +++
>  8 files changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/include/asm/irq_work.h b/arch/arm/include/asm/irq_w=
ork.h
> index 3149e4dc1b54..8895999834cc 100644
> --- a/arch/arm/include/asm/irq_work.h
> +++ b/arch/arm/include/asm/irq_work.h
> @@ -9,6 +9,4 @@ static inline bool arch_irq_work_has_interrupt(void)
>         return is_smp();
>  }
>
> -extern void arch_irq_work_raise(void);
> -
>  #endif /* _ASM_ARM_IRQ_WORK_H */
> diff --git a/arch/arm64/include/asm/irq_work.h b/arch/arm64/include/asm/i=
rq_work.h
> index 81bbfa3a035b..a1020285ea75 100644
> --- a/arch/arm64/include/asm/irq_work.h
> +++ b/arch/arm64/include/asm/irq_work.h
> @@ -2,8 +2,6 @@
>  #ifndef __ASM_IRQ_WORK_H
>  #define __ASM_IRQ_WORK_H
>
> -extern void arch_irq_work_raise(void);
> -
>  static inline bool arch_irq_work_has_interrupt(void)
>  {
>         return true;
> diff --git a/arch/csky/include/asm/irq_work.h b/arch/csky/include/asm/irq=
_work.h
> index 33aaf39d6f94..d39fcc1f5395 100644
> --- a/arch/csky/include/asm/irq_work.h
> +++ b/arch/csky/include/asm/irq_work.h
> @@ -7,5 +7,5 @@ static inline bool arch_irq_work_has_interrupt(void)
>  {
>         return true;
>  }
> -extern void arch_irq_work_raise(void);
> +
Acked-by: Guo Ren <guoren@kernel.org>

>  #endif /* __ASM_CSKY_IRQ_WORK_H */
> diff --git a/arch/powerpc/include/asm/irq_work.h b/arch/powerpc/include/a=
sm/irq_work.h
> index b8b0be8f1a07..c6d3078bd8c3 100644
> --- a/arch/powerpc/include/asm/irq_work.h
> +++ b/arch/powerpc/include/asm/irq_work.h
> @@ -6,6 +6,5 @@ static inline bool arch_irq_work_has_interrupt(void)
>  {
>         return true;
>  }
> -extern void arch_irq_work_raise(void);
>
>  #endif /* _ASM_POWERPC_IRQ_WORK_H */
> diff --git a/arch/riscv/include/asm/irq_work.h b/arch/riscv/include/asm/i=
rq_work.h
> index b53891964ae0..b27a4d64fc6a 100644
> --- a/arch/riscv/include/asm/irq_work.h
> +++ b/arch/riscv/include/asm/irq_work.h
> @@ -6,5 +6,5 @@ static inline bool arch_irq_work_has_interrupt(void)
>  {
>         return IS_ENABLED(CONFIG_SMP);
>  }
> -extern void arch_irq_work_raise(void);
> +
>  #endif /* _ASM_RISCV_IRQ_WORK_H */
> diff --git a/arch/s390/include/asm/irq_work.h b/arch/s390/include/asm/irq=
_work.h
> index 603783766d0a..f00c9f610d5a 100644
> --- a/arch/s390/include/asm/irq_work.h
> +++ b/arch/s390/include/asm/irq_work.h
> @@ -7,6 +7,4 @@ static inline bool arch_irq_work_has_interrupt(void)
>         return true;
>  }
>
> -void arch_irq_work_raise(void);
> -
>  #endif /* _ASM_S390_IRQ_WORK_H */
> diff --git a/arch/x86/include/asm/irq_work.h b/arch/x86/include/asm/irq_w=
ork.h
> index 800ffce0db29..6b4d36c95165 100644
> --- a/arch/x86/include/asm/irq_work.h
> +++ b/arch/x86/include/asm/irq_work.h
> @@ -9,7 +9,6 @@ static inline bool arch_irq_work_has_interrupt(void)
>  {
>         return boot_cpu_has(X86_FEATURE_APIC);
>  }
> -extern void arch_irq_work_raise(void);
>  #else
>  static inline bool arch_irq_work_has_interrupt(void)
>  {
> diff --git a/include/linux/irq_work.h b/include/linux/irq_work.h
> index 8cd11a223260..136f2980cba3 100644
> --- a/include/linux/irq_work.h
> +++ b/include/linux/irq_work.h
> @@ -66,6 +66,9 @@ void irq_work_sync(struct irq_work *work);
>  void irq_work_run(void);
>  bool irq_work_needs_cpu(void);
>  void irq_work_single(void *arg);
> +
> +void arch_irq_work_raise(void);
> +
>  #else
>  static inline bool irq_work_needs_cpu(void) { return false; }
>  static inline void irq_work_run(void) { }
> --
> 2.39.2
>


--=20
Best Regards
 Guo Ren
