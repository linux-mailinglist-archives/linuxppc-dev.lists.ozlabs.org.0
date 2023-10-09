Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BCB7BE2BB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 16:27:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ptdUM/7c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S41Zs1JyNz3dKL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 01:27:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ptdUM/7c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.195; helo=relay3-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S41Yy4FDJz2yts
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 01:26:44 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E7FF60003;
	Mon,  9 Oct 2023 14:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696861598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=92a8cVu3f6Pk3ndmVwnkeBH7DnuU13PZsLWlEFgkb+8=;
	b=ptdUM/7cMSJVYbBrfF6v7pOBngBBoqD2a0R/MUuEMeanPcoDEjfHKfSoM8A8bH79+drPz+
	rV97RU0p5QyeWtYFPXNPPjzGoSwoAmb7zdtM9zta8Rt3qazcKpntePvK1epyDuMN8Yy2hm
	c/19/YApYNnYXqqPcSlzxHZDNltzGOFF0avCXI1W6tyEQLx7YzapC/yKZuEgCSulDYhE2G
	tiyCi8WMCoTIVnh6t72FOyCiEhCyW0D3+DoI+D5rSdROAfpCBAIJTfQNC5r7tEla35zU7C
	xa3pdnMAu7WiFZoTgbzZKx+vu0/qFQeygmLxg4z1lzB3Rw48ksl43ELSnmswNA==
Date: Mon, 9 Oct 2023 16:26:32 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v7 10/30] net: wan: Add support for QMC HDLC
Message-ID: <20231009162632.7f11a6d9@bootlin.com>
In-Reply-To: <20231006144702.778c165e@kernel.org>
References: <20230928070652.330429-1-herve.codina@bootlin.com>
	<20230928070652.330429-11-herve.codina@bootlin.com>
	<20231006144702.778c165e@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Takashi Iwai <tiwai@suse.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, Simon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jakub,

On Fri, 6 Oct 2023 14:47:02 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Thu, 28 Sep 2023 09:06:28 +0200 Herve Codina wrote:
> > +static int qmc_hdlc_close(struct net_device *netdev)
> > +{
> > +	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
> > +	struct qmc_hdlc_desc *desc;
> > +	int i;
> > +
> > +	netif_stop_queue(netdev);
> > +
> > +	qmc_chan_stop(qmc_hdlc->qmc_chan, QMC_CHAN_ALL);
> > +	qmc_chan_reset(qmc_hdlc->qmc_chan, QMC_CHAN_ALL);  
> 
> stopping the queue looks a bit racy, a completion may come in 
> and restart the queue

Indeed, qmc_hdlc_xmit_complete() completion can restart the queue.

I will call netif_stop_queue() after calling qmc_chan_stop/reset().
This is the simple way to fix that without adding an internal flag.

Thanks for pointing that.

Best regards,
Hervé

> 
> > +	for (i = 0; i < ARRAY_SIZE(qmc_hdlc->tx_descs); i++) {
> > +		desc = &qmc_hdlc->tx_descs[i];
> > +		if (!desc->skb)
> > +			continue;
> > +		dma_unmap_single(qmc_hdlc->dev, desc->dma_addr, desc->dma_size,
> > +				 DMA_TO_DEVICE);
> > +		kfree_skb(desc->skb);
> > +		desc->skb = NULL;
> > +	}
> > +
> > +	for (i = 0; i < ARRAY_SIZE(qmc_hdlc->rx_descs); i++) {
> > +		desc = &qmc_hdlc->rx_descs[i];
> > +		if (!desc->skb)
> > +			continue;
> > +		dma_unmap_single(qmc_hdlc->dev, desc->dma_addr, desc->dma_size,
> > +				 DMA_FROM_DEVICE);
> > +		kfree_skb(desc->skb);
> > +		desc->skb = NULL;
> > +	}
> > +
> > +	hdlc_close(netdev);  
