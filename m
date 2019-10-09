Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC40D0EB5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2019 14:29:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pD733PWyzDqKq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2019 23:29:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46pD2Q33zzzDqJM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2019 23:25:27 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF15D142F;
 Wed,  9 Oct 2019 05:25:24 -0700 (PDT)
Received: from [10.37.12.37] (unknown [10.37.12.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E022B3F703;
 Wed,  9 Oct 2019 05:25:16 -0700 (PDT)
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
To: Yunsheng Lin <linyunsheng@huawei.com>,
 Peter Zijlstra <peterz@infradead.org>
References: <20190924091714.GJ2369@hirez.programming.kicks-ass.net>
 <20190924105622.GH23050@dhcp22.suse.cz>
 <20190924112349.GJ2332@hirez.programming.kicks-ass.net>
 <20190924115401.GM23050@dhcp22.suse.cz>
 <20190924120943.GP2349@hirez.programming.kicks-ass.net>
 <20190924122500.GP23050@dhcp22.suse.cz>
 <20190924124325.GQ2349@hirez.programming.kicks-ass.net>
 <20190924125936.GR2349@hirez.programming.kicks-ass.net>
 <20190924131939.GS23050@dhcp22.suse.cz>
 <1adcbe68-6753-3497-48a0-cc84ac503372@huawei.com>
 <20190925104108.GE4553@hirez.programming.kicks-ass.net>
 <47fa4cee-8528-7c23-c7de-7be1b65aa2ae@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <bec80499-86d9-bf1f-df23-9044a8099992@arm.com>
Date: Wed, 9 Oct 2019 13:25:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <47fa4cee-8528-7c23-c7de-7be1b65aa2ae@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
 gor@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de, luto@kernel.org,
 tglx@linutronix.de, naveen.n.rao@linux.vnet.ibm.com,
 linux-arm-kernel@lists.infradead.org, rth@twiddle.net, axboe@kernel.dk,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org,
 tbogendoerfer@suse.de, paul.burton@mips.com, linux-alpha@vger.kernel.org,
 rafael@kernel.org, ink@jurassic.park.msu.ru, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019-10-08 9:38 am, Yunsheng Lin wrote:
> On 2019/9/25 18:41, Peter Zijlstra wrote:
>> On Wed, Sep 25, 2019 at 05:14:20PM +0800, Yunsheng Lin wrote:
>>>  From the discussion above, It seems making the node_to_cpumask_map()
>>> NUMA_NO_NODE aware is the most feasible way to move forwad.
>>
>> That's still wrong.
> 
> Hi, Peter
> 
> It seems this has trapped in the dead circle.
> 
>  From my understanding, NUMA_NO_NODE which means not node numa preference
> is the state to describe the node of virtual device or the physical device
> that has equal distance to all cpu.
> 
> We can be stricter if the device does have a nearer node, but we can not
> deny that a device does not have a node numa preference or node affinity,
> which also means the control or data buffer can be allocated at the node where
> the process is running.
> 
> As you has proposed, making it -2 and have dev_to_node() warn if the device does
> have a nearer node and not set by the fw is a way to be stricter.
> 
> But I think maybe being stricter is not really relevant to NUMA_NO_NODE, because
> we does need a state to describe the device that have equal distance to all node,
> even if it is not physically scalable.
> 
> Any better suggestion to move this forward?

FWIW (since this is in my inbox), it sounds like the fundamental issue 
is that NUMA_NO_NODE is conflated for at least two different purposes, 
so trying to sort that out would be a good first step. AFAICS we have 
genuine "don't care" cases like alloc_pages_node(), where if the 
producer says it doesn't matter then the consumer is free to make its 
own judgement on what to do, and fundamentally different "we expect this 
thing to have an affinity but it doesn't, so we can't say what's 
appropriate" cases which could really do with some separate indicator 
like "NUMA_INVALID_NODE".

The tricky part is then bestowed on the producers to decide whether they 
can downgrade "invalid" to "don't care". You can technically build 'a 
device' whose internal logic is distributed between nodes and thus 
appears to have equal affinity - interrupt controllers, for example, may 
have per-CPU or per-node interfaces that end up looking like that - so 
although it's unlikely it's not outright nonsensical. Similarly a 
'device' that's actually emulated behind a firmware call interface may 
well effectively have no real affinity.

Robin.
