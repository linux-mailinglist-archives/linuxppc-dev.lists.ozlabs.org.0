Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6E171F60D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 00:36:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXLbS2CjJz3cLT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 08:36:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FOEYRJKp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FOEYRJKp;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXLZY18ybz3c9R
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 08:36:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4F36A64AA5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 22:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B439EC433A0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 22:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685658961;
	bh=HByQUJENQcDPWiijaDFhYT8jA4bRcfOqcVglu/ddG6U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FOEYRJKpnW4iKM1qTP1RubJNm9oWcin4d1pqMhfHH1jHWxeA9v7cAr5+A08be7Fvr
	 zIIQ+RK+VnwmRh4dV8eSpzAC9vuNvbbjJOCAUkLs9IEIoqPeldosvmDlneE7uI7zOd
	 MEOs6GaTT4piHutYs3mvFo1SqMwdjh24tg3ZUrqf+ZV0OcZYne8qDSmsAgVG5/lRkC
	 oXr4pi7df6VNXbdn9AQ54C0O6ISTgYI6uFDZwH8n+ZPgRbBtlTQ2kYBiwhgF0xcuce
	 QXcem6qexEf8Xds1Y609C0dKziypJ0zgLG99S8eQ6nOm/bUVZH+kysGTa5OEj33f00
	 mI/aIAuZGqq9Q==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4effb818c37so1873976e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 15:36:01 -0700 (PDT)
X-Gm-Message-State: AC+VfDzqEpQkcLEjPwgA6gldQ5saUacKS2kJC0jkzkQN4jH/mIsrIbPb
	RitDU2weCNJSbS3pQaXCBXiKE/pjKmBS6PlemBA=
X-Google-Smtp-Source: ACHHUZ5IpAtCBKLINxhk+Z0SWINwbFkPqmi++HI/k6BNegfGNCzvnzTim5Gy3oJJLp9NHmq3+FFn0pl72eGk9Pzb3ws=
X-Received: by 2002:ac2:48ba:0:b0:4ec:8816:f4fc with SMTP id
 u26-20020ac248ba000000b004ec8816f4fcmr792426lfg.6.1685658959623; Thu, 01 Jun
 2023 15:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230601101257.530867-1-rppt@kernel.org> <20230601101257.530867-5-rppt@kernel.org>
In-Reply-To: <20230601101257.530867-5-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 1 Jun 2023 15:35:47 -0700
X-Gmail-Original-Message-ID: <CAPhsuW70o=8QwcNJPx=qxaKoPkOzwYt8xxzjK38dF2tJB-18jQ@mail.gmail.com>
Message-ID: <CAPhsuW70o=8QwcNJPx=qxaKoPkOzwYt8xxzjK38dF2tJB-18jQ@mail.gmail.com>
Subject: Re: [PATCH 04/13] mm/jitalloc, arch: convert remaining overrides of
 module_alloc to jitalloc
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
Cc: x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <d
 avem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 1, 2023 at 3:13=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wrot=
e:
>
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> Extend jitalloc parameters to accommodate more complex overrides of
> module_alloc() by architectures.
>
> This includes specification of a fallback range required by arm, arm64
> and powerpc and support for allocation of KASAN shadow required by
> arm64, s390 and x86.
>
> The core implementation of jit_alloc() takes care of suppressing warnings
> when the initial allocation fails but there is a fallback range defined.
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

[...]

>
> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> index 5af4975caeb5..ecf1f4030317 100644
> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c
> @@ -17,56 +17,49 @@
>  #include <linux/moduleloader.h>
>  #include <linux/scs.h>
>  #include <linux/vmalloc.h>
> +#include <linux/jitalloc.h>
>  #include <asm/alternative.h>
>  #include <asm/insn.h>
>  #include <asm/scs.h>
>  #include <asm/sections.h>
>
> -void *module_alloc(unsigned long size)
> +static struct jit_alloc_params jit_alloc_params =3D {
> +       .alignment      =3D MODULE_ALIGN,
> +       .flags          =3D JIT_ALLOC_KASAN_SHADOW,
> +};
> +
> +struct jit_alloc_params *jit_alloc_arch_params(void)
>  {
>         u64 module_alloc_end =3D module_alloc_base + MODULES_VSIZE;

module_alloc_base() is initialized in kaslr_init(), which is called after
mm_core_init(). We will need some special logic for this.

Thanks,
Song

> -       gfp_t gfp_mask =3D GFP_KERNEL;
> -       void *p;
> -
> -       /* Silence the initial allocation */
> -       if (IS_ENABLED(CONFIG_ARM64_MODULE_PLTS))
> -               gfp_mask |=3D __GFP_NOWARN;
>

[...]
