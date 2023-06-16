Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C41E5733A68
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 22:06:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f6jdPi0v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjVY34Lqfz3c2c
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 06:06:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f6jdPi0v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjVXB1M3vz304p
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 06:05:46 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4180A63522
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 20:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F22C433C9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 20:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686945943;
	bh=WtL681uu0xgDuNDCtnoYcQSLjySma9uSe62fWHoJUhA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f6jdPi0vbCVqLqgQDDmD+GO6OBfmTAAnNSnv31ejf0X579gkscpmfn1bTrsu+q2ra
	 40XK5tgjD4Pn3DEwgEMNXaNpAJoNV7jL4P4r8shZe9dBhyksUMC8rwkwFkvZkFVkCR
	 IGp3JmtLPxLnrzx47G+lStd1hKB4UgLYKewi3Ki/K5woVsZktBsRAZ2Di1MUFiXRWn
	 1YkJryPbn+hll4loxeYSz5PcOp11n7V/droF7ZpB0pqIuzSutJSGr0pq7VRjU9BgpD
	 r54x5CfpgaRK4fVGltSX9D3VAd0D4uJxrcV171/lcN7V+Y7pDOa0WYzp0o27UZTPXi
	 Y80FFy3waZkgA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4f845060481so1571531e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 13:05:43 -0700 (PDT)
X-Gm-Message-State: AC+VfDz4WasTtKPaUM2Y1FgPgk92BnD3oWpjtcaeUHYcQ3JpVEAo7mii
	WJ8ctUnedkRPZjEcnCqZa+7wP/3a2wvG+vAEx2g=
X-Google-Smtp-Source: ACHHUZ7v0OG7lj710Dpkky2x3Qwl+xOOMZ2WmKSKGrGJ24Aq4/yPm9YniFAuyGWs2DWPlG6NvD65kdAaVeIKyOd6PQ8=
X-Received: by 2002:a19:644e:0:b0:4e9:9e45:3470 with SMTP id
 b14-20020a19644e000000b004e99e453470mr2381818lfj.3.1686945941704; Fri, 16 Jun
 2023 13:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-8-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-8-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 13:05:29 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6BG2oVrGDOpCKyOEvU9fBOboYYhducv96KUBe276Mvng@mail.gmail.com>
Message-ID: <CAPhsuW6BG2oVrGDOpCKyOEvU9fBOboYYhducv96KUBe276Mvng@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] arm64, execmem: extend execmem_params for
 generated code definitions
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
> The memory allocations for kprobes on arm64 can be placed anywhere in
> vmalloc address space and currently this is implemented with an override
> of alloc_insn_page() in arm64.
>
> Extend execmem_params with a range for generated code allocations and
> make kprobes on arm64 use this extension rather than override
> alloc_insn_page().
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>  arch/arm64/kernel/module.c         |  9 +++++++++
>  arch/arm64/kernel/probes/kprobes.c |  7 -------
>  include/linux/execmem.h            | 11 +++++++++++
>  mm/execmem.c                       | 14 +++++++++++++-
>  4 files changed, 33 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> index c3d999f3a3dd..52b09626bc0f 100644
> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c
> @@ -30,6 +30,13 @@ static struct execmem_params execmem_params =3D {
>                         .alignment =3D MODULE_ALIGN,
>                 },
>         },
> +       .jit =3D {
> +               .text =3D {
> +                       .start =3D VMALLOC_START,
> +                       .end =3D VMALLOC_END,
> +                       .alignment =3D 1,
> +               },
> +       },
>  };

This is growing fast. :) We have 3 now: text, data, jit. And it will be
5 when we split data into rw data, ro data, ro after init data. I wonder
whether we should still do some type enum here. But we can revisit
this topic later.

Other than that

Acked-by: Song Liu <song@kernel.org>
