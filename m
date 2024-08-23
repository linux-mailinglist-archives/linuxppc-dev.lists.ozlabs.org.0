Return-Path: <linuxppc-dev+bounces-412-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2557695C736
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:03:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqsyd5hB6z2yhP;
	Fri, 23 Aug 2024 18:03:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400217;
	cv=none; b=KgBix+WYpDm45kripTl8bxebI0U8+3fNky8VBLiUDOhisr0AfJ4fbODH7WjSNFRt9cOpg4v4+ZrihLR7LjNZj1qd8gsJ8MjhLJK4ATyBTfTv0AIDjoPqb6k0NBHGuBkjeNgUTh6XxdknmcuulC6rctg3wSnqk+Vk+wqj0SVMD2xGCBoI8F+7GSnQuhEhjD644QVOflwPgjrmZf98x9YVt/q+8EhvzkyfgQaUgHWKitr3Aj+tFmbaSzWTrLy14o4A2h4mP49+DiPjOex36LhV6QnNRJ5N11hn/cFcfLKUmQfyhEYBUOBwNXFzk3a94BxNxisvmA5DoPYSS1RUgwXMHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400217; c=relaxed/relaxed;
	bh=/Qhdstgk3n7ecGIHmdzLDa9RejRT9cRXOaFQ9Xe+vOA=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=ZpGB/ZmSuqs3GlaUo6qZA/hZ6EkqlUFw4HqweMKvrYGqxgMvLRzZKeNzFAZAygU7FdjYL/0qj78aKsj4u19XHmyviWKPVJ93u39In5FemhmPpV/0/odkPjfF5cLjCuptCci68mXwg3/U3sBvwLJqz451BxgsVjLwAcn37xv6mnyoF1DDG+xmdyBtt7ki0A58NiQqbBhfRHXQ2VUNq09k7uUlVALkRT5yVVXRIyvppbIxzfLDCTbBCFbD4hgS/XLJt1K2saqaytzqatatI4Ni2Q2Mes7pBMIxkI7j/tQtqva4RGhaopuo3a0CNDHJrGzfgVMgRUFeDPADSKawlV+3fw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqsyd3M7Rz2yZc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:03:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WqsyV5TkTz9sRr;
	Fri, 23 Aug 2024 10:03:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s4XLifoY12ly; Fri, 23 Aug 2024 10:03:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WqsyV4NkMz9rvV;
	Fri, 23 Aug 2024 10:03:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8447F8B77D;
	Fri, 23 Aug 2024 10:03:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Ca1iEuO7cMiA; Fri, 23 Aug 2024 10:03:30 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E4AE58B763;
	Fri, 23 Aug 2024 10:03:29 +0200 (CEST)
Message-ID: <834e0fdd-bc87-481d-bed1-1c8295d5a2be@csgroup.eu>
Date: Fri, 23 Aug 2024 10:03:28 +0200
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
Subject: Re: [PATCH v2 01/36] soc: fsl: cpm1: qmc: Update TRNSYNC only in
 transparent mode
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, stable@vger.kernel.org
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-2-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-2-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:10, Herve Codina a écrit :
> The TRNSYNC feature is available (and enabled) only in transparent mode.
> 
> Since commit 7cc9bda9c163 ("soc: fsl: cpm1: qmc: Handle timeslot entries
> at channel start() and stop()") TRNSYNC register is updated in
> transparent and hdlc mode. In hdlc mode, the address of the TRNSYNC
> register is used by the QMC for other internal purpose. Even if no weird
> results were observed in hdlc mode, touching this register in this mode
> is wrong.
> 
> Update TRNSYNC only in transparent mode.
> 
> Fixes: 7cc9bda9c163 ("soc: fsl: cpm1: qmc: Handle timeslot entries at channel start() and stop()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/soc/fsl/qe/qmc.c | 24 ++++++++++++++----------
>   1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index 76bb496305a0..bacabf731dcb 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -940,11 +940,13 @@ static int qmc_chan_start_rx(struct qmc_chan *chan)
>   		goto end;
>   	}
>   
> -	ret = qmc_setup_chan_trnsync(chan->qmc, chan);
> -	if (ret) {
> -		dev_err(chan->qmc->dev, "chan %u: setup TRNSYNC failed (%d)\n",
> -			chan->id, ret);
> -		goto end;
> +	if (chan->mode == QMC_TRANSPARENT) {
> +		ret = qmc_setup_chan_trnsync(chan->qmc, chan);
> +		if (ret) {
> +			dev_err(chan->qmc->dev, "chan %u: setup TRNSYNC failed (%d)\n",
> +				chan->id, ret);
> +			goto end;
> +		}
>   	}
>   
>   	/* Restart the receiver */
> @@ -982,11 +984,13 @@ static int qmc_chan_start_tx(struct qmc_chan *chan)
>   		goto end;
>   	}
>   
> -	ret = qmc_setup_chan_trnsync(chan->qmc, chan);
> -	if (ret) {
> -		dev_err(chan->qmc->dev, "chan %u: setup TRNSYNC failed (%d)\n",
> -			chan->id, ret);
> -		goto end;
> +	if (chan->mode == QMC_TRANSPARENT) {
> +		ret = qmc_setup_chan_trnsync(chan->qmc, chan);
> +		if (ret) {
> +			dev_err(chan->qmc->dev, "chan %u: setup TRNSYNC failed (%d)\n",
> +				chan->id, ret);
> +			goto end;
> +		}
>   	}
>   
>   	/*

