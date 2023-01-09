Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EC76630EA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 21:04:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrPzT6cCRz3fBF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 07:04:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sk2.org (client-ip=46.105.52.162; helo=2.mo575.mail-out.ovh.net; envelope-from=steve@sk2.org; receiver=<UNKNOWN>)
X-Greylist: delayed 130667 seconds by postgrey-1.36 at boromir; Tue, 10 Jan 2023 07:03:49 AEDT
Received: from 2.mo575.mail-out.ovh.net (2.mo575.mail-out.ovh.net [46.105.52.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrPys0DLRz2ylk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:03:47 +1100 (AEDT)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.20.179])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id CFEEB2451A
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 20:03:42 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-pr92n (unknown [10.109.156.168])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 007F61FEA6;
	Mon,  9 Jan 2023 20:03:39 +0000 (UTC)
Received: from sk2.org ([37.59.142.98])
	by ghost-submission-6684bf9d7b-pr92n with ESMTPSA
	id 2FQONhtzvGPhugEAufjBpQ
	(envelope-from <steve@sk2.org>); Mon, 09 Jan 2023 20:03:39 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-98R002fae975b0-c3d6-495c-8602-a37db480a49a,
                    796317D5D98EA53ED2B7ABF3FE0FDD27B7A2AA3D) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
Date: Mon, 9 Jan 2023 21:03:38 +0100
From: Stephen Kitt <steve@sk2.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 01/15] video: fbdev: atmel_lcdfb: Rework backlight
 handling
Message-ID: <20230109210338.42c993bd@heffalump.sk2.org>
In-Reply-To: <20230109205026.4c672dc8@heffalump.sk2.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
	<20230107-sam-video-backlight-drop-fb_blank-v1-1-1bd9bafb351f@ravnborg.org>
	<553AE999-CAF1-4E59-9F3F-68591ED192DE@sk2.org>
	<Y7nb2q6SDota/rTU@ravnborg.org>
	<366FC0B8-21E2-4642-A5A5-CF4B6AB046B0@sk2.org>
	<Y7smdFs2xgJwwVQO@ravnborg.org>
	<20230109205026.4c672dc8@heffalump.sk2.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fAednxbP+nwMmsBkrG4.geO";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Ovh-Tracer-Id: 8295067564944492166
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeigdduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgesghdtreerredtjeenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepgedtieevheduudejjeelheetvdejudehvdejudfggfetteekffevvdehjeekkeefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshhtvghvvgesshhkvddrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Lee Jones <lee@kernel.org>, Antonino Daplas <adaplas@gmail.com>, linux-omap@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>, Paul Mackerras <paulus@samba.org>, Robin van der Gracht <robin@protonic.nl>, Miguel Ojeda <ojeda@kernel.org>, Sam Ravnborg via B4 Submission Endpoint <devnull+sam.ravnborg.org@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>, linux-arm-kernel@lists.infradead.org, Nicolas Ferre <nicolas.ferre@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/fAednxbP+nwMmsBkrG4.geO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 9 Jan 2023 20:53:44 +0100, Stephen Kitt <steve@sk2.org> wrote:
> On Sun, 8 Jan 2023 21:24:20 +0100, Sam Ravnborg <sam@ravnborg.org> wrote:
> > > Here are my pending patches from last June on lore:
> > >    =20
> >=20
> > All patches are handled I think except this: =20
> > > * https://lore.kernel.org/lkml/20220608205623.2106113-1-steve@sk2.org/
> > >  =20
> >=20
> > Can I ask you to drop the assignment that is not needed, and resend with
> > the collected acks/r-b.
> >=20
> > With this, then all fbdev patches are handled. =20
>=20
> Ah yes, it was revised as
> https://lore.kernel.org/lkml/20220609180440.3138625-1-steve@sk2.org/ which
> only got one ack (from you,
> https://lore.kernel.org/lkml/YqJCKQmQEuVsbspK@ravnborg.org/). Should I
> resend that or is that usable as-is? Or would it be better if I sent all =
the
> fbdev patches again (collecting all the acks and reviews)?

Since the others are already in fbdev/for-next, I=E2=80=99ve just resent v2=
 of this
patch with your ack.

Regards,

Stephen

--Sig_/fAednxbP+nwMmsBkrG4.geO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAmO8cxoACgkQgNMC9Yht
g5wz4BAAij/m9s80FJhymF6GFXJ6JFByUsTaGBWbmyRNRWMW+VPEh24jzlOXCT6m
eTqP1bR1+D+4DEYqRUyD0X7cf+k6KclOs4h83NnXQmVUWJ4KxMffVGWaRaWg3BGD
LgSgo62wCa/tODFoCLVZ9gmDsLfLvrU3ig0SefMgqZTKUNI63JJuVIY3v9upc9Xp
6mrj8xsiB9V5/GMgTlpcaoqTA8wb/OrJb2IvCEhcjFO7gti3LSSQ27VdA2WfGSpD
x+Uok2MBGoSbughl1Q0qD3oQxEkg3jvF94/gXfY40uedF1hBw+A2/mqQJ8XSumxI
H8rUTNeyeYailjBeegv0vhQYXjY3M8NiCbra54kWTRkFaIlORW1empICudxDuMvI
zB/DkEDAp86lpVuzovuUipwazxxbQCWxYDtEtebXKRE8xsai7Q1r6OYUSO0WN5k6
W3wbivddvTD2RjDbs0habIvERgM+A3lfGR4xor2hKL+XUkuw1zMavgRw1f/7Gk2N
J5KECYty3zKbugnM5uBtsnNUobmc1OnmyH7i2tgizTnKccF7Dd7N9WUWlatuEqFQ
+QIOt4j6Ii2FOuc/r122n8qNYePw/jyQZMpTBkUwAO6JH+Rv6NAnTOTCtBsT9lRq
i3mEWOkkOot6W1vgAcoxmZjuFGyI8YLV1rlwGd1ceOkZvHsP8X0=
=GTwo
-----END PGP SIGNATURE-----

--Sig_/fAednxbP+nwMmsBkrG4.geO--
