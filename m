Return-Path: <linuxppc-dev+bounces-444-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4310395C7B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:14:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqtBh1phWz3064;
	Fri, 23 Aug 2024 18:14:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400844;
	cv=none; b=YwLTkmvBdcfRciaExRK1BSwzx7Og3artu8fWHSuGy2AdjrEo0irLmgSkKgY09m8Z6B0Zx1BmtMyl8xGexmkEcNIn5TBFXO7jOl+kVHhmYBurw0MiaVd8ONBMpmbWsUm/lgtEKFAwCwjSFN8cPk57iPee5tOkbj/5oiRsPBXuudGoYP5nMaEq+7XRXCMENf+aJHaKdd//v5XLqfujP+a1EQB6llfKR9OfURivWZ7JF6u/ufbBJzaEDpNSdEmvy/cZE4sKCIwRs5qhMkdZMbgcl3TJ4z1SJI8osYC4UpyKu8t65D8PUP9H2Gr1HCa/mIP0Wt0/GtbLTnPxXpHqH4jFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400844; c=relaxed/relaxed;
	bh=k2d2yA45+DAzQ6ThL93JvA8HEbwfUtVYQkgKul8z96I=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=HBkGxRGdB/B6SfNB44+66/vwfSfoDnX7s529Q/AgpYnCrHBzKdeICdq6NZxf67RwAZLTnjLlIojqrgposTU6GEb2bkdGZ44DLTaxzzAIRU4oQdnpt0QyrVu4LN+qHDOg7I5szbPlUSnOVZrIAR434E4DLtcLO5P8FazGhxm3QUg49oLRHY94XLndHBLReyJiiaR+UqLbAXiovbdr7e1ne+ULZOIQmgd9Dhbk46QpLwd/O0FIgJw5J8ZVKAmdyoko/IgJZAysEJspsFL5/Zh8+vM7rgyHJcoUV9+l1tv3h8vquj9t+525iLIDpjHfhSgQfSL5GCaS25HOcLr2PfBmOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqtBg6nQKz2ywq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:14:03 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WqtBc70zdz9sRr;
	Fri, 23 Aug 2024 10:14:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pWQFd58JEw5k; Fri, 23 Aug 2024 10:14:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WqtBc5jqZz9rvV;
	Fri, 23 Aug 2024 10:14:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B4B008B77D;
	Fri, 23 Aug 2024 10:14:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id izVYcECcDezM; Fri, 23 Aug 2024 10:14:00 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1D23A8B763;
	Fri, 23 Aug 2024 10:14:00 +0200 (CEST)
