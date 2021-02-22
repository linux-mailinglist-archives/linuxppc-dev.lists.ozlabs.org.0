Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1127532194A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 14:48:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dkk691L3dz3cRl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 00:48:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MRbFZS3O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MRbFZS3O; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dkk5l3crMz30Jf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Feb 2021 00:47:55 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1CC5E64E5C;
 Mon, 22 Feb 2021 13:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614001671;
 bh=XCrkV1b4eW72wlwlFGJM+fGMWXYsc1qnWdLhx0MpYXA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MRbFZS3OzDUIDA+H5IZtI3RLtcop6I2kCgE8NHwvesNuNTcxgFWAlnvExVji+Girz
 qTrlBNa2NslOXgqEQNL9JiyAaiyfZpZNel8U8+7MtljhsXM4DHZPZr6H32QRnLTbs6
 L+R9SGvOpmZlHPtVbS07qYjuThmsLXhc0duuZ/lFL9bxKR5aX7lYo1cwu3H+eaY9ZL
 iQY+/oulgHQRZa6O5vElhThVZSwgXjOuoB091GAcDvu50eJba1/JIYHRBtWmBaO8v9
 GyBJu2jqHDGtSvxzmEwiqYLMZ1fzeJgQAlck0TpXkHcx6R38yamNKmiXqbDHRjw1Q/
 mi9ZPSUOXRCFQ==
Date: Mon, 22 Feb 2021 13:46:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v2 2/7] ASoC: fsl_rpmsg: Add CPU DAI driver for audio
 base on rpmsg
Message-ID: <20210222134650.GD6127@sirena.org.uk>
References: <1612693435-31418-1-git-send-email-shengjiu.wang@nxp.com>
 <1612693435-31418-3-git-send-email-shengjiu.wang@nxp.com>
 <20210208115112.GD8645@sirena.org.uk>
 <CAA+D8AMRGRRk6FzdiqaHAP1=dPJngNgmdGmU59vrroXA9BMyXw@mail.gmail.com>
 <20210209222953.GF4916@sirena.org.uk>
 <CAA+D8AN=SDMLhuNbstzHL_H2p_L6cr+oCXbauNB0gGs2BW5tmA@mail.gmail.com>
 <20210210153808.GB4748@sirena.org.uk>
 <CAA+D8ANdqd2W6xvwFuuk=YqUGCfuXCFzwO7tkhuGwzPRgA_A4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cQXOx3fnlpmgJsTP"
Content-Disposition: inline
In-Reply-To: <CAA+D8ANdqd2W6xvwFuuk=YqUGCfuXCFzwO7tkhuGwzPRgA_A4g@mail.gmail.com>
X-Cookie: A motion to adjourn is always in order.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--cQXOx3fnlpmgJsTP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 18, 2021 at 03:57:11PM +0800, Shengjiu Wang wrote:

> Can I add a flag:
> "rpmsg->mclk_streams & BIT(substream->stream)"
> for avoiding multiple calls of hw_params function before enabling
> clock?

Yes, if you do local refcounting that'd avoid the issue.

--cQXOx3fnlpmgJsTP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAztckACgkQJNaLcl1U
h9B2Ygf+N5kwNgpqApDIfReFqtqLtqQXDeHRtyJUp2Mw/FBKGxRIZtSpFboDMi5J
VXujKz7xY9csIA8KyCOStwamXxGesJy0uWUdrjX1Et/X4YYUXtDc+F6hUB1zaB7v
6xEPPINxm87gd/m1j2qeCKA8yVqdLLuZRBLIYvhzr5xzZhN5q5brqie2sHaxjysF
GeuG0uiWiLDUn/+KJAN1MNnnk3zrGR6oD8C8ZL1IZhT10oxYuK8M/wxlWMXC0JbE
fxxUD9Aau8k0ezS5VQquzWRTjZAC4utv/F4N6DBK1FCv3My0aM69mL4BL5a0mUji
tAkM5F9xNM+F83iGENlGypDkiCgd8g==
=kbni
-----END PGP SIGNATURE-----

--cQXOx3fnlpmgJsTP--
