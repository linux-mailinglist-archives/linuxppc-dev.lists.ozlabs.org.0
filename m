Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1C87FBB5A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 14:23:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=VRV3BHxj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SfjnH0pV1z3ccL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 00:22:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=VRV3BHxj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.198; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SfjmM4z3yz2yts
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 00:22:08 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F301FC0005;
	Tue, 28 Nov 2023 13:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701177720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MZiCKHIFMtTPiyy8a7W+ARHL0SYoxg9DjGFjpNCU/Ek=;
	b=VRV3BHxj1yIQoNohqyj9FkdCDWrwTV0Dbf28seW/DYsIZ/9crPQlkmDAB8uD5WQSFC9O1p
	2I506CY8MBR36W8wluermqilNFDJT9Gz/GTm0Mm9HQjZsX79b8AngFnIOnfRfMto2iAu5e
	pWtNZTvfwsqVjIoSrvZHl0ozFjuBoxQAl+j2YW0oz90pXNDkP8mkx7+bLDrj0uZufc/QSt
	JO46Ut5Ior8Tswrr6NRiU86Dz5bRVVVvW5Rqa3t7qh8NZ4blv4T7wLkFEBjXwDxVeTsvxA
	wbwXuVZekv2ULPeNJCa8MZ/L1n5TL/pJf5GgPfHawm3erww6jFQvJUagP55Qlg==
Date: Tue, 28 Nov 2023 14:21:58 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH] soc: fsl: cpm1: qmc: fix error return code in
 qmc_probe()
Message-ID: <20231128142158.302eb348@bootlin.com>
In-Reply-To: <20231128130942.2457873-1-yangyingliang@huawei.com>
References: <20231128130942.2457873-1-yangyingliang@huawei.com>
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
Cc: broonie@kernel.org, leoyang.li@nxp.com, linuxppc-dev@lists.ozlabs.org, qiang.zhao@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Yang,

On Tue, 28 Nov 2023 21:09:42 +0800
Yang Yingliang <yangyingliang@huawei.com> wrote:

> If platform_get_irq() fails, it need return error code in
> qmc_probe().
> 
> Fixes: 3178d58e0b97 ("soc: fsl: cpm1: Add support for QMC")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/soc/fsl/qe/qmc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index 92ec76c03965..65109f279a6b 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -1386,8 +1386,10 @@ static int qmc_probe(struct platform_device *pdev)
>  	qmc_write16(qmc->scc_regs + SCC_SCCM, 0x0000);
>  	qmc_write16(qmc->scc_regs + SCC_SCCE, 0x000F);
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0)
> +	if (irq < 0) {
> +		ret = irq;
>  		goto err_tsa_serial_disconnect;
> +	}
>  	ret = devm_request_irq(qmc->dev, irq, qmc_irq_handler, 0, "qmc", qmc);
>  	if (ret < 0)
>  		goto err_tsa_serial_disconnect;

Thanks for this patch.

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
