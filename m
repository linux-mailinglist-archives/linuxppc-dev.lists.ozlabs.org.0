Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9C9EA7DD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 00:36:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473PxJ0nQ0zF41b
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 10:36:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqemgate14.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="md/zgeBc"; 
 dkim-atps=neutral
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473PF36Z9SzF4vk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 10:05:27 +1100 (AEDT)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dba17390001>; Wed, 30 Oct 2019 16:05:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 30 Oct 2019 16:05:23 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 30 Oct 2019 16:05:23 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Oct
 2019 23:05:22 +0000
Subject: Re: [PATCH 14/19] vfio, mm: pin_longterm_pages (FOLL_PIN) and
 put_user_page() conversion
To: Andrew Morton <akpm@linux-foundation.org>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-15-jhubbard@nvidia.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <cfa579f0-999c-9712-494a-9d519bbc4314@nvidia.com>
Date: Wed, 30 Oct 2019 16:05:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191030224930.3990755-15-jhubbard@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1572476729; bh=53l+EYxovXaJJmkDDYPwp5PBwN0eKGoaifL7qKM0Mds=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=md/zgeBc2zml8TuAaTKRK2oyv1Btng0H6ozq8zn2sRJiXmTfxKbYsvkGcjK6gQS+q
 3nPYnJq+1Eps5VG6ooIJSjGzkjOCMYIGUlSFcOJoUyjFNZ1H0vd+dWvWBSOqDkH5Uc
 dvFo63nthImmg9iCDmU6xj0EE8b8pgUM6g95EetFKN1/r0QnPl5BygVRpoyVLlCyiH
 iCMwhme/pZSwh1q5oOeHae8CYEOAkIwb1y6ebulV3/7WSgE5bb3SmwuYCg/xWfmbmX
 iPDY0K1xyswztlMvQmBw8+uJFpl2scC5scONZ/nlQeN+ZcWegNbDORlz6y4lLuTxuj
 WJ+vmX9yZfaww==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/30/19 3:49 PM, John Hubbard wrote:
> This also fixes one or two likely bugs.

Well, actually just one...

> 
> 1. Change vfio from get_user_pages(FOLL_LONGTERM), to
> pin_longterm_pages(), which sets both FOLL_LONGTERM and FOLL_PIN.
> 
> Note that this is a change in behavior, because the
> get_user_pages_remote() call was not setting FOLL_LONGTERM, but the
> new pin_user_pages_remote() call that replaces it, *is* setting
> FOLL_LONGTERM. It is important to set FOLL_LONGTERM, because the
> DMA case requires it. Please see the FOLL_PIN documentation in
> include/linux/mm.h, and Documentation/pin_user_pages.rst for details.

Correction: the above comment is stale and wrong. I wrote it before 
getting further into the details, and the patch doesn't do this. 

Instead, it keeps exactly the old behavior: pin_longterm_pages_remote()
is careful to avoid setting FOLL_LONGTERM. Instead of setting that flag,
it drops in a "TODO" comment nearby. :)

I'll update the commit description in the next version of the series.


thanks,

John Hubbard
NVIDIA

> 
> 2. Because all FOLL_PIN-acquired pages must be released via
> put_user_page(), also convert the put_page() call over to
> put_user_pages().
> 
> Note that this effectively changes the code's behavior in
> vfio_iommu_type1.c: put_pfn(): it now ultimately calls
> set_page_dirty_lock(), instead of set_page_dirty(). This is
> probably more accurate.
> 
> As Christoph Hellwig put it, "set_page_dirty() is only safe if we are
> dealing with a file backed page where we have reference on the inode it
> hangs off." [1]
> 
> [1] https://lore.kernel.org/r/20190723153640.GB720@lst.de
> 
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index d864277ea16f..795e13f3ef08 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -327,9 +327,8 @@ static int put_pfn(unsigned long pfn, int prot)
>  {
>  	if (!is_invalid_reserved_pfn(pfn)) {
>  		struct page *page = pfn_to_page(pfn);
> -		if (prot & IOMMU_WRITE)
> -			SetPageDirty(page);
> -		put_page(page);
> +
> +		put_user_pages_dirty_lock(&page, 1, prot & IOMMU_WRITE);
>  		return 1;
>  	}
>  	return 0;
> @@ -349,11 +348,11 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsigned long vaddr,
>  
>  	down_read(&mm->mmap_sem);
>  	if (mm == current->mm) {
> -		ret = get_user_pages(vaddr, 1, flags | FOLL_LONGTERM, page,
> -				     vmas);
> +		ret = pin_longterm_pages(vaddr, 1, flags, page, vmas);
>  	} else {
> -		ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags, page,
> -					    vmas, NULL);
> +		ret = pin_longterm_pages_remote(NULL, mm, vaddr, 1,
> +						flags, page, vmas,
> +						NULL);
>  		/*
>  		 * The lifetime of a vaddr_get_pfn() page pin is
>  		 * userspace-controlled. In the fs-dax case this could
> @@ -363,7 +362,7 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsigned long vaddr,
>  		 */
>  		if (ret > 0 && vma_is_fsdax(vmas[0])) {
>  			ret = -EOPNOTSUPP;
> -			put_page(page[0]);
> +			put_user_page(page[0]);
>  		}
>  	}
>  	up_read(&mm->mmap_sem);
> 
