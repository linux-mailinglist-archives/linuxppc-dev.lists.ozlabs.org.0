Return-Path: <linuxppc-dev+bounces-393-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4035795BC84
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 18:55:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqTph2ZN7z2yj3;
	Fri, 23 Aug 2024 02:55:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724345724;
	cv=none; b=lcXpeabz0HgH7jZRMYH+UnZluEfLdqBrhuoiQIM+M4rTOCOe1Ar1FVqiOZe7AyXUkKeg+pHCJuSyIE1BWFZ7yOQ4Gk3gxJffROrFm2K/KKFjA9AfQCDNVucQpvUE4S0HseP2vsWNSYnD21HWhN/zbPX5yh6EE8DgBkjvVAdXogMULZy/qibJLnKa1V9AuzvQN5ym80UGpXqW5nhM3MX8tWIt1VvOQivTQ6q28UoVQdCWTkuvHDiKZ8KtVtrCcV64SlX6WBfewTVVASScK7w8RQfw//x5SWnhHSdXA1fBu8Qy1auZeMFt1HCt4g1JflYk+VNOaEd4xmtWRSqt4DoP4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724345724; c=relaxed/relaxed;
	bh=m12SqqovWPMmMi9oUTyYE6c1uQdzS1OXu+wjDbl/O3M=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=UzLH6Vk4ewU4wLC7+m/PFcbDMJ3sT7XVmK9venrL6JDKRkclUf3/318W5ja16tP4d39GL7zp0hjM4q/0ewqWIaMoZ6Qfw4d7lrdDZ9w7yZ2GHAGwBPXKqcbmNXIeUxRzALGD2D/iZmCNJfP93BnMmRHZc+HAKFl1659vZC6lbv69n0yJK6Wn0U+6B5l76vh1l2bN8r89glyswW53AYEfFQGdp12RlqXdMKyCdTmC4F5YV3Ff6bt0FDIzKT8kGdcdAZYXgSGSByFPzLoBBub2rBc6ndutIMQlgHe8kq2mIgi/NbFyx8HXAfK1dezN2ZWjkgjznqz7oBVGJS+iAvaRnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqTph06mkz2yhn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 02:55:22 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WqTpb33Jrz9sSK;
	Thu, 22 Aug 2024 18:55:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tHnpF95fD7qK; Thu, 22 Aug 2024 18:55:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WqTpb2JDhz9rvV;
	Thu, 22 Aug 2024 18:55:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 404E78B77D;
	Thu, 22 Aug 2024 18:55:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id DyQRBygMVoHV; Thu, 22 Aug 2024 18:55:19 +0200 (CEST)
Received: from [192.168.232.181] (PO16920.IDSI0.si.c-s.fr [192.168.232.181])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EDCA18B763;
	Thu, 22 Aug 2024 18:55:18 +0200 (CEST)
Message-ID: <3241a692-088d-4316-85c9-f2939a9179b2@csgroup.eu>
Date: Thu, 22 Aug 2024 18:55:18 +0200
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

Hi,

Le 02/08/2024 à 04:16, Xiaolei Wang a écrit :
> [Vous ne recevez pas souvent de courriers de xiaolei.wang@windriver.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> RESERVEDMEM_OF_DECLARE usage has been removed. For
> non-popwerpc platforms, such as ls1043, this warning
> is redundant. ls1043 itself uses shared-dma-mem.

Can you please explain in more details ? I don't understand what it is 
redundant with.

Thanks
Christophe

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

