Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 248F993505E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 18:02:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=mSSdceQH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPyHT0nNKz3fmv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2024 02:02:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=mSSdceQH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iki.fi (client-ip=2a0b:5c81:1c1::37; helo=lahtoruutu.iki.fi; envelope-from=jarkko.sakkinen@iki.fi; receiver=lists.ozlabs.org)
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPyGk4Z8Qz3fSZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2024 02:01:31 +1000 (AEST)
Received: from localhost (83-245-197-232.elisa-laajakaista.fi [83.245.197.232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sakkinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4WPyGT2S5kz49PyD;
	Thu, 18 Jul 2024 19:01:20 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1721318483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hyXyHacbc/aeBh/H3G1MhcsPK85ghddqdCoYuHuarsk=;
	b=mSSdceQHrLcjnyumARgTiOjYhqX+2x46xON6gZwnK6QPTyehDCQUOqELfk0ri3XLunEyC+
	kjRByZf/iXUAWvmrPMPifvtzNF7b5nV5+zZnQQXWU5j6ZhGVYKnAFdGPV+pK9ijw6DpMcj
	ZTSY/K2aOZOn5t99HFjESAKmDR9c8R7fR3Xoqd2ZSMkySgbpR129IXBICYUb1k5dWTQQ5/
	bpwIHHbB3ZZfYc8lvxcrqmHHu56vagSo1I1wPtC0QfyKNM9a+C3bHUVX6VpsdnLozFNQ68
	2W/xUBLn2LUdwG3odkcPVpGKPEB1Q3cGacI1oeErrWmk6rccN2bMEl2bQjOUSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1721318483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hyXyHacbc/aeBh/H3G1MhcsPK85ghddqdCoYuHuarsk=;
	b=BWjc5FApCI6wAU90sH/6NakKlIBnjAED95m0vHhPqztJuzllwOGguoQ+zLL7KKbmrVwW0Y
	6zKMv9sIRnSjoXkr9ePRSM+f1/gv+Ltv9pfcnxKSzJACSnnzuXPLCRF6ty13csZ2WayNzm
	FsVftZGazKO751NNpP8rKnt6kKLmUXzxeQPFik5/xeVXm8dCwydMS2QaaJb2HuQ+vgPd0f
	Qobwo9rYetOxdNW2F5GOGf4mR0nGONXOP5i/CpWMwyfq6S1WAMF89STCzmgvVH/8cX86lO
	NK8Hx4+V54zZNbjqSLWqQxQz+I1fUNL5vCs2X6nO7kU44SwdRia2IcPidAQJ3A==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1721318483; a=rsa-sha256;
	cv=none;
	b=UPvwrajZ+j3dU8JLTrIO7ueEBDmhs0HXX5cMsLXajdfxOpXfbYaKX8HT5I3aSPuGZ5p8kd
	mHOzaqKgJlMZ1+/nYJwrIdmkNE7cKmbAIqBW8rIgmLqgc875kh6ZJEglf0E3VtXyup4T1N
	hz7upVu5d3NAjUjIad+MPBWUeCTkhKCJSQ3vlPguSQ9VaPCX4pGx4Kq1060Wut5Bm4wPyH
	DCCsBhaxwXwEvOuQOjzNN620EX94zoD5NTju/7TR8ZqrnXalxFM2jNCWRIronu4SfmmlFx
	KGN9mcOVemNFeph9Sev8N4sOSHefi5NOEEhr0ZePhzxuN2xdzEwOCJBbrzdzGg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Jul 2024 19:01:20 +0300
Message-Id: <D2SSH5HSDHQS.2YJSB22W3MHQK@iki.fi>
From: "Jarkko Sakkinen" <jarkko.sakkinen@iki.fi>
To: "Rob Herring" <robh@kernel.org>
Subject: Re: [PATCH] tpm: atmel: Drop PPC64 specific MMIO setup
X-Mailer: aerc 0.17.0
References: <20240702161052.3563599-1-robh@kernel.org>
 <D2RSWMPFF8KK.X5HZZMHANQMO@iki.fi> <D2RT0J8KXY1H.3MEV7KGQXTWHW@iki.fi>
 <CAL_JsqJDX+uOSoPh6pTNEP0vBLwcP3bKmAW1wCr_0cVr5fsPcg@mail.gmail.com>
In-Reply-To: <CAL_JsqJDX+uOSoPh6pTNEP0vBLwcP3bKmAW1wCr_0cVr5fsPcg@mail.gmail.com>
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
Cc: linux-kernel@vger.kernel.org, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Jason Gunthorpe <jgg@ziepe.ca>, Jarkko Sakkinen <jarkko@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Peter Huewe <peterhuewe@gmx.de>, linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Jul 18, 2024 at 5:57 PM EEST, Rob Herring wrote:
> On Wed, Jul 17, 2024 at 6:14=E2=80=AFAM Jarkko Sakkinen <jarkko.sakkinen@=
iki.fi> wrote:
> >
> > On Wed Jul 17, 2024 at 3:08 PM EEST, Jarkko Sakkinen wrote:
> > > On Tue Jul 2, 2024 at 7:10 PM EEST, Rob Herring (Arm) wrote:
> > > > The PPC64 specific MMIO setup open codes DT address functions rathe=
r
> > > > than using standard address parsing functions. The open-coded versi=
on
> > > > fails to handle any address translation and is not endian safe.
> > > >
> > > > I haven't found any evidence of what platform used this. The only t=
hing
> > > > that turned up was a PPC405 platform, but that is 32-bit and PPC405
> > > > support is being removed as well. CONFIG_TCG_ATMEL is not enabled f=
or
> > > > any powerpc config and never was. The support was added in 2005 and
> > > > hasn't been touched since.
> > > >
> > > > Rather than try to modernize and fix this code, just remove it.
> > > >
> > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > > ---
> > > >  drivers/char/tpm/Kconfig     |   2 +-
> > > >  drivers/char/tpm/tpm_atmel.c |  64 +++++++++++++++-
> > > >  drivers/char/tpm/tpm_atmel.h | 140 -------------------------------=
----
> > > >  3 files changed, 62 insertions(+), 144 deletions(-)
> > > >  delete mode 100644 drivers/char/tpm/tpm_atmel.h
> > > >
> > > > diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
> > > > index e63a6a17793c..9b655e9fc7ab 100644
> > > > --- a/drivers/char/tpm/Kconfig
> > > > +++ b/drivers/char/tpm/Kconfig
> > > > @@ -162,7 +162,7 @@ config TCG_NSC
> > > >
> > > >  config TCG_ATMEL
> > > >     tristate "Atmel TPM Interface"
> > > > -   depends on PPC64 || HAS_IOPORT_MAP
> > > > +   depends on HAS_IOPORT_MAP
> > > >     depends on HAS_IOPORT
> > > >     help
> > > >       If you have a TPM security chip from Atmel say Yes and it
> > > > diff --git a/drivers/char/tpm/tpm_atmel.c b/drivers/char/tpm/tpm_at=
mel.c
> > > > index 9fb2defa9dc4..622c4abe8cb3 100644
> > > > --- a/drivers/char/tpm/tpm_atmel.c
> > > > +++ b/drivers/char/tpm/tpm_atmel.c
> > > > @@ -15,7 +15,67 @@
> > > >   */
> > > >
> > > >  #include "tpm.h"
> > > > -#include "tpm_atmel.h"
> > > > +
> > > > +struct tpm_atmel_priv {
> > > > +   int region_size;
> > > > +   int have_region;
> > > > +   unsigned long base;
> > > > +   void __iomem *iobase;
> > > > +};
> > > > +
> > > > +#define atmel_getb(chip, offset) inb(atmel_get_priv(chip)->base + =
offset)
> > > > +#define atmel_putb(val, chip, offset) \
> > > > +   outb(val, atmel_get_priv(chip)->base + offset)
> > > > +#define atmel_request_region request_region
> > > > +#define atmel_release_region release_region
> > > > +/* Atmel definitions */
> > > > +enum tpm_atmel_addr {
> > > > +   TPM_ATMEL_BASE_ADDR_LO =3D 0x08,
> > > > +   TPM_ATMEL_BASE_ADDR_HI =3D 0x09
> > > > +};
> > > > +
> > > > +static inline int tpm_read_index(int base, int index)
> > > > +{
> > > > +   outb(index, base);
> > > > +   return inb(base+1) & 0xFF;
> > > > +}
> > > > +
> > > > +/* Verify this is a 1.1 Atmel TPM */
> > > > +static int atmel_verify_tpm11(void)
> > > > +{
> > > > +
> > > > +   /* verify that it is an Atmel part */
> > > > +   if (tpm_read_index(TPM_ADDR, 4) !=3D 'A' ||
> > > > +       tpm_read_index(TPM_ADDR, 5) !=3D 'T' ||
> > > > +       tpm_read_index(TPM_ADDR, 6) !=3D 'M' ||
> > > > +       tpm_read_index(TPM_ADDR, 7) !=3D 'L')
> > > > +           return 1;
> > > > +
> > > > +   /* query chip for its version number */
> > > > +   if (tpm_read_index(TPM_ADDR, 0x00) !=3D 1 ||
> > > > +       tpm_read_index(TPM_ADDR, 0x01) !=3D 1)
> > > > +           return 1;
> > > > +
> > > > +   /* This is an atmel supported part */
> > > > +   return 0;
> > > > +}
> > > > +
> > > > +/* Determine where to talk to device */
> > > > +static void __iomem * atmel_get_base_addr(unsigned long *base, int=
 *region_size)
> > > > +{
> > > > +   int lo, hi;
> > > > +
> > > > +   if (atmel_verify_tpm11() !=3D 0)
> > > > +           return NULL;
> > > > +
> > > > +   lo =3D tpm_read_index(TPM_ADDR, TPM_ATMEL_BASE_ADDR_LO);
> > > > +   hi =3D tpm_read_index(TPM_ADDR, TPM_ATMEL_BASE_ADDR_HI);
> > > > +
> > > > +   *base =3D (hi << 8) | lo;
> > > > +   *region_size =3D 2;
> > > > +
> > > > +   return ioport_map(*base, *region_size);
> > > > +}
> > > >
> > > >  /* write status bits */
> > > >  enum tpm_atmel_write_status {
> > > > @@ -142,7 +202,6 @@ static void atml_plat_remove(void)
> > > >     tpm_chip_unregister(chip);
> > > >     if (priv->have_region)
> > > >             atmel_release_region(priv->base, priv->region_size);
> > > > -   atmel_put_base_addr(priv->iobase);
> > > >     platform_device_unregister(pdev);
> > > >  }
> > > >
> > > > @@ -211,7 +270,6 @@ static int __init init_atmel(void)
> > > >  err_unreg_dev:
> > > >     platform_device_unregister(pdev);
> > > >  err_rel_reg:
> > > > -   atmel_put_base_addr(iobase);
> > > >     if (have_region)
> > > >             atmel_release_region(base,
> > > >                                  region_size);
> > > > diff --git a/drivers/char/tpm/tpm_atmel.h b/drivers/char/tpm/tpm_at=
mel.h
> > > > deleted file mode 100644
> > > > index 7ac3f69dcf0f..000000000000
> > > > --- a/drivers/char/tpm/tpm_atmel.h
> > > > +++ /dev/null
> > > > @@ -1,140 +0,0 @@
> > > > -/* SPDX-License-Identifier: GPL-2.0-only */
> > > > -/*
> > > > - * Copyright (C) 2005 IBM Corporation
> > > > - *
> > > > - * Authors:
> > > > - * Kylene Hall <kjhall@us.ibm.com>
> > > > - *
> > > > - * Maintained by: <tpmdd-devel@lists.sourceforge.net>
> > > > - *
> > > > - * Device driver for TCG/TCPA TPM (trusted platform module).
> > > > - * Specifications at www.trustedcomputinggroup.org
> > > > - *
> > > > - * These difference are required on power because the device must =
be
> > > > - * discovered through the device tree and iomap must be used to ge=
t
> > > > - * around the need for holes in the io_page_mask.  This does not h=
appen
> > > > - * automatically because the tpm is not a normal pci device and li=
ves
> > > > - * under the root node.
> > > > - */
> > > > -
> > > > -struct tpm_atmel_priv {
> > > > -   int region_size;
> > > > -   int have_region;
> > > > -   unsigned long base;
> > > > -   void __iomem *iobase;
> > > > -};
> > > > -
> > > > -#ifdef CONFIG_PPC64
> > > > -
> > > > -#include <linux/of.h>
> > > > -
> > > > -#define atmel_getb(priv, offset) readb(priv->iobase + offset)
> > > > -#define atmel_putb(val, priv, offset) writeb(val, priv->iobase + o=
ffset)
> > > > -#define atmel_request_region request_mem_region
> > > > -#define atmel_release_region release_mem_region
> > > > -
> > > > -static inline void atmel_put_base_addr(void __iomem *iobase)
> > > > -{
> > > > -   iounmap(iobase);
> > > > -}
> > > > -
> > > > -static void __iomem * atmel_get_base_addr(unsigned long *base, int=
 *region_size)
