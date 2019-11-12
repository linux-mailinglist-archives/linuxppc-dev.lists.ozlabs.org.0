Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58174F9CFC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 23:26:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CMmS2f96zF5kl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 09:26:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.64; helo=hqemgate15.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="SCx0hF/2"; 
 dkim-atps=neutral
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CMk00bLgzF5cY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 09:24:39 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb31200000>; Tue, 12 Nov 2019 14:24:32 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 14:24:33 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 12 Nov 2019 14:24:33 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 22:24:32 +0000
Subject: Re: [PATCH v3 08/23] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
To: Dan Williams <dan.j.williams@intel.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
 <CAPcyv4hgKEqoxeQJH9R=YiZosvazj308Kk7jJA1NLxJkNenDcQ@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <471e513c-833f-2f8b-60db-5d9c56a8f766@nvidia.com>
Date: Tue, 12 Nov 2019 14:24:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4hgKEqoxeQJH9R=YiZosvazj308Kk7jJA1NLxJkNenDcQ@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573597472; bh=UAR1d5GKJU/1KahVmHwOR6A9jK9nwoB3wSa2dPf7qQ0=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=SCx0hF/22GHwsQWIhebJkJWfDE6W1v3w54kBd61ULtK+gIirCeDvEe+mYnEHJgwF3
 N309YgZ8A546WwB5IQMwcVMEM6bPuxfgNODHVHbvBgEiVWtLyxj0B398vc3JKHqHLW
 fYVbOfGFayiJTsvTBYUVssA0KXLzsSF47AIiXijFRvt1VZIYNmWsBao0fUMlxfVb9y
 FK/kGRlw4DPqDT/iEi5HrOqFBttHVHyJMVpOjnpKQsoAEutvLb0R76IcvAhSMz3Te2
 8LwQjMHLUXqcwuSETUK6U7GZZJxoHzli9rQ73NjcXdAxPWo6WYwRsOMHLimlMGza1W
 kJHm8uWG9iU5g==
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 bpf@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>,
 Jens Axboe <axboe@kernel.dk>, Netdev <netdev@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/12/19 1:57 PM, Dan Williams wrote:
...
>> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
>> index d864277ea16f..017689b7c32b 100644
>> --- a/drivers/vfio/vfio_iommu_type1.c
>> +++ b/drivers/vfio/vfio_iommu_type1.c
>> @@ -348,24 +348,20 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsigned long vaddr,
>>                 flags |= FOLL_WRITE;
>>
>>         down_read(&mm->mmap_sem);
>> -       if (mm == current->mm) {
>> -               ret = get_user_pages(vaddr, 1, flags | FOLL_LONGTERM, page,
>> -                                    vmas);
>> -       } else {
>> -               ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags, page,
>> -                                           vmas, NULL);
>> -               /*
>> -                * The lifetime of a vaddr_get_pfn() page pin is
>> -                * userspace-controlled. In the fs-dax case this could
>> -                * lead to indefinite stalls in filesystem operations.
>> -                * Disallow attempts to pin fs-dax pages via this
>> -                * interface.
>> -                */
>> -               if (ret > 0 && vma_is_fsdax(vmas[0])) {
>> -                       ret = -EOPNOTSUPP;
>> -                       put_page(page[0]);
>> -               }
>> +       ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags | FOLL_LONGTERM,
>> +                                   page, vmas, NULL);
> 
> Hmm, what's the point of passing FOLL_LONGTERM to
> get_user_pages_remote() if get_user_pages_remote() is not going to
> check the vma? I think we got to this code state because the

FOLL_LONGTERM is short-lived in this location, because patch 23 
("mm/gup: remove support for gup(FOLL_LONGTERM)") removes it, after
callers are changed over to pin_longterm_pages*().

So FOLL_LONGTERM is not doing much now, but it is basically a marker for
"change gup(FOLL_LONGTERM) to pin_longterm_pages()", and patch 18
actually makes that change.

And then pin_longterm_pages*() is, in turn, a way to mark all the 
places that need file system and/or user space interactions (layout
leases, etc), as per "Case 2: RDMA" in the new 
Documentation/vm/pin_user_pages.rst.

> get_user_pages() vs get_user_pages_remote() split predated the
> introduction of FOLL_LONGTERM.

Yes. And I do want clean this up as I go, so we don't end up with
stale concepts lingering in gup.c...

> 
> I think check_vma_flags() should do the ((FOLL_LONGTERM | FOLL_GET) &&
> vma_is_fsdax()) check and that would also remove the need for
> __gup_longterm_locked.
> 

Good idea, but there is still the call to check_and_migrate_cma_pages(), 
inside __gup_longterm_locked().  So it's a little more involved and
we can't trivially delete __gup_longterm_locked() yet, right?


thanks,
-- 
John Hubbard
NVIDIA
