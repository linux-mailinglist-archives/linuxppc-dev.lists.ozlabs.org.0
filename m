Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA46FBC1E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 00:02:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47D0WY1qv0zF7MY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 10:02:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.64; helo=hqemgate15.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="mYe+MJkx"; 
 dkim-atps=neutral
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47D0S532W1zF5dn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 09:59:49 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcc8ade0000>; Wed, 13 Nov 2019 14:59:43 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 13 Nov 2019 14:59:43 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 13 Nov 2019 14:59:43 -0800
Received: from [10.2.160.107] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 22:59:43 +0000
Subject: Re: [PATCH v4 04/23] mm: devmap: refactor 1-based refcounting for
 ZONE_DEVICE pages
To: Dan Williams <dan.j.williams@intel.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-5-jhubbard@nvidia.com>
 <CAPcyv4gGu=G-c1czSAYJ3joTYS_ZYOJ6i9umKzCQEFzpwZMiiA@mail.gmail.com>
 <CAPcyv4hr64b-k4j7ZY796+k-+Dy11REMcvPJ+QjTsyJ3vSdfKg@mail.gmail.com>
 <00148078-1795-da3e-916e-3ae2dcdd553d@nvidia.com>
 <CAPcyv4iwG4V+sNLcOX4x-TA7W8MWNSEaZzupDgKh8btZMytoqg@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <8b887222-a1b4-c5ce-527a-5a6f2a73f943@nvidia.com>
Date: Wed, 13 Nov 2019 14:56:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4iwG4V+sNLcOX4x-TA7W8MWNSEaZzupDgKh8btZMytoqg@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573685983; bh=+Rmtc3S/dpjDCjZWKcpDoRZBPDTDBQ2pKKlWpjZisAo=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=mYe+MJkxrgNR137Q2ejzje6pRuep2M18oTZCivJor/Aq8akkqynarSLzze5gBAR6e
 Qbgg3D7fCX2h5Zp1bm8UCD5jTXu5RgNW/1wytp5sIWhpcH1/XVit7/Hqo1FuECTgjG
 jaeg32K4uRKA3UWevFbdUUXyjiUNrk/AfZUXltrSNK7fGabRHXeRaGFfre96i3rq7X
 ouT4NLlcMG8uUv2YW1+St8ZRhZhMfIq0xvEzPkblzu397MrZASgjNbz6jsR8uW1MwV
 7mOV3InoZ3RXAMS6XnUTdXbtUPhzTvW8KfaZYgbYIJ5ILNS37evrPk9qlwTKM1SE3y
 Yu1anxljvu1OQ==
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

On 11/13/19 2:55 PM, Dan Williams wrote:
> On Wed, Nov 13, 2019 at 2:49 PM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> On 11/13/19 2:00 PM, Dan Williams wrote:
>> ...
>>>> Ugh, when did all this HMM specific manipulation sneak into the
>>>> generic ZONE_DEVICE path? It used to be gated by pgmap type with its
>>>> own put_zone_device_private_page(). For example it's certainly
>>>> unnecessary and might be broken (would need to check) to call
>>>> mem_cgroup_uncharge() on a DAX page. ZONE_DEVICE users are not a
>>>> monolith and the HMM use case leaks pages into code paths that DAX
>>>> explicitly avoids.
>>>
>>> It's been this way for a while and I did not react previously,
>>> apologies for that. I think __ClearPageActive, __ClearPageWaiters, and
>>> mem_cgroup_uncharge, belong behind a device-private conditional. The
>>> history here is:
>>>
>>> Move some, but not all HMM specifics to hmm_devmem_free():
>>>       2fa147bdbf67 mm, dev_pagemap: Do not clear ->mapping on final put
>>>
>>> Remove the clearing of mapping since no upstream consumers needed it:
>>>       b7a523109fb5 mm: don't clear ->mapping in hmm_devmem_free
>>>
>>> Add it back in once an upstream consumer arrived:
>>>       7ab0ad0e74f8 mm/hmm: fix ZONE_DEVICE anon page mapping reuse
>>>
>>> We're now almost entirely free of ->page_free callbacks except for
>>> that weird nouveau case, can that FIXME in nouveau_dmem_page_free()
>>> also result in killing the ->page_free() callback altogether? In the
>>> meantime I'm proposing a cleanup like this:
>>
>>
>> OK, assuming this is acceptable (no obvious problems jump out at me,
>> and we can also test it with HMM), then how would you like to proceed, as
>> far as patches go: add such a patch as part of this series here, or as a
>> stand-alone patch either before or after this series? Or something else?
>> And did you plan on sending it out as such?
> 
> I think it makes sense to include it in your series since you're
> looking to refactor the implementation. I can send you one based on
> current linux-next as a lead-in cleanup before the refactor. Does that
> work for you?
> 

That would be perfect!

>>
>> Also, the diffs didn't quite make it through intact to my "git apply", so
>> I'm re-posting the diff in hopes that this time it survives:
> 
> Apologies for that. For quick "how about this" patch examples, I just
> copy and paste into gmail and it sometimes clobbers it.
> 

No problem at all, I do the same thing and *usually* it works. ha. And
as you say, it's good enough for discussions.


thanks,
-- 
John Hubbard
NVIDIA
