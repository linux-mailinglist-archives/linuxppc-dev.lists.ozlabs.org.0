Return-Path: <linuxppc-dev+bounces-439-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E6195C7A1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:12:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqt8d5v0Tz3048;
	Fri, 23 Aug 2024 18:12:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400737;
	cv=none; b=HJ64tCU9IQ+ZwzzLyB+7bE6qHw3PAwUr+CZA7egVWE9QfLWH9zyzCWupSxLL0r4IQ0fmkzd6Hlr5vFNwGl0iPCNSa48iZPD/cwANOkQVThO5HGFPYleN6hH+KP+pitWI9t7CLqQHRaVMd/909QAtZb4r99CkzGAbeStFJFOBh3pP9/ow+nFuF/gdqs3cyGqX1ErbEfAFLGvm3HmZVwZ+agEDfW/ljokyj3D7zy/AI0sXfgzP8/cqUY6hYqcayIObOd0tujEnD7MJoAKc9p/Vx2itZmYvfTCDVyQV+qR5/iImL+LwqLI0/qIwGM/1HBnMWpkVE4brCGIxtrnrKvFAYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400737; c=relaxed/relaxed;
	bh=Rlt9grI5EcMZAAQdzsHllw8KEQhKphsZ4jvGbhwP3fI=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=EnQPO5ld5zhtrPOOjSEi5cbMuU4223x6qxBsWukN3xm0w/8TlBU2wJnXTO66endpZzRSQGL7Af40kHkEDWiEFAMkDFJteLWDwVDCTOvDWgJrKS2AZlgio7rG2Ss85EpexXgXIoa3lpPG9YVyFC9XTTuTD7uMeqOk7eZnwoe2kgTmfK9SKPJDKAQgLFla8PzJm/LXHN3fDpBajcyMQ4bFqV5TfZbHfYnfVgTCruhS4+wfdJvStkdbQdJi6h8jNig9gZ5I+cOxNABACZua07YM4saUFV26RruPHOWLz3kjlBtWjMvnF5Sc6/UFMgrkloc3cJhWwmswVTP6sGE70gI8KA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqt8d3nCQz2yvw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:12:17 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wqt8Z2Ky9z9sRr;
	Fri, 23 Aug 2024 10:12:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 32SoiF7gwB8l; Fri, 23 Aug 2024 10:12:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wqt8Z1NGmz9rvV;
	Fri, 23 Aug 2024 10:12:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1DD3E8B77D;
	Fri, 23 Aug 2024 10:12:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id DnJaPxcKeQj9; Fri, 23 Aug 2024 10:12:14 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 82BE08B763;
	Fri, 23 Aug 2024 10:12:13 +0200 (CEST)
