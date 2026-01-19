Return-Path: <linuxppc-dev+bounces-15955-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3419D39F32
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 08:00:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvhD808GHz2yDk;
	Mon, 19 Jan 2026 18:00:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768806007;
	cv=none; b=CimuecUKOIl4cLi6gb4VkaWPphIU5hFH7Iap93iqUel2L8TAWJOHiBS9dl/4kzVU58wgNXuCxxBgd5LFKIFVj4P6t4Cfzl0W1p5v6rsH416iPhB2BRKSzsU/Bev9Fk7uIIuSvMrgSVo+ooeRd7LxJ7hAIxOGUPmFtFw0XC1KCUgTZ8W7zwGXPdcfkc76rqPYASCKh7ADdMwfIxBKzbKz5sU8tOeiF8tVIeedZBn8q0vx+OEZrsf7kB5djYKUNOpiqIp9r1rrsAoWa7sLzttZbsgZDQoxir8KRe6xXfKInfPhu47J4O0iMLZOUo89ENyuzcPH3M0d6LQWohURFKlx+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768806007; c=relaxed/relaxed;
	bh=/wkxWw47BzORbcIvnRcjuJoLYpePdE9B8SaY9zOEa/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jl7Vak3xIzspjJ6fwkcSkYav/PWhFLn6c8+QRvgl9v4f99BcUFzO2a6+xopaHWq6UnZhQi1+Pd9jpPkSSwibBPZoEIMUrEBBqXetAxpFewfFMgpmojZo+bwM8M5T6/3miAj6a/Jrw7R1Wp6b3dJ34DzYPh3iYuiAOUbmBTMDqpLvzoRqZIcc0i1SyijjnDLyZvJ5ySBDyx45Rxip9OEduzq5JEaw3rkylkooC1TH7rHATz+CnLZE3GwUyqxXqbIk6rlwjfRjogBN5VrhDGZvW/iw/P8bbxRMwuj5NGbSIVnPVLCcJsV4K4pBNy+SguqXaMZTkDHzBwmNpd4ZYGwFEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jW70hutA; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jW70hutA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvhD71g6gz2xSZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 18:00:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5946540732;
	Mon, 19 Jan 2026 07:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E107C116C6;
	Mon, 19 Jan 2026 07:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768806004;
	bh=YvzjJHnbrMAmoE/TSVnhogdp44McXfMW4MzGac5horQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jW70hutAeyrClYX7yTEihU3wZwlmrM11rZw/9AoEEboc2kkVpGJvVTMrhZKKtOcUm
	 DUCnHEAhqf8siCiZWjP9RtDK8zyLHJlOCyw6rPhkZJpky8G2VU7h9P5LsjbPHQUguU
	 r1pKsVhyWev7xf7QjHEr2BIvlswoYc3kwuEw9bFmP6BXCYcF4ZmrlXbDU1Ow0ppqIU
	 ZVVXGL5w0YJT4MgQfW0IBx2t/K+XFVHGymbu2gdqdoJjdodcQS2ryEkI+JC/76jQXW
	 RjMqeqgEYwnBgRERK2odmIWsvNb9nKHAGq2ZvFJvcICCdMcmei1dBOLDFdt5BfERUz
	 dqZae3CNawUww==
Message-ID: <3860577c-2cef-4e10-9cc1-33246d261a8b@kernel.org>
Date: Mon, 19 Jan 2026 08:00:01 +0100
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
Subject: Re: [PATCH] soc: fsl: qe: qe_ports_ic: Consolidate chained IRQ
 handler install/remove
To: Chen Ni <nichen@iscas.ac.cn>, qiang.zhao@nxp.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260119055715.889001-1-nichen@iscas.ac.cn>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260119055715.889001-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 19/01/2026 à 06:57, Chen Ni a écrit :
> [Vous ne recevez pas souvent de courriers de nichen@iscas.ac.cn. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> The driver currently sets the handler data and the chained handler in
> two separate steps. This creates a theoretical race window where an
> interrupt could fire after the handler is set but before the data is
> assigned, leading to a NULL pointer dereference.

I don't understand what you mean, how can this happen ?

irq_set_handler_data() is called _before_ irq_set_chained_handler(), so 
how could an interrupt fire _before_ the data is assigned ?

> 
> Replace the two calls with irq_set_chained_handler_and_data() to set
> both the handler and its data atomically under the irq_desc->lock.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>   drivers/soc/fsl/qe/qe_ports_ic.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
> index 61dd09fec6f6..8e2107e2cde5 100644
> --- a/drivers/soc/fsl/qe/qe_ports_ic.c
> +++ b/drivers/soc/fsl/qe/qe_ports_ic.c
> @@ -114,8 +114,7 @@ static int qepic_probe(struct platform_device *pdev)
>          if (!data->host)
>                  return -ENODEV;
> 
> -       irq_set_handler_data(irq, data);
> -       irq_set_chained_handler(irq, qepic_cascade);
> +       irq_set_chained_handler_and_data(irq, qepic_cascade, data);
> 
>          return 0;
>   }
> --
> 2.25.1
> 


