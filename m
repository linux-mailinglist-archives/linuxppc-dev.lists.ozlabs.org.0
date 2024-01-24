Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3580B83B64F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 02:00:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MZuIvdus;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TL2YB0tNNz3cSv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 11:59:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MZuIvdus;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::ab; helo=out-171.mta0.migadu.com; envelope-from=vadim.fedorenko@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 22516 seconds by postgrey-1.37 at boromir; Thu, 25 Jan 2024 03:19:42 AEDT
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [IPv6:2001:41d0:1004:224b::ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TKq0t2Tf6z3bnk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 03:19:38 +1100 (AEDT)
Message-ID: <c8b3c672-864b-497a-9348-383412632a3d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1706113150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T7nuOJoOmUuNlLsb7W1RUqVrxhJT9IAhy3vPZcivD/I=;
	b=MZuIvdus+xtMhzYerD1BMQmgJbGcBrj5pn4Z0ucLu1/71jxF5Cscc8r/KuSfTEpRSm1nSW
	H1LF8UzaGhvZYjGnOGoRJKeRBNW4h3ZGETfUWj/DUvjdpcD2EOPetvR0xBWhn4+GKkzOG4
	mYRsBNdeKut6M/thnO7yA83MG+7raEA=
Date: Wed, 24 Jan 2024 16:19:03 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] net: wan: fsl_qmc_hdlc: Add runtime timeslots changes
 support
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>
References: <20240123164912.249540-1-herve.codina@bootlin.com>
 <20240123164912.249540-4-herve.codina@bootlin.com>
 <fc421c38-66b7-4d4e-abfa-051eccbf793c@linux.dev>
 <20240124162646.24bf9235@bootlin.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20240124162646.24bf9235@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Thu, 25 Jan 2024 11:57:05 +1100
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

