Return-Path: <linuxppc-dev+bounces-10985-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5594FB261AF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 12:01:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2gkG0yK5z30Wg;
	Thu, 14 Aug 2025 20:01:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::228"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755165686;
	cv=none; b=Xsuxi4XSJ2+aAwaH13f3MankEG6jMcm6uNsGQnJoP821i2C/oxlim2SgsXK/5fpJAhPNXmJ7REDGBwXwdmqOAw/vJa74cYH11UO2J+SuB9iR4ZzRfUcIeLjJ0ZCYwbTve0Pnpz7dexkAlFhB1lONnl5L9vOSfN3TZqVsiEk10/yol6X8zJeT0FtsO9F/gk1p/tMCOjHGRYB6TLRObYCtXF5/dhaXlyedk12qlrk2DHY2e75JDUZqi/ff/HmjMsvaZhH3m3miN1ktluHlw5T0isM4Q0RDM+e2pRn471OlwTc2idcCoX0AfSeXoG3g3mLtpngTM4gB4HUMO0Fa9Bjg8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755165686; c=relaxed/relaxed;
	bh=6iiTsXeAEW1jVa5G1SqdHmVSu/lmUktgB5xyatHY/nA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jLsfVc4R5KAPEExaWnCaiKaHcb6SvmigAq6N02fN4X9Eq7/ekqVtoTtudijsz1AhGIG6D/HoLe5cxemAc8aV12X4/UbZ2vOGSKCYmKOEW61JcjBIu2r3CVoQatc7qNdb+csJWYyJFK7Bo3Y5p1Z2ksyML3EaqgMD/kh54wOJgtJ7bOOhYEaqMgMgJmw0hCiM4ppUE9k79AURrGfD0Co9axMRDO6j33NL4MEkDPDrIraNw/PY2F21VrT9SYRWnW5fDtOwCObTfxLKHo+w99BKXjqeSpNhsaIzb1i2+dOFQOI/d/CfathvxqVlJCgeb2SlrnMCTTzRVrC1inovukSECg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org) smtp.mailfrom=ghiti.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ghiti.fr (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2gkF2Bbjz30W5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 20:01:24 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B06E43380;
	Thu, 14 Aug 2025 10:01:21 +0000 (UTC)
Message-ID: <ce64a10b-74ff-407f-a8a8-94c114f753bf@ghiti.fr>
Date: Thu, 14 Aug 2025 12:01:21 +0200
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
Subject: Re: [PATCH v16 09/13] mm: Provide address parameter to
 p{te,md,ud}_user_accessible_page()
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com,
 sweettea-kernel@dorminy.me, nicholas@linux.ibm.com,
 christophe.leroy@csgroup.eu, Rohan McLure <rmclure@linux.ibm.com>,
 Ingo Molnar <mingo@kernel.org>
References: <20250813062614.51759-1-ajd@linux.ibm.com>
 <20250813062614.51759-10-ajd@linux.ibm.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250813062614.51759-10-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedtjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvvddruddtudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudegpdhrtghpthhtoheprghjugeslhhinhhugidrihgsmhdrtghomhdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehli
 hhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-Spam-Status: No, score=-0.7 required=3.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 8/13/25 08:26, Andrew Donnellan wrote:
> From: Rohan McLure <rmclure@linux.ibm.com>
>
> On several powerpc platforms, a page table entry may not imply whether
> the relevant mapping is for userspace or kernelspace. Instead, such
> platforms infer this by the address which is being accessed.
>
> Add an additional address argument to each of these routines in order to
> provide support for page table check on powerpc.
>
> [ajd@linux.ibm.com: rebase on arm64 changes]
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Acked-by: Ingo Molnar <mingo@kernel.org>  # x86
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
> v15: rebase
> ---
>   arch/arm64/include/asm/pgtable.h |  6 +++---
>   arch/riscv/include/asm/pgtable.h |  6 +++---
>   arch/x86/include/asm/pgtable.h   |  6 +++---
>   mm/page_table_check.c            | 12 ++++++------
>   4 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 2203ebac81d9..254265e9a423 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1290,17 +1290,17 @@ static inline int pmdp_set_access_flags(struct vm_area_struct *vma,
>   #endif
>   
>   #ifdef CONFIG_PAGE_TABLE_CHECK
> -static inline bool pte_user_accessible_page(pte_t pte)
> +static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
>   {
>   	return pte_valid(pte) && (pte_user(pte) || pte_user_exec(pte));
>   }
>   
> -static inline bool pmd_user_accessible_page(pmd_t pmd)
> +static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long addr)
>   {
>   	return pmd_valid(pmd) && !pmd_table(pmd) && (pmd_user(pmd) || pmd_user_exec(pmd));
>   }
>   
> -static inline bool pud_user_accessible_page(pud_t pud)
> +static inline bool pud_user_accessible_page(pud_t pud, unsigned long addr)
>   {
>   	return pud_valid(pud) && !pud_table(pud) && (pud_user(pud) || pud_user_exec(pud));
>   }
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index d60e1604852d..f3dd94929d58 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -817,17 +817,17 @@ static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
>   }
>   
>   #ifdef CONFIG_PAGE_TABLE_CHECK
> -static inline bool pte_user_accessible_page(pte_t pte)
> +static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
>   {
>   	return pte_present(pte) && pte_user(pte);
>   }
>   
> -static inline bool pmd_user_accessible_page(pmd_t pmd)
> +static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long addr)
>   {
>   	return pmd_leaf(pmd) && pmd_user(pmd);
>   }
>   
> -static inline bool pud_user_accessible_page(pud_t pud)
> +static inline bool pud_user_accessible_page(pud_t pud, unsigned long addr)
>   {
>   	return pud_leaf(pud) && pud_user(pud);
>   }
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index 63350b76c0c6..b977cebb5f44 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1679,17 +1679,17 @@ static inline bool arch_has_hw_nonleaf_pmd_young(void)
>   #endif
>   
>   #ifdef CONFIG_PAGE_TABLE_CHECK
> -static inline bool pte_user_accessible_page(pte_t pte)
> +static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
>   {
>   	return (pte_val(pte) & _PAGE_PRESENT) && (pte_val(pte) & _PAGE_USER);
>   }
>   
> -static inline bool pmd_user_accessible_page(pmd_t pmd)
> +static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long addr)
>   {
>   	return pmd_leaf(pmd) && (pmd_val(pmd) & _PAGE_PRESENT) && (pmd_val(pmd) & _PAGE_USER);
>   }
>   
> -static inline bool pud_user_accessible_page(pud_t pud)
> +static inline bool pud_user_accessible_page(pud_t pud, unsigned long addr)
>   {
>   	return pud_leaf(pud) && (pud_val(pud) & _PAGE_PRESENT) && (pud_val(pud) & _PAGE_USER);
>   }
> diff --git a/mm/page_table_check.c b/mm/page_table_check.c
> index 1c33439b9c0b..abc2232ceb39 100644
> --- a/mm/page_table_check.c
> +++ b/mm/page_table_check.c
> @@ -151,7 +151,7 @@ void __page_table_check_pte_clear(struct mm_struct *mm, unsigned long addr,
>   	if (&init_mm == mm)
>   		return;
>   
> -	if (pte_user_accessible_page(pte)) {
> +	if (pte_user_accessible_page(pte, addr)) {
>   		page_table_check_clear(pte_pfn(pte), PAGE_SIZE >> PAGE_SHIFT);
>   	}
>   }
> @@ -163,7 +163,7 @@ void __page_table_check_pmd_clear(struct mm_struct *mm, unsigned long addr,
>   	if (&init_mm == mm)
>   		return;
>   
> -	if (pmd_user_accessible_page(pmd)) {
> +	if (pmd_user_accessible_page(pmd, addr)) {
>   		page_table_check_clear(pmd_pfn(pmd), PMD_SIZE >> PAGE_SHIFT);
>   	}
>   }
> @@ -175,7 +175,7 @@ void __page_table_check_pud_clear(struct mm_struct *mm, unsigned long addr,
>   	if (&init_mm == mm)
>   		return;
>   
> -	if (pud_user_accessible_page(pud)) {
> +	if (pud_user_accessible_page(pud, addr)) {
>   		page_table_check_clear(pud_pfn(pud), PUD_SIZE >> PAGE_SHIFT);
>   	}
>   }
> @@ -208,7 +208,7 @@ void __page_table_check_ptes_set(struct mm_struct *mm, unsigned long addr,
>   
>   	for (i = 0; i < nr; i++)
>   		__page_table_check_pte_clear(mm, addr + PAGE_SIZE * i, ptep_get(ptep + i));
> -	if (pte_user_accessible_page(pte))
> +	if (pte_user_accessible_page(pte, addr))
>   		page_table_check_set(pte_pfn(pte), nr, pte_write(pte));
>   }
>   EXPORT_SYMBOL(__page_table_check_ptes_set);
> @@ -234,7 +234,7 @@ void __page_table_check_pmds_set(struct mm_struct *mm, unsigned long addr,
>   
>   	for (i = 0; i < nr; i++)
>   		__page_table_check_pmd_clear(mm, addr + PMD_SIZE * i, *(pmdp + i));
> -	if (pmd_user_accessible_page(pmd))
> +	if (pmd_user_accessible_page(pmd, addr))
>   		page_table_check_set(pmd_pfn(pmd), stride * nr, pmd_write(pmd));
>   }
>   EXPORT_SYMBOL(__page_table_check_pmds_set);
> @@ -250,7 +250,7 @@ void __page_table_check_puds_set(struct mm_struct *mm, unsigned long addr,
>   
>   	for (i = 0; i < nr; i++)
>   		__page_table_check_pud_clear(mm, addr + PUD_SIZE * i, *(pudp + i));
> -	if (pud_user_accessible_page(pud))
> +	if (pud_user_accessible_page(pud, addr))
>   		page_table_check_set(pud_pfn(pud), stride * nr, pud_write(pud));
>   }
>   EXPORT_SYMBOL(__page_table_check_puds_set);


Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv

Thanks,

Alex


