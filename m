Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 486B5661F07
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 08:13:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nr4sW1mfXz3c9K
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 18:13:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sk2.org (client-ip=178.33.251.80; helo=2.mo576.mail-out.ovh.net; envelope-from=steve@sk2.org; receiver=<UNKNOWN>)
Received: from 2.mo576.mail-out.ovh.net (2.mo576.mail-out.ovh.net [178.33.251.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nr4ry0NQTz2xmy
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 18:12:32 +1100 (AEDT)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.146.76])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 0E41422A2D
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 07:04:17 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-vcj6j (unknown [10.110.208.152])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 114F81FE0E;
	Mon,  9 Jan 2023 07:04:15 +0000 (UTC)
Received: from sk2.org ([37.59.142.97])
	by ghost-submission-6684bf9d7b-vcj6j with ESMTPSA
	id VL7nAW+8u2NFIg8AanWh3Q
	(envelope-from <steve@sk2.org>); Mon, 09 Jan 2023 07:04:15 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-97G002b1d9a515-bcd6-46a5-9747-d99bfac79232,
                    796317D5D98EA53ED2B7ABF3FE0FDD27B7A2AA3D) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
Date: Mon, 9 Jan 2023 08:04:08 +0100
From: Stephen Kitt <steve@sk2.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 09/15] staging: fbtft: fb_ssd1351.c: Introduce
 backlight_is_blank()
Message-ID: <20230109080408.318b9188@heffalump.sk2.org>
In-Reply-To: <Y7sntztwrNqw41+i@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
	<20230107-sam-video-backlight-drop-fb_blank-v1-9-1bd9bafb351f@ravnborg.org>
	<20230108202817.7890f85c@heffalump.sk2.org>
	<Y7sntztwrNqw41+i@ravnborg.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k5LKo+Vu6bf_gN1b.VvwaPq";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Ovh-Tracer-Id: 13578634353109337734
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkeehgddutdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgesghdtreerredtvdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepfeffgefhgfeuueeffeejieefieefgfefffethfdtudegvdejueelhffhfeegjeeinecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsthgvvhgvsehskhdvrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Antonino Daplas <adaplas@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Lee Jones <lee@kernel.org>, Robin van der Gracht <robin@protonic.nl>, Miguel Ojeda <ojeda@kernel.org>, Sam Ravnborg via B4 Submission Endpoint <devnull+sam.ravnborg.org@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>, linux-arm-kernel@lists.infradead.org, Nicolas Ferre <nicolas.ferre@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/k5LKo+Vu6bf_gN1b.VvwaPq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Sun, 8 Jan 2023 21:29:43 +0100, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Sun, Jan 08, 2023 at 08:28:17PM +0100, Stephen Kitt wrote:
> > On Sat, 07 Jan 2023 19:26:23 +0100, Sam Ravnborg via B4 Submission
> > Endpoint <devnull+sam.ravnborg.org@kernel.org> wrote:
> >  =20
> > > From: Sam Ravnborg <sam@ravnborg.org>
> > >=20
> > > Avoiding direct access to backlight_properties.props.
> > >=20
> > > Access to the deprecated props.fb_blank replaced by
> > > backlight_is_blank(). Access to props.power is dropped - it was only
> > > used for debug.
> > >=20
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Stephen Kitt <steve@sk2.org>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Cc: linux-fbdev@vger.kernel.org
> > > ---
> > >  drivers/staging/fbtft/fb_ssd1351.c | 9 +++------
> > >  1 file changed, 3 insertions(+), 6 deletions(-)
> > >=20
> > > diff --git a/drivers/staging/fbtft/fb_ssd1351.c
> > > b/drivers/staging/fbtft/fb_ssd1351.c index b8d55aa8c5c7..995fbd2f3dc6
> > > 100644 --- a/drivers/staging/fbtft/fb_ssd1351.c
> > > +++ b/drivers/staging/fbtft/fb_ssd1351.c
> > > @@ -190,15 +190,12 @@ static struct fbtft_display display =3D {
> > >  static int update_onboard_backlight(struct backlight_device *bd)
> > >  {
> > >  	struct fbtft_par *par =3D bl_get_data(bd);
> > > -	bool on;
> > > +	bool blank =3D backlight_is_blank(bd);
> > > =20
> > > -	fbtft_par_dbg(DEBUG_BACKLIGHT, par,
> > > -		      "%s: power=3D%d, fb_blank=3D%d\n",
> > > -		      __func__, bd->props.power, bd->props.fb_blank);
> > > +	fbtft_par_dbg(DEBUG_BACKLIGHT, par, "%s: blank=3D%d\n", __func__,
> > > blank);=20
> > > -	on =3D !backlight_is_blank(bd);
> > >  	/* Onboard backlight connected to GPIO0 on SSD1351, GPIO1
> > > unused */
> > > -	write_reg(par, 0xB5, on ? 0x03 : 0x02);
> > > +	write_reg(par, 0xB5, !blank ? 0x03 : 0x02);
> > > =20
> > >  	return 0;
> > >  }
> > >=20
> > > --=20
> > > 2.34.1 =20
> >=20
> > For debugging purposes here, would there be any point in logging
> > props.state? As in
> >=20
> >         fbtft_par_dbg(DEBUG_BACKLIGHT, par,
> > -                     "%s: power=3D%d, fb_blank=3D%d\n",
> > -                     __func__, bd->props.power, bd->props.fb_blank);
> > +                     "%s: power=3D%d, state=3D%u\n",
> > +                     __func__, bd->props.power, bd->props.state); =20
>=20
> Thanks for the suggestion - and the reviews!
>=20
> I was tempted to just remove the debugging.
> If we require debugging, then this could be added in the backlight core,
> thus everyone would benefit from it.
>=20
> The solution above avoid any direct use of backlight_properties
> which I consider a layer violation outside the backlight core.
> (We cannot avoid it today with the current interface - but we can
> minimize it).

