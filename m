Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F31E5BBFC2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 03:31:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ckDy5qWmzDqQC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 11:31:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=linyunsheng@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ckBv59lWzDq61
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 11:29:59 +1000 (AEST)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id B5C2B8D913E60B3E6185;
 Tue, 24 Sep 2019 09:29:54 +0800 (CST)
Received: from [127.0.0.1] (10.74.191.121) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Tue, 24 Sep 2019
 09:29:51 +0800
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
To: Peter Zijlstra <peterz@infradead.org>, Michal Hocko <mhocko@kernel.org>
References: <1568724534-146242-1-git-send-email-linyunsheng@huawei.com>
 <20190923151519.GE2369@hirez.programming.kicks-ass.net>
 <20190923152856.GB17206@dhcp22.suse.cz>
 <20190923154852.GG2369@hirez.programming.kicks-ass.net>
 <20190923165235.GD17206@dhcp22.suse.cz>
 <20190923203410.GI2369@hirez.programming.kicks-ass.net>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <f1362dbb-ad31-51a8-2b06-16c9d928b876@huawei.com>
Date: Tue, 24 Sep 2019 09:29:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20190923203410.GI2369@hirez.programming.kicks-ass.net>
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
 jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, mwb@linux.vnet.ibm.com,
 paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org, chenhc@lemote.com,
 will@kernel.org, cai@lca.pw, linux-s390@vger.kernel.org,
 ysato@users.sourceforge.jp, x86@kernel.org, rppt@linux.ibm.com,
 borntraeger@de.ibm.com, dledford@redhat.com, mingo@redhat.com,
 jeffrey.t.kirsher@intel.com, jhogan@kernel.org, mattst88@gmail.com,
 len.brown@intel.com, gor@linux.ibm.com, anshuman.khandual@arm.com,
 gregkh@linuxfoundation.org, bp@alien8.de, luto@kernel.org, tglx@linutronix.de,
 naveen.n.rao@linux.vnet.ibm.com, linux-arm-kernel@lists.infradead.org,
 rth@twiddle.net, axboe@kernel.dk, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, tbogendoerfer@suse.de,
 paul.burton@mips.com, linux-alpha@vger.kernel.org, rafael@kernel.org,
 ink@jurassic.park.msu.ru, akpm@linux-foundation.org, robin.murphy@arm.com,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019/9/24 4:34, Peter Zijlstra wrote:
> On Mon, Sep 23, 2019 at 06:52:35PM +0200, Michal Hocko wrote:
>> On Mon 23-09-19 17:48:52, Peter Zijlstra wrote:
> 
>> To the NUMA_NO_NODE itself. Your earlier email noted:
>> : > +
>> : >  	if ((unsigned)node >= nr_node_ids) {
>> : >  		printk(KERN_WARNING
>> : >  			"cpumask_of_node(%d): (unsigned)node >= nr_node_ids(%u)\n",
>> : 
>> : I still think this makes absolutely no sense what so ever.
>>
>> Did you mean the NUMA_NO_NODE handling or the specific node >= nr_node_ids
>> check?
> 
> The NUMA_NO_NODE thing. It's is physical impossibility. And if the
> device description doesn't give us a node, then the description is
> incomplete and wrong and we should bloody well complain about it.
> 
>> Because as to NUMA_NO_NODE I believe this makes sense because this is
>> the only way that a device is not bound to any numa node.
> 
> Which is a physical impossibility.
> 
>> I even the
>> ACPI standard is considering this optional. Yunsheng Lin has referred to
>> the specific part of the standard in one of the earlier discussions.
>> Trying to guess the node affinity is worse than providing all CPUs IMHO.
> 
> I'm saying the ACPI standard is wrong. Explain to me how it is
> physically possible to have a device without NUMA affinity in a NUMA
> system?
> 
>  1) The fundamental interconnect is not uniform.
>  2) The device needs to actually be somewhere.
> 

From what I can see, NUMA_NO_NODE may make sense in the below case:

1) Theoretically, there would be a device that can access all the memory
uniformly and can be accessed by all cpus uniformly even in a NUMA system.
Suppose we have two nodes, and the device just sit in the middle of the
interconnect between the two nodes.

Even we define a third node solely for the device, we may need to look at
the node distance to decide the device can be accessed uniformly.

Or we can decide that the device can be accessed uniformly by setting
it's node to NUMA_NO_NODE.


2) For many virtual deivces, such as tun or loopback netdevice, they
are also accessed uniformly by all cpus.

