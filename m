Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7907C53494E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 05:37:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7tt03CdQz3brm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 13:37:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L7tsX5637z2yyh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 13:37:01 +1000 (AEST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L7tqz2sp6zjX7b;
	Thu, 26 May 2022 11:35:43 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 26 May 2022 11:36:44 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 26 May 2022 11:36:42 +0800
Message-ID: <87bdb1c6-5803-d9c0-9208-432027ae1d8b@huawei.com>
Date: Thu, 26 May 2022 11:36:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v4 3/7] arm64: add support for machine check error
 safe
To: Mark Rutland <mark.rutland@arm.com>
References: <20220420030418.3189040-1-tongtiangen@huawei.com>
 <20220420030418.3189040-4-tongtiangen@huawei.com> <Yn54mA7KnlAs1dER@lakrids>
 <46e5954c-a9a8-f4a8-07cc-de42e2753051@huawei.com>
 <Yo3pP/Y+6HHuVBns@FVFF77S0Q05N>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <Yo3pP/Y+6HHuVBns@FVFF77S0Q05N>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, Guohanjun <guohanjun@huawei.com>, Will Deacon <will@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Ingo
 Molnar <mingo@redhat.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Xie XiuQi <xiexiuqi@huawei.com>, Borislav Petkov <bp@alien8.de>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



在 2022/5/25 16:30, Mark Rutland 写道:
> On Thu, May 19, 2022 at 02:29:54PM +0800, Tong Tiangen wrote:
>>
>>
>> 在 2022/5/13 23:26, Mark Rutland 写道:
>>> On Wed, Apr 20, 2022 at 03:04:14AM +0000, Tong Tiangen wrote:
>>>> During the processing of arm64 kernel hardware memory errors(do_sea()), if
>>>> the errors is consumed in the kernel, the current processing is panic.
>>>> However, it is not optimal.
>>>>
>>>> Take uaccess for example, if the uaccess operation fails due to memory
>>>> error, only the user process will be affected, kill the user process
>>>> and isolate the user page with hardware memory errors is a better choice.
>>>
>>> Conceptually, I'm fine with the idea of constraining what we do for a
>>> true uaccess, but I don't like the implementation of this at all, and I
>>> think we first need to clean up the arm64 extable usage to clearly
>>> distinguish a uaccess from another access.
>>
>> OK,using EX_TYPE_UACCESS and this extable type could be recover, this is
>> more reasonable.
> 
> Great.
> 
>> For EX_TYPE_UACCESS_ERR_ZERO, today we use it for kernel accesses in a
>> couple of cases, such as
>> get_user/futex/__user_cache_maint()/__user_swpX_asm(),
> 
> Those are all user accesses.
> 
> However, __get_kernel_nofault() and __put_kernel_nofault() use
> EX_TYPE_UACCESS_ERR_ZERO by way of __{get,put}_mem_asm(), so we'd need to
> refactor that code to split the user/kernel cases higher up the callchain.
> 
>> your suggestion is:
>> get_user continues to use EX_TYPE_UACCESS_ERR_ZERO and the other cases use
>> new type EX_TYPE_FIXUP_ERR_ZERO?
> 
> Yes, that's the rough shape. We could make the latter EX_TYPE_KACCESS_ERR_ZERO
> to be clearly analogous to EX_TYPE_UACCESS_ERR_ZERO, and with that I susepct we
> could remove EX_TYPE_FIXUP.
> 
> Thanks,
> Mark.
According to your suggestion, i think the definition is like this:

#define EX_TYPE_NONE                    0
#define EX_TYPE_FIXUP                   1    --> delete
#define EX_TYPE_BPF                     2
#define EX_TYPE_UACCESS_ERR_ZERO        3
#define EX_TYPE_LOAD_UNALIGNED_ZEROPAD  4
#define EX_TYPE_UACCESS		        xx   --> add
#define EX_TYPE_KACCESS_ERR_ZERO        xx   --> add
[The value defined by the macro here is temporary]

There are two points to modify:

1、_get_kernel_nofault() and __put_kernel_nofault()  using 
EX_TYPE_KACCESS_ERR_ZERO, Other positions using 
EX_TYPE_UACCESS_ERR_ZERO keep unchanged.

2、delete EX_TYPE_FIXUP.

There is no doubt about others. As for EX_TYPE_FIXUP, I think it needs 
to be retained, _cond_extable(EX_TYPE_FIXUP) is still in use in assembler.h.

Thanks,
Tong.

> .
