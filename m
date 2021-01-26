Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1623039A4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 10:57:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQ2GL71CyzDqnw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 20:57:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com;
 envelope-from=linmiaohe@huawei.com; receiver=<UNKNOWN>)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPy5t5VnlzDq7d
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 17:49:48 +1100 (AEDT)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DPy4K0Svxz15yXj;
 Tue, 26 Jan 2021 14:48:33 +0800 (CST)
Received: from [10.174.179.117] (10.174.179.117) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Tue, 26 Jan 2021 14:49:34 +0800
Subject: Re: [PATCH v11 02/13] mm: apply_to_pte_range warn and fail if a large
 pte is encountered
To: Nicholas Piggin <npiggin@gmail.com>
References: <20210126044510.2491820-1-npiggin@gmail.com>
 <20210126044510.2491820-3-npiggin@gmail.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <4cb12137-2944-7973-b0f0-070f6f48bead@huawei.com>
Date: Tue, 26 Jan 2021 14:49:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126044510.2491820-3-npiggin@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.117]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 26 Jan 2021 20:53:32 +1100
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
 Linux-MM <linux-mm@kvack.org>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi:
On 2021/1/26 12:44, Nicholas Piggin wrote:
> apply_to_pte_range might mistake a large pte for bad, or treat it as a
> page table, resulting in a crash or corruption. Add a test to warn and
> return error if large entries are found.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  mm/memory.c | 66 +++++++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 49 insertions(+), 17 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index feff48e1465a..672e39a72788 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2440,13 +2440,21 @@ static int apply_to_pmd_range(struct mm_struct *mm, pud_t *pud,
>  	}
>  	do {
>  		next = pmd_addr_end(addr, end);
> -		if (create || !pmd_none_or_clear_bad(pmd)) {
> -			err = apply_to_pte_range(mm, pmd, addr, next, fn, data,
> -						 create, mask);
> -			if (err)
> -				break;
> +		if (pmd_none(*pmd) && !create)
> +			continue;
> +		if (WARN_ON_ONCE(pmd_leaf(*pmd)))
> +			return -EINVAL;
> +		if (!pmd_none(*pmd) && WARN_ON_ONCE(pmd_bad(*pmd))) {
> +			if (!create)
> +				continue;
> +			pmd_clear_bad(pmd);
>  		}
> +		err = apply_to_pte_range(mm, pmd, addr, next,
> +					 fn, data, create, mask);
> +		if (err)
> +			break;
>  	} while (pmd++, addr = next, addr != end);
> +
>  	return err;
>  }
>  
> @@ -2468,13 +2476,21 @@ static int apply_to_pud_range(struct mm_struct *mm, p4d_t *p4d,
>  	}
>  	do {
>  		next = pud_addr_end(addr, end);
> -		if (create || !pud_none_or_clear_bad(pud)) {
> -			err = apply_to_pmd_range(mm, pud, addr, next, fn, data,
> -						 create, mask);
> -			if (err)
> -				break;
> +		if (pud_none(*pud) && !create)
> +			continue;
> +		if (WARN_ON_ONCE(pud_leaf(*pud)))
> +			return -EINVAL;
> +		if (!pud_none(*pud) && WARN_ON_ONCE(pud_bad(*pud))) {
> +			if (!create)
> +				continue;
> +			pud_clear_bad(pud);
>  		}
> +		err = apply_to_pmd_range(mm, pud, addr, next,
> +					 fn, data, create, mask);
> +		if (err)
> +			break;
>  	} while (pud++, addr = next, addr != end);
> +
>  	return err;
>  }
>  
> @@ -2496,13 +2512,21 @@ static int apply_to_p4d_range(struct mm_struct *mm, pgd_t *pgd,
>  	}
>  	do {
>  		next = p4d_addr_end(addr, end);
> -		if (create || !p4d_none_or_clear_bad(p4d)) {
> -			err = apply_to_pud_range(mm, p4d, addr, next, fn, data,
> -						 create, mask);
> -			if (err)
> -				break;
> +		if (p4d_none(*p4d) && !create)
> +			continue;
> +		if (WARN_ON_ONCE(p4d_leaf(*p4d)))
> +			return -EINVAL;
> +		if (!p4d_none(*p4d) && WARN_ON_ONCE(p4d_bad(*p4d))) {
> +			if (!create)
> +				continue;
> +			p4d_clear_bad(p4d);
>  		}
> +		err = apply_to_pud_range(mm, p4d, addr, next,
> +					 fn, data, create, mask);
> +		if (err)
> +			break;
>  	} while (p4d++, addr = next, addr != end);
> +
>  	return err;
>  }
>  
> @@ -2522,9 +2546,17 @@ static int __apply_to_page_range(struct mm_struct *mm, unsigned long addr,
>  	pgd = pgd_offset(mm, addr);
>  	do {
>  		next = pgd_addr_end(addr, end);
> -		if (!create && pgd_none_or_clear_bad(pgd))
> +		if (pgd_none(*pgd) && !create)
>  			continue;
> -		err = apply_to_p4d_range(mm, pgd, addr, next, fn, data, create, &mask);
> +		if (WARN_ON_ONCE(pgd_leaf(*pgd)))
> +			return -EINVAL;
> +		if (!pgd_none(*pgd) && WARN_ON_ONCE(pgd_bad(*pgd))) {
> +			if (!create)
> +				continue;
> +			pgd_clear_bad(pgd);
> +		}
> +		err = apply_to_p4d_range(mm, pgd, addr, next,
> +					 fn, data, create, &mask);
>  		if (err)
>  			break;
>  	} while (pgd++, addr = next, addr != end);
> 

Looks good to me, thanks.

Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>
