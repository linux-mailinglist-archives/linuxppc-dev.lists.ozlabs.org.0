Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01002856B78
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 18:47:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=od8eOLiE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbMvh6TTSz3vZ1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 04:47:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=od8eOLiE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbMtv2y7wz3dV3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 04:46:27 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0EC8240002;
	Thu, 15 Feb 2024 17:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708019176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=inH8EjjrxlOBnJ9O5h+irj6SqwiMSYBxDH0OH8nLG0A=;
	b=od8eOLiECnaDNLhsK97ovwmZovi+OYGOWZvJEle+XxC1RECogVyhPrpR6DAxahyqcuJXLi
	4bYPCe04UCrdEK1ybZNKSKNV0KESVI0c8btHLeJbauEN0NU2vn3WRfdf+CIK6lKWaPYige
	jwDl3wjhlgn4idv9iFOj4Wj/8DWtEOeykZbM5cSCWJXLh4r5kr84XSQ/2uTZ7UbcnWzERO
	+CLGKxUN3Im1ZM0sBJ00W8OGbjudjEVw2JOm03ugtvoorwu97/ZiRdCIYzS3ItxWYwDZju
	cR49LC4DmHxkO3dYTL4Ad9s2sz4TWnpbBF+d7ENqiLUjs2C/epqVz6P23t797A==
Date: Thu, 15 Feb 2024 18:46:12 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH v3 RESEND 3/6] bitmap: Make bitmap_onto() available to
 users
Message-ID: <20240215184612.438bd4f2@bootlin.com>
In-Reply-To: <Zcptyd/AWrDD3EAL@yury-ThinkPad>
References: <20240212075646.19114-1-herve.codina@bootlin.com>
	<20240212075646.19114-4-herve.codina@bootlin.com>
	<ZcoOpPb9HfXOYmAr@smile.fi.intel.com>
	<20240212143753.620ddd6e@bootlin.com>
	<ZcokwpMb6SFWhLBB@smile.fi.intel.com>
	<20240212152022.75b10268@bootlin.com>
	<Zcos9F3ZCX5c936p@smile.fi.intel.com>
	<Zcptyd/AWrDD3EAL@yury-ThinkPad>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andy, Yury,

On Mon, 12 Feb 2024 11:13:13 -0800
Yury Norov <yury.norov@gmail.com> wrote:

...

> 
> That's I agree. Scatter/gather from your last approach sound better.
> Do you plan to send a v2?
> 
...
> 
> I think your scatter/gather is better then this onto/off by naming and
> implementation. If you'll send a v2, and it would work for Herve, I'd
> prefer scatter/gather. But we can live with onto/off as well.
> 

Andy, I tested your bitmap_{scatter,gather}() in my code.
I simply replaced my bitmap_{onto,off}() calls by calls to your helpers and
it works perfectly for my use case.

I didn't use your whole patch
  "[PATCH v1 2/5] lib/bitmap: Introduce bitmap_scatter() and bitmap_gather() helpers"
because it didn't apply on a v6.8-rc1 based branch.
I just manually extracted the needed functions for my tests and I didn't look
at the lib/test_bitmap.c part.

Now what's the plan ?
Andy, do you want to send a v2 of this patch or may I get the patch, modify it
according to reviews already present in v1 and integrate it in my current
series ?

Yury, any preferences ?

Best regards,
Hervé
-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
