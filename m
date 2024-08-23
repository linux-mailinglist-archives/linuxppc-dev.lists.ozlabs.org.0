Return-Path: <linuxppc-dev+bounces-417-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C04E95C747
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:05:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqt0Q0B6jz2ymt;
	Fri, 23 Aug 2024 18:05:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400310;
	cv=none; b=oVo5Q2pOGBzpAD1c3GLVYTdGDIewI6w814cwQfNgKgmLXnhcre8auj0RKb9gQi4aoOM+I7oPCvtxoOk5z+lgoroShF5Uj1p3B/7XdPGjfcSlXccNSiOBh0478RyK4HLDY1KahHSTxIciHVQLOtGfOvZmlN+AjxOOlSVuTQsFV9fg95hfI4VGTzzuzrI9dm1Vxqvr2ua1WpX3SWhD1ozaVqMSlGXzdGTPv1ZlIASPAsKXFXnTvk5LjWQyjDcY5X9ziI7mIKHSqXQ4GBSkgI9dJGqY2JzfQvdBg+kPpyeLBM28NjU+BWxeHdOkBnfxA7YnSlNePmEaHErMBWO4aU22og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400310; c=relaxed/relaxed;
	bh=b9NlY5QWQbzUYoxAkFOo74fGo75rcpjmgt3j9VOT4VQ=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=Hemn+3re4orqAQwGOGrP5w2tDAo2M2D0fGhZggYSgMbZR3SdEgoznfGET8Ch77RiuwmpOKstYDE17+J6N8Mb9wiVFTOBTLpk8GcHKL+wmhoUHWgaCP1j8SEe7VMuMK5NcJF0K41O9d52n47WZWwwnU+gQ4tm5J8SUSTfvG7vPlYiLxoqvtjS9DnuxJPi88QPcngDDzUIE+wy/e45Ac0EMEiv1qbNTaloeE9NRpuB1wF+ijZnulTugqE8l3MrHqZps3M1hPoWH2IQkdMUoFlP8DCbNJ+dn8YeLfSUGxVu+/ySOvyBmL6+c2y1S35tlgiE8peRDjqhZUPWGZVw4U9VUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqt0P55VMz2yZc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:05:09 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wqt0L4gxRz9sRr;
	Fri, 23 Aug 2024 10:05:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gCvNb3mogfdq; Fri, 23 Aug 2024 10:05:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wqt0L3v7sz9rvV;
	Fri, 23 Aug 2024 10:05:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6E9858B77D;
	Fri, 23 Aug 2024 10:05:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Wg2k2ytsMXth; Fri, 23 Aug 2024 10:05:06 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CC8368B763;
	Fri, 23 Aug 2024 10:05:05 +0200 (CEST)
Message-ID: <716df5e4-72b5-42c0-912d-ae31d687cfad@csgroup.eu>
Date: Fri, 23 Aug 2024 10:05:04 +0200
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
Subject: Re: [PATCH v2 06/36] soc: fsl: cpm1: tsa: Add missing spinlock
 comment
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-7-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-7-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:10, Herve Codina a écrit :
> checkpatch.pl raises the following issue
>    CHECK: spinlock_t definition without comment
> 
> Add the missing comment.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>


> ---
>   drivers/soc/fsl/qe/tsa.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
> index 7b1032fb1572..a9d35b44489d 100644
> --- a/drivers/soc/fsl/qe/tsa.c
> +++ b/drivers/soc/fsl/qe/tsa.c
> @@ -128,7 +128,7 @@ struct tsa {
>   	void __iomem *si_regs;
>   	void __iomem *si_ram;
>   	resource_size_t si_ram_sz;
> -	spinlock_t	lock;
> +	spinlock_t	lock; /* Lock for read/modify/write sequence */
>   	int tdms; /* TSA_TDMx ORed */
>   	struct tsa_tdm tdm[2]; /* TDMa and TDMb */
>   	struct tsa_serial {

