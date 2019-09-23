Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC608BBCDE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 22:31:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cbZY5mYxzDqH1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 06:31:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nvidia.com
 (client-ip=216.228.121.64; helo=hqemgate15.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="ajIH2gYx"; 
 dkim-atps=neutral
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cbVJ6FC7zDqMp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 06:27:52 +1000 (AEST)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d892acb0000>; Mon, 23 Sep 2019 13:27:55 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 23 Sep 2019 13:27:48 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 23 Sep 2019 13:27:48 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Sep
 2019 20:27:48 +0000
Received: from [10.110.48.28] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Sep
 2019 20:27:47 +0000
Subject: Re: [PATCH v2 03/11] mm/gup: Applies counting method to monitor
 gup_pgd_range
To: Leonardo Bras <leonardo@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>
References: <20190920195047.7703-1-leonardo@linux.ibm.com>
 <20190920195047.7703-4-leonardo@linux.ibm.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <2e060677-eadf-c32e-d8c5-8e22c8ca118e@nvidia.com>
Date: Mon, 23 Sep 2019 13:27:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920195047.7703-4-leonardo@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1569270475; bh=XNenBmqAqCYxHgVNxJnuJ5MLWIZwseyOgOVEhMg8H3o=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ajIH2gYxzRb2audG5tH2gA0cMhzlccP9Q0HTjAKm83FfcSm6/RfgaCKF+3QJ7V7sn
 P4Tl6Hv6sPEJPlQiExFo6kwmIXdn/5IYIqGUZOM+P0UeE9IzNVojCc+ECNlR65ypNW
 Zcix900B66sJG54TaUgGWLLDSMnZTXkLY/hRnwOeUceuWlfCX1KVijx+JFI1h8kV+b
 6VIV1lrHYUELomtNHPuISqun6E1diREntq4SNaVyPBTMk9Mv3JyRfOlGUvrbApoucJ
 /eW9uLjYcaQ0srziimMtN1TZNARVDCTObZxRf+V0BUq0Do+VCuBCNVWeIndSmMBt2Q
 yuzPjvJ2+1M7w==
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
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Thomas Gleixner <tglx@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, YueHaibing <yuehaibing@huawei.com>,
 Keith Busch <keith.busch@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/20/19 12:50 PM, Leonardo Bras wrote:
> As decribed, gup_pgd_range is a lockless pagetable walk. So, in order to
> monitor against THP split/collapse with the couting method, it's necessary
> to bound it with {start,end}_lockless_pgtbl_walk.
> 
> There are dummy functions, so it is not going to add any overhead on archs
> that don't use this method.
> 
> Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
> ---
>  mm/gup.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 98f13ab37bac..675e4be27082 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2404,6 +2404,7 @@ int get_user_pages_fast(unsigned long start, int nr_pages,
>  			unsigned int gup_flags, struct page **pages)
>  {
>  	unsigned long addr, len, end;
> +	struct mm_struct *mm;
>  	int nr = 0, ret = 0;
>  
>  	if (WARN_ON_ONCE(gup_flags & ~(FOLL_WRITE | FOLL_LONGTERM)))
> @@ -2421,9 +2422,12 @@ int get_user_pages_fast(unsigned long start, int nr_pages,
>  
>  	if (IS_ENABLED(CONFIG_HAVE_FAST_GUP) &&
>  	    gup_fast_permitted(start, end)) {
> +		mm = current->mm;
> +		start_lockless_pgtbl_walk(mm);
>  		local_irq_disable();

I'd also like a second opinion from the "core" -mm maintainers, but it seems like
there is now too much code around the gup_pgd_range() call. Especially since there
are two places where it's called--did you forget the other one in 
__get_user_pages_fast(), btw??

Maybe the irq handling and atomic counting should be moved into start/finish
calls, like this:

     start_gup_fast_walk()
     gup_pgd_range()
     finish_gup_fast_walk()

>  		gup_pgd_range(addr, end, gup_flags, pages, &nr);
>  		local_irq_enable();
> +		end_lockless_pgtbl_walk(mm);
>  		ret = nr;
>  	}
>  
> 



thanks,
-- 
John Hubbard
NVIDIA
