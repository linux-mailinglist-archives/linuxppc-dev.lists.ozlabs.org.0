Return-Path: <linuxppc-dev+bounces-413-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 739C095C73A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:04:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqsz92d7Kz2ymg;
	Fri, 23 Aug 2024 18:04:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400245;
	cv=none; b=a5JEPKWkLjc1C4DxguYn3ICVhBAbWiVfaf3aXMJ7oV5qkSIDMusTFczgvBD4L4hvAdRUJ7p1RuzZAaVsz8q/DcP3F8OWTPwZk6IYtKoFHxadS9VQIQw04U+dl1KBfzzQ7q58qoGPpYv75K3Hrp1ThUZOXEt5GXbCV0B6VAnOS+/lI3EfVG93NVplK+btQetShf9PUFKgXXBTLymHrl+F2JehPsrHYRs1u/XxAI3wdGIm4+qA1HqAAAWzA4dFy2UXlC1+6tLmhtelAfIkgHgSzMJ3Ss5k4nbNv0RBSZhrhhxlQhsU5npwAWQs/nxkd/Pvawji4/JumF4duOStg9rdMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400245; c=relaxed/relaxed;
	bh=hSplg+uOrTKMcZxu60GlpoRaalPznc2rs610ljK0W2c=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=NfHF1CnH2JU9dF5s7o41WeGjWaR/UTOEV72YPz5YVAkMjdAMJVyipPQHCtW5ByMbAGuWIrehXSza00SjNeTSKwE479LBMBskVB9k121wCt5rh9zZd7L1nw/JaxOT7JkcW0QGLJdNRfw1TZUWqqCEER/gOvczaqJvI58R1+9cMe5EuLtg2XsbE6zRJF9+tMCzxQ9vcgdzSHdOTAGRr2uq2AmeKg10tbXV5/dQsZn8rCSxZRIH/nMBfeCjHMDsVhqT1BafC8jIIbd0TkeM1gvAiSEFstrHp+tTiq4c2ezh5yIdvcK1nTDwNSKi5xjAyak/iXikkc8rYI4Frl1dPqVZJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqsz90RjHz2yZc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:04:04 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wqsz56TZXz9sSL;
	Fri, 23 Aug 2024 10:04:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bdF8zHuSRETr; Fri, 23 Aug 2024 10:04:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wqsys3TRhz9sSR;
	Fri, 23 Aug 2024 10:03:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 668E38B77D;
	Fri, 23 Aug 2024 10:03:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id cPtC2e1YItjw; Fri, 23 Aug 2024 10:03:49 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C38B38B763;
	Fri, 23 Aug 2024 10:03:48 +0200 (CEST)
Message-ID: <d43fe116-6f74-4ee5-ab65-8bc895dedc05@csgroup.eu>
Date: Fri, 23 Aug 2024 10:03:47 +0200
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
Subject: Re: [PATCH v2 02/36] soc: fsl: cpm1: qmc: Enable TRNSYNC only when
 needed
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-3-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-3-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:10, Herve Codina a écrit :
> The TRNSYNC feature is enabled whatever the number of time-slots used.
> The feature is needed only when more than one time-slot is used.
> 
> Improve the driver enabling TRNSYNC only when it is needed.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>


> ---
>   drivers/soc/fsl/qe/qmc.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index bacabf731dcb..916395745850 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -889,6 +889,7 @@ EXPORT_SYMBOL(qmc_chan_stop);
>   static int qmc_setup_chan_trnsync(struct qmc *qmc, struct qmc_chan *chan)
>   {
>   	struct tsa_serial_info info;
> +	unsigned int w_rx, w_tx;
>   	u16 first_rx, last_tx;
>   	u16 trnsync;
>   	int ret;
> @@ -898,6 +899,14 @@ static int qmc_setup_chan_trnsync(struct qmc *qmc, struct qmc_chan *chan)
>   	if (ret)
>   		return ret;
>   
> +	w_rx = hweight64(chan->rx_ts_mask);
> +	w_tx = hweight64(chan->tx_ts_mask);
> +	if (w_rx <= 1 && w_tx <= 1) {
> +		dev_dbg(qmc->dev, "only one or zero ts -> disable trnsync\n");
> +		qmc_clrbits16(chan->s_param + QMC_SPE_CHAMR, QMC_SPE_CHAMR_TRANSP_SYNC);
> +		return 0;
> +	}
> +
>   	/* Find the first Rx TS allocated to the channel */
>   	first_rx = chan->rx_ts_mask ? __ffs64(chan->rx_ts_mask) + 1 : 0;
>   
> @@ -911,6 +920,7 @@ static int qmc_setup_chan_trnsync(struct qmc *qmc, struct qmc_chan *chan)
>   		trnsync |= QMC_SPE_TRNSYNC_TX((last_tx % info.nb_tx_ts) * 2);
>   
>   	qmc_write16(chan->s_param + QMC_SPE_TRNSYNC, trnsync);
> +	qmc_setbits16(chan->s_param + QMC_SPE_CHAMR, QMC_SPE_CHAMR_TRANSP_SYNC);
>   
>   	dev_dbg(qmc->dev, "chan %u: trnsync=0x%04x, rx %u/%u 0x%llx, tx %u/%u 0x%llx\n",
>   		chan->id, trnsync,
> @@ -1378,7 +1388,7 @@ static int qmc_setup_chan(struct qmc *qmc, struct qmc_chan *chan)
>   	if (chan->mode == QMC_TRANSPARENT) {
>   		qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, 0x18000080);
>   		qmc_write16(chan->s_param + QMC_SPE_TMRBLR, 60);
> -		val = QMC_SPE_CHAMR_MODE_TRANSP | QMC_SPE_CHAMR_TRANSP_SYNC;
> +		val = QMC_SPE_CHAMR_MODE_TRANSP;
>   		if (chan->is_reverse_data)
>   			val |= QMC_SPE_CHAMR_TRANSP_RD;
>   		qmc_write16(chan->s_param + QMC_SPE_CHAMR, val);

