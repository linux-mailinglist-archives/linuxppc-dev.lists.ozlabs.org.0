Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5E768E3B9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 23:56:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBJQL1zHFz3cTk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 09:56:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jqCG+JI5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jqCG+JI5;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBJPP1xprz308w
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 09:55:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675810521; x=1707346521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lx4c26ErU5S2ynIOqkxO2qwwwvS3CfD4nsakwC60WCg=;
  b=jqCG+JI5FcQy7Jg8iXrc9jMSGfPvfeWfb403393vlVo0jQzjvPkPhbKE
   3fyWUqgz8ksFJH6TX7X4+uUwsJnmB+s/4QIffcndg6P0OQ3UaCh8Lnnsr
   JqFi72P/SfmCCPvSUASl3PmqtCTZrJCi/R7VAB6NypqM0cdrpx+dUNbBr
   S1b/rk1lrXYS0hdh/ux4Y3TAqZf8Ay5sQ+PvwLs9tqp8iCGX5NRnGJriV
   QkMA7RR3ofkw6J2VtbyyzCOmUOQvITQIc0jrDKYWxwUXrhVic5g8aYg5o
   sA4FFI1/Dr9bAR5Bh+x3EweGz5kj0G4P6Wx/zV1bUfRtNvWff5+ezq84N
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="309298598"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="309298598"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 14:55:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="755794715"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="755794715"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Feb 2023 14:55:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pPWri-003on0-0X;
	Wed, 08 Feb 2023 00:55:06 +0200
Date: Wed, 8 Feb 2023 00:55:05 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 06/12] gpiolib: split linux/gpio/driver.h out of
 linux/gpio.h
Message-ID: <Y+LWyc4rqCVq5hEi@smile.fi.intel.com>
References: <20230207142952.51844-1-andriy.shevchenko@linux.intel.com>
 <20230207142952.51844-7-andriy.shevchenko@linux.intel.com>
 <CACRpkdaPgjDijPjCdinWy5_Rd8g3idv-8K=YPTv5iTfJKFuJfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaPgjDijPjCdinWy5_Rd8g3idv-8K=YPTv5iTfJKFuJfw@mail.gmail.com>
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

On Tue, Feb 07, 2023 at 03:55:23PM +0100, Linus Walleij wrote:
> On Tue, Feb 7, 2023 at 3:29 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Almost all gpio drivers include linux/gpio/driver.h, and other
> > files should not rely on includes from this header.
> >
> > Remove the indirect include from here and include the correct
> > headers directly from where they are used.

...

> Make sure you push this to the kernel.org build servers (zeroday builds),

Of course, that is the purpose of publishing this before the release (so we
will have some TODO list that eventually this can be applied for v6.4-rc1).

> I think this patch needs to hit some more files, in my tests with a similar
> patch at least these:

Right. I forgot to also incorporate your stuff into this series.
Do you have anything that I can take as is?

-- 
With Best Regards,
Andy Shevchenko


