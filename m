Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D869569F88B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 17:03:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMLYC55LJz3cP6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 03:03:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HIVk4q5L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=conor@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HIVk4q5L;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMLXJ48J6z3bh1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 03:02:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4CDC9B81233;
	Wed, 22 Feb 2023 16:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 613AEC433D2;
	Wed, 22 Feb 2023 16:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677081754;
	bh=6LGlHzxZNINwfMiEzngNCsuQZ1HqkPO0BsKe3s0szao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HIVk4q5LZm7TsKDuXXBajKwEN9fw/fFUM3LecOh4kXVxpn2xmb5M131vgL3gcAkRB
	 1ja/SlxSEy90e7kKb+Sn2/hCog4FmEhUJvh4ZHJAz6COcqDyAiKS92gh02pB9YRGWR
	 IKPoL01U9IKBJXJd5ZEPRvqM59lLavHTKYEGiZN6g+IG2Khk1j+75/KOEoj29VutiT
	 B0dpQDoQ6qWi95cpgcOwhzxUq29TpOz1aJ6y0PuBv1S+NUqiYyAmC6ShpEKg1/A39l
	 TvGPLDiPNRoMQ6JyYOZ2nBFgbAR7nTVZh7yPyusmjdlSUmlL9SS3sY0K/9jzRACKz4
	 2lX12kySD7TTw==
Date: Wed, 22 Feb 2023 16:02:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 2/3] riscv: Set dma_default_coherent to true
Message-ID: <Y/Y8lEndecMfD+Ur@spud>
References: <20230222133712.8079-1-jiaxun.yang@flygoat.com>
 <20230222133712.8079-3-jiaxun.yang@flygoat.com>
 <Y/YrvDBJcYUQt4WC@spud>
 <6BBA7BEA-8595-436D-B4BF-D7DB95069C53@flygoat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8CVdK4UNNn5wJH7y"
Content-Disposition: inline
In-Reply-To: <6BBA7BEA-8595-436D-B4BF-D7DB95069C53@flygoat.com>
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


--8CVdK4UNNn5wJH7y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2023 at 03:55:19PM +0000, Jiaxun Yang wrote:
>=20
>=20
> > 2023=E5=B9=B42=E6=9C=8822=E6=97=A5 14:50=EF=BC=8CConor Dooley <conor@ke=
rnel.org> =E5=86=99=E9=81=93=EF=BC=9A
> >=20
> > On Wed, Feb 22, 2023 at 01:37:11PM +0000, Jiaxun Yang wrote:
> >> For riscv our assumption is unless a device states it is non-coherent,
> >> we take it to be DMA coherent.
> >>=20
> >> For devicetree probed devices that have been true since very begining
> >> with OF_DMA_DEFAULT_COHERENT selected.
> >>=20
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> ---
> >> arch/riscv/kernel/setup.c | 3 +++
> >> 1 file changed, 3 insertions(+)
> >>=20
> >> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> >> index 376d2827e736..34b371180976 100644
> >> --- a/arch/riscv/kernel/setup.c
> >> +++ b/arch/riscv/kernel/setup.c
> >> @@ -300,6 +300,9 @@ void __init setup_arch(char **cmdline_p)
> >> riscv_init_cbom_blocksize();
> >> riscv_fill_hwcap();
> >> apply_boot_alternatives();
> >> +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
> >> + dma_default_coherent =3D true;
> >> +#endif
> >=20
> > Do we really need to add ifdeffery for this here?
> > It's always coherent by default, so why do we need to say set it in
> > setup_arch() when we know that, regardless of options, it is true?
>=20
> Because this symbol is only a variable when:
>=20
> defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
> defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
> defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
>=20
> Which is only true if  CONFIG_RISCV_DMA_NONCOHERENT is selected.
>=20
> Otherwise this symbol is defined to true and we can=E2=80=99t make a assi=
gnment to it.

Maybe I am just slow today, but I don't get why you need to add
ifdeffery to setup_arch() to do something that is always true.
Why can't you just set this in riscv/mm/dma-noncoherent.c? What am I
missing?

Cheers,
Conor.

> >> if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
> >>     riscv_isa_extension_available(NULL, ZICBOM))
> >> riscv_noncoherent_supported();
> >> --=20
> >> 2.37.1 (Apple Git-137.1)
>=20
>=20

--8CVdK4UNNn5wJH7y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/Y8lAAKCRB4tDGHoIJi
0oePAP42rA2ROm6m4zS7iIWPZsgocfrVux+zYLf1x32I0aaNfgEA0pHQJ6qmRcbp
jMVC52QsYSdhJDdgid2lUqBOpWTfbwo=
=hwwY
-----END PGP SIGNATURE-----

--8CVdK4UNNn5wJH7y--
