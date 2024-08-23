Return-Path: <linuxppc-dev+bounces-440-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F0095C7A8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:13:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqt9T72dRz2yvy;
	Fri, 23 Aug 2024 18:13:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400781;
	cv=none; b=jKfXLP6jF4R8mMulLE3HrFG/AXuLxKD4UM+0jVSbZfZkSGDcFY4OuIHRuKdvLFxf9N4SDw5yBce0/JdWJa9SwmCwgsVijqSUBoK7occdZQbuuVc5rUCqdzn1XCSs1ekIjwK9/mxDMCvnZoeMpKbF5AuTu6bFWu0ENM29OG2k87f74q7+9tOprfAXnTKxE733KsmpkVOLi96/ED9/kMhAol5MKz5uGfXlYm5k79xJ8nde4EmEq0GQXPcakndEChKjwQHw4IweVyg9CWVf/4OijPPE2FEuSPovXfBzKWMlGJO06KlY6CQcrXyVIFaAGvbQvUQYS7ynbviWVf8pdC9FQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400781; c=relaxed/relaxed;
	bh=PJuuPrNeDGXU1/ABZzzVFMrWtT0LtyPNgoXarXOhFtY=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=b1R6jm/g8w0zgWupzXAc2h92ejo5CDHGYSKGSF5adLxz9X+1yzIwAuNlNyJz2aV0wSgl0qPyae9AncMnADd3MrMbcE5gXVxd55RaDIHzyA5mnJyaFGkjDMl8EXVp5Tw008p6RNsvnEH2lrPXpW45qRd5bA+K7UEmnyeL3xVl7lGAZKyiOjh6LZ1DH0Tqv3gXr3i0/cziiyE5a2UA05rxHe82qXCudScfOAiVm1VvJe++ylnbrSDq1eWem5AvS62e+FnBYQjlftOKv9sSGAyjsqqxcMx/pdAb+QNkWhvz//074/Wu48UXgrk4d/2WwJiZSw41FFBq7AD71r+EODLUlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqt9T4vtDz2yvw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:13:01 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wqt9Q2XVYz9sRr;
	Fri, 23 Aug 2024 10:12:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5yr2tWc3yfXO; Fri, 23 Aug 2024 10:12:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wqt9Q1gWyz9rvV;
	Fri, 23 Aug 2024 10:12:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 28C4B8B77D;
	Fri, 23 Aug 2024 10:12:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 2VydmTKCVB_P; Fri, 23 Aug 2024 10:12:58 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C9468B763;
	Fri, 23 Aug 2024 10:12:57 +0200 (CEST)
Message-ID: <48882839-ebb0-43c7-8011-660cd64524a8@csgroup.eu>
Date: Fri, 23 Aug 2024 10:12:56 +0200
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
Subject: Re: [PATCH v2 28/36] soc: fsl: cpm1: qmc: Rename qmc_chan_command()
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-29-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-29-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> Current code handles CPM1 version of QMC and qmc_chan_command() is
> clearly CPM1 specific.
> 
> In order to prepare the support for the QUICC Engine (QE) version,
> rename qmc_chan_command() to reflect that point.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/soc/fsl/qe/qmc.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index b95227378f97..272da250a763 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -794,7 +794,7 @@ static int qmc_chan_setup_tsa_rx(struct qmc_chan *chan, bool enable)
>   	return qmc_chan_setup_tsa_32rx(chan, &info, enable);
>   }
>   
> -static int qmc_chan_command(struct qmc_chan *chan, u8 qmc_opcode)
> +static int qmc_chan_cpm1_command(struct qmc_chan *chan, u8 qmc_opcode)
>   {
>   	return cpm_command(chan->id << 2, (qmc_opcode << 4) | 0x0E);
>   }
> @@ -813,7 +813,7 @@ static int qmc_chan_stop_rx(struct qmc_chan *chan)
>   	}
>   
>   	/* Send STOP RECEIVE command */
> -	ret = qmc_chan_command(chan, 0x0);
> +	ret = qmc_chan_cpm1_command(chan, 0x0);
>   	if (ret) {
>   		dev_err(chan->qmc->dev, "chan %u: Send STOP RECEIVE failed (%d)\n",
>   			chan->id, ret);
> @@ -850,7 +850,7 @@ static int qmc_chan_stop_tx(struct qmc_chan *chan)
>   	}
>   
>   	/* Send STOP TRANSMIT command */
> -	ret = qmc_chan_command(chan, 0x1);
> +	ret = qmc_chan_cpm1_command(chan, 0x1);
>   	if (ret) {
>   		dev_err(chan->qmc->dev, "chan %u: Send STOP TRANSMIT failed (%d)\n",
>   			chan->id, ret);