Ah yes, ideally backlight_properties should be viewed as an opaque structur=
e,
that makes sense.

Regards,

Stephen

--Sig_/k5LKo+Vu6bf_gN1b.VvwaPq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAmO7vGgACgkQgNMC9Yht
g5xpKw/+N/+V4N4YMTYfpGMKaFq+uDIg1giIEl9CWezI5BHkqwm7JGWbaeS23efZ
UHblHcZJZHTVQEXdJB8WMyhR9dHbEuati13IWacBs5OpBnvdL9kp2cTyBaChErEO
hMbeCaJVRmBEedoCVyGWPYp13KeX6CuYTqR/7/gTroZIK68bnTuwuIaeQlpgVXqL
Lue5OQUM2VezQCOLTiHUTspj82Bd1bTPfZfm/W8HKNzC6L2wSIzLuVRMphomjnek
Yb+lLKK45q++yxbI/5M1k8cXB626ooPXfFB8BSZlQVSjcye2Nxd4heB7EKD9bMTe
9qS7EjKDjbjm1l/7M542TEIL8zelZ9kaFqTom6JpeIS6iQIlb9XQP0jq/QWXv+9T
w7aCVB/ImS08kMVlW+uhCLmJudvc5Ro1XBnHMi+KvETzmr8j2kWBvw8WDtgxq76c
/PgbkkZWE2Htehso+egiPYRTT+0QRX1EPk9SpyFgaQV9YwZupBlCwxh2uhlbCweV
Ff/w5ZGTTZe/n1ZlgPPkAZWhPQotPFgkOzZpEACy2EOI5VIF7luIbXnPUyKvIEsE
W85vEaPzGZNqcZw3WW0a1CqgEVUFxJg29oTuC4KKM6BfNe+4hFCJ0EzShLmo+DHk
fXp1T3rFtAWKgcTEjK4vwxpSEZJPfQDx+JR5GESW204w2Accxiw=
=aVeb
-----END PGP SIGNATURE-----

--Sig_/k5LKo+Vu6bf_gN1b.VvwaPq--
