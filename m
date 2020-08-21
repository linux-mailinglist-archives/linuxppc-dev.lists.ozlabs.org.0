Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 149F424D0A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 10:41:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXw371XdszDr9v
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 18:41:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BXw1J723XzDqyJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 18:39:31 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A493A30E;
 Fri, 21 Aug 2020 01:39:29 -0700 (PDT)
Received: from [10.163.67.49] (unknown [10.163.67.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD0633F66B;
 Fri, 21 Aug 2020 01:39:27 -0700 (PDT)
Subject: Re: [PATCH v2 04/13] mm/debug_vm_pgtables/hugevmap: Use the arch
 helper to identify huge vmap support.
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
 <20200819130107.478414-5-aneesh.kumar@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <16de7c34-4c43-9cb6-adb4-8d218a7b0d2e@arm.com>
Date: Fri, 21 Aug 2020 14:08:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200819130107.478414-5-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/19/2020 06:30 PM, Aneesh Kumar K.V wrote:
> ppc64 supports huge vmap only with radix translation. Hence use arch helper
> to determine the huge vmap support.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  include/linux/io.h    | 12 ++++++++++++
>  mm/debug_vm_pgtable.c |  4 ++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/io.h b/include/linux/io.h
> index 8394c56babc2..0b1ecda0cc86 100644
> --- a/include/linux/io.h
> +++ b/include/linux/io.h
> @@ -38,6 +38,18 @@ int arch_ioremap_pud_supported(void);
>  int arch_ioremap_pmd_supported(void);
>  #else
>  static inline void ioremap_huge_init(void) { }
> +static inline int arch_ioremap_p4d_supported(void)
> +{
> +	return false;
> +}
> +static inline int arch_ioremap_pud_supported(void)
> +{
> +	return false;
> +}
> +static inline int arch_ioremap_pmd_supported(void)
> +{
> +	return false;
> +}
>  #endif
>  
>  /*
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 57259e2dbd17..cf3c4792b4a2 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c

This would need an explicit inclusion of <linux/io.h> in order
to prevent build failure in some cases.

> @@ -206,7 +206,7 @@ static void __init pmd_huge_tests(pmd_t *pmdp, unsigned long pfn, pgprot_t prot)
>  {
>  	pmd_t pmd;
>  
> -	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
> +	if (!arch_ioremap_pmd_supported())
>  		return;
>  
>  	pr_debug("Validating PMD huge\n");
> @@ -320,7 +320,7 @@ static void __init pud_huge_tests(pud_t *pudp, unsigned long pfn, pgprot_t prot)
>  {
>  	pud_t pud;
>  
> -	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
> +	if (!arch_ioremap_pud_supported())
>  		return;
>  
>  	pr_debug("Validating PUD huge\n");
> 
