Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5172628247
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 15:20:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9s0f37R4z3cdy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 01:20:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9s063H1Tz2xHJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 01:20:03 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71CAB23A;
	Mon, 14 Nov 2022 06:19:37 -0800 (PST)
Received: from [192.168.0.110] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61C753F73D;
	Mon, 14 Nov 2022 06:19:21 -0800 (PST)
Message-ID: <40f1b5ad-2165-bb81-1ff5-89786373fa14@arm.com>
Date: Mon, 14 Nov 2022 19:49:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v5 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
Content-Language: en-US
To: Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, linux-doc@vger.kernel.org
References: <20221028081255.19157-1-yangyicong@huawei.com>
 <20221028081255.19157-3-yangyicong@huawei.com>
 <86fbdc8c-0dcb-9b8f-d843-63460d8b1d6a@arm.com>
 <9982dac0-9f2e-112a-d440-467c8e8f8aa4@huawei.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <9982dac0-9f2e-112a-d440-467c8e8f8aa4@huawei.com>
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
Cc: wangkefeng.wang@huawei.com, darren@os.amperecomputing.com, peterz@infradead.org, yangyicong@hisilicon.com, punit.agrawal@bytedance.com, Nadav Amit <namit@vmware.com>, guojian@oppo.com, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, Barry Song <21cnbao@gmail.com>, Mel Gorman <mgorman@suse.de>, linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, prime.zeng@hisilicon.com, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/14/22 14:16, Yicong Yang wrote:
> On 2022/11/14 11:29, Anshuman Khandual wrote:
>>
>> On 10/28/22 13:42, Yicong Yang wrote:
>>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>>> +{
>>> +	/*
>>> +	 * TLB batched flush is proved to be beneficial for systems with large
>>> +	 * number of CPUs, especially system with more than 8 CPUs. TLB shutdown
>>> +	 * is cheap on small systems which may not need this feature. So use
>>> +	 * a threshold for enabling this to avoid potential side effects on
>>> +	 * these platforms.
>>> +	 */
>>> +	if (num_online_cpus() <= CONFIG_ARM64_NR_CPUS_FOR_BATCHED_TLB)
>>> +		return false;
>>> +
>>> +#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
>>> +	if (unlikely(this_cpu_has_cap(ARM64_WORKAROUND_REPEAT_TLBI)))
>>> +		return false;
>>> +#endif
>> should_defer_flush() is immediately followed by set_tlb_ubc_flush_pending() which calls
>> arch_tlbbatch_add_mm(), triggering the actual TLBI flush via __flush_tlb_page_nosync().
>> It should be okay to check capability with this_cpu_has_cap() as the entire call chain
>> here is executed on the same cpu. But just wondering if cpus_have_const_cap() would be
>> simpler, consistent, and also cost effective ?
>>
> ok. Checked cpus_have_const_cap() I think it matches your words.
> 
>> Regardless, a comment is needed before the #ifdef block explaining why it does not make
>> sense to defer/batch when __tlbi()/__tlbi_user() implementation will execute 'dsb(ish)'
>> between two TLBI instructions to workaround the errata.
>>
> The workaround for the errata mentioned the affected platforms need the tlbi+dsb to be done
> twice, so I'm not sure if we defer the final dsb will cause any problem so I think the judgement
> here is used for safety. I have no such platform to test if it's ok to defer the last dsb.

We should not defer TLB flush on such systems, as ensured by the above test and 'false'
return afterwards. The only question is whether this decision should be taken at a CPU
level (which is affected by the errata) or the whole system level.

What is required now

- Replace this_cpu_has_cap() with cpus_have_const_cap ?
- Add the following comment before the #ifdef check

/*
 * TLB flush deferral is not required on systems, which are affected with
 * ARM64_WORKAROUND_REPEAT_TLBI, as __tlbi()/__tlbi_user() implementation
 * will have two consecutive TLBI instructions with a dsb(ish) in between
 * defeating the purpose (i.e save overall 'dsb ish' cost).
 */
