Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C0A553305
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 15:12:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LS6PL6vx8z3cd5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 23:12:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eUVPXq0o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eUVPXq0o;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LS6Nj2n0lz3000
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 23:11:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6E9C9B817F4;
	Tue, 21 Jun 2022 13:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA18C341C4;
	Tue, 21 Jun 2022 13:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655817102;
	bh=4xEME0PJkdFrWYpmGq18CjMHFdjMkxkM8iVMwtol8e0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eUVPXq0oGf0ynQ+mmppKszQbX0ExCvwwwyzClTkcVE2WThQMGV7mvgtdtLwZi9kpe
	 dDtkTM9jnjSnDNtlRJewWC2apC09nfHB0duGnIXX0vqBCDd2TgvrAQUuRzZP/zIVMI
	 Qpxjuj6zkn5CTumFR0+GSS6TqhPfsPduG/ILTsZ028IBm564m0B90BDHOesyPEfIDJ
	 lgcjqomPUoKP17Xs6KIlERtTK2y7LLH3NVb06Zrn7GoO6wqzZKmX5zptHYXZ/71NYW
	 AIei+ef2lro1GS4HLIqKo7DmO+D52U9EVKbAKnLXvmtcoi3VNenn9OmHeZRQM95nvV
	 l6dTKpR7L08qQ==
Date: Tue, 21 Jun 2022 14:11:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierluigi Passaro <pierluigi.p@variscite.com>
Subject: Re: [PATCH 4/4] ASoC: wm8904: add DMIC support
Message-ID: <YrHDh6lzdZXj7HcQ@sirena.org.uk>
References: <20220307141041.27538-1-alifer.m@variscite.com>
 <20220307141041.27538-4-alifer.m@variscite.com>
 <AM6PR08MB4376411B180D8860E2AD3AE0FFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zPDn0Yp+KJI2UZco"
Content-Disposition: inline
In-Reply-To: <AM6PR08MB4376411B180D8860E2AD3AE0FFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
X-Cookie: Edited for television.
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, Eran Matityahu <eran.m@variscite.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Alifer Willians de Moraes <alifer.m@variscite.com>, "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>, "perex@perex.cz" <perex@perex.cz>, "festevam@gmail.com" <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--zPDn0Yp+KJI2UZco
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 20, 2022 at 07:53:56PM +0000, Pierluigi Passaro wrote:

> > This means that DMICDAT2 is not usefully selectable at runtime, you've
> > got IN1 as digital and IN2 as analogue, so while the DMIC/ADC switch is
> > useful the DMIC1/2 switch is not.

> A customer could have the following working configuration
> - pin 1: DMIC_CLK
> - pin 24: LINEIN2R
> - pin 25: DMICDAT2
> - pin 26: LINEIN2L
> - pin 27: DMICDAT1

> with no shared pins: here there's the chance to select DMIC1, DMIC2 and
> LINEIN2 at runtime: I can't find a reason for a fixed behavior.
> Can you please elaborate ?

So in that case the driver should offer the DMIC1/2 selection.  The
driver should be looking at which pins are wired up as DMICs and only
registering controls that can actually be used in the system based on
the pins that are wired up.

--zPDn0Yp+KJI2UZco
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKxw4YACgkQJNaLcl1U
h9BfeAf/UZDQPNisaKHZIdpACSlbsSETLopyOjBB/groSLMQsNWcxbfkFhXkhdZS
mASQEVcOrYDiXD7yh6dcIeBAys+tfFZkrbX5YVBy+3sMm9jufXa7k3gbcJ6fA5rx
ARo7N0DMY9I2YqAkQ6dtTOxIicnYMxWJibPLagGEc6WiGGbi1CfnlZJ8UmHKTy7T
CFIAQes0bK4R26y7dZW7ogoSAClxlwImn9pLvrkwEh9VppUsP7XR/SauygBUsl3g
8gR9o1PjcVI3heKldnX1mQrzN13oJfBm2Vjd+7VGl8cLs3ZaQ8cx4dAgt+zj1JTF
7EXAU2zpt9gbnFQhQXfk+PuFpldzwA==
=5L+0
-----END PGP SIGNATURE-----

--zPDn0Yp+KJI2UZco--
