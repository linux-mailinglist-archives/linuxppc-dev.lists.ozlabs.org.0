Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13068733ABA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 22:19:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UDI57R+A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjVrR6G8gz3c2m
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 06:19:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UDI57R+A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjVqY3Ywhz3bcS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 06:19:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 71EAF63F20
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 20:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46651C43395
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 20:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686946742;
	bh=2gFsvIXhZCi6KoizK2mVR8ubH1d6zKHpuStaPaewE2c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UDI57R+Ac8F87HdvmrIejvjCHM49LTC4REb6jwcTgaWly1GGKsFbDi3ghmDp0sH5F
	 dyADcSB+eIU3pbcZs4WY9WOy0Qfue9ZKueQFrHo6+fN0pFBb6x0I9BFxnKIQnZ0f6m
	 zoeRxS58zso8o8K5cKrj75Ci+DjJ2i0NK5f/ruazAus2+TOpX2RWJhZX7p+ZAwMaoZ
	 7/IjfjgHld/4MT6CtRzHW+8wrzT/BS827SmRNHxio26g9lEtfuPfj6kxYVksHyp6iy
	 q4wBjLvMwutEo9bQbQ0iSwXG+SX0mZCYXiK84cI+EMmphh55ZOB3JRt4P0s1ApMmst
	 2YeyFD5vvx/Xg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4f849605df4so1588390e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 13:19:02 -0700 (PDT)
X-Gm-Message-State: AC+VfDz0KomoIXUPC/7GTYTCF/zFJaShzeo5FUXDPdTnMhS5sknY+KBq
	Ewtk0fnPLYT3FHknnPMr/sDxjqOiaks4HOWN/60=
X-Google-Smtp-Source: ACHHUZ4xCjWLdj6bUZgrYEqyfT0+mWbIpLp7dl+h+OA2H/SetbsgMpyruMyrfqh6ldv/ey70g6BKmUQ4Jmh+AiNCLf0=
X-Received: by 2002:a19:5e02:0:b0:4f7:69b9:fa07 with SMTP id
 s2-20020a195e02000000b004f769b9fa07mr2191315lfb.45.1686946740318; Fri, 16 Jun
 2023 13:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-12-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-12-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 13:18:48 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5N3RuBijpyXrzVk_mpAyUQ5TeTuS2jic6Y-ybFVJpBjg@mail.gmail.com>
Message-ID: <CAPhsuW5N3RuBijpyXrzVk_mpAyUQ5TeTuS2jic6Y-ybFVJpBjg@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] x86/ftrace: enable dynamic ftrace without CONFIG_MODULES
To: Mike Rapoport <rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 16, 2023 at 1:52=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> Dynamic ftrace must allocate memory for code and this was impossible
> without CONFIG_MODULES.
>
> With execmem separated from the modules code, execmem_text_alloc() is
> available regardless of CONFIG_MODULES.
>
> Remove dependency of dynamic ftrace on CONFIG_MODULES and make
> CONFIG_DYNAMIC_FTRACE select CONFIG_EXECMEM in Kconfig.
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

Acked-by: Song Liu <song@kernel.org>

> ---
>  arch/x86/Kconfig         |  1 +
>  arch/x86/kernel/ftrace.c | 10 ----------
>  2 files changed, 1 insertion(+), 10 deletions(-)
>
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 53bab123a8ee..ab64bbef9e50 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -35,6 +35,7 @@ config X86_64
>         select SWIOTLB
>         select ARCH_HAS_ELFCORE_COMPAT
>         select ZONE_DMA32
> +       select EXECMEM if DYNAMIC_FTRACE
>
>  config FORCE_DYNAMIC_FTRACE
>         def_bool y
> diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
> index f77c63bb3203..a824a5d3b129 100644
> --- a/arch/x86/kernel/ftrace.c
> +++ b/arch/x86/kernel/ftrace.c
> @@ -261,8 +261,6 @@ void arch_ftrace_update_code(int command)
>  /* Currently only x86_64 supports dynamic trampolines */
>  #ifdef CONFIG_X86_64
>
> -#ifdef CONFIG_MODULES
> -/* Module allocation simplifies allocating memory for code */
>  static inline void *alloc_tramp(unsigned long size)
>  {
>         return execmem_text_alloc(size);
> @@ -271,14 +269,6 @@ static inline void tramp_free(void *tramp)
>  {
>         execmem_free(tramp);
>  }
> -#else
> -/* Trampolines can only be created if modules are supported */
> -static inline void *alloc_tramp(unsigned long size)
> -{
> -       return NULL;
> -}
> -static inline void tramp_free(void *tramp) { }
> -#endif
>
>  /* Defined as markers to the end of the ftrace default trampolines */
>  extern void ftrace_regs_caller_end(void);
> --
> 2.35.1
>
