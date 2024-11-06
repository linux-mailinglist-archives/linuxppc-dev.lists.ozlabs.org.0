Return-Path: <linuxppc-dev+bounces-2927-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6899BF50E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 19:17:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkD2T3bXSz3bfS;
	Thu,  7 Nov 2024 05:17:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730917057;
	cv=none; b=INp1e2gGD2u8eT3kkpft1COGlu8GEJ920JHxEGKxzPtx98s3zfHbMtV9NsRAiFefYvN3fchcVYJyV9iyCsicqQnZxlA9Xy/HfFnPeP26UJMC5nTteA4OzksZxVWkql/QKsYXBNYBD63zNpCJGfTO+5BetGhrvQQxp8CuosFROlpJ6McdTWZwxEhe1eX1dYz+mT4UHoYBO/LWo9oZQkfjIzSSI0A/PEZjCHrm53DbltSvDn11W86dwBF+yhghf33Z/hDanhuT4HIguOAwjIRrwXwP+0aAyBYsUmxu0ijUYAq/KQvYMxq6raQEbQvZAVG8PsSMRV0GVHVueSkmdPGkrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730917057; c=relaxed/relaxed;
	bh=alS7Oqtm0xG4Mf5FCJLYk5KUoOuGJqtK25RQlrpverA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=E/v5aM0h/MbsbLnvnvuIhANAOy3lVmBtUahhK7fXPdbB5JMjCwy0l+yAflcZHHLRWYX3xBMmAW3FpNJs0exSiTxiWX9akIwLzK/2zCjcLyl9SYfgybKU0C51EDReRPLnrlBRByc0A+pJo+mfRq/MrmMXnRRdw6hGEsyB901VPOAf85GyLV9k/ASJlcj6+/tmi8W4g5SbchzRKOILmq+NUbrSfqTJuOFimSDu0TD8MKv2Ya3hXn/MXjk4MRzIGb6sG2rgJgfkgZkrPvKSa1Atacha1Hj1zfY/NSFE6J4VQoQaSOWxjGwW0wsHYmD3Iz0xTPfQb1pQuhRwi3elmwZUZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GeNV9+W4; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GeNV9+W4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkD2S0g3Wz2xYs
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 05:17:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5F3D0A44221;
	Wed,  6 Nov 2024 18:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E26BC4CEC6;
	Wed,  6 Nov 2024 18:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730917047;
	bh=cHbb0Rqd2g6rV06D4JQTthn3+eLxOEYaau9P/hGAoc4=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=GeNV9+W4bC+vtOV7z2krPcRWzdLA+u82GnCb8rE48zskJgdF7M1lGuQ7j49KksI35
	 ZB1nmos9/P9JBmYI2MSD/Tvy+fV6+YX5Vf6/2OpySmNN9xinOn21SgfS44gHoN+m3f
	 v9LQhzntD3i6uXGb0JKapdQ5YnXWIPdbXoawcM+JBK60OwhavYypP4uXdIOHUXQ9sE
	 I5H1dlw/x43th35dWlWyOXPi3tbgVgbgdXgeaHP0cBv1nJwhhTEdOaNXg/uh0/bDWK
	 XlVaaMq2k5yDKfDC3GbxDecSuyOW56tkcPntNcYaf67pA98MG2obkDTwwZNJAYnkYF
	 onfrwOmc8C9hw==
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Nov 2024 20:17:22 +0200
Message-Id: <D5FAVRTM32ZJ.1HFCHF3L9I68C@kernel.org>
Cc: "Peter Huewe" <peterhuewe@gmx.de>, "Jason Gunthorpe" <jgg@ziepe.ca>,
 "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas Piggin"
 <npiggin@gmail.com>, "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 <linux-kernel@vger.kernel.org>, <linux-integrity@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] tpm: atmel: Drop PPC64 specific MMIO setup
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Rob Herring" <robh@kernel.org>, "Jarkko Sakkinen"
 <jarkko.sakkinen@iki.fi>
X-Mailer: aerc 0.18.2
References: <20240702161052.3563599-1-robh@kernel.org>
 <D2RSWMPFF8KK.X5HZZMHANQMO@iki.fi> <D2RT0J8KXY1H.3MEV7KGQXTWHW@iki.fi>
 <CAL_JsqJDX+uOSoPh6pTNEP0vBLwcP3bKmAW1wCr_0cVr5fsPcg@mail.gmail.com>
 <D2SSH5HSDHQS.2YJSB22W3MHQK@iki.fi>
 <CAL_JsqLF+gs9e1TL1yi-xAZJRx4Kz7fOk=2wcF8kCqU3vyMWZA@mail.gmail.com>
