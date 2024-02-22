Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6E985FFF9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 18:45:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Gn9siWgG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TggXy58CHz3vXn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 04:45:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Gn9siWgG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::225; helo=relay5-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TggXB4Tr5z3dSB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 04:45:12 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 245471C0006;
	Thu, 22 Feb 2024 17:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708623908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X3I/R/8qE9M+CRJjU12CIPkeWv2RmJWu64GPRTejT9A=;
	b=Gn9siWgGy58upwjuxgZs1XPEf1GDRTbpcvMhGVQfa6tZlTi2lsfyZpcQxf8FkXeGe9tIJ3
	yXjKmoW/ka+D12sjQlBQsSvGJWwZt/OmrV8PwIcpGmozoCEoRTcEIHnQfIB5NS9nuYUe3w
	6NNZ5+JB8LXFqUdqSjDStf+Re/To2Y1SMcEuNpRdnRJBWyF99+PvOGoGMwWH9B+MemlYfA
	j5ppLi6XsOPUBeewQUOqqILuWdqhnUNixduxT7ASbeeFv+tIAFO7M9bCFbOz9b1yKy0Ly+
	7Zf7N5aeK2sdiydUrmEj0FgyhvYGlOpTdaf2raQ0ULfAcGMmE05QtMlI+GR49A==
Date: Thu, 22 Feb 2024 18:45:05 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 1/5] net: wan: Add support for QMC HDLC
Message-ID: <20240222184505.7350df2e@bootlin.com>
In-Reply-To: <Zdd8ukxdhH16vRDJ@smile.fi.intel.com>
References: <20240222142219.441767-1-herve.codina@bootlin.com>
	<20240222142219.441767-2-herve.codina@bootlin.com>
	<ZddoQTg32unJJ_qP@smile.fi.intel.com>
	<20240222174501.4cbe03ab@bootlin.com>
	<Zdd8ukxdhH16vRDJ@smile.fi.intel.com>
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

Andy, Jakub,

On Thu, 22 Feb 2024 18:56:26 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Thu, Feb 22, 2024 at 05:45:01PM +0100, Herve Codina wrote:
> > On Thu, 22 Feb 2024 17:29:05 +0200
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:  
> > > On Thu, Feb 22, 2024 at 03:22:14PM +0100, Herve Codina wrote:  
> 
> ...
> 
> > > > +	spin_lock_irqsave(&qmc_hdlc->tx_lock, flags);    
> > > 
> > > Why not using cleanup.h from day 1?  
> > 
> > I don't know about cleanup.h.
> > Can you tell me more ?
> > How should I use it ?
> >   
> > > > +end:    
> > > 
> > > This label, in particular, will not be needed with above in place.
> > >   
> > > > +	spin_unlock_irqrestore(&qmc_hdlc->tx_lock, flags);
> > > > +	return ret;
> > > > +}    
> 
> Here are the examples:
> 6191e49de389 ("pinctrl: baytrail: Simplify code with cleanup helpers")
> 1d1b4770d4b6 ("platform/x86/intel/vsec: Use cleanup.h")
> e2eeddefb046 ("pstore: inode: Convert mutex usage to guard(mutex)")
> 
> Some advanced stuff:
> ced085ef369a ("PCI: Introduce cleanup helpers for device reference counts and locks")
> 
> Hope this helps.

Sure, thanks for the pointer.

Jakub,
nothing in drivers/net seems to use the guard() (from cleanup.h) family
macro.
Are you ok with having this HDLC driver that uses guard() macros ?

Best regards,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
