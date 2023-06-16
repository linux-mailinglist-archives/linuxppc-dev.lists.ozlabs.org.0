Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCF1733A83
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 22:10:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LxCbm5cD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjVdC6GZ5z3bjX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 06:10:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LxCbm5cD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjVcH2H09z303p
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 06:09:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F14C61059
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 20:09:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48325C433D9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 20:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686946156;
	bh=OgYjmmyzs2EjPHttaKLNX98CAQTU+jc+5TBMU4O7+WI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LxCbm5cDIUCYF8vZ7/LSzW/JsLhlLxX2d0fFu2V1HgTidoI9d4L/VcB0ImMydV0Ee
	 8YO3x9rZwXIg0Q8DSxAacAiTV2XZF+Tx6U090kqCtI27PsdZZcqcz9z/jPPmjP/BO+
	 +hkLjrbWsn0v25jP1pDPME4x+2gpLpEY35EjhkIKvEuKe2/3rsozkAcXaNwJmCkb+A
	 X7bmvsPi5j2j5SwoGSlbvPVi8ziT05b2vTUayZaz5G8lhTX7m8dLb1/JKFPYnoJ/IR
	 mFM5oymVsHdTAn2VYpKaZ+WPpolrWfQDdRU+ChUXiqnpZHojozka+L/klHYc/ncUUT
	 POOaZ9hxvTPSA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b3424edd5fso15872841fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 13:09:16 -0700 (PDT)
X-Gm-Message-State: AC+VfDyacJGvCealF0heejM11zDxLDMBUJzK9fC+lx+2RNo/CRzguS1s
	iv40CYE4zdUnrzYDHg5hM9aoT8Y2e45LMBAgbKU=
X-Google-Smtp-Source: ACHHUZ5jllDYgbNtI+72IVu/75j7amNBljuYpY3fpVnJlR5XF3n+gM7EWdkroNHXMw4vgK3ry1o4z8o6D6rXoRQsv1A=
X-Received: by 2002:a2e:b705:0:b0:2b4:4a0b:8fad with SMTP id
 j5-20020a2eb705000000b002b44a0b8fadmr2685993ljo.29.1686946154254; Fri, 16 Jun
 2023 13:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-9-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-9-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 13:09:02 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4xrU5vfpwOmP6KC2jzVaovjO_-zo+07YvJL3r9masQ2Q@mail.gmail.com>
Message-ID: <CAPhsuW4xrU5vfpwOmP6KC2jzVaovjO_-zo+07YvJL3r9masQ2Q@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] riscv: extend execmem_params for kprobes allocations
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
> RISC-V overrides kprobes::alloc_insn_range() to use the entire vmalloc ar=
ea
> rather than limit the allocations to the modules area.
>
> Slightly reorder execmem_params initialization to support both 32 and 64
> bit variantsi and add definition of jit area to execmem_params to support
> generic kprobes::alloc_insn_page().
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

Acked-by: Song Liu <song@kernel.org>


> ---
>  arch/riscv/kernel/module.c         | 16 +++++++++++++++-
>  arch/riscv/kernel/probes/kprobes.c | 10 ----------
>  2 files changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index ee5e04cd3f21..cca6ed4e9340 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -436,7 +436,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char =
*strtab,
>         return 0;
>  }
>
> -#if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
> +#ifdef CONFIG_MMU
>  static struct execmem_params execmem_params =3D {
>         .modules =3D {
>                 .text =3D {
> @@ -444,12 +444,26 @@ static struct execmem_params execmem_params =3D {
>                         .alignment =3D 1,
>                 },
>         },
> +       .jit =3D {
> +               .text =3D {
> +                       .pgprot =3D PAGE_KERNEL_READ_EXEC,
> +                       .alignment =3D 1,
> +               },
> +       },
>  };
>
>  struct execmem_params __init *execmem_arch_params(void)
>  {
> +#ifdef CONFIG_64BIT
>         execmem_params.modules.text.start =3D MODULES_VADDR;
>         execmem_params.modules.text.end =3D MODULES_END;
> +#else
> +       execmem_params.modules.text.start =3D VMALLOC_START;
> +       execmem_params.modules.text.end =3D VMALLOC_END;
> +#endif
> +
> +       execmem_params.jit.text.start =3D VMALLOC_START;
> +       execmem_params.jit.text.end =3D VMALLOC_END;
>
>         return &execmem_params;
>  }
> diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probe=
s/kprobes.c
> index 2f08c14a933d..e64f2f3064eb 100644
> --- a/arch/riscv/kernel/probes/kprobes.c
> +++ b/arch/riscv/kernel/probes/kprobes.c
> @@ -104,16 +104,6 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
>         return 0;
>  }
>
> -#ifdef CONFIG_MMU
> -void *alloc_insn_page(void)
> -{
> -       return  __vmalloc_node_range(PAGE_SIZE, 1, VMALLOC_START, VMALLOC=
_END,
> -                                    GFP_KERNEL, PAGE_KERNEL_READ_EXEC,
> -                                    VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
> -                                    __builtin_return_address(0));
> -}
> -#endif
> -
>  /* install breakpoint in text */
>  void __kprobes arch_arm_kprobe(struct kprobe *p)
>  {
> --
> 2.35.1
>
