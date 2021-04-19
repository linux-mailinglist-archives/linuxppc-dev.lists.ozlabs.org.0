Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1668364F92
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 02:42:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPPyr5FvJz302D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 10:42:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=atmark-techno.com (client-ip=13.115.124.170;
 helo=gw.atmark-techno.com; envelope-from=dominique.martinet@atmark-techno.com;
 receiver=<UNKNOWN>)
Received: from gw.atmark-techno.com (gw.atmark-techno.com [13.115.124.170])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FPNfn5gs5z2xZt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 09:43:11 +1000 (AEST)
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 by gw.atmark-techno.com (Postfix) with ESMTPS id BC2CB804CA
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 08:43:09 +0900 (JST)
Received: by mail-oi1-f198.google.com with SMTP id
 s9-20020acadb090000b0290101bacefaa4so12259265oig.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 16:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YfTDNxUjME1kzwn4ONpBlmaWp5uEs0PGjlewRbiJ8O0=;
 b=NpLdI0/B3EJg0dK0LMy5hUyT+HlDRboSqM6F0ZKUHp9sLTE6QpiqZ7toe5QKJNy+6q
 DwbZLB/Tk3guTkTizqN/lBpBo8pYT5u5+xxGUrkrP0LWqwMJKt6IXZp8G6yzAOl2POoh
 vV5HBmnNEbQ4Nm+j4Yo/y5ZI/9s6KOwxwevTmt+vH+eA9raauJDdO/9nH98U41xbvyMX
 R0Vy2rVSnh4RSGDbXsd/THH0yt/J7TLUxUCkSxOIURQcRmyUYiahCB6Bat3z7o7W4CuU
 kFZ2wlFGq35m+J/CnD38Rk2Bvg94z+gY9J+ImL6nutHH0OUwD3BUuKzRvsxho00yaTli
 8mKA==
X-Gm-Message-State: AOAM531gjUbc03GjGINppqo/NDUQO4lhfW2Z2Q5aIJIZAO9SreifCEKA
 bOxvGuWlNEhI9vvFIpRjtMZ2CI9qHT1FAP6PiKFcJEL4OQ8RRJkZY9NvxiR9WaTabLWcpeYBiH/
 D2S3iG36UPWX78PW3BTr8lFsS7kzh8A==
X-Received: by 2002:a17:90a:1c1:: with SMTP id 1mr1708187pjd.190.1618875776933; 
 Mon, 19 Apr 2021 16:42:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRGNIqy2AO5m9iOwuC4N09BxordE8LmUXYTIIeyniOtbCQKfA0MKaQl391n1ZLV3YIJOra8w==
X-Received: by 2002:a17:90a:1c1:: with SMTP id 1mr1708139pjd.190.1618875776711; 
 Mon, 19 Apr 2021 16:42:56 -0700 (PDT)
Received: from pc-0115 (76.125.194.35.bc.googleusercontent.com.
 [35.194.125.76])
 by smtp.gmail.com with ESMTPSA id r3sm8384971pgn.82.2021.04.19.16.42.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Apr 2021 16:42:55 -0700 (PDT)
Received: from martinet by pc-0115 with local (Exim 4.94)
 (envelope-from <martinet@pc-0115>)
 id 1lYdXa-002mPj-58; Tue, 20 Apr 2021 08:42:54 +0900
Date: Tue, 20 Apr 2021 08:42:44 +0900
From: Dominique MARTINET <dominique.martinet@atmark-techno.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC v1 PATCH 3/3] driver: update all the code that use
 soc_device_match
Message-ID: <YH4VdPNO9cdzc5MD@atmark-techno.com>
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-4-alice.guo@oss.nxp.com>
 <YH0O907dfGY9jQRZ@atmark-techno.com>
 <CAMuHMdVY1SLZ0K30T2pimyrR6Mm=VoSTO=L-xxCy2Bj7_kostw@mail.gmail.com>
 <YH1OeFy+SepIYYG0@atmark-techno.com>
 <CAK8P3a1Mu2F0irDDCL-50HiHth29iYFL5b7WHZ=UX6W7zzoxAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a1Mu2F0irDDCL-50HiHth29iYFL5b7WHZ=UX6W7zzoxAg@mail.gmail.com>
X-Mailman-Approved-At: Tue, 20 Apr 2021 10:41:52 +1000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, aymen.sghaier@nxp.com,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Rafael Wysocki <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Networking <netdev@vger.kernel.org>,
 linux-phy@lists.infradead.org, peter.ujfalusi@gmail.com,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
 Kevin Hilman <khilman@baylibre.com>, Joerg Roedel <joro@8bytes.org>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-staging@lists.linux.dev,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Kishon <kishon@ti.com>, Tony Lindgren <tony@atomide.com>,
 linux-omap <linux-omap@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Jakub Kicinski <kuba@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Guenter Roeck <linux@roeck-us.net>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Eduardo Valentin <edubezval@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Alice Guo \(OSS\)" <alice.guo@oss.nxp.com>, Felipe Balbi <balbi@kernel.org>,
 tomba@kernel.org, Stephen Boyd <sboyd@kernel.org>,
 gregkh <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>,
 USB list <linux-usb@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Robert Foss <robert.foss@linaro.org>,
 Leo Li <leoyang.li@nxp.com>, Tony Prisk <linux@prisktech.co.nz>,
 Vinod Koul <vkoul@kernel.org>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Keerthy <j-keerthy@ti.com>, dmaengine@vger.kernel.org,
 Roy Pledge <Roy.Pledge@nxp.com>, jyri.sarha@iki.fi,
 David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnd Bergmann wrote on Mon, Apr 19, 2021 at 02:16:36PM +0200:
> In some cases, you can use the device_link infrastructure to deal
> with dependencies between devices. Not sure if this would help
> in your case, but have a look at device_link_add() etc in drivers/base/core.c

I'll need to actually try to convince myself but if creating the link
forces driver registration then it should be workable.

> > In this particular case the problem is that since 7d981405d0fd ("soc:
> > imx8m: change to use platform driver") the soc probe tries to use the
> > nvmem driver for ocotp fuses for imx8m devices, which isn't ready yet.
> > So soc loading gets pushed back to the end of the list because it gets
> > defered and other drivers relying on soc_device_match get confused
> > because they wrongly think a device doesn't match a quirk when it
> > actually does.
> >
> > If there is a way to ensure the nvmem driver gets loaded before the soc,
> > that would also solve the problem nicely, and avoid the need to mess
> > with all the ~50 drivers which use it.
> >
> > Is there a way to control in what order drivers get loaded? Something in
> > the dtb perhaps?
> 
> For built-in drivers, load order depends on the initcall level and
> link order (how things are lined listed in the Makefile hierarchy).
> 
> For loadable modules, this is up to user space in the end.
> 
> Which of the drivers in this scenario are loadable modules?

All the drivers involved in my case are built-in (nvmem, soc and final
soc_device_match consumer e.g. caam_jr that crashes the kernel if soc is
not identified properly).

I frankly don't like the idea of moving nvmem/ above soc/ in
drivers/Makefile as a "solution" to this (especially as there is one
that seems to care about what soc they run on...), so I'll have a look
at links first, hopefully that will work out.


Thanks,
-- 
Dominique
