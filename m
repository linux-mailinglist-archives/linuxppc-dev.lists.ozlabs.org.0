Return-Path: <linuxppc-dev+bounces-430-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EB995C77C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:09:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqt5163HZz2yyy;
	Fri, 23 Aug 2024 18:09:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400549;
	cv=none; b=ESmDI2GC9wwDoOdT7AdxDG5JSP5WG7QspZpSqtKxVJHeASqyd0xMwmRAHzuxy/mnwXWX+iEM4uIb4xtE/rtcr8faHRa1fCAbLPeBfvNwtLEjFlJ5kPvGwF2lSGxQ6ZxJgqHrQvTy1uMCfAqeP5z//TkXgbq/jCCkopmyfDJpaGt+E/6aaln+ijswavMI+u2HzoClwCEBhnnP9g8AeQBOmg2Y+88Iy6sPP65yMN67EGxcojC6F0LUKDxERdP5UHCrgROYA0cSfCKJTvhUMLJdMstnUi0XRhZllFgHxLBb4ipCu+0Khaq+6S8aJsVsl36CLsEpzZToyBaXPEjlqRS+pA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400549; c=relaxed/relaxed;
	bh=fnDp3/c+g0Jb2ImWH1C70r5Ca5Wr5MoY05TCnrfBzlo=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=msbt+R6FZwrM6R4zw6322oVEpX01oWQiJeentyQ+2I5ozH1AbY+ggzlwa91ncgENNvbGz7478fINUkFHy0wmAOQQNm7MkKhztw0VsO6Rq2uGm1/CTfAvZsNjQCHmDlg+xIIlvn1xycQyN833izA+0uKoGPUzvJf5/YNX/p4JnBBWFPZuqsKjrwmaRb/bDDiMjc5iB8Yr+4JbIGmZAukrJIq2He7N6x/68fn/CvOs6zqdiKnnTtRMphPd6kJipKkSfxpz2atmFBOrnh8h1SBbePxsz5ZkwzLXyi6wtUP3gyKySygC1Hbe+v6OJBuSTydNxAe2OIHpCdJbH0usuEXayA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqt513spYz2ysZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:09:09 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wqt4y60rXz9sRr;
	Fri, 23 Aug 2024 10:09:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UiplMSDidgyX; Fri, 23 Aug 2024 10:09:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wqt4y4mdBz9rvV;
	Fri, 23 Aug 2024 10:09:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8FA158B77D;
	Fri, 23 Aug 2024 10:09:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id NaWL9QwuywuU; Fri, 23 Aug 2024 10:09:06 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F2F6F8B763;
	Fri, 23 Aug 2024 10:09:05 +0200 (CEST)
Message-ID: <91ad5ded-43e5-4869-86a1-72f7c073a042@csgroup.eu>
Date: Fri, 23 Aug 2024 10:09:04 +0200
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
Subject: Re: [PATCH v2 16/36] soc: fsl: cpm1: tsa: Introduce
 tsa_serial_get_num()
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-17-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-17-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> TSA consumers in CPM1 implementation don't need to know about the serial
> device number used by the TSA component. In QUICC Engine implementation,
> this information is needed.
> 
> Improve the TSA API with tsa_serial_get_num() in order to provide this
> information.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/soc/fsl/qe/tsa.c | 56 ++++++++++++++++++++++++++--------------
>   drivers/soc/fsl/qe/tsa.h |  3 +++
>   2 files changed, 39 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
> index c540cf9144c0..f0889b3fcaf2 100644
> --- a/drivers/soc/fsl/qe/tsa.c
> +++ b/drivers/soc/fsl/qe/tsa.c
> @@ -231,6 +231,39 @@ static bool tsa_is_qe(const struct tsa *tsa)
>   	return IS_ENABLED(CONFIG_QUICC_ENGINE);
>   }
>   
> +static int tsa_qe_serial_get_num(struct tsa_serial *tsa_serial)
> +{
> +	struct tsa *tsa = tsa_serial_get_tsa(tsa_serial);
> +
> +	switch (tsa_serial->id) {
> +	case FSL_QE_TSA_UCC1: return 0;
> +	case FSL_QE_TSA_UCC2: return 1;
> +	case FSL_QE_TSA_UCC3: return 2;
> +	case FSL_QE_TSA_UCC4: return 3;
> +	case FSL_QE_TSA_UCC5: return 4;
> +	default:
> +		break;
> +	}
> +
> +	dev_err(tsa->dev, "Unsupported serial id %u\n", tsa_serial->id);
> +	return -EINVAL;
> +}
> +
> +int tsa_serial_get_num(struct tsa_serial *tsa_serial)
> +{
> +	struct tsa *tsa = tsa_serial_get_tsa(tsa_serial);
> +
> +	/*
> +	 * There is no need to get the serial num out of the TSA driver in the
> +	 * CPM case.
> +	 * Further more, in CPM, we can have 2 types of serial SCCs and FCCs.
> +	 * What kind of numbering to use that can be global to both SCCs and
> +	 * FCCs ?
> +	 */
> +	return tsa_is_qe(tsa) ? tsa_qe_serial_get_num(tsa_serial) : -EOPNOTSUPP;
> +}
> +EXPORT_SYMBOL(tsa_serial_get_num);
> +
>   static int tsa_cpm1_serial_connect(struct tsa_serial *tsa_serial, bool connect)
>   {
>   	struct tsa *tsa = tsa_serial_get_tsa(tsa_serial);
> @@ -271,26 +304,9 @@ static int tsa_qe_serial_connect(struct tsa_serial *tsa_serial, bool connect)
>   	int ucc_num;
>   	int ret;
>   
> -	switch (tsa_serial->id) {
> -	case FSL_QE_TSA_UCC1:
> -		ucc_num = 0;
> -		break;
> -	case FSL_QE_TSA_UCC2:
> -		ucc_num = 1;
> -		break;
> -	case FSL_QE_TSA_UCC3:
> -		ucc_num = 2;
> -		break;
> -	case FSL_QE_TSA_UCC4:
> -		ucc_num = 3;
> -		break;
> -	case FSL_QE_TSA_UCC5:
> -		ucc_num = 4;
> -		break;
> -	default:
> -		dev_err(tsa->dev, "Unsupported serial id %u\n", tsa_serial->id);
> -		return -EINVAL;
> -	}
> +	ucc_num = tsa_qe_serial_get_num(tsa_serial);
> +	if (ucc_num < 0)
> +		return ucc_num;
>   
>   	spin_lock_irqsave(&tsa->lock, flags);
>   	ret = ucc_set_qe_mux_tsa(ucc_num, connect);
> diff --git a/drivers/soc/fsl/qe/tsa.h b/drivers/soc/fsl/qe/tsa.h
> index d9df89b6da3e..da137bc0f49b 100644
> --- a/drivers/soc/fsl/qe/tsa.h
> +++ b/drivers/soc/fsl/qe/tsa.h
> @@ -39,4 +39,7 @@ struct tsa_serial_info {
>   /* Get information */
>   int tsa_serial_get_info(struct tsa_serial *tsa_serial, struct tsa_serial_info *info);
>   
> +/* Get serial number */
> +int tsa_serial_get_num(struct tsa_serial *tsa_serial);
> +
>   #endif /* __SOC_FSL_TSA_H__ */

