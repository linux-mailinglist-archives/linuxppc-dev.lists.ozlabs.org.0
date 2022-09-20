Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8535BE099
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 10:46:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWwBv3tyJz3c7M
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 18:46:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWwBT64Ytz304j
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 18:46:22 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6ED20106F;
	Tue, 20 Sep 2022 01:45:54 -0700 (PDT)
Received: from [10.163.57.146] (unknown [10.163.57.146])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE8EE3F73B;
	Tue, 20 Sep 2022 01:45:37 -0700 (PDT)
Message-ID: <8c4f103b-8f04-d0ad-b30a-2db7e52b36a3@arm.com>
Date: Tue, 20 Sep 2022 14:15:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/4] arm64: support batched/deferred tlb shootdown
 during page reclamation
Content-Language: en-US
To: Barry Song <21cnbao@gmail.com>
References: <20220822082120.8347-1-yangyicong@huawei.com>
 <20220822082120.8347-5-yangyicong@huawei.com>
 <302febae-508c-d73e-8676-d51752946645@arm.com>
 <CAGsJ_4ywwFJFi+q3Ra5UE3twzS9eExtvuXgoGK-8u4c1ZdXCBw@mail.gmail.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <CAGsJ_4ywwFJFi+q3Ra5UE3twzS9eExtvuXgoGK-8u4c1ZdXCBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, linux-doc@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, yangyicong@hisilicon.com, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, guojian@oppo.com, linux-riscv@lists.infradead.org, will@kernel.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org, Mel Gorman <mgorman@suse.de>, linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, darren@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/20/22 09:09, Barry Song wrote:
> On Tue, Sep 20, 2022 at 3:00 PM Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
>>
>>
>> On 8/22/22 13:51, Yicong Yang wrote:
>>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>>> +{
>>> +     return true;
>>> +}
>>
>> This needs to be conditional on systems, where there will be performance
>> improvements, and should not just be enabled all the time on all systems.
>> num_online_cpus() > X, which does not hold any cpu hotplug lock would be
>> a good metric ?
> 
> for a small system, i don't see how this patch will help, e.g. cpus <= 4;
> so we can actually disable tlb-batch on small systems.

Do not subscribe ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH based on NR_CPUS ?
That might not help much as the default value is 256 for NR_CPUS.

OR

arch_tlbbatch_should_defer() checks on

1. online cpus			(dont enable batched TLB if <= X)
2. ARM64_WORKAROUND_REPEAT_TLBI (dont enable batched TLB)

> just need to check if we will have any race condition since hotplug will
> make the condition true and false dynamically.

If should_defer_flush() evaluate to be false, then ptep_clear_flush()
clears and flushes the entry right away. This should not race with other
queued up TLBI requests, which will be flushed separately. Wondering how
there can be a race here !