In-Reply-To: <CAL_JsqLF+gs9e1TL1yi-xAZJRx4Kz7fOk=2wcF8kCqU3vyMWZA@mail.gmail.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed Nov 6, 2024 at 4:50 PM EET, Rob Herring wrote:
> On Thu, Jul 18, 2024 at 11:01=E2=80=AFAM Jarkko Sakkinen <jarkko.sakkinen=
@iki.fi> wrote:
> >
> > On Thu Jul 18, 2024 at 5:57 PM EEST, Rob Herring wrote:
> > > On Wed, Jul 17, 2024 at 6:14=E2=80=AFAM Jarkko Sakkinen <jarkko.sakki=
nen@iki.fi> wrote:
> > > >
> > > > On Wed Jul 17, 2024 at 3:08 PM EEST, Jarkko Sakkinen wrote:
> > > > > On Tue Jul 2, 2024 at 7:10 PM EEST, Rob Herring (Arm) wrote:
> > > > > > The PPC64 specific MMIO setup open codes DT address functions r=
ather
> > > > > > than using standard address parsing functions. The open-coded v=
ersion
> > > > > > fails to handle any address translation and is not endian safe.
> > > > > >
> > > > > > I haven't found any evidence of what platform used this. The on=
ly thing
> > > > > > that turned up was a PPC405 platform, but that is 32-bit and PP=
C405
> > > > > > support is being removed as well. CONFIG_TCG_ATMEL is not enabl=
ed for
> > > > > > any powerpc config and never was. The support was added in 2005=
 and
> > > > > > hasn't been touched since.
> > > > > >
> > > > > > Rather than try to modernize and fix this code, just remove it.
> > > > > >
> > > > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > > ---
> > > > > >  drivers/char/tpm/Kconfig     |   2 +-
> > > > > >  drivers/char/tpm/tpm_atmel.c |  64 +++++++++++++++-
> > > > > >  drivers/char/tpm/tpm_atmel.h | 140 ---------------------------=
--------
> > > > > >  3 files changed, 62 insertions(+), 144 deletions(-)
> > > > > >  delete mode 100644 drivers/char/tpm/tpm_atmel.h
> > > > > >
> > > > > > diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfi=
g
> > > > > > index e63a6a17793c..9b655e9fc7ab 100644
> > > > > > --- a/drivers/char/tpm/Kconfig
> > > > > > +++ b/drivers/char/tpm/Kconfig
> > > > > > @@ -162,7 +162,7 @@ config TCG_NSC
> > > > > >
> > > > > >  config TCG_ATMEL
> > > > > >     tristate "Atmel TPM Interface"
> > > > > > -   depends on PPC64 || HAS_IOPORT_MAP
> > > > > > +   depends on HAS_IOPORT_MAP
> > > > > >     depends on HAS_IOPORT
> > > > > >     help
> > > > > >       If you have a TPM security chip from Atmel say Yes and it
> > > > > > diff --git a/drivers/char/tpm/tpm_atmel.c b/drivers/char/tpm/tp=
m_atmel.c
> > > > > > index 9fb2defa9dc4..622c4abe8cb3 100644
> > > > > > --- a/drivers/char/tpm/tpm_atmel.c
> > > > > > +++ b/drivers/char/tpm/tpm_atmel.c
> > > > > > @@ -15,7 +15,67 @@
> > > > > >   */
> > > > > >
> > > > > >  #include "tpm.h"
> > > > > > -#include "tpm_atmel.h"
> > > > > > +
> > > > > > +struct tpm_atmel_priv {
> > > > > > +   int region_size;
> > > > > > +   int have_region;
> > > > > > +   unsigned long base;
> > > > > > +   void __iomem *iobase;
> > > > > > +};
> > > > > > +
> > > > > > +#define atmel_getb(chip, offset) inb(atmel_get_priv(chip)->bas=
e + offset)
> > > > > > +#define atmel_putb(val, chip, offset) \
> > > > > > +   outb(val, atmel_get_priv(chip)->base + offset)
> > > > > > +#define atmel_request_region request_region
> > > > > > +#define atmel_release_region release_region
> > > > > > +/* Atmel definitions */
> > > > > > +enum tpm_atmel_addr {
> > > > > > +   TPM_ATMEL_BASE_ADDR_LO =3D 0x08,
> > > > > > +   TPM_ATMEL_BASE_ADDR_HI =3D 0x09
> > > > > > +};
> > > > > > +
> > > > > > +static inline int tpm_read_index(int base, int index)
> > > > > > +{
> > > > > > +   outb(index, base);
> > > > > > +   return inb(base+1) & 0xFF;
> > > > > > +}
> > > > > > +
> > > > > > +/* Verify this is a 1.1 Atmel TPM */
> > > > > > +static int atmel_verify_tpm11(void)
> > > > > > +{
> > > > > > +
> > > > > > +   /* verify that it is an Atmel part */
> > > > > > +   if (tpm_read_index(TPM_ADDR, 4) !=3D 'A' ||
> > > > > > +       tpm_read_index(TPM_ADDR, 5) !=3D 'T' ||
> > > > > > +       tpm_read_index(TPM_ADDR, 6) !=3D 'M' ||
> > > > > > +       tpm_read_index(TPM_ADDR, 7) !=3D 'L')
> > > > > > +           return 1;
> > > > > > +
> > > > > > +   /* query chip for its version number */
> > > > > > +   if (tpm_read_index(TPM_ADDR, 0x00) !=3D 1 ||
> > > > > > +       tpm_read_index(TPM_ADDR, 0x01) !=3D 1)
> > > > > > +           return 1;
> > > > > > +
> > > > > > +   /* This is an atmel supported part */
> > > > > > +   return 0;
> > > > > > +}
> > > > > > +
> > > > > > +/* Determine where to talk to device */
> > > > > > +static void __iomem * atmel_get_base_addr(unsigned long *base,=
 int *region_size)
