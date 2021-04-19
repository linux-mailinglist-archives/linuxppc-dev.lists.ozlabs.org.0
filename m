Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94635363E52
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 11:13:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP1Mm3hRvz3cYh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 19:13:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.217.47; helo=mail-vs1-f47.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP17x0r6bz2yZR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 19:03:38 +1000 (AEST)
Received: by mail-vs1-f47.google.com with SMTP id b8so744422vsu.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 02:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YToQwZXN38nw8LU8icFLB58IB4Z2bfPdJB1gmWWtNj8=;
 b=CbHOvnMqUCuH2xvPfUVP4E9pu8nzswjfok0lVDaHPX2MUaYQiLdiuN8tTYHiFr+rE+
 kvl16wSsHchFRbQB75uahW18c+vO9vKPs9eV3FT3j+5NWZnOP+4/kCDQNmdgY83Lqfv1
 4Y9vekm92+hHAXS5qM+/GAyavkU9epTuTwnE6VTBFwKyrOF1Q5mhY5YnAiRha0A5PFK2
 znBoGPF3AqfDKKYrik3GEicbcb+k6WuaMdRuNhrXZdDVDPz/7Yaw8KW4rUp5bk2nUtAa
 BmLMMN0vISD9t0OQ3S0qeFa+QFAmgtAsjT3J85oRXuDZSw8YIWi91LTFCMX8ECZ8V+O2
 88oA==
X-Gm-Message-State: AOAM531QTBAnWGlmVQbIcGRFvuezSK8lOlW0MIpEWAKTqMSBhR6BmWU4
 HAqIuVcCal5xeq5QIsRRdAztr2h9DiutNY+71j4=
X-Google-Smtp-Source: ABdhPJxHtnj/DXie9H0wxpzVZlSTyniokdUb/gsNNsMkANVtAtzr2mFBhczBYEoBurfSWsjRkBkPBhRAOOMrjVGBWsw=
X-Received: by 2002:a67:7c8c:: with SMTP id x134mr13821818vsc.40.1618823016409; 
 Mon, 19 Apr 2021 02:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-4-alice.guo@oss.nxp.com>
 <YH0O907dfGY9jQRZ@atmark-techno.com>
In-Reply-To: <YH0O907dfGY9jQRZ@atmark-techno.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Apr 2021 11:03:24 +0200
Message-ID: <CAMuHMdVY1SLZ0K30T2pimyrR6Mm=VoSTO=L-xxCy2Bj7_kostw@mail.gmail.com>
Subject: Re: [RFC v1 PATCH 3/3] driver: update all the code that use
 soc_device_match
To: Dominique MARTINET <dominique.martinet@atmark-techno.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 19 Apr 2021 19:11:47 +1000
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
Cc: ulf.hansson@linaro.org, aymen.sghaier@nxp.com, geert+renesas@glider.be,
 rafael@kernel.org, airlied@linux.ie, mturquette@baylibre.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 a.hajda@samsung.com, netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 peter.ujfalusi@gmail.com, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, wim@linux-watchdog.org,
 herbert@gondor.apana.org.au, horia.geanta@nxp.com, khilman@baylibre.com,
 joro@8bytes.org, narmstrong@baylibre.com, linux-staging@lists.linux.dev,
 iommu@lists.linux-foundation.org, kishon@ti.com, tony@atomide.com,
 linux-omap@vger.kernel.org, stern@rowland.harvard.edu, kuba@kernel.org,
 linus.walleij@linaro.org, linux@roeck-us.net, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, will@kernel.org, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, edubezval@gmail.com, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, ssantosh@kernel.org,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Alice Guo \(OSS\)" <alice.guo@oss.nxp.com>, balbi@kernel.org,
 tomba@kernel.org, sboyd@kernel.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org, adrian.hunter@intel.com,
 robert.foss@linaro.org, leoyang.li@nxp.com, linux@prisktech.co.nz,
 vkoul@kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-crypto@vger.kernel.org,
 daniel@ffwll.ch, j-keerthy@ti.com, dmaengine@vger.kernel.org,
 Roy.Pledge@nxp.com, jyri.sarha@iki.fi, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Dominique,

CC Arnd (soc_device_match() author)

