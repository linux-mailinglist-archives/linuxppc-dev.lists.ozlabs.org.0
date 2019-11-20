Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6464103513
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 08:19:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HvFb6ywQzDqlf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 18:19:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65; helo=hqemgate16.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="cgfFkxVc"; 
 dkim-atps=neutral
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HvCQ6979zDqFJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 18:17:22 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd4e87e0000>; Tue, 19 Nov 2019 23:17:18 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 19 Nov 2019 23:17:17 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 19 Nov 2019 23:17:17 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 Nov
 2019 07:17:16 +0000
Subject: Re: [PATCH v6 17/24] mm/gup: track FOLL_PIN pages
To: Jan Kara <jack@suse.cz>
References: <20191119081643.1866232-1-jhubbard@nvidia.com>
 <20191119081643.1866232-18-jhubbard@nvidia.com>
 <20191119113746.GD25605@quack2.suse.cz>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <92d0385a-90be-e900-e5ec-1eeafd24ff81@nvidia.com>
Date: Tue, 19 Nov 2019 23:17:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191119113746.GD25605@quack2.suse.cz>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1574234238; bh=XS1elsnwWY0rNKRca94CapnxJDsibdDqnD818d/G+io=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=cgfFkxVckFKph83JpaLozX1BPV67pcDvc4zYdLq9ggt/6dUFhjSjEUfkPlJ6YS85y
 Tzbfkd2Ssh+1cnbHZVu22ZxAYWyCv1b8X10VXVS5hS2byaCvY0Vg9ipA7x3Fo3odW9
 mJ8QOlZhdrlbORb/tooq8lEuT6AxTt5cVxDPZE9pOLHClbe3whACaJnf15veA5FbxQ
 N7Z3c9PH3VSrAZwjy0whi7ko1Q5RU1C8PJUljAOR0JzSWQ7k8UX3NdOtoVh+QLcZ15
 DmGFCQcpIJbV8FkJKisaDhzEEJcucwABlIhBeXVZln5jK7XEYXo5n/Z8Yardu3zdea
 jFCxWfbFbwpdA==
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

On 11/19/19 3:37 AM, Jan Kara wrote:
> On Tue 19-11-19 00:16:36, John Hubbard wrote:
>> @@ -2025,6 +2149,20 @@ static int __record_subpages(struct page *page, unsigned long addr,
>>  	return nr;
>>  }
>>  
>> +static bool __pin_compound_head(struct page *head, int refs, unsigned int flags)
>> +{
> 
> I don't quite like the proliferation of names starting with __. I don't
> think there's a good reason for that, particularly in this case. Also 'pin'
> here is somewhat misleading as we already use term "pin" for the particular
> way of pinning the page. We could have grab_compound_head() or maybe
> nail_compound_head() :), but you're native speaker so you may come up with
> better word.


Yes, it is ugly naming, I'll change these as follows:

    __pin_compound_head() --> grab_compound_head()    
    __record_subpages()   --> record_subpages()

I loved the "nail_compound_head()" suggestion, it just seems very vivid, but
in the end, I figured I'd better keep it relatively drab and colorless. :)

> 
>> +	if (flags & FOLL_PIN) {
>> +		if (unlikely(!try_pin_compound_head(head, refs)))
>> +			return false;
>> +	} else {
>> +		head = try_get_compound_head(head, refs);
>> +		if (!head)
>> +			return false;
>> +	}
>> +
>> +	return true;
>> +}
>> +
>>  static void put_compound_head(struct page *page, int refs)
>>  {
>>  	/* Do a get_page() first, in case refs == page->_refcount */
> 
> put_compound_head() needs similar treatment as undo_dev_pagemap(), doesn't
> it?
> 

Yes, will fix that up.


>> @@ -968,7 +973,18 @@ struct page *follow_devmap_pmd(struct vm_area_struct *vma, unsigned long addr,
>>  	if (!*pgmap)
>>  		return ERR_PTR(-EFAULT);
>>  	page = pfn_to_page(pfn);
>> -	get_page(page);
>> +
>> +	if (flags & FOLL_GET)
>> +		get_page(page);
>> +	else if (flags & FOLL_PIN) {
>> +		/*
>> +		 * try_pin_page() is not actually expected to fail here because
>> +		 * we hold the pmd lock so no one can unmap the pmd and free the
>> +		 * page that it points to.
>> +		 */
>> +		if (unlikely(!try_pin_page(page)))
>> +			page = ERR_PTR(-EFAULT);
>> +	}
> 
> This pattern is rather common. So maybe I'd add a helper grab_page(page,
> flags) doing
> 
> 	if (flags & FOLL_GET)
> 		get_page(page);
> 	else if (flags & FOLL_PIN)
> 		return try_pin_page(page);
> 	return true;
> 

OK.

> Otherwise the patch looks good to me now.
> 
> 								Honza

Great! I thought I'd have a v7 out today, but fate decided to have me repair
my test machine instead. So, soon. ha. :)

thanks,
-- 
John Hubbard
NVIDIA
