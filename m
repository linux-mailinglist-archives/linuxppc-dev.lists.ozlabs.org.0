Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 981CEEE93D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 21:10:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476P7K1ZQwzF443
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 07:10:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqemgate14.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="a1s4cFm/"; 
 dkim-atps=neutral
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476P5Q2n0DzF42w
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 07:09:14 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc085690000>; Mon, 04 Nov 2019 12:09:14 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 04 Nov 2019 12:09:07 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 04 Nov 2019 12:09:07 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 Nov
 2019 20:09:05 +0000
Subject: Re: [PATCH v2 05/18] mm/gup: introduce pin_user_pages*() and FOLL_PIN
To: Jerome Glisse <jglisse@redhat.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-6-jhubbard@nvidia.com>
 <20191104173325.GD5134@redhat.com>
 <be9de35c-57e9-75c3-2e86-eae50904bbdf@nvidia.com>
 <20191104191811.GI5134@redhat.com>
 <e9656d47-b4a1-da8a-e8cc-ebcfb8cc06d6@nvidia.com>
 <20191104195248.GA7731@redhat.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <25ec4bc0-caaa-2a01-2ae7-2d79663a40e1@nvidia.com>
Date: Mon, 4 Nov 2019 12:09:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191104195248.GA7731@redhat.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1572898154; bh=AZ3ymuIlfRc3w4rthQkiIY3Jv3VQvtZMfCQrByMbt/I=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=a1s4cFm/krClFLPv0/gGIzoAubroBwrxV++jio7G263hv7Kqd894mJLgyr0Kykvfu
 E22eZRsWgS82IfVuknmQjT6loOqA9gwu9uWFSuwxGjrMpxiVLz3gspis/scqyrUM8C
 V6nOQNjxdOZQpCSi9tZuwj/NT7Qad5kYkY0U2dz2agukymc6b2UDmCgdrtVLwMy+f3
 QtSOoNDJwHdTVrVqqJcnOKhTpEZCUMCLI/PJyjZAopcsX3CoJLmMWVSKvLvEBN88aE
 +2SZRTKEAYlSxIg6b9bcQPtRuIkgnhRasSHve+6EqdhZWTSQoe8j4euTWFVlDE/iaG
 Y8A3JNrgij6ag==
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
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
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

Jason, a question for you at the bottom.

On 11/4/19 11:52 AM, Jerome Glisse wrote:
...
>> CASE 3: ODP
>> -----------
>> RDMA hardware with page faulting support. Here, a well-written driver doesn't
> 
> CASE3: Hardware with page fault support
> ---------------------------------------
> 
> Here, a well-written ....
> 

Ah, OK. So just drop the first sentence, yes.

...
>>>>>> +	 */
>>>>>> +	gup_flags |= FOLL_REMOTE | FOLL_PIN;
>>>>>
>>>>> Wouldn't it be better to not add pin_longterm_pages_remote() until
>>>>> it can be properly implemented ?
>>>>>
>>>>
>>>> Well, the problem is that I need each call site that requires FOLL_PIN
>>>> to use a proper wrapper. It's the FOLL_PIN that is the focus here, because
>>>> there is a hard, bright rule, which is: if and only if a caller sets
>>>> FOLL_PIN, then the dma-page tracking happens, and put_user_page() must
>>>> be called.
>>>>
>>>> So this leaves me with only two reasonable choices:
>>>>
>>>> a) Convert the call site as above: pin_longterm_pages_remote(), which sets
>>>> FOLL_PIN (the key point!), and leaves the FOLL_LONGTERM situation exactly
>>>> as it has been so far. When the FOLL_LONGTERM situation is fixed, the call
>>>> site *might* not need any changes to adopt the working gup.c code.
>>>>
>>>> b) Convert the call site to pin_user_pages_remote(), which also sets
>>>> FOLL_PIN, and also leaves the FOLL_LONGTERM situation exactly as before.
>>>> There would also be a comment at the call site, to the effect of, "this
>>>> is the wrong call to make: it really requires FOLL_LONGTERM behavior".
>>>>
>>>> When the FOLL_LONGTERM situation is fixed, the call site will need to be
>>>> changed to pin_longterm_pages_remote().
>>>>
>>>> So you can probably see why I picked (a).
>>>
>>> But right now nobody has FOLL_LONGTERM and FOLL_REMOTE. So you should
>>> never have the need for pin_longterm_pages_remote(). My fear is that
>>> longterm has implication and it would be better to not drop this implication
>>> by adding a wrapper that does not do what the name says.
>>>
>>> So do not introduce pin_longterm_pages_remote() until its first user
>>> happens. This is option c)
>>>
>>
>> Almost forgot, though: there is already another user: Infiniband:
>>
>> drivers/infiniband/core/umem_odp.c:646:         npages = pin_longterm_pages_remote(owning_process, owning_mm,
> 
> odp do not need that, i thought the HMM convertion was already upstream
> but seems not, in any case odp do not need the longterm case it only
> so best is to revert that user to gup_fast or something until it get
> converted to HMM.
> 

Note for Jason: the (a) or (b) items are talking about the vfio case, which is
one of the two call sites that now use pin_longterm_pages_remote(), and the
other one is infiniband:

drivers/infiniband/core/umem_odp.c:646:         npages = pin_longterm_pages_remote(owning_process, owning_mm,
drivers/vfio/vfio_iommu_type1.c:353:            ret = pin_longterm_pages_remote(NULL, mm, vaddr, 1,


Jerome, Jason: I really don't want to revert the put_page() to put_user_page() 
conversions that are already throughout the IB driver--pointless churn, right?
I'd rather either delete them in Jason's tree, or go with what I have here
while waiting for the deletion.

Maybe we should just settle on (a) or (b), so that the IB driver ends up with
the wrapper functions? In fact, if it's getting deleted, then I'd prefer leaving
it at (a), since that's simple...

Jason should weigh in on how he wants this to go, with respect to branching
and merging, since it sounds like that will conflict with the hmm branch 
(ha, I'm overdue in reviewing his mmu notifier series, that's what I get for
being late).

thanks,

John Hubbard
NVIDIA
