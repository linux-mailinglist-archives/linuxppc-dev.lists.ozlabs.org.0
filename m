Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C182304F23
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jan 2021 03:12:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQRv94K5yzDqxZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jan 2021 13:12:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com;
 envelope-from=linmiaohe@huawei.com; receiver=<UNKNOWN>)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQRsW46MczDqbc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 13:10:49 +1100 (AEDT)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DQRqt0YPLz1607h;
 Wed, 27 Jan 2021 10:09:30 +0800 (CST)
Received: from [10.174.179.117] (10.174.179.117) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Wed, 27 Jan 2021 10:10:34 +0800
Subject: Re: [PATCH v11 03/13] mm/vmalloc: rename vmap_*_range
 vmap_pages_*_range
To: Nicholas Piggin <npiggin@gmail.com>
References: <20210126044510.2491820-1-npiggin@gmail.com>
 <20210126044510.2491820-4-npiggin@gmail.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <01fe6df9-8c92-72c9-94cb-797e11160ad7@huawei.com>
Date: Wed, 27 Jan 2021 10:10:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126044510.2491820-4-npiggin@gmail.com>
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
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi:
On 2021/1/26 12:45, Nicholas Piggin wrote:
> The vmalloc mapper operates on a struct page * array rather than a
> linear physical address, re-name it to make this distinction clear.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  mm/vmalloc.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 62372f9e0167..7f2f36116980 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -189,7 +189,7 @@ void unmap_kernel_range_noflush(unsigned long start, unsigned long size)
>  		arch_sync_kernel_mappings(start, end);
>  }
>  
> -static int vmap_pte_range(pmd_t *pmd, unsigned long addr,
> +static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
>  		pgtbl_mod_mask *mask)
>  {
> @@ -217,7 +217,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr,
>  	return 0;
>  }
>  
> -static int vmap_pmd_range(pud_t *pud, unsigned long addr,
> +static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
>  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
>  		pgtbl_mod_mask *mask)
>  {
> @@ -229,13 +229,13 @@ static int vmap_pmd_range(pud_t *pud, unsigned long addr,
>  		return -ENOMEM;
>  	do {
>  		next = pmd_addr_end(addr, end);
> -		if (vmap_pte_range(pmd, addr, next, prot, pages, nr, mask))
> +		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask))
>  			return -ENOMEM;
>  	} while (pmd++, addr = next, addr != end);
>  	return 0;
>  }
>  
> -static int vmap_pud_range(p4d_t *p4d, unsigned long addr,
> +static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
>  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
>  		pgtbl_mod_mask *mask)
>  {
> @@ -247,13 +247,13 @@ static int vmap_pud_range(p4d_t *p4d, unsigned long addr,
>  		return -ENOMEM;
>  	do {
>  		next = pud_addr_end(addr, end);
> -		if (vmap_pmd_range(pud, addr, next, prot, pages, nr, mask))
> +		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask))
>  			return -ENOMEM;
>  	} while (pud++, addr = next, addr != end);
>  	return 0;
>  }
>  
> -static int vmap_p4d_range(pgd_t *pgd, unsigned long addr,
> +static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
>  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
>  		pgtbl_mod_mask *mask)
>  {
> @@ -265,7 +265,7 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr,
>  		return -ENOMEM;
>  	do {
>  		next = p4d_addr_end(addr, end);
> -		if (vmap_pud_range(p4d, addr, next, prot, pages, nr, mask))
> +		if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask))
>  			return -ENOMEM;
>  	} while (p4d++, addr = next, addr != end);
>  	return 0;
> @@ -306,7 +306,7 @@ int map_kernel_range_noflush(unsigned long addr, unsigned long size,
>  		next = pgd_addr_end(addr, end);
>  		if (pgd_bad(*pgd))
>  			mask |= PGTBL_PGD_MODIFIED;
> -		err = vmap_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
> +		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
>  		if (err)
>  			return err;
>  	} while (pgd++, addr = next, addr != end);
> 

Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>
