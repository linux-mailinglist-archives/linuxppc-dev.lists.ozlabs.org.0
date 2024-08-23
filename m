Return-Path: <linuxppc-dev+bounces-419-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D4D95C751
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:05:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqt143d2Fz2ysX;
	Fri, 23 Aug 2024 18:05:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400344;
	cv=none; b=nJf9baYlK+czz6mOzniA84dv1PP0JSdQWIp46gfJIBhuWUWbUFzXWCSBHQd2eJyjTL+pFhdITDq0OfPETOuKUGLGaGd0lMKekl99Klxa7j82YYMnin9OINVKnSd8op7v2WwOEc97/98S9Xmy3Vsd/7IOgTOsKC0g1REjryM5Qmz4fU6VWiodnFGeMClB652Fim2V0z7XbZiRO9/nc2Px/zcEXfo9EcFthFAzFIznZZsS4bfpTIwXMGdCZSl+Pg0u/pE/H2x2acSbj4LUxw7muweww04ZvIJdt2BF+HDNJicLbPfLj0qouncmI6QYNJvMJPh7dq+4LfFe7qU3Vtl3PA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400344; c=relaxed/relaxed;
	bh=4QinAgFyLEYx1RQx5yEmCCH0ovQlupqS4K5iO2mkMXU=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=jtuyIQ+fMeEl+ZrcYqZ+9RmfMxkXX44VTlDQrk+i14TP2pJ+1qVY4v1f2CJRFDmPydSgFhzIg33xdjxusM/P7a8UqktPja24cDBsoteqfRChLYzDOnQKdm7vMAQHmgulzGtqJSILd0XNqbsYjKVkuUmvrq9Ts02uiCTNYmsCbnbv0awTIY/npfxqCEgVsbNW34tHu6D0s/9CZQ+BrQZt++fqcYEcC7IOtt8UIVUSTNd99sk8LA/IufyDK3If9PGqvqSkYg0MLXCY8Yv99lvuvXMmfYQemZpgi/Hf4TobjnEBK+6Uvipd96Hp1dpcxO7Xa2ZmS8iswZpoU0LnJCp43w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqt141SPWz2yZc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:05:44 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wqt1101wjz9sRr;
	Fri, 23 Aug 2024 10:05:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RkHacFGZ_qoT; Fri, 23 Aug 2024 10:05:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wqt106KGfz9rvV;
	Fri, 23 Aug 2024 10:05:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C61178B77D;
	Fri, 23 Aug 2024 10:05:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 4Wd__B8FoQjt; Fri, 23 Aug 2024 10:05:40 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 436638B763;
	Fri, 23 Aug 2024 10:05:40 +0200 (CEST)
Message-ID: <787d893d-2898-49e2-b0dd-f23a1b7186fe@csgroup.eu>
Date: Fri, 23 Aug 2024 10:05:39 +0200
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
Subject: Re: [PATCH v2 08/36] soc: fsl: cpm1: tsa: Remove unused registers
 offset definition
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-9-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-9-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> SISTR, SICMR and SIRP registers offset definitions are not used.
> 
> In order to avoid unneeded code, remove them.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>


> ---
>   drivers/soc/fsl/qe/tsa.c | 9 ---------
>   1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
> index a9d35b44489d..244d521d8780 100644
> --- a/drivers/soc/fsl/qe/tsa.c
> +++ b/drivers/soc/fsl/qe/tsa.c
> @@ -66,12 +66,6 @@
>   #define   TSA_SIGMR_RDM_STATIC_TDMAB	FIELD_PREP_CONST(TSA_SIGMR_RDM_MASK, 0x2)
>   #define   TSA_SIGMR_RDM_DYN_TDMAB	FIELD_PREP_CONST(TSA_SIGMR_RDM_MASK, 0x3)
>   
> -/* SI status register (8 bits) */
> -#define TSA_SISTR	0x06
> -
> -/* SI command register (8 bits) */
> -#define TSA_SICMR	0x07
> -
>   /* SI clock route register (32 bits) */
>   #define TSA_SICR	0x0C
>   #define   TSA_SICR_SCC2_MASK		GENMASK(15, 8)
> @@ -102,9 +96,6 @@
>   #define       TSA_SICR_SCC_TXCS_CLK37	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x6)
>   #define       TSA_SICR_SCC_TXCS_CLK48	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x7)
>   
> -/* Serial interface RAM pointer register (32 bits) */
> -#define TSA_SIRP	0x10
> -
>   struct tsa_entries_area {
>   	void __iomem *entries_start;
>   	void __iomem *entries_next;

