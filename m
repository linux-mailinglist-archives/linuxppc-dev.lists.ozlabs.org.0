Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E1A552012
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 17:13:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRY7T0LVCz3cgC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 01:13:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b15okAyb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b15okAyb;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRY6q1J7kz2yxj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 01:12:51 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 61C2F6116C;
	Mon, 20 Jun 2022 15:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B6FC3411B;
	Mon, 20 Jun 2022 15:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655737967;
	bh=SHOEIrF38xPmyZAQNJywwdY8NAEVju9HZycyF5Sbvrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b15okAyblhXu4iVfaa7hz2TNmmGhHGJbkDcf9sEW+gPd0t7paF88tUZ2vUcyqhknM
	 PRp1o3RxhakQ+KhIl0zgeTaCncv7uuBal+/v8fTKdhLEQPJqMudlqIcwdvtfbBinYE
	 qFU95Fj31xTnFK3WZhdExhXLpWMRLGO5cXjVBzSzuXSI44aqZ0ltYBeC6kZ/NDv4tm
	 Sxy7k9rWSMpEzJ8kYt08MtIEq/3dnMFM/Zpc7eNVVfSiELM32qKK79Cf3fN0ffNHAF
	 w64p5HnEtO2D8gJBYOYdQnxv1X3CCjbcbwTmjDaRSGt+4igbmDmnIjg2Kvi6DPViO7
	 7m3RY7OWzODTw==
Date: Mon, 20 Jun 2022 16:12:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierluigi Passaro <pierluigi.p@variscite.com>
Subject: Re: [PATCH 3/4] ASoC: wm8904: extend device tree support
Message-ID: <YrCOaW/K6muNnyRf@sirena.org.uk>
References: <AM6PR08MB437675AD04D20721769B08A3FFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/IGE4rk+pMEElHo5"
Content-Disposition: inline
In-Reply-To: <AM6PR08MB437675AD04D20721769B08A3FFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
X-Cookie: Good day to avoid cops.  Crawl to work.
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


--/IGE4rk+pMEElHo5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2022 at 02:32:17PM +0000, Pierluigi Passaro wrote:

> > > +=A0 - drc-cfg-regs: Default registers value for R40/41/42/43 (DRC)
> > > +=A0=A0=A0 The list must be (4 x num-drc-cfgs) entries long.
> > > +=A0=A0=A0 If absent or incomplete, DRC is disabled.

> > What is the purpose of having num-drc-cfgs?=A0 We can tell how large
> > drc-cfg-regs is so it just seems redundant.

> Can you please point me to any reference implementation doing this ?

of_property_read_variable_uX_array() should do what you want, you can
also use of_property_count_elems_of_size().  The main DT API header is
linux/of.h.

--/IGE4rk+pMEElHo5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKwjmgACgkQJNaLcl1U
h9AyNwf/SOmx1DddaNrhkB/9+jvoQAmDXpEJJAEanUhwzkSxLo4UmEeOQflNn9qA
2PY0VObRD2/nzISwUccumqGAJzzx+nwIcAgRAd//JeIG/8Z69a4VEtZMxzjuiwMo
QDPEWcIoP3Zal1K59ZbXoNdf5ZZuAGsrPg3o9EQRuawrwVBQdanQrGVn2ECfCwi8
1l4G/8Xz3K8/F4/qtWHUHCiSH0aG/t+dzUCUmMgjejm8qslMjQnTzzYQC9/cml/D
QoZBU2l6Gn+/e07dqQsXd95nogtd78aJNnIN9a0NxMNmYMz6hluR4Al0u+hXL3Ne
DRMA8B/6nCzGQb7JkQA3heJjObYa9w==
=NZIk
-----END PGP SIGNATURE-----

--/IGE4rk+pMEElHo5--
