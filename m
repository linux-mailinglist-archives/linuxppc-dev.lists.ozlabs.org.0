Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A408185DBD2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 14:45:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kdesK/7Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfyGQ4Gqhz3vbl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 00:45:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kdesK/7Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.195; helo=relay3-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfyF66xJhz3dWQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 00:44:39 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5980660002;
	Wed, 21 Feb 2024 13:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708523074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jrp+YmUU+v0EhVwMHcIQvcwO/VqJPYfeVs/EWjoSXJA=;
	b=kdesK/7Y8qVDLsCghR0aipV1MYMOWBJevJpEdYlrmc+vqk331xncXZaKQoDfbTKsCCgSY4
	pFkpEI4J2SsnRORd0MParLYiqNXZEC0a3TnwNaqQy/0YWUbt+Tq47dTm+couH/C06schmB
	ydviN/SiZmK85C5VpjWmT8eZImWf0aZqcjg3/r0+a9W/sFC/IbYkakP5vMepKmLSsKfJFx
	s42dEoJyKi2pBT/xce43VCQsZDEyc8Qc6JToSDqcToxLTiFiLAJbQ7NiJpSbD6ZzQ64ov1
	QG0Jsv2yr0Ect/roDJsitO0mbz/6jScd4Mnbg7Y/Zm4Fn/90vLBKjJ/ueMtQqw==
Date: Wed, 21 Feb 2024 14:44:31 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 RESEND 3/6] bitmap: Make bitmap_onto() available to
 users
Message-ID: <20240221144431.149c3a16@bootlin.com>
In-Reply-To: <Zc5jQ3zR51MDIovB@smile.fi.intel.com>
References: <20240212075646.19114-1-herve.codina@bootlin.com>
	<20240212075646.19114-4-herve.codina@bootlin.com>
	<ZcoOpPb9HfXOYmAr@smile.fi.intel.com>
	<20240212143753.620ddd6e@bootlin.com>
	<ZcokwpMb6SFWhLBB@smile.fi.intel.com>
	<20240212152022.75b10268@bootlin.com>
	<Zcos9F3ZCX5c936p@smile.fi.intel.com>
	<Zcptyd/AWrDD3EAL@yury-ThinkPad>
	<20240215184612.438bd4f2@bootlin.com>
	<Zc5jQ3zR51MDIovB@smile.fi.intel.com>
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

On Thu, 15 Feb 2024 21:17:23 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

[...]

> > Now what's the plan ?
> > Andy, do you want to send a v2 of this patch or may I get the patch, modify it
> > according to reviews already present in v1 and integrate it in my current
> > series ?  
> 
> I would like to do that, but under pile of different things.
> I would try my best but if you have enough time and motivation feel free
> to take over, address the comments and integrate in your series.
> 
> I dunno what to do with bitmap_onto(), perhaps in a separate patch we can
> replace it with bitmap_scatter() (IIUC) with explanation that the former
> 1) uses atomic ops while being non-atomic as a whole, and b) having quite
> hard to get documentation. At least that's how I see it, I mean that I would
> like to leave bitmap_onto() alone and address it separately.
> 

I will take the Andy's bitmap_{scatter,gather}() patch in my next iteration.
And use bitmap_{scatter,gather}() in my code.

For bitmap_onto() replacement, nothing will be done in my next iteration as
it is out of this series scope.

Hervé
