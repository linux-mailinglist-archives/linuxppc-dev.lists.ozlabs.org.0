Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BFB4E8354
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 19:28:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQnWz0bWTz3bSh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 05:28:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=faKaYvsq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=mchehab@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=faKaYvsq; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQnWK262xz2yHc
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 05:27:41 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BFD4DB80AEB;
 Sat, 26 Mar 2022 18:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0903C340ED;
 Sat, 26 Mar 2022 18:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648319255;
 bh=6A9geVN7hz7JjWyGpdDgRTCPZVGMU3xykfJX5UwPGRA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=faKaYvsqHjsnHgOEciNLdiDiMhorx0X+bUTo59SGODwMlJddNYfplHnsXf0sU549w
 4ANwwCKF51V/9DaY3tom5RG3qfXD0QmS81y/3TXn3mm08ex8+fEjeMjuoXBDMJqLl+
 0AI3DuVVzhmkWCg6OlTolBQjOdL0oAMNlz0VfcIYweNEzhbTuRziQpSHSqJj+bIgYL
 R1s6AHzJAsNzqkQNMB+azLZqK4aVjRoZovlNyCbRaVd+mrLcguckEHmPkxU6NbLTv/
 9ozRB76LLhEhA9uotDvzkuJtxWtMjiBvC8EJVK380hmOMVs4aHnXPQ75rK4aP5xD5n
 j+IsdIUf+nLBw==
Date: Sat, 26 Mar 2022 19:27:20 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Benjamin =?UTF-8?B?U3TDvHJ6?= <benni@stuerz.xyz>
Subject: Re: [PATCH 16/22] dvb-usb: Replace comments with C99 initializers
Message-ID: <20220326192720.0fddd6dd@coco.lan>
In-Reply-To: <20220326192454.14115baa@coco.lan>
References: <20220326165909.506926-1-benni@stuerz.xyz>
 <20220326165909.506926-16-benni@stuerz.xyz>
 <20220326192454.14115baa@coco.lan>
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

Em Sat, 26 Mar 2022 19:24:54 +0100
Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:

