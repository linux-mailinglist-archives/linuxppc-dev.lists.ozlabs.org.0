Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C72B4E84FA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 04:04:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQzfc1dQcz3bll
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 13:04:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=relay3.hostedemail.com (client-ip=64.99.140.32;
 helo=relay3.hostedemail.com; envelope-from=joe@perches.com;
 receiver=<UNKNOWN>)
Received: from relay3.hostedemail.com (relay3.hostedemail.com [64.99.140.32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQqP370k5z2xZb
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 06:52:22 +1100 (AEDT)
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay10.hostedemail.com (Postfix) with ESMTP id D0E247BD;
 Sat, 26 Mar 2022 19:52:14 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf03.hostedemail.com (Postfix) with ESMTPA id AC5446000E; 
 Sat, 26 Mar 2022 19:51:45 +0000 (UTC)
Message-ID: <63a5e3143e904d1391490f27cc106be894b52ca2.camel@perches.com>
Subject: Re: [PATCH 16/22] dvb-usb: Replace comments with C99 initializers
From: Joe Perches <joe@perches.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Benjamin
 =?ISO-8859-1?Q?St=FCrz?= <benni@stuerz.xyz>
Date: Sat, 26 Mar 2022 12:51:44 -0700
In-Reply-To: <20220326192720.0fddd6dd@coco.lan>
References: <20220326165909.506926-1-benni@stuerz.xyz>
 <20220326165909.506926-16-benni@stuerz.xyz>
 <20220326192454.14115baa@coco.lan> <20220326192720.0fddd6dd@coco.lan>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: AC5446000E
X-Spam-Status: No, score=1.52
X-Stat-Signature: r3baboadgyrzf5ohpo734it1c55f35b4
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+HneiPuDhf7afikiha+wr4gJKHMUaJQO0=
X-HE-Tag: 1648324305-593106
X-Mailman-Approved-At: Sun, 27 Mar 2022 13:03:21 +1100
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

On Sat, 2022-03-26 at 19:27 +0100, Mauro Carvalho Chehab wrote:
> Em Sat, 26 Mar 2022 19:24:54 +0100
> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> 
> > Em Sat, 26 Mar 2022 17:59:03 +0100
> > Benjamin Stürz <benni@stuerz.xyz> escreveu:
> > 
> > > This replaces comments with C99's designated
> > > initializers because the kernel supports them now.
> > > 
> > > Signed-off-by: Benjamin Stürz <benni@stuerz.xyz>
> > > ---
> > >  drivers/media/usb/dvb-usb/dibusb-mb.c | 62 +++++++++++++--------------
> > >  drivers/media/usb/dvb-usb/dibusb-mc.c | 34 +++++++--------
> > >  2 files changed, 48 insertions(+), 48 deletions(-)
> > > 
> > > diff --git a/drivers/media/usb/dvb-usb/dibusb-mb.c b/drivers/media/usb/dvb-usb/dibusb-mb.c
> > > index e9dc27f73970..f188e07f518b 100644
> > > --- a/drivers/media/usb/dvb-usb/dibusb-mb.c
> > > +++ b/drivers/media/usb/dvb-usb/dibusb-mb.c
> > > @@ -122,40 +122,40 @@ static int dibusb_probe(struct usb_interface *intf,
> > >  
> > >  /* do not change the order of the ID table */
> > >  static struct usb_device_id dibusb_dib3000mb_table [] = {
> > > -/* 00 */	{ USB_DEVICE(USB_VID_WIDEVIEW,		USB_PID_AVERMEDIA_DVBT_USB_COLD) },
> > > -/* 01 */	{ USB_DEVICE(USB_VID_WIDEVIEW,		USB_PID_AVERMEDIA_DVBT_USB_WARM) },
> > > -/* 02 */	{ USB_DEVICE(USB_VID_COMPRO,		USB_PID_COMPRO_DVBU2000_COLD) },
> > > -/* 03 */	{ USB_DEVICE(USB_VID_COMPRO,		USB_PID_COMPRO_DVBU2000_WARM) },
> > > -/* 04 */	{ USB_DEVICE(USB_VID_COMPRO_UNK,	USB_PID_COMPRO_DVBU2000_UNK_COLD) },
> > > -/* 05 */	{ USB_DEVICE(USB_VID_DIBCOM,		USB_PID_DIBCOM_MOD3000_COLD) },
> > > -/* 06 */	{ USB_DEVICE(USB_VID_DIBCOM,		USB_PID_DIBCOM_MOD3000_WARM) },
> > > -/* 07 */	{ USB_DEVICE(USB_VID_EMPIA,		USB_PID_KWORLD_VSTREAM_COLD) },
> > > -/* 08 */	{ USB_DEVICE(USB_VID_EMPIA,		USB_PID_KWORLD_VSTREAM_WARM) },
> > > -/* 09 */	{ USB_DEVICE(USB_VID_GRANDTEC,		USB_PID_GRANDTEC_DVBT_USB_COLD) },
> > > -/* 10 */	{ USB_DEVICE(USB_VID_GRANDTEC,		USB_PID_GRANDTEC_DVBT_USB_WARM) },
> > > -/* 11 */	{ USB_DEVICE(USB_VID_GRANDTEC,		USB_PID_DIBCOM_MOD3000_COLD) },
> > > -/* 12 */	{ USB_DEVICE(USB_VID_GRANDTEC,		USB_PID_DIBCOM_MOD3000_WARM) },
> > > -/* 13 */	{ USB_DEVICE(USB_VID_HYPER_PALTEK,	USB_PID_UNK_HYPER_PALTEK_COLD) },
> > > -/* 14 */	{ USB_DEVICE(USB_VID_HYPER_PALTEK,	USB_PID_UNK_HYPER_PALTEK_WARM) },
> > > -/* 15 */	{ USB_DEVICE(USB_VID_VISIONPLUS,	USB_PID_TWINHAN_VP7041_COLD) },
> > > -/* 16 */	{ USB_DEVICE(USB_VID_VISIONPLUS,	USB_PID_TWINHAN_VP7041_WARM) },
> > > -/* 17 */	{ USB_DEVICE(USB_VID_TWINHAN,		USB_PID_TWINHAN_VP7041_COLD) },
> > > -/* 18 */	{ USB_DEVICE(USB_VID_TWINHAN,		USB_PID_TWINHAN_VP7041_WARM) },
> > > -/* 19 */	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_COLD) },
> > > -/* 20 */	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_WARM) },
> > > -/* 21 */	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_AN2235_COLD) },
> > > -/* 22 */	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_AN2235_WARM) },
> > > -/* 23 */	{ USB_DEVICE(USB_VID_ADSTECH,		USB_PID_ADSTECH_USB2_COLD) },
> > > +[0]  =	{ USB_DEVICE(USB_VID_WIDEVIEW,		USB_PID_AVERMEDIA_DVBT_USB_COLD) },
> > > +[1]  =	{ USB_DEVICE(USB_VID_WIDEVIEW,		USB_PID_AVERMEDIA_DVBT_USB_WARM) },  
> > 
> > While here, please properly indent this table, and respect the 80-columns limit,
> > e. g.:
> > 
> > static struct usb_device_id dibusb_dib3000mb_table [] = {
> > 	[0] = { USB_DEVICE(USB_VID_WIDEVIEW 
> > 			   USB_PID_AVERMEDIA_DVBT_USB_COLD) 
> > 	},
> > 	[1]  =	{ USB_DEVICE(USB_VID_WIDEVIEW,
> > 			     USB_PID_AVERMEDIA_DVBT_USB_WARM)
> > 	},
> > 	...
> 
> Err.... something went wrong with my space bar and I ended hitting send to
> soon... I meant:
> 
> static struct usb_device_id dibusb_dib3000mb_table [] = {
>  	[0] = { USB_DEVICE(USB_VID_WIDEVIEW 
>  			   USB_PID_AVERMEDIA_DVBT_USB_COLD) 
>  	},
>  	[1] = { USB_DEVICE(USB_VID_WIDEVIEW,
>  			   USB_PID_AVERMEDIA_DVBT_USB_WARM)
>  	},
> 	...
> };

maybe static const too

and

maybe

#define DIB_DEVICE(vid, pid)	\
	{ USB_DEVICE(USB_VID_ ## vid, USB_PID_ ## pid) }

so maybe

static const struct usb_device_id dibusb_dib3000mb_table[] = {
	[0] = DIB_DEVICE(WIDEVIEW, AVERMEDIA_DVBT_USB_COLD),
	[1] = DIB_DEVICE(WIDEVIEW, AVERMEDIA_DVBT_USB_WARM),
	...
};

though I _really_ doubt the value of the specific indexing.

I think this isn't really worth changing at all.


