Return-Path: <linuxppc-dev+bounces-3448-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B3E9D3917
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2024 12:05:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtdnX0jrpz2ykc;
	Wed, 20 Nov 2024 22:05:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732100736;
	cv=none; b=bvu8jh3ZuSe8LM708/IsvhidR6xonraER3YB0s9A/QfXQ5DPjslW/xUr/6woA5vGQWZfZbl+oymrhZTLXeZ9ZoWIsPQVbcExag6GHRFcLXlyUSaNPRySEqhbFGQDQgtFU+ZdH8pnFcjWNodAEl1RflYebG1XzlkkdE+5Fe/waCh5YzQBfNvtZLvji94nHQ5HfrjNcmNcIDckaHQfmVS23kZv9hSHwgnqMvuVLqfYymxh2aLXwvaHlMYmk7Xku/fod8yb4ypnqIER0QYH7qWUtgN/P11q89lk6mU+fm7PsnQMZ2vZjQydtRP5R77Wc8eWvzdmC7lt9yOXyxlTEHk2tw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732100736; c=relaxed/relaxed;
	bh=/rU1AR6aTpgM2ROV+E15hlofo4AwKyR2TyoXwJhHEMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q5TaJkjt0sWTPvBZMHV9x4PpbiK2pQuSkDCgZiQd9fMF5HBiCQ/deqy+UXblVki3sXlechmZcphXOgfqEh0RNwwkxL+wfghFvSeJVt0WONzv8WUsHIvgI3pawtrAFoEb6IC9ta1Jr97HDUrUKZGHoZifjuV3Wgdp6Ohx3UwCg9Od8M6oXH23um55Gf+NctznYXl8KBVAzeJwdwKje/lW1CZRKGFLDbmusuSttz5JzQF/h/I9v8exoWrBzi/djOqjFhCeLau79IrhLMAlMFAzUtkIqfsP2vHAIJxLGEMyyzR37HD4irN2cVf1tQtG/iQneyK1gshLjEsOPMtkLuLHzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XtdnV6MYzz2y8V
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2024 22:05:34 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XtdnN4b0wz9sRk;
	Wed, 20 Nov 2024 12:05:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KRl99YdAGIa3; Wed, 20 Nov 2024 12:05:28 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XtdnN3rRQz9sPd;
	Wed, 20 Nov 2024 12:05:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7680A8B7B7;
	Wed, 20 Nov 2024 12:05:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id s3GXbmcGUpO4; Wed, 20 Nov 2024 12:05:28 +0100 (CET)
Received: from [192.168.232.160] (PO19116.IDSI0.si.c-s.fr [192.168.232.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 28FF18B798;
	Wed, 20 Nov 2024 12:05:28 +0100 (CET)
Message-ID: <83d92bcb-b025-4595-8d77-0c5546b84518@csgroup.eu>
Date: Wed, 20 Nov 2024 12:05:27 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: fsl: cpm1: qmc: Fix qmc_probe() warn missing error
 code ret
To: Pei Xiao <xiaopei01@kylinos.cn>, herve.codina@bootlin.com,
 qiang.zhao@nxp.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, xiaopeitux@foxmail.com
References: <bac2dc94-1bf3-4dcf-b776-cd78ef992d28@suswa.mountain>
 <82d8c18da160b9e0a73c5c5e2eb25ad2831cc6f9.1732095360.git.xiaopei01@kylinos.cn>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <82d8c18da160b9e0a73c5c5e2eb25ad2831cc6f9.1732095360.git.xiaopei01@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 20/11/2024 à 10:38, Pei Xiao a écrit :
> [Vous ne recevez pas souvent de courriers de xiaopei01@kylinos.cn. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> platform_get_irq() may failed,but ret still equals to 0,
> will cacuse qmc_probe() return 0 but fail.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202411051350.KNy6ZIWA-lkp@intel.com/
> Fixes: 3178d58e0b97 ("soc: fsl: cpm1: Add support for QMC")
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>   drivers/soc/fsl/qe/qmc.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index 19cc581b06d0..a78768cd6007 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -2004,8 +2004,10 @@ static int qmc_probe(struct platform_device *pdev)
> 
>          /* Set the irq handler */
>          irq = platform_get_irq(pdev, 0);
> -       if (irq < 0)
> +       if (irq < 0) {
> +               ret = -EINVAL;

Why force -EINVAL ?

What if platform_get_irq() returns -EPROBE_DEFER ?

Anyway, this problem is already fixed by 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20241105145623.401528-1-herve.codina@bootlin.com/ 
which is on its way to mainline.

>                  goto err_exit_xcc;
> +       }
>          ret = devm_request_irq(qmc->dev, irq, qmc_irq_handler, 0, "qmc", qmc);
>          if (ret < 0)
>                  goto err_exit_xcc;
> --
> 2.34.1
> 

