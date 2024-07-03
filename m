Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7496926010
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 14:19:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KCbVUmnt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDf2w4Tfyz3dDJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 22:19:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KCbVUmnt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDf2D1Tkcz2yvx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 22:18:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D42FF6215B;
	Wed,  3 Jul 2024 12:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F95C32781;
	Wed,  3 Jul 2024 12:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720009104;
	bh=Xz7XmnRcHbAH6WxQfIQCBQ5wwm0Koi8PJNYau32jfTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCbVUmnt6oKYedEVrXZokdmKNt/p56purKTjCPdu0I8notvhvSyIsFOxSIKsFqou5
	 15hwrXirnYeswH2fOKq4ePLXX/YqLrncJb+P2lL+FSGeV+lT+Ugb7jGGB8N/GemJUs
	 +s6AUvm4uXUiUubO2m8SRwgfVqiVI3bvHoZti8n9IfR1YWhDri+qAhR2D7CazE1WSi
	 DYXxisSjZuUy2EQgUJ11OqsC/jJ7WgMnwY5ys4wyKQgby7dbRQmA+Q6M3Sd7ECpY3T
	 6Yqt2c9ssuH177wbJ9Lx55K8mWXoPJt5OCcSCJr0+WBF71zu9mH49RClhXFAnHdpSc
	 2Pv2Acp8/4HDQ==
Date: Wed, 3 Jul 2024 13:18:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 17/20] ASoC: arizona: convert to
 of_property_for_each_u32_new()
Message-ID: <7f057c8b-9b76-4e31-a3cf-b82e52618529@sirena.org.uk>
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
 <20240703-of_property_for_each_u32-v1-17-42c1fc0b82aa@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NvGtanZygkHeLcw1"
Content-Disposition: inline
In-Reply-To: <20240703-of_property_for_each_u32-v1-17-42c1fc0b82aa@bootlin.com>
X-Cookie: There is a fly on your nose.
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
Cc: Richard Leitner <richard.leitner@linux.dev>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pwm@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, llvm@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, linux-samsung-soc@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, Samuel Holland <samuel@sholland.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-iio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>, linux-arm-msm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Damien Le Moal <dlemoal@kernel.org>, linux-sound@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Shawn Guo <shawnguo@kernel.org>, linux-sunxi@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--NvGtanZygkHeLcw1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 03, 2024 at 12:37:01PM +0200, Luca Ceresoli wrote:
> Simplify code using of_property_for_each_u32_new() as the two additional
> parameters in of_property_for_each_u32() are not used here.

Acked-by: Mark Brown <broonie@kernel.org>

--NvGtanZygkHeLcw1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaFQYAACgkQJNaLcl1U
h9AylQf9G8/SGzOMtUK0KB/AFXzHYIfp3WpSO5hnxcx+E5C7ZK4bjWCUH/uunXlj
F4Jf8unGlljKf05YliMJQdU+V6rteVrAjhbODBpOyO3KgNcahTjDSsdel5a8kNxy
xs3TjgeAoSA6aWSldnG9epfMTrso4U2krM6J7EpllETpHMhVEr19Tk/DczdltAFA
mqPoVSFfTNlYtiXK1/0dRLf9DiwVXVKh0Pg13G8lYTkxUb51nVwvoBAxCQ0kLhYc
whKK5upczFTpJCDEyHz17yMu3fWXyZaYCDCzPbqLkycwsy6u21KKM5tAvMr8o2Xd
zlsu2XFciX4F1nPtsj9mR7UcMVjyRw==
=W6f6
-----END PGP SIGNATURE-----

--NvGtanZygkHeLcw1--
