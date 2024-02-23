Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C7E860EEA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 11:08:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=lesdaC3A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Th5M36XnJz3vYf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 21:08:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=lesdaC3A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Th5LB5Ndjz3vXr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 21:08:00 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A3A524000A;
	Fri, 23 Feb 2024 10:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708682876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5c3jkfiwWBVIVcLpQtxgvJnB9TnAlyKeMM5FmscF5j8=;
	b=lesdaC3AUqO4IhojWmi1I7Z8Y86vi8R00ZOyKv++IK4CwhLPLOgn5XY5k4oR3MF9KxG5bP
	FHh8Vwvv8ZqVP7QC7gAed27JRdYn4HIB7z1pIItzXg4YYNTrETeym5e/QwVk9lB36wh9tm
	JxbCR6BLtTMDJO9AvkEoN32a3DNz4gcCTqKL8Tr4ZDnrsyAQx7L0BHAgfYciUrRKAtWAd6
	TbBK9YZKs7K2AT92OvKym9dtZqqCJBhxy0zzQxhyw1V+Tke2vFi33vAh1YiWLCw5Dgt4Bl
	LyPfMMvW0GnXiDCqRuf8EqRFC3wBpgyr9kKf/gl7Wy0DYjAFj74/A+0yraffPA==
Date: Fri, 23 Feb 2024 11:07:52 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Yury Norov <yury.norov@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 3/5] lib/bitmap: Introduce bitmap_scatter() and
 bitmap_gather() helpers
Message-ID: <20240223110752.2329d3f0@bootlin.com>
In-Reply-To: <ZdfBuFZ7tf4b+3n8@yury-ThinkPad>
References: <20240222142219.441767-1-herve.codina@bootlin.com>
	<20240222142219.441767-4-herve.codina@bootlin.com>
	<Zddqr3aN4rU-upai@smile.fi.intel.com>
	<20240222174959.7097c29b@bootlin.com>
	<ZdfBuFZ7tf4b+3n8@yury-ThinkPad>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andy, Yury,

On Thu, 22 Feb 2024 13:50:48 -0800
Yury Norov <yury.norov@gmail.com> wrote:

> On Thu, Feb 22, 2024 at 05:49:59PM +0100, Herve Codina wrote:
> > Hi Andy, Yury,
> > 
> > On Thu, 22 Feb 2024 17:39:27 +0200
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > 
> > ...  
> > > > + * bitmap_scatter() for the bitmap scatter detailed operations).    
> > >   
> > > > + * Suppose scattered computed using bitmap_scatter(scattered, src, mask, n).
> > > > + * The operation bitmap_gather(result, scattered, mask, n) leads to a result
> > > > + * equal or equivalent to src.    
> > > 
> > > This paragraph...
> > >   
> > > > + * The result can be 'equivalent' because bitmap_scatter() and bitmap_gather()
> > > > + * are not bijective.    
> > > 
> > >   
> > > > + * The result and src values are equivalent in that sense that a call to
> > > > + * bitmap_scatter(res, src, mask, n) and a call to bitmap_scatter(res, result,
> > > > + * mask, n) will lead to the same res value.    
> > > 
> > > ...seems duplicating this one.
> > > 
> > > I would drop the latter one.  
> > 
> > I would like to give details about the 'equivalent' in this scatter/gather case.  
> 
> If you would like - please do! :)
>  
> > If Yury is ok, I can drop this last paragraph.  
> 
> The original bitmap_onto() description is 3 times longer, and barely
> that descriptive. I'm OK with your working and especially pictures.
> 

Right, I will keep my last paragraph in the next iteration.

Regards,
Hervé


