Return-Path: <linuxppc-dev+bounces-432-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EED95C787
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:10:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqt6112Qcz2yst;
	Fri, 23 Aug 2024 18:10:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400601;
	cv=none; b=Gd+Eo5wijVfJQCQmM9QYqF1GqzQnGGAuBG31yhvB7Kb5dCbB540GG4ccjQ5cHLlpdD0vNZyeR7nd8ikjcW+Tz0BumQFtLWfiKb1awmsrzjAPeHHAzaDSU/WqmICf1h+x2jpnSKPJA0CKk4SGt/JfKHqv6fZMnRB3QjhRJ/c72PDufQnQ9HE0HUzmy2mi8b326qqVEOHdt5dEtUncI8u5rMTfbg9B2vpVDOTVSV5VVjMmquQfZFjea7GopEdVlC3opUU70Liov2MQ5DFTijWpvFsuRQp+quxrNujgavGo7gEdoqOknO8LUkw5v+RinFdAhuCqkXh57NafmjOOIWtYRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400601; c=relaxed/relaxed;
	bh=7nl7CIp5xEUJzqsGLD3nInTvv1ZEd3LGZ3RWP9dVRHo=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=VkrucSnzhDM3cqt7tisGJK6+StHNveJZ5YzE/3uuX+cmT8z20aRZ8p7Y05VibfwcWI7MMr2n1jDKckZ7Tba7uAM18iwH+3MAyeNoRnk5FGexai/8Qt7IwkASJOD0MgucCU+navA8EqCSSQ5bIssMfNeeJpcLs3oi5F9DeON80YPO0tthH3N6XkWZauIoIievao09dWPzL9BFp22ZVWjlQ32HK/CRo2ug0SeSIWKnDjPGcJ9lRYylMC3doyBRQpDlQjHyBPnwejzTceko8Yx0WLoQ5HVNM29DTJW3Fy0TL1mDU0P/XRM6jnpsg9NYjKv+csXNaYOHD4c1OMXM6/de3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqt605rldz2ysd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:10:00 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wqt5x5wGXz9sRr;
	Fri, 23 Aug 2024 10:09:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U6rWnzw2F71U; Fri, 23 Aug 2024 10:09:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wqt5x51wDz9rvV;
	Fri, 23 Aug 2024 10:09:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9ADDF8B77D;
	Fri, 23 Aug 2024 10:09:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id yKYBB4Lb-Wax; Fri, 23 Aug 2024 10:09:57 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1860C8B763;
	Fri, 23 Aug 2024 10:09:57 +0200 (CEST)
Message-ID: <7cc60804-0c93-4d29-8358-31771bdab246@csgroup.eu>
Date: Fri, 23 Aug 2024 10:09:56 +0200
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
Subject: Re: [PATCH v2 20/36] soc: fsl: cpm1: qmc: Remove unneeded parenthesis
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-21-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-21-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> checkpatch.pl raises the following issue in several places
>    CHECK: Unnecessary parenthesis around ...
> 
> Remove them.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/soc/fsl/qe/qmc.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index 44bd9b949770..04466e735302 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -359,8 +359,8 @@ int qmc_chan_set_param(struct qmc_chan *chan, const struct qmc_chan_param *param
>   
>   	switch (param->mode) {
>   	case QMC_HDLC:
> -		if ((param->hdlc.max_rx_buf_size % 4) ||
> -		    (param->hdlc.max_rx_buf_size < 8))
> +		if (param->hdlc.max_rx_buf_size % 4 ||
> +		    param->hdlc.max_rx_buf_size < 8)
>   			return -EINVAL;
>   
>   		qmc_write16(chan->qmc->scc_pram + QMC_GBL_MRBLR,
> @@ -1152,7 +1152,7 @@ static int qmc_check_chans(struct qmc *qmc)
>   	if (ret)
>   		return ret;
>   
> -	if ((info.nb_tx_ts > 64) || (info.nb_rx_ts > 64)) {
> +	if (info.nb_tx_ts > 64 || info.nb_rx_ts > 64) {
>   		dev_err(qmc->dev, "Number of TSA Tx/Rx TS assigned not supported\n");
>   		return -EINVAL;
>   	}
> @@ -1161,7 +1161,7 @@ static int qmc_check_chans(struct qmc *qmc)
>   	 * If more than 32 TS are assigned to this serial, one common table is
>   	 * used for Tx and Rx and so masks must be equal for all channels.
>   	 */
> -	if ((info.nb_tx_ts > 32) || (info.nb_rx_ts > 32)) {
> +	if (info.nb_tx_ts > 32 || info.nb_rx_ts > 32) {
>   		if (info.nb_tx_ts != info.nb_rx_ts) {
>   			dev_err(qmc->dev, "Number of TSA Tx/Rx TS assigned are not equal\n");
>   			return -EINVAL;

