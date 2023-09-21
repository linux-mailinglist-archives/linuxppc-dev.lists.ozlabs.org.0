Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BA87AA526
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 00:35:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mfa0wr7Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs9G15p6nz3cmS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 08:35:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mfa0wr7Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rs9F83v5Fz3c2G
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 08:34:36 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id EABA5CE23FC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 22:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DD9C433D9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 22:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695335672;
	bh=fncpICFIZJhs+CFipAysf+2ViMsb5Ntfqci2xnszhTI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mfa0wr7Z0lJ3IA4HjAqOtrk9SSrWWB+YGbaJc16KYeVVOnawrEHs3dy+iDauvghvS
	 XAHLDo1Oga4nzW8Yi1caKnTTFJMqd7AtLKV54l/hFjnIDnOa7YaUJG8OwSNQt6PDO1
	 7A+xKgOCxHubIbnNN8HZ22TUVPtwpthTbmR6DHRJsZoaCg1nFEuNlqOAO63MKUXx9I
	 SVjAKnxkUVKeWQXgqE8UM2tHBIJCB/eo8eJdbedgXyDGRo4W6Xudl4FTLuPEDPrLWB
	 k28dHj46DhheR/Wrwnz4X+g5x8ZjJWpuI68P2lkJi7EwbKR/MM3KSc5SviEdI3D0pl
	 RSPtrB9bT5Klg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5031ccf004cso2471059e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 15:34:32 -0700 (PDT)
X-Gm-Message-State: AOJu0YxucVTz7kWwR2GJE5cgttu/cEj9xJOh2LCKenrw4+M0zWmUiLRs
	PIAkH5qzop/2Hh/yn5FrnqZr/y8uV8jcTC7OB7o=
X-Google-Smtp-Source: AGHT+IFZJtrM0/Sc4i9G46WkcXtuEGlwSrtGZZ9iCEr70spXydIPXGtt7clCqr3CvwCB3MyRIs3nmXQD2zetfl7/+As=
X-Received: by 2002:a19:6445:0:b0:503:3446:8ef5 with SMTP id
 b5-20020a196445000000b0050334468ef5mr4362567lfj.10.1695335670837; Thu, 21 Sep
 2023 15:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230918072955.2507221-1-rppt@kernel.org> <20230918072955.2507221-3-rppt@kernel.org>
In-Reply-To: <20230918072955.2507221-3-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 21 Sep 2023 15:34:18 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5-=H1V=VXUYxyGnUdJuNUpRt44QmpwjkDUD=9i0itjuw@mail.gmail.com>
Message-ID: <CAPhsuW5-=H1V=VXUYxyGnUdJuNUpRt44QmpwjkDUD=9i0itjuw@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] mm: introduce execmem_text_alloc() and execmem_free()
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Luis Chamberlain <mcgrof@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?UTF-8?B?QmrDtnJuIF
 TDtnBlbA==?= <bjorn@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 18, 2023 at 12:30=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>

[...]

> diff --git a/arch/s390/kernel/module.c b/arch/s390/kernel/module.c
> index 42215f9404af..db5561d0c233 100644
> --- a/arch/s390/kernel/module.c
> +++ b/arch/s390/kernel/module.c
> @@ -21,6 +21,7 @@
>  #include <linux/moduleloader.h>
>  #include <linux/bug.h>
>  #include <linux/memory.h>
> +#include <linux/execmem.h>
>  #include <asm/alternative.h>
>  #include <asm/nospec-branch.h>
>  #include <asm/facility.h>
> @@ -76,7 +77,7 @@ void *module_alloc(unsigned long size)
>  #ifdef CONFIG_FUNCTION_TRACER
>  void module_arch_cleanup(struct module *mod)
>  {
> -       module_memfree(mod->arch.trampolines_start);
> +       execmem_free(mod->arch.trampolines_start);
>  }
>  #endif
>
> @@ -510,7 +511,7 @@ static int module_alloc_ftrace_hotpatch_trampolines(s=
truct module *me,
>
>         size =3D FTRACE_HOTPATCH_TRAMPOLINES_SIZE(s->sh_size);
>         numpages =3D DIV_ROUND_UP(size, PAGE_SIZE);
> -       start =3D module_alloc(numpages * PAGE_SIZE);
> +       start =3D execmem_text_alloc(EXECMEM_FTRACE, numpages * PAGE_SIZE=
);

This should be EXECMEM_MODULE_TEXT?

Thanks,
Song

>         if (!start)
>                 return -ENOMEM;
>         set_memory_rox((unsigned long)start, numpages);
[...]
