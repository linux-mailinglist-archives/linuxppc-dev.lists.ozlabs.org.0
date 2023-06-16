Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B428733A46
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 22:02:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nN/7beEv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjVS81Sgtz3c3F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 06:02:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nN/7beEv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjVRC4RH4z303p
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 06:01:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 35CF863165
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 20:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283C3C4339A
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 20:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686945683;
	bh=NNR06pawYLcrluh/DT0ZjxTIOvEpuKGIsr6P52TLsXk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nN/7beEvgALVGQkGDEWMU+WqmdryAGMT4sVLSi7IEGH0/JtCnmrU3kw5AqPLNEEt2
	 b6emvhoGN8eTdLfEDtNYs26stQbDj/4s/lj/H7doGiv19RIkQeGdhKyNqG1Qjo7N6h
	 zQTAaJBX00GGP97q/gkRiV+5kyjXHPHnjAye9DI90OZEFDTXx9TQNSqKb0n9w0bzYW
	 yxHLnA4zTvHmfaAjtSOfNR3JJPDo/DMYbNlXcfilvYl1IRgxPyH9NdLZUlPRpYsdUE
	 wHxG+Bo6kDlJfk/kU/gHZcMukITMi2cUkAY5BsjH4quq3iBvEGr92lAorvbxrlQ5vA
	 zG5Aco1x2X+Sg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4f766777605so1569611e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 13:01:23 -0700 (PDT)
X-Gm-Message-State: AC+VfDy/7noCtyZOaNgUTago5GQE+qk2Vf7O8UfgE+mWu4cVhUuj0+0R
	nglo2kWVWsIN1v6mN4ucBPE6t/DzrmV87vSaCw4=
X-Google-Smtp-Source: ACHHUZ5JqRMNnpRMFCyZiMjc+UWPs6A2cx1mTw/2r3SQw3woyTfRJjaUEkhnoXK7xbHKeHI/ilSSCGbka/vlr73Fo7g=
X-Received: by 2002:a05:6512:60a:b0:4f8:5635:2ccf with SMTP id
 b10-20020a056512060a00b004f856352ccfmr2048673lfe.8.1686945680955; Fri, 16 Jun
 2023 13:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-7-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-7-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 13:01:08 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4J+rFvh9WJVWLZxFHtcYxahYk=NoKYdU9FMibZU8986w@mail.gmail.com>
Message-ID: <CAPhsuW4J+rFvh9WJVWLZxFHtcYxahYk=NoKYdU9FMibZU8986w@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] mm/execmem: introduce execmem_data_alloc()
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
> Data related to code allocations, such as module data section, need to
> comply with architecture constraints for its placement and its
> allocation right now was done using execmem_text_alloc().
>
> Create a dedicated API for allocating data related to code allocations
> and allow architectures to define address ranges for data allocations.
>
> Since currently this is only relevant for powerpc variants that use the
> VMALLOC address space for module data allocations, automatically reuse
> address ranges defined for text unless address range for data is
> explicitly defined by an architecture.
>
> With separation of code and data allocations, data sections of the
> modules are now mapped as PAGE_KERNEL rather than PAGE_KERNEL_EXEC which
> was a default on many architectures.
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
[...]
>  static void free_mod_mem(struct module *mod)
> diff --git a/mm/execmem.c b/mm/execmem.c
> index a67acd75ffef..f7bf496ad4c3 100644
> --- a/mm/execmem.c
> +++ b/mm/execmem.c
> @@ -63,6 +63,20 @@ void *execmem_text_alloc(size_t size)
>                              fallback_start, fallback_end, kasan);
>  }
>
> +void *execmem_data_alloc(size_t size)
> +{
> +       unsigned long start =3D execmem_params.modules.data.start;
> +       unsigned long end =3D execmem_params.modules.data.end;
> +       pgprot_t pgprot =3D execmem_params.modules.data.pgprot;
> +       unsigned int align =3D execmem_params.modules.data.alignment;
> +       unsigned long fallback_start =3D execmem_params.modules.data.fall=
back_start;
> +       unsigned long fallback_end =3D execmem_params.modules.data.fallba=
ck_end;
> +       bool kasan =3D execmem_params.modules.flags & EXECMEM_KASAN_SHADO=
W;
> +
> +       return execmem_alloc(size, start, end, align, pgprot,
> +                            fallback_start, fallback_end, kasan);
> +}
> +
>  void execmem_free(void *ptr)
>  {
>         /*
> @@ -101,6 +115,28 @@ static bool execmem_validate_params(struct execmem_p=
arams *p)
>         return true;
>  }
>
> +static void execmem_init_missing(struct execmem_params *p)

Shall we call this execmem_default_init_data?

> +{
> +       struct execmem_modules_range *m =3D &p->modules;
> +
> +       if (!pgprot_val(execmem_params.modules.data.pgprot))
> +               execmem_params.modules.data.pgprot =3D PAGE_KERNEL;

Do we really need to check each of these? IOW, can we do:

if (!pgprot_val(execmem_params.modules.data.pgprot)) {
       execmem_params.modules.data.pgprot =3D PAGE_KERNEL;
       execmem_params.modules.data.alignment =3D m->text.alignment;
       execmem_params.modules.data.start =3D m->text.start;
       execmem_params.modules.data.end =3D m->text.end;
       execmem_params.modules.data.fallback_start =3D m->text.fallback_star=
t;
      execmem_params.modules.data.fallback_end =3D m->text.fallback_end;
}

Thanks,
Song

[...]
