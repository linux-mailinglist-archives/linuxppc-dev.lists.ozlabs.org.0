Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A242FB9B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 21:24:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Cx152tRvzF5YZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 07:24:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.64; helo=hqemgate15.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="n1t9MMHi"; 
 dkim-atps=neutral
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Cwyr1ccKzF7Bg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 07:22:43 +1100 (AEDT)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcc660b0000>; Wed, 13 Nov 2019 12:22:35 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 13 Nov 2019 12:22:36 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 13 Nov 2019 12:22:36 -0800
Received: from [10.2.160.107] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 20:22:35 +0000
Subject: Re: [PATCH v4 08/23] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
To: Ira Weiny <ira.weiny@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-9-jhubbard@nvidia.com>
 <20191113130202.GA26068@ziepe.ca>
 <20191113191705.GE12947@iweiny-DESK2.sc.intel.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <290ba4aa-247e-6570-9eff-ccf2087e1120@nvidia.com>
Date: Wed, 13 Nov 2019 12:19:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191113191705.GE12947@iweiny-DESK2.sc.intel.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573676555; bh=FW0krwPwWqciO/Z2LS4wGz5Cikl4rg4mIFXWQ1mXpqU=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=n1t9MMHier43EuFZpftpwQVDKG8oSo9TdOvV+OMzrOIN0Kprv6dkR4Jpu6/PqCqXm
 /jCxLMJDxPPXF7oklQ45MeW/Fl3jyAJJ4cfyLvk1YJ3ZXQloakTUN/6QsjTZ2e8wLd
 Vi5ItQz0+ykvg9G6LEUGgX0gLMaFmq2awJU2Kk5qVpihlMSAmAuGK9LjnFEEtlsHOE
 JOaWrzJR8vtoHRO1QeIa0YnKmF32io8xAGlhrbiuGj5eUhM/rh5jJ0AdTIvnBhqGbA
 tSsPrYCj4XsKBHj/d5S4XMsaWdBoBg5n+7WnTPKexUFAUitbBsugmf2TNoS/6cs3Dr
 dZibHSHNj0z1Q==
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
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, linux-block@vger.kernel.org,
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

On 11/13/19 11:17 AM, Ira Weiny wrote:
...
>>> @@ -348,33 +347,13 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsigned long vaddr,
>>>   		flags |= FOLL_WRITE;
>>>   
>>>   	down_read(&mm->mmap_sem);
>>> -	if (mm == current->mm) {
>>> -		ret = get_user_pages(vaddr, 1, flags | FOLL_LONGTERM, page,
>>> -				     vmas);
>>> -	} else {
>>> -		ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags, page,
>>> -					    vmas, NULL);
>>> -		/*
>>> -		 * The lifetime of a vaddr_get_pfn() page pin is
>>> -		 * userspace-controlled. In the fs-dax case this could
>>> -		 * lead to indefinite stalls in filesystem operations.
>>> -		 * Disallow attempts to pin fs-dax pages via this
>>> -		 * interface.
>>> -		 */
>>> -		if (ret > 0 && vma_is_fsdax(vmas[0])) {
>>> -			ret = -EOPNOTSUPP;
>>> -			put_page(page[0]);
>>> -		}
>>> -	}
>>> -	up_read(&mm->mmap_sem);
>>> -
>>> +	ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags | FOLL_LONGTERM,
>>> +				    page, NULL, NULL);
>>>   	if (ret == 1) {
>>>   		*pfn = page_to_pfn(page[0]);
>>>   		return 0;
>>
>> Mind the return with the lock held this needs some goto unwind
> 
> Ah yea...  retract my reviewed by...  :-(
> 

ooops, embarrassed that I missed that, good catch. Will repost with it fixed.



thanks,
-- 
John Hubbard
NVIDIA

