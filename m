Return-Path: <linuxppc-dev+bounces-426-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2E295C76D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:07:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqt3X4R1bz2yn2;
	Fri, 23 Aug 2024 18:07:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400472;
	cv=none; b=VBBzBl81lU/hkPJIFZ1+GdaT5EXEFFdag8FZZHSY3Bg5XMGx/bh2M+Y6IL3lnLXY9DZS+HNN5PKW56eFu1k83oaX6/aqUYqnax7HeZPqSKeRbY8V7hieYGw5FFfAv0Ke49aVv6JyABNpV3vIkNsgAHHwGnTHXBjEdUEOg0zT/mMIut3sbwWohoMhOvzbUAhQ8cQI+FIE9OPr/l/emvYmB1Rud+8+zKkLD+xWPoe/ZOy9uUAcXM9A2Qym9FDL6ORIjoN37ACSAEKgMEd4i5fy8B4+U28sgfgsGUSUtSKNSH/Ik/qNej/z5IfgYx90My7p8PqC4A0r/zSMzqbqYYczHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400472; c=relaxed/relaxed;
	bh=zd5FNI92gcUjaFFAOB5H48Z6bQfUyT90WqK8UA9Wnkw=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=ayeIQ0HSgugVeaUJU+KTPseUumU48vSxGx073kOYAxI9ze6mzNmwQV7rPtaWYAaT1cvUGpBAGUAkAh1dEjwTNGuNvEa0GWW89kH9lpGm8SBKgEt+DDX9wBM7UY2sj4NDx3MEInvjhTL8BxhNic5n1SLRHx63FMSYuxnPt1At0m5LKLxCL4jqHp5l69vKHI5RpYJ2SArfO9bXGx2TDtSREJg8KNGzb2unAqYfmodhxatb9PPMnyXLz9CNY4ZPx/uR3+YKNe6cvuRC/bE3gypv+cGi/ixU64cHU0wUcLCHUzZDqyz/7xO+T3tjDa/0HlTKr+TrsTPbXjMrqHqW2JmS3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqt3X2KQjz2yn1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:07:52 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wqt3T4gTgz9sRr;
	Fri, 23 Aug 2024 10:07:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oTUxj4K4c8gV; Fri, 23 Aug 2024 10:07:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wqt3T3cSYz9rvV;
	Fri, 23 Aug 2024 10:07:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 690958B77D;
	Fri, 23 Aug 2024 10:07:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id j6s4fVaZomEL; Fri, 23 Aug 2024 10:07:49 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C0FD48B763;
	Fri, 23 Aug 2024 10:07:48 +0200 (CEST)
Message-ID: <551f4c3d-a57f-47ea-a477-c502fbd61251@csgroup.eu>
Date: Fri, 23 Aug 2024 10:07:47 +0200
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
Subject: Re: [PATCH v2 12/36] soc: fsl: cpm1: tsa: Isolate specific CPM1 part
 from tsa_serial_{dis}connect()
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-13-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-13-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> Current code handles the CPM1 version of TSA. Connecting and
> disconnecting the SCC to/from the TSA consists in handling SICR register
> which is CPM1 specific. The connection and disconnection operation in
> the QUICC Engine (QE) version are slightly different.
> 
> In order to prepare the support for the QE version, clearly identify
> SICR register as specific to CPM1 and isolate its handling done in
> connect and disconnect functions.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>


