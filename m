Return-Path: <linuxppc-dev+bounces-437-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7DC95C79A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:11:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqt804qTyz302W;
	Fri, 23 Aug 2024 18:11:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400704;
	cv=none; b=Os65GjsmXWCrUvRzzakW3jUz/rtdmjxmHj4A6jUuGeeSlIloWf3g6D0wMKtxGM1Y7x/vX4wChMs6Ijq0AujR32y/aYMuCYT3qbvEYtpxcQbseVfQ74JZ9FwxHDh/b97/1m7eg1FN9RInwrwfV+BAFaAQKART8ELooK0oxbP2jkRRoS5Ftfnwm5Jy3ffUJkX2h0uvNs5hQUz8K1aoQYxzRW6O+LZrKn1WGHf5vQuBmrRIPIgyKQUBdJAieC6UqfgnWXlp0X7TEk3KrJJzJA7H/sNsHtf/jXTwW7RSIx5AVM3NGziY4ZdKgtUWESBjEADZZZ6RDg0uGA5QrKrRTRlaPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400704; c=relaxed/relaxed;
	bh=yWFaxhlzPKeHgIB+ixnq96c5GNc6XqqlzD77hqhlaQk=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=cXb2amJfNVqJTISMUZndeSMNR6/fYOmI0bZYCgjJ68jpGeOyilUo5x6ik2PCbIDdbGdnnrjK54T4i3TjJk30GYbXzLJKMIf04wInZd9RgNZZ3yR7qu6k0AentX+hu7/lmem4LssMTZjz/T6icsqPVu/5/XgmKyt3NQdEl5gv20R6Yaf+NWWo40PhfsGmUuhzc1+HyV0lBE+L305vc/um4O9cyvdcxOy6CmNrQLZa6KIWRPucCQQSsP537US5Ktok8NM9xAx8qq1v11cSspuLkui6ILdL3TqgqNZpAZFM98nwr0X0VmCcXVyb7YXB8lMLL8Uh5y/s2FtWXQheGkWUMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqt802h8Nz2yvh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:11:44 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wqt7x32cxz9sRr;
	Fri, 23 Aug 2024 10:11:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JQE8GpmFdX38; Fri, 23 Aug 2024 10:11:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wqt7x1y3Fz9rvV;
	Fri, 23 Aug 2024 10:11:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2FEDE8B77D;
	Fri, 23 Aug 2024 10:11:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 8H0f3Px2PaEg; Fri, 23 Aug 2024 10:11:41 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8C16C8B763;
	Fri, 23 Aug 2024 10:11:40 +0200 (CEST)
Message-ID: <85172a1f-b882-4448-b0f1-242e098faf9d@csgroup.eu>
Date: Fri, 23 Aug 2024 10:11:39 +0200
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
Subject: Re: [PATCH v2 25/36] soc: fsl: cpm1: qmc: Re-order probe() operations
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-26-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-26-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> Current code handles CPM1 version of QMC. In the QUICC Engine (QE)
> version, some operations done at probe() need to be done in a different
> order.
> 
> In order to prepare the support for the QE version, changed the sequence
> of operation done at probe():
> - Retrieve the tsa_serial earlier, before initializing resources.
> - Group SCC initialisation and do this initialization when it is really
>    needed in the probe() sequence.
> 
> Having the QE compatible sequence in the CPM1 version does not lead to
> any issue and works correctly without any regressions.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/soc/fsl/qe/qmc.c | 54 +++++++++++++++++++---------------------
>   1 file changed, 26 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index 85fc86f91806..8dd0f8fc7b08 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -1614,6 +1614,12 @@ static int qmc_probe(struct platform_device *pdev)
>   	}
>   	INIT_LIST_HEAD(&qmc->chan_head);
>   
> +	qmc->tsa_serial = devm_tsa_serial_get_byphandle(qmc->dev, np, "fsl,tsa-serial");
> +	if (IS_ERR(qmc->tsa_serial)) {
> +		return dev_err_probe(qmc->dev, PTR_ERR(qmc->tsa_serial),
> +				     "Failed to get TSA serial\n");
> +	}
> +
>   	qmc->scc_regs = devm_platform_ioremap_resource_byname(pdev, "scc_regs");
>   	if (IS_ERR(qmc->scc_regs))
>   		return PTR_ERR(qmc->scc_regs);
> @@ -1630,33 +1636,13 @@ static int qmc_probe(struct platform_device *pdev)
>   	if (IS_ERR(qmc->dpram))
>   		return PTR_ERR(qmc->dpram);
>   
> -	qmc->tsa_serial = devm_tsa_serial_get_byphandle(qmc->dev, np, "fsl,tsa-serial");
> -	if (IS_ERR(qmc->tsa_serial)) {
> -		return dev_err_probe(qmc->dev, PTR_ERR(qmc->tsa_serial),
> -				     "Failed to get TSA serial\n");
> -	}
> -
> -	/* Connect the serial (SCC) to TSA */
> -	ret = tsa_serial_connect(qmc->tsa_serial);
> -	if (ret) {
> -		dev_err(qmc->dev, "Failed to connect TSA serial\n");
> -		return ret;
> -	}
> -
>   	/* Parse channels informationss */
>   	ret = qmc_of_parse_chans(qmc, np);
>   	if (ret)
> -		goto err_tsa_serial_disconnect;
> +		return ret;
>   
>   	nb_chans = qmc_nb_chans(qmc);
>   
> -	/* Init GMSR_H and GMSR_L registers */
> -	qmc_write32(qmc->scc_regs + SCC_GSMRH,
> -		    SCC_GSMRH_CDS | SCC_GSMRH_CTSS | SCC_GSMRH_CDP | SCC_GSMRH_CTSP);
> -
> -	/* enable QMC mode */
> -	qmc_write32(qmc->scc_regs + SCC_GSMRL, SCC_GSMRL_MODE_QMC);
> -
>   	/*
>   	 * Allocate the buffer descriptor table
>   	 * 8 rx and 8 tx descriptors per channel
> @@ -1666,8 +1652,7 @@ static int qmc_probe(struct platform_device *pdev)
>   					    &qmc->bd_dma_addr, GFP_KERNEL);
>   	if (!qmc->bd_table) {
>   		dev_err(qmc->dev, "Failed to allocate bd table\n");
> -		ret = -ENOMEM;
> -		goto err_tsa_serial_disconnect;
> +		return -ENOMEM;
>   	}
>   	memset(qmc->bd_table, 0, qmc->bd_size);
>   
> @@ -1679,8 +1664,7 @@ static int qmc_probe(struct platform_device *pdev)
>   					     &qmc->int_dma_addr, GFP_KERNEL);
>   	if (!qmc->int_table) {
>   		dev_err(qmc->dev, "Failed to allocate interrupt table\n");
> -		ret = -ENOMEM;
> -		goto err_tsa_serial_disconnect;
> +		return -ENOMEM;
>   	}
>   	memset(qmc->int_table, 0, qmc->int_size);
>   
> @@ -1699,18 +1683,32 @@ static int qmc_probe(struct platform_device *pdev)
>   
>   	ret = qmc_init_tsa(qmc);
>   	if (ret)
> -		goto err_tsa_serial_disconnect;
> +		return ret;
>   
>   	qmc_write16(qmc->scc_pram + QMC_GBL_QMCSTATE, 0x8000);
>   
>   	ret = qmc_setup_chans(qmc);
>   	if (ret)
> -		goto err_tsa_serial_disconnect;
> +		return ret;
>   
>   	/* Init interrupts table */
>   	ret = qmc_setup_ints(qmc);
>   	if (ret)
> -		goto err_tsa_serial_disconnect;
> +		return ret;
> +
> +	/* Connect the serial (SCC) to TSA */
> +	ret = tsa_serial_connect(qmc->tsa_serial);
> +	if (ret) {
> +		dev_err(qmc->dev, "Failed to connect TSA serial\n");
> +		return ret;
> +	}
> +
> +	/* Init GMSR_H and GMSR_L registers */
> +	qmc_write32(qmc->scc_regs + SCC_GSMRH,
> +		    SCC_GSMRH_CDS | SCC_GSMRH_CTSS | SCC_GSMRH_CDP | SCC_GSMRH_CTSP);
> +
> +	/* enable QMC mode */
> +	qmc_write32(qmc->scc_regs + SCC_GSMRL, SCC_GSMRL_MODE_QMC);
>   
>   	/* Disable and clear interrupts,  set the irq handler */
>   	qmc_write16(qmc->scc_regs + SCC_SCCM, 0x0000);