> > > > > > +{
> > > > > > +   int lo, hi;
> > > > > > +
> > > > > > +   if (atmel_verify_tpm11() !=3D 0)
> > > > > > +           return NULL;
> > > > > > +
> > > > > > +   lo =3D tpm_read_index(TPM_ADDR, TPM_ATMEL_BASE_ADDR_LO);
> > > > > > +   hi =3D tpm_read_index(TPM_ADDR, TPM_ATMEL_BASE_ADDR_HI);
> > > > > > +
> > > > > > +   *base =3D (hi << 8) | lo;
> > > > > > +   *region_size =3D 2;
> > > > > > +
> > > > > > +   return ioport_map(*base, *region_size);
> > > > > > +}
> > > > > >
> > > > > >  /* write status bits */
> > > > > >  enum tpm_atmel_write_status {
> > > > > > @@ -142,7 +202,6 @@ static void atml_plat_remove(void)
> > > > > >     tpm_chip_unregister(chip);
> > > > > >     if (priv->have_region)
> > > > > >             atmel_release_region(priv->base, priv->region_size)=
;
> > > > > > -   atmel_put_base_addr(priv->iobase);
> > > > > >     platform_device_unregister(pdev);
> > > > > >  }
> > > > > >
> > > > > > @@ -211,7 +270,6 @@ static int __init init_atmel(void)
> > > > > >  err_unreg_dev:
> > > > > >     platform_device_unregister(pdev);
> > > > > >  err_rel_reg:
> > > > > > -   atmel_put_base_addr(iobase);
> > > > > >     if (have_region)
> > > > > >             atmel_release_region(base,
> > > > > >                                  region_size);
> > > > > > diff --git a/drivers/char/tpm/tpm_atmel.h b/drivers/char/tpm/tp=
m_atmel.h
> > > > > > deleted file mode 100644
> > > > > > index 7ac3f69dcf0f..000000000000
> > > > > > --- a/drivers/char/tpm/tpm_atmel.h
> > > > > > +++ /dev/null
> > > > > > @@ -1,140 +0,0 @@
> > > > > > -/* SPDX-License-Identifier: GPL-2.0-only */
> > > > > > -/*
> > > > > > - * Copyright (C) 2005 IBM Corporation
> > > > > > - *
> > > > > > - * Authors:
> > > > > > - * Kylene Hall <kjhall@us.ibm.com>
> > > > > > - *
> > > > > > - * Maintained by: <tpmdd-devel@lists.sourceforge.net>
> > > > > > - *
> > > > > > - * Device driver for TCG/TCPA TPM (trusted platform module).
> > > > > > - * Specifications at www.trustedcomputinggroup.org
> > > > > > - *
> > > > > > - * These difference are required on power because the device m=
ust be
> > > > > > - * discovered through the device tree and iomap must be used t=
o get
> > > > > > - * around the need for holes in the io_page_mask.  This does n=
ot happen
> > > > > > - * automatically because the tpm is not a normal pci device an=
d lives
> > > > > > - * under the root node.
> > > > > > - */
> > > > > > -
> > > > > > -struct tpm_atmel_priv {
> > > > > > -   int region_size;
> > > > > > -   int have_region;
> > > > > > -   unsigned long base;
> > > > > > -   void __iomem *iobase;
> > > > > > -};
> > > > > > -
> > > > > > -#ifdef CONFIG_PPC64
> > > > > > -
> > > > > > -#include <linux/of.h>
> > > > > > -
> > > > > > -#define atmel_getb(priv, offset) readb(priv->iobase + offset)
> > > > > > -#define atmel_putb(val, priv, offset) writeb(val, priv->iobase=
 + offset)
