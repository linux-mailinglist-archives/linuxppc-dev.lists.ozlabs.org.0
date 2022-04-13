Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B91A64FFE21
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 20:47:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kds5S4xtRz3bk9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Apr 2022 04:47:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HifCVjTy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HifCVjTy; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kds4p2dfrz2xsb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Apr 2022 04:46:34 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 58058619FC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 18:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE425C385A9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 18:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649875589;
 bh=ysrPtaTYb8EyW5VHJIP8kmaecK5XOai6g/Tx5uvuzMc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HifCVjTyYmnCyys0GagMzajpFi5s2br8b7c+XHv7DHYIJzrdFhnAbBf3FkZu3qSWP
 s17MFMgODFGfpkBV5AscPelCEh6z0AhZgHVzb9rbTw/jrao+66i+tH/JLlcBF2kVXQ
 KTctZBJL3Q1a7/12vV6yV9E4S3g+SXq6W2qPxQliijDSkdF1sA9+98+beDedPiCOua
 A7qtMNXhn1Qysd/O9HOH0mIQfCarGoETMkb3v/Gox0CQEbmKoLUoKLjxO/13qnmuip
 kSC2loFpBokA9hshSpQ3RaojFDk8A9Gw6Rck9OwXpeFMZAGhtl0WYRH6CjSXryMQh7
 OyrSBCBCfTzVg==
Received: by mail-io1-f41.google.com with SMTP id 9so2927182iou.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 11:46:29 -0700 (PDT)
X-Gm-Message-State: AOAM532038+V+cybb//mwF8H5HS7R5Uzf3sQzTgpiepi6IW+vlr4DMTw
 xN1fMDFjmxbdTwng9zy0mLRYrUlMqbvHp9695w==
X-Google-Smtp-Source: ABdhPJxBoCyvmmSYBlR3CPMXkWfpbJbFlu0q65XwYXKzyqlRpm9qS1dexycZeKMQZVXe6ksNkSG9HXnYOujJ9Kbb334=
X-Received: by 2002:a02:1107:0:b0:321:78dc:890d with SMTP id
 7-20020a021107000000b0032178dc890dmr22807402jaf.236.1649875588926; Wed, 13
 Apr 2022 11:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220413092454.1073-1-tzimmermann@suse.de>
 <20220413092454.1073-2-tzimmermann@suse.de>
 <CAL_JsqK4oT47Q=XFTZ0a=g3-DiB1JsW7_j9M1qRzpeahhz0muA@mail.gmail.com>
 <b31df06c-6cce-37dd-5ec1-661fdc8151da@suse.de>
