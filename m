Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A55AC6290DD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 04:35:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBBfF2k2lz3cMR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 14:35:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBBdj6LZxz3bhR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 14:35:19 +1100 (AEDT)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NBBXf463pzqSRP;
	Tue, 15 Nov 2022 11:30:58 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 11:34:44 +0800
Subject: Re: [PATCH v5 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
To: Anshuman Khandual <anshuman.khandual@arm.com>,
	<akpm@linux-foundation.org>, <linux-mm@kvack.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <linux-doc@vger.kernel.org>
References: <20221028081255.19157-1-yangyicong@huawei.com>
 <20221028081255.19157-3-yangyicong@huawei.com>
 <86fbdc8c-0dcb-9b8f-d843-63460d8b1d6a@arm.com>
 <9982dac0-9f2e-112a-d440-467c8e8f8aa4@huawei.com>
 <40f1b5ad-2165-bb81-1ff5-89786373fa14@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <5bbd5364-fcec-5fc2-4780-e9b44f2ab135@huawei.com>
Date: Tue, 15 Nov 2022 11:34:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <40f1b5ad-2165-bb81-1ff5-89786373fa14@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
Cc: wangkefeng.wang@huawei.com, darren@os.amperecomputing.com, peterz@infradead.org, yangyicong@hisilicon.com, punit.agrawal@bytedance.com, Nadav Amit <namit@vmware.com>, guojian@oppo.com, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, Barry Song <21cnbao@gmail.com>, Mel Gorman <mgorman@suse.de>, linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, prime.zeng@hisilicon.com, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022/11/14 22:19, Anshuman Khandual wrote:
> 
> 
> On 11/14/22 14:16, Yicong Yang wrote:
>> On 2022/11/14 11:29, Anshuman Khandual wrote:
>>>
>>> On 10/28/22 13:42, Yicong Yang wrote:
>>>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>>>> +{
>>>> +	/*
>>>> +	 * TLB batched flush is proved to be beneficial for systems with large
>>>> +	 * number of CPUs, especially system with more than 8 CPUs. TLB shutdown
>>>> +	 * is cheap on small systems which may not need this feature. So use
>>>> +	 * a threshold for enabling this to avoid potential side effects on
>>>> +	 * these platforms.
>>>> +	 */
>>>> +	if (num_online_cpus() <= CONFIG_ARM64_NR_CPUS_FOR_BATCHED_TLB)
>>>> +		return false;
>>>> +
>>>> +#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
>>>> +	if (unlikely(this_cpu_has_cap(ARM64_WORKAROUND_REPEAT_TLBI)))
>>>> +		return false;
>>>> +#endif
>>> should_defer_flush() is immediately followed by set_tlb_ubc_flush_pending() which calls
>>> arch_tlbbatch_add_mm(), triggering the actual TLBI flush via __flush_tlb_page_nosync().
>>> It should be okay to check capability with this_cpu_has_cap() as the entire call chain
>>> here is executed on the same cpu. But just wondering if cpus_have_const_cap() would be
>>> simpler, consistent, and also cost effective ?
>>>
>> ok. Checked cpus_have_const_cap() I think it matches your words.
>>
>>> Regardless, a comment is needed before the #ifdef block explaining why it does not make
>>> sense to defer/batch when __tlbi()/__tlbi_user() implementation will execute 'dsb(ish)'
>>> between two TLBI instructions to workaround the errata.
>>>
>> The workaround for the errata mentioned the affected platforms need the tlbi+dsb to be done
>> twice, so I'm not sure if we defer the final dsb will cause any problem so I think the judgement
>> here is used for safety. I have no such platform to test if it's ok to defer the last dsb.
> 
> We should not defer TLB flush on such systems, as ensured by the above test and 'false'
> return afterwards. The only question is whether this decision should be taken at a CPU
> level (which is affected by the errata) or the whole system level.
> 
> What is required now
> 
> - Replace this_cpu_has_cap() with cpus_have_const_cap ?
> - Add the following comment before the #ifdef check
> 

Have respin the series according to the above comments:
https://lore.kernel.org/lkml/20221115031425.44640-3-yangyicong@huawei.com/

Thanks.

> /*
>  * TLB flush deferral is not required on systems, which are affected with
>  * ARM64_WORKAROUND_REPEAT_TLBI, as __tlbi()/__tlbi_user() implementation
>  * will have two consecutive TLBI instructions with a dsb(ish) in between
>  * defeating the purpose (i.e save overall 'dsb ish' cost).
>  */
> 
> .
> 
