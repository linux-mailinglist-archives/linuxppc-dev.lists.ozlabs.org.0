Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2F8705D4B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 04:28:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLcV05kyhz3f8d
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 12:28:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=4691vsRS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=palmer@dabbelt.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=4691vsRS;
	dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLcT71Cxdz3bhD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 12:27:36 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1aaea43def7so2650665ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 19:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1684290453; x=1686882453;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oik51JQPg85IaF6uQeKdpJKlei3j8iZDbRMg5rmmh7k=;
        b=4691vsRStUZ7cla3scMb5+DYblLYZHI2qzQdQ7ryAOhVme9mLgXdr/vtIhW4wKJdja
         xQzJkktyr0YEtUZ4hTIVD+WSm5WaAk3m3job4GFjtqz1TDVyAEXrAmWJQ2ihY8ehxgus
         effhTMZSad7it1ApK89y5nZKghAvnfBCNDw7Q0/+b4+tJQk1z2QIRypYA+kQl9Cxz82X
         EcxIVKlDJFuQmlSggPt7kgKUmNO88M7rNxFgPDb+9Gg1ZZizRuxD0tvQspPJBStTRBAT
         XrUXxw3poKeqi8kQCFkCHGbFN9bngnXvpnGiGAdgdt9/VKXaDF2vKhlrJ2e0RwJsyC9B
         nLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684290453; x=1686882453;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oik51JQPg85IaF6uQeKdpJKlei3j8iZDbRMg5rmmh7k=;
        b=Q0+SZIMM7o5W4tMX3RPWcdPuCikThcdOfOVheevR2y+0gIDQFzYAGwP+UB2msv6F7o
         V2zCguNONnLPFskUv6GYXpslZUzS9GKYSUt58RdJlif/3UJcqBM111DMgCFVptqso6Yf
         7GUtS/LqiMWn5PGHiAM+ncH9Q3ufYimZkxttgNO/DQjbkhXGv46jQ6jeunZoeI+xT75m
         rvMNmvGv4/U36GshTGixAbZP0ZZosBoWryeN546LHZ3EZgU6ho1VZJqVHgjYspvnhx0j
         71T5mJK0WymlHkl4Di6BfC5Watb9Tto2oYn9/lYVFQn1w98kCQr8G/sTRnZDo/pNxkzO
         bBrg==
X-Gm-Message-State: AC+VfDxtB87jgyzm2WFPSRgNf5rQZAjJvQsFiuJyFhewTVQzLK/QUAbg
	dcOTl4osh8iAyt5rP6RwCbM/hA==
X-Google-Smtp-Source: ACHHUZ7xnSzo8hUajddXxkMMocfQLHgcWqiSxO23+1j1Y3Df80Ett9H+/+KwgPF88AlNMHuidLewNQ==
X-Received: by 2002:a17:903:1103:b0:1ab:d89:5ef6 with SMTP id n3-20020a170903110300b001ab0d895ef6mr48820751plh.68.1684290452671;
        Tue, 16 May 2023 19:27:32 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id u14-20020a170902e80e00b001a6388ce38bsm16192479plg.240.2023.05.16.19.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 19:27:32 -0700 (PDT)
Date: Tue, 16 May 2023 19:27:32 -0700 (PDT)
X-Google-Original-Date: Tue, 16 May 2023 19:27:05 PDT (-0700)
Subject: Re: [PATCH] irq_work: consolidate arch_irq_work_raise prototypes
In-Reply-To: <20230516200341.553413-1-arnd@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: arnd@kernel.org
Message-ID: <mhng-b3a6013a-229c-4b21-b810-00c838d443f4@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: linux-riscv@lists.infradead.org, x86@kernel.org, aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, hca@linux.ibm.com, Paul Walmsley <paul.walmsley@sifive.com>, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, mingo@redhat.com, guoren@kernel.org, linux-csky@vger.kernel.org, bp@alien8.de, tglx@linutronix.de, Will Deacon <will@kernel.org>, mingo@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 16 May 2023 13:02:31 PDT (-0700), arnd@kernel.org wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The prototype was hidden on x86, which causes a warning:
>
> kernel/irq_work.c:72:13: error: no previous prototype for 'arch_irq_work_raise' [-Werror=missing-prototypes]
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

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

