Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A7E86C993
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 13:57:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=MQ4HaOTu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlrpK5ytJz3vZd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 23:56:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=MQ4HaOTu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.199; helo=relay9-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlrnX4sj1z3cGb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 23:56:13 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 457DAFF805;
	Thu, 29 Feb 2024 12:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709211367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yFgfKts7peO9Nva4G0PStusKwNhitcOIDLM2QDrk96U=;
	b=MQ4HaOTui8vfXdZ+ZvRDbuyYi6vSV+lfKsOePfRY+o0aPlihIKi5U54Y+tk5OQq4CdsWPl
	Zr50cTLFos3Pj/NB0cofKt4iAnyXsMDWOXFFV5l6O3tM7KoBKCAtNYL7767VA8sum5j6FP
	Iw92ZGNr6SU/hob4i2ZZoEQ9pEcMg6b+fVlG0Meb3sgaSD6unR7zIXWRnyfnh9iqLvx6TH
	fdD+hslgUX5LmwnGuHgDzJ6ZYDpj0xqhgMg7Y8cnQ7dMdOWFamAi49V4RubRxk1bsmMpyu
	MXdVshF+upQ10l4Vh3PDJLrkinmdSPK5AsUnxTjyrCkzIYMc/toTFNuDTuYZoQ==
Date: Thu, 29 Feb 2024 13:56:05 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 5/5] net: wan: fsl_qmc_hdlc: Add framer support
Message-ID: <20240229135605.6454052f@bootlin.com>
In-Reply-To: <ZddtFG4bvCX-lsn3@smile.fi.intel.com>
References: <20240222142219.441767-1-herve.codina@bootlin.com>
	<20240222142219.441767-6-herve.codina@bootlin.com>
	<ZddtFG4bvCX-lsn3@smile.fi.intel.com>
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

On Thu, 22 Feb 2024 17:49:40 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Thu, Feb 22, 2024 at 03:22:18PM +0100, Herve Codina wrote:
> > Add framer support in the fsl_qmc_hdlc driver in order to be able to
> > signal carrier changes to the network stack based on the framer status
> > Also use this framer to provide information related to the E1/T1 line
> > interface on IF_GET_IFACE and configure the line interface according to
> > IF_IFACE_{E1,T1} information.  
> 
> ...
> 
> > +static int qmc_hdlc_framer_set_carrier(struct qmc_hdlc *qmc_hdlc)
> > +{
> > +	struct framer_status framer_status;
> > +	unsigned long flags;
> > +	int ret;
> > +
> > +	if (!qmc_hdlc->framer)
> > +		return 0;  
> 
> > +	spin_lock_irqsave(&qmc_hdlc->carrier_lock, flags);  
> 
> cleanup.h ?
> 
> > +	ret = framer_get_status(qmc_hdlc->framer, &framer_status);
> > +	if (ret) {
> > +		dev_err(qmc_hdlc->dev, "get framer status failed (%d)\n", ret);
> > +		goto end;
> > +	}
> > +	if (framer_status.link_is_on)
> > +		netif_carrier_on(qmc_hdlc->netdev);
> > +	else
> > +		netif_carrier_off(qmc_hdlc->netdev);
> > +
> > +end:
> > +	spin_unlock_irqrestore(&qmc_hdlc->carrier_lock, flags);
> > +	return ret;
> > +}  
> 

I've got an issue with guard(spinlock_irqsave).

I changed this code to:
--- 8< ---
static int qmc_hdlc_framer_set_carrier(struct qmc_hdlc *qmc_hdlc)
{
	struct framer_status framer_status;
	int ret;

	if (!qmc_hdlc->framer)
		return 0;

	guard(spinlock_irqsave)(&qmc_hdlc->carrier_lock);

	ret = framer_get_status(qmc_hdlc->framer, &framer_status);
	if (ret) {
		dev_err(qmc_hdlc->dev, "get framer status failed (%d)\n", ret);
		return ret;
	}
	if (framer_status.link_is_on)
		netif_carrier_on(qmc_hdlc->netdev);
	else
		netif_carrier_off(qmc_hdlc->netdev);

	return 0;
}
--- 8< ---

I have the following warning (make C=1):
drivers/net/wan/fsl_qmc_hdlc.c:49:12: warning: context imbalance in 'qmc_hdlc_framer_set_carrier' - wrong count at exit

I also tried to call guard(spinlock_irqsave) before 'if (!qmc_hdlc->framer)'
but it does not change anything.

Did I miss something in the guard(spinlock_irqsave) usage ?

Best regards,
Hervé
