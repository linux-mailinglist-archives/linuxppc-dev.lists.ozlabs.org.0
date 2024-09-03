Return-Path: <linuxppc-dev+bounces-911-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D12A1969792
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 10:45:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyfN75gHRz2xck;
	Tue,  3 Sep 2024 18:45:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725353143;
	cv=none; b=JiO1SRYclFX4zb9QV9+lRvAASGUV9uE53ZK9VIHhab++tQeMUMYjpeFKaw/BVyQHmT6KyGvnhFMhQ6CcR0wcSlwgNrOJRyjkvjarT9DFJOKQDQOO6t4meJirsgm/n9jDSVkOlC8A87CNILAJFN9GfEIj7CqVUm93o2EV69AluzGDA1j9+CW4UEkN+TJAPkq5ijXkH9oY4wcIovdkHu8Oz8dmRznITD0n7zHk1jUjSc7cqRhdZizIHM1RlpCo6PG35XFIvPk8twx4Ok2ugw+dTQHS6cBZejG1zeJXc7lIWiMSCOu7JkIrZf0LIbpTvBTo6Y26xYBZJNubMK3dT5KS8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725353143; c=relaxed/relaxed;
	bh=WDXn+tcCF4R9YXePdAQ26F/SNyFZIQ+BexAY4jmAkxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hxq+4if9AKEh13hUZ0W7B3cQ2VLnEc5FzYGpkl96u2FTlaiZnBH4aKjqpeK2dDKxmi8J5A1ANcNo4lF3c/Pw1Ups82f+JCwlB1rUEamFKwPiJgUoACysvDfQt7i7GSMEoIIYyzkb0jzkB3ehgNBumTVbuxtZtRZLT8NX+6EgNGtTVzKDtx9dcnM03SIUYOqzK2exYEUrc0FHNzvWI9ViFJZ6Yc0DMtN2r+TrzIoBhD0q14Mn+gxuVJ6ycKSAiNnV6zL8qfyKYYf8Fk2iNGnpTLpE2DO4tb4M+aVItOgo6462vEq2/h9pCYxb4a0UxkbvJVt1btMlP7Wh/krJwAOMgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyfN73Tkbz2xbC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 18:45:43 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WyfN44H9Kz9sSC;
	Tue,  3 Sep 2024 10:45:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kgnPgwmJvGCa; Tue,  3 Sep 2024 10:45:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WyfN43XSfz9sRy;
	Tue,  3 Sep 2024 10:45:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 684628B76E;
	Tue,  3 Sep 2024 10:45:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id oqf0uNZh5oTP; Tue,  3 Sep 2024 10:45:40 +0200 (CEST)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4B3BD8B768;
	Tue,  3 Sep 2024 10:45:40 +0200 (CEST)
Message-ID: <3d0e63da-770d-4317-8c33-023d5ffdd0fa@csgroup.eu>
Date: Tue, 3 Sep 2024 10:45:40 +0200
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
Subject: Re: [PATCH] soc: fsl: qbman: Remove redundant warnings
To: Xiaolei Wang <xiaolei.wang@windriver.com>, robh@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240802021651.3854295-1-xiaolei.wang@windriver.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240802021651.3854295-1-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 02/08/2024 à 04:16, Xiaolei Wang a écrit :
> [Vous ne recevez pas souvent de courriers de xiaolei.wang@windriver.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> RESERVEDMEM_OF_DECLARE usage has been removed. For
> non-popwerpc platforms, such as ls1043, this warning
> is redundant. ls1043 itself uses shared-dma-mem.
> 
> Fixes: 3e62273ac63a ("soc: fsl: qbman: Remove RESERVEDMEM_OF_DECLARE usage")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>   drivers/soc/fsl/qbman/qman_ccsr.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qbman/qman_ccsr.c b/drivers/soc/fsl/qbman/qman_ccsr.c
> index 392e54f14dbe..aa5348f4902f 100644
> --- a/drivers/soc/fsl/qbman/qman_ccsr.c
> +++ b/drivers/soc/fsl/qbman/qman_ccsr.c
> @@ -791,8 +791,6 @@ static int fsl_qman_probe(struct platform_device *pdev)
>           * FQD memory MUST be zero'd by software
>           */
>          zero_priv_mem(fqd_a, fqd_sz);
> -#else
> -       WARN(1, "Unexpected architecture using non shared-dma-mem reservations");
>   #endif
>          dev_dbg(dev, "Allocated FQD 0x%llx 0x%zx\n", fqd_a, fqd_sz);
> 
> --
> 2.25.1
> 

Applied for 6.12

Thanks
Christophe

