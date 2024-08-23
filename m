Return-Path: <linuxppc-dev+bounces-438-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC9095C79D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:12:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqt8G0zzVz2yvh;
	Fri, 23 Aug 2024 18:11:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400718;
	cv=none; b=FBPhNAtP7k1URy7WZcKiYWjpKy3rzXdDHZIy1SYv5yq4mzc38AyD5XtgVm9+BDnpvSzakb2mT1IHCYr0CR2E1zxfYgO+u/Bes22piAOL2Uc2ysNUtX1/2/rlBEyhI0ce6pEQbuUjsSq65fIKZM4Tx9PTAb7bJE7UOyodKSH0vvi7ROlc7FbcNJnxdtc6s6ojZPxOSkMZhB5rUVnP1++Zw6ClTY73TCcDEcyWFZbk4k0OjOFPfcmrm793OnelLk405xV0aqH9as6ct9bUiwAJ8oo1UTYSmCOZ9BhrenzLDaEki94UJ3gBJOD2vt2NTHAH1ugJbtWkKor9NWneqCGxeA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400718; c=relaxed/relaxed;
	bh=51yPPOiwLihdpvW6wSoPQFO8bYSzE9o0Xp2GKOZ0Au8=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=bvAR3V0lRuaAXcHuldLP8YuBwZ1WdrLMApukVr+0U0ghTyAQwrBToLu8xqmHT9Njpdf9XFjTK9YMZh3QtdHL2I7JPm+IX1gRKU0GlfuEz6iqgjv5hOwQ9k6n9aHLzVQ6y5egKLw40U9vwkMVWd8uQV74aLn6Lq7vcKwey0zP1fCKxiUUUKLJf3pgJHD//gYV+LCrbYGnqQUk8eM1ll2+XtAV5AmQ4zB9XNjS4VcxTrLViQiQ9WOxbETysOzV4So8DhRM/t4WT00ZvIYdkst899BoupMMmWvxNnEcXHZZIZALzPbQhHojs9kzm3BrrVPsjRIAKBDFrYrrgjxem+BTWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqt8F5qH2z2yth
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:11:57 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wqt8B45BYz9sRr;
	Fri, 23 Aug 2024 10:11:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S3mWBa_MIwz6; Fri, 23 Aug 2024 10:11:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wqt8B2tCXz9rvV;
	Fri, 23 Aug 2024 10:11:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 533918B77D;
	Fri, 23 Aug 2024 10:11:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 47GLv59K21Od; Fri, 23 Aug 2024 10:11:54 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B87CD8B763;
	Fri, 23 Aug 2024 10:11:53 +0200 (CEST)
Message-ID: <475c9db0-26f2-4208-a889-cf5cb3110c74@csgroup.eu>
Date: Fri, 23 Aug 2024 10:11:52 +0200
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
Subject: Re: [PATCH v2 26/36] soc: fsl: cpm1: qmc: Introduce
 qmc_init_resource() and its CPM1 version
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-27-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-27-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> Current code handles the CPM1 version of QMC. Resources initialisations
> (i.e. retrieving base addresses and offsets of different parts) will
> be slightly different in the QUICC Engine (QE) version. Indeed, in QE
> version, some resources need to be allocated and are no more "staticaly"
> defined.
> 
> In order to prepare the support for QE version, introduce
> qmc_init_resource() to initialize those resources and isolate the CPM1
> specific operations in a specific function.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/soc/fsl/qe/qmc.c | 47 ++++++++++++++++++++++++++--------------
>   1 file changed, 31 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index 8dd0f8fc7b08..eacc7dd2be53 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -1593,11 +1593,38 @@ static irqreturn_t qmc_irq_handler(int irq, void *priv)
>   	return IRQ_HANDLED;
>   }
>   
> +static int qmc_cpm1_init_resources(struct qmc *qmc, struct platform_device *pdev)
> +{
> +	struct resource *res;
> +
> +	qmc->scc_regs = devm_platform_ioremap_resource_byname(pdev, "scc_regs");
> +	if (IS_ERR(qmc->scc_regs))
> +		return PTR_ERR(qmc->scc_regs);
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "scc_pram");
> +	if (!res)
> +		return -EINVAL;
> +	qmc->scc_pram_offset = res->start - get_immrbase();
> +	qmc->scc_pram = devm_ioremap_resource(qmc->dev, res);
> +	if (IS_ERR(qmc->scc_pram))
> +		return PTR_ERR(qmc->scc_pram);
> +
> +	qmc->dpram  = devm_platform_ioremap_resource_byname(pdev, "dpram");
> +	if (IS_ERR(qmc->dpram))
> +		return PTR_ERR(qmc->dpram);
> +
> +	return 0;
> +}
> +
> +static int qmc_init_resources(struct qmc *qmc, struct platform_device *pdev)
> +{
> +	return qmc_cpm1_init_resources(qmc, pdev);
> +}
> +
>   static int qmc_probe(struct platform_device *pdev)
>   {
>   	struct device_node *np = pdev->dev.of_node;
>   	unsigned int nb_chans;
> -	struct resource *res;
>   	struct qmc *qmc;
>   	int irq;
>   	int ret;
> @@ -1620,21 +1647,9 @@ static int qmc_probe(struct platform_device *pdev)
>   				     "Failed to get TSA serial\n");
>   	}
>   
> -	qmc->scc_regs = devm_platform_ioremap_resource_byname(pdev, "scc_regs");
> -	if (IS_ERR(qmc->scc_regs))
> -		return PTR_ERR(qmc->scc_regs);
> -
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "scc_pram");
> -	if (!res)
> -		return -EINVAL;
> -	qmc->scc_pram_offset = res->start - get_immrbase();
> -	qmc->scc_pram = devm_ioremap_resource(qmc->dev, res);
> -	if (IS_ERR(qmc->scc_pram))
> -		return PTR_ERR(qmc->scc_pram);
> -
> -	qmc->dpram  = devm_platform_ioremap_resource_byname(pdev, "dpram");
> -	if (IS_ERR(qmc->dpram))
> -		return PTR_ERR(qmc->dpram);
> +	ret = qmc_init_resources(qmc, pdev);
> +	if (ret)
> +		return ret;
>   
>   	/* Parse channels informationss */
>   	ret = qmc_of_parse_chans(qmc, np);

