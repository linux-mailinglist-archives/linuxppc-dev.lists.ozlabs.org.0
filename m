Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B05C85F987
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 14:22:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=PGAUTrbI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgYhW00PPz3dVG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 00:22:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=PGAUTrbI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgYgl126Rz2xFk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 00:21:20 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F83EE000F;
	Thu, 22 Feb 2024 13:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708608069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KIJQOiwsnPIHMQCuDyLqsDgu6VLT3hR2HUacNiT4rNQ=;
	b=PGAUTrbI2eCYfRgeudmxg+COgy/tQuE6n14TZt2RLEpK77Qn6/l4pRGeVzsKhRCvSu0Hjo
	zL3KLbt/+cwhZEit8wBneRi3vehint6IiHprNwGQARsvgWsYM4rqENtPGohGy89BC84pGJ
	azWoL4sUK6aTyxhnnQUk6SaQYCaQscLAd65eBMko37g0lRn0QvuXr7fFzlM3X68ocaVFaj
	ut6tv/vkqOhlVqKv132PEs1EGJibbSa+9AesvPwsSv0WJ4uFIzouV/jyLx67IRW9BasKWV
	424JPQWzD8YHW7CwJT6alnw4PISPHnPm8oZ45x3LIvCSejBVOT7yw3QDBukCCg==
Date: Thu, 22 Feb 2024 14:21:06 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 RESEND 1/6] net: wan: Add support for QMC HDLC
Message-ID: <20240222142106.35dfa03d@bootlin.com>
In-Reply-To: <ZddJz9msz1ACmw_k@smile.fi.intel.com>
References: <20240212075646.19114-1-herve.codina@bootlin.com>
	<20240212075646.19114-2-herve.codina@bootlin.com>
	<ZcoNoDRF6h2C7TQd@smile.fi.intel.com>
	<20240222130516.5e139612@bootlin.com>
	<ZddJz9msz1ACmw_k@smile.fi.intel.com>
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

On Thu, 22 Feb 2024 15:19:11 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Thu, Feb 22, 2024 at 01:05:16PM +0100, Herve Codina wrote:
> > On Mon, 12 Feb 2024 14:22:56 +0200
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:  
> 
> ...
> 
> > > > +#include <linux/dma-mapping.h>
> > > > +#include <linux/hdlc.h>
> > > > +#include <linux/module.h>    
> > >   
> > > > +#include <linux/of.h>
> > > > +#include <linux/of_platform.h>    
> > > 
> > > I do not see how these are being used, am I right?
> > > What's is missing OTOH is the mod_devicetable.h.  
> > 
> > Agree for removing of.h and of_platform.h.
> > 
> > Why do I need mod_devicetable.h ?
> > Isn't including module.h enough ?  
> 
> In that header the definitions of many of ID table data structures are located.
> You are using that in the code.
> 

Ok, thanks.

Hervé
