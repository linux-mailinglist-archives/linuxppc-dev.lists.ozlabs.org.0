Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A165BC181
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 04:47:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MW8H35319z3bms
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 12:47:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MW8Gc3qDpz2xJM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 12:47:17 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72BE613D5;
	Sun, 18 Sep 2022 19:46:50 -0700 (PDT)
Received: from [10.162.41.7] (unknown [10.162.41.7])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 053413F5A1;
	Sun, 18 Sep 2022 19:46:34 -0700 (PDT)
Message-ID: <7403e6bb-0011-381b-a99e-cbd9d7b1a270@arm.com>
Date: Mon, 19 Sep 2022 08:16:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/4] arm64: support batched/deferred tlb shootdown
 during page reclamation
Content-Language: en-US
To: Nadav Amit <namit@vmware.com>, Barry Song <21cnbao@gmail.com>
References: <20220822082120.8347-1-yangyicong@huawei.com>
 <20220822082120.8347-5-yangyicong@huawei.com>
 <1e8642d5-0e2d-5747-d0d2-5aa0817ea4af@arm.com>
 <CAGsJ_4xD4m-szM1Cm4N5ZRCODGC0fbW+BLBhy8g6+eK=aHPQNw@mail.gmail.com>
 <1125554b-c183-23c4-5516-95b918a761cc@arm.com>
 <CAGsJ_4zkRv7RYCB2SC0uydMSQWfwXs3-nkjxMoR7wgn2nt43gA@mail.gmail.com>
 <2AB9EC05-16B4-46F8-B716-53941C1C9A50@vmware.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <2AB9EC05-16B4-46F8-B716-53941C1C9A50@vmware.com>
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
Cc: "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>, "prime.zeng@hisilicon.com" <prime.zeng@hisilicon.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "yangyicong@hisilicon.com" <yangyicong@hisilicon.com>, Linux MM <linux-mm@kvack.org>, "guojian@oppo.com" <guojian@oppo.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "zhangshiming@oppo.com" <zhangshiming@oppo.com>, "lipeifeng@oppo.com" <lipeifeng@oppo.com>, "corbet@lwn.net" <corbet@lwn.net>, "x86@kernel.org" <x86@kernel.org>, Mel Gorman <mgorman@suse.de>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "realmz6@gmail.com" <realmz6@gmail.com>, Barry Song <v-songbaohua@oppo.com>, "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, "darren@os.am
 perecomputing.com" <darren@os.amperecomputing.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "xhao@linux.alibaba.com" <xhao@linux.alibaba.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "huzhanyuan@oppo.com" <huzhanyuan@oppo.com>, Yicong Yang <yangyicong@huawei.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/15/22 20:01, Nadav Amit wrote:
> 
> 
>> On Sep 14, 2022, at 11:42 PM, Barry Song <21cnbao@gmail.com> wrote:
>>
>>>
>>> The very idea behind TLB deferral is the opportunity it (might) provide
>>> to accumulate address ranges and cpu masks so that individual TLB flush
>>> can be replaced with a more cost effective range based TLB flush. Hence
>>> I guess unless address range or cpumask based cost effective TLB flush
>>> is available, deferral does not improve the unmap performance as much.
>>
>>
>> After sending tlbi, if we wait for the completion of tlbi, we have to get Ack
>> from all cpus in the system, tlbi is not scalable. The point here is that we
>> avoid waiting for each individual TLBi. Alternatively, they are batched. If
>> you read the benchmark in the commit log, you can find the great decline
>> in the cost to swap out a page.
> 
> Just a minor correction: arch_tlbbatch_flush() does not collect ranges.
> On x86 it only accumulate CPU mask.

Thanks Nadav for the clarification.
