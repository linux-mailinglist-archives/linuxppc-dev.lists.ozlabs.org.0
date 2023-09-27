Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E998B7AFB50
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 08:46:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=XRukPAck;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwRw95SPHz3cgB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 16:46:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=XRukPAck;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwRtg3gCVz3cNj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 16:44:58 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97F66240005;
	Wed, 27 Sep 2023 06:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695797089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fkiMQS0h03kR9XwkdIs5uj8Y1YzwHNmKB+9PoQ4lSL0=;
	b=XRukPAckv6xotB3jVxFy4667OmM9aYny27MOBlx/BTcOP+fM4zVksB73m1skzTs3LuEPpg
	28sKZ9s7L/Oqt1lwd7bnXWCDqokDgIuJgssp5DI1MCsncP8PLw07fdqYpQURB8PlIIaM3D
	93bLk2K43GorkeGCMIk8B+OCDjV8tBPUf30PS4b4LpM1wn5+YvEI05vXKqtR6EFOczywI5
	xrHINcV0dOenfCZ2+TfOVVJblcbuVpw9L0kd6HO7Om4Fz8l3QxHEMsyT9NuuX2nhyIyx2d
	2p9J4fl9lVT/dZiNwsgHxJAR6mxaQrqmovXmMDr3X9tHCbxioEYFBz6WzsR54A==
Date: Wed, 27 Sep 2023 08:44:46 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 06/40] soc/fsl: cpm: qmc: Convert to platform remove
 callback returning void
Message-ID: <20230927084446.66affc74@bootlin.com>
In-Reply-To: <20230925095532.1984344-7-u.kleine-koenig@pengutronix.de>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
	<20230925095532.1984344-7-u.kleine-koenig@pengutronix.de>
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

On Mon, 25 Sep 2023 11:54:57 +0200
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
>  drivers/soc/fsl/qe/qmc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index b3c292c9a14e..92ec76c03965 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -1415,7 +1415,7 @@ static int qmc_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int qmc_remove(struct platform_device *pdev)
> +static void qmc_remove(struct platform_device *pdev)
>  {
>  	struct qmc *qmc = platform_get_drvdata(pdev);
>  
> @@ -1427,8 +1427,6 @@ static int qmc_remove(struct platform_device *pdev)
>  
>  	/* Disconnect the serial from TSA */
>  	tsa_serial_disconnect(qmc->tsa_serial);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id qmc_id_table[] = {
> @@ -1443,7 +1441,7 @@ static struct platform_driver qmc_driver = {
>  		.of_match_table = of_match_ptr(qmc_id_table),
>  	},
>  	.probe = qmc_probe,
> -	.remove = qmc_remove,
> +	.remove_new = qmc_remove,
>  };
>  module_platform_driver(qmc_driver);
>  

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
