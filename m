Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAFB6611DE
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 22:53:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NqDV32mKqz3cBp
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 08:53:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sk2.org (client-ip=178.33.251.80; helo=2.mo576.mail-out.ovh.net; envelope-from=steve@sk2.org; receiver=<UNKNOWN>)
X-Greylist: delayed 4540 seconds by postgrey-1.36 at boromir; Sun, 08 Jan 2023 08:52:44 AEDT
Received: from 2.mo576.mail-out.ovh.net (2.mo576.mail-out.ovh.net [178.33.251.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NqDTS0Dw1z304m
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 08:52:41 +1100 (AEDT)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.143.24])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id AFB8523D43
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Jan 2023 20:36:55 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-lxtls (unknown [10.110.115.90])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BD8F71FE98;
	Sat,  7 Jan 2023 20:36:50 +0000 (UTC)
Received: from sk2.org ([37.59.142.105])
	by ghost-submission-6684bf9d7b-lxtls with ESMTPSA
	id eSsCKuLXuWPI3wUAubRvvA
	(envelope-from <steve@sk2.org>); Sat, 07 Jan 2023 20:36:50 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-105G0067839b063-0764-4415-809e-52a6ec1d72ef,
                    DAE31E0ADBCC733EDB52157E78EF0D9B49FF90DC) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 37.167.110.121
Date: Sat, 07 Jan 2023 21:36:47 +0100
From: Stephen Kitt <steve@sk2.org>
To: sam@ravnborg.org,
 Sam Ravnborg via B4 Submission Endpoint <devnull+sam.ravnborg.org@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Helge Deller <deller@gmx.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Antonino Daplas <adaplas@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robin van der Gracht <robin@protonic.nl>, Miguel Ojeda <ojeda@kernel.org>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_01/15=5D_video=3A_fbdev=3A_atm?= =?US-ASCII?Q?el=5Flcdfb=3A_Rework_backlight_handling?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-1-1bd9bafb351f@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org> <20230107-sam-video-backlight-drop-fb_blank-v1-1-1bd9bafb351f@ravnborg.org>
