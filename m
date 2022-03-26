Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED474E8344
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 19:25:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQnT8076Bz30Hj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 05:25:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p2w9SXKt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=mchehab@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p2w9SXKt; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQnSS44VWz308h
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 05:25:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6CF6660A24;
 Sat, 26 Mar 2022 18:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F776C340ED;
 Sat, 26 Mar 2022 18:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648319108;
 bh=+nDWejhJC7gVlldeGgtZGsQPwczQyNxgjvfpudnP1p8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=p2w9SXKtIb2pID5hLy87dy6lRfj25fHMZFK9M2fTt6VEpd8SlRD7UbH/wr5fdaAEu
 2VGrb1GGgCrNqbKDSV/CbmfYY8KbU1Hrs3ywwrE0EGRT6Hnl/UdDbToiXOnLkly/VU
 Yl4vg0rKuJ01gWt1KTw9kfhusaXkoK83Q9BoF/m23db+XsftSr3pSMwoRNO1kOq6/y
 uHLWf5dyQ23+9OuoEenUEhWdyxt/JUOITHalGj2HURR5QGgkUskSFdQEFASnf0Nozr
 ghrx+lKo/7r2VBBojgfRv6dGRo+O89SpOQOsgbdtOUg7ynC0kGp9+BJvLabKZF8J7g
 mSl/c+nzyAUjw==
Date: Sat, 26 Mar 2022 19:24:54 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Benjamin =?UTF-8?B?U3TDvHJ6?= <benni@stuerz.xyz>
Subject: Re: [PATCH 16/22] dvb-usb: Replace comments with C99 initializers
Message-ID: <20220326192454.14115baa@coco.lan>
In-Reply-To: <20220326165909.506926-16-benni@stuerz.xyz>
References: <20220326165909.506926-1-benni@stuerz.xyz>
 <20220326165909.506926-16-benni@stuerz.xyz>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: andrew@lunn.ch, linux-atm-general@lists.sourceforge.net,
 linux-ia64@vger.kernel.org, linus.walleij@linaro.org,
 dave.hansen@linux.intel.com, linux-pci@vger.kernel.org, robert.moore@intel.com,
 laforge@gnumonks.org, alim.akhtar@samsung.com, hpa@zytor.com,
 wcn36xx@lists.infradead.org, pkshih@realtek.com,
 linux-samsung-soc@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-edac@vger.kernel.org, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma@vger.kernel.org, gregory.clement@bootlin.com,
 rafael.j.wysocki@intel.com, linux@armlinux.org.uk, krzk@kernel.org,
 jgg@ziepe.ca, mingo@redhat.com, 3chas3@gmail.com, linux-input@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, lenb@kernel.org,
 mike.marciniszyn@cornelisnetworks.com, rric@kernel.org, ajd@linux.ibm.com,
 arnd@arndb.de, kvalo@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, loic.poulain@linaro.org, bp@alien8.de,
 bhelgaas@google.com, tglx@linutronix.de, linux-media@vger.kernel.org,
 linux@simtec.co.uk, linux-arm-kernel@lists.infradead.org, devel@acpica.org,
 isdn@linux-pingi.de, tony.luck@intel.com, nico@fluxnic.net,
 gregkh@linuxfoundation.org, dmitry.torokhov@gmail.com,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 davem@davemloft.net, james.morse@arm.com, netdev@vger.kernel.org,
 fbarrat@linux.ibm.com, sebastian.hesselbarth@gmail.com, pali@kernel.org,
 brgl@bgdev.pl
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Sat, 26 Mar 2022 17:59:03 +0100
Benjamin St=C3=BCrz <benni@stuerz.xyz> escreveu:

