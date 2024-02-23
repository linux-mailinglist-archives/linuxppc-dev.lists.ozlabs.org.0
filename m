Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8361861865
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 17:47:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=dZhYmf3q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ThGCL5ksCz3vb5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 03:47:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=dZhYmf3q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ThGBH0bGMz3vYR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Feb 2024 03:46:43 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 962AC1BF204;
	Fri, 23 Feb 2024 16:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708706799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bWQmwnP9Sycw3m4V6z0MFA7V8AKD1xj5qu/ok9h5gIc=;
	b=dZhYmf3qGRdNefjbopqjT2IeJHh7On4e+7vPoNcsu5o6flHpounET/Oh975AJrV1/QNgBA
	YiBy8tCWnPWxrGfGbcNoRVh7v+TrK2u/6No7VTbUHkimgvOaYVBXOZHPPpBx+TP6Jzu86u
	V2KaxQCmsHTYlNeU0kGxxOdOBUlae/VdMECBwUd9nJqvrvjj9Fp7U3t/HWgvzBCJn8vJtY
	RPuJRHnQ6wEBWQu/uOhsjl/2Kr2eTw+WhMV7bHsNA25GgrCu4ftus3JslQlcDf7kqZC+y/
	29jgpITfZcChdDJ2mPGDfpgYfK2RIrqakAXe1E2DabQqKJ5p+nLAy0I76vx1Tw==
Date: Fri, 23 Feb 2024 17:46:35 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 4/5] net: wan: fsl_qmc_hdlc: Add runtime timeslots
 changes support
Message-ID: <20240223174635.43e8b2f4@bootlin.com>
In-Reply-To: <Zddslpw398MJ49SS@smile.fi.intel.com>
References: <20240222142219.441767-1-herve.codina@bootlin.com>
	<20240222142219.441767-5-herve.codina@bootlin.com>
	<Zddslpw398MJ49SS@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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

On Thu, 22 Feb 2024 17:47:34 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

...

> > +static int qmc_hdlc_xlate_slot_map(struct qmc_hdlc *qmc_hdlc,
> > +				   u32 slot_map, struct qmc_chan_ts_info *ts_info)
> > +{
> > +	DECLARE_BITMAP(ts_mask_avail, 64);
> > +	DECLARE_BITMAP(ts_mask, 64);
> > +	DECLARE_BITMAP(map, 64);  
> 
> Perhaps more 1:1 naming?
> 
> 	DECLARE_BITMAP(rx_ts_mask_avail, 64);
> 	DECLARE_BITMAP(tx_ts_mask, 64);
> 	DECLARE_BITMAP(slot_map, 64);

I disagree.

I first check that ts_info->rx_ts_mask_avail and ts_info->tx_ts_mask_avail are
identical then I use one of them to create the ts_mask_avail.
Then I compute the ts_mask and update both ts_info->tx_ts_mask and
ts_info->rx_ts_mask.

ts_mask_avail and ts_mask bitmaps are used for tx and rx.
I could name them txrx_ts_mask* but that doesn't do much.

For DECLARE_BITMAP(slot_map, 64), slot_map is the name of the function
parameter...
I think we can keep 'map' for the bitmap here.

> 
> > +	/* Tx and Rx available masks must be identical */
> > +	if (ts_info->rx_ts_mask_avail != ts_info->tx_ts_mask_avail) {
> > +		dev_err(qmc_hdlc->dev, "tx and rx available timeslots mismatch (0x%llx, 0x%llx)\n",
> > +			ts_info->rx_ts_mask_avail, ts_info->tx_ts_mask_avail);
> > +		return -EINVAL;
> > +	}
> > +
> > +	bitmap_from_u64(ts_mask_avail, ts_info->rx_ts_mask_avail);
> > +	bitmap_from_u64(map, slot_map);
> > +	bitmap_scatter(ts_mask, map, ts_mask_avail, 64);
> > +
> > +	if (bitmap_weight(ts_mask, 64) != bitmap_weight(map, 64)) {
> > +		dev_err(qmc_hdlc->dev, "Cannot translate timeslots %*pb -> (%*pb, %*pb)\n",
> > +			64, map, 64, ts_mask_avail, 64, ts_mask);  
> 
> 
> You can save a bit of code and stack:

Will be updated in the next iteration.

...
 
> > +	ret = qmc_chan_get_ts_info(qmc_hdlc->qmc_chan, &ts_info);
> > +	if (ret) {
> > +		dev_err(qmc_hdlc->dev, "get QMC channel ts info failed %d\n", ret);
> > +		return ret;  
> 
> 		return dev_err_probe(...);

Will be updated too :)

> 
> > +	}  
> 

Thanks for the review,
Hervé
