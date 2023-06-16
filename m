Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F3E733A85
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 22:11:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TK7lwF2d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjVfL65rQz3c4b
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 06:11:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TK7lwF2d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjVd80RQ2z3bPN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 06:10:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 69A2C6108F
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 20:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47BEEC433CD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 20:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686946199;
	bh=WUwJ/CcnS7KQMIGc+n1lO6t7DBapdJHs3PtzN2L5DOs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TK7lwF2dgyhLjZz3axawLmkbuign1yOCHmc3Tx1v0nJMLzHE4AMIBuiBwMBtxulD8
	 Z3Vut6IBWtk2ssQ8ijhfs8vBi+Qy0HXySzPTA15IW8YrnEaB7IlHu2VlzDPnGeCZmI
	 K6M5pS/g15siuIekZ5t1I3/fk6k5aKAJaEj6SrOz/PCsDCt5E2f7BsT9bm6PGwrWgg
	 43Q6XfEEqBYd9YLn7kuhpOmt+nKESiRp8navYHM6l1x9CJMp/jkfUZ7Re+m79aLMHD
	 kbDq8gJyNG5Gays0CHzsM1Js8nifxRWQM5ErJCnC9FUIgd0MSE3JJ4Wb0UcNmLCkft
	 Ujy1yQtMOaDZQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f85fcef623so25034e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 13:09:59 -0700 (PDT)
X-Gm-Message-State: AC+VfDyrLw7ffNGCxzB3nqPsdk41YOo65D+upQL0QThc3awD+V7FQjde
	9M3Pwzw5gezxWDAq/PGn2GaXroZHcxRx33Y4kH4=
X-Google-Smtp-Source: ACHHUZ7ituqSYIn1SCVORmrSh+1n8O6ydQ9eZHh9b53aIx4zqNf09sKQF/S2prJ95SKqvJfHTGetd9Upy9eJLOlNi04=
X-Received: by 2002:a05:6512:3052:b0:4f7:47bb:2ce0 with SMTP id
 b18-20020a056512305200b004f747bb2ce0mr3066562lfb.4.1686946197316; Fri, 16 Jun
 2023 13:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-10-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-10-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 13:09:45 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6TmwsBmP4NQroE5OEFsaHh+S9zweXa4Fs_ZeJURguqAg@mail.gmail.com>
Message-ID: <CAPhsuW6TmwsBmP4NQroE5OEFsaHh+S9zweXa4Fs_ZeJURguqAg@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] powerpc: extend execmem_params for kprobes allocations
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
> powerpc overrides kprobes::alloc_insn_page() to remove writable
> permissions when STRICT_MODULE_RWX is on.
>
> Add definition of jit area to execmem_params to allow using the generic
> kprobes::alloc_insn_page() with the desired permissions.
>
> As powerpc uses breakpoint instructions to inject kprobes, it does not
> need to constrain kprobe allocations to the modules area and can use the
> entire vmalloc address space.
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

Acked-by: Song Liu <song@kernel.org>


> ---
>  arch/powerpc/kernel/kprobes.c | 14 --------------
>  arch/powerpc/kernel/module.c  | 13 +++++++++++++
>  2 files changed, 13 insertions(+), 14 deletions(-)
>
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.=
c
> index 5db8df5e3657..14c5ddec3056 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -126,20 +126,6 @@ kprobe_opcode_t *arch_adjust_kprobe_addr(unsigned lo=
ng addr, unsigned long offse
>         return (kprobe_opcode_t *)(addr + offset);
>  }
>
> -void *alloc_insn_page(void)
> -{
> -       void *page;
> -
> -       page =3D jit_text_alloc(PAGE_SIZE);
> -       if (!page)
> -               return NULL;
> -
> -       if (strict_module_rwx_enabled())
> -               set_memory_rox((unsigned long)page, 1);
> -
> -       return page;
> -}
> -
>  int arch_prepare_kprobe(struct kprobe *p)
>  {
>         int ret =3D 0;
> diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
> index 4c6c15bf3947..8e5b379d6da1 100644
> --- a/arch/powerpc/kernel/module.c
> +++ b/arch/powerpc/kernel/module.c
> @@ -96,6 +96,11 @@ static struct execmem_params execmem_params =3D {
>                         .alignment =3D 1,
>                 },
>         },
> +       .jit =3D {
> +               .text =3D {
> +                       .alignment =3D 1,
> +               },
> +       },
>  };
>
>
> @@ -131,5 +136,13 @@ struct execmem_params __init *execmem_arch_params(vo=
id)
>
>         execmem_params.modules.text.pgprot =3D prot;
>
> +       execmem_params.jit.text.start =3D VMALLOC_START;
> +       execmem_params.jit.text.end =3D VMALLOC_END;
> +
> +       if (strict_module_rwx_enabled())
> +               execmem_params.jit.text.pgprot =3D PAGE_KERNEL_ROX;
> +       else
> +               execmem_params.jit.text.pgprot =3D PAGE_KERNEL_EXEC;
> +
>         return &execmem_params;
>  }
> --
> 2.35.1
>