> This replaces comments with C99's designated
> initializers because the kernel supports them now.
>=20
> Signed-off-by: Benjamin St=C3=BCrz <benni@stuerz.xyz>
> ---
>  drivers/media/usb/dvb-usb/dibusb-mb.c | 62 +++++++++++++--------------
>  drivers/media/usb/dvb-usb/dibusb-mc.c | 34 +++++++--------
>  2 files changed, 48 insertions(+), 48 deletions(-)
>=20
> diff --git a/drivers/media/usb/dvb-usb/dibusb-mb.c b/drivers/media/usb/dv=
b-usb/dibusb-mb.c
> index e9dc27f73970..f188e07f518b 100644
> --- a/drivers/media/usb/dvb-usb/dibusb-mb.c
> +++ b/drivers/media/usb/dvb-usb/dibusb-mb.c
> @@ -122,40 +122,40 @@ static int dibusb_probe(struct usb_interface *intf,
> =20
>  /* do not change the order of the ID table */
>  static struct usb_device_id dibusb_dib3000mb_table [] =3D {
> -/* 00 */	{ USB_DEVICE(USB_VID_WIDEVIEW,		USB_PID_AVERMEDIA_DVBT_USB_COLD=
) },
> -/* 01 */	{ USB_DEVICE(USB_VID_WIDEVIEW,		USB_PID_AVERMEDIA_DVBT_USB_WARM=
) },
> -/* 02 */	{ USB_DEVICE(USB_VID_COMPRO,		USB_PID_COMPRO_DVBU2000_COLD) },
> -/* 03 */	{ USB_DEVICE(USB_VID_COMPRO,		USB_PID_COMPRO_DVBU2000_WARM) },
> -/* 04 */	{ USB_DEVICE(USB_VID_COMPRO_UNK,	USB_PID_COMPRO_DVBU2000_UNK_CO=
LD) },
> -/* 05 */	{ USB_DEVICE(USB_VID_DIBCOM,		USB_PID_DIBCOM_MOD3000_COLD) },
> -/* 06 */	{ USB_DEVICE(USB_VID_DIBCOM,		USB_PID_DIBCOM_MOD3000_WARM) },
> -/* 07 */	{ USB_DEVICE(USB_VID_EMPIA,		USB_PID_KWORLD_VSTREAM_COLD) },
> -/* 08 */	{ USB_DEVICE(USB_VID_EMPIA,		USB_PID_KWORLD_VSTREAM_WARM) },
> -/* 09 */	{ USB_DEVICE(USB_VID_GRANDTEC,		USB_PID_GRANDTEC_DVBT_USB_COLD)=
 },
> -/* 10 */	{ USB_DEVICE(USB_VID_GRANDTEC,		USB_PID_GRANDTEC_DVBT_USB_WARM)=
 },
> -/* 11 */	{ USB_DEVICE(USB_VID_GRANDTEC,		USB_PID_DIBCOM_MOD3000_COLD) },
> -/* 12 */	{ USB_DEVICE(USB_VID_GRANDTEC,		USB_PID_DIBCOM_MOD3000_WARM) },
> -/* 13 */	{ USB_DEVICE(USB_VID_HYPER_PALTEK,	USB_PID_UNK_HYPER_PALTEK_COL=
D) },
> -/* 14 */	{ USB_DEVICE(USB_VID_HYPER_PALTEK,	USB_PID_UNK_HYPER_PALTEK_WAR=
M) },
> -/* 15 */	{ USB_DEVICE(USB_VID_VISIONPLUS,	USB_PID_TWINHAN_VP7041_COLD) },
> -/* 16 */	{ USB_DEVICE(USB_VID_VISIONPLUS,	USB_PID_TWINHAN_VP7041_WARM) },
> -/* 17 */	{ USB_DEVICE(USB_VID_TWINHAN,		USB_PID_TWINHAN_VP7041_COLD) },
> -/* 18 */	{ USB_DEVICE(USB_VID_TWINHAN,		USB_PID_TWINHAN_VP7041_WARM) },
> -/* 19 */	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_CO=
LD) },
> -/* 20 */	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_WA=
RM) },
> -/* 21 */	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_AN=
2235_COLD) },
> -/* 22 */	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_AN=
2235_WARM) },
> -/* 23 */	{ USB_DEVICE(USB_VID_ADSTECH,		USB_PID_ADSTECH_USB2_COLD) },
> +[0]  =3D	{ USB_DEVICE(USB_VID_WIDEVIEW,		USB_PID_AVERMEDIA_DVBT_USB_COLD=
) },
> +[1]  =3D	{ USB_DEVICE(USB_VID_WIDEVIEW,		USB_PID_AVERMEDIA_DVBT_USB_WARM=
) },

