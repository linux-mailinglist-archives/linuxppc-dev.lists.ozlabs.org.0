Return-Path: <linuxppc-dev+bounces-443-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6B895C7B1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:13:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqtBP1zftz306G;
	Fri, 23 Aug 2024 18:13:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400829;
	cv=none; b=X2RGr8m6EGaZHbPhe/A9YmQdQ6SPXPiGI3Jnl/aT/ZYJh8TnHE/2tzMvLE/b4JtzvvWOHR+zPrITfDufnQSG33RK6iQo3sWqxOzkHb4tB/Fk+NX7Hm2nhLFz6fXwN122zkpPxwBjLQ6u2d3GWPcw61pFpbrdU40o/BI+tjXxhPh1SQR820qD2eGBb3zVfySHtfZXglNRY0MkjJ3Js2wizu37U9c+Y+mPQ7y7uPng7uVazGlyKUCnnS+xGiBQSs+WM3KA9jdgGWQxBHB404aZzJ9TVIfuXAaZ4SeY4bgIDBudQcn9S/aSUnujjj+G4ctO5XTeravWogv2e1EEaB8r/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400829; c=relaxed/relaxed;
	bh=cp2wWbG1rleLB85PLWZR4gidPGuTCJ9FVgXy9hlt+sY=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=SHD3kUGPiEb3957tCFyA060+xl/iQSTQ6cIl/xs0bzogtHxMqJ2d43TYf04cIQffqqA6CEZ9ernGwSy6m9+/UOPcsN8p4/DwhsVFw6sRGCz8HuJaVprDOtVQh3fABS8XF98K3bDHb+7SXh8GZ3fO4fgYttWNk+qKpwNkzxQsp2QpJ64hmMT4Xf8Zc/Z1JCClmSZsGtiGxMlMEWdd0TokoQgaeaBaL/0lRMJDtEHOMRp+wq402tu6xQ8I4UcctWJWvFRJXaZk39Ad6nZf8/HfTW4Br85ZdHJJdyISm4qFT2RAcEBFwECC2X8we048vligAlfhd1Dt+hFb+LHuZpiBCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqtBN6wcVz3064
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:13:48 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WqtBK6jLMz9sRr;
	Fri, 23 Aug 2024 10:13:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G0TzCTJvcQ1f; Fri, 23 Aug 2024 10:13:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WqtBK5wN7z9rvV;
	Fri, 23 Aug 2024 10:13:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B8AB68B77D;
	Fri, 23 Aug 2024 10:13:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kB7Px0ji50NS; Fri, 23 Aug 2024 10:13:45 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 39E4E8B763;
	Fri, 23 Aug 2024 10:13:45 +0200 (CEST)
Message-ID: <9f17277e-17da-4ea5-aba5-22b17abbfc3f@csgroup.eu>
Date: Fri, 23 Aug 2024 10:13:44 +0200
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
Subject: Re: [PATCH v2 31/36] soc: fsl: cpm1: qmc: Introduce qmc_version
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-32-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-32-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> Current code handles the CPM1 version of QMC.
> 
> In order to prepare the support for the QUICC Engine (QE) version of
> QMC, introduce qmc_version to identify versions. This will enable the
> code to make the distinction between several QMC implementations.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/soc/fsl/qe/qmc.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index 062477b7426e..8ff7eaaa4c50 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -215,7 +215,12 @@ struct qmc_chan {
>   	bool	is_rx_stopped;
>   };
>   
> +enum qmc_version {
> +	QMC_CPM1,
> +};
> +
>   struct qmc_data {
> +	enum qmc_version version;
>   	u32 tstate; /* Initial TSTATE value */
>   	u32 rstate; /* Initial RSTATE value */
>   	u32 zistate; /* Initial ZISTATE value */
> @@ -1811,6 +1816,7 @@ static void qmc_remove(struct platform_device *pdev)
>   }
>   
>   static const struct qmc_data qmc_data_cpm1 = {
> +	.version = QMC_CPM1,
>   	.tstate = 0x30000000,
>   	.rstate = 0x31000000,
>   	.zistate = 0x00000100,

