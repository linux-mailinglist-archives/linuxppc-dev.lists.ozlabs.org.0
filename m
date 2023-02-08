Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B0868F13F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 15:52:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBjfJ45nqz3f2x
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 01:52:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rb08+Sbt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rb08+Sbt;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBjdK1SW3z2xYL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 01:52:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675867925; x=1707403925;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3P68b0TVOlpRiURRNLVvw64Yo8IjZVFB+vqzhU4qIC8=;
  b=Rb08+SbtjqAZ3OOW8cT9QVhCz6qpYXsu+QAHDej4f4PlWaJrX1wfBnDu
   Q/f5etxuIJJZb11a1j+qgpFCcNILZaFuHwsO9hgbAd84dNXR1tcgpzaLg
   p+9r0shvtRiVKtjGz6k9tYCgDt4lyQzdsKEanXvn9ds1hDfVIYhTJeygi
   AaX9CyRJv3wAVIpPAxRNIVMWHi85sw+xXSBqGiZ7uD5iK2bCeYGHY/sLO
   SYX3UBge+AkkkUIXqZ0j+CVN+OZDf2LDCXO3c2ZZQwiJ5VCV/GqEsLeeO
   jqjdXpwPrGna5ZnFtu6RNfP8l7mv/+RYPBogHC3lyc4GZbEzx5sWd08W0
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="313454201"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="313454201"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 06:51:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="841199018"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="841199018"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 08 Feb 2023 06:51:44 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pPlnR-004ANT-0z;
	Wed, 08 Feb 2023 16:51:41 +0200
Date: Wed, 8 Feb 2023 16:51:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 06/12] gpiolib: split linux/gpio/driver.h out of
 linux/gpio.h
Message-ID: <Y+O2/dVDcvnXByc+@smile.fi.intel.com>
References: <20230207142952.51844-1-andriy.shevchenko@linux.intel.com>
 <20230207142952.51844-7-andriy.shevchenko@linux.intel.com>
 <CACRpkdaPgjDijPjCdinWy5_Rd8g3idv-8K=YPTv5iTfJKFuJfw@mail.gmail.com>
 <Y+LWyc4rqCVq5hEi@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+LWyc4rqCVq5hEi@smile.fi.intel.com>
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
Cc: linux-sh@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, Stefan Schmidt <stefan@datenfreihafen.org>, linux-arch@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, SHA-cyfmac-dev-list@infineon.com, Geert Uytterhoeven <geert@linux-m68k.org>, linux-input@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, brcm80211-dev-list.pdl@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-doc-tw-discuss@lists.sourceforge.net, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-wpan@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 08, 2023 at 12:55:06AM +0200, Andy Shevchenko wrote:
> On Tue, Feb 07, 2023 at 03:55:23PM +0100, Linus Walleij wrote:
> > On Tue, Feb 7, 2023 at 3:29 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > 
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > Almost all gpio drivers include linux/gpio/driver.h, and other
> > > files should not rely on includes from this header.
> > >
> > > Remove the indirect include from here and include the correct
> > > headers directly from where they are used.
> 
> ...
> 
> > Make sure you push this to the kernel.org build servers (zeroday builds),
> 
> Of course, that is the purpose of publishing this before the release (so we
> will have some TODO list that eventually this can be applied for v6.4-rc1).
> 
> > I think this patch needs to hit some more files, in my tests with a similar
> > patch at least these:
> 
> Right. I forgot to also incorporate your stuff into this series.
> Do you have anything that I can take as is?

I'm going to incorporate the following:

	gpio: Make the legacy <linux/gpio.h> consumer-only
	ARM: s3c24xx: Use the right include
	ARM: orion/gpio: Use the right include
	hte: tegra-194: Use proper includes
	pcmcia: pxa2xx_viper: Include dependency


-- 
With Best Regards,
Andy Shevchenko


