Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CE5871CAB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 12:03:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=opIecpBf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tpt2p2XHbz3vYB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 22:03:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=opIecpBf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tpt245CBkz3d2x
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 22:02:33 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B66261BF20B;
	Tue,  5 Mar 2024 11:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709636549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4LVRqDAKoWY5kgiwdLKWwQAoyIirpSfzsC5mBFQI3NA=;
	b=opIecpBfJERWkETn/8djWi1vWsAznSKrHO2kz1tEPMGpi6juVNQu5EPhw3hKFu1TO6J32R
	cr4c34e6d+Sbt+TpNfcTqUoifskL0+s+rCzthMikNHZEDZhzatmvo+sVjwGOXvFA/5sPbo
	FoO461gz24lw+iKiOhkzELnP+95cNj97BgSxT1vQAhq+epdhbg48O0J41csnR4SzUGnprU
	MeNIjQtQbVXE5OixZSIUd/2hLFZ7X6GXe14Uke8EXhiyykBYCllQ1ygLsR+tv+gcaXf+VP
	4fwstIjNVDIvwhfbUXKo7jcKEWwZa7owmhCDTXMquoAUqPWHeLZBe5wq2K0o9w==
Date: Tue, 5 Mar 2024 12:02:26 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 0/5] Add support for QMC HDLC
Message-ID: <20240305120226.791bfe9a@bootlin.com>
In-Reply-To: <ZeChdAsAhrC8a75t@smile.fi.intel.com>
References: <20240229141554.836867-1-herve.codina@bootlin.com>
	<ZeChdAsAhrC8a75t@smile.fi.intel.com>
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

On Thu, 29 Feb 2024 17:23:32 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

...

> 
> I think it's a good series and next version will be final. The only question is
> possible use of the returned values from bitmap_scatter()/bitmap_gather(), the
> rest are minors.

I replied about the reason why I didn't return any values from
bitmap_{scatter,gather}() in that patch 4 discussion.

Are you ok to keep them returning void in this series ?

Best regards,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
