Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AD4B98D8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 23:18:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZmlX3c1lzF3Vj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 07:18:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nvidia.com
 (client-ip=216.228.121.64; helo=hqemgate15.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="IAxJBWJA"; 
 dkim-atps=neutral
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZmjH4cQgzF3BJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2019 07:16:03 +1000 (AEST)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d8541940001>; Fri, 20 Sep 2019 14:16:05 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 20 Sep 2019 14:15:58 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 20 Sep 2019 14:15:58 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 20 Sep
 2019 21:15:58 +0000
Received: from [10.110.48.28] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 20 Sep
 2019 21:15:57 +0000
Subject: Re: [PATCH v2 11/11] powerpc/mm/book3s64/pgtable: Uses counting
 method to skip serializing
To: Leonardo Bras <leonardo@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>
References: <20190920195047.7703-1-leonardo@linux.ibm.com>
 <20190920195047.7703-12-leonardo@linux.ibm.com>
 <1b39eaa7-751d-40bc-d3d7-41aaa15be42a@nvidia.com>
 <24863d8904c6e05e5dd48cab57db4274675ae654.camel@linux.ibm.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <68eb4faa-e246-1ff3-e2ec-af45cab87d44@nvidia.com>
Date: Fri, 20 Sep 2019 14:15:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <24863d8904c6e05e5dd48cab57db4274675ae654.camel@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1569014165; bh=MGlIa7FYpXoizc1plp+e6Zg3ab0HypMzf3GJXl5DD0w=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=IAxJBWJAnZnxG0fFRIwkqoLQ5C8L/QJKaHwmSaHfdQzyMLC6xJUAVWFWFooNMPdnU
 GWow1sOQbePgkzDbNyypqC7f/ogIh3y10fVcQ2QSizyCKuEiZ9XbhJehQsjVwmpClE
 j0J1goYnBWQTQaIi6d/H3tOTXiXqbOmmWh9tABfL/oUdccdK9aV1bao5+y6rAK8CDu
 aLckbX8M/mOC/PoVeoQrIKkJUeyTSV0/2fV7Ng82bO9dWvvIEXKjl3XpdwxXSbCRIm
 Kctcs62J6gmdjCylFz+mQcsldwPXB0Ffq0lvD3hHX1Pz/KkelCSXJpT+hKjY3DXHij
 RbLTeDPv0RhPw==
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
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Thomas Gleixner <tglx@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, YueHaibing <yuehaibing@huawei.com>,
 Keith Busch <keith.busch@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/20/19 1:28 PM, Leonardo Bras wrote:
> On Fri, 2019-09-20 at 13:11 -0700, John Hubbard wrote:
>> On 9/20/19 12:50 PM, Leonardo Bras wrote:
>>> Skips slow part of serialize_against_pte_lookup if there is no running
>>> lockless pagetable walk.
>>>
>>> Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
>>> ---
>>>  arch/powerpc/mm/book3s64/pgtable.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
>>> index 13239b17a22c..41ca30269fa3 100644
>>> --- a/arch/powerpc/mm/book3s64/pgtable.c
>>> +++ b/arch/powerpc/mm/book3s64/pgtable.c
>>> @@ -95,7 +95,8 @@ static void do_nothing(void *unused)
>>>  void serialize_against_pte_lookup(struct mm_struct *mm)
>>>  {
>>>  	smp_mb();
>>> -	smp_call_function_many(mm_cpumask(mm), do_nothing, NULL, 1);
>>> +	if (running_lockless_pgtbl_walk(mm))
>>> +		smp_call_function_many(mm_cpumask(mm), do_nothing, NULL, 1);
>>
>> Hi,
>>
>> If you do this, then you are left without any synchronization. So it will
>> have race conditions: a page table walk could begin right after the above
>> check returns "false", and then code such as hash__pmdp_huge_get_and_clear()
>> will continue on right away, under the false assumption that it has let
>> all the current page table walks complete.
>>
>> The current code uses either interrupts or RCU to synchronize, and in
>> either case, you end up scheduling something on each CPU. If you remove
>> that entirely, I don't see anything left. ("Pure" atomic counting is not
>> a synchronization technique all by itself.)

(Actually, correction: the protection is really for deleting the page tables, 
so maybe that doesn't apply directly here.)

>>
> 
> Hello John,
> Thanks for the fast feedback.
> 
> See, before calling serialize_against_pte_lookup(), there is always an
> update or clear on the pmd. So, if a page table walk begin right after
> the check returns "false", there is no problem, since it will use the
> updated pmd.
> 
> Think about serialize, on a process with a bunch of cpus. After you
> check the last processor (wait part), there is no guarantee that the
> first one is not starting a lockless pagetable walk.
> 

Then why even try to count at all if a page table walker is happening, if
a) it can't actually be done accurately with just counting, and 
b) you are claiming that it's safe even if the count is wrong?

In other words, by your reasoning (which I'm not saying is wrong--I don't
fully get this ppc model yet), you can probably just drop all of the counting
code from this patchset.

btw, once this is sorted out, I think all of those large copy-pasted comment
blocks before each call to serialize_against_pte_lookup(), should 
be updated to reflect what the actual synchronization mechanism is.
This is pretty hard to figure out. :)

thanks,
-- 
John Hubbard
NVIDIA

> The same mechanism protect both methods.
> 
> Does it make sense?
> 
> Best regards,
> Leonardo Bras
> 
> 
