Return-Path: <linuxppc-dev+bounces-177-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D47E695698D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2024 13:43:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnW1t1jl5z2y0B;
	Mon, 19 Aug 2024 21:43:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnW1s2FtXz2xvR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2024 21:43:10 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WnVxZ2DT9z6K6GP;
	Mon, 19 Aug 2024 19:39:30 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 711CF1400C9;
	Mon, 19 Aug 2024 19:43:02 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 19 Aug
 2024 12:43:01 +0100
Date: Mon, 19 Aug 2024 12:43:00 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Tong Tiangen <tongtiangen@huawei.com>
CC: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, James Morse <james.morse@arm.com>, "Robin
 Murphy" <robin.murphy@arm.com>, Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino
	<vincenzo.frascino@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Aneesh Kumar K.V <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mm@kvack.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <wangkefeng.wang@huawei.com>, Guohanjun
	<guohanjun@huawei.com>
Subject: Re: [PATCH v12 3/6] mm/hwpoison: return -EFAULT when copy fail in
 copy_mc_[user]_highpage()
Message-ID: <20240819124300.0000421e@Huawei.com>
In-Reply-To: <20240528085915.1955987-4-tongtiangen@huawei.com>
References: <20240528085915.1955987-1-tongtiangen@huawei.com>
	<20240528085915.1955987-4-tongtiangen@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Tue, 28 May 2024 16:59:12 +0800
Tong Tiangen <tongtiangen@huawei.com> wrote:

> If hardware errors are encountered during page copying, returning the bytes
> not copied is not meaningful, and the caller cannot do any processing on
> the remaining data. Returning -EFAULT is more reasonable, which represents
> a hardware error encountered during the copying.
> 
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>

LGTM
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  include/linux/highmem.h | 8 ++++----
>  mm/khugepaged.c         | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/highmem.h b/include/linux/highmem.h
> index 00341b56d291..64a567d5ad6f 100644
> --- a/include/linux/highmem.h
> +++ b/include/linux/highmem.h
> @@ -335,8 +335,8 @@ static inline void copy_highpage(struct page *to, struct page *from)
>  /*
>   * If architecture supports machine check exception handling, define the
>   * #MC versions of copy_user_highpage and copy_highpage. They copy a memory
> - * page with #MC in source page (@from) handled, and return the number
> - * of bytes not copied if there was a #MC, otherwise 0 for success.
> + * page with #MC in source page (@from) handled, and return -EFAULT if there
> + * was a #MC, otherwise 0 for success.
>   */
>  static inline int copy_mc_user_highpage(struct page *to, struct page *from,
>  					unsigned long vaddr, struct vm_area_struct *vma)
> @@ -352,7 +352,7 @@ static inline int copy_mc_user_highpage(struct page *to, struct page *from,
>  	kunmap_local(vto);
>  	kunmap_local(vfrom);
>  
> -	return ret;
> +	return ret ? -EFAULT : 0;
>  }
>  
>  static inline int copy_mc_highpage(struct page *to, struct page *from)
> @@ -368,7 +368,7 @@ static inline int copy_mc_highpage(struct page *to, struct page *from)
>  	kunmap_local(vto);
>  	kunmap_local(vfrom);
>  
> -	return ret;
> +	return ret ? -EFAULT : 0;
>  }
>  #else
>  static inline int copy_mc_user_highpage(struct page *to, struct page *from,
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 774a97e6e2da..cce838e85967 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -798,7 +798,7 @@ static int __collapse_huge_page_copy(pte_t *pte, struct folio *folio,
>  			continue;
>  		}
>  		src_page = pte_page(pteval);
> -		if (copy_mc_user_highpage(page, src_page, src_addr, vma) > 0) {
> +		if (copy_mc_user_highpage(page, src_page, src_addr, vma)) {
>  			result = SCAN_COPY_MC;
>  			break;
>  		}
> @@ -2042,7 +2042,7 @@ static int collapse_file(struct mm_struct *mm, unsigned long addr,
>  			index++;
>  			dst++;
>  		}
> -		if (copy_mc_highpage(dst, folio_page(folio, 0)) > 0) {
> +		if (copy_mc_highpage(dst, folio_page(folio, 0))) {
>  			result = SCAN_COPY_MC;
>  			goto rollback;
>  		}