Message-ID: <553AE999-CAF1-4E59-9F3F-68591ED192DE@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 15557403441115072134
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkedvgddufeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevufgfjghfkfggtgfgsehtqhhmtddtreejnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeekvddvteekgedtkefgueefheetheefffdtfeeuveettdejjeeutdetkefggeegleenucffohhmrghinheplhhkmhhlrdhorhhgnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshhtvghvvgesshhkvddrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht
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
Cc: linux-fbdev@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ludovic Desroches <ludovic.desroches@microchip.com>, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7 January 2023 19:26:15 CET, Sam Ravnborg via B4 Submission Endpoint <de=
vnull+sam=2Eravnborg=2Eorg@kernel=2Eorg> wrote:
>From: Sam Ravnborg <sam@ravnborg=2Eorg>
>
>The atmel_lcdfb had code to save/restore power state=2E
>This is not needed so drop it=2E
>
>Introduce backlight_is_brightness() to make logic simpler=2E
>
>Signed-off-by: Sam Ravnborg <sam@ravnborg=2Eorg>
>Cc: Nicolas Ferre <nicolas=2Eferre@microchip=2Ecom>
>Cc: Alexandre Belloni <alexandre=2Ebelloni@bootlin=2Ecom>
>Cc: Ludovic Desroches <ludovic=2Edesroches@microchip=2Ecom>
>Cc: linux-fbdev@vger=2Ekernel=2Eorg
>Cc: linux-arm-kernel@lists=2Einfradead=2Eorg
>---
> drivers/video/fbdev/atmel_lcdfb=2Ec | 24 +++---------------------
> 1 file changed, 3 insertions(+), 21 deletions(-)
>
>diff --git a/drivers/video/fbdev/atmel_lcdfb=2Ec b/drivers/video/fbdev/at=
mel_lcdfb=2Ec
>index 1fc8de4ecbeb=2E=2Ed297b3892637 100644
>--- a/drivers/video/fbdev/atmel_lcdfb=2Ec
>+++ b/drivers/video/fbdev/atmel_lcdfb=2Ec
>@@ -49,7 +49,6 @@ struct atmel_lcdfb_info {
> 	struct clk		*lcdc_clk;
>=20
> 	struct backlight_device	*backlight;
>-	u8			bl_power;
> 	u8			saved_lcdcon;
>=20
> 	u32			pseudo_palette[16];
>@@ -109,32 +108,18 @@ static u32 contrast_ctr =3D ATMEL_LCDC_PS_DIV8
> static int atmel_bl_update_status(struct backlight_device *bl)
> {
> 	struct atmel_lcdfb_info *sinfo =3D bl_get_data(bl);
>-	int			power =3D sinfo->bl_power;
>-	int			brightness =3D bl->props=2Ebrightness;
>+	int brightness;
>=20
>-	/* REVISIT there may be a meaningful difference between
>-	 * fb_blank and power =2E=2E=2E there seem to be some cases
>-	 * this doesn't handle correctly=2E
>-	 */
>-	if (bl->props=2Efb_blank !=3D sinfo->bl_power)
>-		power =3D bl->props=2Efb_blank;
>-	else if (bl->props=2Epower !=3D sinfo->bl_power)
>-		power =3D bl->props=2Epower;
>-
>-	if (brightness < 0 && power =3D=3D FB_BLANK_UNBLANK)
>-		brightness =3D lcdc_readl(sinfo, ATMEL_LCDC_CONTRAST_VAL);
>-	else if (power !=3D FB_BLANK_UNBLANK)
>-		brightness =3D 0;
>+	brightness =3D backlight_get_brightness(bl);
>=20
> 	lcdc_writel(sinfo, ATMEL_LCDC_CONTRAST_VAL, brightness);
>+
> 	if (contrast_ctr & ATMEL_LCDC_POL_POSITIVE)
> 		lcdc_writel(sinfo, ATMEL_LCDC_CONTRAST_CTR,
> 			brightness ? contrast_ctr : 0);
> 	else
> 		lcdc_writel(sinfo, ATMEL_LCDC_CONTRAST_CTR, contrast_ctr);
>=20
>-	bl->props=2Efb_blank =3D bl->props=2Epower =3D sinfo->bl_power =3D powe=
r;
>-
> 	return 0;
> }
>=20
>@@ -155,8 +140,6 @@ static void init_backlight(struct atmel_lcdfb_info *s=
info)
> 	struct backlight_properties props;
> 	struct backlight_device	*bl;
>=20
>-	sinfo->bl_power =3D FB_BLANK_UNBLANK;
>-
> 	if (sinfo->backlight)
> 		return;
>=20
>@@ -173,7 +156,6 @@ static void init_backlight(struct atmel_lcdfb_info *s=
info)
> 	sinfo->backlight =3D bl;
>=20
> 	bl->props=2Epower =3D FB_BLANK_UNBLANK;
>-	bl->props=2Efb_blank =3D FB_BLANK_UNBLANK;
> 	bl->props=2Ebrightness =3D atmel_bl_get_brightness(bl);
> }
>=20
>

Hi Sam,

I=E2=80=99d submitted quite a few more of these previously (and you=E2=80=
=99d reviewed them), see e=2Eg=2E the thread starting at https://lkml=2Eorg=
/lkml/2022/6/7/4365, and yesterday, https://lkml=2Eorg/lkml/2023/1/6/520, h=
ttps://lkml=2Eorg/lkml/2023/1/6/656, https://lkml=2Eorg/lkml/2023/1/6/970, =
https://lkml=2Eorg/lkml/2023/1/6/643, and https://lkml=2Eorg/lkml/2023/1/6/=
680=2E There are a few more, I can find them if it=E2=80=99s any use=2E

Regards,

Stephen
