Return-Path: <linuxppc-dev+bounces-6033-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C23ADA2ED0B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 13:59:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ys4RT6Wh0z303B;
	Mon, 10 Feb 2025 23:59:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739192389;
	cv=none; b=Q9+NL+Kh8IW19HSTl9gqLXVpwqJFQH5XPDMxPEgF1HL5WCtOlOnXDpM1MdNxCOOmdyTmywVdZnCKz/BmgvhMlvz71nVRdqz0cTrKWEXnxO6ZKdgN6t+UAppDIRyo8fSqVKZ++19eQ5Fj+fyKrUAOqmE2uJrog7HEFBggDdUIgm4TCrI8Tetc12WhbOtLG+aEEyvoZUTGgxSnav11hYy7zrS8prp2sgoIw8a6VPhPlvF1Wd0EOwyd3Gt+G0YXBCxZ7PTYOgc4aw8jreXotkBGzpEQsoFp+b2GH6s1qEi5PuvBpfLfyNFEDuTmxfZ83ak+eeQ1P6WX6Rdd+whYCptwxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739192389; c=relaxed/relaxed;
	bh=owpoSk7EuQEMFHDc/s6Anvm+qbdzkCtpH98wS+rR4qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZazXuEQ6KMpEYfrcld9siQx+GQH4QjFxbWEVsn1ORs6wmyc9ikJYR18UbNcPsw1dxaRppToqlR5moUkCrQuffLuJR+GWPOOW2r90B7plUqY5DmEhoTgfY5HP0TIlg4EuQ+ZSeVYq/8rLD2Gd/lI/fSdZn6UNtg0VNugvje0mKvFDYOMclYeyJIbKCjz5dk77iztjOYWOTbqNTyBLFugLwcyW5k6iDFVKpLDfAMOcZufZY0OvRlwUBrlmHZV1giPqp+E/VNV72xgeBm95Ulfj/4JmKCt++lI1aAQy/87th/0WlA3tSqgCcKzjhCjNszicZa+2cSvJa9OMdSjnnO3LA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L47QptUn; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L47QptUn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ys4RS5MzXz3039
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 23:59:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B1B95A41344;
	Mon, 10 Feb 2025 12:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A013BC4CED1;
	Mon, 10 Feb 2025 12:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739192385;
	bh=owpoSk7EuQEMFHDc/s6Anvm+qbdzkCtpH98wS+rR4qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L47QptUnYsLmPtLriLWk/mFFeLwNiicn+sgpWdC5JUSMTLZnSmIRzeQDhotnIur3r
	 T2PuqbTS/9961JLV3JPPepnAz8kzwwutEm5mDhmRhSHxuZH4PQnHKMkrLwb3GPOjHA
	 NpPVnElP0StXHHIoZj1w22xh56585gTSbrBY7+L57cEPFC6uCdNmrFC/MUkYw3SmRK
	 n5/QSF7k6FBHTpUbZ67QqyzIKpLf4ytrKpPtTZ0N6INEXGzBtjbEYsgzZUuU7v7aIl
	 JLWU2qWBoJkLmMZNXGQyO/SdAFBFganR7Bnr2lyPsoxWxMbx6VHV2JRJ0r/cgC/OB8
	 ON23cJ8tHySjg==
Date: Mon, 10 Feb 2025 12:59:35 +0000
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
Message-ID: <0fe3416c-c3f3-44c4-a1c0-7e8262c54d4b@sirena.org.uk>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <611e47da-ba87-4c21-a6b7-cf051dc88158@sirena.org.uk>
 <Z6a_f03Ct9aB7Bbn@probook>
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
	protocol="application/pgp-signature"; boundary="Erlp5XHmWCbFSP4H"
Content-Disposition: inline
In-Reply-To: <Z6a_f03Ct9aB7Bbn@probook>
X-Cookie: A beer delayed is a beer denied.
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--Erlp5XHmWCbFSP4H
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 08, 2025 at 02:20:47AM +0000, J. Neusch=E4fer wrote:
> On Fri, Feb 07, 2025 at 09:38:05PM +0000, Mark Brown wrote:

> > What's the story with dependencies here - why is all this stuff in one
> > series?

> The patches are independent of each other, except for the four elbc/nand
> patches. They are in the same series because they came up during the
> same project and achieve similar goals, but it isn't necessary.

Please don't do this, it just makes it harder to merge things since it
makes it look like there's cross tree merges needed when that's not the
case, complicating merging, and puts the entire series in everyone's
inbox which makes things more noisy.

--Erlp5XHmWCbFSP4H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmep+DcACgkQJNaLcl1U
h9CQGgf/VRshpAxNRM+4y4pK3dFBOw1Ky/VAXan0LIOgCUmAP8+L3qoihpm6VZoz
o6W4ioH6XERLRHTxdkiieODuhDTDhXH7sNTVvzzLejKyo4DbHvQBsMo2X0+kEZ3X
n3ZFgc8GgqMbmv9EIVATYRnbBCUhhcD7EEZlTvxDDbErDipAGaaYMYTPsbMOZ1qY
WWHWlzndWagcVtYf4Qf5bx4FjpS97qnE+VS801C6WgxbmrOFcWrTga0hXVlhQeu/
V+FDM+XojBDbeAKOvkXZkHAybyY9U37wa0h0kmq6cDBuherZ5XdAXyw0K5uvqA4W
0ywZYqZ4Ucmy7mvcfUgmcUR9E3GnMg==
=m2SC
-----END PGP SIGNATURE-----

--Erlp5XHmWCbFSP4H--

