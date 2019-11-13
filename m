Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA146FBBE7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 23:51:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47D0Gt5bzjzF7Kb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 09:51:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.64; helo=hqemgate15.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="HRf688qz"; 
 dkim-atps=neutral
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47D0DR2RgqzF5cx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 09:49:43 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcc887f0000>; Wed, 13 Nov 2019 14:49:35 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 13 Nov 2019 14:49:35 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 13 Nov 2019 14:49:35 -0800
Received: from [10.2.160.107] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 22:49:35 +0000
Subject: Re: [PATCH v4 04/23] mm: devmap: refactor 1-based refcounting for
 ZONE_DEVICE pages
To: Dan Williams <dan.j.williams@intel.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-5-jhubbard@nvidia.com>
 <CAPcyv4gGu=G-c1czSAYJ3joTYS_ZYOJ6i9umKzCQEFzpwZMiiA@mail.gmail.com>
 <CAPcyv4hr64b-k4j7ZY796+k-+Dy11REMcvPJ+QjTsyJ3vSdfKg@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <00148078-1795-da3e-916e-3ae2dcdd553d@nvidia.com>
Date: Wed, 13 Nov 2019 14:46:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4hr64b-k4j7ZY796+k-+Dy11REMcvPJ+QjTsyJ3vSdfKg@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573685375; bh=M7Ik7ubSYX7OF1stdqZNif6HzttoKtqx7waxyFkzKWY=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=HRf688qze2GRqHnyahHLvRZ+e/6fvH6+Y1q+uYREZatis29SaWPmF7Yrn0hNJ5fki
 H19OWHLxWg5fBjq4uhCaZuIv1bxbQc51YOO9wtnfWCKC6vgSD2z642SHYstveiEdW/
 XqKRd607LdK6JAMtn52qX32U9Knbm5lNv1joK9r3pPuOV/AEZfYg1zmDoNNFM75fQM
 n6MJ3uQfLBtl0aoWk9fBN2cNRViR2bv6RWI9vbCQBjOxgLTSwaiKPgMulSfUT2hZDH
 JYAGHbrw0I2OznqDmLgaSKgmfKU0BBrFDVHomZrsYlwg3oZcnar1dWmuRE3/E8o/au
 PoRkbbodX0mLw==
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
 KVM list <kvm@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, Paul
 Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 Netdev <netdev@vger.kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/13/19 2:00 PM, Dan Williams wrote:
...
>> Ugh, when did all this HMM specific manipulation sneak into the
>> generic ZONE_DEVICE path? It used to be gated by pgmap type with its
>> own put_zone_device_private_page(). For example it's certainly
>> unnecessary and might be broken (would need to check) to call
>> mem_cgroup_uncharge() on a DAX page. ZONE_DEVICE users are not a
>> monolith and the HMM use case leaks pages into code paths that DAX
>> explicitly avoids.
> 
> It's been this way for a while and I did not react previously,
> apologies for that. I think __ClearPageActive, __ClearPageWaiters, and
> mem_cgroup_uncharge, belong behind a device-private conditional. The
> history here is:
> 
> Move some, but not all HMM specifics to hmm_devmem_free():
>      2fa147bdbf67 mm, dev_pagemap: Do not clear ->mapping on final put
> 
> Remove the clearing of mapping since no upstream consumers needed it:
>      b7a523109fb5 mm: don't clear ->mapping in hmm_devmem_free
> 
> Add it back in once an upstream consumer arrived:
>      7ab0ad0e74f8 mm/hmm: fix ZONE_DEVICE anon page mapping reuse
> 
> We're now almost entirely free of ->page_free callbacks except for
> that weird nouveau case, can that FIXME in nouveau_dmem_page_free()
> also result in killing the ->page_free() callback altogether? In the
> meantime I'm proposing a cleanup like this:


OK, assuming this is acceptable (no obvious problems jump out at me,
and we can also test it with HMM), then how would you like to proceed, as
far as patches go: add such a patch as part of this series here, or as a
stand-alone patch either before or after this series? Or something else?
And did you plan on sending it out as such?

Also, the diffs didn't quite make it through intact to my "git apply", so
I'm re-posting the diff in hopes that this time it survives:

diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index f9f76f6ba07b..21db1ce8c0ae 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -338,13 +338,7 @@ static void pmem_release_disk(void *__pmem)
  	put_disk(pmem->disk);
  }
  
-static void pmem_pagemap_page_free(struct page *page)
-{
-	wake_up_var(&page->_refcount);
-}
-
  static const struct dev_pagemap_ops fsdax_pagemap_ops = {
-	.page_free		= pmem_pagemap_page_free,
  	.kill			= pmem_pagemap_kill,
  	.cleanup		= pmem_pagemap_cleanup,
  };
diff --git a/mm/memremap.c b/mm/memremap.c
index 03ccbdfeb697..157edb8f7cf8 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -419,12 +419,6 @@ void __put_devmap_managed_page(struct page *page)
  	 * holds a reference on the page.
  	 */
  	if (count == 1) {
-		/* Clear Active bit in case of parallel mark_page_accessed */
-		__ClearPageActive(page);
-		__ClearPageWaiters(page);
-
-		mem_cgroup_uncharge(page);
-
  		/*
  		 * When a device_private page is freed, the page->mapping field
  		 * may still contain a (stale) mapping value. For example, the
@@ -446,10 +440,17 @@ void __put_devmap_managed_page(struct page *page)
  		 * handled differently or not done at all, so there is no need
  		 * to clear page->mapping.
  		 */
-		if (is_device_private_page(page))
-			page->mapping = NULL;
+		if (is_device_private_page(page)) {
+			/* Clear Active bit in case of parallel mark_page_accessed */
+			__ClearPageActive(page);
+			__ClearPageWaiters(page);
  
-		page->pgmap->ops->page_free(page);
+			mem_cgroup_uncharge(page);
+
+			page->mapping = NULL;
+			page->pgmap->ops->page_free(page);
+		} else
+			wake_up_var(&page->_refcount);
  	} else if (!count)
  		__put_page(page);
  }
-- 
2.24.0


thanks,
-- 
John Hubbard
NVIDIA

> 
> diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> index ad8e4df1282b..4eae441f86c9 100644
> --- a/drivers/nvdimm/pmem.c
> +++ b/drivers/nvdimm/pmem.c
> @@ -337,13 +337,7 @@ static void pmem_release_disk(void *__pmem)
>          put_disk(pmem->disk);
>   }
> 
> -static void pmem_pagemap_page_free(struct page *page)
> -{
> -       wake_up_var(&page->_refcount);
> -}
> -
>   static const struct dev_pagemap_ops fsdax_pagemap_ops = {
> -       .page_free              = pmem_pagemap_page_free,
>          .kill                   = pmem_pagemap_kill,
>          .cleanup                = pmem_pagemap_cleanup,
>   };
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 03ccbdfeb697..157edb8f7cf8 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -419,12 +419,6 @@ void __put_devmap_managed_page(struct page *page)
>           * holds a reference on the page.
>           */
>          if (count == 1) {
> -               /* Clear Active bit in case of parallel mark_page_accessed */
> -               __ClearPageActive(page);
> -               __ClearPageWaiters(page);
> -
> -               mem_cgroup_uncharge(page);
> -
>                  /*
>                   * When a device_private page is freed, the page->mapping field
>                   * may still contain a (stale) mapping value. For example, the
> @@ -446,10 +440,17 @@ void __put_devmap_managed_page(struct page *page)
>                   * handled differently or not done at all, so there is no need
>                   * to clear page->mapping.
>                   */
> -               if (is_device_private_page(page))
> -                       page->mapping = NULL;
> +               if (is_device_private_page(page)) {
> +                       /* Clear Active bit in case of parallel
> mark_page_accessed */
> +                       __ClearPageActive(page);
> +                       __ClearPageWaiters(page);
> 
> -               page->pgmap->ops->page_free(page);
> +                       mem_cgroup_uncharge(page);
> +
> +                       page->mapping = NULL;
> +                       page->pgmap->ops->page_free(page);
> +               } else
> +                       wake_up_var(&page->_refcount);
>          } else if (!count)
>                  __put_page(page);
>   }
> 
