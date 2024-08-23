Return-Path: <linuxppc-dev+bounces-414-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3828B95C73D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:04:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqszK1ZVcz2yn9;
	Fri, 23 Aug 2024 18:04:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400253;
	cv=none; b=BYr6cgtV74enMJp/54tKK2Gad9z9PjFODchCoK1z4AzlOKRcHRoFMYAQDFGFLnNeM6y0Rjfxac0f5KETi3J21aVqCda45D2OEEqcB0qI2hzUETlalOSMiSssiWJ8VmsSd7PWD68CNyt4MnPYH/NqYbJAxREQTU4wfPmzYre9XElVo5yCEi06KygNqp6w2cQp+ZT4r/65o4jjX923RoW8lKpPsmNTgjRv40OxmQWDT0kZWXPVYgWam5ZvtQ6gZ7c7REjgmDA7Q1DQCcr7f66psP5f6ddhDYo/YGX97jnEl6qXZzsasMR1eCUPCAjSihaMtRTh1y9e3wm8pd/SF0E6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400253; c=relaxed/relaxed;
	bh=Yi6TF+SkNPLqtZFWcODaKwvNl28LKz77O3rprkHDCNQ=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=P1s3z5UXuXTfLPs2L97bxHoLFElw0FFBEsRJXT94pW2E7yzBpSIfdypzYX33fyhBrYpvyaAHMajpBqVH+xnVT6hwxmDfsqxQZH12zcweDBf5k0CODwWiGibxcPYUJd1DeLdxsVfr15bnTgeVG9mEGc1pmG/1qbm8R091GNRjYNFegAyS+2wAJGKcZtsSpvpkLARHOSuMupWP8BO1p+Jt+Nf/ieQiwlryLu6I885YpHfUz1dq/GVeyZjTiGgcZvPx+4bj/E93bWc1V3mgt3CxDN5FWSKUm6cAlgKuTG6ECHqFD5R0IPfFxLzy2LzOTczPxzzBbe2WSLszJx7IJRqY8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqszJ6ZDdz2yZc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:04:12 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WqszF3y1Tz9sRy;
	Fri, 23 Aug 2024 10:04:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yk1GffMRyqAy; Fri, 23 Aug 2024 10:04:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WqszF38N7z9sRs;
	Fri, 23 Aug 2024 10:04:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B77A8B77D;
	Fri, 23 Aug 2024 10:04:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id hrfneOf7_t5k; Fri, 23 Aug 2024 10:04:09 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C759E8B763;
	Fri, 23 Aug 2024 10:04:08 +0200 (CEST)
Message-ID: <6aa6c9e7-9db7-4fbc-8e0b-72f83efaab06@csgroup.eu>
Date: Fri, 23 Aug 2024 10:04:07 +0200
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
Subject: Re: [PATCH v2 03/36] soc: fsl: cpm1: tsa: Fix tsa_write8()
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, stable@vger.kernel.org
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-4-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-4-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:10, Herve Codina a écrit :
> The tsa_write8() parameter is an u32 value. This is not consistent with
> the function itself. Indeed, tsa_write8() writes an 8bits value.
> 
> Be consistent and use an u8 parameter value.
> 
> Fixes: 1d4ba0b81c1c ("soc: fsl: cpm1: Add support for TSA")
> Cc: stable@vger.kernel.org
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>


> ---
>   drivers/soc/fsl/qe/tsa.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
> index 6c5741cf5e9d..53968ea84c88 100644
> --- a/drivers/soc/fsl/qe/tsa.c
> +++ b/drivers/soc/fsl/qe/tsa.c
> @@ -140,7 +140,7 @@ static inline void tsa_write32(void __iomem *addr, u32 val)
>   	iowrite32be(val, addr);
>   }
>   
> -static inline void tsa_write8(void __iomem *addr, u32 val)
> +static inline void tsa_write8(void __iomem *addr, u8 val)
>   {
>   	iowrite8(val, addr);
>   }

