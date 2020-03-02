Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D951317574C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 10:39:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WFTM1kSzzDqg9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 20:39:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=huawei.com;
 envelope-from=yanaijie@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WFRc0mPRzDqcR
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 20:37:29 +1100 (AEDT)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E5EA9B8A6EB8FF894F17;
 Mon,  2 Mar 2020 17:37:21 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.195) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0;
 Mon, 2 Mar 2020 17:37:11 +0800
Subject: Re: [PATCH v3 0/6] implement KASLR for powerpc/fsl_booke/64
To: Scott Wood <oss@buserror.net>, Daniel Axtens <dja@axtens.net>,
 <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>,
 <diana.craciun@nxp.com>, <christophe.leroy@c-s.fr>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>, <me@tobin.cc>
References: <20200206025825.22934-1-yanaijie@huawei.com>
 <87tv3drf79.fsf@dja-thinkpad.axtens.net>
 <8171d326-5138-4f5c-cff6-ad3ee606f0c2@huawei.com>
 <e8cd8f287934954cfa07dcf76ac73492e2d49a5b.camel@buserror.net>
 <dd8db870-b607-3f74-d3bc-a8d9f33f9852@huawei.com>
 <4c0e7fec63dbc7b91fa6c24692c73c256c131f51.camel@buserror.net>
 <188971ed-f1c4-39b3-c07e-89cc593d88d7@huawei.com>
 <530c49dfd97c811dc53ffc78c594d7133f7eb1e9.camel@buserror.net>
 <35e6c660-3896-bdb8-45f3-c1504aa2171f@huawei.com>
 <31b5966ba579ef246176a7d8ad18c2c02788dd27.camel@buserror.net>
 <17658c2b-9eb8-cee9-e9a2-93d316a401b1@huawei.com>
 <7f608c18250c509ff091990d4bb460846fae11a0.camel@buserror.net>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <9b1d1d42-ecc9-8d0d-b616-849b0b368d67@huawei.com>
Date: Mon, 2 Mar 2020 17:37:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <7f608c18250c509ff091990d4bb460846fae11a0.camel@buserror.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.221.195]
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
Cc: linux-kernel@vger.kernel.org, zhaohongjiang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



在 2020/3/2 16:47, Scott Wood 写道:
> On Mon, 2020-03-02 at 15:12 +0800, Jason Yan wrote:
>>
>> 在 2020/3/2 11:24, Scott Wood 写道:
>>> On Mon, 2020-03-02 at 10:17 +0800, Jason Yan wrote:
>>>>
>>>> 在 2020/3/1 6:54, Scott Wood 写道:
>>>>> On Sat, 2020-02-29 at 15:27 +0800, Jason Yan wrote:
>>>>>>
>>>>>> Turnning to %p may not be a good idea in this situation. So
>>>>>> for the REG logs printed when dumping stack, we can disable it when
>>>>>> KASLR is open. For the REG logs in other places like show_regs(),
>>>>>> only
>>>>>> privileged can trigger it, and they are not combind with a symbol,
>>>>>> so
>>>>>> I think it's ok to keep them.
>>>>>>
>>>>>> diff --git a/arch/powerpc/kernel/process.c
>>>>>> b/arch/powerpc/kernel/process.c
>>>>>> index fad50db9dcf2..659c51f0739a 100644
>>>>>> --- a/arch/powerpc/kernel/process.c
>>>>>> +++ b/arch/powerpc/kernel/process.c
>>>>>> @@ -2068,7 +2068,10 @@ void show_stack(struct task_struct *tsk,
>>>>>> unsigned
>>>>>> long *stack)
>>>>>>                     newsp = stack[0];
>>>>>>                     ip = stack[STACK_FRAME_LR_SAVE];
>>>>>>                     if (!firstframe || ip != lr) {
>>>>>> -                       printk("["REG"] ["REG"] %pS", sp, ip, (void
>>>>>> *)ip);
>>>>>> +                       if (IS_ENABLED(CONFIG_RANDOMIZE_BASE))
>>>>>> +                               printk("%pS", (void *)ip);
>>>>>> +                       else
>>>>>> +                               printk("["REG"] ["REG"] %pS", sp,
>>>>>> ip,
>>>>>> (void *)ip);
>>>>>
>>>>> This doesn't deal with "nokaslr" on the kernel command line.  It also
>>>>> doesn't
>>>>> seem like something that every callsite should have to opencode,
>>>>> versus
>>>>> having
>>>>> an appropriate format specifier behaves as I described above (and I
>>>>> still
>>>>> don't see why that format specifier should not be "%p").
>>>>>
>>>>
>>>> Actually I still do not understand why we should print the raw value
>>>> here. When KALLSYMS is enabled we have symbol name  and  offset like
>>>> put_cred_rcu+0x108/0x110, and when KALLSYMS is disabled we have the raw
>>>> address.
>>>
>>> I'm more concerned about the stack address for wading through a raw stack
>>> dump
>>> (to find function call arguments, etc).  The return address does help
>>> confirm
>>> that I'm on the right stack frame though, and also makes looking up a line
>>> number slightly easier than having to look up a symbol address and then
>>> add
>>> the offset (at least for non-module addresses).
>>>
>>> As a random aside, the mismatch between Linux printing a hex offset and
>>> GDB
>>> using decimal in disassembly is annoying...
>>>
>>
>> OK, I will send a RFC patch to add a new format specifier such as "%pk"
>> or change the exsiting "%pK" to print raw value of addresses when KASLR
>> is disabled and print hash value of addresses when KASLR is enabled.
>> Let's see what the printk guys would say :)
> 
> I'm not sure that a new format specifier is needed versus changing the
> behavior of "%p", and "%pK" definitely doesn't seem suitable given that it's
> intended to be more restricted than "%p" (see commit ef0010a30935de4).  The
> question is whether there is a legitimate reason to hash in the absence of
> kaslr.
> 

The problem is that if we change the behavior of "%p", we have to turn
all exsiting "%p" to "%pK". Hashing is still reasonable when there is no
kaslr because some architectures support randomize at build time such as 
arm64.


> -Scott
> 
> 
> 
> .
> 