> > > > > > -#define atmel_request_region request_mem_region
> > > > > > -#define atmel_release_region release_mem_region
> > > > > > -
> > > > > > -static inline void atmel_put_base_addr(void __iomem *iobase)
> > > > > > -{
> > > > > > -   iounmap(iobase);
> > > > > > -}
> > > > > > -
> > > > > > -static void __iomem * atmel_get_base_addr(unsigned long *base,=
 int *region_size)
> > > > > > -{
> > > > > > -   struct device_node *dn;
> > > > > > -   unsigned long address, size;
> > > > > > -   const unsigned int *reg;
> > > > > > -   int reglen;
> > > > > > -   int naddrc;
> > > > > > -   int nsizec;
> > > > > > -
> > > > > > -   dn =3D of_find_node_by_name(NULL, "tpm");
> > > > > > -
> > > > > > -   if (!dn)
> > > > > > -           return NULL;
> > > > > > -
> > > > > > -   if (!of_device_is_compatible(dn, "AT97SC3201")) {
> > > > > > -           of_node_put(dn);
> > > > > > -           return NULL;
> > > > > > -   }
> > > > > > -
> > > > > > -   reg =3D of_get_property(dn, "reg", &reglen);
> > > > > > -   naddrc =3D of_n_addr_cells(dn);
> > > > > > -   nsizec =3D of_n_size_cells(dn);
> > > > > > -
> > > > > > -   of_node_put(dn);
> > > > > > -
> > > > > > -
> > > > > > -   if (naddrc =3D=3D 2)
> > > > > > -           address =3D ((unsigned long) reg[0] << 32) | reg[1]=
;
> > > > > > -   else
> > > > > > -           address =3D reg[0];
> > > > > > -
> > > > > > -   if (nsizec =3D=3D 2)
> > > > > > -           size =3D
> > > > > > -               ((unsigned long) reg[naddrc] << 32) | reg[naddr=
c + 1];
> > > > > > -   else
> > > > > > -           size =3D reg[naddrc];
> > > > > > -
> > > > > > -   *base =3D address;
> > > > > > -   *region_size =3D size;
> > > > > > -   return ioremap(*base, *region_size);
> > > > > > -}
> > > > > > -#else
> > > > > > -#define atmel_getb(chip, offset) inb(atmel_get_priv(chip)->bas=
e + offset)
> > > > > > -#define atmel_putb(val, chip, offset) \
> > > > > > -   outb(val, atmel_get_priv(chip)->base + offset)
> > > > > > -#define atmel_request_region request_region
> > > > > > -#define atmel_release_region release_region
> > > > > > -/* Atmel definitions */
> > > > > > -enum tpm_atmel_addr {
> > > > > > -   TPM_ATMEL_BASE_ADDR_LO =3D 0x08,
> > > > > > -   TPM_ATMEL_BASE_ADDR_HI =3D 0x09
> > > > > > -};
> > > > > > -
> > > > > > -static inline int tpm_read_index(int base, int index)
> > > > > > -{
> > > > > > -   outb(index, base);
> > > > > > -   return inb(base+1) & 0xFF;
> > > > > > -}
> > > > > > -
> > > > > > -/* Verify this is a 1.1 Atmel TPM */
> > > > > > -static int atmel_verify_tpm11(void)
> > > > > > -{
> > > > > > -
> > > > > > -   /* verify that it is an Atmel part */
> > > > > > -   if (tpm_read_index(TPM_ADDR, 4) !=3D 'A' ||
> > > > > > -       tpm_read_index(TPM_ADDR, 5) !=3D 'T' ||
> > > > > > -       tpm_read_index(TPM_ADDR, 6) !=3D 'M' ||
> > > > > > -       tpm_read_index(TPM_ADDR, 7) !=3D 'L')
> > > > > > -           return 1;
> > > > > > -
> > > > > > -   /* query chip for its version number */
> > > > > > -   if (tpm_read_index(TPM_ADDR, 0x00) !=3D 1 ||
> > > > > > -       tpm_read_index(TPM_ADDR, 0x01) !=3D 1)
> > > > > > -           return 1;
> > > > > > -
> > > > > > -   /* This is an atmel supported part */
> > > > > > -   return 0;
> > > > > > -}
> > > > > > -
> > > > > > -static inline void atmel_put_base_addr(void __iomem *iobase)
> > > > > > -{
> > > > > > -}
> > > > > > -
> > > > > > -/* Determine where to talk to device */
> > > > > > -static void __iomem * atmel_get_base_addr(unsigned long *base,=
 int *region_size)
