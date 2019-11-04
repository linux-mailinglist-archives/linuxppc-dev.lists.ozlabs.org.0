Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CE4EEAB1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 22:01:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476QG96WJvzDqw4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 08:01:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.64; helo=hqemgate15.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="lpq+hNDu"; 
 dkim-atps=neutral
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476Q9m5yh1zF3S3
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 07:58:04 +1100 (AEDT)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc090dd0000>; Mon, 04 Nov 2019 12:58:05 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 04 Nov 2019 12:58:00 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 04 Nov 2019 12:58:00 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 Nov
 2019 20:57:59 +0000
Subject: Re: [PATCH v2 05/18] mm/gup: introduce pin_user_pages*() and FOLL_PIN
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-6-jhubbard@nvidia.com>
 <20191104173325.GD5134@redhat.com>
 <be9de35c-57e9-75c3-2e86-eae50904bbdf@nvidia.com>
 <20191104191811.GI5134@redhat.com>
 <e9656d47-b4a1-da8a-e8cc-ebcfb8cc06d6@nvidia.com>
 <20191104195248.GA7731@redhat.com>
 <25ec4bc0-caaa-2a01-2ae7-2d79663a40e1@nvidia.com>
 <20191104203153.GB7731@redhat.com> <20191104203702.GG30938@ziepe.ca>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <d0890a8b-c349-0515-2570-10e83979836b@nvidia.com>
Date: Mon, 4 Nov 2019 12:57:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191104203702.GG30938@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1572901085; bh=EeK8bqsNfSA5i7MZV/85JI1lVmfCUv+TJ9yPJIg8GiI=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=lpq+hNDuPjPGBUnT+FF2AdBK4cieUl5iRoSXMbtLj+P8mC+Low0gZFUsCOCxgU9/5
 DdN9/T6chOJfP5oOBc8usBmdwuRtBNEQH4F7VlCn14TGG0/SlwreoVfvdvj6xqa7/3
 xeHneHSfMu5jFDq4HQuon77rSHBRD8GfWw0oGJaIFrobzmVoV/9zRJnxBAubrZjXN1
 WRTqAeLXVE2rRthei7hHQyxBdSu2WAGq/7R/BGkZOAo7GutRRc+/9GEeCURW6eoDae
 GFMlg2H2OK77XEEdt9PJrYvhIFYSBbOCAEQEdwBZOgkHGbaoMuenGmkX8oXc5haoCl
 DibI+5WsHAIGw==
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 linux-block@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/4/19 12:37 PM, Jason Gunthorpe wrote:
> On Mon, Nov 04, 2019 at 03:31:53PM -0500, Jerome Glisse wrote:
>>> Note for Jason: the (a) or (b) items are talking about the vfio case, which is
>>> one of the two call sites that now use pin_longterm_pages_remote(), and the
>>> other one is infiniband:
>>>
>>> drivers/infiniband/core/umem_odp.c:646:         npages = pin_longterm_pages_remote(owning_process, owning_mm,
>>> drivers/vfio/vfio_iommu_type1.c:353:            ret = pin_longterm_pages_remote(NULL, mm, vaddr, 1,
>>
>> vfio should be reverted until it can be properly implemented.
>> The issue is that when you fix the implementation you might
>> break vfio existing user and thus regress the kernel from user
>> point of view. So i rather have the change to vfio reverted,
>> i believe it was not well understood when it got upstream,
>> between in my 5.4 tree it is still gup_remote not longterm.
> 
> It is clearly a bug, vfio must use LONGTERM, and does right above this
> remote call:
> 
>         if (mm == current->mm) {
>                 ret = get_user_pages(vaddr, 1, flags | FOLL_LONGTERM, page,
>                                      vmas);
>         } else {
>                 ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags, page,
>                                             vmas, NULL);
> 
> 
> I'm not even sure that it really makes any sense to build a 'if' like
> that, surely just always call remote??
> 


Right, and I thought about this when converting, and realized that the above 
code is working around the current gup.c limitations, which are "cannot support
gup remote with FOLL_LONGTERM".

Given that observation, the code is getting itself some FOLL_LONGTERM support
for the non-remote case, and only hitting the limitation if the mm really is
non-current.

And if you look at my patch, it keeps the same behavior, while adding in the
new wrapper calls.

So...thoughts, preferences?


thanks,

John Hubbard
NVIDIA
