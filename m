Return-Path: <linuxppc-dev+bounces-424-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEB195C769
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:07:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqt3C4v58z2yvs;
	Fri, 23 Aug 2024 18:07:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400455;
	cv=none; b=H6geERbBTz9dVcpeCIiGU822AbC8T6mbKKbtvmTA267MtGnDQ/hvf6WMTX4lLYXV6Cn2rff7NXY3aE4iq7usjB4NtHiajicqQVriX2tkjqAnJC1ZftFr47BAuavOFzJAfCUpfpFnudS3WAwtrxQJiqqbB1wwvqr89XCyyvfDd8WjaULED4xXympK27nFZZobTXvBgRLar9KFrnTBk5ehawBQY5eEo0U/PLJvb9Wet4QOYrhiNRlN8piWKE0ZJfwwxYABm65rq8+4YiOPDKQiGc7kVDEEahsTgyUAFmbHShi1gs8dL05H2n8ISysGsRyUbSVXBqjR52EI8gftClSjnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400455; c=relaxed/relaxed;
	bh=3dDWD5fVjVnV1Fjg3S41eINS1NL3XAWLv9jbSAmI2m8=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=O9GUG4tuLbiIbHo7gH0A1e/oCRaWk46lcjmrty5Wfkv1Z8PBY8K4NREHE7P3chSxbPf3tO8Ke12rRH6bZen09vOssTzNPDorPDMwOaw2xZ+931PGvsRtFXo8IXqAMVTryLg4GslvO5GYcSLtH9LBPb4KUyjA8pNERpiCRERyvBg+2DVuovb/skVHd0glzhBwhPnJ948wrI/cpIxmOOCqpTBzsUcMi4ouA4PeR0cYLE5ao6DvtViUzGyRE3N4nvTFW2t8oZiNi0+Hz0MRn0TtnJWThOUXGc6Et+5a5UVKVKyKG453u+1fwRGiisQonnx5FohnmmngQKGLNzPegIXtcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqt3C2mPZz2yvl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:07:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wqt3848YZz9sRr;
	Fri, 23 Aug 2024 10:07:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zRbH_MPjVkb3; Fri, 23 Aug 2024 10:07:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wqt382zJtz9rvV;
	Fri, 23 Aug 2024 10:07:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 55EAF8B77D;
	Fri, 23 Aug 2024 10:07:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id hzwVDzL1ZAvs; Fri, 23 Aug 2024 10:07:32 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BB8488B763;
	Fri, 23 Aug 2024 10:07:31 +0200 (CEST)
Message-ID: <add9adba-dd8c-4c90-b0c1-eb9509b0e4df@csgroup.eu>
Date: Fri, 23 Aug 2024 10:07:30 +0200
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
Subject: Re: [PATCH v2 19/36] soc: fsl: cpm1: qmc: Fix blank line and spaces
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-20-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-20-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> checkpatch.pl raises the following issues
>    CHECK: Please don't use multiple blank lines
>    CHECK: Alignment should match open parenthesis
> 
> Fix them.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>


> ---
>   drivers/soc/fsl/qe/qmc.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index e2ac3e59bb79..44bd9b949770 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -274,7 +274,6 @@ static void qmc_setbits32(void __iomem *addr, u32 set)
>   	qmc_write32(addr, qmc_read32(addr) | set);
>   }
>   
> -
>   int qmc_chan_get_info(struct qmc_chan *chan, struct qmc_chan_info *info)
>   {
>   	struct tsa_serial_info tsa_info;
> @@ -1411,7 +1410,7 @@ static int qmc_setup_chan(struct qmc *qmc, struct qmc_chan *chan)
>   		qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, 0x00000080);
>   		qmc_write16(chan->s_param + QMC_SPE_MFLR, 60);
>   		qmc_write16(chan->s_param + QMC_SPE_CHAMR,
> -			QMC_SPE_CHAMR_MODE_HDLC | QMC_SPE_CHAMR_HDLC_IDLM);
> +			    QMC_SPE_CHAMR_MODE_HDLC | QMC_SPE_CHAMR_HDLC_IDLM);
>   	}
>   
>   	/* Do not enable interrupts now. They will be enabled later */
> @@ -1604,7 +1603,6 @@ static int qmc_probe(struct platform_device *pdev)
>   	if (IS_ERR(qmc->scc_regs))
>   		return PTR_ERR(qmc->scc_regs);
>   
> -
>   	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "scc_pram");
>   	if (!res)
>   		return -EINVAL;
> @@ -1650,7 +1648,7 @@ static int qmc_probe(struct platform_device *pdev)
>   	 */
>   	qmc->bd_size = (nb_chans * (QMC_NB_TXBDS + QMC_NB_RXBDS)) * sizeof(cbd_t);
>   	qmc->bd_table = dmam_alloc_coherent(qmc->dev, qmc->bd_size,
> -		&qmc->bd_dma_addr, GFP_KERNEL);
> +					    &qmc->bd_dma_addr, GFP_KERNEL);
>   	if (!qmc->bd_table) {
>   		dev_err(qmc->dev, "Failed to allocate bd table\n");
>   		ret = -ENOMEM;
> @@ -1663,7 +1661,7 @@ static int qmc_probe(struct platform_device *pdev)
>   	/* Allocate the interrupt table */
>   	qmc->int_size = QMC_NB_INTS * sizeof(u16);
>   	qmc->int_table = dmam_alloc_coherent(qmc->dev, qmc->int_size,
> -		&qmc->int_dma_addr, GFP_KERNEL);
> +					     &qmc->int_dma_addr, GFP_KERNEL);
>   	if (!qmc->int_table) {
>   		dev_err(qmc->dev, "Failed to allocate interrupt table\n");
>   		ret = -ENOMEM;
> @@ -1711,7 +1709,7 @@ static int qmc_probe(struct platform_device *pdev)
>   
>   	/* Enable interrupts */
>   	qmc_write16(qmc->scc_regs + SCC_SCCM,
> -		SCC_SCCE_IQOV | SCC_SCCE_GINT | SCC_SCCE_GUN | SCC_SCCE_GOV);
> +		    SCC_SCCE_IQOV | SCC_SCCE_GINT | SCC_SCCE_GUN | SCC_SCCE_GOV);
>   
>   	ret = qmc_finalize_chans(qmc);
>   	if (ret < 0)

