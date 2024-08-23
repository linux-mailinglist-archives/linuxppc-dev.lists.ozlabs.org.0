Return-Path: <linuxppc-dev+bounces-429-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5886C95C779
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:08:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqt4h2Qdlz2ysB;
	Fri, 23 Aug 2024 18:08:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400532;
	cv=none; b=hUAzHZToDFK6oQs4Ur2rrJ0u/9ULLyGwkWx52Ub0CRjSx9Q57CcEAtKylpZINFycqweF22a2fw1amivuB2wRDUmjbVkQYrNLl/0rsDz3rqI13r1oVA4o1LrFQWxbtAnh+j7c1DMVCGlt5eIfM0zzk7gpC/Y5JwY5hc734rueTeA73QTlwfNc1dszBiypbPU1p4JxIYCWFf5vb9KPNTKdYlj6kS61dDDfX3Upwq6ST7SrsgepujOaVdRnAynslYF5zoI0N7YhQKkhLxVmpNH3ST8Ow9G2BjCP6755/mYil0bYKXsxJ06kU9NdnduSorIona4UQqRHYx5OGB8cxNr3Og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400532; c=relaxed/relaxed;
	bh=W2esNlUu8HI3qRQnqN7cyFTnrt1OANEKeWc06M39wBA=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=iJfpckHtD37ABGqM802hBXILnv4HbKpPrmXOveBlHFQxMgPXBa+2EK2Faw4EfM2iKj7bdzZU1eSejm+mkGmGMch1H3qBtT09X9r2el8jc792hp7bwLtTtAawNA6FEE1aVqYDwmZXC7j1JPHssZhXF/AjJFTOFy94vtVBZG9188dGO8y8w0NTH9i+e0HNh0raceXtgCRoSEGRJuDZP7jJKy8ejHdej3H7bxorXQX8C3v3e2+JNKwaDUaxtB2ymU/Ty2tKKTHml9ftm3bXstc1JIfzof+l9cm6E5sww0piLtvj3/HnhKxCaQU4h/0227uDVuOPJkU0KTMt5Qi6diygYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqt4h0LC4z2ypx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:08:51 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wqt4d2Kqvz9sRr;
	Fri, 23 Aug 2024 10:08:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jDhdnb1gfOuw; Fri, 23 Aug 2024 10:08:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wqt4Z5bt6z9rvV;
	Fri, 23 Aug 2024 10:08:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AF48A8B77D;
	Fri, 23 Aug 2024 10:08:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id BmXs51ivFIxZ; Fri, 23 Aug 2024 10:08:46 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 294D08B763;
	Fri, 23 Aug 2024 10:08:46 +0200 (CEST)
Message-ID: <2d063529-3281-4dce-8dbc-21a07ab478fa@csgroup.eu>
Date: Fri, 23 Aug 2024 10:08:45 +0200
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
Subject: Re: [PATCH v2 15/36] MAINTAINERS: Add QE files related to the
 Freescale TSA controller
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-16-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-16-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> The Freescale TSA controller driver supports both QE and CPM1.
> 
> Add the newly introduced QE files to the existing entry.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 42decde38320..1d32d38f2247 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9011,9 +9011,11 @@ M:	Herve Codina <herve.codina@bootlin.com>
>   L:	linuxppc-dev@lists.ozlabs.org
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml
> +F:	Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-tsa.yaml
>   F:	drivers/soc/fsl/qe/tsa.c
>   F:	drivers/soc/fsl/qe/tsa.h
>   F:	include/dt-bindings/soc/cpm1-fsl,tsa.h
> +F:	include/dt-bindings/soc/qe-fsl,tsa.h
>   
>   FREESCALE QUICC ENGINE UCC ETHERNET DRIVER
>   L:	netdev@vger.kernel.org

