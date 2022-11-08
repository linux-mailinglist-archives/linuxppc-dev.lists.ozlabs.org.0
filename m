Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1C9620F99
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 12:56:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N664v2y0Cz3cMp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 22:56:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KkkVaQR9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KkkVaQR9;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N663w5RwJz3cD2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Nov 2022 22:55:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667908524; x=1699444524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LCJ+LA4EoECYwdOJcOySMDwZZdQunAqwqpjhdUCb7Fw=;
  b=KkkVaQR9B7aA1FhwCaD5Q0G3JCHrr1pR85mCQ/ODpMoXbzNgpPuKazqu
   NyCkqv/PFfciVKBzGnP8q/cYzk/70XXYoTHdBM93kyhtnGSQlQOuOdNM/
   YGcwKSWWpSticeXq6wFKcSHh5rn6+t5mx2CoZQ4hHMnAlhuGKE/8ltuuo
   ctDP70ruL/tMn+5e/4kMhrIDlFqfOLU94gwO2RctnF18h81D10tAkFO+4
   +kBBkwmcB5Y+CTZFoljmUReagTTFQB/XSO/9dFDLJvJF13nyNmGaU3ViR
   LlYd80k4BxQxvTNlN2Ya0RAklhhBA2m9uwO0GCJhG0sGELqanDu3gn5xC
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="311830256"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="311830256"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 03:55:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="761470048"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="761470048"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 08 Nov 2022 03:55:08 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1osNC6-0096tw-0T;
	Tue, 08 Nov 2022 13:55:06 +0200
Date: Tue, 8 Nov 2022 13:55:05 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] soc: fsl: qe: request pins non-exclusively
Message-ID: <Y2pDmaHKU+1/ai9k@smile.fi.intel.com>
References: <Y2nKIbKxHAMimxII@google.com>
 <CACRpkdaW-dwKNtTQ2_Mj4JpG34N3m19g+s5xcs3Xj=2kAdE0cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaW-dwKNtTQ2_Mj4JpG34N3m19g+s5xcs3Xj=2kAdE0cw@mail.gmail.com>
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
Cc: linux-usb@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 08, 2022 at 11:50:07AM +0100, Linus Walleij wrote:
> On Tue, Nov 8, 2022 at 4:16 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > Commit 84582f9ed090 ("soc: fsl: qe: Avoid using gpio_to_desc()") changed
> > qe_pin_request() to request and hold GPIO corresponding to a given pin.
> > Unfortunately this does not work, as fhci-hcd requests these GPIOs
> > first, befor calling qe_pin_request() (see
> > drivers/usb/host/fhci-hcd.c::of_fhci_probe()).
> > To fix it change qe_pin_request() to request GPIOs non-exclusively, and
> > free them once the code determines GPIO controller and offset for each
> > GPIO/pin.
> >
> > Also reaching deep into gpiolib implementation is not the best idea. We
> > should either export gpio_chip_hwgpio() or keep converting to the global
> > gpio numbers space until we fix the driver to implement proper pin
> > control.
> >
> > Fixes: 84582f9ed090 ("soc: fsl: qe: Avoid using gpio_to_desc()")
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Wow! Thanks for fixing this!
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> I just sent that patch into the SoC patch tracker (soc@kernel.org)
> with a not to apply it directly, I suggest you do the same (or ask me
> to sign it off and send it).

It depends on the patch in my tree, which is in your tree as well.
I guess you need to take or wait for v6.2-rc1.

-- 
With Best Regards,
Andy Shevchenko


