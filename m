Return-Path: <linuxppc-dev+bounces-2918-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F356C9BF0AB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 15:50:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xk7RP5NT6z2xpl;
	Thu,  7 Nov 2024 01:50:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730904625;
	cv=none; b=NuaztDaymuCk92YdwtAn6pFPibJZq8W7Xw8zDrqZKiluQd0xUt4P1mw68MYYOSD3H+01vfh/Eob2MXd67r/uB3fwZE99x+Z/k+4lCKAUo5AtmQ+5bvsQHGYy/evO7sUhgYHI22HkfT2nt2XXMo6XLr46AuAmizqSZ5DDoEwvcu2p2vSLhyHuBs8k2hx4t7aWbSHsD+spkonVoflA9cGNjxpBbMSF8jxAAZ6yOGFUjCdjDBtGPS+EaRA4HDNRLW4X/HAyBOp3S2IoZdQo5dIO92/wSuvsekNT7o1gySL1Y6c1G2+NVwMKpA44xXFO70G5ZFoxrZ1EISdvaaAhkNj27g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730904625; c=relaxed/relaxed;
	bh=lAgMWE7YvsQolp4dgQsNcRis0VMyFlOLl2sgDCMlRtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DnD2oyS2n2GZwthiDQwRfwSzQKFJFURZTb0j+Hnv6lY3QqP3OvaJT2+2zLkhH4kgMOz8uxeSP5jIb9CYFt6XtKDWA4Qxq4/2OoVa71kQR1PeNX/T76mQXLYj4mR5MevxJx9LTbGddwPtFbupU0ZDamvBxF4Fwan6gdxVeyWy00res9b5pldX8Oz3+vzLUttnbJ30/fDFuABrr/jGJgoaue9k2jzvSMjh6tZMxhykLswRgXmZ3gzAMhWeT66pIVz4NkkoZWM497bfovS/dwJI49u58Eq/GBNkS+cPttWLNG1CJG6hAHTd6ZURSYEVbUmpOWCtV1gEgdYb1yxSraHEZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W6N31rjG; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W6N31rjG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xk7RN2d59z2xjd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 01:50:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5ED0CA43E39
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 14:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F147DC4CED5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 14:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730904620;
	bh=BTI8mCfd+F1+ZsSIhcKu394EogjHKK4f8R5thMR9/JU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W6N31rjGfOOb21AuwOjYbrLm1LsPNpwjx1H3nfjVrIa/eY7mJjUKcDyzu9iHdVWC4
	 OQiSvi9sfLoz8CCeWutkA6Vl38qRKH0t6KWAXubN49ONqKgkujyuj2bHZVrEPHYSJG
	 jXKAbrJCaKlmFMYd6KOChoO87KuW0FfaJ5uynGGvmfhenJqEIs4lGnEekq1PXSk0uN
	 sJZt5ERQLSo5ZVE4KOOvVce2XFdOZAAqh45V+K1m4SMpqCu4bmXpOJoBMZG1Yvs6Y7
	 ahoYq35DCasl60Q/33pGpWYabdZOx1slY/KGX0fL/1SwXl1Fm3EzE5IzAM03TBRx88
	 wPEdUshb3QWvA==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e34339d41bso58179137b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2024 06:50:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+JoywHhraCyFo/nIW8tDAtwBxDK6lbAuAVHWELRBW6+vGmq5Gss3yllUJKAeauSRT5myn0oOrKthEIfI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyDPUmNIFeAN1C6hpoT2uGC8tY/mX0WUn1k9TADjxU/NGNrt4ai
	RlKHXlAg6T7d7mCaYwaf50Z/Du0pDlx8ndzKOum63ErzE6T0CT9nl413nSgplMbamYV2Q+HSUTI
	RhP7UJbv4QKMx6Kh8TdXi4rtavA==
