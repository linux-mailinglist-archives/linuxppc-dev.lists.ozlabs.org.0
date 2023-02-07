Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4020068E3C8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 23:57:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBJRx1GXZz3cdx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 09:57:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b5Sf80td;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b5Sf80td;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBJQy3P9Pz309V
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 09:56:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675810602; x=1707346602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FDOyhrG2X8z9k0IPIX77FGLTvc/CQXeh+Z8JpG0kvqU=;
  b=b5Sf80tdYvyqkgZP17bF06+SxVivP7iO8/0DWAPRENTMzyN3GwEIOVm7
   nPAyM8NXjGNhDgW8Np/qbEJJYg9GgYNEniy3h1bvHjfvfDlCY34kYyM/f
   siK3faJMOkU5mX+xz+v3QtLaWrTvsHhPCZtach/XMkmIlYJTZchxbvQSw
   KFHUv4Ss6Bs/xmZiWtiYX29B8q+u6AjwrcXo8Zm9Wyb+QNn8bimvrB6eS
   dxuRa1zg+ZnRfcZ5eA9l1qGa2liCdrax+b6vLhoCVfdq4pG9dmHDpeIux
   +FjTZ3kQ3dNXntqlL2rqC2C0HUo7BEnizRjxKk2p49Yi5edRFfv8b/MUq
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="392046038"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="392046038"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 14:56:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="995905650"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="995905650"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 07 Feb 2023 14:56:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pPWso-003ooN-2o;
	Wed, 08 Feb 2023 00:56:14 +0200
Date: Wed, 8 Feb 2023 00:56:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v3 04/12] gpiolib: remove gpio_set_debounce
Message-ID: <Y+LXDvl4lpfF4SnK@smile.fi.intel.com>
References: <20230207142952.51844-1-andriy.shevchenko@linux.intel.com>
 <20230207142952.51844-5-andriy.shevchenko@linux.intel.com>
 <Y+LDUTfKgHEJHNXB@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+LDUTfKgHEJHNXB@google.com>
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
Cc: Devarsh Thakkar <devarsht@ti.com>, linux-sh@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Stefan Schmidt <stefan@datenfreihafen.org>, linux-arch@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, SHA-cyfmac-dev-list@infineon.com, Geert Uytterhoeven <geert@linux-m68k.org>, linux-input@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, brcm80211-dev-list.pdl@broadcom.com, linux-wpan@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 07, 2023 at 01:32:01PM -0800, Dmitry Torokhov wrote:
> On Tue, Feb 07, 2023 at 04:29:44PM +0200, Andy Shevchenko wrote:
> > @@ -1010,14 +1009,21 @@ static int ads7846_setup_pendown(struct spi_device *spi,
> >  		}
> >  
> >  		ts->gpio_pendown = pdata->gpio_pendown;
> > -
> > -		if (pdata->gpio_pendown_debounce)
> > -			gpio_set_debounce(pdata->gpio_pendown,
> > -					  pdata->gpio_pendown_debounce);
> 
> Can we please change only this to:
> 
> 			gpiod_set_debounce(gpio_to_desc(pdata->gpio_pendown),
> 					   pdata->gpio_pendown_debounce);
> 
> and not change anything else (i.e. drop the changes below)?

Probably. I can try rollback this.

> >  	} else {
> > -		dev_err(&spi->dev, "no get_pendown_state nor gpio_pendown?\n");
> > -		return -EINVAL;
> > +		struct gpio_desc *desc;
> > +
> > +		desc = devm_gpiod_get(&spi->dev, "pendown", GPIOD_IN);
> > +		if (IS_ERR(desc)) {
> > +			dev_err(&spi->dev, "no get_pendown_state nor gpio_pendown?\n");
> > +			return PTR_ERR(desc);
> > +		}
> > +		gpiod_set_consumer_name(desc, "ads7846_pendown");
> > +
> > +		ts->gpio_pendown = desc_to_gpio(desc);
> >  	}
> > +	if (pdata->gpio_pendown_debounce)
> > +		gpiod_set_debounce(gpio_to_desc(ts->gpio_pendown),
> > +				   pdata->gpio_pendown_debounce);
> >  
> >  	return 0;

-- 
With Best Regards,
Andy Shevchenko


