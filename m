Return-Path: <linuxppc-dev+bounces-13552-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECA2C1FF5A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 13:16:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cy34T00Tpz30V1;
	Thu, 30 Oct 2025 23:16:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761826584;
	cv=none; b=S8GZ1ZtAyPUe0htDw0lypu5q1oTKAPmZ2HO8TSjYHaOAxNzD6DGG+r5ZDleYDNa+GZ02rRQV7CGz22jyxNHwZvqQft+aPLD9kGb1ltDP5p2lxnpAlwPhw5tB+SxdTjtEsfweT0FBPtgdHu+oGMX8HQUj+aQQHQjI2ICSXwsUqPENjT5mX8ZpnsyzuW+us+lpEr24CXblvqr+3CzZpTjWO314UlhqcwxDh4YIO2DaSjH427SXcRyehnS4rCCNx5jaxfuEMUTrHGtBkt235Dkjd6m7uM5DQyu1+AmANSMpWjXcH+iOxodAWRrbJSwAIDRQIi+pjU6NafmfY3fqLJrEsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761826584; c=relaxed/relaxed;
	bh=s2h4BnseYLvI915SuwI6txSi2xO1Lp6zcqUfBWQt5q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxxZwM2FMkdPcROCwQhzBp1i1isWaOz2O96eVA+47AfGdCexhbBCFSBPIuCfrXD48HRDUH8JwEirv18/tmBSNJarXKsQpPk0mHyev8zFFFEZaVxP8Jfs5RpsJSYroYcMylrw5H2o/U+w6FGlgkeXNaudjfaUYkpWeFoyS7XbtPhHUXenzP3Zo8h6rTSb0B3MruLLZdlyG7JH7WhI2mH9llyuRpBdtZ+37tecCZv35+wN4Hy9hK15We20qt7dRhUM/OpPErQPWKgQhxzhSOJvEOyVZvuKeotChrL+wtiOLdlGhBmNBRNj25kLmkM/1pqUY2BUNqi3Msak7AnQYao4hA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Mul4VL3y; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Mul4VL3y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cy34Q5xZJz2xsq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 23:16:22 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-427091cd4fdso569585f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 05:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761826577; x=1762431377; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s2h4BnseYLvI915SuwI6txSi2xO1Lp6zcqUfBWQt5q8=;
        b=Mul4VL3yZLJzZbpC2ooQG1vL2I9GoTWJli/QMU/D/TWgfVA33GaT8O7Twi8YZwO7Wm
         F4QShcHisRim42yfioLgm8EWEaR81PE5vKGf4dCTV8WxMJ+w4nRsWnaA9akWE0XLwsSl
         79JElHDpYFolD4S64YpJxhIwXF5+bQt2WmXw96yFqA1pCJgPUy2jVsnHxZ1gq5/Gusol
         0HvH8T2RswkVNKuS/CyBjvy13YxuZ4j9GKvIuLEJSOQWWE54mazFlCe98HcKi7u6c44U
         IEJviGOYFAhokgDWE6pU4b1u6yHoCpMU40b4UMIuCxSx8bS79GSc/dKBpHQ2vhhFa84Z
         0wrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761826577; x=1762431377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2h4BnseYLvI915SuwI6txSi2xO1Lp6zcqUfBWQt5q8=;
        b=a6ZWWHomqnWOE9mLmBsQfQNR1Bd13uyDG7/Ax3uRuJ6tA58LgzB+meb5ElgHxew9ZD
         /BLijcMYBdsGvC9vw14HdpPx22vuKbni1mgc+UXt7Whh5b2psLd7iD6f96HrX8jCms3U
         5c+3g0AHWqDvaTQFY6zOjKe5cQcAAHNbFQqfsWojLrkXJqKZuBBGkM+kyKzZ2qcZU2ga
         /DpULyk5adIAU1dskLfjX7xebvQbbjDp2m8Ejz750LeoN47hj0YadhasAyYlJeXJ15aM
         00cSEXsV3Qbm9EH3axFKdkhzCFZM0xeriESY4twSHNMm2tmHG4za1A8XaaZsZPnzxD3k
         s11A==
X-Forwarded-Encrypted: i=1; AJvYcCV9KpIqAvt3AL3uTPPtH5U7NBomjqps0w8ctAv6zXUzObaAS2nqNj8ZXr+5/fQc+fGoRhSz1Vyxd6dXxDQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwwIxdyw3E0+jMfH/whdfPawMz0izYAhcYb78jwU90ujGIV6uc9
	gEbePEUt3dgXbDGOEEoHTeMlhN/RcpQKovn9ycDEUoLdcf16i/tDlb0/
