Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 060007CA93B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 15:18:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A7fgNdSx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8HjR5pxwz3c2L
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 00:18:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A7fgNdSx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8Hhb2jGPz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 00:17:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 18B1FB81603;
	Mon, 16 Oct 2023 13:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DF8C433C8;
	Mon, 16 Oct 2023 13:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697462235;
	bh=TSb9GxD5oEeI6PePIO1j8fweqhj9PYyACbhpg9yRRMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A7fgNdSxwKQ4ttsJo+HVlMcDisGXhNgNP/FcfBU30+LmCVjzYMc6peeGkKk7Zhchs
	 4kBpr71VXyksh3CTaRrfZY0B/7L08C6DOZDfMaYpZnix96I9vSm2q2M8nAipp6yJPe
	 kJGcFWjhC7QAnSuIKc6pkcEm6k0KdPhFouF6xc/8QAXvFfRupyCCPkNkbkHhlGyqgw
	 C4g7L3xPSsT0Wh3H03UYY+XlMY1KKaVvficA3P/yoFjkIHIoSUCPMxW6KyYYWvctPo
	 YDvBP9eKVA8zUgm7CzV7fCFUprNdfcoMBQEkoBL+Zryl1+0mYxy/KOHNLsKu3vLxKE
	 RaQ4ZdCPd7Kfg==
Date: Mon, 16 Oct 2023 14:17:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Subject: Re: Re: [PATCH v3 1/2] ASoC: dt-bindings: sound-card-common: List
 DAPM endpoints ignoring system suspend
Message-ID: <09061842-ce15-4f24-8098-56ecbb4fb6a2@sirena.org.uk>
References: <20231011114759.1073757-1-chancel.liu@nxp.com>
 <f639c88d-371a-4c72-a906-47d643b24ca8@sirena.org.uk>
 <20231012204739.GA1706264-robh@kernel.org>
 <DB9PR04MB94987AD33756548323D8D101E3D7A@DB9PR04MB9498.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CxOpNCJuLtIFp8ru"
Content-Disposition: inline
In-Reply-To: <DB9PR04MB94987AD33756548323D8D101E3D7A@DB9PR04MB9498.eurprd04.prod.outlook.com>
X-Cookie: If you're happy, you're successful.
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
Cc: Rob Herring <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz" <perex@perex.cz>, "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--CxOpNCJuLtIFp8ru
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 16, 2023 at 12:08:56PM +0000, Chancel Liu wrote:

> Thanks Mark and Rob for your advice. In fact, it's common use case. We can see
> many drivers set widgets ignoring suspend. I will remove the linux specifics
> and focus on the key concept. How about the modification on the property name
> and description as following:
>   ignore-suspend-widgets:
>     description: |
>       A list of audio sound widgets which are marked ignoring system suspend.
> 	  Paths between these endpoints are still active over suspend of the main
> 	  application processor that the current operating system is running.

That's probably fine from my point of view.  There's likely a better way
of saying system suspend but I'm not immediately seeing it and it could
always be improved later.

--CxOpNCJuLtIFp8ru
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUtN9MACgkQJNaLcl1U
h9AMyAf/RUOysUsrGEWQC4UlZkLrJEHxMIM6hDxLpZweAie5qQ6rOFMl5ft3BFZC
M9J42RBQwCyAqpmArKhQR1Dr5TMgf0VdaoOmFWLc0xQpMc25W88cIEafU8y+mUua
e6K/k0aIyYZdjwkP4Es88cLi8iA9nl66TBMbNNhVCPFu4ANu/cxaDwEYfisTIfAR
JYHPBdK8nZkSRUGu15z5IswGwSChMEvpWGPfbaz030xacAabehc3JcPSUv+2ogKN
xiEDDICnrN7oi4QKyUgw+Hsd1AnWhJmU3mJ6cNrh8DStFdq1XfWFD0jzbeQLCRC2
vM+z/sNri+7PeKmxVzfVXTZTJUZkrQ==
=HWHj
-----END PGP SIGNATURE-----

--CxOpNCJuLtIFp8ru--
