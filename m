Return-Path: <linuxppc-dev+bounces-10983-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F40AB261AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 12:00:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2ghg3xZGz30W9;
	Thu, 14 Aug 2025 20:00:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.201
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755165603;
	cv=none; b=IKFEjWgIA5TilWj+Yfsf2hn/LqDgw4ABW6BJeLMSLB0M+hTIrDY5kMygHCTkI1da2C/JoPIsvEKos6xB2+kXTR78KVSDvyyzD0z/Te0BvBcCRT/JG4gHDCJ852SSC/BalglzIsedsV5zJNZbayf7wgOCuLmfYPBppWCW8eoGx+4WM7ba9X4kKwxPiRpIDPcl7mVSS1P71hYeaAOeUbpcT5Rg1OqHxJPbmD1/JCqPvZwU31HnYC8XQRMnL50NS+7FDRHeW+1ideDcXszFEgPzZFVqwo85FdhhzrzKfXmQhnBu1XwA8Uz99Gh0sz9EOAFREYj8fDsQjrAnSid8Cn3i8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755165603; c=relaxed/relaxed;
	bh=msNKhqRDNixJEW/TpRAVdXqVOCSP+2XJ8j2lE8vxwtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RFcqyMyxVvC8ov9F2C3x0BDenW/Zpzo73owtTW40U03eEZZFobVj/QzVpjpzwhDySHOE7ee9AUvRyx2v5B/VtoVTCQXs0FA15usxD5o+qWpQ+yN8DAfprtdmPSkay0/3T90kqRpWrQVaEWZlZPYFz4ZAd4McFxuNZEJOdn7/Hiq7kk5MWuSAoBsRDxKt5pCWesi5k2CwAfNiGTjZPEuN2f+RrAbsyPfRC884JyQWGOgyOuPHvYi0z2440pm2GmlpAXIGuC88KtFGjs3nZ/xrp/wkMAqBXPAXX3coz+DMwU/iHACdTRXM2sAsJf8PKBoxqrMXMrd8eaaUy7dc0OJ55Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org) smtp.mailfrom=ghiti.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ghiti.fr (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org)
X-Greylist: delayed 592 seconds by postgrey-1.37 at boromir; Thu, 14 Aug 2025 20:00:02 AEST
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2ghf4Bnhz30W5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 20:00:01 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A12FF43379;
	Thu, 14 Aug 2025 09:59:57 +0000 (UTC)
Message-ID: <d021125f-49b0-43d3-ab7a-4eef1836aeeb@ghiti.fr>
Date: Thu, 14 Aug 2025 11:59:57 +0200
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
Subject: Re: [PATCH v16 07/13] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pmd_clear()
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com,
 sweettea-kernel@dorminy.me, nicholas@linux.ibm.com,
 christophe.leroy@csgroup.eu, Rohan McLure <rmclure@linux.ibm.com>,
 Ingo Molnar <mingo@kernel.org>
References: <20250813062614.51759-1-ajd@linux.ibm.com>
 <20250813062614.51759-8-ajd@linux.ibm.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250813062614.51759-8-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedtjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvvddruddtudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudegpdhrtghpthhtoheprghjugeslhhinhhugidrihgsmhdrtghomhdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehli
 hhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-Spam-Status: No, score=-0.7 required=3.0 tests=RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 8/13/25 08:26, Andrew Donnellan wrote:
