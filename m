Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50688125698
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 23:22:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dTyj4w4VzDqk5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 09:22:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.64;
 helo=hqnvemgate25.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="UZ8jBMwY"; 
 dkim-atps=neutral
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dTtN4BF8zDqkZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 09:18:36 +1100 (AEDT)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dfaa5ad0000>; Wed, 18 Dec 2019 14:18:21 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 18 Dec 2019 14:18:31 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 18 Dec 2019 14:18:31 -0800
Received: from [10.2.165.11] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Dec
 2019 22:18:30 +0000
Subject: Re: [PATCH v11 06/25] mm: fix get_user_pages_remote()'s handling of
 FOLL_LONGTERM
To: "Kirill A. Shutemov" <kirill@shutemov.name>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191216222537.491123-7-jhubbard@nvidia.com>
 <20191218161907.yczbijr3ngm7wwnj@box>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <c8d746ff-f544-6c9f-110b-215514fb4b5c@nvidia.com>
Date: Wed, 18 Dec 2019 14:15:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191218161907.yczbijr3ngm7wwnj@box>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576707501; bh=sxjwJVdMWX10qxIPxn4THVxS9SYzoQiX2+nIJ9/LG7I=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=UZ8jBMwY32NgWwiJjZwTAPW3ja6CuPOAfe4SpG+9/CDwknPqX5qccd7q+WCVa0kre
 Av1FM/rgDWBJQowSF6blVYewBi40/EoGKov0KLTmsD25hxZXVoFAuUTjqD9AjunTuW
 zOw8acZ6PbPZg9ggfzbvjmuiESVGaX+/zsYCSMAQZrWJGMuf5ikxNna4ygsE1Jk8cJ
 dHbTfbTsY5cfH+d0VRIX71N/Dllb+k91MxmporXWGxV5JQ3DVwfnyQEVBsHmZwuyup
 I9epWsR1kc8VLnGg3SRALlsRj1gICz0/x78ascTmPUjlda17XHeoBT+12qtVoXpcGN
 AwPIbnNqxY2bw==
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
 Jason Gunthorpe <jgg@mellanox.com>, Vlastimil Babka <vbabka@suse.cz>,
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

On 12/18/19 8:19 AM, Kirill A. Shutemov wrote:
...
>> diff --git a/mm/gup.c b/mm/gup.c
>> index 3ecce297a47f..c0c56888e7cc 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -29,6 +29,13 @@ struct follow_page_context {
>>   	unsigned int page_mask;
>>   };
>>   
>> +static __always_inline long __gup_longterm_locked(struct task_struct *tsk,
>> +						  struct mm_struct *mm,
>> +						  unsigned long start,
>> +						  unsigned long nr_pages,
>> +						  struct page **pages,
>> +						  struct vm_area_struct **vmas,
>> +						  unsigned int flags);
> 
> Any particular reason for the forward declaration? Maybe move
> get_user_pages_remote() down?
> 

Yes, that's exactly why: I was thinking it would be cleaner to put in the
forward declaration, rather than moving code blocks, but either way seems
reasonable. I'll go ahead and move the code blocks and delete the forward
declaration, now that someone has weighed in in favor of that.

thanks,
-- 
John Hubbard
NVIDIA