X-Gm-Gg: ASbGncunJU+O6GO5iNQ4a705bRz5Xzlv0rnPL/GE3I57b2UfCxnX3bVCY1qZUU+CXOD
	o6LJhd6vcmdnHUHITDhKHzYpXrtQqUpKuSiFEIIDGy7GguCRmZ9zULrkYY1IPNx6PonHYg7aYtc
	Fce7Js2lwWqmIwEpwIZ99qzyBpTUV6MHryYyaN/uP5oo569rydH4fcmN26EH0Gq0XegjszzAnEK
	aTROiMwzWnS7A8Tvc/Xv1xk/nqU6jHaKw74O45r0R2uiC+oUEyAIJhSudAlFBBdpUE1EDuiE7mI
	09nqFRae775PXBnP4iPRjRXd7b+gtkkpjEAdit17NZd6ZdU/TmPo29lCOq5J3c2E9Md2iUGuRUn
	XvhenYhKzcgwKmo73cmVIe+M01TTuagbjH1R2LY4ndpNBcGUccJ1a9niyx5rLUyOKKRxGfmZH01
	TA457/8a1sofEoYU1V676qRP7FBnbJYr84eQrmOyflZ4Cn08t8P77ubcyqrEdhl0AoWdpwJ1xwR
	ql1qCdotAW8
X-Google-Smtp-Source: AGHT+IFFiHEvNPjKUlWf15eT6QrZW2LM5hHmfdRjCPGtpfvtcJfaix0mKpAwNuPfyTcNYpcwrmxIZg==
X-Received: by 2002:a05:6000:2508:b0:3fb:aca3:d5d9 with SMTP id ffacd0b85a97d-429aef76469mr4752945f8f.1.1761826576503;
        Thu, 30 Oct 2025 05:16:16 -0700 (PDT)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db839sm33617710f8f.34.2025.10.30.05.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 05:16:14 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:16:12 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] MIPS: PCI: Use contextual data instead of global
 variable
Message-ID: <t3la3jte5tia7rh5ftuv5cchrwdxe4cxa2v3g6lxgoh5u6rmcy@hzw7lbke2vac>
References: <20251029163336.2785270-3-thierry.reding@gmail.com>
 <20251029174654.GA1571737@bhelgaas>
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
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="stoiegldli5skly3"
Content-Disposition: inline
In-Reply-To: <20251029174654.GA1571737@bhelgaas>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--stoiegldli5skly3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/7] MIPS: PCI: Use contextual data instead of global
 variable
MIME-Version: 1.0

On Wed, Oct 29, 2025 at 12:46:54PM -0500, Bjorn Helgaas wrote:
> On Wed, Oct 29, 2025 at 05:33:31PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Pass the driver-specific data via the syscore struct and use it in the
> > syscore ops.
>=20
> Would be nice to include the "instead of global variable" part here so
> the commit log includes the benefit and can stand alone even without
> the subject.

Good point.

> Awesome to get rid of another global variable!  More comments below.

\o/

