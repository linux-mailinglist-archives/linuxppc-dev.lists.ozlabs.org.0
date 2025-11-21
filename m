Return-Path: <linuxppc-dev+bounces-14408-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0B3C77C22
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 08:50:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCS7f6fgMz2yD5;
	Fri, 21 Nov 2025 18:50:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763711438;
	cv=none; b=Nt2pK6e/Dwv2JjV9Nivc8bDUv0LA7IBQL1OZp7nluwhYI/ZxClfXn4mFpD2aBHHVciX2SAO3BN/2g9WqYk9RjhxLMMGiBf1ftEnDiUMMAEQE5tiv5NGCd69XIaHW9yBtt3REat5vvj6/vK6tpBuMb6TYZ4TKgbocfWB/El7SE5xY/KAOx+8gKhs5T8f2VK/KjdGZjnNx5fdGEhtqnqL2x4/Q0FoeWOiuKIKneOtVw1aCl6Iy++auhOTLDsJ4tOgJW2DFKNU2lwkds3reJ/n0O5cCb6jdMNL0zTJisiybQL5Rw1Y5y2zqQO/g7WnauyAaRpYSfaGiASKV9ufCGIb0zw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763711438; c=relaxed/relaxed;
	bh=Y6fxn2Z07x3ipNc446S2W49MrJCJr8TQtEW+WY29Uac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBV4OXsX9laZb0tDRxSKrhCvTZp18AVJdZCNc/T923R+7Swj9gI2rLY+Dr1W6iKamJyI3AkE/nvRKV7fNJKfJc/A+XEor+H5EfPw0Ww6qNctbl4fNblVNXmQvyDlZo9sZqRyOGVBvIUMFS0FhmH6FPbiIJE55GoMTns6PGWAn2ScabKN3n/CIkYCNIfBeInA2gtIJrtEaN0Mf4ftFvsjsk02lhN/dUAdybxI9RVhyGEmYemAhYN5tYTeKc1YE1PIIkrnybtwZf16Emz6WHqYNARFGvza8+zfP3z+0T4FlcarBGww5cquoeZS1c/cjt4369b1SWnTMNzWZ3ovJxNSEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCS7c4klVz2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 18:50:35 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4dCRjQ02bPz9sTD;
	Fri, 21 Nov 2025 08:31:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K0Q8cCQU7afe; Fri, 21 Nov 2025 08:31:21 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4dCRjP6KhSz9sT8;
	Fri, 21 Nov 2025 08:31:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C1E158B76D;
	Fri, 21 Nov 2025 08:31:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id LTFf_Pnq6OKk; Fri, 21 Nov 2025 08:31:21 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E1458B763;
	Fri, 21 Nov 2025 08:31:21 +0100 (CET)
Message-ID: <93bd6b07-5088-4af2-89af-7f0ae726dcd2@csgroup.eu>
Date: Fri, 21 Nov 2025 08:31:20 +0100
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

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

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
> +
> +struct device;
>   
>   static inline bool force_dma_unencrypted(struct device *dev)
>   {
> 
> base-commit: 7e06063a43d317c1ca9278b6662555f687f43f03


