Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF578C40A1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 21:07:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jTL727tTzDqMl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 05:07:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nvidia.com
 (client-ip=216.228.121.65; helo=hqemgate16.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="sFKmagTn"; 
 dkim-atps=neutral
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jTGS60mQzDqFS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 05:04:32 +1000 (AEST)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d93a33d0000>; Tue, 01 Oct 2019 12:04:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 01 Oct 2019 12:04:29 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 01 Oct 2019 12:04:29 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 1 Oct
 2019 19:04:28 +0000
Received: from [10.110.48.28] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 1 Oct 2019
 19:04:28 +0000
Subject: Re: [PATCH v4 03/11] mm/gup: Applies counting method to monitor
 gup_pgd_range
To: Leonardo Bras <leonardo@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>, <kvm-ppc@vger.kernel.org>,
 <linux-arch@vger.kernel.org>, <linux-mm@kvack.org>
References: <20190927234008.11513-1-leonardo@linux.ibm.com>
 <20190927234008.11513-4-leonardo@linux.ibm.com>
 <ce0a4110-9f83-36db-dc85-6a727d30d030@nvidia.com>
 <2cebe169221ae9270963d4bc4fd8e43066745f98.camel@linux.ibm.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <a5e86058-7950-b832-b042-8cc864de761d@nvidia.com>
Date: Tue, 1 Oct 2019 12:04:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2cebe169221ae9270963d4bc4fd8e43066745f98.camel@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1569956669; bh=mU2o66EzpiKq/VTOcPIA3Ya6nMDGuoufi0g71k1FY5k=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=sFKmagTnvrqulDybiAEutlUnORPR4yV0qiLmx94LqM0/kVZd+OSM9/3klZd40UgBO
 7NsbvQGccOcm6Ar12WMXwvIKC6L9sj/9SYQrzJC+Dz+vB0rAMpZ0Onh/Ip9Xjzks8s
 mjkAk4LdHJ8dfB+Imob53rBQzTt+G+1Sbfs/MCPsqLLU141T5k2gPk/SFIwER/bars
 PSXpJw6U6xQKG1L+itgn9d8sn5ia8AYdBkIJFDpHuo+FFV5BQc7tgvcIDKvDhmx+4E
 hHTFu34yHmbOrnUfFk7G9KE5ZyKUA5uVBg9YKtMgQmstkM506MWpQasXlrHCO9cWRA
 fLwbBnh4IVlVg==
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 YueHaibing <yuehaibing@huawei.com>, Nicholas
 Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Keith Busch <keith.busch@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Allison Randal <allison@lohutok.net>, Mahesh
 Salgaonkar <mahesh@linux.vnet.ibm.com>, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ira Weiny <ira.weiny@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/1/19 10:56 AM, Leonardo Bras wrote:
> On Mon, 2019-09-30 at 14:51 -0700, John Hubbard wrote:
>> On 9/27/19 4:40 PM, Leonardo Bras wrote:
...
>>> diff --git a/mm/gup.c b/mm/gup.c
>>> index 98f13ab37bac..7105c829cf44 100644
>>> --- a/mm/gup.c
>>> +++ b/mm/gup.c
>>> @@ -2325,6 +2325,7 @@ static bool gup_fast_permitted(unsigned long start, unsigned long end)
>>>  int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
>>>  			  struct page **pages)
>>>  {
>>> +	struct mm_struct *mm;
>>
>> I don't think that this local variable adds any value, so let's not use it.
>> Similar point in a few other patches too.
> 
> It avoids 1 deference of current->mm, it's a little performance gain.
> 

No, it isn't. :) 

Longer answer: at this level (by which I mean, "wrote the C code, haven't looked
at the generated asm yet, and haven't done a direct perf test yet"), none of us
C programmers are entitled to imagine that we can second guess both the compiler 
and the CPU well enough to claim that  declaring a local pointer variable on the
stack will even *affect* performance, much less know which way it will go!

The compiler at -O2 will *absolutely* optimize away any local variables that
it doesn't need.

And that leads to how kernel programmers routinely decide about that kind of 
variable: "does the variable's added clarity compensate for the extra visual 
noise and for the need to manage the variable?"

Here, and in most (all?) other points in the patchset where you've added an
mm local variable, the answer is no.


>>
...	start_lockless_pgtbl_walk(mm);
>>
>> Minor: I'd like to rename this register_lockless_pgtable_walker().
>>
>>>  		local_irq_disable();
>>>  		gup_pgd_range(addr, end, gup_flags, pages, &nr);
>>>  		local_irq_enable();
>>> +		end_lockless_pgtbl_walk(mm);
>>
>> ...and deregister_lockless_pgtable_walker().
>>
> 
> I have no problem changing the name, but I don't register/deregister
> are good terms for this. 
> 
> I would rather use start/finish, begin/end, and so on. Register sounds
> like something more complicated than what we are trying to achieve
> here. 
> 

OK, well, I don't want to bikeshed on naming more than I usually do, and 
what you have is reasonable, so I'll leave that alone. :)

thanks,
-- 
John Hubbard
NVIDIA

