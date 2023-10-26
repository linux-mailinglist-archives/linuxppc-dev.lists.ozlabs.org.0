Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FAC7D8811
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 20:12:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U6650vGa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGYmN3zvTz3cVP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 05:12:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U6650vGa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGYlZ4ckpz300g
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 05:11:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 073FCCE40EF;
	Thu, 26 Oct 2023 18:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3752C433C7;
	Thu, 26 Oct 2023 18:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698343892;
	bh=zAjZWYKj0X+TeoQ8BBUh2QjPiWJbCoaFCclLInGxZek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U6650vGaeoBL/T54vbOKjzWtko9dk+h0R1MRIYz11PbdSkogb6xFPRiNUfo7EzXOr
	 Q4I5i0hMEFOGmmQSfsw3zDJ4mYwr+L0P/nHEhLY62GKkZSQYDHIL7EPte9QdinP5yY
	 Y9gCtybfrCmHL58tFSzbUrRFW5c001TDKk1JbbN/wzFR72hvhcPu0zKhRn3jiSZNUf
	 zB1wTIh6r4NQOo78uyain9fwBDPQvK0xSwQK6sgmBgDFz0BhSrUk5h38sl7W/oCNp3
	 y1ONym/aUFm4xmqDN8OkS1qxTnDbStIzmds5C81nr1kFbI5Q3TGunJRfSan9Se01CE
	 SsIKvsAPQ2ERw==
Date: Thu, 26 Oct 2023 19:11:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] ASoC: dt-bindings: sound-card-common: List sound
 widgets ignoring system suspend
Message-ID: <3242e162-bb0d-441c-af29-7c08e1f67d1f@sirena.org.uk>
References: <20231023020718.1276000-1-chancel.liu@nxp.com>
 <20231026175842.GA4101469-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HTcFwXshOgNI0QFq"
Content-Disposition: inline
In-Reply-To: <20231026175842.GA4101469-robh@kernel.org>
X-Cookie: I'm also against BODY-SURFING!!
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, Chancel Liu <chancel.liu@nxp.com>, linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--HTcFwXshOgNI0QFq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 12:58:42PM -0500, Rob Herring wrote:
> On Mon, Oct 23, 2023 at 10:07:17AM +0800, Chancel Liu wrote:

> > Add a property to list audio sound widgets which are marked ignoring
> > system suspend. Paths between these endpoints are still active over
> > suspend of the main application processor that the current operating
> > system is running.

> Perhaps it would be better to define components used for low power=20
> audio rather than the OS mode that gets used. Isn't LPA just audio=20
> handling that doesn't require the OS CPU to be involved? So the state of=
=20
> the CPU is kind of orthogonal.

Not really - you can have bypass paths that don't touch the AP but which
will have the power cut if the AP goes into suspend and it can be a
system integration decision which components that will be true for.
Often it's an inflexible PMIC/MCU setup managing the lowest system power
states.  The pure low power audio bit we should already be able to
figure out.

--HTcFwXshOgNI0QFq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmU6q8kACgkQJNaLcl1U
h9AzFQgAhv1kIvshMwNbebl4YEDMqA368X4czYNC+zO/doeKPvpLr3ox2HGnTWmR
Nyf4K8yUD5JQDrNir/c/SYLXWQAr4sq5vnn2MyQw3z3LP8TBxG3NM7AiKqEqxQEj
QDIfhI8Izt/86k0FnoS8WVOwK5wbcM8b+HJ3bdo7/b1oA00dVVc3f1dCAHQZHz+U
w+zHZGAY4BBW8gw3tFbGNvNW5AEQUDCHKZbUDECM+PXDVLAUFKrpEz4uho7A4Bq2
LzyGissKaKgzmNDlwvw7yoMEMa51n5nwYCbUSM7B1OmFqYapFpZ+w18Dzqi0KDsS
Eto0aoVQorOv0Qf3Y0rPwaHwhcW3yg==
=z+Ib
-----END PGP SIGNATURE-----

--HTcFwXshOgNI0QFq--
