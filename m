Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0111613CF35
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 22:36:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ygcf2hGNzDqS9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 08:36:18 +1100 (AEDT)
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
 header.s=n1 header.b=dbP5SmA0; dkim-atps=neutral
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ygZP2whzzDqQH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 08:34:20 +1100 (AEDT)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e1f85210000>; Wed, 15 Jan 2020 13:33:21 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 15 Jan 2020 13:34:16 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 15 Jan 2020 13:34:16 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jan
 2020 21:34:16 +0000
Subject: Re: [PATCH v12 11/22] mm/gup: introduce pin_user_pages*() and FOLL_PIN
To: Christoph Hellwig <hch@infradead.org>
References: <20200107224558.2362728-1-jhubbard@nvidia.com>
 <20200107224558.2362728-12-jhubbard@nvidia.com>
 <20200115153020.GF19546@infradead.org>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <1a0ee1db-5528-86a8-0713-3d820fbdf4ad@nvidia.com>
Date: Wed, 15 Jan 2020 13:34:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200115153020.GF19546@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1579124001; bh=87Rlq6x45ruVW7JTVYUJt0mWD3kN4xgsTUgpHaSTwOs=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=dbP5SmA0QfbUlmT548bubiJAkEQguNXb+B22BE0nnic910e/52B3pTFYwo0R9gnOk
 /mlFxNBraLMyXPTecP1trRDknv0CWyUqRUhn8AvgRKQEt/OrYnrlJ5ltQrtwu2/iZG
 uXyWe/Tp3/8o2BssD5h12JhA8/Qf+tvLIUVBAfdgHpiHf/vpXBUQ/a29w86sKWsdhS
 xLP+ysLSXK1OimxyU8GqDxRUN80ueCmWM+W82ScjqhN2l7u6YLSbkEfUVc40jSw+4n
 1alFBQ4/aOAizIIaeTPZN6p/1uIoYyQqWqSWRALwuOXb5xR9ZMfEIX7FqzbdBDPZRO
 IYaka2FAJgWiw==
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
 Mike Rapoport <rppt@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
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

On 1/15/20 7:30 AM, Christoph Hellwig wrote:
> On Tue, Jan 07, 2020 at 02:45:47PM -0800, John Hubbard wrote:
>> Introduce pin_user_pages*() variations of get_user_pages*() calls,
>> and also pin_longterm_pages*() variations.
>>
>> For now, these are placeholder calls, until the various call sites
>> are converted to use the correct get_user_pages*() or
>> pin_user_pages*() API.
> 
> What do the pure placeholders buy us?  The API itself looks ok,
> but until it actually is properly implemented it doesn't help at
> all, and we've had all kinds of bad experiences with these sorts
> of stub APIs.
> 

Hi Christoph,

Absolutely agreed, and in fact, after spending some time in this area I 
am getting a much better understanding of just how problematic "this will 
be used soon" APIs really are. However, this is not quite that case.

The following things make this different from a "pure placeholder" API:

1) These APIs are all exercised in the following patches in this series, 
unless I've overlooked one, and

2) The pages are actually tracked in the very next patch that I want to
post. That patch was posted as part of the v11 series [1], but 
Leon Romanovsky reported a problem with it, and so I'm going to add in
the ability to handle larger "pin" refcounts for the huge page cases.

Meanwhile, I wanted to get these long-simmering simpler preparatory
patches submitted, because it's clear that the API is unaffected by the
huge page refcount fix. (That fix will likely use the second struct page of
the compound page, to count up higher.)


[1] https://lore.kernel.org/r/20191216222537.491123-24-jhubbard@nvidia.com  
    [PATCH v11 23/25] mm/gup: track FOLL_PIN pages

thanks,
-- 
John Hubbard
NVIDIA
