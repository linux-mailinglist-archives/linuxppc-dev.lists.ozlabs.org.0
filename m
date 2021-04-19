Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B02364224
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 15:00:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP6Nd1B2Sz30HW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 23:00:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP5RB1XQtz2xYd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 22:17:09 +1000 (AEST)
Received: from mail-ej1-f46.google.com ([209.85.218.46]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N5CMP-1lfv3q1lLR-011DHD for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr
 2021 14:17:03 +0200
Received: by mail-ej1-f46.google.com with SMTP id v6so51270470ejo.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 05:17:02 -0700 (PDT)
X-Gm-Message-State: AOAM53188vvapMT83ADkci9QKKN9Utlxq/SUVlBFQAFg2ffIJI/Ap3R7
 jEFQFkwTsL+pZiMfdMGS9F2jyAzxuVoWF0Bid2o=
X-Google-Smtp-Source: ABdhPJw4F20QerTwfst1rAMwc6NWiXDSUWeUkZ8E4j2sezaYrIv6atAni45jIwUzsYws7AyLO9D3pu8QFGIGztgXd7o=
X-Received: by 2002:a05:6000:1843:: with SMTP id
 c3mr14679907wri.361.1618834612186; 
 Mon, 19 Apr 2021 05:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-4-alice.guo@oss.nxp.com>
 <YH0O907dfGY9jQRZ@atmark-techno.com>
 <CAMuHMdVY1SLZ0K30T2pimyrR6Mm=VoSTO=L-xxCy2Bj7_kostw@mail.gmail.com>
 <YH1OeFy+SepIYYG0@atmark-techno.com>
In-Reply-To: <YH1OeFy+SepIYYG0@atmark-techno.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 19 Apr 2021 14:16:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Mu2F0irDDCL-50HiHth29iYFL5b7WHZ=UX6W7zzoxAg@mail.gmail.com>
Message-ID: <CAK8P3a1Mu2F0irDDCL-50HiHth29iYFL5b7WHZ=UX6W7zzoxAg@mail.gmail.com>
Subject: Re: [RFC v1 PATCH 3/3] driver: update all the code that use
 soc_device_match
To: Dominique MARTINET <dominique.martinet@atmark-techno.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:bFav/xEC3Tj835Cs0Gs5YB0Fs1KJY/yqkTcaiEmKQtB8CaAMoDY
 WfkzN03ANEaPa9dwmD+Oujq1iG9Im6/WwtXQIWARul5N7fwwSUPcwZmEu273i1vKFYJ93gz
 WkXW4Iujfq6IuYWu0A2AgHfHznwjRMCSZudaF0D+GvRrAj/TFcLX4oyIjIuIdOQ9asWKgqX
 ukogxUiYDhFObQoaBiNRw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MTagkLDkmls=:ADvznjIkuHV9jc9bNiGULr
 oNjC+1Ps6SD3sCYAB/aoRxiN4GI5y0/ewJbIPr3MSzGIGq7XF5OWnF2ktZRwY8ujo29Tm8dpb
 rsNwxBQguOb/EoWEFSRsRH2wmuB1+P5neiC4MOBQ8sQVCn1rCrXJy2d4rPhY+pWO1OEpdgsTD
 qydFUVsFhdQRejN3/5oM3TTVk+wNHhsrv8b5eIuPML4wN/gtCNuASex9rDbZHIYmA8nQrc2gJ
 Kd3Lp5RLmn26VCLC/M/wpr5Y6k5iIjo9hxIK69C9lBUzOxLLywYvqJdUH1J62OmCVJ4P4pr9C
 Rx1HCCQYcfF6p6sTUZICN8bttzT1Qg0rClIzsyqLaFSDOj0PXFqIudL33MsUfXyu/whiTF4qq
 A0iAsh3pECvMYHNFVa7Xnmls6pbj/naIu3chfPhzzDA+YVlFeL08BWY/qW/M7kr1mWSwEdanm
 bAOt7RFfdAub4WblUzNKHOUsvabSWizRrXYBWShIUErQlp5rLKNk72CJnsM+MLa+CUieYO4dX
 t9l9f8dVMN0VZEPi/DiUOW2neH5qZBqVgodB4UM/EkQv/fZh0j5TZdPeavJZT4IaevqCOPzCT
 Oj4FP4C7osvADoCDv1I8YU/AzQxz5+PVSQsMd79K3EbPC7IHMMe+AI/98jlSaGH43AEY3OXdX
 +hPA=
X-Mailman-Approved-At: Mon, 19 Apr 2021 22:59:43 +1000
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
 =?UTF-8?Q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>,
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

On Mon, Apr 19, 2021 at 11:33 AM Dominique MARTINET
<dominique.martinet@atmark-techno.com> wrote:
> Geert Uytterhoeven wrote on Mon, Apr 19, 2021 at 11:03:24AM +0200:
>
> > soc_device_match() should only be used as a last resort, to identify
> > systems that cannot be identified otherwise.  Typically this is used for
> > quirks, which should only be enabled on a very specific subset of
> > systems.  IMHO such systems should make sure soc_device_match()
> > is available early, by registering their SoC device early.
>
> I definitely agree there, my suggestion to defer was only because I know
> of no other way to influence the ordering of drivers loading reliably
> and gave up on soc being init'd early.

In some cases, you can use the device_link infrastructure to deal
with dependencies between devices. Not sure if this would help
in your case, but have a look at device_link_add() etc in drivers/base/core.c

> In this particular case the problem is that since 7d981405d0fd ("soc:
> imx8m: change to use platform driver") the soc probe tries to use the
> nvmem driver for ocotp fuses for imx8m devices, which isn't ready yet.
> So soc loading gets pushed back to the end of the list because it gets
> defered and other drivers relying on soc_device_match get confused
> because they wrongly think a device doesn't match a quirk when it
> actually does.
>
> If there is a way to ensure the nvmem driver gets loaded before the soc,
> that would also solve the problem nicely, and avoid the need to mess
> with all the ~50 drivers which use it.
>
> Is there a way to control in what order drivers get loaded? Something in
> the dtb perhaps?

For built-in drivers, load order depends on the initcall level and
link order (how things are lined listed in the Makefile hierarchy).

For loadable modules, this is up to user space in the end.

Which of the drivers in this scenario are loadable modules?

        Arnd
