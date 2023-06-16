Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA1173387A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 20:55:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VAiGa0I3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjSyW2ZvBz3bsx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 04:54:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VAiGa0I3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjSxd5jdsz3bcM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 04:54:12 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A705D631A0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 18:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361F0C433B9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 18:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686941649;
	bh=Yn4AaKJNeoRa5k6Rpqw8rOaWUpFfj0b/8Nallv5Pzds=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VAiGa0I3VACBcfckeYjIsmg+o/Lg4sS9yo0qhzfoNoM8HW3/yOwai3153O/GUAXbj
	 YJtd0QtbYHxESgW/1famknmpEyl1VcqqZbhSsOi11zU9/ZMOErIBdZBoGkIJK30tWt
	 unGcQ+mitBz6SxYbCiSHZpCoP8hgQukNeXy1UbCOP0F5ZH682Nli8SfcUiRSggpyfA
	 eBElWbeNqWyPxCKgFRONE3eKcW6XHG/HLKpP7a6yELMQu7jW7a8McQDjl83mpuO51f
	 IpRYwyGRjNbRqpToW+gHjtGgDrWOf+YGXI32hL/bT3NIgnBpJWshrLsqdj1cuzU+Nn
	 8iQhg6Wj6381A==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f849605df4so1473811e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 11:54:09 -0700 (PDT)
X-Gm-Message-State: AC+VfDzGdc7e/jq2pCDq0e9BJGkbcuThgmEutl0a9YwhFPNuLqnMQmV9
	wmrBPEKF4ftBwGTFQ8JGJVpjVt9hdPSXzMU+R0k=
X-Google-Smtp-Source: ACHHUZ6uZ3NRfESc1LLdM7pG5QakOfq/c/daJr3jT6A/NUchGYkSu86UqZO3PB3EltPOLvcz17COALW9nYWOKlX1r+w=
X-Received: by 2002:a19:7b05:0:b0:4f6:d9e:7c3b with SMTP id
 w5-20020a197b05000000b004f60d9e7c3bmr2147967lfc.44.1686941646932; Fri, 16 Jun
 2023 11:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-5-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-5-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 11:53:54 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7xE8sz8Nh2AdNb62k=8kgEPxaBCw3w50EfXraxmKca-A@mail.gmail.com>
Message-ID: <CAPhsuW7xE8sz8Nh2AdNb62k=8kgEPxaBCw3w50EfXraxmKca-A@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] mm/execmem, arch: convert remaining overrides of
 module_alloc to execmem
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
[...]
> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> index 5af4975caeb5..c3d999f3a3dd 100644
> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c
> @@ -17,56 +17,50 @@
>  #include <linux/moduleloader.h>
>  #include <linux/scs.h>
>  #include <linux/vmalloc.h>
> +#include <linux/execmem.h>
>  #include <asm/alternative.h>
>  #include <asm/insn.h>
>  #include <asm/scs.h>
>  #include <asm/sections.h>
>
> -void *module_alloc(unsigned long size)
> +static struct execmem_params execmem_params =3D {
> +       .modules =3D {
> +               .flags =3D EXECMEM_KASAN_SHADOW,
> +               .text =3D {
> +                       .alignment =3D MODULE_ALIGN,
> +               },
> +       },
> +};
> +
> +struct execmem_params __init *execmem_arch_params(void)
>  {
>         u64 module_alloc_end =3D module_alloc_base + MODULES_VSIZE;
> -       gfp_t gfp_mask =3D GFP_KERNEL;
> -       void *p;
> -
> -       /* Silence the initial allocation */
> -       if (IS_ENABLED(CONFIG_ARM64_MODULE_PLTS))
> -               gfp_mask |=3D __GFP_NOWARN;
>
> -       if (IS_ENABLED(CONFIG_KASAN_GENERIC) ||
> -           IS_ENABLED(CONFIG_KASAN_SW_TAGS))
> -               /* don't exceed the static module region - see below */
> -               module_alloc_end =3D MODULES_END;
> +       execmem_params.modules.text.pgprot =3D PAGE_KERNEL;
> +       execmem_params.modules.text.start =3D module_alloc_base;

I think I mentioned this earlier. For arm64 with CONFIG_RANDOMIZE_BASE,
module_alloc_base is not yet set when execmem_arch_params() is
called. So we will need some extra logic for this.

Thanks,
Song


> +       execmem_params.modules.text.end =3D module_alloc_end;
>
> -       p =3D __vmalloc_node_range(size, MODULE_ALIGN, module_alloc_base,
> -                               module_alloc_end, gfp_mask, PAGE_KERNEL, =
VM_DEFER_KMEMLEAK,
> -                               NUMA_NO_NODE, __builtin_return_address(0)=
);
> -
> -       if (!p && IS_ENABLED(CONFIG_ARM64_MODULE_PLTS) &&
> +       /*
> +        * KASAN without KASAN_VMALLOC can only deal with module
> +        * allocations being served from the reserved module region,
> +        * since the remainder of the vmalloc region is already
> +        * backed by zero shadow pages, and punching holes into it
> +        * is non-trivial. Since the module region is not randomized
> +        * when KASAN is enabled without KASAN_VMALLOC, it is even
> +        * less likely that the module region gets exhausted, so we
> +        * can simply omit this fallback in that case.
> +        */
> +       if (IS_ENABLED(CONFIG_ARM64_MODULE_PLTS) &&
>             (IS_ENABLED(CONFIG_KASAN_VMALLOC) ||
>              (!IS_ENABLED(CONFIG_KASAN_GENERIC) &&
> -             !IS_ENABLED(CONFIG_KASAN_SW_TAGS))))
> -               /*
> -                * KASAN without KASAN_VMALLOC can only deal with module
> -                * allocations being served from the reserved module regi=
on,
> -                * since the remainder of the vmalloc region is already
> -                * backed by zero shadow pages, and punching holes into i=
t
> -                * is non-trivial. Since the module region is not randomi=
zed
> -                * when KASAN is enabled without KASAN_VMALLOC, it is eve=
n
> -                * less likely that the module region gets exhausted, so =
we
> -                * can simply omit this fallback in that case.
> -                */
> -               p =3D __vmalloc_node_range(size, MODULE_ALIGN, module_all=
oc_base,
> -                               module_alloc_base + SZ_2G, GFP_KERNEL,
> -                               PAGE_KERNEL, 0, NUMA_NO_NODE,
> -                               __builtin_return_address(0));
> -
> -       if (p && (kasan_alloc_module_shadow(p, size, gfp_mask) < 0)) {
> -               vfree(p);
> -               return NULL;
> +             !IS_ENABLED(CONFIG_KASAN_SW_TAGS)))) {
> +               unsigned long end =3D module_alloc_base + SZ_2G;
> +
> +               execmem_params.modules.text.fallback_start =3D module_all=
oc_base;
> +               execmem_params.modules.text.fallback_end =3D end;
>         }
>
> -       /* Memory is intended to be executable, reset the pointer tag. */
> -       return kasan_reset_tag(p);
> +       return &execmem_params;
>  }
>
>  enum aarch64_reloc_op {
