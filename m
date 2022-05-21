Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5196B52F7C5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 04:55:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4p9c1HvVz3cf1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 12:55:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4L4p9C5sP6z306F
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 May 2022 12:54:55 +1000 (AEST)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 24L2nY8j004405;
 Fri, 20 May 2022 21:49:35 -0500
Message-ID: <615c93392bee43e92f0400cfa51957cd955091d3.camel@kernel.crashing.org>
Subject: Re: [PATCH 2/2] drm/tiny: Add ofdrm for Open Firmware framebuffers
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Michal =?ISO-8859-1?Q?Such=E1nek?=
 <msuchanek@suse.de>
Date: Sat, 21 May 2022 12:49:34 +1000
In-Reply-To: <29a8201d-3c0c-eeed-81af-92b351880702@suse.de>
References: <20220518183006.14548-1-tzimmermann@suse.de>
 <20220518183006.14548-3-tzimmermann@suse.de>
 <20220518185156.GJ163591@kunlun.suse.cz>
 <CAMuHMdUws2eJ4pHng4GD0PjuvMj5Hef_y_YyM4fUJV9xdUVuEQ@mail.gmail.com>
 <29a8201d-3c0c-eeed-81af-92b351880702@suse.de>
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
 David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-05-19 at 09:27 +0200, Thomas Zimmermann wrote:

> to build without PCI to see what happens.

If you bring any of the "heuristic" and palette support code in, you
need PCI. I don't see any reason to take it out.

> Those old Macs use BootX, right? BootX is not supported ATM, as I don't 
> have the HW to test. Is there an emulator for it?

It isn't ? When did it break ? :-)

> If anyone what's to make patches for BootX, I'd be happy to add them. 
> The offb driver also supports a number of special cases for palette 
> handling. That might be necessary for ofdrm as well.

The palette handling is useful when using a real Open Firmware
implementation which tends to boot in 8-bit mode, so without palette
things will look ... bad.

It's not necessary when using 16/32 bpp framebuffers which is typically
... what BootX provides :-)

Cheers,
Ben.

> Best regards
> Thomas
> 
> > Gr{oetje,eeting}s,
> > 
> >                          Geert
> > 
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> > 
> > In personal conversations with technical people, I call myself a hacker. But
> > when I'm talking to journalists I just say "programmer" or something like that.
> >                                  -- Linus Torvalds
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev

