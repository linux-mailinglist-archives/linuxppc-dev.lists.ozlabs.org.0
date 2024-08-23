Return-Path: <linuxppc-dev+bounces-431-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C7595C781
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:09:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqt5Z3Sg5z2ysZ;
	Fri, 23 Aug 2024 18:09:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400578;
	cv=none; b=V+mdy+n0IknSW2IWiK2V4S1qvRo6kItd56e/CqRCviB5mb97HG+uy9W44Wk/YwhXGS9IKuwF0dGLPH9/JprXvu+teS+KjwTYPFNcaJybg2OZtNOvXZktkXQV6GKLI3i8zes41x+/sCYCeUqJDEkLtHlzwWAG76/Axx9XbL80CZNCYv2b1Eeq6TVN8QfnDRizTb4cQSPp47kLA9PB0uF2Q+JtnOayIRaDis7rbPhlnBNy0Q8TZrEiOezpvH0C1lAe6agop+ZqF1ijo9jFbAmt5L3DmQjz7lJuvAf2onIqGsVa3mqyjQowh8zopmBQHTzsp7CUVkuPmgyeLdeY7dvZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400578; c=relaxed/relaxed;
	bh=wdYbu6cvxwlJ/jf7HYjRlJhLTwXvfSub1L13YzmNAHQ=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=fUIaY9E6pT6Y4FrDY2T+2x+gVvSuDIjgveGNurJgBRnMbru5WDOrGt0qChZDgpCUZxDZPfDd/7Nkj+h/rkFmG8lw2W+k3C4RIT8HX4cTxZJlRFyhGr+we6TjxTS/nReTIp4zdgZoRLtPwwZcW3bnLrjdHFVt3i3I2Zgnyjk508WLb85P+/EgvWZYOraoXWb0QBGVfSUM9ldGulcaKJgueD7cg4OAafac3FHigxwI8vZ5UHHQWq0L7+9RYK16t2w+FmGcWUSwUcVC6zJl6/W354rGHxAkOsUDSUEFX/cnUGS36A0Ai9+n2KIfqQglL0StU/ODaJwdDasHlVIMvyr9xw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqt5Z1HMBz2yGm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:09:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wqt5W2MJZz9sRr;
	Fri, 23 Aug 2024 10:09:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0U4kXzK3M0nj; Fri, 23 Aug 2024 10:09:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wqt5W1bdvz9rvV;
	Fri, 23 Aug 2024 10:09:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 266F78B77D;
	Fri, 23 Aug 2024 10:09:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id l2fi3h8iZSSd; Fri, 23 Aug 2024 10:09:35 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9511E8B763;
	Fri, 23 Aug 2024 10:09:34 +0200 (CEST)
Message-ID: <72e00507-490d-4df0-ae0e-103c0d76ae47@csgroup.eu>
Date: Fri, 23 Aug 2024 10:09:33 +0200
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
Subject: Re: [PATCH v2 17/36] soc: fsl: cpm1: qmc: Rename QMC_TSA_MASK
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-18-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-18-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> QMC_TSA_MASK is a bitfield. The value defined is a specific value of
> this bitfield and correspond to the use of 8bit resolution for the
> routing entry.
> 
> Be accurate and rename the defined constant to reflect this point.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/soc/fsl/qe/qmc.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index 916395745850..721e0770510c 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -77,7 +77,7 @@
>   /* TSA entry (16bit entry in TSATRX and TSATTX) */
>   #define QMC_TSA_VALID		(1 << 15)
>   #define QMC_TSA_WRAP		(1 << 14)
> -#define QMC_TSA_MASK		(0x303F)
> +#define QMC_TSA_MASK_8BIT	(0x303F)
>   #define QMC_TSA_CHANNEL(x)	((x) << 6)
>   
>   /* Tx buffer descriptor base address (16 bits, offset from MCBASE) */
> @@ -641,7 +641,7 @@ static int qmc_chan_setup_tsa_64rxtx(struct qmc_chan *chan, const struct tsa_ser
>   		return -EINVAL;
>   	}
>   
> -	val = QMC_TSA_VALID | QMC_TSA_MASK | QMC_TSA_CHANNEL(chan->id);
> +	val = QMC_TSA_VALID | QMC_TSA_MASK_8BIT | QMC_TSA_CHANNEL(chan->id);
>   
>   	/* Check entries based on Rx stuff*/
>   	for (i = 0; i < info->nb_rx_ts; i++) {
> @@ -677,7 +677,7 @@ static int qmc_chan_setup_tsa_32rx(struct qmc_chan *chan, const struct tsa_seria
>   
>   	/* Use a Rx 32 entries table */
>   
> -	val = QMC_TSA_VALID | QMC_TSA_MASK | QMC_TSA_CHANNEL(chan->id);
> +	val = QMC_TSA_VALID | QMC_TSA_MASK_8BIT | QMC_TSA_CHANNEL(chan->id);
>   
>   	/* Check entries based on Rx stuff */
>   	for (i = 0; i < info->nb_rx_ts; i++) {
> @@ -713,7 +713,7 @@ static int qmc_chan_setup_tsa_32tx(struct qmc_chan *chan, const struct tsa_seria
>   
>   	/* Use a Tx 32 entries table */
>   
> -	val = QMC_TSA_VALID | QMC_TSA_MASK | QMC_TSA_CHANNEL(chan->id);
> +	val = QMC_TSA_VALID | QMC_TSA_MASK_8BIT | QMC_TSA_CHANNEL(chan->id);
>   
>   	/* Check entries based on Tx stuff */
>   	for (i = 0; i < info->nb_tx_ts; i++) {