> Em Sat, 26 Mar 2022 17:59:03 +0100
> Benjamin St=C3=BCrz <benni@stuerz.xyz> escreveu:
>=20
> > This replaces comments with C99's designated
> > initializers because the kernel supports them now.
> >=20
> > Signed-off-by: Benjamin St=C3=BCrz <benni@stuerz.xyz>
> > ---
> >  drivers/media/usb/dvb-usb/dibusb-mb.c | 62 +++++++++++++--------------
> >  drivers/media/usb/dvb-usb/dibusb-mc.c | 34 +++++++--------
> >  2 files changed, 48 insertions(+), 48 deletions(-)
> >=20
> > diff --git a/drivers/media/usb/dvb-usb/dibusb-mb.c b/drivers/media/usb/=
dvb-usb/dibusb-mb.c
> > index e9dc27f73970..f188e07f518b 100644
> > --- a/drivers/media/usb/dvb-usb/dibusb-mb.c
> > +++ b/drivers/media/usb/dvb-usb/dibusb-mb.c
> > @@ -122,40 +122,40 @@ static int dibusb_probe(struct usb_interface *int=
f,
> > =20
> >  /* do not change the order of the ID table */
> >  static struct usb_device_id dibusb_dib3000mb_table [] =3D {
> > -/* 00 */	{ USB_DEVICE(USB_VID_WIDEVIEW,		USB_PID_AVERMEDIA_DVBT_USB_CO=
LD) },
> > -/* 01 */	{ USB_DEVICE(USB_VID_WIDEVIEW,		USB_PID_AVERMEDIA_DVBT_USB_WA=
RM) },
> > -/* 02 */	{ USB_DEVICE(USB_VID_COMPRO,		USB_PID_COMPRO_DVBU2000_COLD) },
> > -/* 03 */	{ USB_DEVICE(USB_VID_COMPRO,		USB_PID_COMPRO_DVBU2000_WARM) },
> > -/* 04 */	{ USB_DEVICE(USB_VID_COMPRO_UNK,	USB_PID_COMPRO_DVBU2000_UNK_=
COLD) },
> > -/* 05 */	{ USB_DEVICE(USB_VID_DIBCOM,		USB_PID_DIBCOM_MOD3000_COLD) },
> > -/* 06 */	{ USB_DEVICE(USB_VID_DIBCOM,		USB_PID_DIBCOM_MOD3000_WARM) },
> > -/* 07 */	{ USB_DEVICE(USB_VID_EMPIA,		USB_PID_KWORLD_VSTREAM_COLD) },
> > -/* 08 */	{ USB_DEVICE(USB_VID_EMPIA,		USB_PID_KWORLD_VSTREAM_WARM) },
> > -/* 09 */	{ USB_DEVICE(USB_VID_GRANDTEC,		USB_PID_GRANDTEC_DVBT_USB_COL=
D) },
> > -/* 10 */	{ USB_DEVICE(USB_VID_GRANDTEC,		USB_PID_GRANDTEC_DVBT_USB_WAR=
M) },
> > -/* 11 */	{ USB_DEVICE(USB_VID_GRANDTEC,		USB_PID_DIBCOM_MOD3000_COLD) =
},
> > -/* 12 */	{ USB_DEVICE(USB_VID_GRANDTEC,		USB_PID_DIBCOM_MOD3000_WARM) =
},
> > -/* 13 */	{ USB_DEVICE(USB_VID_HYPER_PALTEK,	USB_PID_UNK_HYPER_PALTEK_C=
OLD) },
> > -/* 14 */	{ USB_DEVICE(USB_VID_HYPER_PALTEK,	USB_PID_UNK_HYPER_PALTEK_W=
ARM) },
> > -/* 15 */	{ USB_DEVICE(USB_VID_VISIONPLUS,	USB_PID_TWINHAN_VP7041_COLD)=
 },
> > -/* 16 */	{ USB_DEVICE(USB_VID_VISIONPLUS,	USB_PID_TWINHAN_VP7041_WARM)=
 },
> > -/* 17 */	{ USB_DEVICE(USB_VID_TWINHAN,		USB_PID_TWINHAN_VP7041_COLD) },
> > -/* 18 */	{ USB_DEVICE(USB_VID_TWINHAN,		USB_PID_TWINHAN_VP7041_WARM) },
> > -/* 19 */	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_=
COLD) },
> > -/* 20 */	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_=
WARM) },
> > -/* 21 */	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_=
AN2235_COLD) },
> > -/* 22 */	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_=
AN2235_WARM) },
> > -/* 23 */	{ USB_DEVICE(USB_VID_ADSTECH,		USB_PID_ADSTECH_USB2_COLD) },
> > +[0]  =3D	{ USB_DEVICE(USB_VID_WIDEVIEW,		USB_PID_AVERMEDIA_DVBT_USB_CO=
LD) },
> > +[1]  =3D	{ USB_DEVICE(USB_VID_WIDEVIEW,		USB_PID_AVERMEDIA_DVBT_USB_WA=
RM) }, =20
>=20
> While here, please properly indent this table, and respect the 80-columns=
 limit,
> e. g.:
>=20
> static struct usb_device_id dibusb_dib3000mb_table [] =3D {
> 	[0] =3D { USB_DEVICE(USB_VID_WIDEVIEW=20
> 			   USB_PID_AVERMEDIA_DVBT_USB_COLD)=20
> 	},
> 	[1]  =3D	{ USB_DEVICE(USB_VID_WIDEVIEW,
> 			     USB_PID_AVERMEDIA_DVBT_USB_WARM)
> 	},
> 	...

Err.... something went wrong with my space bar and I ended hitting send to
soon... I meant:

static struct usb_device_id dibusb_dib3000mb_table [] =3D {
 	[0] =3D { USB_DEVICE(USB_VID_WIDEVIEW=20
 			   USB_PID_AVERMEDIA_DVBT_USB_COLD)=20
 	},
 	[1] =3D { USB_DEVICE(USB_VID_WIDEVIEW,
 			   USB_PID_AVERMEDIA_DVBT_USB_WARM)
 	},
	...
};

Thanks,
Mauro