On 24/01/2024 15:26, Herve Codina wrote:
> Hi Vadim,
> 
> On Wed, 24 Jan 2024 10:10:46 +0000
> Vadim Fedorenko <vadim.fedorenko@linux.dev> wrote:
> 
> [...]
>>> +static int qmc_hdlc_xlate_slot_map(struct qmc_hdlc *qmc_hdlc,
>>> +				   u32 slot_map, struct qmc_chan_ts_info *ts_info)
>>> +{
>>> +	u64 ts_mask_avail;
>>> +	unsigned int bit;
>>> +	unsigned int i;
>>> +	u64 ts_mask;
>>> +	u64 map;
>>> +
>>> +	/* Tx and Rx masks must be identical */
>>> +	if (ts_info->rx_ts_mask_avail != ts_info->tx_ts_mask_avail) {
>>> +		dev_err(qmc_hdlc->dev, "tx and rx available timeslots mismatch (0x%llx, 0x%llx)\n",
>>> +			ts_info->rx_ts_mask_avail, ts_info->tx_ts_mask_avail);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	ts_mask_avail = ts_info->rx_ts_mask_avail;
>>> +	ts_mask = 0;
>>> +	map = slot_map;
>>> +	bit = 0;
>>> +	for (i = 0; i < 64; i++) {
>>> +		if (ts_mask_avail & BIT_ULL(i)) {
>>> +			if (map & BIT_ULL(bit))
>>> +				ts_mask |= BIT_ULL(i);
>>> +			bit++;
>>> +		}
>>> +	}
>>> +
>>> +	if (hweight64(ts_mask) != hweight64(map)) {
>>> +		dev_err(qmc_hdlc->dev, "Cannot translate timeslots 0x%llx -> (0x%llx,0x%llx)\n",
>>> +			map, ts_mask_avail, ts_mask);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	ts_info->tx_ts_mask = ts_mask;
>>> +	ts_info->rx_ts_mask = ts_mask;
>>> +	return 0;
>>> +}
>>> +
>>> +static int qmc_hdlc_xlate_ts_info(struct qmc_hdlc *qmc_hdlc,
>>> +				  const struct qmc_chan_ts_info *ts_info, u32 *slot_map)
>>> +{
>>> +	u64 ts_mask_avail;
>>> +	unsigned int bit;
>>> +	unsigned int i;
>>> +	u64 ts_mask;
>>> +	u64 map;
>>> +
>>
>> Starting from here ...
>>
>>> +	/* Tx and Rx masks must be identical */
>>> +	if (ts_info->rx_ts_mask_avail != ts_info->tx_ts_mask_avail) {
>>> +		dev_err(qmc_hdlc->dev, "tx and rx available timeslots mismatch (0x%llx, 0x%llx)\n",
>>> +			ts_info->rx_ts_mask_avail, ts_info->tx_ts_mask_avail);
>>> +		return -EINVAL;
>>> +	}
>>> +	if (ts_info->rx_ts_mask != ts_info->tx_ts_mask) {
>>> +		dev_err(qmc_hdlc->dev, "tx and rx timeslots mismatch (0x%llx, 0x%llx)\n",
>>> +			ts_info->rx_ts_mask, ts_info->tx_ts_mask);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	ts_mask_avail = ts_info->rx_ts_mask_avail;
>>> +	ts_mask = ts_info->rx_ts_mask;
>>> +	map = 0;
>>> +	bit = 0;
>>> +	for (i = 0; i < 64; i++) {
>>> +		if (ts_mask_avail & BIT_ULL(i)) {
>>> +			if (ts_mask & BIT_ULL(i))
>>> +				map |= BIT_ULL(bit);
>>> +			bit++;
>>> +		}
>>> +	}
>>> +
>>> +	if (hweight64(ts_mask) != hweight64(map)) {
>>> +		dev_err(qmc_hdlc->dev, "Cannot translate timeslots (0x%llx,0x%llx) -> 0x%llx\n",
>>> +			ts_mask_avail, ts_mask, map);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>
>> till here the block looks like copy of the block from previous function.
>> It worth to make a separate function for it, I think.
>>
>>> +	if (map >= BIT_ULL(32)) {
>>> +		dev_err(qmc_hdlc->dev, "Slot map out of 32bit (0x%llx,0x%llx) -> 0x%llx\n",
>>> +			ts_mask_avail, ts_mask, map);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	*slot_map = map;
>>> +	return 0;
>>> +}
>>> +
> [...]
> 
> I am not so sure. There are slighty differences between the two functions.
> The error messages and, in particular, the loop in qmc_hdlc_xlate_slot_map() is:
> 	--- 8< ---
> 	ts_mask_avail = ts_info->rx_ts_mask_avail;
> 	ts_mask = 0;
> 	map = slot_map;
> 	bit = 0;
> 	for (i = 0; i < 64; i++) {
> 		if (ts_mask_avail & BIT_ULL(i)) {
> 			if (map & BIT_ULL(bit))
> 				ts_mask |= BIT_ULL(i);
> 			bit++;
> 		}
> 	}
> 	--- 8< ---
> 
> whereas it is the following in qmc_hdlc_xlate_ts_info():
> 	--- 8< ---
> 	ts_mask_avail = ts_info->rx_ts_mask_avail;
> 	ts_mask = ts_info->rx_ts_mask;
> 	map = 0;
> 	bit = 0;
> 	for (i = 0; i < 64; i++) {
> 		if (ts_mask_avail & BIT_ULL(i)) {
> 			if (ts_mask & BIT_ULL(i))
> 				map |= BIT_ULL(bit);
> 			bit++;
> 		}
> 	}
> 	--- 8< ---
> 
> ts_map and map initializations are not the same, i and bit are not used for
> the same purpose and the computed value is not computed based on the same
> information.
> 
> With that pointed, I am not sure that having some common code for both
> function will be relevant. Your opinion ?

I see. I'm just thinking if it's possible to use helpers from bitops.h
and bitmap.h here to avoid open-coding common parts of the code.

> Best regards,
> Hervé

