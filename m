Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DF33A81A9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 16:02:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G494Q3sTGz3c64
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 00:02:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HLZk5o1O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HLZk5o1O; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G493w12z8z2yXq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 00:02:03 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47A7F61417
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 14:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623765721;
 bh=QlhAPeeyHHRjIGhNphYkDKi45QaQ5wrJVvOCJ5iwTZk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HLZk5o1OlBgpmgNxo3t078PtogHJjxbNiaBMRlwd2BTkB/WBR8vXsVYBqyF+p9ELR
 25tMDLO5H37Av/dobs/EnUv0epiWfN1DRzdmonV2WmbiiePuuyRnmmMGquVFkN8NlL
 0ulmWZjqmJU8v27pswwRbHqymC8TPZh024JoCTjJFPFtCpzeHQmwtL9U1PjWFNRE7i
 u5QvonJ5dI3P8UPxmKaow53KojSZjBQrv0U2nGZVQciJ58MStXS73Gtk/yUq/6SA88
 Y4zC+BAIY8lS1IIOCyLzMVJPYA0ZsjKwuFD5pgL9ZjJTWLv+VTpzKOYQ48v2+DYqZP
 hHIBiq3hJJWEg==
Received: by mail-lf1-f42.google.com with SMTP id f30so27276225lfj.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 07:02:01 -0700 (PDT)
X-Gm-Message-State: AOAM533NVyLGgWtCn3Z9uB84gAopDk7Wq/dXgbVhnyKJdQMJneUJuiyT
 GVw+Mn4ErtZpcDxVUZr2ZR21xx29Noc3h4dw+w==
X-Google-Smtp-Source: ABdhPJxVqI8MHrcAWKd/OVKi4zXYd9o5Ej5sqMSK1SDKoChQIuRHCXHX7nfhLloiCMRd7u65oO394YM97kSgD621jRA=
X-Received: by 2002:a17:906:85d5:: with SMTP id
 i21mr20560813ejy.360.1623765708507; 
 Tue, 15 Jun 2021 07:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210221174930.27324-1-nramas@linux.microsoft.com>
 <20210221174930.27324-6-nramas@linux.microsoft.com>
 <CAMuHMdVSuNS4edh-zM0_sbC0i1AAjQ9Y0n_8Mjz=3CALkW4pgg@mail.gmail.com>
In-Reply-To: <CAMuHMdVSuNS4edh-zM0_sbC0i1AAjQ9Y0n_8Mjz=3CALkW4pgg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 15 Jun 2021 08:01:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ2x7zbyP3fAacdfHOWjCVjg6XhraV2YkoBJdZ2jXAMEA@mail.gmail.com>
Message-ID: <CAL_JsqJ2x7zbyP3fAacdfHOWjCVjg6XhraV2YkoBJdZ2jXAMEA@mail.gmail.com>
Subject: Re: [PATCH v19 05/13] of: Add a common kexec FDT setup function
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Masahiro Yamada <masahiroy@kernel.org>, James Morris <jmorris@namei.org>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
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

On Tue, Jun 15, 2021 at 6:18 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Lakshmi and Rob,
>
> On Sun, Feb 21, 2021 at 6:52 PM Lakshmi Ramasubramanian
> <nramas@linux.microsoft.com> wrote:
> > From: Rob Herring <robh@kernel.org>
> >
> > Both arm64 and powerpc do essentially the same FDT /chosen setup for
> > kexec.  The differences are either omissions that arm64 should have
> > or additional properties that will be ignored.  The setup code can be
> > combined and shared by both powerpc and arm64.
> >
> > The differences relative to the arm64 version:
> >  - If /chosen doesn't exist, it will be created (should never happen).
> >  - Any old dtb and initrd reserved memory will be released.
> >  - The new initrd and elfcorehdr are marked reserved.
> >  - "linux,booted-from-kexec" is set.
> >
> > The differences relative to the powerpc version:
> >  - "kaslr-seed" and "rng-seed" may be set.
> >  - "linux,elfcorehdr" is set.
> >  - Any existing "linux,usable-memory-range" is removed.
> >
> > Combine the code for setting up the /chosen node in the FDT and updating
> > the memory reservation for kexec, for powerpc and arm64, in
> > of_kexec_alloc_and_setup_fdt() and move it to "drivers/of/kexec.c".
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
>
> > --- /dev/null
> > +++ b/drivers/of/kexec.c
>
> > +/*
> > + * of_kexec_alloc_and_setup_fdt - Alloc and setup a new Flattened Device Tree
> > + *
> > + * @image:             kexec image being loaded.
> > + * @initrd_load_addr:  Address where the next initrd will be loaded.
> > + * @initrd_len:                Size of the next initrd, or 0 if there will be none.
> > + * @cmdline:           Command line for the next kernel, or NULL if there will
> > + *                     be none.
> > + * @extra_fdt_size:    Additional size for the new FDT buffer.
> > + *
> > + * Return: fdt on success, or NULL errno on error.
> > + */
> > +void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
> > +                                  unsigned long initrd_load_addr,
> > +                                  unsigned long initrd_len,
> > +                                  const char *cmdline, size_t extra_fdt_size)
> > +{
>
> > +       /* Did we boot using an initrd? */
> > +       prop = fdt_getprop(fdt, chosen_node, "linux,initrd-start", NULL);
> > +       if (prop) {
> > +               u64 tmp_start, tmp_end, tmp_size;
> > +
> > +               tmp_start = fdt64_to_cpu(*((const fdt64_t *) prop));
> > +
> > +               prop = fdt_getprop(fdt, chosen_node, "linux,initrd-end", NULL);
> > +               if (!prop) {
> > +                       ret = -EINVAL;
> > +                       goto out;
> > +               }
> > +
> > +               tmp_end = fdt64_to_cpu(*((const fdt64_t *) prop));
>
> Some kernel code assumes "linux,initrd-{start,end}" are 64-bit,
> other code assumes 32-bit.

It can be either. The above code was a merge of arm64 and powerpc both
of which use 64-bit and still only runs on those arches. It looks like
some powerpc platforms may use 32-bit, but this would have been broken
before.

The code in drivers/of/fdt.c handles either case. We should probably
refactor early_init_dt_check_for_initrd() and this function to use a
common routine.

> linux/Documentation/arm/uefi.rst says 64-bit,
> dt-schema/schemas/chosen.yaml says 32-bit.

We should fix that.

Rob
