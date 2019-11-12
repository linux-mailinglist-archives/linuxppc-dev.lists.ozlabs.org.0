Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAF8F9B9C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 22:13:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CL7N0g8WzDrHb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 08:13:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65; helo=hqemgate16.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="XDTPGbX/"; 
 dkim-atps=neutral
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CL4s6dFlzF5hW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 08:10:53 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb1fa00000>; Tue, 12 Nov 2019 13:09:52 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 13:10:48 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 12 Nov 2019 13:10:48 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 21:10:47 +0000
Subject: Re: [PATCH v3 00/23] mm/gup: track dma-pinned pages: FOLL_PIN,
 FOLL_LONGTERM
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112203802.GD5584@ziepe.ca>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <02fa935c-3469-b766-b691-5660084b60b9@nvidia.com>
Date: Tue, 12 Nov 2019 13:10:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191112203802.GD5584@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573592992; bh=FYNiQqIIwAjaPTLdgZDFjzpc3PZA+IOd8Qzq/L3NYFI=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=XDTPGbX/pfLSLEPMZj0U4ST8nWeqLQb9L0gJo2fojuRXhn2sbJZCbDvwG00vq+XIQ
 colylZtLpZg40dx1ABr6UMyL7nDz+Ko0zZq5udmfA2v8o8KV6jbQ8nMJaMjSxXz3jT
 /IQas6U39IMXowKsu+Lp15YvwNvsj9I4GEW1qSNrdbdQur8MbFNPpL74slNbnNTKiw
 2tvXn1JIXwNPZ2+bJmHJ2nQzCpfl0RwWLH4Y7hj0SisnidmxgFdWv36tY7VU9S2345
 uRxyqWTOY6lQqCfoY1uSgUmsGBjI6laWSw8oWM5BJSMXcH/MubF7tkJ0NoA3AfLsvB
 eNrIf7Db8lhiQ==
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
 Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
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

On 11/12/19 12:38 PM, Jason Gunthorpe wrote:
> On Mon, Nov 11, 2019 at 04:06:37PM -0800, John Hubbard wrote:
>> Hi,
>>
>> The cover letter is long, so the more important stuff is first:
>>
>> * Jason, if you or someone could look at the the VFIO cleanup (patch 8)
>>   and conversion to FOLL_PIN (patch 18), to make sure it's use of
>>   remote and longterm gup matches what we discussed during the review
>>   of v2, I'd appreciate it.
>>
>> * Also for Jason and IB: as noted below, in patch 11, I am (too?) boldly
>>   converting from put_user_pages() to release_pages().
> 
> Why are we doing this? I think things got confused here someplace, as


Because:

a) These need put_page() calls,  and

b) there is no put_pages() call, but there is a release_pages() call that
is, arguably, what put_pages() would be.


> the comment still says:
> 
> /**
>  * put_user_page() - release a gup-pinned page
>  * @page:            pointer to page to be released
>  *
>  * Pages that were pinned via get_user_pages*() must be released via
>  * either put_user_page(), or one of the put_user_pages*() routines
>  * below.


Ohhh, I missed those comments. They need to all be changed over to
say "pages that were pinned via pin_user_pages*() or 
pin_longterm_pages*() must be released via put_user_page*()."

The get_user_pages*() pages must still be released via put_page.

The churn is due to a fairly significant change in strategy, whis
is: instead of changing all get_user_pages*() sites to call 
put_user_page(), change selected sites to call pin_user_pages*() or 
pin_longterm_pages*(), plus put_user_page().

That allows incrementally converting the kernel over to using the
new pin APIs, without taking on the huge risk of a big one-shot
conversion. 

So, I've ended up with one place that actually needs to get reverted
back to get_user_pages(), and that's the IB ODP code.

> 
> I feel like if put_user_pages() is not the correct way to undo
> get_user_pages() then it needs to be deleted.
> 

Yes, you're right. I'll fix the put_user_page comments() as described.


thanks,

John Hubbard
NVIDIA
