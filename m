Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 679AAEB97E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 23:03:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473zq72N2wzF6GK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 09:03:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqemgate14.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="ikqeCXUq"; 
 dkim-atps=neutral
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473zmW41rTzDqQf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 09:01:14 +1100 (AEDT)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dbb59aa0000>; Thu, 31 Oct 2019 15:01:14 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 31 Oct 2019 15:01:08 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 31 Oct 2019 15:01:08 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 31 Oct
 2019 22:01:07 +0000
Subject: Re: [PATCH 02/19] mm/gup: factor out duplicate code from four routines
To: Ira Weiny <ira.weiny@intel.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-3-jhubbard@nvidia.com>
 <20191031183549.GC14771@iweiny-DESK2.sc.intel.com>
 <75b557f7-24b2-740c-2640-2f914d131600@nvidia.com>
 <20191031210954.GE14771@iweiny-DESK2.sc.intel.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <5cb84804-be12-82e8-11d8-7e593fd05619@nvidia.com>
Date: Thu, 31 Oct 2019 15:01:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191031210954.GE14771@iweiny-DESK2.sc.intel.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1572559274; bh=St3Rf/REgq/1do28NhYtGJF/+ie61nX3HJRKUe+Kv+8=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ikqeCXUqsTwoQB5CbB+62UgGOxuiKLZDrBsuVMEaD9IjjDxXb09OkVp8xOPRF5wct
 ee5DhXFx3ncNZEuTcZeSOQivxIJokuWUNeY+2vtv3ZOkk1HWJjkj1h2EH0AXlwb+WX
 k+12VWYeIpYnIAMc/9Jx/3qdPSGK+huRjsgTXXwezXTbb/FzDozYDlQdAsy+QX8f3z
 guPaB2LcynNr/sr3xHEr7wV68E214NkgY5BRukBI2Kt+YqGU/HP5jxWqLsbWsS/eGt
 xEDw4hf53LcGHOIM9YJEHjAqS/wG8o7OePI2ydIId+OliMRlMyINElUiwkTZonGlbb
 If9KlbJQJnB+Q==
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
 Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Aneesh Kumar
 K . V" <aneesh.kumar@linux.ibm.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/31/19 2:09 PM, Ira Weiny wrote:
> On Thu, Oct 31, 2019 at 11:43:37AM -0700, John Hubbard wrote:
>> On 10/31/19 11:35 AM, Ira Weiny wrote:
>>> On Wed, Oct 30, 2019 at 03:49:13PM -0700, John Hubbard wrote:
>> ...
>>>> +
>>>> +static int __huge_pt_done(struct page *head, int nr_recorded_pages, int *nr)
>>>> +{
>>>> +	*nr += nr_recorded_pages;
>>>> +	SetPageReferenced(head);
>>>> +	return 1;
>>>
>>> When will this return anything but 1?
>>>
>>
>> Never, but it saves a line at all four call sites, by having it return like that.
>>
>> I could see how maybe people would prefer to just have it be a void function,
>> and return 1 directly at the call sites. Since this was a lower line count I
>> thought maybe it would be slightly better, but it's hard to say really.
> 
> It is a NIT perhaps but I feel like the signature of a function should stand on
> it's own.  What this does is mix the meaning of this function with those
> calling it.  Which IMO is not good style.
> 
> We can see what others say.
> 

Sure. I'll plan on changing it to a void return type, then, unless someone else
pipes up.


thanks,

John Hubbard
NVIDIA
