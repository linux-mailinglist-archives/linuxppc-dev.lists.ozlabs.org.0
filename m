Return-Path: <linuxppc-dev+bounces-422-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A97F95C75F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:07:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqt2g12Ggz2ymc;
	Fri, 23 Aug 2024 18:07:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400427;
	cv=none; b=k0+RS5XdSfJclW/TUCheCAQAkQT0BCidz3+yj8jrYUkbBXxy/D9NBPHtGZLCnFDsujrgzATmdkeM+gV8dGaMEso5n2rFcw8bV4upNoxCst1VCdnJ2Q/92q6LCK+TttrEraRLIQDtN1WzUrdn2gA0gRhEmvJXUzYfKMxJfFD7J2Sl5wVlDvWUXcoANmXjjqv/DCndI57dzTykwXTeK88VBL6dDMiFEytolYzaGoSYyBvVkSCVXo7TyP7qGX73I99/WB117h73Rcmj2vfrgCG1/PYmV0wK1Km/TtFUQCglItpOF4JfgLTFdjbkNKgaKhReMPG3ln9fo/WityRgAL+P8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400427; c=relaxed/relaxed;
	bh=2jmsQf0Z63940tFWr3hnzCy3w6b19iwArVuDmjT7j2U=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=jIuP5i7UumW10ztk7rlUQ2jeD32MyiLc3e4AQXnVJ2P1COJLG1GFhm7IZQkHBmEfKS/tIcfCbkQ5KUKWzo7MvsdluXlm4rBfuSBx0b1+T4xWsYlDeEX+6gcQYzBTc77yGYVZGgKdudH4PhZEHvUMEtLVQthrTZvTgsNCqY1u/tba4H1IWyiQ2AAbtUwn8kDs/pdnqVDQt8sApWkUvgAS3vFguG4RSiRzb3CZkdX3e0V0W+Hvk4RS0bz4FtYag4OxoyIf9JDG8ix0k9kESmHbnjmMMswXrR0tLD6bKVf1hfz1QuhT9R3xfao3BDZDD+t7EojSPvebOB+kib+OIRJE7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqt2f5xwWz2ymH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:07:06 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wqt2b5rL8z9sSK;
	Fri, 23 Aug 2024 10:07:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qDA-1aHvJd3r; Fri, 23 Aug 2024 10:07:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wqt2M3DSvz9sRs;
	Fri, 23 Aug 2024 10:06:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 407C28B780;
	Fri, 23 Aug 2024 10:06:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 4ynYaQNVgcoa; Fri, 23 Aug 2024 10:06:51 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7C6158B763;
	Fri, 23 Aug 2024 10:06:50 +0200 (CEST)
Message-ID: <280789e0-a018-432f-b208-e907add713ae@csgroup.eu>
Date: Fri, 23 Aug 2024 10:06:49 +0200
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
Subject: Re: [PATCH v2 11/36] soc: fsl: cpm1: tsa: Introduce tsa_setup() and
 its CPM1 compatible version
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-12-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-12-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> Current code handles the CPM1 version of TSA. Setting up TSA consists in
> handling SIMODE and SIGMR registers. These registers are CPM1 specific.
> 
> Setting up the QUICC Engine (QE) version of TSA is slightly different.
> 
> In order to prepare the support for QE version, clearly identify these
> registers as CPM1 compatible and isolate their handling in a CPM1
> specific function.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>


