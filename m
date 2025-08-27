Return-Path: <linuxppc-dev+bounces-11385-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FE0B38804
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 18:50:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBrBP08rGz300M;
	Thu, 28 Aug 2025 02:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756313436;
	cv=none; b=KMpYLD/s+hncjLdP11hG4ocqRycGYGL1PvGzaDFtgJ+Gc5X/kmLk6R/BWsyjJdoNO9TPNtiDuriFmD0QUy9SJBnLyDk/NWjCD7aspG7Ky1UR2kFwHmMEYjUZDx9cjLe+mSwbcLBJmIv/wWaxQy5abuEaiAXOqfSqXNMyYuashgGUYukEeg6uqd3DInF5y0n8E/DD9RxEiyJLUtQSLvmqXoiDqpHAuHwbBPHKR9BV9MKbQQJ6cH5dg6jR2VH/fc+mr57cv7GBzhQbG1fNC9QE6Gjjv17KdyI4ZvVvh+0qHHIJVtL60x57BlJ9NbCyNCQA6Scvl8YqnT/JyKf9nKYw4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756313436; c=relaxed/relaxed;
	bh=44zYgdI+XOjJ+SMIRxbWyLrA8InohW46NBXONOL/EWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VKosGU5bFzUgS8fLyTFjd3sCDv/bBm0iNZlhEmrU+hN9x7aCUz5fY4Pgj0FBMeaGcww0ASJjY/CxLsiwl+/IUYCS+IuoGuZ4Uo/Xy3v5fXKbV67usnLza4Ohd5J8Wd2wmWli0JRaZPtgLM+OwyZWpNUnBjxfnial1l41UwgzIyHXUUdZi9RFqBmfRRAaWUk0QV78IltfLlqS6Wa/zcEOmPhMAQ8XoX63L9VpTwKHTDsb2gEy/Y8ZLuW4RGv4FGzoVKwe/YE7vRIpx+utC43pUg4XbxuvRMk076foqqAxP4TZFURCeIP7Gnep3cmTRwdRAACA7T9Iw+Kbr3HaJLkbJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBrBN1PXrz2ySY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 02:50:34 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cBr1R461Fz9sS7;
	Wed, 27 Aug 2025 18:42:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EfL2OmdZ6UBM; Wed, 27 Aug 2025 18:42:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cBr1R2vdFz9sRy;
	Wed, 27 Aug 2025 18:42:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4CF088B764;
	Wed, 27 Aug 2025 18:42:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id wOAkvJCsR2Ku; Wed, 27 Aug 2025 18:42:51 +0200 (CEST)
Received: from [192.168.202.221] (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E5CDE8B763;
	Wed, 27 Aug 2025 18:42:50 +0200 (CEST)
Message-ID: <732ae03a-f0a7-450c-8896-e8a4975a5254@csgroup.eu>
Date: Wed, 27 Aug 2025 18:42:50 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/powernv: Rename pe_level_printk to pe_printk and
 embed KERN_LEVEL in format
To: Joe Perches <joe@perches.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
References: <df3a7ca31d2002ca447ab062f5b5e32ced9bec85.camel@perches.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <df3a7ca31d2002ca447ab062f5b5e32ced9bec85.camel@perches.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Joe

Le 21/06/2019 à 07:36, Joe Perches a écrit :
> Remove the separate KERN_<LEVEL> from each pe_level_printk and
> instead add the KERN_<LEVEL> to the format.
> 
> pfix in pe_level_printk could also be used uninitialized so
> add a new else and set pfx to the hex value of pe->flags.
> 
> Rename pe_level_printk to pe_printk and update the pe_<level>
> macros.
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>   arch/powerpc/platforms/powernv/pci-ioda.c | 14 ++++++++++++--
>   arch/powerpc/platforms/powernv/pci.h      | 11 +++++------
>   2 files changed, 17 insertions(+), 8 deletions(-)

I can't see the added value of this patch, it adds more lines than it 
removes.

Christophe

> 
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index 10cc42b9e541..60fc36ae626a 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -50,15 +50,23 @@
>   static const char * const pnv_phb_names[] = { "IODA1", "IODA2", "NPU_NVLINK",
>   					      "NPU_OCAPI" };
>   
> -void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
> -			    const char *fmt, ...)
> +void pe_printk(const struct pnv_ioda_pe *pe, const char *fmt, ...)
>   {
>   	struct va_format vaf;
>   	va_list args;
>   	char pfix[32];
> +	char level[PRINTK_MAX_SINGLE_HEADER_LEN + 1] = "\0";
>   
>   	va_start(args, fmt);
>   
> +	while (printk_get_level(fmt)) {
> +		size_t size = printk_skip_level(fmt) - fmt;
> +
> +		memcpy(level, fmt,  size);
> +		level[size] = '\0';
> +		fmt += size;
> +	}
> +
>   	vaf.fmt = fmt;
>   	vaf.va = &args;
>   
> @@ -74,6 +82,8 @@ void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
>   			(pe->rid & 0xff00) >> 8,
>   			PCI_SLOT(pe->rid), PCI_FUNC(pe->rid));
>   #endif /* CONFIG_PCI_IOV*/
> +	else
> +		sprintf(pfix, "(flags: 0x%lx)", pe->flags);
>   
>   	printk("%spci %s: [PE# %.2x] %pV",
>   	       level, pfix, pe->pe_number, &vaf);
> diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
> index be26ab3d99e0..870b21f55b3f 100644
> --- a/arch/powerpc/platforms/powernv/pci.h
> +++ b/arch/powerpc/platforms/powernv/pci.h
> @@ -205,15 +205,14 @@ extern unsigned long pnv_pci_ioda2_get_table_size(__u32 page_shift,
>   		__u64 window_size, __u32 levels);
>   extern int pnv_eeh_post_init(void);
>   
> -__printf(3, 4)
> -extern void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
> -			    const char *fmt, ...);
> +__printf(2, 3)
> +extern void pe_printk(const struct pnv_ioda_pe *pe, const char *fmt, ...);
>   #define pe_err(pe, fmt, ...)					\
> -	pe_level_printk(pe, KERN_ERR, fmt, ##__VA_ARGS__)
> +	pe_printk(pe, KERN_ERR fmt, ##__VA_ARGS__)
>   #define pe_warn(pe, fmt, ...)					\
> -	pe_level_printk(pe, KERN_WARNING, fmt, ##__VA_ARGS__)
> +	pe_printk(pe, KERN_WARNING fmt, ##__VA_ARGS__)
>   #define pe_info(pe, fmt, ...)					\
> -	pe_level_printk(pe, KERN_INFO, fmt, ##__VA_ARGS__)
> +	pe_printk(pe, KERN_INFO fmt, ##__VA_ARGS__)
>   
>   /* Nvlink functions */
>   extern void pnv_npu_try_dma_set_bypass(struct pci_dev *gpdev, bool bypass);


