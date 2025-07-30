Return-Path: <linuxppc-dev+bounces-10450-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50147B15A67
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 10:20:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsQBy2rq0z3bm3;
	Wed, 30 Jul 2025 18:20:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753863642;
	cv=none; b=mZrQNxwjoKJlzOr/4rweTL3IX+HIkNoXyoRdDp4Y89XHCtKnYUcUeMUxwLRvBJxW5lnUjZgMaQPWGlfAw/U/YVa1Ac80buKYSAYVvsOh5NVyHkdXQnlclAJvHV6RGjl1kRjZ0x/CrjrRujCJAdutkZXTln1SMg6LC01dpBXJGAQ21jQPdSrCHUMiK87LFhRs/isWbAhd2mFKa5lou3qz8FSs8h9F3jEiWS8QMXzIHFaXQbZIM9wv60vN97szu6YpZP8usJFgNG+a8yMlzqsMu0Df9BV/jIIYqW479fl3kFM8GTDFdnqzsZtpmVKkaPT84y+vHZkmrTHxpKoWoPFD8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753863642; c=relaxed/relaxed;
	bh=eRAeoKV5pUyXoAdIuxSJmrk/TcQYY2n+8VEn90XzOG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GB7crKgm+dt/Hj2WzYS+TzEv380623QExARRRMd6vYXdYgWh3r/0MJznjGkeXnL10xIh/UlZpaXv2yiZoL+LOfga7RKUaGpmv8lpplPwZjc6gp/ct45TS0Cjj9H/kPt0Fv5nNWrgC2fC4JQ2A//eTLoWtgSytVlEw7FiJjL6fq48cRx71/DWLRNddzFwmWtQrCA57pJ8YIEfUE5yDiMghkOVeCZtS2IusGw8Cch0LUgbj2fRXxt2RZfbdZu958FKcnBygHNQ1grQ51lqTqJAZ3vO3VmECBcThl+OSLuPj4fpBE9r3z1qOSH0ICH7RPNDRx4TriDDSvuOqgLMqd/Y2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsQBx6RwFz2yGf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 18:20:41 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bsMbV6VcSz9sN6;
	Wed, 30 Jul 2025 08:23:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yHtOx1Nfecmn; Wed, 30 Jul 2025 08:23:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bsMbV5SVQz9s92;
	Wed, 30 Jul 2025 08:23:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B588A8B76C;
	Wed, 30 Jul 2025 08:23:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id S5cPZej56LTI; Wed, 30 Jul 2025 08:23:18 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8502C8B763;
	Wed, 30 Jul 2025 08:23:18 +0200 (CEST)
Message-ID: <31b4169e-8c46-4d00-8cd7-708bcfe24777@csgroup.eu>
Date: Wed, 30 Jul 2025 08:23:18 +0200
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
Subject: Re: [EXTERNE] [PATCH -resend] powerpc: Use dev_fwnode()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, maddy@linux.ibm.com
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
References: <20250723062842.1831271-1-jirislaby@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250723062842.1831271-1-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 23/07/2025 à 08:28, Jiri Slaby (SUSE) a écrit :
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Naveen N Rao <naveen@kernel.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Link: https://lore.kernel.org/all/4bc0e1ca-a523-424a-8759-59e353317fba@kernel.org/
> ---
>   arch/powerpc/platforms/8xx/cpm1-ic.c | 3 +--

For the 8xx:

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>

>   arch/powerpc/sysdev/fsl_msi.c        | 5 ++---
>   2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/8xx/cpm1-ic.c b/arch/powerpc/platforms/8xx/cpm1-ic.c
> index a49d4a9ab3bc..3292071e4da3 100644
> --- a/arch/powerpc/platforms/8xx/cpm1-ic.c
> +++ b/arch/powerpc/platforms/8xx/cpm1-ic.c
> @@ -110,8 +110,7 @@ static int cpm_pic_probe(struct platform_device *pdev)
>   
>   	out_be32(&data->reg->cpic_cimr, 0);
>   
> -	data->host = irq_domain_create_linear(of_fwnode_handle(dev->of_node),
> -					      64, &cpm_pic_host_ops, data);
> +	data->host = irq_domain_create_linear(dev_fwnode(dev), 64, &cpm_pic_host_ops, data);
>   	if (!data->host)
>   		return -ENODEV;
>   
> diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
> index 4fe8a7b1b288..2a007bfb038d 100644
> --- a/arch/powerpc/sysdev/fsl_msi.c
> +++ b/arch/powerpc/sysdev/fsl_msi.c
> @@ -412,9 +412,8 @@ static int fsl_of_msi_probe(struct platform_device *dev)
>   	}
>   	platform_set_drvdata(dev, msi);
>   
> -	msi->irqhost = irq_domain_create_linear(of_fwnode_handle(dev->dev.of_node),
> -				      NR_MSI_IRQS_MAX, &fsl_msi_host_ops, msi);
> -
> +	msi->irqhost = irq_domain_create_linear(dev_fwnode(&dev->dev), NR_MSI_IRQS_MAX,
> +						&fsl_msi_host_ops, msi);
>   	if (msi->irqhost == NULL) {
>   		dev_err(&dev->dev, "No memory for MSI irqhost\n");
>   		err = -ENOMEM;


