Return-Path: <linuxppc-dev+bounces-421-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EE195C75B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:06:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqt255SZpz2ymb;
	Fri, 23 Aug 2024 18:06:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400397;
	cv=none; b=ELa0aamoWsstN8BybZC7fZB2rA6POOjwXKbHXeIFiQY5OkN56yb3SW59gGONvpIwRmH0TljekQg1Vcxi0wZ3fT/DewAD3ZIHPVbJwHdsSDH7vnyIAAdEZ98KXWOeQ7Bwk4+RguOEDnvwufr5tI5HHFTJ+WGevyp8jdW1+Y60h9iG11IQSJ6C2YgBm7DocoLEkwiacpvdTbgMCVev7aOYU8JLEj5QBLOgb0glIwZAHsKy5NaQTtmmCG0PQJCl+QgPkbk9YoGVCSQu5ZpPUXOoFhRML3Quv9WHJ2Uz4GbJyOc8j6Sa3KsJx9NW1DKyZYsHdaPU1Dkj21j4rbiC1fzQbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400397; c=relaxed/relaxed;
	bh=1W+JkIX38IreGwJ0yumHXkbT6pxKsQ2G2hS13RbSyfE=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=MZdUZIyM9/obxrNH6XoiDv0VYma2blDGYqPajcq0joukNeCd97q8nT4qiLOQ3Wns2As20QY2UoJqF5HNYuq5KZrWf91H8dCrD6eNMy7XIeziRjOyD2fNWkvNpt1d/Tx2/zBjfPNqat2HLJn18gzSalsviOAwqG8Eo4yZ1A96ylTTnPQmX5pl70wMijVpsKeA4HkYpfh7mec4u+Jq2ZeNOC3rUcYnoeufPd2io+3Bbu2m06oJgO4MzXIxpN3SOFAhJq746Kc44M+oKvZSIoIs10unBQQJ6faOEe3RgF/6MF4GZYJkB6Z09yUvEwqF80hq+ffcBNgh7JYf/fsyh8YuPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqt253Jsyz2ymH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:06:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wqt221BVPz9sRr;
	Fri, 23 Aug 2024 10:06:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZvIZ5efkLFBQ; Fri, 23 Aug 2024 10:06:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wqt216wzfz9rvV;
	Fri, 23 Aug 2024 10:06:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DAA5A8B77D;
	Fri, 23 Aug 2024 10:06:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id xZhIZzVRdc2Y; Fri, 23 Aug 2024 10:06:33 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2AB638B763;
	Fri, 23 Aug 2024 10:06:33 +0200 (CEST)
Message-ID: <98269f9e-e96e-49f0-9063-f957e963baa5@csgroup.eu>
Date: Fri, 23 Aug 2024 10:06:32 +0200
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
Subject: Re: [PATCH v2 10/36] soc: fsl: cpm1: tsa: Make SIRAM entries specific
 to CPM1
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-11-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-11-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> Current code handles the CPM1 version of TSA. Compared against QUICC
> Engine (QE) version of TSA, CPM1 SIRAM entries are slightly different.
> 
> In order to prepare the support for the QE version, clearly identify
> these entries and functions handling them as CPM1 compatible.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>