Message-ID: <52bee8b1-1d42-441d-ba90-b7d6eb9163b8@csgroup.eu>
Date: Fri, 23 Aug 2024 10:12:12 +0200
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
Subject: Re: [PATCH v2 27/36] soc: fsl: cpm1: qmc: Introduce
 qmc_{init,exit}_xcc() and their CPM1 version
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-28-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-28-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> Current code handles the CPM1 version of QMC and initialize the QMC used
> SCC. The QUICC Engine (QE) version uses an UCC (Unified Communication
> Controllers) instead of the SCC (Serial Communication Controllers) used
> in the CPM1 version. These controllers serve the same purpose and are
> used in the same way but their inializations are slightly different.
> 
> In order to prepare the support for QE version of QMC, introduce
> qmc_init_xcc() to initialize theses controllers (UCC in QE and SCC in
> CPM1) and isolate the CPM1 specific SCC initialization in a specific
> function.
> 
> Also introduce qmc_exit_xcc() for consistency to revert operations done
> in qmc_init_xcc().
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/soc/fsl/qe/qmc.c | 66 +++++++++++++++++++++++++++-------------
>   1 file changed, 45 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index eacc7dd2be53..b95227378f97 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -1621,6 +1621,41 @@ static int qmc_init_resources(struct qmc *qmc, struct platform_device *pdev)
>   	return qmc_cpm1_init_resources(qmc, pdev);
>   }
>   
> +static int qmc_cpm1_init_scc(struct qmc *qmc)
> +{
> +	u32 val;
> +	int ret;
> +
> +	/* Connect the serial (SCC) to TSA */
> +	ret = tsa_serial_connect(qmc->tsa_serial);
> +	if (ret)
> +		return dev_err_probe(qmc->dev, ret, "Failed to connect TSA serial\n");
> +
> +	/* Init GMSR_H and GMSR_L registers */
> +	val = SCC_GSMRH_CDS | SCC_GSMRH_CTSS | SCC_GSMRH_CDP | SCC_GSMRH_CTSP;
> +	qmc_write32(qmc->scc_regs + SCC_GSMRH, val);
> +
> +	/* enable QMC mode */
> +	qmc_write32(qmc->scc_regs + SCC_GSMRL, SCC_GSMRL_MODE_QMC);
> +
> +	/* Disable and clear interrupts */
> +	qmc_write16(qmc->scc_regs + SCC_SCCM, 0x0000);
> +	qmc_write16(qmc->scc_regs + SCC_SCCE, 0x000F);
> +
> +	return 0;
> +}
> +
> +static int qmc_init_xcc(struct qmc *qmc)
> +{
> +	return qmc_cpm1_init_scc(qmc);
> +}
> +
> +static void qmc_exit_xcc(struct qmc *qmc)
> +{
> +	/* Disconnect the serial from TSA */
> +	tsa_serial_disconnect(qmc->tsa_serial);
> +}
> +
>   static int qmc_probe(struct platform_device *pdev)
>   {
>   	struct device_node *np = pdev->dev.of_node;
> @@ -1711,29 +1746,18 @@ static int qmc_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> -	/* Connect the serial (SCC) to TSA */
> -	ret = tsa_serial_connect(qmc->tsa_serial);
> -	if (ret) {
> -		dev_err(qmc->dev, "Failed to connect TSA serial\n");
> +	/* Init SCC */
> +	ret = qmc_init_xcc(qmc);
> +	if (ret)
>   		return ret;
> -	}
>   
> -	/* Init GMSR_H and GMSR_L registers */
> -	qmc_write32(qmc->scc_regs + SCC_GSMRH,
> -		    SCC_GSMRH_CDS | SCC_GSMRH_CTSS | SCC_GSMRH_CDP | SCC_GSMRH_CTSP);
> -
> -	/* enable QMC mode */
> -	qmc_write32(qmc->scc_regs + SCC_GSMRL, SCC_GSMRL_MODE_QMC);
> -
> -	/* Disable and clear interrupts,  set the irq handler */
> -	qmc_write16(qmc->scc_regs + SCC_SCCM, 0x0000);
> -	qmc_write16(qmc->scc_regs + SCC_SCCE, 0x000F);
> +	/* Set the irq handler */
>   	irq = platform_get_irq(pdev, 0);
>   	if (irq < 0)
> -		goto err_tsa_serial_disconnect;
> +		goto err_exit_xcc;
>   	ret = devm_request_irq(qmc->dev, irq, qmc_irq_handler, 0, "qmc", qmc);
>   	if (ret < 0)
> -		goto err_tsa_serial_disconnect;
> +		goto err_exit_xcc;
>   
>   	/* Enable interrupts */
>   	qmc_write16(qmc->scc_regs + SCC_SCCM,
> @@ -1761,8 +1785,8 @@ static int qmc_probe(struct platform_device *pdev)
>   err_disable_intr:
>   	qmc_write16(qmc->scc_regs + SCC_SCCM, 0);
>   
> -err_tsa_serial_disconnect:
> -	tsa_serial_disconnect(qmc->tsa_serial);
> +err_exit_xcc:
> +	qmc_exit_xcc(qmc);
>   	return ret;
>   }
>   
> @@ -1776,8 +1800,8 @@ static void qmc_remove(struct platform_device *pdev)
>   	/* Disable interrupts */
>   	qmc_write16(qmc->scc_regs + SCC_SCCM, 0);
>   
> -	/* Disconnect the serial from TSA */
> -	tsa_serial_disconnect(qmc->tsa_serial);
> +	/* Exit SCC */
> +	qmc_exit_xcc(qmc);
>   }
>   
>   static const struct qmc_data qmc_data_cpm1 = {

