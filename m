Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EECA6396EA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 16:45:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKGJf71Fnz3f51
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 02:45:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kpYYeFZW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kpYYeFZW;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKGHh3gyRz2xrL
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 02:44:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669477456; x=1701013456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=TYZva1qhZaDDzx7ssD6565IlpCg24ayIFbcaC7tY8Tc=;
  b=kpYYeFZWfR98ToB4QhZ2T8NZj8HKl7h+wcfI15XRGoE+9FZ5D6wPh48M
   pwsHA9Yl4+8k45AybR+xSAb7IRwIPpLCw4GlCCKnRBbt842h2GgHo4c6G
   f8b8Rmx1ed+CldtaxQbEmS021BXeUAC8pxLpxGnTlMnzQvHFrr/FgWQyA
   ydKevZai1zqNMclmtdkCRa+Y2/NXcbjuhI15Mtr51VudCCLqUqscu0S8D
   Kpc1JJnNlvXrSmCSNNSlrGxh7s6GFiP+Bs/nupSD/hJp7VYmsI0j4k2ed
   yNGbZtEL+cElnU6MiQz266csJ6bdh5oyFBVKav5Dn1bXgu9OyaEG5xnKN
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10543"; a="376747253"
X-IronPort-AV: E=Sophos;i="5.96,196,1665471600"; 
   d="scan'208";a="376747253"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2022 07:44:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10543"; a="620587303"
X-IronPort-AV: E=Sophos;i="5.96,196,1665471600"; 
   d="scan'208";a="620587303"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 26 Nov 2022 07:43:54 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1oyxLL-000Bco-1n;
	Sat, 26 Nov 2022 17:43:51 +0200
Date: Sat, 26 Nov 2022 17:43:51 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
Message-ID: <Y4I0N3KpU/LSJYpd@smile.fi.intel.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221122185818.3740200d@jic23-huawei>
 <20221122201654.5rdaisqho33buibj@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221122201654.5rdaisqho33buibj@pengutronix.de>
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
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org, platform-driver-x86@vger.kernel.org, netdev@vger.kernel.org, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, linux-input@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, linux-media@vger.kernel.org, linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>, linux-pm@vger.kernel.org, linux-actions@lists.infradead.org, Wolfram Sang <wsa@kernel.org>, linux-gpio@vger.kernel.org, Angel Iglesias <ang.iglesiasg@gmail.com>, linux-rpi-kernel@lists.infradead.org, linux-
 amlogic@lists.infradead.org, openipmi-developer@lists.sourceforge.net, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, kernel@pengutronix.de, patches@opensource.cirrus.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Jonathan Cameron <jic23@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 22, 2022 at 09:16:54PM +0100, Uwe Kleine-König wrote:
> On Tue, Nov 22, 2022 at 06:58:18PM +0000, Jonathan Cameron wrote:

> > Queued all of the below:
> > with one tweaked as per your suggestion and the highlighted one dropped on basis
> > I was already carrying the equivalent - as you pointed out.
> > 
> > I was already carrying the required dependency.
> > 
> > Includes the IIO ones in staging.
> > 

> > p.s. I perhaps foolishly did this in a highly manual way so as to
> > also pick up Andy's RB.  So might have dropped one...
> 
> You could have done:
> 
> 	H=$(git rev-parse @)
> 	b4 am -P 49-190 20221118224540.619276-1-uwe@kleine-koenig.org
> 	git am ...
> 	git filter-branch -f --msg-filter "grep -v 'Signed-off-by: Jonathan'; echo 'Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>'; echo 'Signed-off-by: Jonathan Cameron <jic23@kernel.org>'" $H..
> 
> (untested, but you get the idea).

That's, for example (just last from the history as is), how I usually do it
(tested):

 git filter-branch --msg-filter 'sed -e "/Signed-off-by: Andy Shevchenko/ a Tested-by: Daniel Scally <dan.scally@ideasonboard.com>"' -f HEAD~4..HEAD


-- 
With Best Regards,
Andy Shevchenko


