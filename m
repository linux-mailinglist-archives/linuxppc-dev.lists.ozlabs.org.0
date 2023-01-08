Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C545661887
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 20:30:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NqnGZ31Wtz3cGh
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 06:30:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sk2.org (client-ip=178.33.251.80; helo=2.mo576.mail-out.ovh.net; envelope-from=steve@sk2.org; receiver=<UNKNOWN>)
Received: from 2.mo576.mail-out.ovh.net (2.mo576.mail-out.ovh.net [178.33.251.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NqnFy4yQKz3c2d
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 06:29:41 +1100 (AEDT)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.20.179])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 088DA243B4
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 19:29:37 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-5zc6k (unknown [10.111.208.1])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 256A21FF13;
	Sun,  8 Jan 2023 19:29:33 +0000 (UTC)
Received: from sk2.org ([37.59.142.102])
	by ghost-submission-6684bf9d7b-5zc6k with ESMTPSA
	id NzpKBp0Zu2OoSAEAosFdow
	(envelope-from <steve@sk2.org>); Sun, 08 Jan 2023 19:29:33 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-102R00419398439-321a-44a9-9cd6-de394649d1c8,
                    5128B599F7D401446F64D4771BE19AB2B9CD7A8B) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
Date: Sun, 8 Jan 2023 20:29:31 +0100
From: Stephen Kitt <steve@sk2.org>
To: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Subject: Re: [PATCH 10/15] staging: fbtft: core: Introduce
 backlight_is_blank()
Message-ID: <20230108202931.42c9ee66@heffalump.sk2.org>
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-10-1bd9bafb351f@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
	<20230107-sam-video-backlight-drop-fb_blank-v1-10-1bd9bafb351f@ravnborg.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BJ.jj8xoOBPKImJW1n2hw0J";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Ovh-Tracer-Id: 1846757322849420934
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeggdduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgesghdtreerredtvdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepfeffgefhgfeuueeffeejieefieefgfefffethfdtudegvdejueelhffhfeegjeeinecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshhtvghvvgesshhkvddrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-staging@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, sam@ravnborg.org, Peter Suti <peter.suti@streamunlimited.com>, Daniel Thompson <daniel.thompson@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, Antonino Daplas <adaplas@gmail.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Robin van der Gracht <robin@protonic.nl>, Nicolas Ferre <nicolas.ferre@microchip.com>, Thomas Zimmermann <tzimmermann@suse.de>, Jingoo Han <jingoohan1@gmail.com>, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/BJ.jj8xoOBPKImJW1n2hw0J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 07 Jan 2023 19:26:24 +0100, Sam Ravnborg via B4 Submission Endpoint
<devnull+sam.ravnborg.org@kernel.org> wrote:

> From: Sam Ravnborg <sam@ravnborg.org>
>=20
> Avoiding direct access to backlight_properties.props.
>=20
> Access to the deprecated props.fb_blank replaced by backlight_is_blank().
> Access to props.power is dropped - it was only used for debug.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stephen Kitt <steve@sk2.org>
> Cc: Peter Suti <peter.suti@streamunlimited.com>
> Cc: linux-fbdev@vger.kernel.org
> ---
>  drivers/staging/fbtft/fbtft-core.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/staging/fbtft/fbtft-core.c
> b/drivers/staging/fbtft/fbtft-core.c index afaba94d1d1c..1746327e1939 100=
644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -132,15 +132,15 @@ static int fbtft_backlight_update_status(struct
> backlight_device *bd) {
>  	struct fbtft_par *par =3D bl_get_data(bd);
>  	bool polarity =3D par->polarity;
> +	bool blank =3D backlight_is_blank(bd);
> =20
> -	fbtft_par_dbg(DEBUG_BACKLIGHT, par,
> -		      "%s: polarity=3D%d, power=3D%d, fb_blank=3D%d\n",
> -		      __func__, polarity, bd->props.power,
> bd->props.fb_blank);
> +	fbtft_par_dbg(DEBUG_BACKLIGHT, par, "%s: polarity=3D%d, blank=3D%d\n",
> +		      __func__, polarity, blank);
> =20
> -	if (!backlight_is_blank(bd))
> -		gpiod_set_value(par->gpio.led[0], polarity);
> -	else
> +	if (blank)
>  		gpiod_set_value(par->gpio.led[0], !polarity);
> +	else
> +		gpiod_set_value(par->gpio.led[0], polarity);
> =20
>  	return 0;
>  }
>=20
> --=20
> 2.34.1

Reviewed-by: Stephen Kitt <steve@sk2.org>

--Sig_/BJ.jj8xoOBPKImJW1n2hw0J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAmO7GZsACgkQgNMC9Yht
g5wubw/+OjnQ4CEmY5Wjdqc5kVNQk3JFua1QNs/C0p6yt+0Z+jZGg/gsNAzlKXCI
Gm1o0/JkT8sJ3Th8mMKikKDs8y8SiHfHkm7gR0HRcUwdML8RHDCDr4d0yBS/xLtP
7fwQNf604rHXvP2Tlt/hZvM6r6gfGve+t9pFqwhToCARgZgEY08UEf4rfPTkBYBz
vRcvriKaj9O59OBgG7QjSxKWNPyhYumnL1GRJZzbrOgu5zAk8zJUCxAy/LD3fMy6
x+rePxWXUOQQtVlW4T/jMBADrnHgwoluBNA12CnsXBm14ZXrennS6bm0f3xjaHka
KkreOCwMglpI1/UaLTwqlRUQALocxWsQypP5hlG2OO4FcnDUagGhj1M5KNC4OPF8
rWi/LUWyLLs32FMZiq4Y561ev6OTCsqlgO1r8DVQAsaZVhPcn9TfiDOQp/HaCeRo
DAsncfhZEk9Cm6/vsv3NijYTlHBXfgWd7AKYCiUEVFqdGqUZ+1RdFxdqcj0CM7Fp
HNfcXRAcTA1b0EJrLKQK472vW38RhFzvfvWs5xnX4O/JHDxo0x9Mb4N8pUYMRcFb
W2Md6wkDlESuYv8XD2cId/zmb36TyKSZQfBkuCmXxiG1zJK+phoNuUICF+a4ApRk
cYG3xI2aM1ayPFQE+4njm3MuaS9/G+6XzyEn9qzeas4Kc1M1xiw=
=e1F4
-----END PGP SIGNATURE-----

--Sig_/BJ.jj8xoOBPKImJW1n2hw0J--
