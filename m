Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 124FABC671
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 13:14:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cz9b33m2zDqTb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 21:14:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.35; helo=huawei.com;
 envelope-from=linyunsheng@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cz1Z39qkzDqSK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 21:07:46 +1000 (AEST)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D77FEB6C3883268478B0;
 Tue, 24 Sep 2019 19:07:40 +0800 (CST)
Received: from [127.0.0.1] (10.74.191.121) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Tue, 24 Sep 2019
 19:07:37 +0800
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
To: Peter Zijlstra <peterz@infradead.org>
References: <1568724534-146242-1-git-send-email-linyunsheng@huawei.com>
 <20190923151519.GE2369@hirez.programming.kicks-ass.net>
 <20190923152856.GB17206@dhcp22.suse.cz>
 <20190923154852.GG2369@hirez.programming.kicks-ass.net>
 <20190923165235.GD17206@dhcp22.suse.cz>
 <20190923203410.GI2369@hirez.programming.kicks-ass.net>
 <f1362dbb-ad31-51a8-2b06-16c9d928b876@huawei.com>
 <20190924092551.GK2369@hirez.programming.kicks-ass.net>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <c816abbe-155b-504b-cef1-6413f7cdd20c@huawei.com>
Date: Tue, 24 Sep 2019 19:07:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20190924092551.GK2369@hirez.programming.kicks-ass.net>
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
 dave.hansen@linux.intel.com, heiko.carstens@de.ibm.com,
 jiaxun.yang@flygoat.com, Michal Hocko <mhocko@kernel.org>,
 mwb@linux.vnet.ibm.com, paulus@samba.org, hpa@zytor.com,
 sparclinux@vger.kernel.org, chenhc@lemote.com, will@kernel.org, cai@lca.pw,
 linux-s390@vger.kernel.org, ysato@users.sourceforge.jp, x86@kernel.org,
 rppt@linux.ibm.com, borntraeger@de.ibm.com, dledford@redhat.com,
 mingo@redhat.com, jeffrey.t.kirsher@intel.com, jhogan@kernel.org,
 mattst88@gmail.com, linux-mips@vger.kernel.org, len.brown@intel.com,
 gor@linux.ibm.com, anshuman.khandual@arm.com, gregkh@linuxfoundation.org,
 bp@alien8.de, luto@kernel.org, tglx@linutronix.de,
 naveen.n.rao@linux.vnet.ibm.com, linux-arm-kernel@lists.infradead.org,
 rth@twiddle.net, axboe@kernel.dk, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, tbogendoerfer@suse.de,
 paul.burton@mips.com, linux-alpha@vger.kernel.org, rafael@kernel.org,
 ink@jurassic.park.msu.ru, akpm@linux-foundation.org, robin.murphy@arm.com,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019/9/24 17:25, Peter Zijlstra wrote:
> On Tue, Sep 24, 2019 at 09:29:50AM +0800, Yunsheng Lin wrote:
>> On 2019/9/24 4:34, Peter Zijlstra wrote:
> 
>>> I'm saying the ACPI standard is wrong. Explain to me how it is
>>> physically possible to have a device without NUMA affinity in a NUMA
>>> system?
>>>
>>>  1) The fundamental interconnect is not uniform.
>>>  2) The device needs to actually be somewhere.
>>>
>>
>> From what I can see, NUMA_NO_NODE may make sense in the below case:
>>
>> 1) Theoretically, there would be a device that can access all the memory
>> uniformly and can be accessed by all cpus uniformly even in a NUMA system.
>> Suppose we have two nodes, and the device just sit in the middle of the
>> interconnect between the two nodes.
>>
>> Even we define a third node solely for the device, we may need to look at
>> the node distance to decide the device can be accessed uniformly.
>>
>> Or we can decide that the device can be accessed uniformly by setting
>> it's node to NUMA_NO_NODE.
> 
> This is indeed a theoretical case; it doesn't scale. The moment you're
> adding multiple sockets or even board interconnects this all goes out
> the window.
> 
> And in this case, forcing the device to either node is fine.

Not really.
For packet sending and receiving, the buffer memory may be allocated
dynamically. Node of tx buffer memory is mainly based on the cpu
that is sending sending, node of rx buffer memory is mainly based on
the cpu the interrupt handler of the device is running on, and the
device' interrupt affinity is mainly based on node id of the device.

We can bind the processes that are using the device to both nodes
in order to utilize memory on both nodes for packet sending.

But for packet receiving, the node1 may not be used becuase the node
id of device is forced to node 0, which is the default way to bind
the interrupt to the cpu of the same node.

If node_to_cpumask_map() returns all usable cpus when the device's node
id is NUMA_NO_NODE, then interrupt can be binded to the cpus on both nodes.

> 
>> 2) For many virtual deivces, such as tun or loopback netdevice, they
>> are also accessed uniformly by all cpus.
> 
> Not true; the virtual device will sit in memory local to some node.
> 
> And as with physical devices, you probably want at least one (virtual)
> queue per node.

There may be similar handling as above for virtual device too.

> 
> 
> .
> 