Message-ID: <d307f378-d025-496b-91b7-2082441813b7@csgroup.eu>
Date: Fri, 23 Aug 2024 10:13:59 +0200
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
Subject: Re: [PATCH v2 32/36] soc: fsl: qe: Add resource-managed muram
 allocators
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-33-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-33-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> Introduce devm_cpm_muram_alloc() and devm_cpm_muram_alloc_fixed(), the
> resource-managed version of cpm_muram_alloc and cpm_muram_alloc_fixed().
> 
> These resource-managed versions simplify the user avoiding the need to
> call cpm_muram_free(). Indeed, the allocated area returned by these
> functions will be automatically freed on driver detach.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/soc/fsl/qe/qe_common.c | 80 ++++++++++++++++++++++++++++++++++
>   include/soc/fsl/qe/qe.h        | 22 +++++++++-
>   2 files changed, 101 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/fsl/qe/qe_common.c b/drivers/soc/fsl/qe/qe_common.c
> index a877347d37d3..02c29f5f86d3 100644
> --- a/drivers/soc/fsl/qe/qe_common.c
> +++ b/drivers/soc/fsl/qe/qe_common.c
> @@ -13,6 +13,7 @@
>    * 2006 (c) MontaVista Software, Inc.
>    * Vitaly Bordug <vbordug@ru.mvista.com>
>    */
> +#include <linux/device.h>
>   #include <linux/genalloc.h>
>   #include <linux/init.h>
>   #include <linux/list.h>
> @@ -187,6 +188,49 @@ void cpm_muram_free(s32 offset)
>   }
>   EXPORT_SYMBOL(cpm_muram_free);
>   
> +static void devm_cpm_muram_release(struct device *dev, void *res)
> +{
> +	s32 *info = res;
> +
> +	cpm_muram_free(*info);
> +}
> +
> +/**
> + * devm_cpm_muram_alloc - Resource-managed cpm_muram_alloc
> + * @dev: Device to allocate memory for
> + * @size: number of bytes to allocate
> + * @align: requested alignment, in bytes
> + *
> + * This function returns a non-negative offset into the muram area, or
> + * a negative errno on failure as cpm_muram_alloc() does.
> + * Use cpm_muram_addr() to get the virtual address of the area.
> + *
> + * Compare against cpm_muram_alloc(), the memory allocated by this
> + * resource-managed version is automatically freed on driver detach and so,
> + * cpm_muram_free() must not be called to release the allocated memory.
> + */
> +s32 devm_cpm_muram_alloc(struct device *dev, unsigned long size,
> +			 unsigned long align)
> +{
> +	s32 info;
> +	s32 *dr;
> +
> +	dr = devres_alloc(devm_cpm_muram_release, sizeof(*dr), GFP_KERNEL);
> +	if (!dr)
> +		return -ENOMEM;
> +
> +	info = cpm_muram_alloc(size, align);
> +	if (info >= 0) {
> +		*dr = info;
> +		devres_add(dev, dr);
> +	} else {
> +		devres_free(dr);
> +	}
> +
> +	return info;
> +}
> +EXPORT_SYMBOL(devm_cpm_muram_alloc);
> +
>   /*
>    * cpm_muram_alloc_fixed - reserve a specific region of multi-user ram
>    * @offset: offset of allocation start address
> @@ -211,6 +255,42 @@ s32 cpm_muram_alloc_fixed(unsigned long offset, unsigned long size)
>   }
>   EXPORT_SYMBOL(cpm_muram_alloc_fixed);
>   
> +/**
> + * devm_cpm_muram_alloc_fixed - Resource-managed cpm_muram_alloc_fixed
> + * @dev: Device to allocate memory for
> + * @offset: offset of allocation start address
> + * @size: number of bytes to allocate
> + *
> + * This function returns a non-negative offset into the muram area, or
> + * a negative errno on failure as cpm_muram_alloc_fixed() does.
> + * Use cpm_muram_addr() to get the virtual address of the area.
> + *
> + * Compare against cpm_muram_alloc_fixed(), the memory allocated by this
> + * resource-managed version is automatically freed on driver detach and so,
> + * cpm_muram_free() must not be called to release the allocated memory.
> + */
> +s32 devm_cpm_muram_alloc_fixed(struct device *dev, unsigned long offset,
> +			       unsigned long size)
> +{
> +	s32 info;
> +	s32 *dr;
> +
> +	dr = devres_alloc(devm_cpm_muram_release, sizeof(*dr), GFP_KERNEL);
> +	if (!dr)
> +		return -ENOMEM;
> +
> +	info = cpm_muram_alloc_fixed(offset, size);
> +	if (info >= 0) {
> +		*dr = info;
> +		devres_add(dev, dr);
> +	} else {
> +		devres_free(dr);
> +	}
> +
> +	return info;
> +}
> +EXPORT_SYMBOL(devm_cpm_muram_alloc_fixed);
> +
>   /**
>    * cpm_muram_addr - turn a muram offset into a virtual address
>    * @offset: muram offset to convert
> diff --git a/include/soc/fsl/qe/qe.h b/include/soc/fsl/qe/qe.h
> index af793f2a0ec4..629835b6c71d 100644
> --- a/include/soc/fsl/qe/qe.h
> +++ b/include/soc/fsl/qe/qe.h
> @@ -23,6 +23,8 @@
>   #include <linux/of_address.h>
>   #include <linux/types.h>
>   
> +struct device;
> +
>   #define QE_NUM_OF_SNUM	256	/* There are 256 serial number in QE */
>   #define QE_NUM_OF_BRGS	16
>   #define QE_NUM_OF_PORTS	1024
> @@ -93,8 +95,12 @@ int cpm_muram_init(void);
>   
>   #if defined(CONFIG_CPM) || defined(CONFIG_QUICC_ENGINE)
>   s32 cpm_muram_alloc(unsigned long size, unsigned long align);
> +s32 devm_cpm_muram_alloc(struct device *dev, unsigned long size,
> +			 unsigned long align);
>   void cpm_muram_free(s32 offset);
>   s32 cpm_muram_alloc_fixed(unsigned long offset, unsigned long size);
> +s32 devm_cpm_muram_alloc_fixed(struct device *dev, unsigned long offset,
> +			       unsigned long size);
>   void __iomem *cpm_muram_addr(unsigned long offset);
>   unsigned long cpm_muram_offset(const void __iomem *addr);
>   dma_addr_t cpm_muram_dma(void __iomem *addr);
> @@ -106,6 +112,12 @@ static inline s32 cpm_muram_alloc(unsigned long size,
>   	return -ENOSYS;
>   }
>   
> +static inline s32 devm_cpm_muram_alloc(struct device *dev, unsigned long size,
> +				       unsigned long align)
> +{
> +	return -ENOSYS;
> +}
> +
>   static inline void cpm_muram_free(s32 offset)
>   {
>   }
> @@ -116,6 +128,13 @@ static inline s32 cpm_muram_alloc_fixed(unsigned long offset,
>   	return -ENOSYS;
>   }
>   
> +static inline s32 devm_cpm_muram_alloc_fixed(struct device *dev,
> +					     unsigned long offset,
> +					     unsigned long size)
> +{
> +	return -ENOSYS;
> +}
> +
>   static inline void __iomem *cpm_muram_addr(unsigned long offset)
>   {
>   	return NULL;
> @@ -172,7 +191,6 @@ static inline int par_io_data_set(u8 port, u8 pin, u8 val) { return -ENOSYS; }
>   /*
>    * Pin multiplexing functions.
>    */
> -struct device;
>   struct qe_pin;
>   #ifdef CONFIG_QE_GPIO
>   extern struct qe_pin *qe_pin_request(struct device *dev, int index);
> @@ -233,7 +251,9 @@ static inline int qe_alive_during_sleep(void)
>   /* we actually use cpm_muram implementation, define this for convenience */
>   #define qe_muram_init cpm_muram_init
>   #define qe_muram_alloc cpm_muram_alloc
> +#define devm_qe_muram_alloc devm_cpm_muram_alloc
>   #define qe_muram_alloc_fixed cpm_muram_alloc_fixed
> +#define devm_qe_muram_alloc_fixed devm_cpm_muram_alloc_fixed
>   #define qe_muram_free cpm_muram_free
>   #define qe_muram_addr cpm_muram_addr
>   #define qe_muram_offset cpm_muram_offset

