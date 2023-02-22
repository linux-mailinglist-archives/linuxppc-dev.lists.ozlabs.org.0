Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F2C69F973
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 18:00:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMMq840qcz3cKm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 04:00:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V+uFDfDI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=conor@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V+uFDfDI;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMMpB0yMsz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 03:59:46 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 86FE6B815FE;
	Wed, 22 Feb 2023 16:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C971C433D2;
	Wed, 22 Feb 2023 16:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677085181;
	bh=05pnDDaGSd/n9BoMAzcvuoBw0s4bNC2y1LFQEokKBb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+uFDfDIRLI1AfecAWJjAZ5A0Zkm7piM/TEzBTKpVWGwx7Fq/EMnQlSiUyz0TtDHY
	 CNsgE6iwRF4PRrjXV8QMJUSvaH/q1McGj2NYwYQQ4py4oViUILpx0HvCFL72fD864D
	 0Dfy7P9LA0BQHG0pSjTHNxptBTfpbmc5BTx8MAEqDQQ46QIsSA2z1q3DO0VgEY9JjG
	 M5ZyxadkbhXfxRJncn95G16RfEeO1Y/usqoKXSuNxYznig686RZ0Ej+4MvGxiTWyG8
	 fZTKYrFMZJHnrpcAZ4ckFpQT2zr5QoyGXOW1XS2F3eKYXScRkZidMDJcA18Yal5gpU
	 9ubEJ0TFCiOCA==
Date: Wed, 22 Feb 2023 16:59:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 2/3] riscv: Set dma_default_coherent to true
Message-ID: <Y/ZJ+N4m6UUmIpL0@spud>
References: <20230222133712.8079-1-jiaxun.yang@flygoat.com>
 <20230222133712.8079-3-jiaxun.yang@flygoat.com>
 <Y/YrvDBJcYUQt4WC@spud>
 <6BBA7BEA-8595-436D-B4BF-D7DB95069C53@flygoat.com>
 <Y/Y8lEndecMfD+Ur@spud>
 <E46E0161-24E3-4185-B408-9357C49F1B51@flygoat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DDJ+GjGaXN0PLxMy"
Content-Disposition: inline
In-Reply-To: <E46E0161-24E3-4185-B408-9357C49F1B51@flygoat.com>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, paul.walmsley@sifive.com, robin.murphy@arm.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--DDJ+GjGaXN0PLxMy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2023 at 04:20:16PM +0000, Jiaxun Yang wrote:
> > 2023=E5=B9=B42=E6=9C=8822=E6=97=A5 16:02=EF=BC=8CConor Dooley <conor@ke=
rnel.org> =E5=86=99=E9=81=93=EF=BC=9A
> > On Wed, Feb 22, 2023 at 03:55:19PM +0000, Jiaxun Yang wrote:
> >>> 2023=E5=B9=B42=E6=9C=8822=E6=97=A5 14:50=EF=BC=8CConor Dooley <conor@=
kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
> >>> On Wed, Feb 22, 2023 at 01:37:11PM +0000, Jiaxun Yang wrote:
> >>>> For riscv our assumption is unless a device states it is non-coheren=
t,
> >>>> we take it to be DMA coherent.
> >>>>=20
> >>>> For devicetree probed devices that have been true since very begining
> >>>> with OF_DMA_DEFAULT_COHERENT selected.
> >>>>=20
> >>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >>>> ---
> >>>> arch/riscv/kernel/setup.c | 3 +++
> >>>> 1 file changed, 3 insertions(+)
> >>>>=20
> >>>> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> >>>> index 376d2827e736..34b371180976 100644
> >>>> --- a/arch/riscv/kernel/setup.c
> >>>> +++ b/arch/riscv/kernel/setup.c
> >>>> @@ -300,6 +300,9 @@ void __init setup_arch(char **cmdline_p)
> >>>> riscv_init_cbom_blocksize();
> >>>> riscv_fill_hwcap();
> >>>> apply_boot_alternatives();
> >>>> +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
> >>>> + dma_default_coherent =3D true;
> >>>> +#endif
> >>>=20
> >>> Do we really need to add ifdeffery for this here?
> >>> It's always coherent by default, so why do we need to say set it in
> >>> setup_arch() when we know that, regardless of options, it is true?
> >>=20
> >> Because this symbol is only a variable when:
> >>=20
> >> defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
> >> defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
> >> defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
> >>=20
> >> Which is only true if  CONFIG_RISCV_DMA_NONCOHERENT is selected.
> >>=20
> >> Otherwise this symbol is defined to true and we can=E2=80=99t make a a=
ssignment to it.

> > Maybe I am just slow today, but I don't get why you need to add
> > ifdeffery to setup_arch() to do something that is always true.
> > Why can't you just set this in riscv/mm/dma-noncoherent.c? What am I
> > missing?
>=20
> Hmm that sounds like a good idea but I was unable to find a place for thi=
s.
>=20
> riscv/mm/dma-noncoherent.c are just a bunch of callbacks, there is no ini=
tialisation
> function that will always run on every boot. riscv_noncoherent_supported =
is only
> called conditionally.

Right, that's fair. riscv_noncoherent_supported() is for when we know we
can support non-coherent DMA, not to detect whether we can, hence the
conditional nature.
Apologies for sending you on a wild goose chase there.

> Perhaps I can add a initcall in dma-noncoherent.c but it seems to be a li=
ttle bit
> overkilling.

Yah, probably would be.

> Actually I=E2=80=99d prefer to have a config option for the default value=
 but it seems like
> it=E2=80=99s not in Christoph=E2=80=99s flavour.

We already have a config option that sets things up nicely for RISC-V
that you're getting rid of! ;)

--DDJ+GjGaXN0PLxMy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/ZJ9wAKCRB4tDGHoIJi
0qO+AP0TUzGgL8wcTkrt9H19B7SAYoCE0ZZtKTmEp6bWgR/zGAD8Ckvf3sAHVPCu
+k9dqAZE4SyR7ZcmrNr2SezV/436agk=
=K9OI
-----END PGP SIGNATURE-----

--DDJ+GjGaXN0PLxMy--