> ---
>   drivers/soc/fsl/qe/tsa.c | 75 ++++++++++++++++++++++++----------------
>   1 file changed, 46 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
> index 3d0c31a62dbb..bf7354ebaca4 100644
> --- a/drivers/soc/fsl/qe/tsa.c
> +++ b/drivers/soc/fsl/qe/tsa.c
> @@ -18,18 +18,18 @@
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
>   
> -/* TSA SI RAM routing tables entry */
> -#define TSA_SIRAM_ENTRY_LAST		BIT(16)
> -#define TSA_SIRAM_ENTRY_BYTE		BIT(17)
> -#define TSA_SIRAM_ENTRY_CNT_MASK	GENMASK(21, 18)
> -#define TSA_SIRAM_ENTRY_CNT(x)		FIELD_PREP(TSA_SIRAM_ENTRY_CNT_MASK, x)
> -#define TSA_SIRAM_ENTRY_CSEL_MASK	GENMASK(24, 22)
> -#define TSA_SIRAM_ENTRY_CSEL_NU		FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x0)
> -#define TSA_SIRAM_ENTRY_CSEL_SCC2	FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x2)
> -#define TSA_SIRAM_ENTRY_CSEL_SCC3	FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x3)
> -#define TSA_SIRAM_ENTRY_CSEL_SCC4	FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x4)
> -#define TSA_SIRAM_ENTRY_CSEL_SMC1	FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x5)
> -#define TSA_SIRAM_ENTRY_CSEL_SMC2	FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x6)
> +/* TSA SI RAM routing tables entry (CPM1) */
> +#define TSA_CPM1_SIRAM_ENTRY_LAST	BIT(16)
> +#define TSA_CPM1_SIRAM_ENTRY_BYTE	BIT(17)
> +#define TSA_CPM1_SIRAM_ENTRY_CNT_MASK	GENMASK(21, 18)
> +#define TSA_CPM1_SIRAM_ENTRY_CNT(x)	FIELD_PREP(TSA_CPM1_SIRAM_ENTRY_CNT_MASK, x)
> +#define TSA_CPM1_SIRAM_ENTRY_CSEL_MASK	GENMASK(24, 22)
> +#define TSA_CPM1_SIRAM_ENTRY_CSEL_NU	FIELD_PREP_CONST(TSA_CPM1_SIRAM_ENTRY_CSEL_MASK, 0x0)
> +#define TSA_CPM1_SIRAM_ENTRY_CSEL_SCC2	FIELD_PREP_CONST(TSA_CPM1_SIRAM_ENTRY_CSEL_MASK, 0x2)
> +#define TSA_CPM1_SIRAM_ENTRY_CSEL_SCC3	FIELD_PREP_CONST(TSA_CPM1_SIRAM_ENTRY_CSEL_MASK, 0x3)
> +#define TSA_CPM1_SIRAM_ENTRY_CSEL_SCC4	FIELD_PREP_CONST(TSA_CPM1_SIRAM_ENTRY_CSEL_MASK, 0x4)
> +#define TSA_CPM1_SIRAM_ENTRY_CSEL_SMC1	FIELD_PREP_CONST(TSA_CPM1_SIRAM_ENTRY_CSEL_MASK, 0x5)
> +#define TSA_CPM1_SIRAM_ENTRY_CSEL_SMC2	FIELD_PREP_CONST(TSA_CPM1_SIRAM_ENTRY_CSEL_MASK, 0x6)
>   
>   /* SI mode register (32 bits) */
>   #define TSA_SIMODE	0x00
> @@ -228,8 +228,8 @@ int tsa_serial_get_info(struct tsa_serial *tsa_serial, struct tsa_serial_info *i
>   }
>   EXPORT_SYMBOL(tsa_serial_get_info);
>   
> -static void tsa_init_entries_area(struct tsa *tsa, struct tsa_entries_area *area,
> -				  u32 tdms, u32 tdm_id, bool is_rx)
> +static void tsa_cpm1_init_entries_area(struct tsa *tsa, struct tsa_entries_area *area,
> +				       u32 tdms, u32 tdm_id, bool is_rx)
>   {
>   	resource_size_t quarter;
>   	resource_size_t half;
> @@ -280,7 +280,13 @@ static void tsa_init_entries_area(struct tsa *tsa, struct tsa_entries_area *area
>   	}
>   }
>   
> -static const char *tsa_serial_id2name(struct tsa *tsa, u32 serial_id)
> +static void tsa_init_entries_area(struct tsa *tsa, struct tsa_entries_area *area,
> +				  u32 tdms, u32 tdm_id, bool is_rx)
> +{
> +	tsa_cpm1_init_entries_area(tsa, area, tdms, tdm_id, is_rx);
> +}
> +
> +static const char *tsa_cpm1_serial_id2name(struct tsa *tsa, u32 serial_id)
>   {
>   	switch (serial_id) {
>   	case FSL_CPM_TSA_NU:	return "Not used";
> @@ -295,22 +301,27 @@ static const char *tsa_serial_id2name(struct tsa *tsa, u32 serial_id)
>   	return NULL;
>   }
>   
> -static u32 tsa_serial_id2csel(struct tsa *tsa, u32 serial_id)
> +static const char *tsa_serial_id2name(struct tsa *tsa, u32 serial_id)
> +{
> +	return tsa_cpm1_serial_id2name(tsa, serial_id);
> +}
> +
> +static u32 tsa_cpm1_serial_id2csel(struct tsa *tsa, u32 serial_id)
>   {
>   	switch (serial_id) {
> -	case FSL_CPM_TSA_SCC2:	return TSA_SIRAM_ENTRY_CSEL_SCC2;
> -	case FSL_CPM_TSA_SCC3:	return TSA_SIRAM_ENTRY_CSEL_SCC3;
> -	case FSL_CPM_TSA_SCC4:	return TSA_SIRAM_ENTRY_CSEL_SCC4;
> -	case FSL_CPM_TSA_SMC1:	return TSA_SIRAM_ENTRY_CSEL_SMC1;
> -	case FSL_CPM_TSA_SMC2:	return TSA_SIRAM_ENTRY_CSEL_SMC2;
> +	case FSL_CPM_TSA_SCC2:	return TSA_CPM1_SIRAM_ENTRY_CSEL_SCC2;
> +	case FSL_CPM_TSA_SCC3:	return TSA_CPM1_SIRAM_ENTRY_CSEL_SCC3;
> +	case FSL_CPM_TSA_SCC4:	return TSA_CPM1_SIRAM_ENTRY_CSEL_SCC4;
> +	case FSL_CPM_TSA_SMC1:	return TSA_CPM1_SIRAM_ENTRY_CSEL_SMC1;
> +	case FSL_CPM_TSA_SMC2:	return TSA_CPM1_SIRAM_ENTRY_CSEL_SMC2;
>   	default:
>   		break;
>   	}
> -	return TSA_SIRAM_ENTRY_CSEL_NU;
> +	return TSA_CPM1_SIRAM_ENTRY_CSEL_NU;
>   }
>   
> -static int tsa_add_entry(struct tsa *tsa, struct tsa_entries_area *area,
> -			 u32 count, u32 serial_id)
> +static int tsa_cpm1_add_entry(struct tsa *tsa, struct tsa_entries_area *area,
> +			      u32 count, u32 serial_id)
>   {
>   	void __iomem *addr;
>   	u32 left;
> @@ -328,21 +339,21 @@ static int tsa_add_entry(struct tsa *tsa, struct tsa_entries_area *area,
>   
>   	if (area->last_entry) {
>   		/* Clear last flag */
> -		tsa_clrbits32(area->last_entry, TSA_SIRAM_ENTRY_LAST);
> +		tsa_clrbits32(area->last_entry, TSA_CPM1_SIRAM_ENTRY_LAST);
>   	}
>   
>   	left = count;
>   	while (left) {
> -		val = TSA_SIRAM_ENTRY_BYTE | tsa_serial_id2csel(tsa, serial_id);
> +		val = TSA_CPM1_SIRAM_ENTRY_BYTE | tsa_cpm1_serial_id2csel(tsa, serial_id);
>   
>   		if (left > 16) {
>   			cnt = 16;
>   		} else {
>   			cnt = left;
> -			val |= TSA_SIRAM_ENTRY_LAST;
> +			val |= TSA_CPM1_SIRAM_ENTRY_LAST;
>   			area->last_entry = addr;
>   		}
> -		val |= TSA_SIRAM_ENTRY_CNT(cnt - 1);
> +		val |= TSA_CPM1_SIRAM_ENTRY_CNT(cnt - 1);
>   
>   		tsa_write32(addr, val);
>   		addr += 4;
> @@ -352,6 +363,12 @@ static int tsa_add_entry(struct tsa *tsa, struct tsa_entries_area *area,
>   	return 0;
>   }
>   
> +static int tsa_add_entry(struct tsa *tsa, struct tsa_entries_area *area,
> +			 u32 count, u32 serial_id)
> +{
> +	return tsa_cpm1_add_entry(tsa, area, count, serial_id);
> +}
> +
>   static int tsa_of_parse_tdm_route(struct tsa *tsa, struct device_node *tdm_np,
>   				  u32 tdms, u32 tdm_id, bool is_rx)
>   {
> @@ -636,7 +653,7 @@ static void tsa_init_si_ram(struct tsa *tsa)
>   
>   	/* Fill all entries as the last one */
>   	for (i = 0; i < tsa->si_ram_sz; i += 4)
> -		tsa_write32(tsa->si_ram + i, TSA_SIRAM_ENTRY_LAST);
> +		tsa_write32(tsa->si_ram + i, TSA_CPM1_SIRAM_ENTRY_LAST);
>   }
>   
>   static int tsa_probe(struct platform_device *pdev)

