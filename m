Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EC2C292A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 23:53:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hx3T350BzDqCc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 07:53:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nvidia.com
 (client-ip=216.228.121.65; helo=hqemgate16.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="UzrMa92U"; 
 dkim-atps=neutral
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hx1l74l5zDqPK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 07:51:39 +1000 (AEST)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d9278ef0000>; Mon, 30 Sep 2019 14:51:43 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 30 Sep 2019 14:51:35 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 30 Sep 2019 14:51:35 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 30 Sep
 2019 21:51:35 +0000
Received: from [10.110.48.28] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 30 Sep
 2019 21:51:35 +0000
Subject: Re: [PATCH v4 03/11] mm/gup: Applies counting method to monitor
 gup_pgd_range
To: Leonardo Bras <leonardo@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>, <kvm-ppc@vger.kernel.org>,
 <linux-arch@vger.kernel.org>, <linux-mm@kvack.org>
References: <20190927234008.11513-1-leonardo@linux.ibm.com>
 <20190927234008.11513-4-leonardo@linux.ibm.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <ce0a4110-9f83-36db-dc85-6a727d30d030@nvidia.com>
Date: Mon, 30 Sep 2019 14:51:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190927234008.11513-4-leonardo@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1569880303; bh=RhTgQNvZ8M45lzVl6hQTIIr5nfDQ7NW7gfdMi34LNhk=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=UzrMa92UkK/ugI5rJmLH6VcSHCFZgd+8pGsK+O76TQtxxe31sawf/JbOhpwudc/sS
 damkLuyQvWeeGxVj27E21Eymd67cSEVzDQH3++PnzXsSVS65C5Y/LURmdnD64THCSg
 84QKUMhgHJ9PgAoywb3hxCtJw13PuG7Rh+GZJb9kfxzIwoMkTww2a4yBdQl65LtD1r
 gO9QJ4Gtv+pe7iYDIviNS97kO4OlCkYpCxW61218mxU9ngl1Tk4W1EJZGhLmBHrxc3
 ruhDm3XLYrDqzSxy00xKbZ49nSK0O27crTbp/i4he5sCOwb7FST40wueaM69J3/IEs
 jOVD0C7+kMDwg==
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
Cc: Keith Busch <keith.busch@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 YueHaibing <yuehaibing@huawei.com>, Nicholas Piggin <npiggin@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/27/19 4:40 PM, Leonardo Bras wrote:
> As decribed, gup_pgd_range is a lockless pagetable walk. So, in order to
> monitor against THP split/collapse with the couting method, it's necessary

s/couting/counting/

> to bound it with {start,end}_lockless_pgtbl_walk.
> 
> There are dummy functions, so it is not going to add any overhead on archs
> that don't use this method.
> 
> Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
> ---
>  mm/gup.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 98f13ab37bac..7105c829cf44 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2325,6 +2325,7 @@ static bool gup_fast_permitted(unsigned long start, unsigned long end)
>  int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
>  			  struct page **pages)
>  {
> +	struct mm_struct *mm;

I don't think that this local variable adds any value, so let's not use it.
Similar point in a few other patches too.

>  	unsigned long len, end;
>  	unsigned long flags;
>  	int nr = 0;
> @@ -2352,9 +2353,12 @@ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
>  
>  	if (IS_ENABLED(CONFIG_HAVE_FAST_GUP) &&
>  	    gup_fast_permitted(start, end)) {
> +		mm = current->mm;
> +		start_lockless_pgtbl_walk(mm);
>  		local_irq_save(flags);
>  		gup_pgd_range(start, end, write ? FOLL_WRITE : 0, pages, &nr);
>  		local_irq_restore(flags);
> +		end_lockless_pgtbl_walk(mm);
>  	}
>  
>  	return nr;
> @@ -2404,6 +2408,7 @@ int get_user_pages_fast(unsigned long start, int nr_pages,
>  			unsigned int gup_flags, struct page **pages)
>  {
>  	unsigned long addr, len, end;
> +	struct mm_struct *mm;

Same here.

>  	int nr = 0, ret = 0;
>  
>  	if (WARN_ON_ONCE(gup_flags & ~(FOLL_WRITE | FOLL_LONGTERM)))
> @@ -2421,9 +2426,12 @@ int get_user_pages_fast(unsigned long start, int nr_pages,
>  
>  	if (IS_ENABLED(CONFIG_HAVE_FAST_GUP) &&
>  	    gup_fast_permitted(start, end)) {
> +		mm = current->mm;
> +		start_lockless_pgtbl_walk(mm);

Minor: I'd like to rename this register_lockless_pgtable_walker().

>  		local_irq_disable();
>  		gup_pgd_range(addr, end, gup_flags, pages, &nr);
>  		local_irq_enable();
> +		end_lockless_pgtbl_walk(mm);

...and deregister_lockless_pgtable_walker().


thanks,
-- 
John Hubbard
NVIDIA
