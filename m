Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A69126F9A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 22:18:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47f4Vp60VyzDqqY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2019 08:18:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65;
 helo=hqnvemgate26.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="DpAgGRtL"; 
 dkim-atps=neutral
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47f4Sh5bxBzDqBm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2019 08:16:52 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dfbe8b30000>; Thu, 19 Dec 2019 13:16:35 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 19 Dec 2019 13:16:45 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 19 Dec 2019 13:16:45 -0800
Received: from [10.2.165.11] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Dec
 2019 21:16:42 +0000
Subject: Re: [PATCH v11 00/25] mm/gup: track dma-pinned pages: FOLL_PIN
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191219132607.GA410823@unreal>
 <a4849322-8e17-119e-a664-80d9f95d850b@nvidia.com>
 <20191219210743.GN17227@ziepe.ca>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <42a3e5c1-6301-db0b-5d09-212edf5ecf2a@nvidia.com>
Date: Thu, 19 Dec 2019 13:13:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191219210743.GN17227@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576790195; bh=e+stzM4MKJvMbnHvF2MQtGYZPTDUXmhAC++H/dKblxU=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=DpAgGRtLU03goQ45lwT7ONh8PGmHo2uEl58mvIXxDE1nHXoSem5kfykU7etb/JcJL
 /yvdQuNedqWs+SUfVSLa4E60NrM+DSMnCAe2ItTu7yCQ5BHkbAsDg8Mpyow9MA1pYC
 3jVYe0GuNI9xJv3hjbBlrnChECIJB3Q5siLf6V5xGWCqbhXjMLlDdPH405dRvVKPVH
 0B/YfWOP+8DomZJl09OCXT8zLxeag4uByq64+u082UEQpj/kDFhFOsIPO4HgJs9I5d
 GI+vJAY5OMeBcbGVYpOeSe0O73rRuIYou0nCs6Mvptf4ghAI7UtlU7flZFGsoZAujM
 ZE4962uBaaz9A==
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
 Maor Gottlieb <maorg@mellanox.com>, Leon Romanovsky <leon@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex
 Williamson <alex.williamson@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/19/19 1:07 PM, Jason Gunthorpe wrote:
> On Thu, Dec 19, 2019 at 12:30:31PM -0800, John Hubbard wrote:
>> On 12/19/19 5:26 AM, Leon Romanovsky wrote:
>>> On Mon, Dec 16, 2019 at 02:25:12PM -0800, John Hubbard wrote:
>>>> Hi,
>>>>
>>>> This implements an API naming change (put_user_page*() -->
>>>> unpin_user_page*()), and also implements tracking of FOLL_PIN pages. It
>>>> extends that tracking to a few select subsystems. More subsystems will
>>>> be added in follow up work.
>>>
>>> Hi John,
>>>
>>> The patchset generates kernel panics in our IB testing. In our tests, we
>>> allocated single memory block and registered multiple MRs using the single
>>> block.
>>>
>>> The possible bad flow is:
>>>    ib_umem_geti() ->
>>>     pin_user_pages_fast(FOLL_WRITE) ->
>>>      internal_get_user_pages_fast(FOLL_WRITE) ->
>>>       gup_pgd_range() ->
>>>        gup_huge_pd() ->
>>>         gup_hugepte() ->
>>>          try_grab_compound_head() ->
>>
>> Hi Leon,
>>
>> Thanks very much for the detailed report! So we're overflowing...
>>
>> At first look, this seems likely to be hitting a weak point in the
>> GUP_PIN_COUNTING_BIAS-based design, one that I believed could be deferred
>> (there's a writeup in Documentation/core-api/pin_user_page.rst, lines
>> 99-121). Basically it's pretty easy to overflow the page->_refcount
>> with huge pages if the pages have a *lot* of subpages.
>>
>> We can only do about 7 pins on 1GB huge pages that use 4KB subpages.
> 
> Considering that establishing these pins is entirely under user
> control, we can't have a limit here.

There's already a limit, it's just a much larger one. :) What does "no limit"
really mean, numerically, to you in this case?

> 
> If the number of allowed pins are exhausted then the
> pin_user_pages_fast() must fail back to the user.


I'll poke around the IB call stack and see how much of that return path
is in place, if any. Because it's the same situation for get_user_pages_fast().
This code just added a warning on overflow so we could spot it early.

> 
>> 3. It would be nice if I could reproduce this. I have a two-node mlx5 Infiniband
>> test setup, but I have done only the tiniest bit of user space IB coding, so
>> if you have any test programs that aren't too hard to deal with that could
>> possibly hit this, or be tweaked to hit it, I'd be grateful. Keeping in mind
>> that I'm not an advanced IB programmer. At all. :)
> 
> Clone this:
> 
> https://github.com/linux-rdma/rdma-core.git
> 
> Install all the required deps to build it (notably cython), see the README.md
> 
> $ ./build.sh
> $ build/bin/run_tests.py
> 
> If you get things that far I think Leon can get a reproduction for you
> 

OK, here goes.

thanks,
-- 
John Hubbard
NVIDIA