In-Reply-To: <b31df06c-6cce-37dd-5ec1-661fdc8151da@suse.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 13 Apr 2022 13:46:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJdYjd=P4Nhd9E+=OjOb2A-=_txBUtWsDL1FWqZ0phD+g@mail.gmail.com>
Message-ID: <CAL_JsqJdYjd=P4Nhd9E+=OjOb2A-=_txBUtWsDL1FWqZ0phD+g@mail.gmail.com>
Subject: Re: [PATCH 1/2] of: Create platform devices for OF framebuffers
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Helge Deller <deller@gmx.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Paul Mackerras <paulus@samba.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 13, 2022 at 12:58 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 13.04.22 um 14:51 schrieb Rob Herring:
> > On Wed, Apr 13, 2022 at 4:24 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>
> >> Create a platform device for each OF-declared framebuffer and have
> >> offb bind to these devices. Allows for real hot-unplugging and other
> >> drivers besides offb.
> >>
> >> Originally, offb created framebuffer devices while initializing its
> >> module by parsing the OF device tree. No actual Linux device was set
> >> up. This tied OF framebuffers to offb and makes writing other drivers
> >> for the OF framebuffers complicated. The absence of a Linux device
> >> prevented real hot-unplugging. Adding a distinct platform device for
> >> each OF framebuffer solves both problems. Specifically, a DRM drivers
> >> can now provide graphics output with modern userspace.
> >>
> >> Some of the offb init code is now located in the OF initialization.
> >> There's now also an implementation of of_platform_default_populate_init(),
> >> which was missing before. The OF side creates different devices for
> >> either OF display nodes or bootx displays as they require different
> >> handling by the driver. The offb drivers picks up each type of device
> >> and runs the appropriate fbdev initialization.
> >>
> >> Tested with OF display nodes on qemu's ppc64le target.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>   drivers/of/platform.c      | 73 ++++++++++++++++++++++++++--
> >>   drivers/video/fbdev/offb.c | 98 +++++++++++++++++++++++++-------------
> >>   2 files changed, 134 insertions(+), 37 deletions(-)
> >>
> >> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> >> index a16b74f32aa9..4c63b9a73587 100644
> >> --- a/drivers/of/platform.c
> >> +++ b/drivers/of/platform.c
> >> @@ -447,6 +447,60 @@ int of_platform_bus_probe(struct device_node *root,
> >>   }
> >>   EXPORT_SYMBOL(of_platform_bus_probe);
> >>
> >> +static int __init of_platform_populate_framebuffers(void)
> >> +{
> >> +       struct device_node *boot_display = NULL;
> >> +       struct device_node *node;
> >> +       struct platform_device *dev;
> >> +       int ret;
> >> +
> >> +       node = of_get_compatible_child(of_chosen, "simple-framebuffer");
> >> +       of_platform_device_create(node, NULL, NULL);
> >> +       of_node_put(node);
> >> +
> >
> > The rest is PPC only, so bail out here if !PPC.
> >
> >> +       /* Check if we have a MacOS display without a node spec */
> >> +       if (of_get_property(of_chosen, "linux,bootx-noscreen", NULL)) {
> >> +               /*
> >> +                * The old code tried to work out which node was the MacOS
> >> +                * display based on the address. I'm dropping that since the
> >> +                * lack of a node spec only happens with old BootX versions
> >> +                * (users can update) and with this code, they'll still get
> >> +                * a display (just not the palette hacks).
> >> +                */
> >> +               dev = platform_device_alloc("bootx-noscreen", 0);
> >> +               if (WARN_ON(!dev))
> >> +                       return -ENOMEM;
> >> +               ret = platform_device_add(dev);
> >> +               if (WARN_ON(ret)) {
> >> +                       platform_device_put(dev);
> >> +                       return ret;
> >> +               }
> >> +       }
> >> +
> >> +       /*
> >> +        * For OF framebuffers, first create the device for the boot display,
> >> +        * then for the other framebuffers. Only fail for the boot display;
> >> +        * ignore errors for the rest.
> >> +        */
> >> +       for_each_node_by_type(node, "display") {
> >> +               if (!of_get_property(node, "linux,opened", NULL) ||
> >> +                   !of_get_property(node, "linux,boot-display", NULL))
> >> +                       continue;
> >> +               dev = of_platform_device_create(node, "of-display", NULL);
> >> +               if (WARN_ON(!dev))
> >> +                       return -ENOMEM;
> >> +               boot_display = node;
> >> +               break;
> >> +       }
> >> +       for_each_node_by_type(node, "display") {
> >> +               if (!of_get_property(node, "linux,opened", NULL) || node == boot_display)
> >> +                       continue;
> >> +               of_platform_device_create(node, "of-display", NULL);
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >> +
> >>   /**
> >>    * of_platform_populate() - Populate platform_devices from device tree data
> >>    * @root: parent of the first level to probe or NULL for the root of the tree
> >> @@ -541,9 +595,7 @@ static int __init of_platform_default_populate_init(void)
> >>                  of_node_put(node);
> >>          }
> >>
> >> -       node = of_get_compatible_child(of_chosen, "simple-framebuffer");
> >> -       of_platform_device_create(node, NULL, NULL);
> >> -       of_node_put(node);
> >> +       of_platform_populate_framebuffers();
> >>
> >>          /* Populate everything else. */
> >>          of_platform_default_populate(NULL, NULL, NULL);
> >
> > I'm pretty sure it's just this call that's the problem for PPC though
> > none of the above existed when adding this caused a regression. Can we
> > remove the ifdef and just make this call conditional on
> > !IS_ENABLED(CONFIG_PPC).
>
> Together with the changes in of_platform_populate_framebuffers(), the
> code is more or less an "if-else" depending on PPC. I'll drop
> of_platform_populate_framebuffers() from the patch and make a separate
> implementation of of_platform_default_populate_init for PPC. Seems like
> the easiest solution to me.

That just moves us farther from PPC ever using
of_platform_default_populate_init(). But I don't know that anyone in
PPC cares about that, so fine I guess.

Rob