While here, please properly indent this table, and respect the 80-columns l=
imit,
e. g.:

static struct usb_device_id dibusb_dib3000mb_table [] =3D {
	[0] =3D { USB_DEVICE(USB_VID_WIDEVIEW=20
			   USB_PID_AVERMEDIA_DVBT_USB_COLD)=20
	},
	[1]  =3D	{ USB_DEVICE(USB_VID_WIDEVIEW,
			     USB_PID_AVERMEDIA_DVBT_USB_WARM)
	},
	...

=09
Regards,
Mauro

> +[2]  =3D	{ USB_DEVICE(USB_VID_COMPRO,		USB_PID_COMPRO_DVBU2000_COLD) },
> +[3]  =3D	{ USB_DEVICE(USB_VID_COMPRO,		USB_PID_COMPRO_DVBU2000_WARM) },
> +[4]  =3D	{ USB_DEVICE(USB_VID_COMPRO_UNK,	USB_PID_COMPRO_DVBU2000_UNK_CO=
LD) },
> +[5]  =3D	{ USB_DEVICE(USB_VID_DIBCOM,		USB_PID_DIBCOM_MOD3000_COLD) },
> +[6]  =3D	{ USB_DEVICE(USB_VID_DIBCOM,		USB_PID_DIBCOM_MOD3000_WARM) },
> +[7]  =3D	{ USB_DEVICE(USB_VID_EMPIA,		USB_PID_KWORLD_VSTREAM_COLD) },
> +[8]  =3D	{ USB_DEVICE(USB_VID_EMPIA,		USB_PID_KWORLD_VSTREAM_WARM) },
> +[9]  =3D	{ USB_DEVICE(USB_VID_GRANDTEC,		USB_PID_GRANDTEC_DVBT_USB_COLD)=
 },
> +[10] =3D	{ USB_DEVICE(USB_VID_GRANDTEC,		USB_PID_GRANDTEC_DVBT_USB_WARM)=
 },
> +[11] =3D	{ USB_DEVICE(USB_VID_GRANDTEC,		USB_PID_DIBCOM_MOD3000_COLD) },
> +[12] =3D	{ USB_DEVICE(USB_VID_GRANDTEC,		USB_PID_DIBCOM_MOD3000_WARM) },
> +[13] =3D	{ USB_DEVICE(USB_VID_HYPER_PALTEK,	USB_PID_UNK_HYPER_PALTEK_COL=
D) },
> +[14] =3D	{ USB_DEVICE(USB_VID_HYPER_PALTEK,	USB_PID_UNK_HYPER_PALTEK_WAR=
M) },
> +[15] =3D	{ USB_DEVICE(USB_VID_VISIONPLUS,	USB_PID_TWINHAN_VP7041_COLD) },
> +[16] =3D	{ USB_DEVICE(USB_VID_VISIONPLUS,	USB_PID_TWINHAN_VP7041_WARM) },
> +[17] =3D	{ USB_DEVICE(USB_VID_TWINHAN,		USB_PID_TWINHAN_VP7041_COLD) },
> +[18] =3D	{ USB_DEVICE(USB_VID_TWINHAN,		USB_PID_TWINHAN_VP7041_WARM) },
> +[19] =3D	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_CO=
LD) },
> +[20] =3D	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_WA=
RM) },
> +[21] =3D	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_AN=
2235_COLD) },
> +[22] =3D	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_AN=
2235_WARM) },
> +[23] =3D	{ USB_DEVICE(USB_VID_ADSTECH,		USB_PID_ADSTECH_USB2_COLD) },
> =20
>  /* device ID with default DIBUSB2_0-firmware and with the hacked firmwar=
e */
> -/* 24 */	{ USB_DEVICE(USB_VID_ADSTECH,		USB_PID_ADSTECH_USB2_WARM) },
> -/* 25 */	{ USB_DEVICE(USB_VID_KYE,		USB_PID_KYE_DVB_T_COLD) },
> -/* 26 */	{ USB_DEVICE(USB_VID_KYE,		USB_PID_KYE_DVB_T_WARM) },
> +[24] =3D	{ USB_DEVICE(USB_VID_ADSTECH,		USB_PID_ADSTECH_USB2_WARM) },
> +[25] =3D	{ USB_DEVICE(USB_VID_KYE,		USB_PID_KYE_DVB_T_COLD) },
> +[26] =3D	{ USB_DEVICE(USB_VID_KYE,		USB_PID_KYE_DVB_T_WARM) },
> =20
> -/* 27 */	{ USB_DEVICE(USB_VID_KWORLD,		USB_PID_KWORLD_VSTREAM_COLD) },
> +[27] =3D	{ USB_DEVICE(USB_VID_KWORLD,		USB_PID_KWORLD_VSTREAM_COLD) },
> =20
> -/* 28 */	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_US=
B2_COLD) },
> -/* 29 */	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_US=
B2_WARM) },
> +[28] =3D	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_US=
B2_COLD) },
> +[29] =3D	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_US=
B2_WARM) },
> =20
>  /*
>   * XXX: As Artec just 'forgot' to program the EEPROM on some Artec T1 de=
vices
> @@ -166,7 +166,7 @@ static struct usb_device_id dibusb_dib3000mb_table []=
 =3D {
>   */
> =20
>  #ifdef CONFIG_DVB_USB_DIBUSB_MB_FAULTY
> -/* 30 */	{ USB_DEVICE(USB_VID_ANCHOR,		USB_PID_ULTIMA_TVBOX_ANCHOR_COLD)=
 },
> +[30] =3D	{ USB_DEVICE(USB_VID_ANCHOR,		USB_PID_ULTIMA_TVBOX_ANCHOR_COLD)=
 },
>  #endif
> =20
>  			{ }		/* Terminating entry */
> diff --git a/drivers/media/usb/dvb-usb/dibusb-mc.c b/drivers/media/usb/dv=
b-usb/dibusb-mc.c
> index e2689977c8c8..48760470e821 100644
> --- a/drivers/media/usb/dvb-usb/dibusb-mc.c
> +++ b/drivers/media/usb/dvb-usb/dibusb-mc.c
> @@ -25,23 +25,23 @@ static int dibusb_mc_probe(struct usb_interface *intf,
> =20
>  /* do not change the order of the ID table */
>  static struct usb_device_id dibusb_dib3000mc_table [] =3D {
> -/* 00 */	{ USB_DEVICE(USB_VID_DIBCOM,		USB_PID_DIBCOM_MOD3001_COLD) },
> -/* 01 */	{ USB_DEVICE(USB_VID_DIBCOM,		USB_PID_DIBCOM_MOD3001_WARM) },
> -/* 02 */	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_US=
B2_COLD) },
> -/* 03 */	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_US=
B2_WARM) }, // ( ? )
> -/* 04 */	{ USB_DEVICE(USB_VID_LITEON,		USB_PID_LITEON_DVB_T_COLD) },
> -/* 05 */	{ USB_DEVICE(USB_VID_LITEON,		USB_PID_LITEON_DVB_T_WARM) },
> -/* 06 */	{ USB_DEVICE(USB_VID_EMPIA,		USB_PID_DIGIVOX_MINI_SL_COLD) },
> -/* 07 */	{ USB_DEVICE(USB_VID_EMPIA,		USB_PID_DIGIVOX_MINI_SL_WARM) },
> -/* 08 */	{ USB_DEVICE(USB_VID_GRANDTEC,          USB_PID_GRANDTEC_DVBT_U=
SB2_COLD) },
> -/* 09 */	{ USB_DEVICE(USB_VID_GRANDTEC,          USB_PID_GRANDTEC_DVBT_U=
SB2_WARM) },
> -/* 10 */	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ARTEC_T14_COLD)=
 },
