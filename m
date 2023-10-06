Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCDC7BC18F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 23:47:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UIB5D7QU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2MVN57c7z3vbv
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Oct 2023 08:47:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UIB5D7QU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2MTX5Xr4z3c58
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 08:47:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CD072B82A90;
	Fri,  6 Oct 2023 21:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B17AC433C7;
	Fri,  6 Oct 2023 21:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696628829;
	bh=7ShH9lM/jTtdIpDBd5tkXIdLZJ6EOzXUhDKKnj55xPo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UIB5D7QUgappiPLI6dOoUHSxvt5YAjXDxSa8MYt3/cAFv/c5IHJYHnYTPpU858ZTu
	 ClL/Cf8dYmT/K2AsekQJqM/9c+T/Lu+ejjHS7ojVK3HC8q8o9i3501u//0M0XEEIUA
	 kQhpB665WwNyXG+96GLLJwQmYMwetRfLQ0qkrS4cswc44g/UYawosmoi4NMFiFOe4q
	 duYX45Tg97UhJ6fdrukD6yY2MmoCfaH9XlYzON02quQybVLTyXOqpCIZOPLdLN7pvz
	 WNUh6/12mNBI+Q820T8snzNGUsqfrHG91QPyG1E9MvoRh77CxpA+aVQH87ZXbvLdOH
	 hY2YnF6sVQk4Q==
Date: Fri, 6 Oct 2023 14:47:02 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v7 10/30] net: wan: Add support for QMC HDLC
Message-ID: <20231006144702.778c165e@kernel.org>
In-Reply-To: <20230928070652.330429-11-herve.codina@bootlin.com>
References: <20230928070652.330429-1-herve.codina@bootlin.com>
	<20230928070652.330429-11-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 28 Sep 2023 09:06:28 +0200 Herve Codina wrote:
> +static int qmc_hdlc_close(struct net_device *netdev)
> +{
> +	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
> +	struct qmc_hdlc_desc *desc;
> +	int i;
> +
> +	netif_stop_queue(netdev);
> +
> +	qmc_chan_stop(qmc_hdlc->qmc_chan, QMC_CHAN_ALL);
> +	qmc_chan_reset(qmc_hdlc->qmc_chan, QMC_CHAN_ALL);

stopping the queue looks a bit racy, a completion may come in 
and restart the queue

> +	for (i = 0; i < ARRAY_SIZE(qmc_hdlc->tx_descs); i++) {
> +		desc = &qmc_hdlc->tx_descs[i];
> +		if (!desc->skb)
> +			continue;
> +		dma_unmap_single(qmc_hdlc->dev, desc->dma_addr, desc->dma_size,
> +				 DMA_TO_DEVICE);
> +		kfree_skb(desc->skb);
> +		desc->skb = NULL;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(qmc_hdlc->rx_descs); i++) {
> +		desc = &qmc_hdlc->rx_descs[i];
> +		if (!desc->skb)
> +			continue;
> +		dma_unmap_single(qmc_hdlc->dev, desc->dma_addr, desc->dma_size,
> +				 DMA_FROM_DEVICE);
> +		kfree_skb(desc->skb);
> +		desc->skb = NULL;
> +	}
> +
> +	hdlc_close(netdev);
