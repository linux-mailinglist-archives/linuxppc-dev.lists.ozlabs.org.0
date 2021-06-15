Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A933A869C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 18:35:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4DT833xwz3c32
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 02:35:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Nf0favd4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Nf0favd4; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4DSh3k2rz308M
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 02:35:16 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82D4D61874
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 16:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623774912;
 bh=KPwWGxmpg2+R/ZLS2IDl8iiCzE/7WD8JZk2bGE/QMts=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Nf0favd4DH8amnrkqvYZtkQsxecrIcgxrLVmUpQZ86PzvVVLINtyJ45MrWRej3GDG
 nAtaJHtv01DWFr6rjxS1G2jWitSV6AknO1SdAd2m0hpE+cNxGOTuUzg22mRf541gBn
 YjUyTpwlMQ6/eQFabXktOQ2tlvOF+15QyrTRQeCazzrEjOvDlHmQq4Kk1yOFqGpE48
 g4la3mowcBBeE6H6XXpUGXgf6RyAJJPM89VpBMmLCqM+TL092qGoy1zgkrdYAfAJZg
 3mJtr78hLntyDieS6N+tUK3Yern2ZiLzShW11po9rlaIvyPB51YoaorKUC7/Wsl7Gw
 VuFEEkKmmUtmg==
Received: by mail-ej1-f47.google.com with SMTP id g8so23615143ejx.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 09:35:12 -0700 (PDT)
X-Gm-Message-State: AOAM531ycQIMye9gvsm3SAEQa8Rt670h9LTbmbD7/0Y+dn+CCxDePHs5
 P7pTMdxjOW9G6BWKeoJxiLVLBt1CifIuGKpP5A==
X-Google-Smtp-Source: ABdhPJzb1scuGBg1iwO9bred1d9KdCKkO1Pyyif8+6ImMU2HmLcKnkChTF+SHSnUN48zXPgPQaZ3dRPFNNA//lNpsiE=
X-Received: by 2002:a50:9345:: with SMTP id n5mr354653eda.289.1623774900181;
 Tue, 15 Jun 2021 09:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210221174930.27324-1-nramas@linux.microsoft.com>
 <20210221174930.27324-6-nramas@linux.microsoft.com>
 <CAMuHMdVSuNS4edh-zM0_sbC0i1AAjQ9Y0n_8Mjz=3CALkW4pgg@mail.gmail.com>
 <CAL_JsqJ2x7zbyP3fAacdfHOWjCVjg6XhraV2YkoBJdZ2jXAMEA@mail.gmail.com>
 <54efb4fce5aac7efbd0b1b3885e9098b1d4ea745.camel@linux.microsoft.com>
In-Reply-To: <54efb4fce5aac7efbd0b1b3885e9098b1d4ea745.camel@linux.microsoft.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 15 Jun 2021 10:34:48 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJEucP043eViq0Y1kAeqWNTqP5fLjfjz7+ksYx7QP_V5w@mail.gmail.com>
Message-ID: <CAL_JsqJEucP043eViq0Y1kAeqWNTqP5fLjfjz7+ksYx7QP_V5w@mail.gmail.com>
Subject: Re: [PATCH v19 05/13] of: Add a common kexec FDT setup function
To: nramas <nramas@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, tao.li@vivo.com,
 Mimi Zohar <zohar@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Frank Rowand <frowand.list@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Masahiro Yamada <masahiroy@kernel.org>, James Morris <jmorris@namei.org>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Will Deacon <will@kernel.org>,
 Prakhar Srivastava <prsriva@linux.microsoft.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Matthias Brugger <mbrugger@suse.com>, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>, Greg KH <gregkh@linuxfoundation.org>,
 Joe Perches <joe@perches.com>,
 linux-integrity <linux-integrity@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 15, 2021 at 10:13 AM nramas <nramas@linux.microsoft.com> wrote:
>
> On Tue, 2021-06-15 at 08:01 -0600, Rob Herring wrote:
> > On Tue, Jun 15, 2021 at 6:18 AM Geert Uytterhoeven <
> > geert@linux-m68k.org> wrote:
> > >
> > > > +void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
> > > > +                                  unsigned long
> > > > initrd_load_addr,
> > > > +                                  unsigned long initrd_len,
> > > > +                                  const char *cmdline, size_t
> > > > extra_fdt_size)
> > > > +{
> > > > +       /* Did we boot using an initrd? */
> > > > +       prop = fdt_getprop(fdt, chosen_node, "linux,initrd-
> > > > start", NULL);
> > > > +       if (prop) {
> > > > +               u64 tmp_start, tmp_end, tmp_size;
> > > > +
> > > > +               tmp_start = fdt64_to_cpu(*((const fdt64_t *)
> > > > prop));
> > > > +
> > > > +               prop = fdt_getprop(fdt, chosen_node,
> > > > "linux,initrd-end", NULL);
> > > > +               if (!prop) {
> > > > +                       ret = -EINVAL;
> > > > +                       goto out;
> > > > +               }
> > > > +
> > > > +               tmp_end = fdt64_to_cpu(*((const fdt64_t *)
> > > > prop));
> > >
> > > Some kernel code assumes "linux,initrd-{start,end}" are 64-bit,
> > > other code assumes 32-bit.
> >
> > It can be either. The above code was a merge of arm64 and powerpc
> > both
> > of which use 64-bit and still only runs on those arches. It looks
> > like
> > some powerpc platforms may use 32-bit, but this would have been
> > broken
> > before.
> of_kexec_alloc_and_setup_fdt() is called from elf_64.c (in
> arch/powerpc/kexec) which is for 64-bit powerpc platform only.

64-bit PPC could be writing 32-bit property values. The architecture
size doesn't necessarily matter. And if the values came from the
bootloader, who knows what size it used.

This code is 32-bit powerpc only?:

arch/powerpc/boot/main.c-       /* Tell the kernel initrd address via
device tree */
arch/powerpc/boot/main.c:       setprop_val(chosen,
"linux,initrd-start", (u32)(initrd_addr));
arch/powerpc/boot/main.c-       setprop_val(chosen,
"linux,initrd-end", (u32)(initrd_addr+initrd_size));

Rob
