Return-Path: <linuxppc-dev+bounces-416-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5515A95C744
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:04:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqszv1s0sz2ynr;
	Fri, 23 Aug 2024 18:04:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400283;
	cv=none; b=AP+bv12OcSEw89SyWoRARU4QUhKE40zGkfN9gBMMxW6sNak17+9mZQ60gtCf9jfVZ/eVUFRPA9aEqo7IvRGpeImLsZUv3UgV4uG7hu7287bJ0E8bwSdp1eb0gFBRFsDHFKkEsrZlGTcEVTMfonJP9LxotsDeJT/nAlQc6L1TKOVLf/gjOp15wHQbGPrRJ4u7ijfTGzOEMRd2J35DtPXy8E+Y9ost4izpkeA4o2irtrBu7/dA3t9bs/Jq8UNg4aXw5oRbv33BDA28Vw/VXvzYXF9X45Rk+Kc7fFa2nJmnIeggcQmXGO49XT5aJxkTHOA1hFTcJhouSUpbGwz7cF1X6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400283; c=relaxed/relaxed;
	bh=Z1ybr0xQcVeTte20aeztYxf8a6GpT0jVCOMHqFe+B1E=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=UaMz/jOyjGdrMRiz1T7cH9zxHj5jgX2SRoRHuVc+r66rFFC61kQvoP49Qk89pKoHD2z/9yAnl/VAHMZ0GtVrOw5XAcX5pRZBh0civmHrPL0SxtYlwUuaTrOKw92MDzs5CU4Vdv5TXEza48fQAaS21PfaOyjxmoDM6+ceu9ZlomQBG047WLn9C7l3LwiWkDbVTvdJiyVdQsuY+SWztpDb2r68mkyXu6D3fVc/h5snVqY0IS9/xVS9D34U5iePkW37ZWBuK1w1+fUftLHhga9F0Rvjr3Bkp0pq9iZK9P/lNW9FK/SkxsgJyVxu9FHaZLCxjrEbPdu7zT9XW39kcnVFzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqszt5jb2z2yZc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:04:42 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wqszq1dSPz9sRr;
	Fri, 23 Aug 2024 10:04:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OkfwdsMvzURi; Fri, 23 Aug 2024 10:04:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wqszq0jT4z9rvV;
	Fri, 23 Aug 2024 10:04:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 060808B77D;
	Fri, 23 Aug 2024 10:04:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id jp5RpotxuUr2; Fri, 23 Aug 2024 10:04:38 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 72AB68B763;
	Fri, 23 Aug 2024 10:04:38 +0200 (CEST)
Message-ID: <1cf6e8ea-ded8-4cf7-b134-d54e1eedd559@csgroup.eu>
Date: Fri, 23 Aug 2024 10:04:37 +0200
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
Subject: Re: [PATCH v2 05/36] soc: fsl: cpm1: tsa: Fix blank line and spaces
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-6-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-6-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:10, Herve Codina a écrit :
> checkpatch.pl raises the following issues
>    CHECK: Please don't use multiple blank lines
>    CHECK: spaces preferred around that '/' (ctx:VxV)
>    CHECK: spaces preferred around that '+' (ctx:VxV)
>    CHECK: spaces preferred around that '-' (ctx:VxV)
> 
> Fix them.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>


> ---
>   drivers/soc/fsl/qe/tsa.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
> index dc4dda17dab8..7b1032fb1572 100644
> --- a/drivers/soc/fsl/qe/tsa.c
> +++ b/drivers/soc/fsl/qe/tsa.c
> @@ -18,7 +18,6 @@
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
>   
> -
>   /* TSA SI RAM routing tables entry */
>   #define TSA_SIRAM_ENTRY_LAST		BIT(16)
>   #define TSA_SIRAM_ENTRY_BYTE		BIT(17)
> @@ -244,8 +243,8 @@ static void tsa_init_entries_area(struct tsa *tsa, struct tsa_entries_area *area
>   	resource_size_t quarter;
>   	resource_size_t half;
>   
> -	quarter = tsa->si_ram_sz/4;
> -	half = tsa->si_ram_sz/2;
> +	quarter = tsa->si_ram_sz / 4;
> +	half = tsa->si_ram_sz / 2;
>   
>   	if (tdms == BIT(TSA_TDMA)) {
>   		/* Only TDMA */
> @@ -408,7 +407,7 @@ static int tsa_of_parse_tdm_route(struct tsa *tsa, struct device_node *tdm_np,
>   		}
>   
>   		dev_dbg(tsa->dev, "tdm_id=%u, %s ts %u..%u -> %s\n",
> -			tdm_id, route_name, ts, ts+count-1, serial_name);
> +			tdm_id, route_name, ts, ts + count - 1, serial_name);
>   		ts += count;
>   
>   		ret = tsa_add_entry(tsa, &area, count, serial_id);

