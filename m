Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB6685FE60
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 17:46:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=dtJdpcTG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgfCq1FKMz3dWQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 03:45:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=dtJdpcTG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::225; helo=relay5-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgfC3238Wz3ccV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 03:45:16 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F0FA1C000E;
	Thu, 22 Feb 2024 16:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708620305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ugQVlVJpeQXBsFdN2IMSxN837NOg0+Zdb5sbx96BxmA=;
	b=dtJdpcTGIjeSZZpYrmyBG59jMtXBRcV5N1W+0XWKz/Zk/TuUEsQG4YgGfunYWBIIuCkQij
	7m7qEXCXzlnByoVeJHPniQmq4/X10I+ydMDG1OJnnaHxo9RdSwSwavnAip0d/+9qVJACq6
	hTnI7jGBLT525O3JjOTnwTZApqfq8bb8aLdR1n0obY8hK8e1VDK3qF0VHlXa63q6hIw3Aq
	o1jGlT4P70nIA3vIbCjePvwB8obkynKcAJpZfF81ug1oxMYZuFuwSvcoTMq0uDSfwd4d/a
	AF/R3qkhF/Sq90kMKXtXpFhgG3Y89lm4lIXpWEqTvZ5ON8qkrFA2e/2ps4h4lA==
Date: Thu, 22 Feb 2024 17:45:01 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 1/5] net: wan: Add support for QMC HDLC
Message-ID: <20240222174501.4cbe03ab@bootlin.com>
In-Reply-To: <ZddoQTg32unJJ_qP@smile.fi.intel.com>
References: <20240222142219.441767-1-herve.codina@bootlin.com>
	<20240222142219.441767-2-herve.codina@bootlin.com>
	<ZddoQTg32unJJ_qP@smile.fi.intel.com>
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

On Thu, 22 Feb 2024 17:29:05 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Thu, Feb 22, 2024 at 03:22:14PM +0100, Herve Codina wrote:
> > The QMC HDLC driver provides support for HDLC using the QMC (QUICC
> > Multichannel Controller) to transfer the HDLC data.  
> 
> ...
> 
> > +struct qmc_hdlc {
> > +	struct device *dev;
> > +	struct qmc_chan *qmc_chan;
> > +	struct net_device *netdev;
> > +	bool is_crc32;
> > +	spinlock_t tx_lock; /* Protect tx descriptors */  
> 
> Just wondering if above tx/rx descriptors should be aligned on a cacheline
> for DMA?

These descriptors are not used by DMA.
Not sure that aligning them to a cacheline is really needed.

> 
> > +	struct qmc_hdlc_desc tx_descs[8];
> > +	unsigned int tx_out;
> > +	struct qmc_hdlc_desc rx_descs[4];
> > +};  
> 
> ...
> 
> > +#define QMC_HDLC_RX_ERROR_FLAGS (QMC_RX_FLAG_HDLC_OVF | \
> > +				 QMC_RX_FLAG_HDLC_UNA | \
> > +				 QMC_RX_FLAG_HDLC_ABORT | \
> > +				 QMC_RX_FLAG_HDLC_CRC)  
> 
> Wouldn't be slightly better to have it as
> 
> #define QMC_HDLC_RX_ERROR_FLAGS				\
> 	(QMC_RX_FLAG_HDLC_OVF | QMC_RX_FLAG_HDLC_UNA |	\
> 	 QMC_RX_FLAG_HDLC_CRC | QMC_RX_FLAG_HDLC_ABORT)
> 
> ?

Will be done in the next iteration.

> 
> ...
> 
> > +	ret = qmc_chan_write_submit(qmc_hdlc->qmc_chan, desc->dma_addr, desc->dma_size,
> > +				    qmc_hdlc_xmit_complete, desc);
> > +	if (ret) {  
> 
> > +		dev_err(qmc_hdlc->dev, "qmc chan write returns %d\n", ret);
> > +		dma_unmap_single(qmc_hdlc->dev, desc->dma_addr, desc->dma_size, DMA_TO_DEVICE);
> > +		return ret;  
> 
> I would do other way around, i.e. release resource followed up by printing
> a message. Printing a message is a slow operation and may prevent the (soon
> freed) resources to be re-used earlier.

Will do that in the next iteration.

> 
> > +	}  
> 
> ...
> 
> > +	spin_lock_irqsave(&qmc_hdlc->tx_lock, flags);  
> 
> Why not using cleanup.h from day 1?

I don't know about cleanup.h.
Can you tell me more ?
How should I use it ?