On Mon, Apr 19, 2021 at 7:03 AM Dominique MARTINET
<dominique.martinet@atmark-techno.com> wrote:
> Alice Guo (OSS) wrote on Mon, Apr 19, 2021 at 12:27:22PM +0800:
> > From: Alice Guo <alice.guo@nxp.com>
> > Update all the code that use soc_device_match
>
> A single patch might be difficult to accept for all components, a each
> maintainer will probably want to have a say on their subsystem?
>
> I would suggest to split these for a non-RFC version; a this will really
> need to be case-by-case handling.
>
> > because add support for soc_device_match returning -EPROBE_DEFER.
>
> (English does not parse here for me)
>
> I've only commented a couple of places in the code itself, but this
> doesn't seem to add much support for errors, just sweep the problem
> under the rug.
>
> > Signed-off-by: Alice Guo <alice.guo@nxp.com>
> > ---
> >
> > diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> > index 5fae60f8c135..00c59aa217c1 100644
> > --- a/drivers/bus/ti-sysc.c
> > +++ b/drivers/bus/ti-sysc.c
> > @@ -2909,7 +2909,7 @@ static int sysc_init_soc(struct sysc *ddata)
> >       }
> >
> >       match = soc_device_match(sysc_soc_feat_match);
> > -     if (!match)
> > +     if (!match || IS_ERR(match))
> >               return 0;
>
> This function handles errors, I would recommend returning the error as
> is if soc_device_match returned one so the probe can be retried later.

Depends...

> > --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> > @@ -439,6 +439,7 @@ static const unsigned int r8a7795es2_mod_nullify[] __initconst = {
> >
> >  static int __init r8a7795_cpg_mssr_init(struct device *dev)
> >  {
> > +     const struct soc_device_attribute *match;
> >       const struct rcar_gen3_cpg_pll_config *cpg_pll_config;
> >       u32 cpg_mode;
> >       int error;
> > @@ -453,7 +454,8 @@ static int __init r8a7795_cpg_mssr_init(struct device *dev)
> >               return -EINVAL;
> >       }
> >
> > -     if (soc_device_match(r8a7795es1)) {
> > +     match = soc_device_match(r8a7795es1);
> > +     if (!IS_ERR(match) && match) {
>
> Same, return the error.
> Assuming an error means no match will just lead to hard to debug
> problems because the driver potentially assumed the wrong device when
> it's just not ready yet.

When running on R-Car H3, there will always be a match device, as
the SoC device is registered early.

>
> >               cpg_core_nullify_range(r8a7795_core_clks,
> >                                      ARRAY_SIZE(r8a7795_core_clks),
> >                                      R8A7795_CLK_S0D2, R8A7795_CLK_S0D12);
> > [...]
> > diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> > index eaaec0a55cc6..13a06b613379 100644
> > --- a/drivers/iommu/ipmmu-vmsa.c
> > +++ b/drivers/iommu/ipmmu-vmsa.c
> > @@ -757,17 +757,20 @@ static const char * const devices_allowlist[] = {
> >
> >  static bool ipmmu_device_is_allowed(struct device *dev)
> >  {
> > +     const struct soc_device_attribute *match1, *match2;
> >       unsigned int i;
> >
> >       /*
> >        * R-Car Gen3 and RZ/G2 use the allow list to opt-in devices.
> >        * For Other SoCs, this returns true anyway.
> >        */
> > -     if (!soc_device_match(soc_needs_opt_in))
> > +     match1 = soc_device_match(soc_needs_opt_in);
> > +     if (!IS_ERR(match1) && !match1)
>
> I'm not sure what you intended to do, but !match1 already means there is
> no error so the original code is identical.
>
> In this case ipmmu_device_is_allowed does not allow errors so this is
> one of the "difficult" drivers that require slightly more thinking.
> It is only called in ipmmu_of_xlate which does return errors properly,
> so in this case the most straightforward approach would be to make
> ipmmu_device_is_allowed return an int and forward errors as well.
>
> ...
> This is going to need quite some more work to be acceptable, in my
> opinion, but I think it should be possible.

In general, this is very hard to do, IMHO. Some drivers may be used on
multiple platforms, some of them registering an SoC device, some of
them not registering an SoC device.  So there is no way to know the
difference between "SoC device not registered, intentionally", and
"SoC device not yet registered".

soc_device_match() should only be used as a last resort, to identify
systems that cannot be identified otherwise.  Typically this is used for
quirks, which should only be enabled on a very specific subset of
systems.  IMHO such systems should make sure soc_device_match()
is available early, by registering their SoC device early.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
