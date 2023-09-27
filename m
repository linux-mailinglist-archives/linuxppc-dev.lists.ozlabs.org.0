Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F26F47AFB4D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 08:45:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=JCUyZ35Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwRvD5hsmz3cR0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 16:45:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=JCUyZ35Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.194; helo=relay2-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwRtH4Zyyz3cCl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 16:44:36 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A25640003;
	Wed, 27 Sep 2023 06:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695797067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6w55e/rZZu6aBcdMenyM29aj/jZfbSewfoXt20wM3HE=;
	b=JCUyZ35Y34m8eNV5AYUbxw8m418hEdMFBN2Js5CxabrdUoH7FIHrMeVA293I3eI6POnkU7
	DOAJW5vbmOydtDsh2MYc9iZd0PXdjP+UQ5gHmA2d6ZVsidSIVAizBp+R+hNTQG0MJipQi2
	836XR2K6kykJDIY47I1Gc/W4BvuJI+oI8ibjeJfXMC91DmO1VHuP4eGlIjK698yaGAZ5GR
	zaawiGzo+wm2SPwNVqJzmrcnjT2Wr7cO111NYEKQh15D3bCLgfMm4l7KMIbAFhcIk9DDRQ
	ofpwEg5drYgz0WeN/2YEV6axZZXnR+EaG0eh1eHjw0NCTJFih0gujpVEfk8WCA==
Date: Wed, 27 Sep 2023 08:44:24 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 07/40] soc/fsl: cpm: tsa: Convert to platform remove
 callback returning void
Message-ID: <20230927084424.177d2764@bootlin.com>
In-Reply-To: <20230925095532.1984344-8-u.kleine-koenig@pengutronix.de>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
	<20230925095532.1984344-8-u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Uwe,

On Mon, 25 Sep 2023 11:54:58 +0200
Uwe Kleine-König <u.kleine-koenig@pengutronix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/soc/fsl/qe/tsa.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
> index 3646153117b3..3f9981335590 100644
> --- a/drivers/soc/fsl/qe/tsa.c
> +++ b/drivers/soc/fsl/qe/tsa.c
> @@ -706,7 +706,7 @@ static int tsa_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int tsa_remove(struct platform_device *pdev)
> +static void tsa_remove(struct platform_device *pdev)
>  {
>  	struct tsa *tsa = platform_get_drvdata(pdev);
>  	int i;
> @@ -729,7 +729,6 @@ static int tsa_remove(struct platform_device *pdev)
>  			clk_put(tsa->tdm[i].l1rclk_clk);
>  		}
>  	}
> -	return 0;
>  }
>  
>  static const struct of_device_id tsa_id_table[] = {
> @@ -744,7 +743,7 @@ static struct platform_driver tsa_driver = {
>  		.of_match_table = of_match_ptr(tsa_id_table),
>  	},
>  	.probe = tsa_probe,
> -	.remove = tsa_remove,
> +	.remove_new = tsa_remove,
>  };
>  module_platform_driver(tsa_driver);
>  

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
