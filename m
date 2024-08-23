Return-Path: <linuxppc-dev+bounces-427-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF8895C773
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:08:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqt440b9Jz2yxN;
	Fri, 23 Aug 2024 18:08:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400500;
	cv=none; b=L7my8twGfSLolzebsCNXhMCdXVK3cXzruJ08y8q7/MjmNhUjmNPEdq2PAT5SOkaM32JAcxBfPIIRVb+r6rRTKh/E2lM2VZSDipo1Qwhgbk4jP6crEP+ufI2x+487VTh4NiGyiwoSLxCy3CRzeh48SZqbHXQc19EbFhOLMyLlwqsUarGE2+R67vr0TvGFDmYHdD63NutPy1imZEDJF1GtaDHCU/C4ZyCmDmDXibyU8MGt6BxNyHQSt/00Gs98DJq/6ab6Qw2mzk9sjXNZGWW59FLDZv5a+lcAvAbBKFWjinp90Y1k6x0a5R7IchXg93rSCgvSVwF2zTkA2tcUgKTPhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400500; c=relaxed/relaxed;
	bh=z5JGXKtAPWOjWYwDIbYfYHk/i/dQQZCYpDqK1hoJlRI=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=AsuwzfCpeK2/50J+XDoyqGf+aHY1gxxZUTkggGDk181ItwULr+FQ4KaSkbXYk3mFCbmFToyWQqqkMuzPiDcOiAioHHeYfsWDFaXqKcPguT/32BC9TqP3VE00zPXZdu3Z2C2fTk6gmthR52ANKZ01exMbTlY2iTIbi81RcT8oBcR5TlrTREJjPaBxF/uSPoPth5G0XRKbS+gao68GZ0jnvqaZug5Ngvpnt42tnwQrhUWFp7bnj7bzAIajeig6kUsfCMS/26GEDT2oggwiQdgrriOwOeaR3Vv/tzOtcFrR4mnpdmMc8BwlI0Sml4qkthkZqZJ/PJfMBbf/GB8qzI/Bbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqt435X31z2ypx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:08:18 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wqt401T38z9sRr;
	Fri, 23 Aug 2024 10:08:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y017WjX17hHf; Fri, 23 Aug 2024 10:08:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wqt400jPfz9rvV;
	Fri, 23 Aug 2024 10:08:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 081C18B77D;
	Fri, 23 Aug 2024 10:08:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Efcx2knKi_jw; Fri, 23 Aug 2024 10:08:15 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 670E68B763;
	Fri, 23 Aug 2024 10:08:15 +0200 (CEST)
Message-ID: <f8fb1500-1228-4a95-a31a-7259fe39c179@csgroup.eu>
Date: Fri, 23 Aug 2024 10:08:14 +0200
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
Subject: Re: [PATCH v2 13/36] soc: fsl: cpm1: tsa: Introduce tsa_version
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-14-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-14-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> Current code handles CPM1 version of TSA.
> 
> In order to prepare the support for the QUICC Engine (QE) version of
> TSA, introduce tsa_version to identify versions. This will enable the
> code to make the distinction between several TSA implementations.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>


> ---
>   drivers/soc/fsl/qe/tsa.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
> index 48a176cece86..297721a0d2b6 100644
> --- a/drivers/soc/fsl/qe/tsa.c
> +++ b/drivers/soc/fsl/qe/tsa.c
> @@ -114,12 +114,17 @@ struct tsa_tdm {
>   #define TSA_TDMA	0
>   #define TSA_TDMB	1
>   
> +enum tsa_version {
> +	TSA_CPM1 = 1, /* Avoid 0 value */
> +};
> +
>   struct tsa {
>   	struct device *dev;
>   	void __iomem *si_regs;
>   	void __iomem *si_ram;
>   	resource_size_t si_ram_sz;
>   	spinlock_t	lock; /* Lock for read/modify/write sequence */
> +	enum tsa_version version;
>   	int tdms; /* TSA_TDMx ORed */
>   	struct tsa_tdm tdm[2]; /* TDMa and TDMb */
>   	struct tsa_serial {
> @@ -685,6 +690,15 @@ static int tsa_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	tsa->dev = &pdev->dev;
> +	tsa->version = (enum tsa_version)(uintptr_t)of_device_get_match_data(&pdev->dev);
> +	switch (tsa->version) {
> +	case TSA_CPM1:
> +		dev_info(tsa->dev, "CPM1 version\n");
> +		break;
> +	default:
> +		dev_err(tsa->dev, "Unknown version (%d)\n", tsa->version);
> +		return -EINVAL;
> +	}
>   
>   	for (i = 0; i < ARRAY_SIZE(tsa->serials); i++)
>   		tsa->serials[i].id = i;
> @@ -746,7 +760,7 @@ static void tsa_remove(struct platform_device *pdev)
>   }
>   
>   static const struct of_device_id tsa_id_table[] = {
> -	{ .compatible = "fsl,cpm1-tsa" },
> +	{ .compatible = "fsl,cpm1-tsa", .data = (void *)TSA_CPM1 },
>   	{} /* sentinel */
>   };
>   MODULE_DEVICE_TABLE(of, tsa_id_table);

