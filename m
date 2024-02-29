Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC08F86CB2E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 15:16:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=b6r/o/Mu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TltYV3B3kz3vYt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 01:15:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=b6r/o/Mu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.198; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TltXk4JT8z3dRp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 01:15:16 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C95CAC000B;
	Thu, 29 Feb 2024 14:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709216111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VODy3+pzl+mL+SxkoGGkZEMj3lgjxIWIJ0o/1JFBQvs=;
	b=b6r/o/Mu9TPn/uf6l5ivBke/Yz/QfZOFnWspbOdUT0tyBMQOKs4qIYOoR80iSfCPE7+p5h
	AAUAGna7VQJxSZM+VDSWJKDe2oJzV66x1gGVd/6LduwPFq0qTVHd1B/+h8NorBAnZSIcP/
	llrWdkcy9+423XM5HVk1urmeMUm7XZW6hYce7vGmM7BUQ+kNQTgMxjgSgxMqtIug+/DiKp
	D4Dz7ohiNB374q5JIOCvZutQHbGkMpRQEcgxkr8hjjHhGBRZfm5Y4EpjMSTHWmrSssd8iR
	iI2qdB7wlO0GKPxWr0KDNkWmXVV5rtFba1PfxpQlSc+drhfweBMAfYo5N+vhEg==
Date: Thu, 29 Feb 2024 15:15:08 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 5/5] net: wan: fsl_qmc_hdlc: Add framer support
Message-ID: <20240229151508.42432f9c@bootlin.com>
In-Reply-To: <ZeCNboCslYgT8tjb@smile.fi.intel.com>
References: <20240222142219.441767-1-herve.codina@bootlin.com>
	<20240222142219.441767-6-herve.codina@bootlin.com>
	<ZddtFG4bvCX-lsn3@smile.fi.intel.com>
	<20240229135605.6454052f@bootlin.com>
	<ZeCNboCslYgT8tjb@smile.fi.intel.com>
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

On Thu, 29 Feb 2024 15:58:06 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Thu, Feb 29, 2024 at 01:56:05PM +0100, Herve Codina wrote:
> > On Thu, 22 Feb 2024 17:49:40 +0200
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:  
> > > On Thu, Feb 22, 2024 at 03:22:18PM +0100, Herve Codina wrote:  
> 
> ...
> 
> > I've got an issue with guard(spinlock_irqsave).  
> 
> No, you got an issue with sparse.
> 
> > I have the following warning (make C=1):
> > drivers/net/wan/fsl_qmc_hdlc.c:49:12: warning: context imbalance in 'qmc_hdlc_framer_set_carrier' - wrong count at exit
> > 
> > I also tried to call guard(spinlock_irqsave) before 'if (!qmc_hdlc->framer)'
> > but it does not change anything.
> > 
> > Did I miss something in the guard(spinlock_irqsave) usage ?  
> 
> You may ignore that for now. Not your problem, no problem in the code.
> 
> https://lore.kernel.org/linux-sparse/8d596a06-9f25-4d9f-8282-deb2d03a6b0a@moroto.mountain/
> 

Perfect, thanks.

Hervé
