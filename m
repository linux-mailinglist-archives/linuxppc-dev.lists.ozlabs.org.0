Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA78306B28
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 03:40:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR4SZ33wPzDrQ1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 13:39:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com;
 envelope-from=linmiaohe@huawei.com; receiver=<UNKNOWN>)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR4Qx4n4tzDrBZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 13:38:23 +1100 (AEDT)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DR4Ns5pmHzl6G5;
 Thu, 28 Jan 2021 10:36:45 +0800 (CST)
Received: from [10.174.179.117] (10.174.179.117) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Thu, 28 Jan 2021 10:38:12 +0800
Subject: Re: [PATCH v11 04/13] mm/ioremap: rename ioremap_*_range to
 vmap_*_range
To: Nicholas Piggin <npiggin@gmail.com>
References: <20210126044510.2491820-1-npiggin@gmail.com>
 <20210126044510.2491820-5-npiggin@gmail.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <5a690f1c-7c12-9446-980b-6715c9290a96@huawei.com>
Date: Thu, 28 Jan 2021 10:38:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126044510.2491820-5-npiggin@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.117]
X-CFilter-Loop: Reflected
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
Cc: linux-arch@vger.kernel.org, Ding Tianhong <dingtianhong@huawei.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi:
On 2021/1/26 12:45, Nicholas Piggin wrote:
> This will be used as a generic kernel virtual mapping function, so
> re-name it in preparation.
> 

Looks good to me. Thanks.

Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>

> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  mm/ioremap.c | 64 +++++++++++++++++++++++++++-------------------------
>  1 file changed, 33 insertions(+), 31 deletions(-)
> 
> diff --git a/mm/ioremap.c b/mm/ioremap.c
> index 5fa1ab41d152..3f4d36f9745a 100644
> --- a/mm/ioremap.c
> +++ b/mm/ioremap.c
> @@ -61,9 +61,9 @@ static inline int ioremap_pud_enabled(void) { return 0; }
>  static inline int ioremap_pmd_enabled(void) { return 0; }
>  #endif	/* CONFIG_HAVE_ARCH_HUGE_VMAP */
>  
> -static int ioremap_pte_range(pmd_t *pmd, unsigned long addr,
> -		unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
> -		pgtbl_mod_mask *mask)
> +static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
> +			phys_addr_t phys_addr, pgprot_t prot,
> +			pgtbl_mod_mask *mask)
>  {
>  	pte_t *pte;
>  	u64 pfn;
> @@ -81,9 +81,8 @@ static int ioremap_pte_range(pmd_t *pmd, unsigned long addr,
>  	return 0;
>  }
>  
> -static int ioremap_try_huge_pmd(pmd_t *pmd, unsigned long addr,
> -				unsigned long end, phys_addr_t phys_addr,
> -				pgprot_t prot)
> +static int vmap_try_huge_pmd(pmd_t *pmd, unsigned long addr, unsigned long end,
> +			phys_addr_t phys_addr, pgprot_t prot)
>  {
>  	if (!ioremap_pmd_enabled())
>  		return 0;
> @@ -103,9 +102,9 @@ static int ioremap_try_huge_pmd(pmd_t *pmd, unsigned long addr,
>  	return pmd_set_huge(pmd, phys_addr, prot);
>  }
>  
> -static inline int ioremap_pmd_range(pud_t *pud, unsigned long addr,
> -		unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
> -		pgtbl_mod_mask *mask)
> +static int vmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
> +			phys_addr_t phys_addr, pgprot_t prot,
> +			pgtbl_mod_mask *mask)
>  {
>  	pmd_t *pmd;
>  	unsigned long next;
> @@ -116,20 +115,19 @@ static inline int ioremap_pmd_range(pud_t *pud, unsigned long addr,
>  	do {
>  		next = pmd_addr_end(addr, end);
>  
> -		if (ioremap_try_huge_pmd(pmd, addr, next, phys_addr, prot)) {
> +		if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot)) {
>  			*mask |= PGTBL_PMD_MODIFIED;
>  			continue;
>  		}
>  
> -		if (ioremap_pte_range(pmd, addr, next, phys_addr, prot, mask))
> +		if (vmap_pte_range(pmd, addr, next, phys_addr, prot, mask))
>  			return -ENOMEM;
>  	} while (pmd++, phys_addr += (next - addr), addr = next, addr != end);
>  	return 0;
>  }
>  
> -static int ioremap_try_huge_pud(pud_t *pud, unsigned long addr,
> -				unsigned long end, phys_addr_t phys_addr,
> -				pgprot_t prot)
> +static int vmap_try_huge_pud(pud_t *pud, unsigned long addr, unsigned long end,
> +			phys_addr_t phys_addr, pgprot_t prot)
>  {
>  	if (!ioremap_pud_enabled())
>  		return 0;
> @@ -149,9 +147,9 @@ static int ioremap_try_huge_pud(pud_t *pud, unsigned long addr,
>  	return pud_set_huge(pud, phys_addr, prot);
>  }
>  
> -static inline int ioremap_pud_range(p4d_t *p4d, unsigned long addr,
> -		unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
> -		pgtbl_mod_mask *mask)
> +static int vmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
> +			phys_addr_t phys_addr, pgprot_t prot,
> +			pgtbl_mod_mask *mask)
>  {
>  	pud_t *pud;
>  	unsigned long next;
> @@ -162,20 +160,19 @@ static inline int ioremap_pud_range(p4d_t *p4d, unsigned long addr,
>  	do {
>  		next = pud_addr_end(addr, end);
>  
> -		if (ioremap_try_huge_pud(pud, addr, next, phys_addr, prot)) {
> +		if (vmap_try_huge_pud(pud, addr, next, phys_addr, prot)) {
>  			*mask |= PGTBL_PUD_MODIFIED;
>  			continue;
>  		}
>  
> -		if (ioremap_pmd_range(pud, addr, next, phys_addr, prot, mask))
> +		if (vmap_pmd_range(pud, addr, next, phys_addr, prot, mask))
>  			return -ENOMEM;
>  	} while (pud++, phys_addr += (next - addr), addr = next, addr != end);
>  	return 0;
>  }
>  
> -static int ioremap_try_huge_p4d(p4d_t *p4d, unsigned long addr,
> -				unsigned long end, phys_addr_t phys_addr,
> -				pgprot_t prot)
> +static int vmap_try_huge_p4d(p4d_t *p4d, unsigned long addr, unsigned long end,
> +			phys_addr_t phys_addr, pgprot_t prot)
>  {
>  	if (!ioremap_p4d_enabled())
>  		return 0;
> @@ -195,9 +192,9 @@ static int ioremap_try_huge_p4d(p4d_t *p4d, unsigned long addr,
>  	return p4d_set_huge(p4d, phys_addr, prot);
>  }
>  
> -static inline int ioremap_p4d_range(pgd_t *pgd, unsigned long addr,
> -		unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
> -		pgtbl_mod_mask *mask)
> +static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
> +			phys_addr_t phys_addr, pgprot_t prot,
> +			pgtbl_mod_mask *mask)
>  {
>  	p4d_t *p4d;
>  	unsigned long next;
> @@ -208,19 +205,19 @@ static inline int ioremap_p4d_range(pgd_t *pgd, unsigned long addr,
>  	do {
>  		next = p4d_addr_end(addr, end);
>  
> -		if (ioremap_try_huge_p4d(p4d, addr, next, phys_addr, prot)) {
> +		if (vmap_try_huge_p4d(p4d, addr, next, phys_addr, prot)) {
>  			*mask |= PGTBL_P4D_MODIFIED;
>  			continue;
>  		}
>  
> -		if (ioremap_pud_range(p4d, addr, next, phys_addr, prot, mask))
> +		if (vmap_pud_range(p4d, addr, next, phys_addr, prot, mask))
>  			return -ENOMEM;
>  	} while (p4d++, phys_addr += (next - addr), addr = next, addr != end);
>  	return 0;
>  }
>  
> -int ioremap_page_range(unsigned long addr,
> -		       unsigned long end, phys_addr_t phys_addr, pgprot_t prot)
> +static int vmap_range(unsigned long addr, unsigned long end,
> +			phys_addr_t phys_addr, pgprot_t prot)
>  {
>  	pgd_t *pgd;
>  	unsigned long start;
> @@ -235,8 +232,7 @@ int ioremap_page_range(unsigned long addr,
>  	pgd = pgd_offset_k(addr);
>  	do {
>  		next = pgd_addr_end(addr, end);
> -		err = ioremap_p4d_range(pgd, addr, next, phys_addr, prot,
> -					&mask);
> +		err = vmap_p4d_range(pgd, addr, next, phys_addr, prot, &mask);
>  		if (err)
>  			break;
>  	} while (pgd++, phys_addr += (next - addr), addr = next, addr != end);
> @@ -249,6 +245,12 @@ int ioremap_page_range(unsigned long addr,
>  	return err;
>  }
>  
> +int ioremap_page_range(unsigned long addr,
> +		       unsigned long end, phys_addr_t phys_addr, pgprot_t prot)
> +{
> +	return vmap_range(addr, end, phys_addr, prot);
> +}
> +
>  #ifdef CONFIG_GENERIC_IOREMAP
>  void __iomem *ioremap_prot(phys_addr_t addr, size_t size, unsigned long prot)
>  {
> 

