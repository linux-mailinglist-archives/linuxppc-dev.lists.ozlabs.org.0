Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08041F9D55
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 23:45:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CN9Y3zdfzF3XB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 09:45:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65; helo=hqemgate16.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="k73DbqVF"; 
 dkim-atps=neutral
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CN7C3sZNzDqm6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 09:43:02 +1100 (AEDT)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb353a0000>; Tue, 12 Nov 2019 14:42:02 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 14:42:58 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 12 Nov 2019 14:42:58 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 22:42:57 +0000
Subject: Re: [PATCH v3 08/23] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
 <20191112204338.GE5584@ziepe.ca>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <0db36e86-b779-01af-77e7-469af2a2e19c@nvidia.com>
Date: Tue, 12 Nov 2019 14:42:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191112204338.GE5584@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573598522; bh=Y5yk8f3O0SqpmKkLqVvRBWCkW319hAOZ+63Twi/leN0=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=k73DbqVF1ro4BGXqtoOXY8+RqyGGe2g09YDUx2SX8XytMdTG+dmOpX+jHtYX3sy0m
 jqRakpKDfOE8+KOF078kMgEWeRTrM64RVzrIc5oOooDxqIVboTzwD8VSvvTsbdqRvZ
 VUfhjLhHIl5v6iMhsEkxxPV8LaL6dE8RS69ywE4DWS3/QelSGNxpH0rJ4kmEm//y+p
 XXB4Gdx5hRr2SYYAicrcdd+BO7VysNir33yZ/MmfzzivcmZz0JpK+nUr9PhYe4icqS
 koYHksTWwDMw0phfipFOQbYisXKLuZUJMy7LSz/++6j9kUwwcPzjslXYFXKOkRwY0a
 JDLTwENrLW26A==
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

On 11/12/19 12:43 PM, Jason Gunthorpe wrote:
...
>> -		}
>> +	ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags | FOLL_LONGTERM,
>> +				    page, vmas, NULL);
>> +	/*
>> +	 * The lifetime of a vaddr_get_pfn() page pin is
>> +	 * userspace-controlled. In the fs-dax case this could
>> +	 * lead to indefinite stalls in filesystem operations.
>> +	 * Disallow attempts to pin fs-dax pages via this
>> +	 * interface.
>> +	 */
>> +	if (ret > 0 && vma_is_fsdax(vmas[0])) {
>> +		ret = -EOPNOTSUPP;
>> +		put_page(page[0]);
>>  	}
> 
> AFAIK this chunk is redundant now as it is some hack to emulate
> FOLL_LONGTERM? So vmas can be deleted too.

Let me first make sure I understand what Dan has in mind for the vma
checking, in the other thread...

> 
> Also unclear why this function has this:
> 
>         up_read(&mm->mmap_sem);
> 
>         if (ret == 1) {
>                 *pfn = page_to_pfn(page[0]);
>                 return 0;
>         }
> 
>         down_read(&mm->mmap_sem);
> 

Yes, that's really odd. It's not good to release and retake the lock
anyway in general (without re-checking things), and  certainly it is
not required to release mmap_sem in order to call page_to_pfn().

I've removed that up_read()/down_read() pair, for v4.


thanks,
-- 
John Hubbard
NVIDIA
