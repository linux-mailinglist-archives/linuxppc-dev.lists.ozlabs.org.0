Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DD7A5603
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 14:29:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MTsp2tsMzDqTp
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 22:29:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.191; helo=huawei.com;
 envelope-from=linyunsheng@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MTpC0yRczDqgd
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 22:26:10 +1000 (AEST)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 17A6940E61A165018A38;
 Mon,  2 Sep 2019 20:26:05 +0800 (CST)
Received: from [127.0.0.1] (10.74.191.121) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Mon, 2 Sep 2019
 20:25:57 +0800
Subject: Re: [PATCH v2 2/9] x86: numa: check the node id consistently for x86
To: Peter Zijlstra <peterz@infradead.org>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
 <1567231103-13237-3-git-send-email-linyunsheng@huawei.com>
 <20190831085539.GG2369@hirez.programming.kicks-ass.net>
 <4d89c688-49e4-a2aa-32ee-65e36edcd913@huawei.com>
 <20190831161247.GM2369@hirez.programming.kicks-ass.net>
 <ae64285f-5134-4147-7b02-34bb5d519e8c@huawei.com>
 <20190902072542.GN2369@hirez.programming.kicks-ass.net>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <5fa2aa99-89fa-cd41-b090-36a23cfdeb73@huawei.com>
Date: Mon, 2 Sep 2019 20:25:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20190902072542.GN2369@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.74.191.121]
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
Cc: dalias@libc.org, linux-sh@vger.kernel.org, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, heiko.carstens@de.ibm.com, linuxarm@huawei.com,
 jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, mwb@linux.vnet.ibm.com,
 paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org, chenhc@lemote.com,
 will@kernel.org, bp@alien8.de, linux-s390@vger.kernel.org,
 ysato@users.sourceforge.jp, x86@kernel.org, rppt@linux.ibm.com,
 borntraeger@de.ibm.com, dledford@redhat.com, mingo@redhat.com,
 jeffrey.t.kirsher@intel.com, jhogan@kernel.org, nfont@linux.vnet.ibm.com,
 mattst88@gmail.com, len.brown@intel.com, gor@linux.ibm.com,
 anshuman.khandual@arm.com, ink@jurassic.park.msu.ru, luto@kernel.org,
 tglx@linutronix.de, naveen.n.rao@linux.vnet.ibm.com,
 linux-arm-kernel@lists.infradead.org, rth@twiddle.net, axboe@kernel.dk,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 ralf@linux-mips.org, tbogendoerfer@suse.de, paul.burton@mips.com,
 linux-alpha@vger.kernel.org, cai@lca.pw, akpm@linux-foundation.org,
 robin.murphy@arm.com, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019/9/2 15:25, Peter Zijlstra wrote:
> On Mon, Sep 02, 2019 at 01:46:51PM +0800, Yunsheng Lin wrote:
>> On 2019/9/1 0:12, Peter Zijlstra wrote:
> 
>>> 1) because even it is not set, the device really does belong to a node.
>>> It is impossible a device will have magic uniform access to memory when
>>> CPUs cannot.
>>
>> So it means dev_to_node() will return either NUMA_NO_NODE or a
>> valid node id?
> 
> NUMA_NO_NODE := -1, which is not a valid node number. It is also, like I
> said, not a valid device location on a NUMA system.
> 
> Just because ACPI/BIOS is shit, doesn't mean the device doesn't have a
> node association. It just means we don't know and might have to guess.

How do we guess the device's location when ACPI/BIOS does not set it?

It seems dev_to_node() does not do anything about that and leave the
job to the caller or whatever function that get called with its return
value, such as cpumask_of_node().

> 
>>> 2) is already true today, cpumask_of_node() requires a valid node_id.
>>
>> Ok, most of the user does check node_id before calling
>> cpumask_of_node(), but does a little different type of checking:
>>
>> 1) some does " < 0" check;
>> 2) some does "== NUMA_NO_NODE" check;
>> 3) some does ">= MAX_NUMNODES" check;
>> 4) some does "< 0 || >= MAX_NUMNODES || !node_online(node)" check.
> 
> The one true way is:
> 
> 	'(unsigned)node_id >= nr_node_ids'

I missed the magic of the "unsigned" in your previous reply.

> 
>>> 3) is just wrong and increases overhead for everyone.
>>
>> Ok, cpumask_of_node() is also used in some critical path such
>> as scheduling, which may not need those checking, the overhead
>> is unnecessary.
>>
>> But for non-critical path such as setup or configuration path,
>> it better to have consistent checking, and also simplify the
>> user code that calls cpumask_of_node().
>>
>> Do you think it is worth the trouble to add a new function
>> such as cpumask_of_node_check(maybe some other name) to do
>> consistent checking?
>>
>> Or caller just simply check if dev_to_node()'s return value is
>> NUMA_NO_NODE before calling cpumask_of_node()?
> 
> It is not a matter of convenience. The function is called
> cpumask_of_node(), when node < 0 || node >= nr_node_ids, it is not a
> valid node, therefore the function shouldn't return anything except an
> error.
what do you mean by error? What I can think is three type of errors:
1) return NULL, this way it seems cpumask_of_node() also leave the
   job to the function that calls it.
2) cpu_none_mask, I am not sure what this means, maybe it means there
   is no cpu on the same node with the device?
3) give a warning, stack dump, or even a BUG_ON?

I would prefer the second one, and implement the third one when the
CONFIG_DEBUG_PER_CPU_MAPS is selected.

Any suggestion?

> 
> Also note that the CONFIG_DEBUG_PER_CPU_MAPS version of
> cpumask_of_node() already does this (although it wants the below fix).

Thanks for the note and example.