> 
> > +end:  
> 
> This label, in particular, will not be needed with above in place.
> 
> > +	spin_unlock_irqrestore(&qmc_hdlc->tx_lock, flags);
> > +	return ret;
> > +}  
> 
> ...
> 
> > +	/* Queue as many recv descriptors as possible */
> > +	for (i = 0; i < ARRAY_SIZE(qmc_hdlc->rx_descs); i++) {
> > +		desc = &qmc_hdlc->rx_descs[i];
> > +
> > +		desc->netdev = netdev;
> > +		ret = qmc_hdlc_recv_queue(qmc_hdlc, desc, chan_param.hdlc.max_rx_buf_size);  
> 
> > +		if (ret) {
> > +			if (ret == -EBUSY && i != 0)
> > +				break; /* We use all the QMC chan capability */
> > +			goto free_desc;
> > +		}  
> 
> Can be unfolded to
> 
> 		if (ret == -EBUSY && i)
> 			break; /* We use all the QMC chan capability */
> 		if (ret)
> 			goto free_desc;
> 
> Easy to read and understand.

Sure, will be changed.

> 
> > +	}  
> 
> ...
> 
> > +static int qmc_hdlc_probe(struct platform_device *pdev)
> > +{  
> 
> With
> 
> 	struct device *dev = &pdev->dev;
> 
> the below code will be neater (see other comments for the examples).

Will use that.

> 
> > +	struct device_node *np = pdev->dev.of_node;  
> 
> It is used only once, drop it (see below).

Ok.

> 
> > +	struct qmc_hdlc *qmc_hdlc;
> > +	struct qmc_chan_info info;
> > +	hdlc_device *hdlc;
> > +	int ret;
> > +
> > +	qmc_hdlc = devm_kzalloc(&pdev->dev, sizeof(*qmc_hdlc), GFP_KERNEL);
> > +	if (!qmc_hdlc)
> > +		return -ENOMEM;
> > +
> > +	qmc_hdlc->dev = &pdev->dev;
> > +	spin_lock_init(&qmc_hdlc->tx_lock);
> > +
> > +	qmc_hdlc->qmc_chan = devm_qmc_chan_get_bychild(qmc_hdlc->dev, np);  
> 
> 	qmc_hdlc->qmc_chan = devm_qmc_chan_get_bychild(dev, dev->of_node);
> 
> > +	if (IS_ERR(qmc_hdlc->qmc_chan)) {
> > +		ret = PTR_ERR(qmc_hdlc->qmc_chan);
> > +		return dev_err_probe(qmc_hdlc->dev, ret, "get QMC channel failed\n");  
> 
> 		return dev_err_probe(dev, PTR_ERR(qmc_hdlc->qmc_chan), "get QMC channel failed\n");
> 
> > +	}
> > +
> > +	ret = qmc_chan_get_info(qmc_hdlc->qmc_chan, &info);
> > +	if (ret) {  
> 
> > +		dev_err(qmc_hdlc->dev, "get QMC channel info failed %d\n", ret);
> > +		return ret;  
> 
> Why not using same message pattern everywhere, i.e. dev_err_probe()?
> 
> 		return dev_err_probe(dev, ret, "get QMC channel info failed\n");
> 
> (and so on...)

No reason. Just because I missed them.
Will be updated using dev_err_probe().

> 
> > +	}
> > +
> > +	if (info.mode != QMC_HDLC) {
> > +		dev_err(qmc_hdlc->dev, "QMC chan mode %d is not QMC_HDLC\n",
> > +			info.mode);
> > +		return -EINVAL;
> > +	}
> > +
> > +	qmc_hdlc->netdev = alloc_hdlcdev(qmc_hdlc);
> > +	if (!qmc_hdlc->netdev) {  
> 
> > +		dev_err(qmc_hdlc->dev, "failed to alloc hdlc dev\n");
> > +		return -ENOMEM;  
> 
> We do not issue a message for -ENOMEM.

And I know :(
Will be updated.

> 
> > +	}
> > +
> > +	hdlc = dev_to_hdlc(qmc_hdlc->netdev);
> > +	hdlc->attach = qmc_hdlc_attach;
> > +	hdlc->xmit = qmc_hdlc_xmit;
> > +	SET_NETDEV_DEV(qmc_hdlc->netdev, qmc_hdlc->dev);
> > +	qmc_hdlc->netdev->tx_queue_len = ARRAY_SIZE(qmc_hdlc->tx_descs);
> > +	qmc_hdlc->netdev->netdev_ops = &qmc_hdlc_netdev_ops;
> > +	ret = register_hdlc_device(qmc_hdlc->netdev);
> > +	if (ret) {
> > +		dev_err(qmc_hdlc->dev, "failed to register hdlc device (%d)\n", ret);
> > +		goto free_netdev;
> > +	}
> > +
> > +	platform_set_drvdata(pdev, qmc_hdlc);
> > +
> > +	return 0;
> > +
> > +free_netdev:
> > +	free_netdev(qmc_hdlc->netdev);
> > +	return ret;
> > +}  
> 
> 

Thanks for the review.

Hervé