X-Google-Smtp-Source: AGHT+IGQ+HcePls4B68fjLXm2WG2zUD3sxLkDlRwa73g9O74Ed7KDSK8zEDsTM92UO+3R5W3P/C8H8ih65XnTgWZQDo=
X-Received: by 2002:a05:690c:61c9:b0:6e3:31ee:23ab with SMTP id
 00721157ae682-6e9d899d1c2mr405335217b3.25.1730904619096; Wed, 06 Nov 2024
 06:50:19 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240702161052.3563599-1-robh@kernel.org> <D2RSWMPFF8KK.X5HZZMHANQMO@iki.fi>
 <D2RT0J8KXY1H.3MEV7KGQXTWHW@iki.fi> <CAL_JsqJDX+uOSoPh6pTNEP0vBLwcP3bKmAW1wCr_0cVr5fsPcg@mail.gmail.com>
 <D2SSH5HSDHQS.2YJSB22W3MHQK@iki.fi>
In-Reply-To: <D2SSH5HSDHQS.2YJSB22W3MHQK@iki.fi>
From: Rob Herring <robh@kernel.org>
Date: Wed, 6 Nov 2024 08:50:07 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLF+gs9e1TL1yi-xAZJRx4Kz7fOk=2wcF8kCqU3vyMWZA@mail.gmail.com>
Message-ID: <CAL_JsqLF+gs9e1TL1yi-xAZJRx4Kz7fOk=2wcF8kCqU3vyMWZA@mail.gmail.com>
Subject: Re: [PATCH] tpm: atmel: Drop PPC64 specific MMIO setup
To: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jul 18, 2024 at 11:01=E2=80=AFAM Jarkko Sakkinen <jarkko.sakkinen@i=
ki.fi> wrote:
>
> On Thu Jul 18, 2024 at 5:57 PM EEST, Rob Herring wrote:
> > On Wed, Jul 17, 2024 at 6:14=E2=80=AFAM Jarkko Sakkinen <jarkko.sakkine=
n@iki.fi> wrote:
> > >
> > > On Wed Jul 17, 2024 at 3:08 PM EEST, Jarkko Sakkinen wrote:
> > > > On Tue Jul 2, 2024 at 7:10 PM EEST, Rob Herring (Arm) wrote:
> > > > > The PPC64 specific MMIO setup open codes DT address functions rat=
her
> > > > > than using standard address parsing functions. The open-coded ver=
sion
> > > > > fails to handle any address translation and is not endian safe.
> > > > >
> > > > > I haven't found any evidence of what platform used this. The only=
 thing
> > > > > that turned up was a PPC405 platform, but that is 32-bit and PPC4=
05
> > > > > support is being removed as well. CONFIG_TCG_ATMEL is not enabled=
 for
