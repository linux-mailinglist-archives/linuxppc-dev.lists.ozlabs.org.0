Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E900D9323D8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 12:23:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNZrz48KMz3fNd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 20:22:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNZrc19M4z30Tv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 20:22:38 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78BB31063;
	Tue, 16 Jul 2024 03:22:32 -0700 (PDT)
Received: from [10.163.52.225] (unknown [10.163.52.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 012EF3F762;
	Tue, 16 Jul 2024 03:21:58 -0700 (PDT)
Message-ID: <ca5de643-dcf3-4a24-ba99-b05066c95dca@arm.com>
Date: Tue, 16 Jul 2024 15:51:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/29] arm64: add pte_access_permitted_no_overlay()
To: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-17-joey.gouly@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20240503130147.1154804-17-joey.gouly@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, oliver.upton@linux.dev, aneesh.kumar@linux.ibm.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/3/24 18:31, Joey Gouly wrote:
> We do not want take POE into account when clearing the MTE tags.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/include/asm/pgtable.h | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 5c970a9cca67..2449e4e27ea6 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -160,8 +160,10 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
>   * not set) must return false. PROT_NONE mappings do not have the
>   * PTE_VALID bit set.
>   */
> -#define pte_access_permitted(pte, write) \
> +#define pte_access_permitted_no_overlay(pte, write) \
>  	(((pte_val(pte) & (PTE_VALID | PTE_USER)) == (PTE_VALID | PTE_USER)) && (!(write) || pte_write(pte)))
> +#define pte_access_permitted(pte, write) \
> +	pte_access_permitted_no_overlay(pte, write)
>  #define pmd_access_permitted(pmd, write) \
>  	(pte_access_permitted(pmd_pte(pmd), (write)))
>  #define pud_access_permitted(pud, write) \
> @@ -348,10 +350,11 @@ static inline void __sync_cache_and_tags(pte_t pte, unsigned int nr_pages)
>  	/*
>  	 * If the PTE would provide user space access to the tags associated
>  	 * with it then ensure that the MTE tags are synchronised.  Although
> -	 * pte_access_permitted() returns false for exec only mappings, they
> -	 * don't expose tags (instruction fetches don't check tags).
> +	 * pte_access_permitted_no_overlay() returns false for exec only
> +	 * mappings, they don't expose tags (instruction fetches don't check
> +	 * tags).
>  	 */
> -	if (system_supports_mte() && pte_access_permitted(pte, false) &&
> +	if (system_supports_mte() && pte_access_permitted_no_overlay(pte, false) &&
>  	    !pte_special(pte) && pte_tagged(pte))
>  		mte_sync_tags(pte, nr_pages);
>  }