>  arch/s390/include/asm/irq_work.h    | 2 --
>  arch/x86/include/asm/irq_work.h     | 1 -
>  include/linux/irq_work.h            | 3 +++
>  8 files changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/include/asm/irq_work.h b/arch/arm/include/asm/irq_work.h
> index 3149e4dc1b54..8895999834cc 100644
> --- a/arch/arm/include/asm/irq_work.h
> +++ b/arch/arm/include/asm/irq_work.h
> @@ -9,6 +9,4 @@ static inline bool arch_irq_work_has_interrupt(void)
>  	return is_smp();
>  }
>
> -extern void arch_irq_work_raise(void);
> -
>  #endif /* _ASM_ARM_IRQ_WORK_H */
> diff --git a/arch/arm64/include/asm/irq_work.h b/arch/arm64/include/asm/irq_work.h
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
>  	return true;
> diff --git a/arch/csky/include/asm/irq_work.h b/arch/csky/include/asm/irq_work.h
> index 33aaf39d6f94..d39fcc1f5395 100644
> --- a/arch/csky/include/asm/irq_work.h
> +++ b/arch/csky/include/asm/irq_work.h
> @@ -7,5 +7,5 @@ static inline bool arch_irq_work_has_interrupt(void)
>  {
>  	return true;
>  }
> -extern void arch_irq_work_raise(void);
> +
>  #endif /* __ASM_CSKY_IRQ_WORK_H */
> diff --git a/arch/powerpc/include/asm/irq_work.h b/arch/powerpc/include/asm/irq_work.h
> index b8b0be8f1a07..c6d3078bd8c3 100644
> --- a/arch/powerpc/include/asm/irq_work.h
> +++ b/arch/powerpc/include/asm/irq_work.h
> @@ -6,6 +6,5 @@ static inline bool arch_irq_work_has_interrupt(void)
>  {
>  	return true;
>  }
> -extern void arch_irq_work_raise(void);
>
>  #endif /* _ASM_POWERPC_IRQ_WORK_H */
> diff --git a/arch/riscv/include/asm/irq_work.h b/arch/riscv/include/asm/irq_work.h
> index b53891964ae0..b27a4d64fc6a 100644
> --- a/arch/riscv/include/asm/irq_work.h
> +++ b/arch/riscv/include/asm/irq_work.h
> @@ -6,5 +6,5 @@ static inline bool arch_irq_work_has_interrupt(void)
>  {
>  	return IS_ENABLED(CONFIG_SMP);
>  }
> -extern void arch_irq_work_raise(void);
> +
>  #endif /* _ASM_RISCV_IRQ_WORK_H */
> diff --git a/arch/s390/include/asm/irq_work.h b/arch/s390/include/asm/irq_work.h
> index 603783766d0a..f00c9f610d5a 100644
> --- a/arch/s390/include/asm/irq_work.h
> +++ b/arch/s390/include/asm/irq_work.h
> @@ -7,6 +7,4 @@ static inline bool arch_irq_work_has_interrupt(void)
>  	return true;
>  }
>
> -void arch_irq_work_raise(void);
> -
>  #endif /* _ASM_S390_IRQ_WORK_H */
> diff --git a/arch/x86/include/asm/irq_work.h b/arch/x86/include/asm/irq_work.h
> index 800ffce0db29..6b4d36c95165 100644
> --- a/arch/x86/include/asm/irq_work.h
> +++ b/arch/x86/include/asm/irq_work.h
> @@ -9,7 +9,6 @@ static inline bool arch_irq_work_has_interrupt(void)
>  {
>  	return boot_cpu_has(X86_FEATURE_APIC);
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