> ---
>   drivers/soc/fsl/qe/tsa.c | 93 +++++++++++++++++++++++-----------------
>   1 file changed, 54 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
> index bf7354ebaca4..239b71187e07 100644
> --- a/drivers/soc/fsl/qe/tsa.c
> +++ b/drivers/soc/fsl/qe/tsa.c
> @@ -32,14 +32,14 @@
>   #define TSA_CPM1_SIRAM_ENTRY_CSEL_SMC2	FIELD_PREP_CONST(TSA_CPM1_SIRAM_ENTRY_CSEL_MASK, 0x6)
>   
>   /* SI mode register (32 bits) */
> -#define TSA_SIMODE	0x00
> -#define   TSA_SIMODE_SMC2			BIT(31)
> -#define   TSA_SIMODE_SMC1			BIT(15)
> -#define   TSA_SIMODE_TDMA_MASK			GENMASK(11, 0)
> -#define   TSA_SIMODE_TDMA(x)			FIELD_PREP(TSA_SIMODE_TDMA_MASK, x)
> -#define   TSA_SIMODE_TDMB_MASK			GENMASK(27, 16)
> -#define   TSA_SIMODE_TDMB(x)			FIELD_PREP(TSA_SIMODE_TDMB_MASK, x)
> -#define     TSA_SIMODE_TDM_MASK			GENMASK(11, 0)
> +#define TSA_CPM1_SIMODE		0x00
> +#define   TSA_CPM1_SIMODE_SMC2			BIT(31)
> +#define   TSA_CPM1_SIMODE_SMC1			BIT(15)
> +#define   TSA_CPM1_SIMODE_TDMA_MASK		GENMASK(11, 0)
> +#define   TSA_CPM1_SIMODE_TDMA(x)		FIELD_PREP(TSA_CPM1_SIMODE_TDMA_MASK, x)
> +#define   TSA_CPM1_SIMODE_TDMB_MASK		GENMASK(27, 16)
> +#define   TSA_CPM1_SIMODE_TDMB(x)		FIELD_PREP(TSA_CPM1_SIMODE_TDMB_MASK, x)
> +#define     TSA_CPM1_SIMODE_TDM_MASK		GENMASK(11, 0)
>   #define     TSA_SIMODE_TDM_SDM_MASK		GENMASK(11, 10)
>   #define       TSA_SIMODE_TDM_SDM_NORM		FIELD_PREP_CONST(TSA_SIMODE_TDM_SDM_MASK, 0x0)
>   #define       TSA_SIMODE_TDM_SDM_ECHO		FIELD_PREP_CONST(TSA_SIMODE_TDM_SDM_MASK, 0x1)
> @@ -49,22 +49,22 @@
>   #define     TSA_SIMODE_TDM_RFSD(x)		FIELD_PREP(TSA_SIMODE_TDM_RFSD_MASK, x)
>   #define     TSA_SIMODE_TDM_DSC			BIT(7)
>   #define     TSA_SIMODE_TDM_CRT			BIT(6)
> -#define     TSA_SIMODE_TDM_STZ			BIT(5)
> +#define     TSA_CPM1_SIMODE_TDM_STZ		BIT(5)
>   #define     TSA_SIMODE_TDM_CE			BIT(4)
>   #define     TSA_SIMODE_TDM_FE			BIT(3)
>   #define     TSA_SIMODE_TDM_GM			BIT(2)
>   #define     TSA_SIMODE_TDM_TFSD_MASK		GENMASK(1, 0)
>   #define     TSA_SIMODE_TDM_TFSD(x)		FIELD_PREP(TSA_SIMODE_TDM_TFSD_MASK, x)
>   
> -/* SI global mode register (8 bits) */
> -#define TSA_SIGMR	0x04
> -#define TSA_SIGMR_ENB			BIT(3)
> -#define TSA_SIGMR_ENA			BIT(2)
> -#define TSA_SIGMR_RDM_MASK		GENMASK(1, 0)
> -#define   TSA_SIGMR_RDM_STATIC_TDMA	FIELD_PREP_CONST(TSA_SIGMR_RDM_MASK, 0x0)
> -#define   TSA_SIGMR_RDM_DYN_TDMA	FIELD_PREP_CONST(TSA_SIGMR_RDM_MASK, 0x1)
> -#define   TSA_SIGMR_RDM_STATIC_TDMAB	FIELD_PREP_CONST(TSA_SIGMR_RDM_MASK, 0x2)
> -#define   TSA_SIGMR_RDM_DYN_TDMAB	FIELD_PREP_CONST(TSA_SIGMR_RDM_MASK, 0x3)
> +/* CPM SI global mode register (8 bits) */
> +#define TSA_CPM1_SIGMR	0x04
> +#define TSA_CPM1_SIGMR_ENB			BIT(3)
> +#define TSA_CPM1_SIGMR_ENA			BIT(2)
> +#define TSA_CPM1_SIGMR_RDM_MASK			GENMASK(1, 0)
> +#define   TSA_CPM1_SIGMR_RDM_STATIC_TDMA	FIELD_PREP_CONST(TSA_CPM1_SIGMR_RDM_MASK, 0x0)
> +#define   TSA_CPM1_SIGMR_RDM_DYN_TDMA		FIELD_PREP_CONST(TSA_CPM1_SIGMR_RDM_MASK, 0x1)
> +#define   TSA_CPM1_SIGMR_RDM_STATIC_TDMAB	FIELD_PREP_CONST(TSA_CPM1_SIGMR_RDM_MASK, 0x2)
> +#define   TSA_CPM1_SIGMR_RDM_DYN_TDMAB		FIELD_PREP_CONST(TSA_CPM1_SIGMR_RDM_MASK, 0x3)
>   
>   /* SI clock route register (32 bits) */
>   #define TSA_SICR	0x0C
> @@ -656,13 +656,45 @@ static void tsa_init_si_ram(struct tsa *tsa)
>   		tsa_write32(tsa->si_ram + i, TSA_CPM1_SIRAM_ENTRY_LAST);
>   }
>   
> +static int tsa_cpm1_setup(struct tsa *tsa)
> +{
> +	u32 val;
> +
> +	/* Set SIMODE */
> +	val = 0;
> +	if (tsa->tdm[0].is_enable)
> +		val |= TSA_CPM1_SIMODE_TDMA(tsa->tdm[0].simode_tdm);
> +	if (tsa->tdm[1].is_enable)
> +		val |= TSA_CPM1_SIMODE_TDMB(tsa->tdm[1].simode_tdm);
> +
> +	tsa_clrsetbits32(tsa->si_regs + TSA_CPM1_SIMODE,
> +			 TSA_CPM1_SIMODE_TDMA(TSA_CPM1_SIMODE_TDM_MASK) |
> +			 TSA_CPM1_SIMODE_TDMB(TSA_CPM1_SIMODE_TDM_MASK),
> +			 val);
> +
> +	/* Set SIGMR */
> +	val = (tsa->tdms == BIT(TSA_TDMA)) ?
> +		TSA_CPM1_SIGMR_RDM_STATIC_TDMA : TSA_CPM1_SIGMR_RDM_STATIC_TDMAB;
> +	if (tsa->tdms & BIT(TSA_TDMA))
> +		val |= TSA_CPM1_SIGMR_ENA;
> +	if (tsa->tdms & BIT(TSA_TDMB))
> +		val |= TSA_CPM1_SIGMR_ENB;
> +	tsa_write8(tsa->si_regs + TSA_CPM1_SIGMR, val);
> +
> +	return 0;
> +}
> +
> +static int tsa_setup(struct tsa *tsa)
> +{
> +	return tsa_cpm1_setup(tsa);
> +}
> +
>   static int tsa_probe(struct platform_device *pdev)
>   {
>   	struct device_node *np = pdev->dev.of_node;
>   	struct resource *res;
>   	struct tsa *tsa;
>   	unsigned int i;
> -	u32 val;
>   	int ret;
>   
>   	tsa = devm_kzalloc(&pdev->dev, sizeof(*tsa), GFP_KERNEL);
> @@ -696,26 +728,9 @@ static int tsa_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> -	/* Set SIMODE */
> -	val = 0;
> -	if (tsa->tdm[0].is_enable)
> -		val |= TSA_SIMODE_TDMA(tsa->tdm[0].simode_tdm);
> -	if (tsa->tdm[1].is_enable)
> -		val |= TSA_SIMODE_TDMB(tsa->tdm[1].simode_tdm);
> -
> -	tsa_clrsetbits32(tsa->si_regs + TSA_SIMODE,
> -			 TSA_SIMODE_TDMA(TSA_SIMODE_TDM_MASK) |
> -			 TSA_SIMODE_TDMB(TSA_SIMODE_TDM_MASK),
> -			 val);
> -
> -	/* Set SIGMR */
> -	val = (tsa->tdms == BIT(TSA_TDMA)) ?
> -		TSA_SIGMR_RDM_STATIC_TDMA : TSA_SIGMR_RDM_STATIC_TDMAB;
> -	if (tsa->tdms & BIT(TSA_TDMA))
> -		val |= TSA_SIGMR_ENA;
> -	if (tsa->tdms & BIT(TSA_TDMB))
> -		val |= TSA_SIGMR_ENB;
> -	tsa_write8(tsa->si_regs + TSA_SIGMR, val);
> +	ret = tsa_setup(tsa);
> +	if (ret)
> +		return ret;
>   
>   	platform_set_drvdata(pdev, tsa);
>   

