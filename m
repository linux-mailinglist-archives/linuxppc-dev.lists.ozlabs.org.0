Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 785B652F75D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 03:41:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4mXB2bKDz3bnP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 11:41:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4L4mWj2Rk5z305M
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 May 2022 11:40:47 +1000 (AEST)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 24L1ZFqO002400;
 Fri, 20 May 2022 20:35:16 -0500
Message-ID: <ea7ef1e652f5664a41f2befc3cb97bd089f27e69.camel@kernel.crashing.org>
Subject: Re: [PATCH 2/2] drm/tiny: Add ofdrm for Open Firmware framebuffers
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Michal
 =?ISO-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Date: Sat, 21 May 2022 11:35:14 +1000
In-Reply-To: <CAMuHMdUws2eJ4pHng4GD0PjuvMj5Hef_y_YyM4fUJV9xdUVuEQ@mail.gmail.com>
References: <20220518183006.14548-1-tzimmermann@suse.de>
 <20220518183006.14548-3-tzimmermann@suse.de>
 <20220518185156.GJ163591@kunlun.suse.cz>
 <CAMuHMdUws2eJ4pHng4GD0PjuvMj5Hef_y_YyM4fUJV9xdUVuEQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Helge Deller <deller@gmx.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-05-19 at 09:11 +0200, Geert Uytterhoeven wrote:
> Hi Michal,
> 
> 
> 
> On Wed, May 18, 2022 at 8:54 PM Michal Suchánek <msuchanek@suse.de>
> wrote:
> 
> > On Wed, May 18, 2022 at 08:30:06PM +0200, Thomas Zimmermann wrote:
> > > --- a/drivers/gpu/drm/tiny/Kconfig
> > > +++ b/drivers/gpu/drm/tiny/Kconfig
> > > @@ -51,6 +51,18 @@ config DRM_GM12U320
> > >         This is a KMS driver for projectors which use the
> > > GM12U320 chipset
> > >         for video transfer over USB2/3, such as the Acer C120
> > > mini projector.
> > > +config DRM_OFDRM
> > > +     tristate "Open Firmware display driver"
> > > +     depends on DRM && MMU && PPC
> > Does this build with !PCI?
> > The driver uses some PCI functions, so it might possibly break with
> > randconfig. I don't think there are practical !PCI PPC
> > configurations.
> 
> 
> IIRC, the first PowerMacs didn't have PCI.

They also don't have OF and we never supported them upstream :-)

Cheers,
Ben.

