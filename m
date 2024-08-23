Return-Path: <linuxppc-dev+bounces-415-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDC495C741
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:04:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqszd19p3z2ykx;
	Fri, 23 Aug 2024 18:04:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400269;
	cv=none; b=dvIZm/pwQGDr5rGr7hkAepYl62iKyIVA4s0dVgK2Vxut5ctZLFxhe0adBG/rHIeeOAoWBKj/C2P/OA/wu7j9AVDtKgO0skv/NYe9Yu7m+svm3Xf1B+/pWhQlaqA6b/t81DXbeMgnFejZaKt3s9MyEaiSZQXvMcD3C40H3CGzY8dqreDICBOWYXuzjU/xd/xL5rDow2kfdg9X0bi0L/I9pbzU4ERdGO+F5OI1//Z9FKzEgwY03LersVB2SoimmdSkzw7NxSPObnCtUjhRfnPYdoGggYwf+kOlNBBMPp4mH0NBF4pbSjBGQB8Y5rcWlg/F588I5D3x/PXNe8UI3HhuUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400269; c=relaxed/relaxed;
	bh=CaeJrHRDg8QCxb6RFq+/J/ZlLcLOsqLcTOpVLi/Tq4k=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=ncmB3+5aSda8fhFkiMovfOr5IiffXIb1RPr7X76wsZSkolCcqOphdgdegTgLVXbaVnzO4hADHxuobqVoMQu7aw5aF4EsZDUDavIn+CEb8/wJn1zLLW9wkHNoGykzw/cQLawqoOXP5EYwk+yKGUOMxCNRTom1RdKkEgoEu2SxqzO5VAj3ImQA+2B4NyPCOwI8W202Gx/1KhRgDseXeNa2WmpqYTIPhfW96yPuTpmNjBLSbkaS4Ek2D3Pga2sVac7a+FdzvZe77QLpcRGOSHeWwMUTjmHR2O6tOvSeDwcwNrMmSrjF1y0XVtvwvlMHtLRQVVv4dMSSsZ8CfwiF7R7JAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqszc62Kdz2yZc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:04:28 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WqszY4JfCz9sRs;
	Fri, 23 Aug 2024 10:04:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3zrPJ87emAfh; Fri, 23 Aug 2024 10:04:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WqszY3Gq6z9rvV;
	Fri, 23 Aug 2024 10:04:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 603308B77D;
	Fri, 23 Aug 2024 10:04:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 4GTKz6YQ0Ixj; Fri, 23 Aug 2024 10:04:25 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A5AB08B763;
	Fri, 23 Aug 2024 10:04:24 +0200 (CEST)