> > > > -{
> > > > -   struct device_node *dn;
> > > > -   unsigned long address, size;
> > > > -   const unsigned int *reg;
> > > > -   int reglen;
> > > > -   int naddrc;
> > > > -   int nsizec;
> > > > -
> > > > -   dn =3D of_find_node_by_name(NULL, "tpm");
> > > > -
> > > > -   if (!dn)
> > > > -           return NULL;
> > > > -
> > > > -   if (!of_device_is_compatible(dn, "AT97SC3201")) {
> > > > -           of_node_put(dn);
> > > > -           return NULL;
> > > > -   }
> > > > -
> > > > -   reg =3D of_get_property(dn, "reg", &reglen);
> > > > -   naddrc =3D of_n_addr_cells(dn);
> > > > -   nsizec =3D of_n_size_cells(dn);
> > > > -
> > > > -   of_node_put(dn);
> > > > -
> > > > -
> > > > -   if (naddrc =3D=3D 2)
> > > > -           address =3D ((unsigned long) reg[0] << 32) | reg[1];
> > > > -   else
> > > > -           address =3D reg[0];
> > > > -
> > > > -   if (nsizec =3D=3D 2)
> > > > -           size =3D
> > > > -               ((unsigned long) reg[naddrc] << 32) | reg[naddrc + =
1];
> > > > -   else
> > > > -           size =3D reg[naddrc];
> > > > -
> > > > -   *base =3D address;
> > > > -   *region_size =3D size;
> > > > -   return ioremap(*base, *region_size);
> > > > -}
> > > > -#else
> > > > -#define atmel_getb(chip, offset) inb(atmel_get_priv(chip)->base + =
offset)
> > > > -#define atmel_putb(val, chip, offset) \
> > > > -   outb(val, atmel_get_priv(chip)->base + offset)
> > > > -#define atmel_request_region request_region
> > > > -#define atmel_release_region release_region
> > > > -/* Atmel definitions */
> > > > -enum tpm_atmel_addr {
> > > > -   TPM_ATMEL_BASE_ADDR_LO =3D 0x08,
> > > > -   TPM_ATMEL_BASE_ADDR_HI =3D 0x09
> > > > -};
> > > > -
> > > > -static inline int tpm_read_index(int base, int index)
> > > > -{
> > > > -   outb(index, base);
> > > > -   return inb(base+1) & 0xFF;
> > > > -}
> > > > -
> > > > -/* Verify this is a 1.1 Atmel TPM */
> > > > -static int atmel_verify_tpm11(void)
> > > > -{
> > > > -
> > > > -   /* verify that it is an Atmel part */
> > > > -   if (tpm_read_index(TPM_ADDR, 4) !=3D 'A' ||
> > > > -       tpm_read_index(TPM_ADDR, 5) !=3D 'T' ||
> > > > -       tpm_read_index(TPM_ADDR, 6) !=3D 'M' ||
> > > > -       tpm_read_index(TPM_ADDR, 7) !=3D 'L')
> > > > -           return 1;
> > > > -
> > > > -   /* query chip for its version number */
> > > > -   if (tpm_read_index(TPM_ADDR, 0x00) !=3D 1 ||
> > > > -       tpm_read_index(TPM_ADDR, 0x01) !=3D 1)
> > > > -           return 1;
> > > > -
> > > > -   /* This is an atmel supported part */
> > > > -   return 0;
> > > > -}
> > > > -
> > > > -static inline void atmel_put_base_addr(void __iomem *iobase)
> > > > -{
> > > > -}
> > > > -
> > > > -/* Determine where to talk to device */
> > > > -static void __iomem * atmel_get_base_addr(unsigned long *base, int=
 *region_size)
