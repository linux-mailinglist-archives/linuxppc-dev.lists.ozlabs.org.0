Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA56494C81
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 12:10:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfftV0lsDz3bXd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 22:10:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jfft04zHFz2yPp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 22:09:41 +1100 (AEDT)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4JffnP2sjDz1FCph;
 Thu, 20 Jan 2022 19:05:45 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 20 Jan 2022 19:09:31 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.21; Thu, 20 Jan 2022 19:09:30 +0800
Message-ID: <e1c7a290-45ac-25ab-018e-2289fad72413@huawei.com>
Date: Thu, 20 Jan 2022 19:09:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] powerpc: Fix virt_addr_valid() check
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>, Kees Cook <keescook@chromium.org>, 
 Laura Abbott <labbott@redhat.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mark Rutland
 <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras
 <paulus@samba.org>
References: <20211225120621.13908-1-wangkefeng.wang@huawei.com>
 <20211225120621.13908-2-wangkefeng.wang@huawei.com>
 <09ed46a5-6df3-ffc0-8243-61612c06153a@huawei.com>
 <1641871726.fshx7g5r92.astroid@bobo.none>
 <ca351bfc-3507-11ad-73f1-79ca772b55fd@csgroup.eu>
 <8a24ef1d-1c93-416d-cfbe-e63aacfb25cc@huawei.com>
 <017744c1-1252-a25c-3dcc-057ee18d0769@csgroup.eu>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <017744c1-1252-a25c-3dcc-057ee18d0769@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2022/1/20 15:31, Christophe Leroy wrote:
>
> Le 19/01/2022 à 02:15, Kefeng Wang a écrit :
>> On 2022/1/11 14:04, Christophe Leroy wrote:
>>> Le 11/01/2022 à 05:37, Nicholas Piggin a écrit :
>>>> Excerpts from Kefeng Wang's message of January 8, 2022 9:58 pm:
>>>>> Hi PPC maintainers， ping..
>>>> Hmm. I might have confused myself about this. I'm going back and
>>>> trying to work out what I was thinking when I suggested it. This
>>>> works on 64e because vmalloc space is below the kernel linear map,
>>>> right?
>>>>
>>>> On 64s it is the other way around and it is still possible to enable
>>>> flatmem on 64s. Altough we might just not hit the problem there because
>>>> __pa() will not mask away the vmalloc offset for 64s so it will still
>>>> return something that's outside the pfn_valid range for flatmem. That's
>>>> very subtle though.
>>> That's the way it works on PPC32 at least, so for me it's not chocking
>>> to have it work the same way on PPC64s.
>>>
>>> The main issue here is the way __pa() works. On PPC32 __pa = va -
>>> PAGE_OFFSET, so it works correctly for any address.
>>> On PPC64, __pa() works by masking out the 2 top bits instead of
>>> substracting PAGE_OFFSET, so the test must add a verification that we
>>> really have the 2 top bits set at first. This is what (addr >=
>>> PAGE_OFFSET) does. Once this first test is done, we can perfectly rely
>>> on pfn_valid() just like PPC32, I see absolutely no point in an
>>> additionnal test checking the addr is below KERN_VIRT_START.
>>
>> Hi Christophe and Nicholas， for ppc32， I think we need check the upper
>> limit,
> Why ? Have you experimented any problem at all on PPC32 with the way it
> is done at the moment ?
>
> I don't think we have to change PPC32 at all unless we have a real
> reason to do it.

yes, I missed this commit in old kernel(lts5.10), you have fixed the 
upper limit.

commit 602946ec2f90d5bd965857753880db29d2d9a1e9
Author: Christophe Leroy <christophe.leroy@csgroup.eu>
Date:   Tue Oct 12 12:40:37 2021 +0200

     powerpc: Set max_mapnr correctly


>
>> eg,  addr >= PAGE_OFFSET && addr < high_memory
> Isn't it exactly what pfn_valid() already do today ?
> Why change that at all ?
>
> Christophe
>
>> arch/powerpc/mm/mem.c:  high_memory = (void *) __va(max_low_pfn *
>> PAGE_SIZE);
>>
>> for ppc32 max_low_pfn is the upper low memory pfn,  and For ppc64,
>> high_memory is
>>
>> the max memory pfn, it looks good too, correct me if I'm wrong, if the
>> above check
>>
>> is ok, I will send a new v3,  thanks.
>>
>>
>>
>>
>>>
>>>> The checks added to __pa actually don't prevent vmalloc memory from
>>>> being passed to it either on 64s, only a more basic test.
>>> That's correct. It is the role of pfn_valid() to check that.
>>>
>>> Christophe
>>>
>>>> I think 64s wants (addr >= PAGE_OFFSET && addr < KERN_VIRT_START) as
>>>> the condition.  Could possibly add that check to __pa as well to
>>>> catch vmalloc addresses.
>>>>
>>>> Thanks,
>>>> Nick
>>>>
>>> >
