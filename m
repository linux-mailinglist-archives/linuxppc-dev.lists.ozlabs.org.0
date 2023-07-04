Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A397747495
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 16:56:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwQqB31wtz3c37
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 00:56:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1140 seconds by postgrey-1.37 at boromir; Wed, 05 Jul 2023 00:56:09 AEST
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwQpd0GFKz2xwG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 00:56:05 +1000 (AEST)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4QwQMS40rSzqVXh;
	Tue,  4 Jul 2023 22:36:04 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 22:36:29 +0800
Subject: Re: [RESEND PATCH v9 2/2] arm64: support batched/deferred tlb
 shootdown during page reclamation/migration
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20230518065934.12877-1-yangyicong@huawei.com>
 <20230518065934.12877-3-yangyicong@huawei.com> <ZJ2x6DlmyA3kVh1n@arm.com>
 <ZJ2+37Q7v4odMmEd@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <2f593850-797c-5422-2c80-ce214fac02bb@huawei.com>
Date: Tue, 4 Jul 2023 22:36:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <ZJ2+37Q7v4odMmEd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500009.china.huawei.com (7.192.105.203)
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
Cc: mark.rutland@arm.com, wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, realmz6@gmail.com, linux-doc@vger.kernel.org, peterz@infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, punit.agrawal@bytedance.com, linux-riscv@lists.infradead.org, will@kernel.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org, Barry Song <21cnbao@gmail.com>, Mel Gorman <mgorman@suse.de>, ryan.roberts@arm.com, arnd@arndb.de, anshuman.khandual@arm.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, darren@os.amperecomputing.com, Jonathan.Cameron@huawei.com, yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org, guojian@oppo.com, xhao@linux.alibaba.com, linux-mips@vger.kernel.org, huzhanyuan@oppo.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023/6/30 1:26, Catalin Marinas wrote:
> On Thu, Jun 29, 2023 at 05:31:36PM +0100, Catalin Marinas wrote:
>> On Thu, May 18, 2023 at 02:59:34PM +0800, Yicong Yang wrote:
>>> From: Barry Song <v-songbaohua@oppo.com>
>>>
>>> on x86, batched and deferred tlb shootdown has lead to 90%
>>> performance increase on tlb shootdown. on arm64, HW can do
>>> tlb shootdown without software IPI. But sync tlbi is still
>>> quite expensive.
>> [...]
>>>  .../features/vm/TLB/arch-support.txt          |  2 +-
>>>  arch/arm64/Kconfig                            |  1 +
>>>  arch/arm64/include/asm/tlbbatch.h             | 12 ++++
>>>  arch/arm64/include/asm/tlbflush.h             | 33 ++++++++-
>>>  arch/arm64/mm/flush.c                         | 69 +++++++++++++++++++
>>>  arch/x86/include/asm/tlbflush.h               |  5 +-
>>>  include/linux/mm_types_task.h                 |  4 +-
>>>  mm/rmap.c                                     | 12 ++--
>>
>> First of all, this patch needs to be split in some preparatory patches
>> introducing/renaming functions with no functional change for x86. Once
>> done, you can add the arm64-only changes.
>>

got it. will try to split this patch as suggested.

>> Now, on the implementation, I had some comments on v7 but we didn't get
>> to a conclusion and the thread eventually died:
>>
>> https://lore.kernel.org/linux-mm/Y7cToj5mWd1ZbMyQ@arm.com/
>>
>> I know I said a command line argument is better than Kconfig or some
>> random number of CPUs heuristics but it would be even better if we don't
>> bother with any, just make this always on.

ok, will make this always on.

>> Barry had some comments
>> around mprotect() being racy and that's why we have
>> flush_tlb_batched_pending() but I don't think it's needed (or, for
>> arm64, it can be a DSB since this patch issues the TLBIs but without the
>> DVM Sync). So we need to clarify this (see Barry's last email on the
>> above thread) and before attempting new versions of this patchset. With
>> flush_tlb_batched_pending() removed (or DSB), I have a suspicion such
>> implementation would be faster on any SoC irrespective of the number of
>> CPUs.
> 
> I think I got the need for flush_tlb_batched_pending(). If
> try_to_unmap() marks the pte !present and we have a pending TLBI,
> change_pte_range() will skip the TLB maintenance altogether since it did
> not change the pte. So we could be left with stale TLB entries after
> mprotect() before TTU does the batch flushing.
> 
> We can have an arch-specific flush_tlb_batched_pending() that can be a
> DSB only on arm64 and a full mm flush on x86.
> 

We need to do a flush/dsb in flush_tlb_batched_pending() only in a race
condition so we first check whether there's a pended batched flush and
if so do the tlb flush. The pending checking is common and the differences
among the archs is how to flush the TLB here within the flush_tlb_batched_pending(),
on arm64 it should only be a dsb.

As we only needs to maintain the TLBs already pended in batched flush,
does it make sense to only handle those TLBs in flush_tlb_batched_pending()?
Then we can use the arch_tlbbatch_flush() rather than flush_tlb_mm() in
flush_tlb_batched_pending() and no arch specific function needed.

Thanks.

