Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFD183AC23
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 15:40:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=PLi9BNiv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TKmpY4mhFz3cYJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 01:40:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=PLi9BNiv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::226; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TKmnY64C6z3cPN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 01:39:42 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26458C000A;
	Wed, 24 Jan 2024 14:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706107171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5+RHsh9TnhTPLnbjSPhtUEq2X2SMkZBbmcU+QGP4t3U=;
	b=PLi9BNiveB2FxZ5Kx251oO4epHEanAzAZi6a3RwROulee+FHoVP8qt4zusPQzxIoou3qPt
	XjebwPY3/axeHqsFudNEIKnVFgN3E83/svoI0vrJB9rUyMiB15J+R6NgbCAzWfCTze92up
	ab3hunpuURdxJofoQ7yly7K4JJ4HFOyOphiz868T8ySlLFfvnLvGrchuuHHSZeNXn37EG1
	yMUKU7eYp867QzbmHUd1W77/72zzF1HsHB0fMMo4N/N8dIIOG++H+jVMkQaf5+b14e3j1F
	vFg9T6rcSsYxUGX5jcRwaLaOV67Bj0FCVYbQq0KulDjG9IPblys8hZT9O8+lYA==
Date: Wed, 24 Jan 2024 15:39:27 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: Re: [PATCH 1/4] net: wan: Add support for QMC HDLC
Message-ID: <20240124153927.174f5b7a@bootlin.com>
In-Reply-To: <7e7c5d46-001c-46db-85ca-eca013225a89@linux.dev>
References: <20240123164912.249540-1-herve.codina@bootlin.com>
	<20240123164912.249540-2-herve.codina@bootlin.com>
	<7e7c5d46-001c-46db-85ca-eca013225a89@linux.dev>
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

On Wed, 24 Jan 2024 10:03:45 +0000
Vadim Fedorenko <vadim.fedorenko@linux.dev> wrote:

[...]

> > +static void qmc_hcld_recv_complete(void *context, size_t length, unsigned int flags)
> > +{
> > +	struct qmc_hdlc_desc *desc = context;
> > +	struct net_device *netdev = desc->netdev;
> > +	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(desc->netdev);  
> 
> a line above desc->netdev was stored in netdev. better to reuse it and 
> make declaration part consistent with qmc_hcld_xmit_complete

Yes.
Will updated in the next iteration.

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
> > +	if (desc->skb) {
> > +		/* Should never happen.
> > +		 * Previous xmit should have already stopped the queue.
> > +		 */  
> 
> according to the comment it's better to make if(unlikely(desc->skb)) or
> even WARN_ONCE()
> 

Indeed. I will use WARN_ONCE() in the next iteration.

Thanks for your review,
Hervé
