Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5A26623FD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 12:17:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrBHK3sZqz3cGk
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:17:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BpjMQVSS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=daniel.thompson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BpjMQVSS;
	dkim-atps=neutral
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrBGQ3yF4z2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 22:16:29 +1100 (AEDT)
Received: by mail-wm1-x329.google.com with SMTP id o15so5988310wmr.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 03:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IGLyI5wEcgXuRG4qKgW9nkQD5uda7Ch20RGMOQU2FOU=;
        b=BpjMQVSSiInIzATUSKHKx/TB0PAgHuhGpwqrg0yOvpFaOf45mvS+GWvnx67CEXA3H3
         OpJ86BZFVR7wQA+dlKnprx63GQ+n3TtIT3gNtfcwYquJrtGnekG3nzORos283svZUVJ1
         gD/voD8Adfh6f/kRlsfptOQ3FzAtRI57WQUlj9somGfISffT5ucUlRw1oEWN9hMSp8+8
         7Ymx/sq7ntQJ876T0aADIjQ39k6t/AHX2eKWzPuJzBVyDGLq9X87LBaBoOHW3GDSWjSu
         LM5WVxU8BDTwndJbIqjxOt9sHE+yUYYLgWXJYDdzFtoZBGdEV5Y6eR7kko+fa21emUGA
         j1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGLyI5wEcgXuRG4qKgW9nkQD5uda7Ch20RGMOQU2FOU=;
        b=6x9ij3k5IZXD0GkeLJ1dud1GSwf1THZvlGJ3kd2HygzHYaU3YKO1bX2dk0/FFif2nX
         EnVE8tBTKMPILpVnASSBsC9vWIj8R3NRT94EKpuY6wa5yvdZ0m6IExvD7rXszz5U1zBc
         wJ0EjRezL/ghC6hmo2NfoMOHVzNFeURF+wdbZEpkUFHfomtjAWNJ67z/lWRulUcbCygk
         dQ3Dw8gJzvFCH4jPgcA1YQq+c1LQDVesMv4j7DApG1vcYt2QbM2g6kk2DxzdVSzgOsZI
         3+d6G9xYEBFdYwgvNAfYWYzXsWors36cwUacsI/FvHIMO5lAlN1kjbP/yqPDWePhIQlf
         iO9Q==
X-Gm-Message-State: AFqh2krKyh7NoWy5vxmkUros8ElG+KEr5JVMnqOk7cT59CdWVs7Go88V
	orjIA36cPjEQcaGMNgr8utciSg==
X-Google-Smtp-Source: AMrXdXsoSB+aT78r/3TNZt8Dgl5bAgKCniDPaEeXXf//BrSKda/Imn7sAaZR+/qS1mLHNKNpC03pvA==
X-Received: by 2002:a05:600c:4a90:b0:3d2:3ae8:886a with SMTP id b16-20020a05600c4a9000b003d23ae8886amr49681406wmp.17.1673262985605;
        Mon, 09 Jan 2023 03:16:25 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id u21-20020a7bc055000000b003d9aa76dc6asm18341780wmc.0.2023.01.09.03.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 03:16:24 -0800 (PST)
Date: Mon, 9 Jan 2023 11:16:22 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 09/15] staging: fbtft: fb_ssd1351.c: Introduce
 backlight_is_blank()
Message-ID: <Y7v3hgcyGpXdlJcE@aspen.lan>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-9-1bd9bafb351f@ravnborg.org>
 <20230108202817.7890f85c@heffalump.sk2.org>
 <Y7sntztwrNqw41+i@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7sntztwrNqw41+i@ravnborg.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Lee Jones <lee@kernel.org>, Stephen Kitt <steve@sk2.org>, Antonino Daplas <adaplas@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Robin van der Gracht <robin@protonic.nl>, Miguel Ojeda <ojeda@kernel.org>, Sam Ravnborg via B4 Submission Endpoint <devnull+sam.ravnborg.org@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>, linux-arm-kernel@lists.infradead.org, Nicolas Ferre <nicolas.ferre@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jan 08, 2023 at 09:29:43PM +0100, Sam Ravnborg wrote:
> Hi Stephen,
>
> On Sun, Jan 08, 2023 at 08:28:17PM +0100, Stephen Kitt wrote:
> > On Sat, 07 Jan 2023 19:26:23 +0100, Sam Ravnborg via B4 Submission Endpoint
> > <devnull+sam.ravnborg.org@kernel.org> wrote:
> >
> > > From: Sam Ravnborg <sam@ravnborg.org>
> > >
> > > Avoiding direct access to backlight_properties.props.
> > >
> > > Access to the deprecated props.fb_blank replaced by backlight_is_blank().
> > > Access to props.power is dropped - it was only used for debug.
> > >
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Stephen Kitt <steve@sk2.org>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Cc: linux-fbdev@vger.kernel.org
> > > ---
> > >  drivers/staging/fbtft/fb_ssd1351.c | 9 +++------
> > >  1 file changed, 3 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/staging/fbtft/fb_ssd1351.c
> > > b/drivers/staging/fbtft/fb_ssd1351.c index b8d55aa8c5c7..995fbd2f3dc6 100644
> > > --- a/drivers/staging/fbtft/fb_ssd1351.c
> > > +++ b/drivers/staging/fbtft/fb_ssd1351.c
> > > @@ -190,15 +190,12 @@ static struct fbtft_display display = {
> > >  static int update_onboard_backlight(struct backlight_device *bd)
> > >  {
> > >  	struct fbtft_par *par = bl_get_data(bd);
> > > -	bool on;
> > > +	bool blank = backlight_is_blank(bd);
> > >
> > > -	fbtft_par_dbg(DEBUG_BACKLIGHT, par,
> > > -		      "%s: power=%d, fb_blank=%d\n",
> > > -		      __func__, bd->props.power, bd->props.fb_blank);
> > > +	fbtft_par_dbg(DEBUG_BACKLIGHT, par, "%s: blank=%d\n", __func__,
> > > blank);
> > > -	on = !backlight_is_blank(bd);
> > >  	/* Onboard backlight connected to GPIO0 on SSD1351, GPIO1 unused */
> > > -	write_reg(par, 0xB5, on ? 0x03 : 0x02);
> > > +	write_reg(par, 0xB5, !blank ? 0x03 : 0x02);
> > >
> > >  	return 0;
> > >  }
> > >
> > > --
> > > 2.34.1
> >
> > For debugging purposes here, would there be any point in logging props.state?
> > As in
> >
> >         fbtft_par_dbg(DEBUG_BACKLIGHT, par,
> > -                     "%s: power=%d, fb_blank=%d\n",
> > -                     __func__, bd->props.power, bd->props.fb_blank);
> > +                     "%s: power=%d, state=%u\n",
> > +                     __func__, bd->props.power, bd->props.state);
>
> Thanks for the suggestion - and the reviews!
>
> I was tempted to just remove the debugging.
> If we require debugging, then this could be added in the backlight core,
> thus everyone would benefit from it.

I had the same instinct to remove the debug print here (esp. ones with
__func__ in them) but I think that's probably a much more widely scoped
clean up for fbtft ;-).

On that basis:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
