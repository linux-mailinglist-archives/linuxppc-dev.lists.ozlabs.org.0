Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA141012EC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 06:19:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HDdT54tSzDqYB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 16:19:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqemgate14.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="HbjIjhLq"; 
 dkim-atps=neutral
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HDbf6JfXzDqM7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 16:17:34 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd37aeb0000>; Mon, 18 Nov 2019 21:17:32 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 18 Nov 2019 21:17:29 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 18 Nov 2019 21:17:29 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Nov
 2019 05:17:28 +0000
Subject: Re: [PATCH v5 10/24] mm/gup: introduce pin_user_pages*() and FOLL_PIN
To: Jan Kara <jack@suse.cz>
References: <20191115055340.1825745-1-jhubbard@nvidia.com>
 <20191115055340.1825745-11-jhubbard@nvidia.com>
 <20191118101601.GF17319@quack2.suse.cz>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <aa15a76f-7054-2db2-4a47-8fbe1594295a@nvidia.com>
Date: Mon, 18 Nov 2019 21:17:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191118101601.GF17319@quack2.suse.cz>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1574140652; bh=j4L4ESflFWPcWXUSa4QBFr0g8LzukvpI57j3tX0u+LI=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=HbjIjhLqDGlCz9fdO9WJ5XZ1MylRhdOt3hOrXOPV4rhTnQVDZpbMvOZlSwNGJc66E
 /dS/T8ygBehTtSzMJwZ3TOTHElFkCJKdPHvXGZaLpQt9mjPgsblK2PBNnMrg02Wmdh
 9Qm8oCkWiYkFORrigI0hEzL7aY7iY3cHZ1DrJYjhRQ5sx+Tmm0Tw8QlCh7Z2iKTLps
 yMslWIbYXkh6S/YZKISH7oHSmmR+hcZRdC+ZCjemhpD6kLdzSXTQ0ykjer3SCrjsmC
 1w7ai76vYnn+iNTaSLHytmXdlQYChVn5NpYDDm4H81+ayvHDf9eTllSFjtIJNz8Xoj
 cb1UR17mTvf1w==
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
 linux-rdma@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
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

On 11/18/19 2:16 AM, Jan Kara wrote:
> On Thu 14-11-19 21:53:26, John Hubbard wrote:
>>  /*
>> - * NOTE on FOLL_LONGTERM:
>> + * FOLL_PIN and FOLL_LONGTERM may be used in various combinations with each
>> + * other. Here is what they mean, and how to use them:
>>   *
>>   * FOLL_LONGTERM indicates that the page will be held for an indefinite time
>> - * period _often_ under userspace control.  This is contrasted with
>> - * iov_iter_get_pages() where usages which are transient.
>> + * period _often_ under userspace control.  This is in contrast to
>> + * iov_iter_get_pages(), where usages which are transient.
>                           ^^^ when you touch this, please fix also the
> second sentense. It doesn't quite make sense to me... I'd probably write
> there "whose usages are transient" but maybe you can come up with something
> even better.

Fixed, using your wording, as I didn't see any obvious improvements beyond that.



thanks,
-- 
John Hubbard
NVIDIA


> 
> Otherwise the patch looks good to me so feel free to add:
> 
> Reviewed-by: Jan Kara <jack@suse.cz>
> 
> 								Honza
> 