> > +++ b/arch/mips/pci/pci-alchemy.c
> > @@ -33,6 +33,7 @@
> > =20
> >  struct alchemy_pci_context {
> >  	struct pci_controller alchemy_pci_ctrl; /* leave as first member! */
> > +	struct syscore syscore;
> >  	void __iomem *regs;			/* ctrl base */
> >  	/* tools for wired entry for config space access */
> >  	unsigned long last_elo0;
> > @@ -46,12 +47,6 @@ struct alchemy_pci_context {
> >  	int (*board_pci_idsel)(unsigned int devsel, int assert);
> >  };
> > =20
> > -/* for syscore_ops. There's only one PCI controller on Alchemy chips, =
so this
> > - * should suffice for now.
> > - */
> > -static struct alchemy_pci_context *__alchemy_pci_ctx;
> > -
> > -
> >  /* IO/MEM resources for PCI. Keep the memres in sync with fixup_bigphy=
s_addr
> >   * in arch/mips/alchemy/common/setup.c
> >   */
> > @@ -306,9 +301,7 @@ static int alchemy_pci_def_idsel(unsigned int devse=
l, int assert)
> >  /* save PCI controller register contents. */
> >  static int alchemy_pci_suspend(void *data)
> >  {
> > -	struct alchemy_pci_context *ctx =3D __alchemy_pci_ctx;
> > -	if (!ctx)
> > -		return 0;
> > +	struct alchemy_pci_context *ctx =3D data;
> > =20
> >  	ctx->pm[0]  =3D __raw_readl(ctx->regs + PCI_REG_CMEM);
> >  	ctx->pm[1]  =3D __raw_readl(ctx->regs + PCI_REG_CONFIG) & 0x0009ffff;
> > @@ -328,9 +321,7 @@ static int alchemy_pci_suspend(void *data)
> > =20
> >  static void alchemy_pci_resume(void *data)
> >  {
> > -	struct alchemy_pci_context *ctx =3D __alchemy_pci_ctx;
> > -	if (!ctx)
> > -		return;
> > +	struct alchemy_pci_context *ctx =3D data;
> > =20
> >  	__raw_writel(ctx->pm[0],  ctx->regs + PCI_REG_CMEM);
> >  	__raw_writel(ctx->pm[2],  ctx->regs + PCI_REG_B2BMASK_CCH);
> > @@ -359,10 +350,6 @@ static const struct syscore_ops alchemy_pci_syscor=
e_ops =3D {
> >  	.resume =3D alchemy_pci_resume,
> >  };
> > =20
> > -static struct syscore alchemy_pci_syscore =3D {
> > -	.ops =3D &alchemy_pci_syscore_ops,
> > -};
> > -
> >  static int alchemy_pci_probe(struct platform_device *pdev)
> >  {
> >  	struct alchemy_pci_platdata *pd =3D pdev->dev.platform_data;
> > @@ -480,9 +467,10 @@ static int alchemy_pci_probe(struct platform_devic=
e *pdev)
> >  	__raw_writel(val, ctx->regs + PCI_REG_CONFIG);
> >  	wmb();
> > =20
> > -	__alchemy_pci_ctx =3D ctx;
> >  	platform_set_drvdata(pdev, ctx);
> > -	register_syscore(&alchemy_pci_syscore);
> > +	ctx->syscore.ops =3D &alchemy_pci_syscore_ops;
> > +	ctx->syscore.data =3D ctx;
> > +	register_syscore(&ctx->syscore);
>=20
> As far as I can tell, the only use of syscore in this driver is for
> suspend/resume.
>=20
> This is a regular platform_device driver, so instead of syscore, I
> think it should use generic power management like other PCI host
> controller drivers do, something like this:
>=20
>   static int alchemy_pci_suspend_noirq(struct device *dev)
>   ...
>=20
>   static int alchemy_pci_resume_noirq(struct device *dev)
>   ...
>=20
>   static DEFINE_NOIRQ_DEV_PM_OPS(alchemy_pci_pm_ops,
>                                  alchemy_pci_suspend_noirq,
>                                  alchemy_pci_resume_noirq);
>=20
>   static struct platform_driver alchemy_pcictl_driver =3D {
>           .probe          =3D alchemy_pci_probe,
>           .driver =3D {
>                   .name   =3D "alchemy-pci",
>                   .pm     =3D pm_sleep_ptr(&alchemy_pci_pm_ops),
>           },
>   };
>=20
> Here's a sample in another driver:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/pci/controller/cadence/pci-j721e.c?id=3Dv6.17#n663

I thought so too, but then I looked at the history and saw that it was
initially regular PM ops and then fixed by using syscore in this commit:

    commit 864c6c22e9a5742b0f43c983b6c405d52817bacd
    Author: Manuel Lauss <manuel.lauss@googlemail.com>
    Date:   Wed Nov 16 15:42:28 2011 +0100
   =20
        MIPS: Alchemy: Fix PCI PM
   =20
        Move PCI Controller PM to syscore_ops since the platform_driver PM =
methods
        are called way too late on resume and far too early on suspend (aft=
er and
        before PCI device resume/suspend).
        This also allows to simplify wired entry management a bit.
   =20
        Signed-off-by: Manuel Lauss <manuel.lauss@googlemail.com>
        Cc: linux-mips@linux-mips.org
        Patchwork: https://patchwork.linux-mips.org/patch/3007/
        Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

So unfortunately I don't think it'll work for this driver.

Thierry

--stoiegldli5skly3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkDVwcACgkQ3SOs138+
s6FWDw//asJQ0od9HClRIj0RNLWAbliTk9QI3rUVvZd0krnee9oWFJS6p9gosZi7
Baqb5WJ5xo7atxuHYK6RlAFAina/LUDWNpY9w1up0hM1K/NqVj0D6Ufrx2O4zw2Q
5Ff2rbnpTBndYi8w6kth5MU4p/g3VtsilfSmErNPBQQF2CUQA3qmp3XVvAvbaH8+
aUGS2rLpxX0Q06XGtXMtnvf4LHF4uzbZkX+AC6XqcBFT9BSgSjAKr65vMcYnqRqL
sRxPbqQ9e6iZ2SibX+o61epk7rmO72XUa1v9TpZ24JNuvUIJnLfwm8D96f8NJEzK
EznsDwGuOT/G87UYPvgqTZDbT8hbSvDEjGnlF8a6xtPP14Zm9hlMc0b9ZJ+wgMV4
aMq7WckO8j/yY3NLAIokI/pMm5D11aYCSmk4PS7K4KdubNSeD+18J0QOZ/4cJyIQ
cWI/P6sqD62A0QPMbbbtBa3MP9RbCZ0zhfFwI9dTprNJ7I7bijD/OLo798mkNB2f
71+yECk1VnOKeAj9v80k479HlfUHaGCpRiEzWaKJ3IvLNqgUKH0q8nP8/McNXEKL
8rRCO+5Ona/ND0lf2fue+/QeT44Fi24invQSdsgGdeaxEmcDkW06HSOK3Cp4pZWB
E86uRaPgXuSRgDbxv2MMtv+PNWNWlqYzJ5/Lz0AkTm920p5RAvk=
=Pbyc
-----END PGP SIGNATURE-----

--stoiegldli5skly3--

