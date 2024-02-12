Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE418516ED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 15:21:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=HCqZorbz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYRTM5CLcz3dSM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 01:21:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=HCqZorbz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYRSc1pzNz2xTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 01:20:30 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A14A240004;
	Mon, 12 Feb 2024 14:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707747626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7rZfjdEu2RYZ/9BtHHNLkIKbP50Gk/4PTrBnkkv9ErI=;
	b=HCqZorbzy0esT9Eqv/sS9A2HZ4FrwPc/w9nx9jaj7DuOm8mxgj0PaRgWzh3jdZ9NbCOENL
	63gi1eZ8V05xzYU+5d4HG8vIdGBid9lAJaH/XrJq6obsJSREHR+qvy/iqMsZAZvHZ1pQB6
	yBcCy1YzjUqElDP4fDnwpM8RIknbl5fJ7KxsqeXwhl2iUHLx3OIXOS+lF46ITJQHzcaIAN
	q7/oWSa5EItG6QLW4IUMlLgNQywuaw/+4aPDawbHlvep8ZtTaO14bs+nLGsIQszn0JBk/7
	+Hljz66sK0u46tlT3ZmnMEOnVaB6/aBbX7tQ8MJ0KONxqtfUdGAiNbu3O6v9XA==
Date: Mon, 12 Feb 2024 15:20:22 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 RESEND 3/6] bitmap: Make bitmap_onto() available to
 users
Message-ID: <20240212152022.75b10268@bootlin.com>
In-Reply-To: <ZcokwpMb6SFWhLBB@smile.fi.intel.com>
References: <20240212075646.19114-1-herve.codina@bootlin.com>
	<20240212075646.19114-4-herve.codina@bootlin.com>
	<ZcoOpPb9HfXOYmAr@smile.fi.intel.com>
	<20240212143753.620ddd6e@bootlin.com>
	<ZcokwpMb6SFWhLBB@smile.fi.intel.com>
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

On Mon, 12 Feb 2024 16:01:38 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Mon, Feb 12, 2024 at 02:37:53PM +0100, Herve Codina wrote:
> > On Mon, 12 Feb 2024 14:27:16 +0200
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:  
> > > On Mon, Feb 12, 2024 at 08:56:31AM +0100, Herve Codina wrote:  
> > > > Currently the bitmap_onto() is available only for CONFIG_NUMA=y case,
> > > > while some users may benefit out of it and being independent to NUMA
> > > > code.
> > > > 
> > > > Make it available to users by moving out of ifdeffery and exporting for
> > > > modules.    
> > > 
> > > Wondering if you are trying to have something like
> > > https://lore.kernel.org/lkml/20230926052007.3917389-1-andriy.shevchenko@linux.intel.com/  
> > 
> > Yes, it looks like.
> > Can you confirm that your bitmap_scatter() do the same operations as the
> > existing bitmap_onto() ?  
> 
> I have test cases to be 100% sure, but on the first glance, yes it does with
> the adjustment to the atomicity of the operations (which I do not understand
> why be atomic in the original bitmap_onto() implementation).
> 
> This actually gives a question if we should use your approach or mine.
> At least the help of bitmap_onto() is kinda hard to understand.

Agree, the bitmap_onto() code is simpler to understand than its help.

I introduced bitmap_off() to be the "reverse" bitmap_onto() operations
and I preferred to avoid duplicating function that do the same things.

On my side, I initially didn't use the bitmap_*() functions and did the the
bits manipulation by hand.
During the review, it was suggested to use the bitmap_*() family and I followed
this suggestion. I did tests to be sure that bitmap_onto() and bitmap_off() did
exactly the same things as my previous code did.

> 
> > If so, your bitmap_gather() will match my bitmap_off() (patch 4 in this
> > series).  
> 
> Yes.
> 

Regards,
Hervé

