Return-Path: <linuxppc-dev+bounces-434-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D480F95C78F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:10:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqt6y5w8Qz2ytR;
	Fri, 23 Aug 2024 18:10:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400650;
	cv=none; b=YJ3RxGjpwtWtdjqzvO+hn/qLD0tU2dBTEOa5KJM9NzFmievOLPl+vqaJIDdzv1X6cvnJ2csRwThF66F5qsdL5CFElNEDeWRUFf2ACnPWEBpoMAhxV6Azsj0UZ8msGYOhIYltFX8RtjoWZUoT4vvUELUwgoEJK8EGafMfDY29mLMq6UhXLhvSIgTg7sCFcp+SKTJxAvdcb8q2HQm8hHR/Tlyx2qjOGW9mtpUxNHgS/mr+FB7qMxau2Gd7m6eK1u8LH0X+6CHnhN1GLceyQQrDAXEIZ5V4VVKGn0tOEGZJGnyWPTUaQUEmQYPhVfcKbn05wPszxGXSlQ9pp5tahc296Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400650; c=relaxed/relaxed;
	bh=hwkNPaY5xnJnN3qX18Qf3NmZzLUe62WuEeHRocyQdB4=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=NsIIURh73cGX/RVDymjNBsDmzbVxhwc9+FIw9KHayM5hz7uIiyNABR9BteMRcI7jivFsmjTkds0fSftzDReUCzWHxi/3KgWgJn0HHpf/TRliuFVm0kkK/rdBfcpaHp+/qViLxvXrZsSpZOuukAWac+LuUlB6wXUF4WYnFClv6eMyaPjmxxJddudQ2RHclaOEe+/g2vE0aE0Lp9LVGszoELm5B4EjrQ1KeS2530No5BRVlvMYcFeFsOvLcdkfwGcZ9q9c22MQLwn9Jd9zs/CAbGQiWMPuAK18tDc9hbmi+9jOlNxiL8161s96KVHU4r5rk3cr+/Pw3jQ4V3t5IIh/Iw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqt6y3kk3z2ynn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:10:50 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wqt6v4mwZz9sRr;
	Fri, 23 Aug 2024 10:10:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FS1D3af3fsRN; Fri, 23 Aug 2024 10:10:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wqt6v40cnz9rvV;
	Fri, 23 Aug 2024 10:10:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 771368B77D;
	Fri, 23 Aug 2024 10:10:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id TcN3HHoc2kt3; Fri, 23 Aug 2024 10:10:47 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E99D08B763;
	Fri, 23 Aug 2024 10:10:46 +0200 (CEST)
Message-ID: <447b75e4-6a25-4756-a37e-dbe46091ef76@csgroup.eu>
Date: Fri, 23 Aug 2024 10:10:45 +0200
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
Subject: Re: [PATCH v2 22/36] soc: fsl: cpm1: qmc: Add missing spinlock
 comment
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-23-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-23-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> checkpatch.pl raises the following issue
>    CHECK: spinlock_t definition without comment
> 
> Add the missing comments.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/soc/fsl/qe/qmc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index 2d54d7400d2d..3736a8e4575e 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -196,7 +196,7 @@ struct qmc_chan {
>   	u64	rx_ts_mask;
>   	bool is_reverse_data;
>   
> -	spinlock_t	tx_lock;
> +	spinlock_t	tx_lock; /* Protect Tx related data */
>   	cbd_t __iomem *txbds;
>   	cbd_t __iomem *txbd_free;
>   	cbd_t __iomem *txbd_done;
> @@ -204,7 +204,7 @@ struct qmc_chan {
>   	u64	nb_tx_underrun;
>   	bool	is_tx_stopped;
>   
> -	spinlock_t	rx_lock;
> +	spinlock_t	rx_lock; /* Protect Rx related data */
>   	cbd_t __iomem *rxbds;
>   	cbd_t __iomem *rxbd_free;
>   	cbd_t __iomem *rxbd_done;

