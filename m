Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B8E86CF35
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 17:31:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=EW77o+6R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlxYw0PNTz3vZ9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 03:31:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=EW77o+6R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.198; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlxY72kxQz3dRp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 03:30:49 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B303C000D;
	Thu, 29 Feb 2024 16:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709224246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RDGt+EA7hkCFccMGYrVs2zoZyoxmiDzvNkKrfbOvX+E=;
	b=EW77o+6R6+tU3vtpYuza6yzR1k55eFiv3f2qtwo20rqmjPP5AeMUOmCIAsbt+6GAu+z3j/
	/4nGFkCoCmPeA2hsE+ACxc4Me+Uusd/z3j9bn2Wg5XAg6YxQsOdnmOL0a3NZizgiw5HG2E
	/5SS1B/WgSSSsG7E7Z+fMVxnyoT6KT8yy2B7/SERUqvhrR27hivzhBpxef2hj1K9xShYxJ
	dpIDb8GpNhq4GocYrkZDTKki1UQRhGK8dCJMZEMmAwmqULU0U3By/kdvGAcskpVrAhOEmd
	dMhQTouPzTeFBDXgqk5Liy8k1884JUfhtV+dOfuBWE15SrmId5NdYR9hQjdYhA==
Date: Thu, 29 Feb 2024 17:30:43 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 4/5] net: wan: fsl_qmc_hdlc: Add runtime timeslots
 changes support
Message-ID: <20240229173043.3dc5decf@bootlin.com>
In-Reply-To: <ZeCg24Iv8qDmxNV9@smile.fi.intel.com>
References: <20240229141554.836867-1-herve.codina@bootlin.com>
	<20240229141554.836867-5-herve.codina@bootlin.com>
	<ZeCg24Iv8qDmxNV9@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, Yury Norov <yury.norov@gmail.com>, netdev@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andy,

On Thu, 29 Feb 2024 17:20:59 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Thu, Feb 29, 2024 at 03:15:52PM +0100, Herve Codina wrote:
> > QMC channels support runtime timeslots changes but nothing is done at
> > the QMC HDLC driver to handle these changes.
> > 
> > Use existing IFACE ioctl in order to configure the timeslots to use.  
> 
> ...
> 
> > +	bitmap_scatter(ts_mask, map, ts_mask_avail, 64);  
> 
> Wondering if we may have returned value more useful and hence having something like
> 
> 	n = bitmap_scatter(...);

I thought about it.

In bitmap_{scatter,gather}(dst, src, mask, nbits), only returning the
weight of the third parameter (i.e. mask) can be efficient regarding to the
for_each_set_bit() loop done in the functions.
For dst parameter, we need to add a counter in the loop to count the number
of bit set depending on the test_bit() result. Will this be more efficient
than a call to bitmap_weight() ?

Also, in my case, the third parameter is ts_mask_avail and I don't need
its weight.

I thing users that need to have the dst or src weight should call
bitmap_weight() themselves as this is users context dependent.

bitmap_{scatter,gather}(dst, src, mask, nbits) can be improved later with
no impact to current users (except performance).

That's why I concluded to return nothing from bitmap_{scatter,gather} when
I took the old existing patches.

> 
> > +	if (bitmap_weight(ts_mask, 64) != bitmap_weight(map, 64)) {  
> 
> 	if (n != ...) {
> 
> ?
> 
> > +		dev_err(qmc_hdlc->dev, "Cannot translate timeslots %64pb -> (%64pb, %64pb)\n",
> > +			map, ts_mask_avail, ts_mask);
> > +		return -EINVAL;
> > +	}  
> 
> ...
> 
> > +	bitmap_gather(map, ts_mask, ts_mask_avail, 64);
> > +
> > +	if (bitmap_weight(ts_mask, 64) != bitmap_weight(map, 64)) {
> > +		dev_err(qmc_hdlc->dev, "Cannot translate timeslots (%64pb, %64pb) -> %64pb\n",
> > +			ts_mask_avail, ts_mask, map);
> > +		return -EINVAL;
> > +	}  
> 
> Ditto.
> 

Best regards,
Hervé