> ---
>   drivers/soc/fsl/qe/tsa.c | 103 ++++++++++++++++-----------------------
>   1 file changed, 43 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
> index 239b71187e07..48a176cece86 100644
> --- a/drivers/soc/fsl/qe/tsa.c
> +++ b/drivers/soc/fsl/qe/tsa.c
> @@ -67,34 +67,34 @@
>   #define   TSA_CPM1_SIGMR_RDM_DYN_TDMAB		FIELD_PREP_CONST(TSA_CPM1_SIGMR_RDM_MASK, 0x3)
>   
>   /* SI clock route register (32 bits) */
> -#define TSA_SICR	0x0C
> -#define   TSA_SICR_SCC2_MASK		GENMASK(15, 8)
> -#define   TSA_SICR_SCC2(x)		FIELD_PREP(TSA_SICR_SCC2_MASK, x)
> -#define   TSA_SICR_SCC3_MASK		GENMASK(23, 16)
> -#define   TSA_SICR_SCC3(x)		FIELD_PREP(TSA_SICR_SCC3_MASK, x)
> -#define   TSA_SICR_SCC4_MASK		GENMASK(31, 24)
> -#define   TSA_SICR_SCC4(x)		FIELD_PREP(TSA_SICR_SCC4_MASK, x)
> -#define     TSA_SICR_SCC_MASK		GENMASK(7, 0)
> -#define     TSA_SICR_SCC_GRX		BIT(7)
> -#define     TSA_SICR_SCC_SCX_TSA	BIT(6)
> -#define     TSA_SICR_SCC_RXCS_MASK	GENMASK(5, 3)
> -#define       TSA_SICR_SCC_RXCS_BRG1	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x0)
> -#define       TSA_SICR_SCC_RXCS_BRG2	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x1)
> -#define       TSA_SICR_SCC_RXCS_BRG3	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x2)
> -#define       TSA_SICR_SCC_RXCS_BRG4	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x3)
> -#define       TSA_SICR_SCC_RXCS_CLK15	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x4)
> -#define       TSA_SICR_SCC_RXCS_CLK26	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x5)
> -#define       TSA_SICR_SCC_RXCS_CLK37	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x6)
> -#define       TSA_SICR_SCC_RXCS_CLK48	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x7)
> -#define     TSA_SICR_SCC_TXCS_MASK	GENMASK(2, 0)
> -#define       TSA_SICR_SCC_TXCS_BRG1	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x0)
> -#define       TSA_SICR_SCC_TXCS_BRG2	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x1)
> -#define       TSA_SICR_SCC_TXCS_BRG3	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x2)
> -#define       TSA_SICR_SCC_TXCS_BRG4	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x3)
> -#define       TSA_SICR_SCC_TXCS_CLK15	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x4)
> -#define       TSA_SICR_SCC_TXCS_CLK26	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x5)
> -#define       TSA_SICR_SCC_TXCS_CLK37	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x6)
> -#define       TSA_SICR_SCC_TXCS_CLK48	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x7)
> +#define TSA_CPM1_SICR	0x0C
> +#define   TSA_CPM1_SICR_SCC2_MASK		GENMASK(15, 8)
> +#define   TSA_CPM1_SICR_SCC2(x)			FIELD_PREP(TSA_CPM1_SICR_SCC2_MASK, x)
> +#define   TSA_CPM1_SICR_SCC3_MASK		GENMASK(23, 16)
> +#define   TSA_CPM1_SICR_SCC3(x)			FIELD_PREP(TSA_CPM1_SICR_SCC3_MASK, x)
> +#define   TSA_CPM1_SICR_SCC4_MASK		GENMASK(31, 24)
> +#define   TSA_CPM1_SICR_SCC4(x)			FIELD_PREP(TSA_CPM1_SICR_SCC4_MASK, x)
> +#define     TSA_CPM1_SICR_SCC_MASK		GENMASK(7, 0)
> +#define     TSA_CPM1_SICR_SCC_GRX		BIT(7)
> +#define     TSA_CPM1_SICR_SCC_SCX_TSA		BIT(6)
> +#define     TSA_CPM1_SICR_SCC_RXCS_MASK		GENMASK(5, 3)
> +#define       TSA_CPM1_SICR_SCC_RXCS_BRG1	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_RXCS_MASK, 0x0)
> +#define       TSA_CPM1_SICR_SCC_RXCS_BRG2	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_RXCS_MASK, 0x1)
> +#define       TSA_CPM1_SICR_SCC_RXCS_BRG3	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_RXCS_MASK, 0x2)
> +#define       TSA_CPM1_SICR_SCC_RXCS_BRG4	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_RXCS_MASK, 0x3)
> +#define       TSA_CPM1_SICR_SCC_RXCS_CLK15	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_RXCS_MASK, 0x4)
> +#define       TSA_CPM1_SICR_SCC_RXCS_CLK26	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_RXCS_MASK, 0x5)
> +#define       TSA_CPM1_SICR_SCC_RXCS_CLK37	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_RXCS_MASK, 0x6)
> +#define       TSA_CPM1_SICR_SCC_RXCS_CLK48	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_RXCS_MASK, 0x7)
> +#define     TSA_CPM1_SICR_SCC_TXCS_MASK		GENMASK(2, 0)
> +#define       TSA_CPM1_SICR_SCC_TXCS_BRG1	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_TXCS_MASK, 0x0)
> +#define       TSA_CPM1_SICR_SCC_TXCS_BRG2	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_TXCS_MASK, 0x1)
> +#define       TSA_CPM1_SICR_SCC_TXCS_BRG3	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_TXCS_MASK, 0x2)
> +#define       TSA_CPM1_SICR_SCC_TXCS_BRG4	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_TXCS_MASK, 0x3)
> +#define       TSA_CPM1_SICR_SCC_TXCS_CLK15	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_TXCS_MASK, 0x4)
> +#define       TSA_CPM1_SICR_SCC_TXCS_CLK26	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_TXCS_MASK, 0x5)
> +#define       TSA_CPM1_SICR_SCC_TXCS_CLK37	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_TXCS_MASK, 0x6)
> +#define       TSA_CPM1_SICR_SCC_TXCS_CLK48	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_TXCS_MASK, 0x7)
>   
>   struct tsa_entries_area {
>   	void __iomem *entries_start;
> @@ -159,7 +159,7 @@ static inline void tsa_clrsetbits32(void __iomem *addr, u32 clr, u32 set)
>   	tsa_write32(addr, (tsa_read32(addr) & ~clr) | set);
>   }
>   
> -int tsa_serial_connect(struct tsa_serial *tsa_serial)
> +static int tsa_cpm1_serial_connect(struct tsa_serial *tsa_serial, bool connect)
>   {
>   	struct tsa *tsa = tsa_serial_get_tsa(tsa_serial);
>   	unsigned long flags;
> @@ -168,16 +168,16 @@ int tsa_serial_connect(struct tsa_serial *tsa_serial)
>   
>   	switch (tsa_serial->id) {
>   	case FSL_CPM_TSA_SCC2:
> -		clear = TSA_SICR_SCC2(TSA_SICR_SCC_MASK);
> -		set = TSA_SICR_SCC2(TSA_SICR_SCC_SCX_TSA);
> +		clear = TSA_CPM1_SICR_SCC2(TSA_CPM1_SICR_SCC_MASK);
> +		set = TSA_CPM1_SICR_SCC2(TSA_CPM1_SICR_SCC_SCX_TSA);
>   		break;
>   	case FSL_CPM_TSA_SCC3:
> -		clear = TSA_SICR_SCC3(TSA_SICR_SCC_MASK);
> -		set = TSA_SICR_SCC3(TSA_SICR_SCC_SCX_TSA);
> +		clear = TSA_CPM1_SICR_SCC3(TSA_CPM1_SICR_SCC_MASK);
> +		set = TSA_CPM1_SICR_SCC3(TSA_CPM1_SICR_SCC_SCX_TSA);
>   		break;
>   	case FSL_CPM_TSA_SCC4:
> -		clear = TSA_SICR_SCC4(TSA_SICR_SCC_MASK);
> -		set = TSA_SICR_SCC4(TSA_SICR_SCC_SCX_TSA);
> +		clear = TSA_CPM1_SICR_SCC4(TSA_CPM1_SICR_SCC_MASK);
> +		set = TSA_CPM1_SICR_SCC4(TSA_CPM1_SICR_SCC_SCX_TSA);
>   		break;
>   	default:
>   		dev_err(tsa->dev, "Unsupported serial id %u\n", tsa_serial->id);
> @@ -185,39 +185,22 @@ int tsa_serial_connect(struct tsa_serial *tsa_serial)
>   	}
>   
>   	spin_lock_irqsave(&tsa->lock, flags);
> -	tsa_clrsetbits32(tsa->si_regs + TSA_SICR, clear, set);
> +	tsa_clrsetbits32(tsa->si_regs + TSA_CPM1_SICR, clear,
> +			 connect ? set : 0);
>   	spin_unlock_irqrestore(&tsa->lock, flags);
>   
>   	return 0;
>   }
> +
> +int tsa_serial_connect(struct tsa_serial *tsa_serial)
> +{
> +	return tsa_cpm1_serial_connect(tsa_serial, true);
> +}
>   EXPORT_SYMBOL(tsa_serial_connect);
>   
>   int tsa_serial_disconnect(struct tsa_serial *tsa_serial)
>   {
> -	struct tsa *tsa = tsa_serial_get_tsa(tsa_serial);
> -	unsigned long flags;
> -	u32 clear;
> -
> -	switch (tsa_serial->id) {
> -	case FSL_CPM_TSA_SCC2:
> -		clear = TSA_SICR_SCC2(TSA_SICR_SCC_MASK);
> -		break;
> -	case FSL_CPM_TSA_SCC3:
> -		clear = TSA_SICR_SCC3(TSA_SICR_SCC_MASK);
> -		break;
> -	case FSL_CPM_TSA_SCC4:
> -		clear = TSA_SICR_SCC4(TSA_SICR_SCC_MASK);
> -		break;
> -	default:
> -		dev_err(tsa->dev, "Unsupported serial id %u\n", tsa_serial->id);
> -		return -EINVAL;
> -	}
> -
> -	spin_lock_irqsave(&tsa->lock, flags);
> -	tsa_clrsetbits32(tsa->si_regs + TSA_SICR, clear, 0);
> -	spin_unlock_irqrestore(&tsa->lock, flags);
> -
> -	return 0;
> +	return tsa_cpm1_serial_connect(tsa_serial, false);
>   }
>   EXPORT_SYMBOL(tsa_serial_disconnect);
>   

