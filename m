Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF16733889
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 20:57:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DR8ZwzCH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjT141r9Jz3bnK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 04:57:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DR8ZwzCH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjT0C1d4Dz2ys1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 04:56:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3A348631A0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 18:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23FC7C433B7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 18:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686941784;
	bh=TiK/t/XTSx2fh8UkKw1baZqCETUm1DZqQZdzQBTpc/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DR8ZwzCHVtydoaaxjVYJNAWu/EazGdygIZ9Srkd4r4zGNu0UV5wrYj4MX5arzEodp
	 UNvhvBrh5U4xGmDl5sewm5lcUokl1lD7VTeAPUPHyzYKCOX5F7Je9AJgJ0HqJqpHT2
	 dLMHymuA0MzirGgPHvlvL6U36HV4H2mHBFM4sA3+uLQ6uro16QwzRETHZvWuu01q0L
	 oEQm2Ghzu8fuJWG7gSLOHi6X72YNM+NGXR0jzbSIhti31b9mqhQFKwVaQG4h1o8jl3
	 sPN9LHTye4cTeZayTOrwNQq2w+QcnqfrU6lZ/h2mtxqSWd8YF98VAdngnnwpTSEIq6
	 2Cv/9seiufkYQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b34ac4b6e8so14417881fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 11:56:23 -0700 (PDT)
X-Gm-Message-State: AC+VfDzB5X8yHoMeFM3nfnmdBOJY8kae5+W8h+6AGMctJs+NBZ1Yx90Q
	x1ROIo4vnGHTm11TW2KYGWG6PAeFf9w2FwM5ru4=
X-Google-Smtp-Source: ACHHUZ5T8e7wpuuhOjnmCbHsB2+OgDZlJJ7sUOEWS0dN9xCa2iZ6+8btSZBMXNDx9vhO1lFKVvsg0dPvz5VmaKvg8Zw=
X-Received: by 2002:a2e:80c2:0:b0:2b2:f9c8:6ad1 with SMTP id
 r2-20020a2e80c2000000b002b2f9c86ad1mr2553844ljg.42.1686941782011; Fri, 16 Jun
 2023 11:56:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-6-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-6-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 11:56:09 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7qEEbyEBUPETHxMj+Kusow5zTk3Q4cRNo0qV+quUsZNA@mail.gmail.com>
Message-ID: <CAPhsuW7qEEbyEBUPETHxMj+Kusow5zTk3Q4cRNo0qV+quUsZNA@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] modules, execmem: drop module_alloc
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

On Fri, Jun 16, 2023 at 1:51=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> Define default parameters for address range for code allocations using
> the current values in module_alloc() and make execmem_text_alloc() use
> these defaults when an architecure does not supply its specific
> parameters.
>
> With this, execmem_text_alloc() implements memory allocation in a way
> compatible with module_alloc() and can be used as a replacement for
> module_alloc().
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

Acked-by: Song Liu <song@kernel.org>

> ---
>  include/linux/execmem.h      |  8 ++++++++
>  include/linux/moduleloader.h | 12 ------------
>  kernel/module/main.c         |  7 -------
>  mm/execmem.c                 | 12 ++++++++----
>  4 files changed, 16 insertions(+), 23 deletions(-)
>
> diff --git a/include/linux/execmem.h b/include/linux/execmem.h
> index 68b2bfc79993..b9a97fcdf3c5 100644
> --- a/include/linux/execmem.h
> +++ b/include/linux/execmem.h
> @@ -4,6 +4,14 @@
>
>  #include <linux/types.h>
>
> +#if (defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)) && =
\
> +               !defined(CONFIG_KASAN_VMALLOC)
> +#include <linux/kasan.h>
> +#define MODULE_ALIGN (PAGE_SIZE << KASAN_SHADOW_SCALE_SHIFT)
> +#else
> +#define MODULE_ALIGN PAGE_SIZE
> +#endif
> +
>  /**
>   * struct execmem_range - definition of a memory range suitable for code=
 and
>   *                       related data allocations
> diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
> index b3374342f7af..4321682fe849 100644
> --- a/include/linux/moduleloader.h
> +++ b/include/linux/moduleloader.h
> @@ -25,10 +25,6 @@ int module_frob_arch_sections(Elf_Ehdr *hdr,
>  /* Additional bytes needed by arch in front of individual sections */
>  unsigned int arch_mod_section_prepend(struct module *mod, unsigned int s=
ection);
>
> -/* Allocator used for allocating struct module, core sections and init
> -   sections.  Returns NULL on failure. */
> -void *module_alloc(unsigned long size);
> -
>  /* Determines if the section name is an init section (that is only used =
during
>   * module loading).
>   */
> @@ -113,12 +109,4 @@ void module_arch_cleanup(struct module *mod);
>  /* Any cleanup before freeing mod->module_init */
>  void module_arch_freeing_init(struct module *mod);
>
> -#if (defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)) && =
\
> -               !defined(CONFIG_KASAN_VMALLOC)
> -#include <linux/kasan.h>
> -#define MODULE_ALIGN (PAGE_SIZE << KASAN_SHADOW_SCALE_SHIFT)
> -#else
> -#define MODULE_ALIGN PAGE_SIZE
> -#endif
> -
>  #endif
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index 43810a3bdb81..b445c5ad863a 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -1600,13 +1600,6 @@ static void free_modinfo(struct module *mod)
>         }
>  }
>
> -void * __weak module_alloc(unsigned long size)
> -{
> -       return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
> -                       GFP_KERNEL, PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERM=
S,
> -                       NUMA_NO_NODE, __builtin_return_address(0));
> -}
> -
>  bool __weak module_init_section(const char *name)
>  {
>         return strstarts(name, ".init");
> diff --git a/mm/execmem.c b/mm/execmem.c
> index 2fe36dcc7bdf..a67acd75ffef 100644
> --- a/mm/execmem.c
> +++ b/mm/execmem.c
> @@ -59,9 +59,6 @@ void *execmem_text_alloc(size_t size)
>         unsigned long fallback_end =3D execmem_params.modules.text.fallba=
ck_end;
>         bool kasan =3D execmem_params.modules.flags & EXECMEM_KASAN_SHADO=
W;
>
> -       if (!execmem_params.modules.text.start)
> -               return module_alloc(size);
> -
>         return execmem_alloc(size, start, end, align, pgprot,
>                              fallback_start, fallback_end, kasan);
>  }
> @@ -108,8 +105,15 @@ void __init execmem_init(void)
>  {
>         struct execmem_params *p =3D execmem_arch_params();
>
> -       if (!p)
> +       if (!p) {
> +               p =3D &execmem_params;
> +               p->modules.text.start =3D VMALLOC_START;
> +               p->modules.text.end =3D VMALLOC_END;
> +               p->modules.text.pgprot =3D PAGE_KERNEL_EXEC;
> +               p->modules.text.alignment =3D 1;
> +
>                 return;
> +       }
>
>         if (!execmem_validate_params(p))
>                 return;
> --
> 2.35.1
>
