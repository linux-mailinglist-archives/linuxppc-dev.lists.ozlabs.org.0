Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 050D4105C5D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 22:54:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JtdC07K5zDr6w
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 08:54:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqemgate14.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="KYGZRjKv"; 
 dkim-atps=neutral
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JtZq4Jf2zDr69
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 08:52:35 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd707210000>; Thu, 21 Nov 2019 13:52:33 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 21 Nov 2019 13:52:30 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 21 Nov 2019 13:52:30 -0800
Received: from [10.2.168.213] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Nov
 2019 21:52:28 +0000
Subject: Re: [PATCH v7 09/24] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
To: Alex Williamson <alex.williamson@redhat.com>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
 <20191121071354.456618-10-jhubbard@nvidia.com>
 <20191121143525.50deb72f@x1.home>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <b5ae788a-58a9-de93-f65e-e4d9c0632dc9@nvidia.com>
Date: Thu, 21 Nov 2019 13:49:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191121143525.50deb72f@x1.home>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1574373153; bh=oGhbv3cXo8o4GZ8PnxP5Ux4y8AE3jGJR4EeVDVjoVEc=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=KYGZRjKvtxip9P6ifb3Te8PpgvFSTRruWhwxOgXb0S114oVSZskeO+iOWdCneQvB4
 NA5CKwViDqqMCzmcEtuXOzx5kWlGm/CdhdbD7x7k9Kx6Vh5kQFWAggEn8hm5nSetjo
 GsuEs2bguAasb3kn7+569g/s+OYwxg2N/laFgRqUcYIkUaXO+dKZ1vX7QBvKE7iuhN
 xdX8E7mSGSvk8taZzTl3l1tHACe5K5QgYBxfNvJAXLPet5p3Tx/OKYiHGukBzXFPA8
 pg/kE+aDZRuWuc8KSGeIQ8zVRFi/6q/Cd2RICjjhHLzCf4ZbZMZG9XJoZELTlTOned
 7+K+fSUD3HTWw==
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
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jason Gunthorpe <jgg@mellanox.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
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

On 11/21/19 1:35 PM, Alex Williamson wrote:
> On Wed, 20 Nov 2019 23:13:39 -0800
> John Hubbard <jhubbard@nvidia.com> wrote:
> 
>> As it says in the updated comment in gup.c: current FOLL_LONGTERM
>> behavior is incompatible with FAULT_FLAG_ALLOW_RETRY because of the
>> FS DAX check requirement on vmas.
>>
>> However, the corresponding restriction in get_user_pages_remote() was
>> slightly stricter than is actually required: it forbade all
>> FOLL_LONGTERM callers, but we can actually allow FOLL_LONGTERM callers
>> that do not set the "locked" arg.
>>
>> Update the code and comments accordingly, and update the VFIO caller
>> to take advantage of this, fixing a bug as a result: the VFIO caller
>> is logically a FOLL_LONGTERM user.
>>
>> Also, remove an unnessary pair of calls that were releasing and
>> reacquiring the mmap_sem. There is no need to avoid holding mmap_sem
>> just in order to call page_to_pfn().
>>
>> Also, move the DAX check ("if a VMA is DAX, don't allow long term
>> pinning") from the VFIO call site, all the way into the internals
>> of get_user_pages_remote() and __gup_longterm_locked(). That is:
>> get_user_pages_remote() calls __gup_longterm_locked(), which in turn
>> calls check_dax_vmas(). It's lightly explained in the comments as well.
>>
>> Thanks to Jason Gunthorpe for pointing out a clean way to fix this,
>> and to Dan Williams for helping clarify the DAX refactoring.
>>
>> Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
>> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
>> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
>> Cc: Dan Williams <dan.j.williams@intel.com>
>> Cc: Jerome Glisse <jglisse@redhat.com>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>   drivers/vfio/vfio_iommu_type1.c | 30 +++++-------------------------
>>   mm/gup.c                        | 27 ++++++++++++++++++++++-----
>>   2 files changed, 27 insertions(+), 30 deletions(-)
> 
> Tested with device assignment and Intel mdev vGPU assignment with QEMU
> userspace:
> 
> Tested-by: Alex Williamson <alex.williamson@redhat.com>
> Acked-by: Alex Williamson <alex.williamson@redhat.com>
> 
> Feel free to include for 19/24 as well.  Thanks,
> 
> Alex


Great! Thanks for the testing and ack on those. I'm about to repackage
(and split up as CH requested) for 5.5, and will keep you on CC, of course.

thanks,
-- 
John Hubbard
NVIDIA
