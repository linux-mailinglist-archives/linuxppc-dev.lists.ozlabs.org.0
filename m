Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3814733808
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 20:19:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IzPKo+jK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjS9s4wWrz3bw2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 04:19:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IzPKo+jK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjS8z3TSVz2xLW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 04:18:58 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F18EB61D6D
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 18:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7991C43395
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 18:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686939535;
	bh=JYIeppGROaSwt5RJCAxNQJPfExACzvun2YHFgIEWjL0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IzPKo+jK4luEJPBN0IXaMM9NoBohQwylmyD6SOtRwX+YHgT9pt8MIqbXkSBPR6OVR
	 /VjE3RPenLmbkl9jNPpLgItztd650j/5i4Va33yoTKpPExRZlBgNWOG1So983jlXQF
	 yVTlXF+vQ1OIFfDaYs9xwGLtC0FMaZ8PTvXNpCHGP797MMhtKNhJYcskAyFP4r0ORW
	 jRQGM3yRcA+dWCLV7mIEN2p/2GyNuYsQzdtYWVtVoCRZNrnYvu2dHR+Lw2iUXJxquc
	 FLnychOVPaAoWGd242H5r7TyNYDZiDO+1rDQAW2lvEG/PSv9+R2O/6b7/dZeA4YGtc
	 +8sk6it3T0tMw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4f762b3227dso1368672e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 11:18:55 -0700 (PDT)
X-Gm-Message-State: AC+VfDwPH2X5GJCVn3IFwbC3jq0V8ZGPf61nopWv3rgyyEggbOQ4r46e
	wdnUfwLYXGN6Ax9PZfpqA4EjAb+TkjRFZW4qj8A=
X-Google-Smtp-Source: ACHHUZ6PUs5qG5gEz0Ui+rYTOBYo1CNjp/5QXhNKC7wMrP1gtK8A+svd4/31TT3PuRRLSD+QiqJSaxjJua7jMaFtZ74=
X-Received: by 2002:ac2:4c4c:0:b0:4f6:3ef3:13e8 with SMTP id
 o12-20020ac24c4c000000b004f63ef313e8mr2671938lfk.0.1686939533810; Fri, 16 Jun
 2023 11:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-3-rppt@kernel.org>
 <ZIySQgafdTHk5Yet@moria.home.lan>
In-Reply-To: <ZIySQgafdTHk5Yet@moria.home.lan>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 11:18:41 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5hnH3Tq+rO1XJEAieDtr61xHBDRmp+C5zRYV5ajRcDFQ@mail.gmail.com>
Message-ID: <CAPhsuW5hnH3Tq+rO1XJEAieDtr61xHBDRmp+C5zRYV5ajRcDFQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] mm: introduce execmem_text_alloc() and jit_text_alloc()
To: Kent Overstreet <kent.overstreet@linux.dev>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 16, 2023 at 9:48=E2=80=AFAM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Fri, Jun 16, 2023 at 11:50:28AM +0300, Mike Rapoport wrote:
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> >
> > module_alloc() is used everywhere as a mean to allocate memory for code=
.
> >
> > Beside being semantically wrong, this unnecessarily ties all subsystems
> > that need to allocate code, such as ftrace, kprobes and BPF to modules
> > and puts the burden of code allocation to the modules code.
> >
> > Several architectures override module_alloc() because of various
> > constraints where the executable memory can be located and this causes
> > additional obstacles for improvements of code allocation.
> >
> > Start splitting code allocation from modules by introducing
> > execmem_text_alloc(), execmem_free(), jit_text_alloc(), jit_free() APIs=
.
> >
> > Initially, execmem_text_alloc() and jit_text_alloc() are wrappers for
> > module_alloc() and execmem_free() and jit_free() are replacements of
> > module_memfree() to allow updating all call sites to use the new APIs.
> >
> > The intention semantics for new allocation APIs:
> >
> > * execmem_text_alloc() should be used to allocate memory that must resi=
de
> >   close to the kernel image, like loadable kernel modules and generated
> >   code that is restricted by relative addressing.
> >
> > * jit_text_alloc() should be used to allocate memory for generated code
> >   when there are no restrictions for the code placement. For
> >   architectures that require that any code is within certain distance
> >   from the kernel image, jit_text_alloc() will be essentially aliased t=
o
> >   execmem_text_alloc().
> >
> > The names execmem_text_alloc() and jit_text_alloc() emphasize that the
> > allocated memory is for executable code, the allocations of the
> > associated data, like data sections of a module will use
> > execmem_data_alloc() interface that will be added later.
>
> I like the API split - at the risk of further bikeshedding, perhaps
> near_text_alloc() and far_text_alloc()? Would be more explicit.
>
> Reviewed-by: Kent Overstreet <kent.overstreet@linux.dev>

Acked-by: Song Liu <song@kernel.org>