> > > > > any powerpc config and never was. The support was added in 2005 a=
nd
> > > > > hasn't been touched since.
> > > > >
> > > > > Rather than try to modernize and fix this code, just remove it.
> > > > >
> > > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > ---
> > > > >  drivers/char/tpm/Kconfig     |   2 +-
> > > > >  drivers/char/tpm/tpm_atmel.c |  64 +++++++++++++++-
> > > > >  drivers/char/tpm/tpm_atmel.h | 140 -----------------------------=
------
> > > > >  3 files changed, 62 insertions(+), 144 deletions(-)
> > > > >  delete mode 100644 drivers/char/tpm/tpm_atmel.h
> > > > >
> > > > > diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
> > > > > index e63a6a17793c..9b655e9fc7ab 100644
> > > > > --- a/drivers/char/tpm/Kconfig
> > > > > +++ b/drivers/char/tpm/Kconfig
> > > > > @@ -162,7 +162,7 @@ config TCG_NSC
> > > > >
> > > > >  config TCG_ATMEL
> > > > >     tristate "Atmel TPM Interface"
> > > > > -   depends on PPC64 || HAS_IOPORT_MAP
> > > > > +   depends on HAS_IOPORT_MAP
> > > > >     depends on HAS_IOPORT
> > > > >     help
> > > > >       If you have a TPM security chip from Atmel say Yes and it
> > > > > diff --git a/drivers/char/tpm/tpm_atmel.c b/drivers/char/tpm/tpm_=
atmel.c
> > > > > index 9fb2defa9dc4..622c4abe8cb3 100644
> > > > > --- a/drivers/char/tpm/tpm_atmel.c
> > > > > +++ b/drivers/char/tpm/tpm_atmel.c
> > > > > @@ -15,7 +15,67 @@
> > > > >   */
> > > > >
> > > > >  #include "tpm.h"
> > > > > -#include "tpm_atmel.h"
> > > > > +
> > > > > +struct tpm_atmel_priv {
> > > > > +   int region_size;
> > > > > +   int have_region;
> > > > > +   unsigned long base;
> > > > > +   void __iomem *iobase;
> > > > > +};
> > > > > +
> > > > > +#define atmel_getb(chip, offset) inb(atmel_get_priv(chip)->base =
+ offset)
> > > > > +#define atmel_putb(val, chip, offset) \
> > > > > +   outb(val, atmel_get_priv(chip)->base + offset)
> > > > > +#define atmel_request_region request_region
> > > > > +#define atmel_release_region release_region
> > > > > +/* Atmel definitions */
> > > > > +enum tpm_atmel_addr {
> > > > > +   TPM_ATMEL_BASE_ADDR_LO =3D 0x08,
> > > > > +   TPM_ATMEL_BASE_ADDR_HI =3D 0x09
> > > > > +};
> > > > > +
> > > > > +static inline int tpm_read_index(int base, int index)
> > > > > +{
> > > > > +   outb(index, base);
> > > > > +   return inb(base+1) & 0xFF;
> > > > > +}
> > > > > +
> > > > > +/* Verify this is a 1.1 Atmel TPM */
> > > > > +static int atmel_verify_tpm11(void)
> > > > > +{
> > > > > +
> > > > > +   /* verify that it is an Atmel part */
> > > > > +   if (tpm_read_index(TPM_ADDR, 4) !=3D 'A' ||
> > > > > +       tpm_read_index(TPM_ADDR, 5) !=3D 'T' ||
> > > > > +       tpm_read_index(TPM_ADDR, 6) !=3D 'M' ||
> > > > > +       tpm_read_index(TPM_ADDR, 7) !=3D 'L')
> > > > > +           return 1;
> > > > > +
> > > > > +   /* query chip for its version number */
> > > > > +   if (tpm_read_index(TPM_ADDR, 0x00) !=3D 1 ||
> > > > > +       tpm_read_index(TPM_ADDR, 0x01) !=3D 1)
> > > > > +           return 1;
> > > > > +
> > > > > +   /* This is an atmel supported part */
> > > > > +   return 0;
> > > > > +}
> > > > > +
> > > > > +/* Determine where to talk to device */
> > > > > +static void __iomem * atmel_get_base_addr(unsigned long *base, i=
nt *region_size)
> > > > > +{
> > > > > +   int lo, hi;
> > > > > +
> > > > > +   if (atmel_verify_tpm11() !=3D 0)
> > > > > +           return NULL;
> > > > > +
> > > > > +   lo =3D tpm_read_index(TPM_ADDR, TPM_ATMEL_BASE_ADDR_LO);
> > > > > +   hi =3D tpm_read_index(TPM_ADDR, TPM_ATMEL_BASE_ADDR_HI);
> > > > > +
> > > > > +   *base =3D (hi << 8) | lo;
> > > > > +   *region_size =3D 2;
> > > > > +
> > > > > +   return ioport_map(*base, *region_size);
> > > > > +}
> > > > >
> > > > >  /* write status bits */
> > > > >  enum tpm_atmel_write_status {
> > > > > @@ -142,7 +202,6 @@ static void atml_plat_remove(void)
> > > > >     tpm_chip_unregister(chip);
> > > > >     if (priv->have_region)
> > > > >             atmel_release_region(priv->base, priv->region_size);
> > > > > -   atmel_put_base_addr(priv->iobase);
> > > > >     platform_device_unregister(pdev);
> > > > >  }
> > > > >
> > > > > @@ -211,7 +270,6 @@ static int __init init_atmel(void)
> > > > >  err_unreg_dev:
> > > > >     platform_device_unregister(pdev);
> > > > >  err_rel_reg:
> > > > > -   atmel_put_base_addr(iobase);
> > > > >     if (have_region)
> > > > >             atmel_release_region(base,
> > > > >                                  region_size);
> > > > > diff --git a/drivers/char/tpm/tpm_atmel.h b/drivers/char/tpm/tpm_=
atmel.h
> > > > > deleted file mode 100644
> > > > > index 7ac3f69dcf0f..000000000000
> > > > > --- a/drivers/char/tpm/tpm_atmel.h
> > > > > +++ /dev/null
> > > > > @@ -1,140 +0,0 @@
> > > > > -/* SPDX-License-Identifier: GPL-2.0-only */
> > > > > -/*
> > > > > - * Copyright (C) 2005 IBM Corporation
> > > > > - *
> > > > > - * Authors:
> > > > > - * Kylene Hall <kjhall@us.ibm.com>
> > > > > - *
> > > > > - * Maintained by: <tpmdd-devel@lists.sourceforge.net>
> > > > > - *
> > > > > - * Device driver for TCG/TCPA TPM (trusted platform module).
> > > > > - * Specifications at www.trustedcomputinggroup.org
> > > > > - *
> > > > > - * These difference are required on power because the device mus=
t be
> > > > > - * discovered through the device tree and iomap must be used to =
get
> > > > > - * around the need for holes in the io_page_mask.  This does not=
 happen
> > > > > - * automatically because the tpm is not a normal pci device and =
lives
> > > > > - * under the root node.
> > > > > - */
> > > > > -
> > > > > -struct tpm_atmel_priv {
> > > > > -   int region_size;
> > > > > -   int have_region;
> > > > > -   unsigned long base;
> > > > > -   void __iomem *iobase;
> > > > > -};
> > > > > -
> > > > > -#ifdef CONFIG_PPC64
> > > > > -
> > > > > -#include <linux/of.h>
> > > > > -
> > > > > -#define atmel_getb(priv, offset) readb(priv->iobase + offset)
> > > > > -#define atmel_putb(val, priv, offset) writeb(val, priv->iobase +=
 offset)
