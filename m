Return-Path: <linuxppc-dev+bounces-14379-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3F6C74DC3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Nov 2025 16:20:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dC29K1yrWz2yvG;
	Fri, 21 Nov 2025 02:20:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763652037;
	cv=none; b=gXQ7d4k2rGYFiJ6YEC/6JnVxz65He6R4rA18V5sYrpt7rnk39XDmfIgOYJE4aenhgnSQQrjBLoth1x7sscbNPs+OsTNf2vTiG+vtbnoDTaZEFyUNusetHJGSPz+2wqA6SABVXxsT6fnGxKumenEvqXGdp/3PxxH5/2bLdhcA3J0si2U4RZ2UUuoDqQtETqQe868Y5eMk+e/SHGdQjanUlbvEQOSXTcsC08rxcv3jdbZAnsQ8GgIHLYXmUS6BwPsJg4XsdZm1uxuOPg9P9Fl0ZosJvvHkSQ3fmGEyYMCgzrd0sWCllAro6b+n+6DdvZZay5caVBp8VyyCZWgPYtcYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763652037; c=relaxed/relaxed;
	bh=ltMNnnoLbIBaONUXM62SCPant18gR5NWq2+8GdD4m5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PCBtLKN6o/cLpRI+DcDO3d3ccdYiFOgm6mxeuNjonJU0xUN9mW8s6IJ+6W05MOGaW8+w4IUpbi4kcpic17khncKfKwET5hmxZl5IgGL6+oo0eXpWtdF23PdQm+FWHTfJL6wL9d4s/Ilk4PMXQuiBDdn4uMCMX8BSX9E7pofIFnW2lVA7kEhFhV/lpBlFjtFn7lfHpA4x9MoUqefN+2g0HwVgWovkMkRywZOpGTzVjOKZ6HvxMkqJdFfszrbyRp2ExBdLQ6T9d1AnPYXEC+6FGjNonA0104SLY3oiT3E6ooHMn/0TVvL972HWBr0UAWJ2oeNA2beApZ/JQClAt3ZIcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dC29J455Nz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 02:20:35 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4dC1wC33l0z9sVw;
	Thu, 20 Nov 2025 16:09:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WKkoXu0cgzSr; Thu, 20 Nov 2025 16:09:15 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4dC1wC2JMYz9sVt;
	Thu, 20 Nov 2025 16:09:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3BE568B76D;
	Thu, 20 Nov 2025 16:09:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 34nTduEHVfow; Thu, 20 Nov 2025 16:09:15 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A66368B763;
	Thu, 20 Nov 2025 16:09:14 +0100 (CET)
Message-ID: <0951c9b6-4252-46e5-a260-0e42365c5018@csgroup.eu>
Date: Thu, 20 Nov 2025 16:09:14 +0100
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
Subject: Re: [PATCH] powerpc/pseries/svm: Make mem_encrypt.h self contained
To: Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joerg.roedel@amd.com>,
 linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>,
 Kevin Tian <kevin.tian@intel.com>, kernel test robot <lkp@intel.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
 Vasant Hegde <vasant.hegde@amd.com>
References: <0-v1-672b61acd916+1449-ppc_mem_encrypt_jgg@nvidia.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <0-v1-672b61acd916+1449-ppc_mem_encrypt_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 20/11/2025 à 16:06, Jason Gunthorpe a écrit :
> Add the missing forward declarations and includes so it does not have
> implicit dependencies. mem_encrypt.h is a public header imported by
> drivers. Users should not have to guess what include files are needed.
> 
> Resolves a kbuild splat:
> 
>     In file included from drivers/iommu/generic_pt/fmt/iommu_amdv1.c:15:
>     In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:36:
>     In file included from drivers/iommu/generic_pt/fmt/amdv1.h:23:
>     In file included from include/linux/mem_encrypt.h:17:
>>> arch/powerpc/include/asm/mem_encrypt.h:13:49: warning: declaration of 'struct device' will not be visible outside of this function [-Wvisibility]
>        13 | static inline bool force_dma_unencrypted(struct device *dev)
> 
> Fixes: 879ced2bab1b ("iommupt: Add the AMD IOMMU v1 page table format")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202511161358.rS5pSb3U-lkp@intel.com/
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   arch/powerpc/include/asm/mem_encrypt.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> Joerg, can you pick this up too please?
> 
> diff --git a/arch/powerpc/include/asm/mem_encrypt.h b/arch/powerpc/include/asm/mem_encrypt.h
> index 2f26b8fc8d297c..e355ca46fad933 100644
> --- a/arch/powerpc/include/asm/mem_encrypt.h
> +++ b/arch/powerpc/include/asm/mem_encrypt.h
> @@ -9,6 +9,9 @@
>   #define _ASM_POWERPC_MEM_ENCRYPT_H
>   
>   #include <asm/svm.h>
> +#include <linux/types.h>

Why do you need linux/types.h ? Isn't the below forward declaration enough ?

> +
> +struct device;
>   
>   static inline bool force_dma_unencrypted(struct device *dev)
>   {
> 
> base-commit: 7e06063a43d317c1ca9278b6662555f687f43f03


