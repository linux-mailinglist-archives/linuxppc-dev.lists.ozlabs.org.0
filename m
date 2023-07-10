Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AAE74D89C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 16:09:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R05Tr719yz3c84
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 00:09:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R05TJ44wFz2yxK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 00:08:52 +1000 (AEST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1qIrYc-0018bo-NE; Mon, 10 Jul 2023 16:08:06 +0200
Received: from p57bd95f7.dip0.t-ipconnect.de ([87.189.149.247] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1qIrYc-001ne7-Et; Mon, 10 Jul 2023 16:08:06 +0200
Message-ID: <268cf09b42a5ad6f1edb30b6d237f31174b85abb.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 08/17] arch/sh: Do not assign FBINFO_FLAG_DEFAULT to
 fb_videomode.flag
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 javierm@redhat.com
Date: Mon, 10 Jul 2023 16:08:05 +0200
In-Reply-To: <b9fe2f32-f4f6-6158-267a-da83b731b794@suse.de>
References: <20230710130113.14563-1-tzimmermann@suse.de>
	 <20230710130113.14563-9-tzimmermann@suse.de>
	 <0a47ed93fe90a77180533f8c2e42e402827e8f1c.camel@physik.fu-berlin.de>
	 <54e3e070-52fb-9ccb-bc47-0f41690f6bfa@suse.de>
	 <536cc8c679cc68829c8662176ff02a9052249a46.camel@physik.fu-berlin.de>
	 <b9fe2f32-f4f6-6158-267a-da83b731b794@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.149.247
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org, Yoshinori Sato <ysato@users.sourceforge.jp>, dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Mon, 2023-07-10 at 16:04 +0200, Thomas Zimmermann wrote:
> > > I won't argue with that, but the flag itself is wrong.
> > > FBINFO_FLAG_DEFAULT is/was for struct fb_info.flags. You have struct
> > > fb_videomode.flag. The valid flags for this field are at [1]. If
> > > anything, the field could be initialized to FB_MODE_IS_UNKNOWN, which
> > > has the same value.
> > >=20
> > > [1] https://elixir.bootlin.com/linux/latest/source/include/linux/fb.h=
#L681
> >=20
> > FB_MODE_IS_UNKNOWN sounds very reasonable to me. Would you agree using =
that instead?
>=20
> Sure, I'll update the patch accordingly.

Thanks! I'll ack the updated patch.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
