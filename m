Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA4C849DA1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 16:01:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=oX3xciPi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TT8j42JVdz3cWs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 02:01:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=oX3xciPi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::229; helo=relay9-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TT8hL2XmYz3069
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Feb 2024 02:00:48 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8545EFF814;
	Mon,  5 Feb 2024 15:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707145241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PEE4+JdfTjyn6YerADKkv+gio5Qai05SHvunF75uvZU=;
	b=oX3xciPiOpgsx1o4tDNRxIBoA7dmBw3a39tOa1P386RMNRDh0M00hwbtZuiQQg6pZ/wtHS
	HSgTnpDkxu/BejnrNyEVqNww/V2jr2k0ZJ1+hx3SYYdgB73/NdEeZBcHt3bjBPzZ6FlYMY
	IjC2YdExejSDAcHawCwPefQ9a1DbrsbPuIAmum/7i00XyTJZWQZRw3hJ3Ly44jsone5EDw
	QxORhCF4x1c0u6roUFaB8F4RX6oGu+FWBJmuS82JVdOIntjx8Phy7oZ70xXKLJnwd+vbY7
	HHum87IPtjxZ9/EtxpZCe5nlAi0ygarL1gEABTngUxDw4/mTwf42W5KxSHnH1Q==
Date: Mon, 5 Feb 2024 16:00:33 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v2 5/6] net: wan: fsl_qmc_hdlc: Add runtime timeslots
 changes support
Message-ID: <20240205160033.2c017f46@bootlin.com>
In-Reply-To: <a8845eca2d9bab5d7805c19a16811820671c41f2.camel@redhat.com>
References: <20240130084035.115086-1-herve.codina@bootlin.com>
	<20240130084035.115086-6-herve.codina@bootlin.com>
	<a8845eca2d9bab5d7805c19a16811820671c41f2.camel@redhat.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Paolo,

On Thu, 01 Feb 2024 13:01:51 +0100
Paolo Abeni <pabeni@redhat.com> wrote:

[...]
> >  
> > +static int qmc_hdlc_xlate_slot_map(struct qmc_hdlc *qmc_hdlc,
> > +				   u32 slot_map, struct qmc_chan_ts_info *ts_info)
> > +{
> > +	DECLARE_BITMAP(ts_mask_avail, 64);
> > +	DECLARE_BITMAP(ts_mask, 64);
> > +	DECLARE_BITMAP(map, 64);
> > +	u32 array32[2];
> > +
> > +	/* Tx and Rx available masks must be identical */
> > +	if (ts_info->rx_ts_mask_avail != ts_info->tx_ts_mask_avail) {
> > +		dev_err(qmc_hdlc->dev, "tx and rx available timeslots mismatch (0x%llx, 0x%llx)\n",
> > +			ts_info->rx_ts_mask_avail, ts_info->tx_ts_mask_avail);
> > +		return -EINVAL;
> > +	}
> > +
> > +	bitmap_from_arr64(ts_mask_avail, &ts_info->rx_ts_mask_avail, 64);
> > +	array32[0] = slot_map;
> > +	array32[1] = 0;
> > +	bitmap_from_arr32(map, array32, 64);  
> 
> What about using bitmap_from_u64 everywhere ?

Yes indeed.
Will be updated in the next series iteration.

Thanks for this review.
Best regards,
Hervé
