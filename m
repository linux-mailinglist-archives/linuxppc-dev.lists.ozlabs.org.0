Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5753731F613
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 09:52:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhlhX2v1Wz3cRZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 19:52:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com;
 envelope-from=dingtianhong@huawei.com; receiver=<UNKNOWN>)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dhlh96chYz30KW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 19:52:21 +1100 (AEDT)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Dhldj4s0gzlMgR;
 Fri, 19 Feb 2021 16:50:17 +0800 (CST)
Received: from [10.174.177.80] (10.174.177.80) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Fri, 19 Feb 2021 16:52:05 +0800
Subject: Re: [PATCH v12 13/14] mm/vmalloc: Hugepage vmalloc mappings
To: Nicholas Piggin <npiggin@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, <linux-mm@kvack.org>
References: <20210202110515.3575274-1-npiggin@gmail.com>
 <20210202110515.3575274-14-npiggin@gmail.com>
 <e18ef38c-ecef-b15c-29b1-bd4acf0e7fe5@huawei.com>
 <1613720396.pnvmwaa8om.astroid@bobo.none>
From: Ding Tianhong <dingtianhong@huawei.com>
Message-ID: <913cd34a-453c-ae66-ff87-4b0c74c98eb6@huawei.com>
Date: Fri, 19 Feb 2021 16:52:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <1613720396.pnvmwaa8om.astroid@bobo.none>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.80]
X-CFilter-Loop: Reflected
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021/2/19 15:45, Nicholas Piggin wrote:
> Excerpts from Ding Tianhong's message of February 19, 2021 1:45 pm:
>> Hi Nicholas:
>>
>> I met some problem for this patch, like this:
>>
>> kva = vmalloc(3*1024k);
>>
>> remap_vmalloc_range(xxx, kva, xxx)
>>
>> It failed because that the check for page_count(page) is null so return, it break the some logic for current modules.
>> because the new huge page is not valid for composed page.
> 
> Hey Ding, that's a good catch. How are you testing this stuff, do you 
> have a particular driver that does this?
> 

yes, The driver would get a memory from the vmalloc in kernel space, and then the physical same memory will mmap to the user space. The drivers could not work when applying this patch.

>> I think some guys really don't get used to the changes for the vmalloc that the small pages was transparency to the hugepage
>> when the size is bigger than the PMD_SIZE.
> 
> I think in this case vmalloc could allocate the large page as a compound
> page which would solve this problem I think? (without having actually 
> tested it)
> 

yes, i think the __GFP_COMP flag could fix this.

>> can we think about give a new static huge page to fix it? just like use a a new vmalloc_huge_xxx function to disginguish the current function,
>> the user could choose to use the transparent hugepage or static hugepage for vmalloc.
> 
> Yeah that's a good question, there are a few things in the huge vmalloc 
> code that accounts things as small pages and you can't assume large or 
> small. If there is benefit from forcing large pages that could certainly
> be added.
> 

The vmalloc transparent is good, but not fit every user scenes, some guys like to use the deterministic function
for performance critical area.

Thanks
Ding

> Interestingly, remap_vmalloc_range in theory could map the pages as 
> large in userspace as well. That takes more work but if something
> really needs that for performance, it could be done.
> 
> Thanks,
> Nick
> .
> 

