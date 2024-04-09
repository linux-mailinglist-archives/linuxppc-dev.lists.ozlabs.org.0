Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8777889D54F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 11:21:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=cRBK2iOa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDL722T1wz3cVG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 19:21:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=cRBK2iOa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.197; helo=relay5-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDL6G5XKTz3bX3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 19:20:35 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A29971C0004;
	Tue,  9 Apr 2024 09:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712654430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ajs3JfsuDGDVdP991mgTubXeqv6k1ZmOZ7kp7bC5KA=;
	b=cRBK2iOa2nNkSXPNfmtTgKyhK4xhE1T9Gm0evKyg9J7tjXbovmOHNZhrPQ/V3n0sk+M28N
	zDxko6zLlDUO0An4fCB1JLix893FFlXC3hQSmHYLuyfUVS7jO6TH3gtxzmEmvndMInhTQV
	rGpaqWa1j1WQAR5dxo9vo0EW5x6WH2iDigzncpxNeyVbo/jqhw6pobnNz0btocSnyQSnaH
	iXpjUDh8SeIKcgluiirLyenfxMwoyzQBL9qrQjjltlERPTtcqFk1DMjbBqIkiKpTgslbET
	dmwb+0IJo7R+B3zs+6byQpQWeKmmUZANmICVv2WDKmry+GCwu9KE/tAupoY2CA==
Date: Tue, 9 Apr 2024 11:20:27 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH net-next] net: wan: fsl_qmc_hdlc: Convert to platform
 remove callback returning void
Message-ID: <20240409112027.15c17572@bootlin.com>
In-Reply-To: <20240409091203.39062-2-u.kleine-koenig@pengutronix.de>
References: <20240409091203.39062-2-u.kleine-koenig@pengutronix.de>
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>, kernel@pengutronix.de, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue,  9 Apr 2024 11:12:04 +0200
Uwe Kleine-König <u.kleine-koenig@pengutronix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> the drivers below of drivers/net were already converted to struct
> platform_driver::remove_new during the v6.9-rc1 development cycle. This
> driver was added for v6.9-rc1 and so missed during my conversion.
> 
> There are still more drivers to be converted, so there is from my side
> no need to get this into v6.9, but the next merge window would be nice.
> 
> Best regards
> Uwe
> 
>  drivers/net/wan/fsl_qmc_hdlc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
