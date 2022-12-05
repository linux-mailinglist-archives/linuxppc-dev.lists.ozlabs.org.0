Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFDC64285B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 13:23:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQjQ2701Kz3bgp
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 23:23:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XM6zwOC1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XM6zwOC1;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQjP61kNXz3bVZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Dec 2022 23:22:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670242970; x=1701778970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lcxVp1A+yBTRM/AOTd0nAsYWpVQXLhD464zMr8HvkrY=;
  b=XM6zwOC1E7mH76iRm+nhzLUEBtS6GoHn4+AIwY0Hiy5KdJzE6fgOlxWL
   xYgtuZNatX/SDF/3IFF8weQtoecw9meBkHBknSQzU9/y2MMRB4OrC3X+D
   rUt+ZXQZoLHJelTooAKi5JRQL0gSjEvw0m0o36lB5jgVoFWsgy7kjkIf/
   Si6fzTCt0zVox4J8FgcI2E8G7keXwQJLpvdbYLK3carThAcuARI6zZ1vr
   xbWX+UgVulGHVRJE9fcbCYxMCx31WSPbJ5MNIENGZElxzzFAQCYenEofl
   MYio8sxbcw8A5C5pwqr3FCIYgH5obTQ+GYMb7In6JFOLR4lxLK7kWOCXv
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="343327239"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="scan'208";a="343327239"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 04:22:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="639465380"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="scan'208";a="639465380"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 05 Dec 2022 04:22:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1p2AUZ-004rjI-3D;
	Mon, 05 Dec 2022 14:22:40 +0200
Date: Mon, 5 Dec 2022 14:22:39 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [RESEND PATCH] soc: fsl: qe: request pins non-exclusively
Message-ID: <Y43ij5rwNLOaztch@smile.fi.intel.com>
References: <Y4wnGgMLOr04RwvU@google.com>
 <81a7715b-559f-4c5c-bdb6-1aa00d409155@app.fastmail.com>
 <Y40zZ8fkE9d1zbbV@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y40zZ8fkE9d1zbbV@google.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, soc@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Dec 04, 2022 at 03:55:19PM -0800, Dmitry Torokhov wrote:
> On Sun, Dec 04, 2022 at 01:10:19PM +0100, Arnd Bergmann wrote:
> > On Sun, Dec 4, 2022, at 05:50, Dmitry Torokhov wrote:
> > >
> > > SoC team, the problematic patch has been in next for a while and it
> > > would be great to get the fix in to make sure the driver is not broken
> > > in 6.2. Thanks!
> > 
> > I have no problem taking thsi patch, but I get a merge conflict that
> > I'm not sure how to resolve:
> > 
> > 
> > @@@ -186,23 -182,27 +180,43 @@@ struct qe_pin *qe_pin_request(struct de
> >         if (WARN_ON(!gc)) {
> >                 err = -ENODEV;
> >                 goto err0;
> > ++<<<<<<< HEAD
> >  +      }
> >  +      qe_pin->gpiod = gpiod;
> >  +      qe_pin->controller = gpiochip_get_data(gc);
> >  +      /*
> >  +       * FIXME: this gets the local offset on the gpio_chip so that the driver
> >  +       * can manipulate pin control settings through its custom API. The real
> >  +       * solution is to create a real pin control driver for this.
> >  +       */
> >  +      qe_pin->num = gpio_chip_hwgpio(gpiod);
> >  +
> >  +      if (!of_device_is_compatible(gc->of_node, "fsl,mpc8323-qe-pario-bank")) {
> >  +              pr_debug("%s: tried to get a non-qe pin\n", __func__);
> >  +              gpiod_put(gpiod);
> > ++=======
> > +       } else if (!fwnode_device_is_compatible(gc->fwnode,
> > +                                               "fsl,mpc8323-qe-pario-bank")) {
> > +               dev_dbg(dev, "%s: tried to get a non-qe pin\n", __func__);
> > ++>>>>>>> soc: fsl: qe: request pins non-exclusively
> >                 err = -EINVAL;
> > -               goto err0;
> > +       } else {
> > +               qe_pin->controller = gpiochip_get_data(gc);
> > +               /*
> > +                * FIXME: this gets the local offset on the gpio_chip so that
> > +                * the driver can manipulate pin control settings through its
> > +                * custom API. The real solution is to create a real pin control
> > +                * driver for this.
> > +                */
> > +               qe_pin->num = desc_to_gpio(gpiod) - gc->base;
> >         }
> > 
> > Could you rebase the patch on top of the soc/driver branch in the
> > soc tree and send the updated version?
> 
> I see, it conflicts with:
> 
> 	c9eb6e546a23 soc: fsl: qe: Switch to use fwnode instead of of_node
> 
> that is in next but not in soc/driver tree/branch.

That's due to no reaction on the patch [1] from Freescale maintainers (*).
Either soc subsystem can pull this [2] or your patch can go via
pin control subsystem.

*) Note, there is not Arnd's name nor soc mailing list in the MAINTAINERS
   regarding those files, so I had had no idea about the correct route of
   the change.

[1]: https://lore.kernel.org/lkml/20221005152947.71696-1-andriy.shevchenko@linux.intel.com/
[2]: https://lore.kernel.org/linux-gpio/Y3YY%2Fm0F%2FRh0jUc7@black.fi.intel.com/

-- 
With Best Regards,
Andy Shevchenko