> > > > -{
> > > > -   int lo, hi;
> > > > -
> > > > -   if (atmel_verify_tpm11() !=3D 0)
> > > > -           return NULL;
> > > > -
> > > > -   lo =3D tpm_read_index(TPM_ADDR, TPM_ATMEL_BASE_ADDR_LO);
> > > > -   hi =3D tpm_read_index(TPM_ADDR, TPM_ATMEL_BASE_ADDR_HI);
> > > > -
> > > > -   *base =3D (hi << 8) | lo;
> > > > -   *region_size =3D 2;
> > > > -
> > > > -   return ioport_map(*base, *region_size);
> > > > -}
> > > > -#endif
> > >
> > > Responding from holidays but:
> > >
> > > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> > >
> > > [still away for couple of weeks]
> >
> > I got these in with checkpatch.pl --strict:
> >
> > CHECK: Macro argument 'offset' may be better as '(offset)' to avoid pre=
cedence issues
> > #59: FILE: drivers/char/tpm/tpm_atmel.c:26:
> > +#define atmel_getb(chip, offset) inb(atmel_get_priv(chip)->base + offs=
et)
> >
> > CHECK: Macro argument 'offset' may be better as '(offset)' to avoid pre=
cedence issues
> > #60: FILE: drivers/char/tpm/tpm_atmel.c:27:
> > +#define atmel_putb(val, chip, offset) \
> > +       outb(val, atmel_get_priv(chip)->base + offset)
> >
> > CHECK: spaces preferred around that '+' (ctx:VxV)
> > #73: FILE: drivers/char/tpm/tpm_atmel.c:40:
> > +       return inb(base+1) & 0xFF;
> >                       ^
> >
> > CHECK: Blank lines aren't necessary after an open brace '{'
> > #79: FILE: drivers/char/tpm/tpm_atmel.c:46:
> > +{
> > +
> >
> > Can you address them and I'll tag the next version, once I've
> > revisited checkpatch. Otherwise, nothing against the code change.
>
> Those all existed before because I just moved what was left of the
> header contents into the .c file. Fixing them seems like a separate
> change to me. I can just leave the header in place and avoid the
> warnings if you prefer. Otherwise, those warnings are the least of the
> clean-up this driver needs. For starters, I would make those defines
> static inlines instead.

Ah, ok sorry. It was fairly mechanical check as I'm just quickly
going critical stuff from holidays.

I'm back after next week, so I'd really like to hold with this
up until that and prepare when I'm back a patch set, which includes
a supplemental patch fixing those issues (if you don't mind).

BR, Jarkko
