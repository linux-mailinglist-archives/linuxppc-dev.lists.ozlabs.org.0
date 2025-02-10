Return-Path: <linuxppc-dev+bounces-6039-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6748A2F314
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 17:20:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ys8th4MRNz3055;
	Tue, 11 Feb 2025 03:20:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739204412;
	cv=none; b=JaBDP2qLhgsjzMQouts7K21PMiJpcxunTyJz+5JA8KrPFJaR1zMGgo7LatAI8oSNtf8XNmMkMDQ2S/m7okLWpg1uKvzd00tE8wCyXHjFKOSQPrY28I6446h7HDKEmaA5spVuYmQ2KnarKjc2fdv7lXwjrZsLc/tmwdys0yYZRK2bUYmUey9EfsPB4RtR6FH8cOQkhNA9vQxIC3w1XV2w4CgJtnDh1GMcfFx1QMcU7kZyakORVlz2gUHN9+GRpXcDWv1+yAefQF/DgLl6MyJopXLNwQQXFt2qzvfU3eu6COdvmQRrnHanDS2vDvXbI16beCReIu4t0QTm/a53kScnIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739204412; c=relaxed/relaxed;
	bh=NWngG/kFcyT8WtXP/QQ25Wit1MvMYs4YLqlxYuAuRm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixKB3YiF1umPbaYpnvpVgR87izncYaf/DVbJ8ZEdHm+z6cPt9DpDfxz0eoBfmF0pdficcBDj0tn4KdtGIeLFEW9VwzM7oMqaQBZM9jVbzkkDM/KMYrgbArbgtMjSB7uG7HxoPwVkbQWSza6jiU5JRI+XOloTYMfEDKIp6XMNfIkwxDqZM6IVDt91h7gz8DtPAQIoKs8Tq11iFgHd5ajU+5204rUG9/bRA4tgdSeEXda6/IAAwCbbzP3EcFEAvRmiZo4C6lSS34AnlAh8CYOT83c8OY/diNx9vj2UOWcorjEVP1BPlkjiCAO9Kq2l64gmqnY/zZWSDiJRh8zpDODgXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O9PX+r4/; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O9PX+r4/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ys8td26qRz2ypP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 03:20:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0B4BCA4194E;
	Mon, 10 Feb 2025 16:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E92C4CED1;
	Mon, 10 Feb 2025 16:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739204406;
	bh=NWngG/kFcyT8WtXP/QQ25Wit1MvMYs4YLqlxYuAuRm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O9PX+r4//9gugSEWU7m1K8ZM3qhMdimRiJbSiYe86/w+9bR4X4/MhCjFvOn6jCtWl
	 vB28xXU/PEd8OdGhiVaNzDs/FBXWoLFRH4kptOE8xbXpq2qGI6a1OOZVnXI0ym83jq
	 LnGs4AcqzboBOb0532JVxtDrX12IZ6wn//naY2MVFJBPlNYsR41f8I13OeonC84QCk
	 69CbLAibibKHMCZuy3S8PjUceMx28EdXjIP8T0trrzPnKbKuzKWElzT2zR5LGP78Nt
	 r0Zexk9OTbCG39S9//bUNzD+y+hVdVaV0KhwIcQGWehOvV4XsKy2wNZZpg0KLnYd2E
	 5bjdCF+rvXDcw==
Date: Mon, 10 Feb 2025 16:19:56 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 00/12] YAML conversion of several Freescale/PowerPC DT
 bindings
Message-ID: <8087f0dc-8c79-48a2-abf4-f78636c23be6@sirena.org.uk>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <611e47da-ba87-4c21-a6b7-cf051dc88158@sirena.org.uk>
 <Z6a_f03Ct9aB7Bbn@probook>
 <0fe3416c-c3f3-44c4-a1c0-7e8262c54d4b@sirena.org.uk>
 <Z6oh9t2QQzz17Yt6@probook>
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dFkCMkVIcP+mIwAz"
Content-Disposition: inline
In-Reply-To: <Z6oh9t2QQzz17Yt6@probook>
X-Cookie: A beer delayed is a beer denied.
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--dFkCMkVIcP+mIwAz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 03:57:42PM +0000, J. Neusch=E4fer wrote:
> On Mon, Feb 10, 2025 at 12:59:35PM +0000, Mark Brown wrote:

> > Please don't do this, it just makes it harder to merge things since it
> > makes it look like there's cross tree merges needed when that's not the
> > case, complicating merging, and puts the entire series in everyone's
> > inbox which makes things more noisy.

> How should I proceed with this series, in your opinion?
> I see potential advantages (less of the issues you describe) and
> disadvantages (somewhat harder to track patches) of splitting it up
> before sending v3.

I'd rather that at least the SPI stuff were sent separately (well,
ideally what you've done already is fine and it doesn't need a resend at
all).

--dFkCMkVIcP+mIwAz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeqJysACgkQJNaLcl1U
h9DNKQf/fZPJSroWubfTO8FLkUiOu5OAUNqM92OSlaM82yLjpcppqTwDH2c/TMS7
uzik6Kqwe9iL95z0VpO/SEQh2gEiVVotP2LwUfc0VHm6Mj0CYUhJVu5CFspP2PTu
H7A2qsXCPw2ASwOg8ZA+oH0PpNAI2mBdDeb7Dii4r186WNPit5Xunpx8I+9DoEyr
Zr6lOUeCFVfJVy6oNc7ZCQUhRljOVtlyRzPVMTpsyaMzgT22K+F+CHvQR/XatQQF
/2ywiEFKi5u2DSNtEgro0CF6bJ4U/ZtRMGcnEq9r6RmhpAINqFJhS0dysaqOIJfS
37TAqV/OvijdnS0RGY+GC+jyvnaoJA==
=DC91
-----END PGP SIGNATURE-----

--dFkCMkVIcP+mIwAz--

