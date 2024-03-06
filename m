Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FD7873B03
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 16:44:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=OOcZi+Pv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqcDV5Fhmz3dhY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 02:44:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=OOcZi+Pv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::222; helo=relay2-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqcCk6YyNz3cGW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 02:43:26 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B42E140004;
	Wed,  6 Mar 2024 15:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709739795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MYq2Ln/cYGg9mHiPcZf1m5ozgzbPmfufP7t0HGayXEU=;
	b=OOcZi+PvRqJOXRQte4KHieNLJdGYo88Y4btcN/OcBc+Ytvgx188h6khSW53VMo+IVL1Tay
	u+2U/0RkJwAtqKIPvBzY4bFONCgfSoJY4s+YpVRKnQGyrrVzRn2HbHNQZFI4T/3OkMddib
	tJ6TqyXn1Jub3h2Cpb6If3dUDcnSMk7sQB2B73LfCNfpOWoeDJEK+MbWdzE5nLKuMfAiQI
	qullN1y/jyU7TAOMbqMYUb8lb9hl70HdFalssK2GSF0o2yUC24gcAQEhvZwK40Mr8BpjZ4
	kROknzsitHe6IaaPQt0kJNGoXx+itPF2FEtXJrgtUWpQJBF5q1TDhHIPxcTTIA==
Date: Wed, 6 Mar 2024 16:43:11 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Yury Norov
 <yury.norov@gmail.com>
Subject: Re: [PATCH v6 4/5] net: wan: fsl_qmc_hdlc: Add runtime timeslots
 changes support
Message-ID: <20240306164311.735ded83@bootlin.com>
In-Reply-To: <Zehy6K0Sj-cqcxZE@smile.fi.intel.com>
References: <20240306080726.167338-1-herve.codina@bootlin.com>
	<20240306080726.167338-5-herve.codina@bootlin.com>
	<ZehqRMZwtazTf6P6@yury-ThinkPad>
	<Zehy6K0Sj-cqcxZE@smile.fi.intel.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andy, Yury,

On Wed, 6 Mar 2024 15:43:04 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Wed, Mar 06, 2024 at 05:06:12AM -0800, Yury Norov wrote:
> > On Wed, Mar 06, 2024 at 09:07:20AM +0100, Herve Codina wrote:  
> 
> ...
> 
> > > +	DECLARE_BITMAP(ts_mask_avail, 64);
> > > +	DECLARE_BITMAP(ts_mask, 64);
> > > +	DECLARE_BITMAP(map, 64);  
> 
> 
> > > +	bitmap_from_u64(ts_mask_avail, ts_info->rx_ts_mask_avail);
> > > +	bitmap_from_u64(map, slot_map);  
> 
> > We've got a BITMAP_FROM_U64() for this:
> > 
> > 	DECLARE_BITMAP(ts_mask_avail, 64) = { BITMAP_FROM_U64(ts_info->rx_ts_mask_avail) };
> > 	DECLARE_BITMAP(map, 64) = { BITMAP_FROM_U64(slot_map) };  
> 
> This looks ugly. Can we rather provide a macro that does this under the hood?
> 
> Roughly:
> 
> #define DEFINE_BITMAP_64(name, src)				\
> 	DECLARE_BITMAP(name, 64) = { BITMAP_FROM_U64(src) }
> 

Well, the construction I used:
	DECLARE_BITMAP(foo, 64);
	...
	bitmap_from_u64(foo, init_value);
	...
can be found in several places in the kernel.

Having the DEFINE_BITMAP_64() macro can be a way to remove this
construction but I am not sure that this should be done in this
series.

IMHO, a specific series introducing the macro and updating pieces of
code in the kernel everywhere it is needed to replace this construction
would make much more sense.


Best regards,
Hervé
