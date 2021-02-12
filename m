Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2156831A0C4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 15:40:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dcbl94YBFzDwwp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Feb 2021 01:40:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=N8f+bnYO; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcbjL55hPzDwpW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Feb 2021 01:39:02 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1FE564E6B
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 14:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613140740;
 bh=VM/hMIuNki+8AuFH8dta46Xcca/j9vD4S9PCcOVeQsI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=N8f+bnYOA+8QccSFkz3+c7HLWmi9KEqIQN9oSZZgtmtc1B7yD81jzyH8wC8UPXMsi
 6bCG7NNbhJ3KRub2VAiKkLhRcIEo87oNZT8Y86GeKUHM1xSNIqskNhPlneCu9WyYxO
 X5lPi4UtNV+/faVgCZkbdEC5ksmDQE+BWVTUxUY40HT79m3F8D2YeGunpzNtceht7I
 31RFgSdHG1+pjlLUpg13Q5H0VWpJ+Ripai764pndmWyrjk+ql+QWij9zYpg12VmFKq
 0h4QCb5hop3j0MuO4IsR4RKZyQZiY1yP1uqF1fAZf+JDtPirNdUoCHWES1piXCAXTY
 Eu6tlb+eHm88g==
Received: by mail-ed1-f46.google.com with SMTP id v7so11100579eds.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 06:38:59 -0800 (PST)
X-Gm-Message-State: AOAM532RumU2ywQ89WjzQvcTzS4UwSN/dG914/raPxO2tD5PRnDJ7NcS
 hBUctiRdIUQ1L9v724bOpGdmoQx0GLuQm4cLCg==
X-Google-Smtp-Source: ABdhPJyp97cOTRclyGLtgxr1S7Tfbgy5vaTapO/SGIdQUo2xoq5WzhpSlNLNcX2B2eKSVg8aUw9l8VEjxo7SWHZxgkw=
X-Received: by 2002:a17:906:1d44:: with SMTP id
 o4mr1930426ejh.130.1613140737428; 
 Fri, 12 Feb 2021 06:38:57 -0800 (PST)
MIME-Version: 1.0
References: <20210209182200.30606-1-nramas@linux.microsoft.com>
 <20210209182200.30606-3-nramas@linux.microsoft.com>
 <87k0reozwh.fsf@manicouagan.localdomain>
 <8a3aa3d2-2eba-549a-9970-a2b0fe3586c9@linux.microsoft.com>
In-Reply-To: <8a3aa3d2-2eba-549a-9970-a2b0fe3586c9@linux.microsoft.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 12 Feb 2021 08:38:44 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ3sDzjsJXtb6EzE77BL+PhUxDJYUngLTqcm0popd7Ajw@mail.gmail.com>
Message-ID: <CAL_JsqJ3sDzjsJXtb6EzE77BL+PhUxDJYUngLTqcm0popd7Ajw@mail.gmail.com>
Subject: Re: [PATCH v17 02/10] of: Add a common kexec FDT setup function
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
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
 vincenzo.frascino@arm.com, Frank Rowand <frowand.list@gmail.com>,
 Sasha Levin <sashal@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 James Morris <jmorris@namei.org>, "AKASHI,
 Takahiro" <takahiro.akashi@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, devicetree@vger.kernel.org,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Will Deacon <will@kernel.org>,
 Prakhar Srivastava <prsriva@linux.microsoft.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Matthias Brugger <mbrugger@suse.com>, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 11, 2021 at 7:17 PM Lakshmi Ramasubramanian
<nramas@linux.microsoft.com> wrote:
>
> On 2/11/21 5:09 PM, Thiago Jung Bauermann wrote:
> >
> > There's actually a complication that I just noticed and needs to be
> > addressed. More below.
> >
>
> <...>
>
> >> +
> >> +/*
> >> + * of_kexec_alloc_and_setup_fdt - Alloc and setup a new Flattened Device Tree
> >> + *
> >> + * @image:          kexec image being loaded.
> >> + * @initrd_load_addr:       Address where the next initrd will be loaded.
> >> + * @initrd_len:             Size of the next initrd, or 0 if there will be none.
> >> + * @cmdline:                Command line for the next kernel, or NULL if there will
> >> + *                  be none.
> >> + *
> >> + * Return: fdt on success, or NULL errno on error.
> >> + */
> >> +void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
> >> +                               unsigned long initrd_load_addr,
> >> +                               unsigned long initrd_len,
> >> +                               const char *cmdline)
> >> +{
> >> +    void *fdt;
> >> +    int ret, chosen_node;
> >> +    const void *prop;
> >> +    unsigned long fdt_size;
> >> +
> >> +    fdt_size = fdt_totalsize(initial_boot_params) +
> >> +               (cmdline ? strlen(cmdline) : 0) +
> >> +               FDT_EXTRA_SPACE;
> >
> > Just adding 4 KB to initial_boot_params won't be enough for crash
> > kernels on ppc64. The current powerpc code doubles the size of
> > initial_boot_params (which is normally larger than 4 KB) and even that
> > isn't enough. A patch was added to powerpc/next today which uses a more
> > precise (but arch-specific) formula:
> >
> > https://lore.kernel.org/linuxppc-dev/161243826811.119001.14083048209224609814.stgit@hbathini/
> >
> > So I believe we need a hook here where architectures can provide their
> > own specific calculation for the size of the fdt. Perhaps a weakly
> > defined function providing a default implementation which an
> > arch-specific file can override (a la arch_kexec_kernel_image_load())?
> >
> > Then the powerpc specific hook would be the kexec_fdt_totalsize_ppc64()
> > function from the patch I linked above.
> >
>
> Do you think it'd better to add "fdt_size" parameter to
> of_kexec_alloc_and_setup_fdt() so that the caller can provide the
> desired FDT buffer size?

Yes, I guess so. But please define the param as extra size, not total
size. The kernel command line size addition can be in the common code.

The above change is also going to conflict, so I think this may have
to wait. Or I'll take the common and arm bits and powerpc can be
converted next cycle (or after the merge window).

Rob