> > > > > > -{
> > > > > > -   int lo, hi;
> > > > > > -
> > > > > > -   if (atmel_verify_tpm11() !=3D 0)
> > > > > > -           return NULL;
> > > > > > -
> > > > > > -   lo =3D tpm_read_index(TPM_ADDR, TPM_ATMEL_BASE_ADDR_LO);
> > > > > > -   hi =3D tpm_read_index(TPM_ADDR, TPM_ATMEL_BASE_ADDR_HI);
> > > > > > -
> > > > > > -   *base =3D (hi << 8) | lo;
> > > > > > -   *region_size =3D 2;
> > > > > > -
> > > > > > -   return ioport_map(*base, *region_size);
> > > > > > -}
> > > > > > -#endif
> > > > >
> > > > > Responding from holidays but:
> > > > >
> > > > > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > > >
> > > > > [still away for couple of weeks]
> > > >
> > > > I got these in with checkpatch.pl --strict:
> > > >
> > > > CHECK: Macro argument 'offset' may be better as '(offset)' to avoid=
 precedence issues
> > > > #59: FILE: drivers/char/tpm/tpm_atmel.c:26:
> > > > +#define atmel_getb(chip, offset) inb(atmel_get_priv(chip)->base + =
offset)
> > > >
> > > > CHECK: Macro argument 'offset' may be better as '(offset)' to avoid=
 precedence issues
> > > > #60: FILE: drivers/char/tpm/tpm_atmel.c:27:
> > > > +#define atmel_putb(val, chip, offset) \
> > > > +       outb(val, atmel_get_priv(chip)->base + offset)
> > > >
> > > > CHECK: spaces preferred around that '+' (ctx:VxV)
> > > > #73: FILE: drivers/char/tpm/tpm_atmel.c:40:
> > > > +       return inb(base+1) & 0xFF;
> > > >                       ^
> > > >
> > > > CHECK: Blank lines aren't necessary after an open brace '{'
> > > > #79: FILE: drivers/char/tpm/tpm_atmel.c:46:
> > > > +{
> > > > +
> > > >
> > > > Can you address them and I'll tag the next version, once I've
> > > > revisited checkpatch. Otherwise, nothing against the code change.
> > >
> > > Those all existed before because I just moved what was left of the
> > > header contents into the .c file. Fixing them seems like a separate
> > > change to me. I can just leave the header in place and avoid the
> > > warnings if you prefer. Otherwise, those warnings are the least of th=
e
> > > clean-up this driver needs. For starters, I would make those defines
> > > static inlines instead.
> >
> > Ah, ok sorry. It was fairly mechanical check as I'm just quickly
> > going critical stuff from holidays.
> >
> > I'm back after next week, so I'd really like to hold with this
> > up until that and prepare when I'm back a patch set, which includes
> > a supplemental patch fixing those issues (if you don't mind).
>
> Whatever happened to this? Can you please apply my patch if you don't
> have the time for further rework.

Sorry unintentional.

I applied with

-static void __iomem * atmel_get_base_addr(unsigned long *base, int *region=
_size)
+static void __iomem *atmel_get_base_addr(unsigned long *base, int *region_=
size)
=20
as this gives checkpatch error.

> Rob

BR, Jarkko

