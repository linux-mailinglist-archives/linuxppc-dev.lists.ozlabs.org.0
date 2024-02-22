Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4E285FE74
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 17:50:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=nuYshMwG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgfKQ0clCz3dX3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 03:50:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=nuYshMwG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgfJZ2bsFz3d4H
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 03:50:05 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C41811BF205;
	Thu, 22 Feb 2024 16:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708620602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=19qhGNmQmWm9BCOh8qUm/W3o9hKN/eZYOSKauiIFfoY=;
	b=nuYshMwGlMUB6NdNCDKR2k/WM9Ms7Q/xXxQMJvOyn6XcCUUOSkmbB7v4BphjOXQdRDq6ft
	5Kk34TTJiC//w2a7g7aPDHRsI1rtsjvEap40y4W41OI+nFwV0cWOoMZpTupFan6qEpoN4d
	YDNERvNW5AVAsApFCmaWj6ph5QjpC1Kw6HH8GibCvreOmv66EswhaYlfXGCBqlQDVydlS4
	Zou9Ox0rlcFLYDRZDNc8KA4dchaTfAQq9bvoBzRPyC2o/bCnG5fN+wg7wN293MsMvmlS4M
	Y4b6k6JA9ATcrLJo42BpLaQPA+KtE3Peq7SHjCvF9vf0K7rJhFvfZzLT/azi3g==
Date: Thu, 22 Feb 2024 17:49:59 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 3/5] lib/bitmap: Introduce bitmap_scatter() and
 bitmap_gather() helpers
Message-ID: <20240222174959.7097c29b@bootlin.com>
In-Reply-To: <Zddqr3aN4rU-upai@smile.fi.intel.com>
References: <20240222142219.441767-1-herve.codina@bootlin.com>
	<20240222142219.441767-4-herve.codina@bootlin.com>
	<Zddqr3aN4rU-upai@smile.fi.intel.com>
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

Hi Andy, Yury,

On Thu, 22 Feb 2024 17:39:27 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

...
> > + * bitmap_scatter() for the bitmap scatter detailed operations).  
> 
> > + * Suppose scattered computed using bitmap_scatter(scattered, src, mask, n).
> > + * The operation bitmap_gather(result, scattered, mask, n) leads to a result
> > + * equal or equivalent to src.  
> 
> This paragraph...
> 
> > + * The result can be 'equivalent' because bitmap_scatter() and bitmap_gather()
> > + * are not bijective.  
> 
> 
> > + * The result and src values are equivalent in that sense that a call to
> > + * bitmap_scatter(res, src, mask, n) and a call to bitmap_scatter(res, result,
> > + * mask, n) will lead to the same res value.  
> 
> ...seems duplicating this one.
> 
> I would drop the latter one.

I would like to give details about the 'equivalent' in this scatter/gather case.

If Yury is ok, I can drop this last paragraph.


Thanks for the review,

Regards,
Hervé
