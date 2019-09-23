Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 047CFBACA1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 04:32:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46c7ds1CRwzDqNH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 12:32:49 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46c7c80JlMzDqH1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2019 12:31:17 +1000 (AEST)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7E713D4AB52CFE913988;
 Mon, 23 Sep 2019 10:31:11 +0800 (CST)
Received: from [127.0.0.1] (10.74.191.121) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Mon, 23 Sep 2019
 10:31:09 +0800
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
To: Paul Burton <paul.burton@mips.com>
References: <1568724534-146242-1-git-send-email-linyunsheng@huawei.com>
 <20190921223818.sodqc2ui7mpt7ig5@pburton-laptop>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <57b3f143-f83b-f96a-de7b-1eccecc81dbb@huawei.com>
Date: Mon, 23 Sep 2019 10:31:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20190921223818.sodqc2ui7mpt7ig5@pburton-laptop>
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
Cc: "dalias@libc.org" <dalias@libc.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "mwb@linux.vnet.ibm.com" <mwb@linux.vnet.ibm.com>,
 "paulus@samba.org" <paulus@samba.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "chenhc@lemote.com" <chenhc@lemote.com>, "will@kernel.org" <will@kernel.org>,
 "cai@lca.pw" <cai@lca.pw>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "ysato@users.sourceforge.jp" <ysato@users.sourceforge.jp>,
 "x86@kernel.org" <x86@kernel.org>, "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "dledford@redhat.com" <dledford@redhat.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
 "jhogan@kernel.org" <jhogan@kernel.org>,
 "mattst88@gmail.com" <mattst88@gmail.com>,
 "len.brown@intel.com" <len.brown@intel.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "anshuman.khandual@arm.com" <anshuman.khandual@arm.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "bp@alien8.de" <bp@alien8.de>, "luto@kernel.org" <luto@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mhocko@kernel.org" <mhocko@kernel.org>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "rth@twiddle.net" <rth@twiddle.net>, "axboe@kernel.dk" <axboe@kernel.dk>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ralf@linux-mips.org" <ralf@linux-mips.org>,
 "tbogendoerfer@suse.de" <tbogendoerfer@suse.de>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019/9/22 6:38, Paul Burton wrote:
> Hi Yunsheng,
> 
> On Tue, Sep 17, 2019 at 08:48:54PM +0800, Yunsheng Lin wrote:
>> When passing the return value of dev_to_node() to cpumask_of_node()
>> without checking if the device's node id is NUMA_NO_NODE, there is
>> global-out-of-bounds detected by KASAN.
>>
>> From the discussion [1], NUMA_NO_NODE really means no node affinity,
>> which also means all cpus should be usable. So the cpumask_of_node()
>> should always return all cpus online when user passes the node id as
>> NUMA_NO_NODE, just like similar semantic that page allocator handles
>> NUMA_NO_NODE.
>>
>> But we cannot really copy the page allocator logic. Simply because the
>> page allocator doesn't enforce the near node affinity. It just picks it
>> up as a preferred node but then it is free to fallback to any other numa
>> node. This is not the case here and node_to_cpumask_map will only restrict
>> to the particular node's cpus which would have really non deterministic
>> behavior depending on where the code is executed. So in fact we really
>> want to return cpu_online_mask for NUMA_NO_NODE.
>>
>> Also there is a debugging version of node_to_cpumask_map() for x86 and
>> arm64, which is only used when CONFIG_DEBUG_PER_CPU_MAPS is defined, this
>> patch changes it to handle NUMA_NO_NODE as normal node_to_cpumask_map().
>>
>> [1] https://lore.kernel.org/patchwork/patch/1125789/
>> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
>> Suggested-by: Michal Hocko <mhocko@kernel.org>
>> Acked-by: Michal Hocko <mhocko@suse.com>
> 
> If you end up sending another revision then I think it would be worth
> replacing -1 with NUMA_NO_NODE in
> arch/mips/include/asm/mach-ip27/topology.h for consistency, but in any
> case:

Perhaps it is better to replace -1 with NUMA_NO_NODE along with cpu_all_mask
-> cpu_online_mask change if the cpu_all_mask -> cpu_online_mask change is
reasonable.

Anyway, will do that if there is another version needed.

> 
>     Acked-by: Paul Burton <paul.burton@mips.com> # MIPS bits

Thanks for that.

> 
> Thanks,
>     Paul
> 
>> ---
>> V6: Drop the cpu_all_mask -> cpu_online_mask change for it seems a
>>     little controversial, may need deeper investigation, and rebased
>>     on the latest linux-next.
>> V5: Drop unsigned "fix" change for x86/arm64, and change comment log
>>     according to Michal's comment.
>> V4: Have all these changes in a single patch.
>> V3: Change to only handle NUMA_NO_NODE, and return cpu_online_mask
>>     for NUMA_NO_NODE case, and change the commit log to better justify
>>     the change.
>> V2: make the node id checking change to other arches too.
>> ---
>>  arch/arm64/include/asm/numa.h                    | 3 +++
>>  arch/arm64/mm/numa.c                             | 3 +++
>>  arch/mips/include/asm/mach-loongson64/topology.h | 4 +++-
>>  arch/s390/include/asm/topology.h                 | 3 +++
>>  arch/x86/include/asm/topology.h                  | 3 +++
>>  arch/x86/mm/numa.c                               | 3 +++
>>  6 files changed, 18 insertions(+), 1 deletion(-)
> 
> .
> 

