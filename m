Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDB3BDAC5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 11:16:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dXVf1CGRzDqZw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 19:16:26 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dXST02qRzDqjv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 19:14:31 +1000 (AEST)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9C859387E7EFF1887A06;
 Wed, 25 Sep 2019 17:14:25 +0800 (CST)
Received: from [127.0.0.1] (10.74.191.121) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Wed, 25 Sep 2019
 17:14:21 +0800
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
To: Michal Hocko <mhocko@kernel.org>, Peter Zijlstra <peterz@infradead.org>
References: <20190923203410.GI2369@hirez.programming.kicks-ass.net>
 <20190924074751.GB23050@dhcp22.suse.cz>
 <20190924091714.GJ2369@hirez.programming.kicks-ass.net>
 <20190924105622.GH23050@dhcp22.suse.cz>
 <20190924112349.GJ2332@hirez.programming.kicks-ass.net>
 <20190924115401.GM23050@dhcp22.suse.cz>
 <20190924120943.GP2349@hirez.programming.kicks-ass.net>
 <20190924122500.GP23050@dhcp22.suse.cz>
 <20190924124325.GQ2349@hirez.programming.kicks-ass.net>
 <20190924125936.GR2349@hirez.programming.kicks-ass.net>
 <20190924131939.GS23050@dhcp22.suse.cz>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <1adcbe68-6753-3497-48a0-cc84ac503372@huawei.com>
Date: Wed, 25 Sep 2019 17:14:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20190924131939.GS23050@dhcp22.suse.cz>
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

On 2019/9/24 21:19, Michal Hocko wrote:
> On Tue 24-09-19 14:59:36, Peter Zijlstra wrote:
>> On Tue, Sep 24, 2019 at 02:43:25PM +0200, Peter Zijlstra wrote:
>>> On Tue, Sep 24, 2019 at 02:25:00PM +0200, Michal Hocko wrote:
>>>> On Tue 24-09-19 14:09:43, Peter Zijlstra wrote:
>>>
>>>>> We can push back and say we don't respect the specification because it
>>>>> is batshit insane ;-)
>>>>
>>>> Here is my fingers crossed.
>>>>
>>>> [...]
>>>>
>>>>> Now granted; there's a number of virtual devices that really don't have
>>>>> a node affinity, but then, those are not hurt by forcing them onto a
>>>>> random node, they really don't do anything. Like:
>>>>
>>>> Do you really consider a random node a better fix than simply living
>>>> with a more robust NUMA_NO_NODE which tells the actual state? Page
>>>> allocator would effectivelly use the local node in that case. Any code
>>>> using the cpumask will know that any of the online cpus are usable.
>>>
>>> For the pmu devices? Yes, those 'devices' aren't actually used for
>>> anything other than sysfs entries.
>>>
>>> Nothing else uses the struct device.
>>
>> The below would get rid of the PMU and workqueue warnings with no
>> side-effects (the device isn't used for anything except sysfs).
> 
> Hardcoding to 0 is simply wrong, if the node0 is cpuless for example...

Hi, Peter & Michal

From the discussion above, It seems making the node_to_cpumask_map()
NUMA_NO_NODE aware is the most feasible way to move forwad.

Any suggestion?

> 

