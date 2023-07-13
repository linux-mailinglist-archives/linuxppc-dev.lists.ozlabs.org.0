Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFBC75246A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 15:57:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1x4M1jNTz3c51
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 23:57:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1x3t30NPz2yyg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 23:56:42 +1000 (AEST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1qJwo0-003uyK-7j; Thu, 13 Jul 2023 15:56:28 +0200
Received: from p57bd9f0d.dip0.t-ipconnect.de ([87.189.159.13] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1qJwnz-002qWA-Vd; Thu, 13 Jul 2023 15:56:28 +0200
Message-ID: <6d04a1b87a9820d8ae23191092665f2dcb17ce19.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v2 08/18] sh: Assign FB_MODE_IS_UNKNOWN to struct
 fb_videomode.flag
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 javierm@redhat.com
Date: Thu, 13 Jul 2023 15:56:26 +0200
In-Reply-To: <4622810f8bceb66f212fa09d34b10f0d2d71a35d.camel@physik.fu-berlin.de>
References: <20230713130338.31086-1-tzimmermann@suse.de>
	 <20230713130338.31086-9-tzimmermann@suse.de>
	 <4622810f8bceb66f212fa09d34b10f0d2d71a35d.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.159.13
X-ZEDAT-Hint: PO
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org, Yoshinori Sato <ysato@users.sourceforge.jp>, dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Thomas!

On Thu, 2023-07-13 at 15:53 +0200, John Paul Adrian Glaubitz wrote:
> On Thu, 2023-07-13 at 14:58 +0200, Thomas Zimmermann wrote:
> > Assign FB_MODE_IS_UNKNOWN to sh7763fb_videomode.flag instead of
> > FBINFO_FLAG_DEFAULT. Both are 0, so the stored value does not change.
> >=20
> > FBINFO_FLAG_DEFAULT is a flag for a framebuffer in struct fb_info.
> > Flags for videomodes are prefixed with FB_MODE_.
> >=20
> > v2:
> > 	* assign FB_MODE_IS_UNKNOWN (Adrian)
> >=20
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> > Cc: Rich Felker <dalias@libc.org>
> > Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> > ---
> >  arch/sh/boards/mach-sh7763rdp/setup.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/sh/boards/mach-sh7763rdp/setup.c b/arch/sh/boards/mac=
h-sh7763rdp/setup.c
> > index 97e715e4e9b3..e25193001ea0 100644
> > --- a/arch/sh/boards/mach-sh7763rdp/setup.c
> > +++ b/arch/sh/boards/mach-sh7763rdp/setup.c
> > @@ -119,7 +119,7 @@ static struct fb_videomode sh7763fb_videomode =3D {
> >  	.vsync_len =3D 1,
> >  	.sync =3D 0,
> >  	.vmode =3D FB_VMODE_NONINTERLACED,
> > -	.flag =3D FBINFO_FLAG_DEFAULT,
> > +	.flag =3D FB_MODE_IS_UNKNOWN,
> >  };
> > =20
> >  static struct sh7760fb_platdata sh7763fb_def_pdata =3D {
>=20
> Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Ah, just one tiny request: Could you change the subject to include the
board name, i.e.:

	sh: mach-sh7763rdp: Assign FB_MODE_IS_UNKNOWN to struct fb_videomode.flag

?

I wasn't paying close attention to the path of the file being changed when
I first looked at your patch. Sorry for that.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
