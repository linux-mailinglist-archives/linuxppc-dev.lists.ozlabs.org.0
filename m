Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F62951C2B0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 16:34:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvGRd6NJbz3cBM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 00:34:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com;
 envelope-from=tongtiangen@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvGR70Rlrz3bcK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 00:33:51 +1000 (AEST)
Received: from kwepemi500003.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KvGPg0fVQz1JBgJ;
 Thu,  5 May 2022 22:32:39 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi500003.china.huawei.com (7.221.188.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 5 May 2022 22:33:43 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 5 May 2022 22:33:41 +0800
Message-ID: <618afddc-7110-d6bd-57a4-b80777d560b6@huawei.com>
Date: Thu, 5 May 2022 22:33:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v4 4/7] arm64: add copy_{to, from}_user to machine
 check safe
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20220420030418.3189040-1-tongtiangen@huawei.com>
 <20220420030418.3189040-5-tongtiangen@huawei.com> <YnJU4NIrJmHLawgk@arm.com>
 <7da54d72-e5fa-41b5-67ea-a0b084e4c94a@huawei.com> <YnPUHC3GlZs6XHU4@arm.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <YnPUHC3GlZs6XHU4@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600017.china.huawei.com (7.193.23.234)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Guohanjun <guohanjun@huawei.com>,
 Will Deacon <will@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Xie XiuQi <xiexiuqi@huawei.com>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



在 2022/5/5 21:41, Catalin Marinas 写道:
> On Thu, May 05, 2022 at 02:39:43PM +0800, Tong Tiangen wrote:
>> 在 2022/5/4 18:26, Catalin Marinas 写道:
>>> On Wed, Apr 20, 2022 at 03:04:15AM +0000, Tong Tiangen wrote:
>>>> Add copy_{to, from}_user() to machine check safe.
>>>>
>>>> If copy fail due to hardware memory error, only the relevant processes are
>>>> affected, so killing the user process and isolate the user page with
>>>> hardware memory errors is a more reasonable choice than kernel panic.
>>>
>>> Just to make sure I understand - we can only recover if the fault is in
>>> a user page. That is, for a copy_from_user(), we can only handle the
>>> faults in the source address, not the destination.
>>
>> At the beginning, I also thought we can only recover if the fault is in a
>> user page.
>> After discussion with a Mark[1], I think no matter user page or kernel page,
>> as long as it is triggered by the user process, only related processes will
>> be affected. According to this
>> understanding, it seems that all uaccess can be recovered.
>>
>> [1]https://patchwork.kernel.org/project/linux-arm-kernel/patch/20220406091311.3354723-6-tongtiangen@huawei.com/
> 
> We can indeed safely skip this copy and return an error just like
> pretending there was a user page fault. However, my point was more
> around the "isolate the user page with hardware memory errors". If the
> fault is on a kernel address, there's not much you can do about. You'll
> likely trigger it later when you try to access that address (maybe it
> was freed and re-allocated). Do we hope we won't get the same error
> again on that kernel address?

I think the page with memory error will be isolated by memory_failure(), 
generally, isolation will succeed, if isolate failure(we need to find 
out why), then maybe the same error will trigger it later.

Thanks.

> 