> -/* 11 */	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ARTEC_T14_WARM)=
 },
> -/* 12 */	{ USB_DEVICE(USB_VID_LEADTEK,		USB_PID_WINFAST_DTV_DONGLE_COLD)=
 },
> -/* 13 */	{ USB_DEVICE(USB_VID_LEADTEK,		USB_PID_WINFAST_DTV_DONGLE_WARM)=
 },
> -/* 14 */	{ USB_DEVICE(USB_VID_HUMAX_COEX,	USB_PID_DVB_T_USB_STICK_HIGH_S=
PEED_COLD) },
> -/* 15 */	{ USB_DEVICE(USB_VID_HUMAX_COEX,	USB_PID_DVB_T_USB_STICK_HIGH_S=
PEED_WARM) },
> -			{ }		/* Terminating entry */
> +	[0]  =3D	{ USB_DEVICE(USB_VID_DIBCOM,		USB_PID_DIBCOM_MOD3001_COLD) },
> +	[1]  =3D	{ USB_DEVICE(USB_VID_DIBCOM,		USB_PID_DIBCOM_MOD3001_WARM) },
> +	[2]  =3D	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_U=
SB2_COLD) },
> +	[3]  =3D	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_U=
SB2_WARM) }, // ( ? )
> +	[4]  =3D	{ USB_DEVICE(USB_VID_LITEON,		USB_PID_LITEON_DVB_T_COLD) },
> +	[5]  =3D	{ USB_DEVICE(USB_VID_LITEON,		USB_PID_LITEON_DVB_T_WARM) },
> +	[6]  =3D	{ USB_DEVICE(USB_VID_EMPIA,		USB_PID_DIGIVOX_MINI_SL_COLD) },
> +	[7]  =3D	{ USB_DEVICE(USB_VID_EMPIA,		USB_PID_DIGIVOX_MINI_SL_WARM) },
> +	[8]  =3D	{ USB_DEVICE(USB_VID_GRANDTEC,          USB_PID_GRANDTEC_DVBT_=
USB2_COLD) },
> +	[9]  =3D	{ USB_DEVICE(USB_VID_GRANDTEC,          USB_PID_GRANDTEC_DVBT_=
USB2_WARM) },
> +	[10] =3D	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ARTEC_T14_COLD=
) },
> +	[11] =3D	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ARTEC_T14_WARM=
) },
> +	[12] =3D	{ USB_DEVICE(USB_VID_LEADTEK,		USB_PID_WINFAST_DTV_DONGLE_COLD=
) },
> +	[13] =3D	{ USB_DEVICE(USB_VID_LEADTEK,		USB_PID_WINFAST_DTV_DONGLE_WARM=
) },
> +	[14] =3D	{ USB_DEVICE(USB_VID_HUMAX_COEX,	USB_PID_DVB_T_USB_STICK_HIGH_=
SPEED_COLD) },
> +	[15] =3D	{ USB_DEVICE(USB_VID_HUMAX_COEX,	USB_PID_DVB_T_USB_STICK_HIGH_=
SPEED_WARM) },
> +			   { }		/* Terminating entry */
>  };
>  MODULE_DEVICE_TABLE (usb, dibusb_dib3000mc_table);
> =20



Thanks,
Mauro
