Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F034E849CEB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 15:23:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=WdMAS6Pl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TT7rv66xVz3cTt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 01:23:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=WdMAS6Pl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TT7r628Hhz2yRS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Feb 2024 01:22:26 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B0CD1BF207;
	Mon,  5 Feb 2024 14:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707142935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X2lRUb3hksFq0yfXVR20ELEXLC5m7R4eEvD1161wPtg=;
	b=WdMAS6PlW2bnMePzgM6xEUHFKbQpsK4l7I/RklZs+yFf7G3x3LNLqzH6/eXQ4wk/qSV+ZH
	+6qibOM+9FntESYWxTuAcQNBqOq3A5Nd2SlaeYqAFsibQnE4roQHGyKDfvxFJi0uFhupVr
	RGMjwnie8DBep4z5og7UbQDoAHhlz4eJe7gcGw2todrNHvxTE/l3bBGzmXFHKaBOK2foLC
	VEW/3doORkGTr+/mrjW4QsxUMoloETwRldasNYuCYKYXi5Ef8iwxH0g9yISE3yk5fM/D6x
	TtwHGzwLvp/N7+U5KLqkYV5pxIl4ZFent2eL2dtTVVeacPk8iVDVQ2J6g34iZA==
Date: Mon, 5 Feb 2024 15:22:08 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v2 1/6] net: wan: Add support for QMC HDLC
Message-ID: <20240205152208.73535549@bootlin.com>
In-Reply-To: <b1968b5c7e88edd448d5f55b57dfa40257b2b06c.camel@redhat.com>
References: <20240130084035.115086-1-herve.codina@bootlin.com>
	<20240130084035.115086-2-herve.codina@bootlin.com>
	<b1968b5c7e88edd448d5f55b57dfa40257b2b06c.camel@redhat.com>
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

On Thu, 01 Feb 2024 12:41:32 +0100
Paolo Abeni <pabeni@redhat.com> wrote:

[...]
> > +static inline struct qmc_hdlc *netdev_to_qmc_hdlc(struct net_device *netdev)
> > +{
> > +	return dev_to_hdlc(netdev)->priv;
> > +}  
> 
> Please, no 'inline' function in c files. You could move this function
> and the struct definition into a new, local, header file.

'inline' function specifier will be removed in the next iteration on the series.

> 
> > +static int qmc_hdlc_recv_queue(struct qmc_hdlc *qmc_hdlc, struct qmc_hdlc_desc *desc, size_t size);
> > +
> > +#define QMC_HDLC_RX_ERROR_FLAGS (QMC_RX_FLAG_HDLC_OVF | \
> > +				 QMC_RX_FLAG_HDLC_UNA | \
> > +				 QMC_RX_FLAG_HDLC_ABORT | \
> > +				 QMC_RX_FLAG_HDLC_CRC)
> > +
> > +static void qmc_hcld_recv_complete(void *context, size_t length, unsigned int flags)
> > +{
> > +	struct qmc_hdlc_desc *desc = context;
> > +	struct net_device *netdev = desc->netdev;
> > +	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
> > +	int ret;  
> 
> Please, respect the reverse x-mas tree order for local variable
> definition.

desc depends on context, netdev depends on desc and qmc_hdlc depends on netdev.
I think the declaration order is correct here even it doesn't respect the reverse
x-mas tree.

[...]
> > +static netdev_tx_t qmc_hdlc_xmit(struct sk_buff *skb, struct net_device *netdev)
> > +{
> > +	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
> > +	struct qmc_hdlc_desc *desc;
> > +	unsigned long flags;
> > +	int ret;
> > +
> > +	spin_lock_irqsave(&qmc_hdlc->tx_lock, flags);
> > +	desc = &qmc_hdlc->tx_descs[qmc_hdlc->tx_out];
> > +	if (WARN_ONCE(!desc->skb, "No tx descriptors available\n")) {
> > +		/* Should never happen.
> > +		 * Previous xmit should have already stopped the queue.
> > +		 */
> > +		netif_stop_queue(netdev);
> > +		spin_unlock_irqrestore(&qmc_hdlc->tx_lock, flags);
> > +		return NETDEV_TX_BUSY;
> > +	}
> > +	spin_unlock_irqrestore(&qmc_hdlc->tx_lock, flags);
> > +
> > +	desc->netdev = netdev;
> > +	desc->dma_size = skb->len;
> > +	desc->skb = skb;
> > +	ret = qmc_hdlc_xmit_queue(qmc_hdlc, desc);
> > +	if (ret) {
> > +		desc->skb = NULL; /* Release the descriptor */
> > +		if (ret == -EBUSY) {
> > +			netif_stop_queue(netdev);
> > +			return NETDEV_TX_BUSY;
> > +		}
> > +		dev_kfree_skb(skb);
> > +		netdev->stats.tx_dropped++;
> > +		return NETDEV_TX_OK;
> > +	}
> > +
> > +	qmc_hdlc->tx_out = (qmc_hdlc->tx_out + 1) % ARRAY_SIZE(qmc_hdlc->tx_descs);
> > +
> > +	spin_lock_irqsave(&qmc_hdlc->tx_lock, flags);
> > +	if (qmc_hdlc->tx_descs[qmc_hdlc->tx_out].skb)
> > +		netif_stop_queue(netdev);
> > +	spin_unlock_irqrestore(&qmc_hdlc->tx_lock, flags);  
> 
> The locking schema is quite bad, as the drivers acquires and releases 3
> locks for each tx packet. You could improve that using the qmc_chan-
> >tx_lock to protect the whole qmc_hdlc_xmit() function, factoring out a  
> lockless variant of qmc_hdlc_xmit_queue(), and using it here.

I will change on next iteration and keep 2 lock/unlock instead of 3:
  - one in qmc_hdlc_xmit()
  - one in qmc_hdlc_xmit_complete() 
to protect the descriptors accesses.

> 
> In general is quite bad that the existing infra does not allow
> leveraging NAPI. Have you considered expanding the QMC to accomodate
> such user?

I cannot mask/unmask the 'end of transfer' interrupt.
Indeed, other streams use this interrupt among them audio streams and so
masking the interrupt for HDLC data will also mask the interrupt for audio
data.

At the HDLC driver level, the best I can to is to store a queue of complete
HDLC skbs (queue filled on interrupts) and send them to the network stack
when the napi poll() is called.

I am not sure that this kind of queue (additional level between always
enabled interrupts and the network stack) makes sense.

Do you have any opinion about this additional queue management for NAPI
support?

Best regards,
Hervé