Message-ID: <b044e3a1-7ec5-4f3e-942e-59bbde37776b@csgroup.eu>
Date: Fri, 23 Aug 2024 10:04:23 +0200
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
Subject: Re: [PATCH v2 04/36] soc: fsl: cpm1: tsa: Use BIT(), GENMASK() and
 FIELD_PREP() macros
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-5-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-5-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:10, Herve Codina a écrit :
> checkpatch.pl signals the following improvement for tsa.c
>    CHECK: Prefer using the BIT macro
> 
> Follow its suggestion and convert the code to BIT() and related macros.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/soc/fsl/qe/tsa.c | 127 +++++++++++++++++++++------------------
>   1 file changed, 68 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
> index 53968ea84c88..dc4dda17dab8 100644
> --- a/drivers/soc/fsl/qe/tsa.c
> +++ b/drivers/soc/fsl/qe/tsa.c
> @@ -9,6 +9,7 @@
>   
>   #include "tsa.h"
>   #include <dt-bindings/soc/cpm1-fsl,tsa.h>
> +#include <linux/bitfield.h>
>   #include <linux/clk.h>
>   #include <linux/io.h>
>   #include <linux/module.h>
> @@ -19,47 +20,52 @@
>   
>   
>   /* TSA SI RAM routing tables entry */
> -#define TSA_SIRAM_ENTRY_LAST		(1 << 16)
> -#define TSA_SIRAM_ENTRY_BYTE		(1 << 17)
> -#define TSA_SIRAM_ENTRY_CNT(x)		(((x) & 0x0f) << 18)
> -#define TSA_SIRAM_ENTRY_CSEL_MASK	(0x7 << 22)
> -#define TSA_SIRAM_ENTRY_CSEL_NU		(0x0 << 22)
> -#define TSA_SIRAM_ENTRY_CSEL_SCC2	(0x2 << 22)
> -#define TSA_SIRAM_ENTRY_CSEL_SCC3	(0x3 << 22)
> -#define TSA_SIRAM_ENTRY_CSEL_SCC4	(0x4 << 22)
> -#define TSA_SIRAM_ENTRY_CSEL_SMC1	(0x5 << 22)
> -#define TSA_SIRAM_ENTRY_CSEL_SMC2	(0x6 << 22)
> +#define TSA_SIRAM_ENTRY_LAST		BIT(16)
> +#define TSA_SIRAM_ENTRY_BYTE		BIT(17)
> +#define TSA_SIRAM_ENTRY_CNT_MASK	GENMASK(21, 18)
> +#define TSA_SIRAM_ENTRY_CNT(x)		FIELD_PREP(TSA_SIRAM_ENTRY_CNT_MASK, x)
> +#define TSA_SIRAM_ENTRY_CSEL_MASK	GENMASK(24, 22)
> +#define TSA_SIRAM_ENTRY_CSEL_NU		FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x0)
> +#define TSA_SIRAM_ENTRY_CSEL_SCC2	FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x2)
> +#define TSA_SIRAM_ENTRY_CSEL_SCC3	FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x3)
> +#define TSA_SIRAM_ENTRY_CSEL_SCC4	FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x4)
> +#define TSA_SIRAM_ENTRY_CSEL_SMC1	FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x5)
> +#define TSA_SIRAM_ENTRY_CSEL_SMC2	FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x6)
>   
>   /* SI mode register (32 bits) */
>   #define TSA_SIMODE	0x00
> -#define   TSA_SIMODE_SMC2			0x80000000
> -#define   TSA_SIMODE_SMC1			0x00008000
> -#define   TSA_SIMODE_TDMA(x)			((x) << 0)
> -#define   TSA_SIMODE_TDMB(x)			((x) << 16)
> -#define     TSA_SIMODE_TDM_MASK			0x0fff
> -#define     TSA_SIMODE_TDM_SDM_MASK		0x0c00
> -#define       TSA_SIMODE_TDM_SDM_NORM		0x0000
> -#define       TSA_SIMODE_TDM_SDM_ECHO		0x0400
> -#define       TSA_SIMODE_TDM_SDM_INTL_LOOP	0x0800
> -#define       TSA_SIMODE_TDM_SDM_LOOP_CTRL	0x0c00
> -#define     TSA_SIMODE_TDM_RFSD(x)		((x) << 8)
> -#define     TSA_SIMODE_TDM_DSC			0x0080
> -#define     TSA_SIMODE_TDM_CRT			0x0040
> -#define     TSA_SIMODE_TDM_STZ			0x0020
> -#define     TSA_SIMODE_TDM_CE			0x0010
> -#define     TSA_SIMODE_TDM_FE			0x0008
> -#define     TSA_SIMODE_TDM_GM			0x0004
> -#define     TSA_SIMODE_TDM_TFSD(x)		((x) << 0)
> +#define   TSA_SIMODE_SMC2			BIT(31)
> +#define   TSA_SIMODE_SMC1			BIT(15)
> +#define   TSA_SIMODE_TDMA_MASK			GENMASK(11, 0)
> +#define   TSA_SIMODE_TDMA(x)			FIELD_PREP(TSA_SIMODE_TDMA_MASK, x)
> +#define   TSA_SIMODE_TDMB_MASK			GENMASK(27, 16)
> +#define   TSA_SIMODE_TDMB(x)			FIELD_PREP(TSA_SIMODE_TDMB_MASK, x)
> +#define     TSA_SIMODE_TDM_MASK			GENMASK(11, 0)
> +#define     TSA_SIMODE_TDM_SDM_MASK		GENMASK(11, 10)
> +#define       TSA_SIMODE_TDM_SDM_NORM		FIELD_PREP_CONST(TSA_SIMODE_TDM_SDM_MASK, 0x0)
> +#define       TSA_SIMODE_TDM_SDM_ECHO		FIELD_PREP_CONST(TSA_SIMODE_TDM_SDM_MASK, 0x1)
> +#define       TSA_SIMODE_TDM_SDM_INTL_LOOP	FIELD_PREP_CONST(TSA_SIMODE_TDM_SDM_MASK, 0x2)
> +#define       TSA_SIMODE_TDM_SDM_LOOP_CTRL	FIELD_PREP_CONST(TSA_SIMODE_TDM_SDM_MASK, 0x3)
> +#define     TSA_SIMODE_TDM_RFSD_MASK		GENMASK(9, 8)
> +#define     TSA_SIMODE_TDM_RFSD(x)		FIELD_PREP(TSA_SIMODE_TDM_RFSD_MASK, x)
> +#define     TSA_SIMODE_TDM_DSC			BIT(7)
> +#define     TSA_SIMODE_TDM_CRT			BIT(6)
> +#define     TSA_SIMODE_TDM_STZ			BIT(5)
> +#define     TSA_SIMODE_TDM_CE			BIT(4)
> +#define     TSA_SIMODE_TDM_FE			BIT(3)
> +#define     TSA_SIMODE_TDM_GM			BIT(2)
> +#define     TSA_SIMODE_TDM_TFSD_MASK		GENMASK(1, 0)
> +#define     TSA_SIMODE_TDM_TFSD(x)		FIELD_PREP(TSA_SIMODE_TDM_TFSD_MASK, x)
>   
>   /* SI global mode register (8 bits) */
>   #define TSA_SIGMR	0x04
> -#define TSA_SIGMR_ENB			(1<<3)
> -#define TSA_SIGMR_ENA			(1<<2)
> -#define TSA_SIGMR_RDM_MASK		0x03
> -#define   TSA_SIGMR_RDM_STATIC_TDMA	0x00
> -#define   TSA_SIGMR_RDM_DYN_TDMA	0x01
> -#define   TSA_SIGMR_RDM_STATIC_TDMAB	0x02
> -#define   TSA_SIGMR_RDM_DYN_TDMAB	0x03
> +#define TSA_SIGMR_ENB			BIT(3)
> +#define TSA_SIGMR_ENA			BIT(2)
> +#define TSA_SIGMR_RDM_MASK		GENMASK(1, 0)
> +#define   TSA_SIGMR_RDM_STATIC_TDMA	FIELD_PREP_CONST(TSA_SIGMR_RDM_MASK, 0x0)
> +#define   TSA_SIGMR_RDM_DYN_TDMA	FIELD_PREP_CONST(TSA_SIGMR_RDM_MASK, 0x1)
> +#define   TSA_SIGMR_RDM_STATIC_TDMAB	FIELD_PREP_CONST(TSA_SIGMR_RDM_MASK, 0x2)
> +#define   TSA_SIGMR_RDM_DYN_TDMAB	FIELD_PREP_CONST(TSA_SIGMR_RDM_MASK, 0x3)
>   
>   /* SI status register (8 bits) */
>   #define TSA_SISTR	0x06
> @@ -69,30 +75,33 @@
>   
>   /* SI clock route register (32 bits) */
>   #define TSA_SICR	0x0C
> -#define   TSA_SICR_SCC2(x)		((x) << 8)
> -#define   TSA_SICR_SCC3(x)		((x) << 16)
> -#define   TSA_SICR_SCC4(x)		((x) << 24)
> -#define     TSA_SICR_SCC_MASK		0x0ff
> -#define     TSA_SICR_SCC_GRX		(1 << 7)
> -#define     TSA_SICR_SCC_SCX_TSA	(1 << 6)
> -#define     TSA_SICR_SCC_RXCS_MASK	(0x7 << 3)
> -#define       TSA_SICR_SCC_RXCS_BRG1	(0x0 << 3)
> -#define       TSA_SICR_SCC_RXCS_BRG2	(0x1 << 3)
> -#define       TSA_SICR_SCC_RXCS_BRG3	(0x2 << 3)
> -#define       TSA_SICR_SCC_RXCS_BRG4	(0x3 << 3)
> -#define       TSA_SICR_SCC_RXCS_CLK15	(0x4 << 3)
> -#define       TSA_SICR_SCC_RXCS_CLK26	(0x5 << 3)
> -#define       TSA_SICR_SCC_RXCS_CLK37	(0x6 << 3)
> -#define       TSA_SICR_SCC_RXCS_CLK48	(0x7 << 3)
> -#define     TSA_SICR_SCC_TXCS_MASK	(0x7 << 0)
> -#define       TSA_SICR_SCC_TXCS_BRG1	(0x0 << 0)
> -#define       TSA_SICR_SCC_TXCS_BRG2	(0x1 << 0)
> -#define       TSA_SICR_SCC_TXCS_BRG3	(0x2 << 0)
> -#define       TSA_SICR_SCC_TXCS_BRG4	(0x3 << 0)
> -#define       TSA_SICR_SCC_TXCS_CLK15	(0x4 << 0)
> -#define       TSA_SICR_SCC_TXCS_CLK26	(0x5 << 0)
> -#define       TSA_SICR_SCC_TXCS_CLK37	(0x6 << 0)
> -#define       TSA_SICR_SCC_TXCS_CLK48	(0x7 << 0)
> +#define   TSA_SICR_SCC2_MASK		GENMASK(15, 8)
> +#define   TSA_SICR_SCC2(x)		FIELD_PREP(TSA_SICR_SCC2_MASK, x)
> +#define   TSA_SICR_SCC3_MASK		GENMASK(23, 16)
> +#define   TSA_SICR_SCC3(x)		FIELD_PREP(TSA_SICR_SCC3_MASK, x)
> +#define   TSA_SICR_SCC4_MASK		GENMASK(31, 24)
> +#define   TSA_SICR_SCC4(x)		FIELD_PREP(TSA_SICR_SCC4_MASK, x)
> +#define     TSA_SICR_SCC_MASK		GENMASK(7, 0)
> +#define     TSA_SICR_SCC_GRX		BIT(7)
> +#define     TSA_SICR_SCC_SCX_TSA	BIT(6)
> +#define     TSA_SICR_SCC_RXCS_MASK	GENMASK(5, 3)
> +#define       TSA_SICR_SCC_RXCS_BRG1	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x0)
> +#define       TSA_SICR_SCC_RXCS_BRG2	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x1)
> +#define       TSA_SICR_SCC_RXCS_BRG3	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x2)
> +#define       TSA_SICR_SCC_RXCS_BRG4	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x3)
> +#define       TSA_SICR_SCC_RXCS_CLK15	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x4)
> +#define       TSA_SICR_SCC_RXCS_CLK26	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x5)
> +#define       TSA_SICR_SCC_RXCS_CLK37	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x6)
> +#define       TSA_SICR_SCC_RXCS_CLK48	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x7)
> +#define     TSA_SICR_SCC_TXCS_MASK	GENMASK(2, 0)
> +#define       TSA_SICR_SCC_TXCS_BRG1	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x0)
> +#define       TSA_SICR_SCC_TXCS_BRG2	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x1)
> +#define       TSA_SICR_SCC_TXCS_BRG3	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x2)
> +#define       TSA_SICR_SCC_TXCS_BRG4	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x3)
> +#define       TSA_SICR_SCC_TXCS_CLK15	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x4)
> +#define       TSA_SICR_SCC_TXCS_CLK26	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x5)
> +#define       TSA_SICR_SCC_TXCS_CLK37	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x6)
> +#define       TSA_SICR_SCC_TXCS_CLK48	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x7)
>   
>   /* Serial interface RAM pointer register (32 bits) */
>   #define TSA_SIRP	0x10

