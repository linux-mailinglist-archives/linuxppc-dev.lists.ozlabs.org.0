Return-Path: <linuxppc-dev+bounces-10155-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79353AFC61A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jul 2025 10:50:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbvvj2d0Xz30gC;
	Tue,  8 Jul 2025 18:50:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751964641;
	cv=none; b=Ylr9Ck4FEI8iSZRlU00F3tji5LTzGIVeuhtSQZa270bOWH+91fGVclJjGn7KZvD4maeWw5juLc2qBDQHu3E89ESWFVyhd94vU1KyDIkeVYKJ53rf5Y59IkGjVMdTFPacNLMbk5fSwZYVLiKxb3P27gAO5475KfRdCndpYFHp9NKhTYLMruSBQUbj562bCSTqWERZ8jC1Bx47VCLDj+NDaKOjxxNj/8vfu971Pi3tdL5thpUgkw7qBIHU1cqAv4jR1j7pCcheZhYERp0J63xMC093MGJUR3il07WYqt9UCsvMGlwTVFwAxECz29z9HiLK7NLMuYutOgxb9iFnLx+Ttw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751964641; c=relaxed/relaxed;
	bh=JuFzs3wV9/aUJXvIhAeRiLMm1B0NlfPM41WQQ1CC340=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j8HVqJqXce5AaxQesiBhZ8Q1j95l90U8pOZqiMmGd6V0Hi8wSkh46Kpn7HceauYg2RM8uWT8yKHM78Fehol27oHGkStEarpaIZz/Dliu4iQUdKoZGEyud+GhkXqeS9MzT4V9zI6CBaVLZmIYBmCK1JyE25r0g40sdcMqI3IQCm/hvXdZViUXxkhRWA2EkHIazXcvv0HfvrFLAcRNxYiPEe+7Vxtnk+gX/Qs7EplaIy4Vn5AziiPl96rQ3GYhFapNo9ZwWdCz8xKCYFqKrhkB44YATAJTkRJHn3jmXksOqO75vLaoFCaKVsWAc9FhOmjmYxDP9eVF0tX1yZSx1rA4rg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbvvh3mkfz30WQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jul 2025 18:50:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bbvWt1LYQz9sfF;
	Tue,  8 Jul 2025 10:33:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DoqHkokhU4QF; Tue,  8 Jul 2025 10:33:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bbvWt0c9qz9sXD;
	Tue,  8 Jul 2025 10:33:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0EC098B76C;
	Tue,  8 Jul 2025 10:33:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id s3ivdJfLK1Dw; Tue,  8 Jul 2025 10:33:29 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D09838B763;
	Tue,  8 Jul 2025 10:33:29 +0200 (CEST)
Message-ID: <907f875e-5ed0-4eca-b285-ebb7e47137ce@csgroup.eu>
Date: Tue, 8 Jul 2025 10:33:29 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: Use dev_fwnode()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, Qiang Zhao <qiang.zhao@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-tegra@vger.kernel.org
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-19-jirislaby@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250611104348.192092-19-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

Le 11/06/2025 à 12:43, Jiri Slaby (SUSE) a écrit :
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Qiang Zhao <qiang.zhao@nxp.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org

There must be something wrong with this patch. b4 shazam applies a 
different patch.

$ b4 shazam -l -s --single-message --no-parent 
20250611104348.192092-19-jirislaby@kernel.org
Single-message mode, ignoring any follow-ups
Grabbing thread from 
lore.kernel.org/all/20250611104348.192092-19-jirislaby@kernel.org/t.mbox.gz
Breaking thread to remove parents of 
20250611104348.192092-19-jirislaby@kernel.org
Checking for newer revisions
Grabbing search results from lore.kernel.org
   Added from v2: 1 patches
Analyzing 25 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 22 code-review messages
Will use the latest revision: v2
You can pick other revisions using the -vN flag
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH v2] iio: adc: stm32-adc: Use dev_fwnode()
     + Reviewed-by: David Lechner <dlechner@baylibre.com> (✗ 
DKIM/baylibre-com.20230601.gappssmtp.com)
     + Link: 
https://lore.kernel.org/r/20250612084627.217341-1-jirislaby@kernel.org
     + Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
   ---
   ✓ Signed: DKIM/kernel.org
---
Total patches: 1
---
Application de  iio: adc: stm32-adc: Use dev_fwnode()

You must have posted another patch with the same message ID. I had to 
apply it manually.

Christophe

> 
> ---
> Cc: linux-tegra@vger.kernel.org
> ---
>   drivers/soc/fsl/qe/qe_ic.c | 3 +--
>   drivers/soc/tegra/pmc.c    | 3 +--
>   2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
> index 4068b501a3a3..943911053af6 100644
> --- a/drivers/soc/fsl/qe/qe_ic.c
> +++ b/drivers/soc/fsl/qe/qe_ic.c
> @@ -407,7 +407,6 @@ static int qe_ic_init(struct platform_device *pdev)
>   	void (*high_handler)(struct irq_desc *desc);
>   	struct qe_ic *qe_ic;
>   	struct resource *res;
> -	struct device_node *node = pdev->dev.of_node;
>   
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	if (res == NULL) {
> @@ -441,7 +440,7 @@ static int qe_ic_init(struct platform_device *pdev)
>   		high_handler = NULL;
>   	}
>   
> -	qe_ic->irqhost = irq_domain_create_linear(of_fwnode_handle(node), NR_QE_IC_INTS,
> +	qe_ic->irqhost = irq_domain_create_linear(dev_fwnode(&pdev->dev), NR_QE_IC_INTS,
>   						  &qe_ic_host_ops, qe_ic);
>   	if (qe_ic->irqhost == NULL) {
>   		dev_err(dev, "failed to add irq domain\n");
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index e0d67bfe955c..9543bee0c321 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -2500,8 +2500,7 @@ static int tegra_pmc_irq_init(struct tegra_pmc *pmc)
>   	pmc->irq.irq_set_type = pmc->soc->irq_set_type;
>   	pmc->irq.irq_set_wake = pmc->soc->irq_set_wake;
>   
> -	pmc->domain = irq_domain_create_hierarchy(parent, 0, 96,
> -						  of_fwnode_handle(pmc->dev->of_node),
> +	pmc->domain = irq_domain_create_hierarchy(parent, 0, 96, dev_fwnode(pmc->dev),
>   						  &tegra_pmc_irq_domain_ops, pmc);
>   	if (!pmc->domain) {
>   		dev_err(pmc->dev, "failed to allocate domain\n");


