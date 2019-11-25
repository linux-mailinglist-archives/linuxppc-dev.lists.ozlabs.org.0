Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D021094D4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 21:49:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MJzn2jcWzDqc8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 07:49:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65; helo=hqemgate16.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="Vc2WP6DA"; 
 dkim-atps=neutral
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MJxM1mv2zDqMT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 07:47:02 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ddc3dc40000>; Mon, 25 Nov 2019 12:47:00 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 25 Nov 2019 12:46:58 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 25 Nov 2019 12:46:58 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Nov
 2019 20:46:57 +0000
Subject: Re: [PATCH 17/19] powerpc: book3s64: convert to pin_user_pages() and
 put_user_page()
To: Jan Kara <jack@suse.cz>
References: <20191125042011.3002372-1-jhubbard@nvidia.com>
 <20191125042011.3002372-18-jhubbard@nvidia.com>
 <20191125085915.GB1797@quack2.suse.cz>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <9abfd0bf-ffb9-9fad-848c-caff4a490773@nvidia.com>
Date: Mon, 25 Nov 2019 12:46:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191125085915.GB1797@quack2.suse.cz>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1574714820; bh=7Gmrre2tneNEWRU9G5+DIn5rrxtRLBtJ55Uj7bfaWRw=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Vc2WP6DAAbNZStXBl+ln2+kB/EuUuvRZHzMpZNW80Fm3ZctGnvM4O+tZRCgS3669B
 /qldmeczkVi9pQJMXYF/4i2XGVt4Gm+gOJ/tFv/RnDb4dopV+tz5b0cyQc9YOTVtBS
 P/yYNUzd4pjDhuvvDyZmybC/J7abTjT/ntYJJMbyGr8NCKnGXhEtDqS5T7TKRE2hwU
 dbPgyN9eu9VXPtG/lD5Uk37zf69kjzXTl/JkUlunTht14kOdHqRRRORI90fFcZ/kGC
 NFhCuK40TfQ4yRLkmLaKp7qlIx6xeGOy5CzKXKx/3W33foWMDjA/xuDpoO/15JsFQy
 0FiT0Aycu6K+g==
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
Cc: Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/25/19 12:59 AM, Jan Kara wrote:
> On Sun 24-11-19 20:20:09, John Hubbard wrote:
>> 1. Convert from get_user_pages() to pin_user_pages().
>>
>> 2. As required by pin_user_pages(), release these pages via
>> put_user_page(). In this case, do so via put_user_pages_dirty_lock().
>>
>> That has the side effect of calling set_page_dirty_lock(), instead
>> of set_page_dirty(). This is probably more accurate.
>>
>> As Christoph Hellwig put it, "set_page_dirty() is only safe if we are
>> dealing with a file backed page where we have reference on the inode it
>> hangs off." [1]
>>
>> 3. Release each page in mem->hpages[] (instead of mem->hpas[]), because
>> that is the array that pin_longterm_pages() filled in. This is more
>> accurate and should be a little safer from a maintenance point of
>> view.
> 
> Except that this breaks the code. hpages is unioned with hpas...
> 

OK. 

>> @@ -212,10 +211,9 @@ static void mm_iommu_unpin(struct mm_iommu_table_group_mem_t *mem)
>>  		if (!page)
>>  			continue;
>>  
>> -		if (mem->hpas[i] & MM_IOMMU_TABLE_GROUP_PAGE_DIRTY)
>> -			SetPageDirty(page);
>> +		put_user_pages_dirty_lock(&mem->hpages[i], 1,
>> +					  MM_IOMMU_TABLE_GROUP_PAGE_DIRTY);
> 
> And the dirtying condition is wrong here as well. Currently it is always
> true.
> 
> 								Honza
> 

Yes. Fixed up locally. The function now looks like this (for this patch, not for
the entire series, which renames "put" to "unpin"):


static void mm_iommu_unpin(struct mm_iommu_table_group_mem_t *mem)
{
	long i;
	struct page *page = NULL;

	if (!mem->hpas)
		return;

	for (i = 0; i < mem->entries; ++i) {
		if (!mem->hpas[i])
			continue;

		page = pfn_to_page(mem->hpas[i] >> PAGE_SHIFT);
		if (!page)
			continue;

		put_user_pages_dirty_lock(&page, 1,
				mem->hpas[i] & MM_IOMMU_TABLE_GROUP_PAGE_DIRTY);

		mem->hpas[i] = 0;
	}
}

thanks,
-- 
John Hubbard
NVIDIA

