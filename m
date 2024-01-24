Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B4483AD48
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 16:27:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=XOOstg60;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TKnrp1bJ1z3cSv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 02:27:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=XOOstg60;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.195; helo=relay3-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TKnr150ZQz2yRS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 02:26:55 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A345160007;
	Wed, 24 Jan 2024 15:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706110010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TGKqb8PfNbcdc7vOG6mzmbB70CQFl8QHgJOa/gqXS78=;
	b=XOOstg60KgIbgyGgmgT6sVR+BznJZGxgtuMaNvi2uKxrvRhNy0pjmLTdmOBWrHpbzQOpxS
	gUiZyRRXGNu/gasgAWh7ilfgenSA6py0gC5+riKvq+4tO+vAfjwYeezowvUng4cyc4v/Mt
	oGwBLecvDGt1t2XaQfjyOaYG/KulXg4RiGl8yVc+xE//JvRuqhAxWcw7bAA6+Eewl1AViQ
	/MUZjmldwWdDWBo8f4Vws99TzRH2Y4MtOhK/JhxY8OFw/Cy7f2GTJtGR7xmQwLRH+897pa
	5Z2z5yCNRuXSmtflltBdnP2vfasJ9Lm/Do09I6ql4bK1psTTfe//1/331v8bTA==
Date: Wed, 24 Jan 2024 16:26:46 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: Re: [PATCH 3/4] net: wan: fsl_qmc_hdlc: Add runtime timeslots
 changes support
Message-ID: <20240124162646.24bf9235@bootlin.com>
In-Reply-To: <fc421c38-66b7-4d4e-abfa-051eccbf793c@linux.dev>
References: <20240123164912.249540-1-herve.codina@bootlin.com>
	<20240123164912.249540-4-herve.codina@bootlin.com>
	<fc421c38-66b7-4d4e-abfa-051eccbf793c@linux.dev>
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
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Vadim,

On Wed, 24 Jan 2024 10:10:46 +0000
Vadim Fedorenko <vadim.fedorenko@linux.dev> wrote:

[...]
> > +static int qmc_hdlc_xlate_slot_map(struct qmc_hdlc *qmc_hdlc,
> > +				   u32 slot_map, struct qmc_chan_ts_info *ts_info)
> > +{
> > +	u64 ts_mask_avail;
> > +	unsigned int bit;
> > +	unsigned int i;
> > +	u64 ts_mask;
> > +	u64 map;
> > +
> > +	/* Tx and Rx masks must be identical */
> > +	if (ts_info->rx_ts_mask_avail != ts_info->tx_ts_mask_avail) {
> > +		dev_err(qmc_hdlc->dev, "tx and rx available timeslots mismatch (0x%llx, 0x%llx)\n",
> > +			ts_info->rx_ts_mask_avail, ts_info->tx_ts_mask_avail);
> > +		return -EINVAL;
> > +	}
> > +
> > +	ts_mask_avail = ts_info->rx_ts_mask_avail;
> > +	ts_mask = 0;
> > +	map = slot_map;
> > +	bit = 0;
> > +	for (i = 0; i < 64; i++) {
> > +		if (ts_mask_avail & BIT_ULL(i)) {
> > +			if (map & BIT_ULL(bit))
> > +				ts_mask |= BIT_ULL(i);
> > +			bit++;
> > +		}
> > +	}
> > +
> > +	if (hweight64(ts_mask) != hweight64(map)) {
> > +		dev_err(qmc_hdlc->dev, "Cannot translate timeslots 0x%llx -> (0x%llx,0x%llx)\n",
> > +			map, ts_mask_avail, ts_mask);
> > +		return -EINVAL;
> > +	}
> > +
> > +	ts_info->tx_ts_mask = ts_mask;
> > +	ts_info->rx_ts_mask = ts_mask;
> > +	return 0;
> > +}
> > +
> > +static int qmc_hdlc_xlate_ts_info(struct qmc_hdlc *qmc_hdlc,
> > +				  const struct qmc_chan_ts_info *ts_info, u32 *slot_map)
> > +{
> > +	u64 ts_mask_avail;
> > +	unsigned int bit;
> > +	unsigned int i;
> > +	u64 ts_mask;
> > +	u64 map;
> > +  
> 
> Starting from here ...
> 
> > +	/* Tx and Rx masks must be identical */
> > +	if (ts_info->rx_ts_mask_avail != ts_info->tx_ts_mask_avail) {
> > +		dev_err(qmc_hdlc->dev, "tx and rx available timeslots mismatch (0x%llx, 0x%llx)\n",
> > +			ts_info->rx_ts_mask_avail, ts_info->tx_ts_mask_avail);
> > +		return -EINVAL;
> > +	}
> > +	if (ts_info->rx_ts_mask != ts_info->tx_ts_mask) {
> > +		dev_err(qmc_hdlc->dev, "tx and rx timeslots mismatch (0x%llx, 0x%llx)\n",
> > +			ts_info->rx_ts_mask, ts_info->tx_ts_mask);
> > +		return -EINVAL;
> > +	}
> > +
> > +	ts_mask_avail = ts_info->rx_ts_mask_avail;
> > +	ts_mask = ts_info->rx_ts_mask;
> > +	map = 0;
> > +	bit = 0;
> > +	for (i = 0; i < 64; i++) {
> > +		if (ts_mask_avail & BIT_ULL(i)) {
> > +			if (ts_mask & BIT_ULL(i))
> > +				map |= BIT_ULL(bit);
> > +			bit++;
> > +		}
> > +	}
> > +
> > +	if (hweight64(ts_mask) != hweight64(map)) {
> > +		dev_err(qmc_hdlc->dev, "Cannot translate timeslots (0x%llx,0x%llx) -> 0x%llx\n",
> > +			ts_mask_avail, ts_mask, map);
> > +		return -EINVAL;
> > +	}
> > +  
> 
> till here the block looks like copy of the block from previous function.
> It worth to make a separate function for it, I think.
> 
> > +	if (map >= BIT_ULL(32)) {
> > +		dev_err(qmc_hdlc->dev, "Slot map out of 32bit (0x%llx,0x%llx) -> 0x%llx\n",
> > +			ts_mask_avail, ts_mask, map);
> > +		return -EINVAL;
> > +	}
> > +
> > +	*slot_map = map;
> > +	return 0;
> > +}
> > +
[...]

I am not so sure. There are slighty differences between the two functions.
The error messages and, in particular, the loop in qmc_hdlc_xlate_slot_map() is:
	--- 8< ---
	ts_mask_avail = ts_info->rx_ts_mask_avail;
	ts_mask = 0;
	map = slot_map;
	bit = 0;
	for (i = 0; i < 64; i++) {
		if (ts_mask_avail & BIT_ULL(i)) {
			if (map & BIT_ULL(bit))
				ts_mask |= BIT_ULL(i);
			bit++;
		}
	}
	--- 8< ---

whereas it is the following in qmc_hdlc_xlate_ts_info():
	--- 8< ---
	ts_mask_avail = ts_info->rx_ts_mask_avail;
	ts_mask = ts_info->rx_ts_mask;
	map = 0;
	bit = 0;
	for (i = 0; i < 64; i++) {
		if (ts_mask_avail & BIT_ULL(i)) {
			if (ts_mask & BIT_ULL(i))
				map |= BIT_ULL(bit);
			bit++;
		}
	}
	--- 8< ---

ts_map and map initializations are not the same, i and bit are not used for
the same purpose and the computed value is not computed based on the same
information.

With that pointed, I am not sure that having some common code for both
function will be relevant. Your opinion ?

Best regards,
Hervé
