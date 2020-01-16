Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A519213FB71
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 22:30:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zHRy4Wk6zDr8m
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 08:30:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqnvemgate24.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.a=rsa-sha256
 header.s=n1 header.b=B3a+nJMY; dkim-atps=neutral
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zG9g0F0pzDqgl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 07:33:26 +1100 (AEDT)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e20c8570000>; Thu, 16 Jan 2020 12:32:23 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 16 Jan 2020 12:33:20 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 16 Jan 2020 12:33:20 -0800
Received: from [10.2.160.8] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 Jan
 2020 20:33:19 +0000
Subject: Re: [PATCH v12 04/22] mm: devmap: refactor 1-based refcounting for
 ZONE_DEVICE pages
To: Christoph Hellwig <hch@infradead.org>
References: <20200107224558.2362728-1-jhubbard@nvidia.com>
 <20200107224558.2362728-5-jhubbard@nvidia.com>
 <20200115152306.GA19546@infradead.org>
 <4707f191-86f8-db4a-c3de-0a84b415b658@nvidia.com>
 <20200116093712.GA11011@infradead.org>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <ccf2723a-dcce-57d3-f63d-ee96dbf6653a@nvidia.com>
Date: Thu, 16 Jan 2020 12:30:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200116093712.GA11011@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1579206743; bh=EQpRDmAadXrYPrWI0G8MSYR7uqZas3jC8zZTGB2Hfnk=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=B3a+nJMY1e/PvYKAT7LBGlwa/kugx+AfoqbMvj/EyT3hxrpeJ7sQMsWMdJQlxzKho
 jy2YJ47pzKLca9QqrMI2qpXvMA46wU1dfzb3yzBY8NTIGraOJl+bg0Pq/59xdUBLNS
 /bnG7fSxkcGgsGNzlzCgQWOOUXWSDOgkuZxsp+8IlbnfinKUcliv6MqWXSulEsNyXv
 EIh2GmNEud9hkIp72ZuHMkWrhgwhMDnw4xjgxdJ2+W90cT6UoDxxzOl8PDPrjhQ9p0
 IklTRq4Mlrg+UVduRNOxi7jCeWI/98S5JYFUwVk8qaaNzULyUj0q2zlHy86g76FXcR
 ZxTytDejWJDcw==
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
 Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>,
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

On 1/16/20 1:37 AM, Christoph Hellwig wrote:
> On Wed, Jan 15, 2020 at 01:19:41PM -0800, John Hubbard wrote:
>> On 1/15/20 7:23 AM, Christoph Hellwig wrote:
>> ...
>>>
>>> I'm really not sold on this scheme.  Note that I think it is
>>> particularly bad, but it also doesn't seem any better than what
>>> we had before, and it introduced quite a bit more code.
>>>
>>
>> Hi Christoph,
>>
>> All by itself, yes. But the very next patch (which needs a little
>> rework for other reasons, so not included here) needs to reuse some of
>> these functions within __unpin_devmap_managed_user_page():
> 
> Well, then combine it with the series that actually does the change.


OK, that makes sense. I just double-checked with a quick test run, that it
doesn't have dependencies with the rest of this series, and it came out clean,
so:

Andrew, could you please remove just this one patch from mmotm and linux-next?


> 
> Also my vaguely recollection is that we had some idea on how to get rid
> of the off by one refcounting for the zone device pages, which would be
> a much better outcome.
> 

Yes, I recall that Dan Williams mentioned it, but I don't think he provided
any details yet.


thanks,
-- 
John Hubbard
NVIDIA
