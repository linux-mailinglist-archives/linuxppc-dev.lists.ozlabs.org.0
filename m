Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 384FA3A8629
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 18:13:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4Czs5xDzz3c2m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 02:13:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=S3nWv4Yf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=S3nWv4Yf; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4G4CzN4bWvz3btL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 02:13:20 +1000 (AEST)
Received: from nramas-ThinkStation-P520 (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 289BF20B83DE;
 Tue, 15 Jun 2021 09:13:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 289BF20B83DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1623773595;
 bh=6UtEbcJN/IpvUsLN1GwdJnJrbEZUHAkAxbKrwbhgW78=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=S3nWv4Yf1N41H0w1XOSwFPGkr7/xfVoa9sUqWF341iik0xwYxblV16N/Bn7QfL+Gu
 4rULT6aNTDRocdECtjebsPLhXgpR5L67WcrQMTYKf/J9N2zaDDOmFqJGxI8/rygbOq
 LZOJ+ayZrbnAqpTcPicLrwL8cTXwbtOcLdLzJGEk=
Message-ID: <54efb4fce5aac7efbd0b1b3885e9098b1d4ea745.camel@linux.microsoft.com>
Subject: Re: [PATCH v19 05/13] of: Add a common kexec FDT setup function
From: nramas <nramas@linux.microsoft.com>
To: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Jun 2021 09:13:14 -0700
In-Reply-To: <CAL_JsqJ2x7zbyP3fAacdfHOWjCVjg6XhraV2YkoBJdZ2jXAMEA@mail.gmail.com>
References: <20210221174930.27324-1-nramas@linux.microsoft.com>
 <20210221174930.27324-6-nramas@linux.microsoft.com>
 <CAMuHMdVSuNS4edh-zM0_sbC0i1AAjQ9Y0n_8Mjz=3CALkW4pgg@mail.gmail.com>
 <CAL_JsqJ2x7zbyP3fAacdfHOWjCVjg6XhraV2YkoBJdZ2jXAMEA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Will Deacon <will@kernel.org>,
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

On Tue, 2021-06-15 at 08:01 -0600, Rob Herring wrote:
> On Tue, Jun 15, 2021 at 6:18 AM Geert Uytterhoeven <
> geert@linux-m68k.org> wrote:
> > 
> > > +void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
> > > +                                  unsigned long
> > > initrd_load_addr,
> > > +                                  unsigned long initrd_len,
> > > +                                  const char *cmdline, size_t
> > > extra_fdt_size)
> > > +{
> > > +       /* Did we boot using an initrd? */
> > > +       prop = fdt_getprop(fdt, chosen_node, "linux,initrd-
> > > start", NULL);
> > > +       if (prop) {
> > > +               u64 tmp_start, tmp_end, tmp_size;
> > > +
> > > +               tmp_start = fdt64_to_cpu(*((const fdt64_t *)
> > > prop));
> > > +
> > > +               prop = fdt_getprop(fdt, chosen_node,
> > > "linux,initrd-end", NULL);
> > > +               if (!prop) {
> > > +                       ret = -EINVAL;
> > > +                       goto out;
> > > +               }
> > > +
> > > +               tmp_end = fdt64_to_cpu(*((const fdt64_t *)
> > > prop));
> > 
> > Some kernel code assumes "linux,initrd-{start,end}" are 64-bit,
> > other code assumes 32-bit.
> 
> It can be either. The above code was a merge of arm64 and powerpc
> both
> of which use 64-bit and still only runs on those arches. It looks
> like
> some powerpc platforms may use 32-bit, but this would have been
> broken
> before.
of_kexec_alloc_and_setup_fdt() is called from elf_64.c (in
arch/powerpc/kexec) which is for 64-bit powerpc platform only.

thanks,
 -lakshmi

> 
> The code in drivers/of/fdt.c handles either case. We should probably
> refactor early_init_dt_check_for_initrd() and this function to use a
> common routine.
> 
> > linux/Documentation/arm/uefi.rst says 64-bit,
> > dt-schema/schemas/chosen.yaml says 32-bit.
> 
> We should fix that.
> 
> Rob

