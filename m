Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B4D3DA1C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 13:07:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gb75p2C4Wz3cXM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 21:07:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gb75L32rxz3bmj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jul 2021 21:06:43 +1000 (AEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Gb70b6fynzZqYW;
 Thu, 29 Jul 2021 19:02:39 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 29 Jul 2021 19:06:08 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 29 Jul 2021 19:06:08 +0800
Subject: Re: [PATCH v2 5/7] kallsyms: Rename is_kernel() and is_kernel_text()
To: Steven Rostedt <rostedt@goodmis.org>
References: <20210728081320.20394-1-wangkefeng.wang@huawei.com>
 <20210728081320.20394-6-wangkefeng.wang@huawei.com>
 <20210728112836.289865f5@oasis.local.home>
 <1551f9cc-eaf8-efef-0590-e2549eebe4ae@huawei.com>
 <20210729000531.7c4da1f1@oasis.local.home>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <3dc2f31a-2dad-fefc-b974-8433be4c190f@huawei.com>
Date: Thu, 29 Jul 2021 19:06:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210729000531.7c4da1f1@oasis.local.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500001.china.huawei.com (7.185.36.107)
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
Cc: linux-arch@vger.kernel.org, ryabinin.a.a@gmail.com,
 Daniel Borkmann <daniel@iogearbox.net>, arnd@arndb.de,
 linux-kernel@vger.kernel.org, ast@kernel.org,
 Nathan Chancellor <nathan@kernel.org>, mingo@redhat.com, paulus@samba.org,
 Sami Tolvanen <samitolvanen@google.com>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2021/7/29 12:05, Steven Rostedt wrote:
> On Thu, 29 Jul 2021 10:00:51 +0800
> Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
>> On 2021/7/28 23:28, Steven Rostedt wrote:
>>> On Wed, 28 Jul 2021 16:13:18 +0800
>>> Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>>>   
>>>> The is_kernel[_text]() function check the address whether or not
>>>> in kernel[_text] ranges, also they will check the address whether
>>>> or not in gate area, so use better name.
>>> Do you know what a gate area is?
>>>
>>> Because I believe gate area is kernel text, so the rename just makes it
>>> redundant and more confusing.
>> Yes, the gate area(eg, vectors part on ARM32, similar on x86/ia64) is
>> kernel text.
>>
>> I want to keep the 'basic' section boundaries check, which only check
>> the start/end
>>
>> of sections, all in section.h,  could we use 'generic' or 'basic' or
>> 'core' in the naming?
>>
>>    * is_kernel_generic_data()	--- come from core_kernel_data() in kernel.h
>>    * is_kernel_generic_text()
>>
>> The old helper could remain unchanged, any suggestion, thanks.
> Because it looks like the check of just being in the range of "_stext"
> to "_end" is just an internal helper, why not do what we do all over
> the kernel, and just prefix the function with a couple of underscores,
> that denote that it's internal?
>
>    __is_kernel_text()

OK， thanks for your advise,  there's already a __is_kernel_text() in 
arch/x86/mm/init_32.c,

I will change it to is_x32_kernel_text() to avoid conflict on x86_32.

>
> Then you have:
>
>   static inline int is_kernel_text(unsigned long addr)
>   {
> 	if (__is_kernel_text(addr))
>   		return 1;
>   	return in_gate_area_no_mm(addr);
>   }
>
> -- Steve
> .
>
