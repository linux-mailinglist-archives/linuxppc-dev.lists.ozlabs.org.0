Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D08D85F7AF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 13:06:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=URZPm961;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgX0x1Czzz3dk2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 23:06:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=URZPm961;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgX0B0b6yz3cQ4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 23:05:26 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C99661BF210;
	Thu, 22 Feb 2024 12:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708603519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IK1GlbJIzPjcabZtha8401cpHaWcLHGP+gKkN9qNPew=;
	b=URZPm961mF8mYOcJAgDR00zqwM0Dn3N4QZl0N2oWWtaXfGjWDDlYQvlUbL3CDAN6kgyCUg
	Sa/kYcuhdo4WuPAVb76+mFosL/QhUvPmgobIz9hovbYR/U/imSuZownAKFMQakW2OOT9ye
	sS8qWP4WwzYbDADh1DTPcZbWGA5FStJ53GEY65XPGusASjN1apCsKge2DnQRUr8HgAQvXW
	LfPjJzPTbyHeZ5fu40Avdt46xTHwzIvj4wJxlta8lKhKAfTAD3pYtYcVHRCQhGJNwma9U2
	MmTBeFin+N5TU23BsleoGMz2paD4+gEbv5dxPQEvfXve45QNaR3jvOncIyFO2w==
Date: Thu, 22 Feb 2024 13:05:16 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 RESEND 1/6] net: wan: Add support for QMC HDLC
Message-ID: <20240222130516.5e139612@bootlin.com>
In-Reply-To: <ZcoNoDRF6h2C7TQd@smile.fi.intel.com>
References: <20240212075646.19114-1-herve.codina@bootlin.com>
	<20240212075646.19114-2-herve.codina@bootlin.com>
	<ZcoNoDRF6h2C7TQd@smile.fi.intel.com>
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

Hi Andy,

On Mon, 12 Feb 2024 14:22:56 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

...

> 
> > +#include <linux/dma-mapping.h>
> > +#include <linux/hdlc.h>
> > +#include <linux/module.h>  
> 
> > +#include <linux/of.h>
> > +#include <linux/of_platform.h>  
> 
> I do not see how these are being used, am I right?
> What's is missing OTOH is the mod_devicetable.h.

Agree for removing of.h and of_platform.h.

Why do I need mod_devicetable.h ?
Isn't including module.h enough ?

Best regards,
Hervé
