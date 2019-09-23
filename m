Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 715A7BBC92
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 22:00:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cZtT09rgzDqHW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 06:00:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nvidia.com
 (client-ip=216.228.121.143; helo=hqemgate14.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="osa+rcGi"; 
 dkim-atps=neutral
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cZrZ5wNczDq7w
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 05:58:37 +1000 (AEST)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d8923eb0000>; Mon, 23 Sep 2019 12:58:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 23 Sep 2019 12:58:33 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 23 Sep 2019 12:58:33 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Sep
 2019 19:58:32 +0000
Received: from [10.110.48.28] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Sep
 2019 19:58:32 +0000
Subject: Re: [PATCH v2 11/11] powerpc/mm/book3s64/pgtable: Uses counting
 method to skip serializing
To: Leonardo Bras <leonardo@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>
References: <20190920195047.7703-1-leonardo@linux.ibm.com>
 <20190920195047.7703-12-leonardo@linux.ibm.com>
 <1b39eaa7-751d-40bc-d3d7-41aaa15be42a@nvidia.com>
 <24863d8904c6e05e5dd48cab57db4274675ae654.camel@linux.ibm.com>
 <4ea26ffb-ad03-bdff-7893-95332b22a5fd@nvidia.com>
 <18c5c378db98f223a0663034baa9fd6ce42f1ec7.camel@linux.ibm.com>
 <8706a1f1-0c5e-d152-938b-f355b9a5aaa8@nvidia.com>
 <dc9fad3577551d34ead36c0f7340a573086c0cab.camel@linux.ibm.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <1568b3ef-cec9-bf47-edaa-c775c2f544fb@nvidia.com>
Date: Mon, 23 Sep 2019 12:58:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <dc9fad3577551d34ead36c0f7340a573086c0cab.camel@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1569268715; bh=CxkbhkWcB0j6c0hQrI2IlVzjpcve7G3EFL8ljZ1vsNg=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=osa+rcGip1BlR1iL7c0QG8GAU1Q8EJYM+7MKE/2olTGatfWy6QATer+Vot5N8zClu
 OGJxjGWL2oUJk82XhQw67UpnBnRdqkR6F4aribTrgHpCO92lOnAlzbCXuleE356gIh
 IWDqD4G452uLukRDW63ppnqze24PNK3zn8n34vY4tjpENFtmtWFDJfK5CiIbmi7CZk
 g+zeFkMtiHAHij0NIlIKnp3c2FClSvSXcy+kpK2+mcm3T5CmrjGT8qTvp+TPzkNRTS
 Bx9+BmEtrGJyFXfCRUX90uLEDnNP2pV+5AwXSXB5nrTZ3266YLU1CsctCzFvLmiFpm
 9HYUFKTZxuThg==
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
Cc: Dan Williams <dan.j.williams@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mahesh
 Salgaonkar <mahesh@linux.vnet.ibm.com>, YueHaibing <yuehaibing@huawei.com>,
 Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Keith Busch <keith.busch@intel.com>, Richard Fontana <rfontana@redhat.com>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ira Weiny <ira.weiny@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/23/19 12:40 PM, Leonardo Bras wrote:
> On Mon, 2019-09-23 at 11:14 -0700, John Hubbard wrote:
>> On 9/23/19 10:25 AM, Leonardo Bras wrote:
>> [...]
>> That part is all fine, but there are no run-time memory barriers in the 
>> atomic_inc() and atomic_dec() additions, which means that this is not
>> safe, because memory operations on CPU 1 can be reordered. It's safe
>> as shown *if* there are memory barriers to keep the order as shown:
>>
>> CPU 0                            CPU 1
>> ------                         --------------
>>                                atomic_inc(val) (no run-time memory barrier!)
>> pmd_clear(pte)
>> if (val)
>>     run_on_all_cpus(): IPI
>>                                local_irq_disable() (also not a mem barrier)
>>
>>                                READ(pte)
>>                                if(pte)
>>                                   walk page tables
>>
>>                                local_irq_enable() (still not a barrier)
>>                                atomic_dec(val)
>>
>> free(pte)
>>
>> thanks,
> 
> This is serialize:
> 
> void serialize_against_pte_lookup(struct mm_struct *mm)
> {
> 	smp_mb();
> 	if (running_lockless_pgtbl_walk(mm))
> 		smp_call_function_many(mm_cpumask(mm), do_nothing,
> NULL, 1);
> }
> 
> That would mean:
> 
> CPU 0                            CPU 1
> ------                         --------------
>                                atomic_inc(val) 
> pmd_clear(pte)
> smp_mb()
> if (val)
>     run_on_all_cpus(): IPI
>                                local_irq_disable() 
> 
>                                READ(pte)
>                                if(pte)
>                                   walk page tables
> 
>                                local_irq_enable() (still not a barrier)
>                                atomic_dec(val)
> 
> By https://www.kernel.org/doc/Documentation/memory-barriers.txt :
> 'If you need all the CPUs to see a given store at the same time, use
> smp_mb().'
> 
> Is it not enough? 

Nope. CPU 1 memory accesses could be re-ordered, as I said above:


CPU 0                            CPU 1
------                         --------------
                               READ(pte) (re-ordered at run time)
                               atomic_inc(val) (no run-time memory barrier!)
                           
pmd_clear(pte)
if (val)
    run_on_all_cpus(): IPI
                               local_irq_disable() (also not a mem barrier)

                               if(pte)
                                  walk page tables
...

> Do you suggest adding 'smp_mb()' after atomic_{inc,dec} ?
> 

Yes (approximately: I'd have to look closer to see which barrier call is really
required). Unless there is something else that is providing the barrier, which
is why I called this a pre-existing question: it seems like the interrupt
interlock in the current gup_fast() might not have what it needs.

In other words, if your code needs a barrier, then the pre-existing gup_fast()
code probably does, too.

thanks,
-- 
John Hubbard
NVIDIA