> > > > > -#define atmel_request_region request_mem_region
> > > > > -#define atmel_release_region release_mem_region
> > > > > -
> > > > > -static inline void atmel_put_base_addr(void __iomem *iobase)
> > > > > -{
> > > > > -   iounmap(iobase);
> > > > > -}
> > > > > -
> > > > > -static void __iomem * atmel_get_base_addr(unsigned long *base, i=
nt *region_size)
> > > > > -{
> > > > > -   struct device_node *dn;
> > > > > -   unsigned long address, size;
> > > > > -   const unsigned int *reg;
> > > > > -   int reglen;
> > > > > -   int naddrc;
> > > > > -   int nsizec;
> > > > > -
> > > > > -   dn =3D of_find_node_by_name(NULL, "tpm");
> > > > > -
> > > > > -   if (!dn)
> > > > > -           return NULL;
> > > > > -
> > > > > -   if (!of_device_is_compatible(dn, "AT97SC3201")) {
> > > > > -           of_node_put(dn);
> > > > > -           return NULL;
> > > > > -   }
> > > > > -
> > > > > -   reg =3D of_get_property(dn, "reg", &reglen);
> > > > > -   naddrc =3D of_n_addr_cells(dn);
> > > > > -   nsizec =3D of_n_size_cells(dn);
> > > > > -
> > > > > -   of_node_put(dn);
> > > > > -
> > > > > -
> > > > > -   if (naddrc =3D=3D 2)
> > > > > -           address =3D ((unsigned long) reg[0] << 32) | reg[1];
> > > > > -   else
> > > > > -           address =3D reg[0];
> > > > > -
> > > > > -   if (nsizec =3D=3D 2)
> > > > > -           size =3D
> > > > > -               ((unsigned long) reg[naddrc] << 32) | reg[naddrc =
+ 1];
> > > > > -   else
> > > > > -           size =3D reg[naddrc];
> > > > > -
> > > > > -   *base =3D address;
> > > > > -   *region_size =3D size;
> > > > > -   return ioremap(*base, *region_size);
> > > > > -}
> > > > > -#else
> > > > > -#define atmel_getb(chip, offset) inb(atmel_get_priv(chip)->base =
+ offset)
> > > > > -#define atmel_putb(val, chip, offset) \
> > > > > -   outb(val, atmel_get_priv(chip)->base + offset)
> > > > > -#define atmel_request_region request_region
> > > > > -#define atmel_release_region release_region
> > > > > -/* Atmel definitions */
> > > > > -enum tpm_atmel_addr {
> > > > > -   TPM_ATMEL_BASE_ADDR_LO =3D 0x08,
> > > > > -   TPM_ATMEL_BASE_ADDR_HI =3D 0x09
> > > > > -};
> > > > > -
> > > > > -static inline int tpm_read_index(int base, int index)
> > > > > -{
> > > > > -   outb(index, base);
> > > > > -   return inb(base+1) & 0xFF;
> > > > > -}
> > > > > -
> > > > > -/* Verify this is a 1.1 Atmel TPM */
> > > > > -static int atmel_verify_tpm11(void)
> > > > > -{
> > > > > -
> > > > > -   /* verify that it is an Atmel part */
> > > > > -   if (tpm_read_index(TPM_ADDR, 4) !=3D 'A' ||
> > > > > -       tpm_read_index(TPM_ADDR, 5) !=3D 'T' ||
> > > > > -       tpm_read_index(TPM_ADDR, 6) !=3D 'M' ||
> > > > > -       tpm_read_index(TPM_ADDR, 7) !=3D 'L')
> > > > > -           return 1;
> > > > > -
> > > > > -   /* query chip for its version number */
> > > > > -   if (tpm_read_index(TPM_ADDR, 0x00) !=3D 1 ||
> > > > > -       tpm_read_index(TPM_ADDR, 0x01) !=3D 1)
> > > > > -           return 1;
> > > > > -
> > > > > -   /* This is an atmel supported part */
> > > > > -   return 0;
> > > > > -}
> > > > > -
> > > > > -static inline void atmel_put_base_addr(void __iomem *iobase)
> > > > > -{
> > > > > -}
> > > > > -
> > > > > -/* Determine where to talk to device */
> > > > > -static void __iomem * atmel_get_base_addr(unsigned long *base, i=
nt *region_size)
> > > > > -{
> > > > > -   int lo, hi;
> > > > > -
> > > > > -   if (atmel_verify_tpm11() !=3D 0)
> > > > > -           return NULL;
> > > > > -
> > > > > -   lo =3D tpm_read_index(TPM_ADDR, TPM_ATMEL_BASE_ADDR_LO);
> > > > > -   hi =3D tpm_read_index(TPM_ADDR, TPM_ATMEL_BASE_ADDR_HI);
> > > > > -
> > > > > -   *base =3D (hi << 8) | lo;
> > > > > -   *region_size =3D 2;
> > > > > -
> > > > > -   return ioport_map(*base, *region_size);
> > > > > -}
> > > > > -#endif
> > > >
> > > > Responding from holidays but:
> > > >
> > > > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > >
> > > > [still away for couple of weeks]
> > >
> > > I got these in with checkpatch.pl --strict:
> > >
> > > CHECK: Macro argument 'offset' may be better as '(offset)' to avoid p=
recedence issues
> > > #59: FILE: drivers/char/tpm/tpm_atmel.c:26:
> > > +#define atmel_getb(chip, offset) inb(atmel_get_priv(chip)->base + of=
fset)
> > >
> > > CHECK: Macro argument 'offset' may be better as '(offset)' to avoid p=
recedence issues
> > > #60: FILE: drivers/char/tpm/tpm_atmel.c:27:
> > > +#define atmel_putb(val, chip, offset) \
> > > +       outb(val, atmel_get_priv(chip)->base + offset)
> > >
> > > CHECK: spaces preferred around that '+' (ctx:VxV)
> > > #73: FILE: drivers/char/tpm/tpm_atmel.c:40:
> > > +       return inb(base+1) & 0xFF;
> > >                       ^
> > >
> > > CHECK: Blank lines aren't necessary after an open brace '{'
> > > #79: FILE: drivers/char/tpm/tpm_atmel.c:46:
> > > +{
> > > +
> > >
> > > Can you address them and I'll tag the next version, once I've
> > > revisited checkpatch. Otherwise, nothing against the code change.
> >
> > Those all existed before because I just moved what was left of the
> > header contents into the .c file. Fixing them seems like a separate
> > change to me. I can just leave the header in place and avoid the
> > warnings if you prefer. Otherwise, those warnings are the least of the
> > clean-up this driver needs. For starters, I would make those defines
> > static inlines instead.
>
> Ah, ok sorry. It was fairly mechanical check as I'm just quickly
> going critical stuff from holidays.
>
> I'm back after next week, so I'd really like to hold with this
> up until that and prepare when I'm back a patch set, which includes
> a supplemental patch fixing those issues (if you don't mind).

Whatever happened to this? Can you please apply my patch if you don't
have the time for further rework.

Rob

