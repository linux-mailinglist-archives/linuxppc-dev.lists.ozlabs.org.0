Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A6962B185
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 03:52:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBndp4rprz3f2v
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 13:52:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBndG0KCmz30NN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 13:51:58 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2060D13D5;
	Tue, 15 Nov 2022 18:51:32 -0800 (PST)
Received: from [10.162.40.17] (unknown [10.162.40.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8A1C3F663;
	Tue, 15 Nov 2022 18:51:15 -0800 (PST)
Message-ID: <01ffa482-8d59-4cf9-f103-fb39a987873d@arm.com>
Date: Wed, 16 Nov 2022 08:21:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v6 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
Content-Language: en-US
To: Nadav Amit <namit@vmware.com>, Yicong Yang <yangyicong@huawei.com>
References: <20221115031425.44640-1-yangyicong@huawei.com>
 <20221115031425.44640-3-yangyicong@huawei.com>
 <0D3A45FE-5367-40CD-A035-37F6EE98B25E@vmware.com>
 <91e4804d-cb99-fd22-dafd-2f418f5c7ba9@huawei.com>
 <E3756C83-767A-4C68-AE3F-8C979F47A029@vmware.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <E3756C83-767A-4C68-AE3F-8C979F47A029@vmware.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>, "prime.zeng@hisilicon.com" <prime.zeng@hisilicon.com>, "guojian@oppo.com" <guojian@oppo.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, kernel list <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, "punit.agrawal@bytedance.com" <punit.agrawal@bytedance.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, "zhangshiming@oppo.com" <zhangshiming@oppo.com>, "lipeifeng@oppo.com" <lipeifeng@oppo.com>, Jonathan Corbet <corbet@lwn.net>, X86 ML <x86@kernel.org>, Barry Song <21cnbao@gmail.com>, Mel Gorman <mgorman@suse.de>, Arnd Bergmann <arnd@arndb.de>, "realmz6@gmail.com" <realmz6@gmail.com>, Barry Song <v-songbaohua@oppo.com>, "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, "darren@os.amperecomputing.com" <darren
 @os.amperecomputing.com>, "yangyicong@hisilicon.com" <yangyicong@hisilicon.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, haoxin <xhao@linux.alibaba.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "huzhanyuan@oppo.com" <huzhanyuan@oppo.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/16/22 07:26, Nadav Amit wrote:
> On Nov 15, 2022, at 5:50 PM, Yicong Yang <yangyicong@huawei.com> wrote:
> 
>> !! External Email
>>
>> On 2022/11/16 7:38, Nadav Amit wrote:
>>> On Nov 14, 2022, at 7:14 PM, Yicong Yang <yangyicong@huawei.com> wrote:
>>>
>>>> diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
>>>> index 8a497d902c16..5bd78ae55cd4 100644
>>>> --- a/arch/x86/include/asm/tlbflush.h
>>>> +++ b/arch/x86/include/asm/tlbflush.h
>>>> @@ -264,7 +264,8 @@ static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
>>>> }
>>>>
>>>> static inline void arch_tlbbatch_add_mm(struct arch_tlbflush_unmap_batch *batch,
>>>> -                                    struct mm_struct *mm)
>>>> +                                    struct mm_struct *mm,
>>>> +                                    unsigned long uaddr)
>>>
>>> Logic-wise it looks fine. I notice the “v6", and it should not be blocking,
>>> but I would note that the name "arch_tlbbatch_add_mm()” does not make much
>>> sense once the function also takes an address.
>>
>> ok the add_mm should still apply to x86 since the address is not used, but not for arm64.
>>
>>> It could’ve been something like arch_set_tlb_ubc_flush_pending() but that’s
>>> too long. I’m not very good with naming, but the current name is not great.
>>
>> What about arch_tlbbatch_add_pending()? Considering the x86 is pending the flush operation
>> while arm64 is pending the sychronization operation, arch_tlbbatch_add_pending() should
>> make sense to both.
> 
> Sounds reasonable. Thanks.

+1, agreed.
