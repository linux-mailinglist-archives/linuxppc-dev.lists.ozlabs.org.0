Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B326623F1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 12:16:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrBG44jK3z3cGR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:16:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jq4WRfG7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jq4WRfG7;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrBF74v44z2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 22:15:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673262923; x=1704798923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bZbtSxVq7tKRN0w032vmRM6pRPfyv3+6ov17Khe0FpU=;
  b=Jq4WRfG7UhOohTHh2fG24QcMItTXA/ngbuGngRsfAIxzGBsRpEmyJvAw
   RHEU+ljo0CTJPX1UusZHsYTeBkUKUy1Zj7M0qdS3BSE/9DZz0wJX1/w4G
   az82+forQjW75IVU7Q+HCiC/vrW22bCorpxrjxw2lo57v1Y+0eUWKjMo4
   V+6I7Xelu3pIlp3xYJu9ghEoKHfzU+H+bxWFWhU74Wyk08ik/eTWp5OM5
   EJKmFZ/XbhqDDfYwDHdTlfPbNejX5VvOhMi9oyc+6pk3UOoLNryNqgEli
   s8Q1yc7/btR2ALdfiiVIDDbTi9m5vlXOskLNwkqQCdyyb1/6ufN+2pnv4
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="324095829"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="324095829"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 03:15:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="830562411"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="830562411"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 09 Jan 2023 03:15:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pEq7Q-006MOk-0s;
	Mon, 09 Jan 2023 13:15:08 +0200
Date: Mon, 9 Jan 2023 13:15:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: sam@ravnborg.org
Subject: Re: [PATCH 10/15] staging: fbtft: core: Introduce
 backlight_is_blank()
Message-ID: <Y7v3O+6wacN8qL7K@smile.fi.intel.com>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-10-1bd9bafb351f@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-10-1bd9bafb351f@ravnborg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-staging@lists.linux.dev, Stephen Kitt <steve@sk2.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Peter Suti <peter.suti@streamunlimited.com>, Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, Antonino Daplas <adaplas@gmail.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Robin van der Gracht <robin@protonic.nl>, Nicolas Ferre <nicolas.ferre@microchip.com>, Thomas Zimmermann <tzimmermann@suse.de>, Jingoo Han <jingoohan1@gmail.com>, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 07, 2023 at 07:26:24PM +0100, Sam Ravnborg via B4 Submission Endpoint wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> Avoiding direct access to backlight_properties.props.
> 
> Access to the deprecated props.fb_blank replaced by backlight_is_blank().
> Access to props.power is dropped - it was only used for debug.

...

> +	if (blank)
>  		gpiod_set_value(par->gpio.led[0], !polarity);
> +	else
> +		gpiod_set_value(par->gpio.led[0], polarity);

	if (blank)
		polarity = !polarity;

	gpiod_set_value(par->gpio.led[0], polarity);

?

-- 
With Best Regards,
Andy Shevchenko