> From: Rohan McLure <rmclure@linux.ibm.com>
>
> This reverts commit 1831414cd729 ("mm/page_table_check: remove unused
> parameter in [__]page_table_check_pmd_clear").
>
> Reinstate previously unused parameters for the purpose of supporting
> powerpc platforms, as many do not encode user/kernel ownership of the
> page in the pte, but instead in the address of the access.
>
> [ajd@linux.ibm.com: rebase on arm64 changes]
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Acked-by: Ingo Molnar <mingo@kernel.org>  # x86
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
> v15: rebase
> ---
>   arch/arm64/include/asm/pgtable.h |  2 +-
>   arch/riscv/include/asm/pgtable.h |  2 +-
>   arch/x86/include/asm/pgtable.h   |  2 +-
>   include/linux/page_table_check.h | 11 +++++++----
>   include/linux/pgtable.h          |  2 +-
>   mm/page_table_check.c            |  5 +++--
>   6 files changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 81f06e5e32b2..dfcdf051b114 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1370,7 +1370,7 @@ static inline pte_t __ptep_get_and_clear_anysz(struct mm_struct *mm,
>   		page_table_check_pte_clear(mm, pte);
>   		break;
>   	case PMD_SIZE:
> -		page_table_check_pmd_clear(mm, pte_pmd(pte));
> +		page_table_check_pmd_clear(mm, address, pte_pmd(pte));
>   		break;
>   #ifndef __PAGETABLE_PMD_FOLDED
>   	case PUD_SIZE:
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 2484c0788012..d11fc6333606 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -860,7 +860,7 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
>   {
>   	pmd_t pmd = __pmd(atomic_long_xchg((atomic_long_t *)pmdp, 0));
>   
> -	page_table_check_pmd_clear(mm, pmd);
> +	page_table_check_pmd_clear(mm, address, pmd);
>   
>   	return pmd;
>   }
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index 8b45e0c41923..b68bea15f32d 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1318,7 +1318,7 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm, unsigned long
>   {
>   	pmd_t pmd = native_pmdp_get_and_clear(pmdp);
>   
> -	page_table_check_pmd_clear(mm, pmd);
> +	page_table_check_pmd_clear(mm, addr, pmd);
>   
>   	return pmd;
>   }
> diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
> index 808cc3a48c28..3973b69ae294 100644
> --- a/include/linux/page_table_check.h
> +++ b/include/linux/page_table_check.h
> @@ -15,7 +15,8 @@ extern struct page_ext_operations page_table_check_ops;
>   
>   void __page_table_check_zero(struct page *page, unsigned int order);
>   void __page_table_check_pte_clear(struct mm_struct *mm, pte_t pte);
> -void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd);
> +void __page_table_check_pmd_clear(struct mm_struct *mm, unsigned long addr,
> +				  pmd_t pmd);
>   void __page_table_check_pud_clear(struct mm_struct *mm, unsigned long addr,
>   				  pud_t pud);
>   void __page_table_check_ptes_set(struct mm_struct *mm, unsigned long addr,
> @@ -52,12 +53,13 @@ static inline void page_table_check_pte_clear(struct mm_struct *mm, pte_t pte)
>   	__page_table_check_pte_clear(mm, pte);
>   }
>   
> -static inline void page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd)
> +static inline void page_table_check_pmd_clear(struct mm_struct *mm,
> +					      unsigned long addr, pmd_t pmd)
>   {
>   	if (static_branch_likely(&page_table_check_disabled))
>   		return;
>   
> -	__page_table_check_pmd_clear(mm, pmd);
> +	__page_table_check_pmd_clear(mm, addr, pmd);
>   }
>   
>   static inline void page_table_check_pud_clear(struct mm_struct *mm,
> @@ -121,7 +123,8 @@ static inline void page_table_check_pte_clear(struct mm_struct *mm, pte_t pte)
>   {
>   }
>   
> -static inline void page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd)
> +static inline void page_table_check_pmd_clear(struct mm_struct *mm,
> +					      unsigned long addr, pmd_t pmd)
>   {
>   }
>   
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 28fcff844b63..d97f40f1365d 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -648,7 +648,7 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
>   	pmd_t pmd = *pmdp;
>   
>   	pmd_clear(pmdp);
> -	page_table_check_pmd_clear(mm, pmd);
> +	page_table_check_pmd_clear(mm, address, pmd);
>   
>   	return pmd;
>   }
> diff --git a/mm/page_table_check.c b/mm/page_table_check.c
> index bd1242087a35..e8c26b616aed 100644
> --- a/mm/page_table_check.c
> +++ b/mm/page_table_check.c
> @@ -156,7 +156,8 @@ void __page_table_check_pte_clear(struct mm_struct *mm, pte_t pte)
>   }
>   EXPORT_SYMBOL(__page_table_check_pte_clear);
>   
> -void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd)
> +void __page_table_check_pmd_clear(struct mm_struct *mm, unsigned long addr,
> +				  pmd_t pmd)
>   {
>   	if (&init_mm == mm)
>   		return;
> @@ -231,7 +232,7 @@ void __page_table_check_pmds_set(struct mm_struct *mm, unsigned long addr,
>   	page_table_check_pmd_flags(pmd);
>   
>   	for (i = 0; i < nr; i++)
> -		__page_table_check_pmd_clear(mm, *(pmdp + i));
> +		__page_table_check_pmd_clear(mm, addr + PMD_SIZE * i, *(pmdp + i));
>   	if (pmd_user_accessible_page(pmd))
>   		page_table_check_set(pmd_pfn(pmd), stride * nr, pmd_write(pmd));
>   }


Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv

Thanks,

Alex


