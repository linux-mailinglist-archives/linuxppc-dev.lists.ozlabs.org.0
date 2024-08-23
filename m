Return-Path: <linuxppc-dev+bounces-447-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0005895C7C8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:14:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqtCg70qgz3094;
	Fri, 23 Aug 2024 18:14:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400895;
	cv=none; b=RpmBxqKgs59k0Iz8KCZ8ISH2YE6e/XOoTCrHv47Q1OcNNV9ea7zuJuae2qskB+s7eXWqjT/9+LigKc2KHYoOXuFYo2ZhQA6F1ZbFwEHS24eJzZPjC/+l73RJxR5vEEGD6PGc35dB5gBWnQERBmWF31k3NOzlQTOCzeRlzFx9wbzJkL8bG/30Y2yieKyk1P5rVp0YXyb60u7JXyyEFdwl+pSEW7H+MFpWfhs5mPz1Mra6MQwPh0IGiQO4f/Jbb2i75isNzxFES+4q9mCiFIFLy32xlJD7yYTy3no0TGTk5Db+NE5KaQ5p5p0+WCVIC6nxSPqRwRJabfyqFRGakiWZJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400895; c=relaxed/relaxed;
	bh=9CASDNCx8EKkZy1HWk4YrOs6nMQYrMLjPfW+gkvg1rM=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=bOLFznMu7fpBPU/QYBxd2lB5XXQ8C2dYF4h64vBFquOItaOV71khwuuMzsFu/2XS/eUODPkwikG8vfUYzPY8Mt6s6FF1nZt2mscpC3mQqeN2JpeJUIT0gjjBExq3f3VF8tzggfDA2M36sMOEZQVLwx7/qc8bMnnbtgNRLBNXCRadZMYNDbuOFQ2+Y23VWfx0Oh4ITceGb7gOGJpZ0bTwGy22d2GaZaqjhIBFGP9+Zg47M3NO8La0zvI4GS1LyMe++y1ITIUmECV6n5GptrbDt4rieUqqqONGUifXhWTr9++T1JbIMXtKayxvnQngOr0NR8G9RHhu3cucINMSjmJlYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqtCg4ss7z2yxY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:14:55 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WqtCc62WQz9sRr;
	Fri, 23 Aug 2024 10:14:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J4X30XlS6JER; Fri, 23 Aug 2024 10:14:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WqtCc5B7kz9rvV;
	Fri, 23 Aug 2024 10:14:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A2F518B77D;
	Fri, 23 Aug 2024 10:14:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id j0NpDRdrK9od; Fri, 23 Aug 2024 10:14:52 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 112898B763;
	Fri, 23 Aug 2024 10:14:52 +0200 (CEST)
Message-ID: <b3323a47-6b57-48ef-ad68-9d457a33a8a3@csgroup.eu>
Date: Fri, 23 Aug 2024 10:14:51 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 35/36] soc: fsl: cpm1: qmc: Handle QUICC Engine (QE)
 soft-qmc firmware
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-36-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-36-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> The QUICC Engine (QE) QMC can use a firmware to have the QMC working in
> 'soft-qmc' mode.
> 
> Handle this optional 'soft-qmc' firmware.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/soc/fsl/qe/qmc.c | 67 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 67 insertions(+)
> 
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index b3a9534441ee..3dffebb48b0d 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -10,6 +10,7 @@
>   #include <soc/fsl/qe/qmc.h>
>   #include <linux/bitfield.h>
>   #include <linux/dma-mapping.h>
> +#include <linux/firmware.h>
>   #include <linux/hdlc.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
> @@ -1649,6 +1650,66 @@ static irqreturn_t qmc_irq_handler(int irq, void *priv)
>   	return IRQ_HANDLED;
>   }
>   
> +static int qmc_qe_soft_qmc_init(struct qmc *qmc, struct device_node *np)
> +{
> +	struct qe_firmware_info *qe_fw_info;
> +	const struct qe_firmware *qe_fw;
> +	const struct firmware *fw;
> +	const char *filename;
> +	int ret;
> +
> +	ret = of_property_read_string(np, "fsl,soft-qmc", &filename);
> +	switch (ret) {
> +	case 0:
> +		break;
> +	case -EINVAL:
> +		/* fsl,soft-qmc property not set -> Simply do nothing */
> +		return 0;
> +	default:
> +		dev_err(qmc->dev, "%pOF: failed to read fsl,soft-qmc\n",
> +			np);
> +		return ret;
> +	}
> +
> +	qe_fw_info = qe_get_firmware_info();
> +	if (qe_fw_info) {
> +		if (!strstr(qe_fw_info->id, "Soft-QMC")) {
> +			dev_err(qmc->dev, "Another Firmware is already loaded\n");
> +			return -EALREADY;
> +		}
> +		dev_info(qmc->dev, "Firmware already loaded\n");
> +		return 0;
> +	}
> +
> +	dev_info(qmc->dev, "Using firmware %s\n", filename);
> +
> +	ret = request_firmware(&fw, filename, qmc->dev);
> +	if (ret) {
> +		dev_err(qmc->dev, "Failed to request firmware %s\n", filename);
> +		return ret;
> +	}
> +
> +	qe_fw = (const struct qe_firmware *)fw->data;
> +
> +	if (fw->size < sizeof(qe_fw->header) ||
> +	    be32_to_cpu(qe_fw->header.length) != fw->size) {
> +		dev_err(qmc->dev, "Invalid firmware %s\n", filename);
> +		ret = -EINVAL;
> +		goto end;
> +	}
> +
> +	ret = qe_upload_firmware(qe_fw);
> +	if (ret) {
> +		dev_err(qmc->dev, "Failed to load firmware %s\n", filename);
> +		goto end;
> +	}
> +
> +	ret = 0;
> +end:
> +	release_firmware(fw);
> +	return ret;
> +}
> +
>   static int qmc_cpm1_init_resources(struct qmc *qmc, struct platform_device *pdev)
>   {
>   	struct resource *res;
> @@ -1855,6 +1916,12 @@ static int qmc_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> +	if (qmc_is_qe(qmc)) {
> +		ret = qmc_qe_soft_qmc_init(qmc, np);
> +		if (ret)
> +			return ret;
> +	}
> +
>   	/* Parse channels informationss */
>   	ret = qmc_of_parse_chans(qmc, np);
>   	if (ret)

