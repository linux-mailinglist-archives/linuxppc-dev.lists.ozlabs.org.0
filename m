Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A97662135
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 10:16:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nr7bQ5QWbz3cFY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 20:16:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f/rkfDst;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=jani.nikula@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f/rkfDst;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nr7ZS0Rd0z307T
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 20:15:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673255712; x=1704791712;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=8H3hPCFI47nxZtoBbne24d82bPkrwkUNa3C9m/vtPLs=;
  b=f/rkfDstrXeSLJqn90QrR2L0oRe+1tEWEsVO6wX2/5CQcszFqOw3Jnka
   yJwt5pbPv9qtS518sarN5ExeA7LUBQaZ+94wtOkGMM+5Qv+tCpcKEKMuI
   tnJK4Qd7+7WHovWG1goPxCnV/E6k3pnLaMEQ4UoLY5ADKY+2fDl5uxh8b
   1gUVcq5Vsa/URzHxL0Y3/nwGdgUCxQ1uj20PrtdQG8ytoVjTBwyXnJSrp
   iYMIc/UGHH+vBz27AHMXZOKnFfq7Xir6BPTAsUQw9c0hKhuCZQi40b+wB
   66Pw9hl4URUQ8NNr4tO4ZXIzrYF/xJdU5TIX6I+vEKx2nGif54QknhZTB
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="322904962"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="322904962"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 01:15:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="985334290"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="985334290"
Received: from gtmcgeac-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.11.217])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 01:14:55 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Helge Deller <deller@gmx.de>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Antonino Daplas <adaplas@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Robin
 van der Gracht <robin@protonic.nl>, Miguel Ojeda <ojeda@kernel.org>, Lee
 Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: Re: [PATCH 01/15] video: fbdev: atmel_lcdfb: Rework backlight handling
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-1-1bd9bafb351f@ravnborg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-1-1bd9bafb351f@ravnborg.org>
Date: Mon, 09 Jan 2023 11:14:53 +0200
Message-ID: <87a62s2ho2.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, Stephen Kitt <steve@sk2.org>, linuxppc-dev@lists.ozlabs.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ludovic Desroches <ludovic.desroches@microchip.com>, linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 07 Jan 2023, Sam Ravnborg via B4 Submission Endpoint <devnull+sam.ravnborg.org@kernel.org> wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
>
> The atmel_lcdfb had code to save/restore power state.
> This is not needed so drop it.
>
> Introduce backlight_is_brightness() to make logic simpler.

backlight_is_brightness?

BR,
Jani.


>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/video/fbdev/atmel_lcdfb.c | 24 +++---------------------
>  1 file changed, 3 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
> index 1fc8de4ecbeb..d297b3892637 100644
> --- a/drivers/video/fbdev/atmel_lcdfb.c
> +++ b/drivers/video/fbdev/atmel_lcdfb.c
> @@ -49,7 +49,6 @@ struct atmel_lcdfb_info {
>  	struct clk		*lcdc_clk;
>  
>  	struct backlight_device	*backlight;
> -	u8			bl_power;
>  	u8			saved_lcdcon;
>  
>  	u32			pseudo_palette[16];
> @@ -109,32 +108,18 @@ static u32 contrast_ctr = ATMEL_LCDC_PS_DIV8
>  static int atmel_bl_update_status(struct backlight_device *bl)
>  {
>  	struct atmel_lcdfb_info *sinfo = bl_get_data(bl);
> -	int			power = sinfo->bl_power;
> -	int			brightness = bl->props.brightness;
> +	int brightness;
>  
> -	/* REVISIT there may be a meaningful difference between
> -	 * fb_blank and power ... there seem to be some cases
> -	 * this doesn't handle correctly.
> -	 */
> -	if (bl->props.fb_blank != sinfo->bl_power)
> -		power = bl->props.fb_blank;
> -	else if (bl->props.power != sinfo->bl_power)
> -		power = bl->props.power;
> -
> -	if (brightness < 0 && power == FB_BLANK_UNBLANK)
> -		brightness = lcdc_readl(sinfo, ATMEL_LCDC_CONTRAST_VAL);
> -	else if (power != FB_BLANK_UNBLANK)
> -		brightness = 0;
> +	brightness = backlight_get_brightness(bl);
>  
>  	lcdc_writel(sinfo, ATMEL_LCDC_CONTRAST_VAL, brightness);
> +
>  	if (contrast_ctr & ATMEL_LCDC_POL_POSITIVE)
>  		lcdc_writel(sinfo, ATMEL_LCDC_CONTRAST_CTR,
>  			brightness ? contrast_ctr : 0);
>  	else
>  		lcdc_writel(sinfo, ATMEL_LCDC_CONTRAST_CTR, contrast_ctr);
>  
> -	bl->props.fb_blank = bl->props.power = sinfo->bl_power = power;
> -
>  	return 0;
>  }
>  
> @@ -155,8 +140,6 @@ static void init_backlight(struct atmel_lcdfb_info *sinfo)
>  	struct backlight_properties props;
>  	struct backlight_device	*bl;
>  
> -	sinfo->bl_power = FB_BLANK_UNBLANK;
> -
>  	if (sinfo->backlight)
>  		return;
>  
> @@ -173,7 +156,6 @@ static void init_backlight(struct atmel_lcdfb_info *sinfo)
>  	sinfo->backlight = bl;
>  
>  	bl->props.power = FB_BLANK_UNBLANK;
> -	bl->props.fb_blank = FB_BLANK_UNBLANK;
>  	bl->props.brightness = atmel_bl_get_brightness(bl);
>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
