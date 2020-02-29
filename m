Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B0F174584
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 08:29:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Tyhf3H5ZzDrFm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 18:29:22 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Tyfn3YTZzDrC5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 18:27:41 +1100 (AEDT)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id B1E09537301830FD26E2;
 Sat, 29 Feb 2020 15:27:24 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.195) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0;
 Sat, 29 Feb 2020 15:27:15 +0800
Subject: Re: [PATCH v3 0/6] implement KASLR for powerpc/fsl_booke/64
To: Scott Wood <oss@buserror.net>, Daniel Axtens <dja@axtens.net>,
 <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>,
 <diana.craciun@nxp.com>, <christophe.leroy@c-s.fr>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>
References: <20200206025825.22934-1-yanaijie@huawei.com>
 <87tv3drf79.fsf@dja-thinkpad.axtens.net>
 <8171d326-5138-4f5c-cff6-ad3ee606f0c2@huawei.com>
 <e8cd8f287934954cfa07dcf76ac73492e2d49a5b.camel@buserror.net>
 <dd8db870-b607-3f74-d3bc-a8d9f33f9852@huawei.com>
 <4c0e7fec63dbc7b91fa6c24692c73c256c131f51.camel@buserror.net>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <188971ed-f1c4-39b3-c07e-89cc593d88d7@huawei.com>
Date: Sat, 29 Feb 2020 15:27:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <4c0e7fec63dbc7b91fa6c24692c73c256c131f51.camel@buserror.net>
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



在 2020/2/29 12:28, Scott Wood 写道:
> On Fri, 2020-02-28 at 14:47 +0800, Jason Yan wrote:
>>
>> 在 2020/2/28 13:53, Scott Wood 写道:
>>> On Wed, 2020-02-26 at 16:18 +0800, Jason Yan wrote:
>>>> Hi Daniel,
>>>>
>>>> 在 2020/2/26 15:16, Daniel Axtens 写道:
>>>>> Maybe replacing the REG format string in KASLR mode would be
>>>>> sufficient?
>>>>>
>>>>
>>>> Most archs have removed the address printing when dumping stack. Do we
>>>> really have to print this?
>>>>
>>>> If we have to do this, maybe we can use "%pK" so that they will be
>>>> hidden from unprivileged users.
>>>
>>> I've found the addresses to be useful, especially if I had a way to dump
>>> the
>>> stack data itself.  Wouldn't the register dump also be likely to give away
>>> the
>>> addresses?
>>
>> If we have to print the address, then kptr_restrict and dmesg_restrict
>> must be set properly so that unprivileged users cannot see them.
> 
> And how does that work with crash dumps that could be from any context?
> 
> dmesg_restrict is irrelevant as it just controls who can see the dmesg, not
> what goes into it.  kptr_restrict=1 will only get the value if you're not in
> any sort of IRQ, *and* if the crashing context happened to have CAP_SYSLOG.
> No other value of kptr_restrict will ever get you the raw value.
>
>>>
>>> I don't see any debug setting for %pK (or %p) to always print the actual
>>> address (closest is kptr_restrict=1 but that only works in certain
>>> contexts)... from looking at the code it seems it hashes even if kaslr is
>>> entirely disabled?  Or am I missing something?
>>>
>>
>> Yes, %pK (or %p) always hashes whether kaslr is disabled or not. So if
>> we want the real value of the address, we cannot use it. But if you only
>> want to distinguish if two pointers are the same, it's ok.
> 
> Am I the only one that finds this a bit crazy?  If you want to lock a system
> down then fine, but why wage war on debugging even when there's no
> randomization going on?  Comparing two pointers for equality is not always
> adequate.
> 

AFAIK, %p hashing is only exist because of many legacy address printings
and force who really want the raw values to switch to %px or even %lx.
It's not the opposite of debugging. Raw address printing is not
forbidden, only people need to estimate the risk of adrdress leaks.

Turnning to %p may not be a good idea in this situation. So
for the REG logs printed when dumping stack, we can disable it when
KASLR is open. For the REG logs in other places like show_regs(), only
privileged can trigger it, and they are not combind with a symbol, so
I think it's ok to keep them.

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index fad50db9dcf2..659c51f0739a 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2068,7 +2068,10 @@ void show_stack(struct task_struct *tsk, unsigned 
long *stack)
                 newsp = stack[0];
                 ip = stack[STACK_FRAME_LR_SAVE];
                 if (!firstframe || ip != lr) {
-                       printk("["REG"] ["REG"] %pS", sp, ip, (void *)ip);
+                       if (IS_ENABLED(CONFIG_RANDOMIZE_BASE))
+                               printk("%pS", (void *)ip);
+                       else
+                               printk("["REG"] ["REG"] %pS", sp, ip, 
(void *)ip);
  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
                         ret_addr = ftrace_graph_ret_addr(current,
                                                 &ftrace_idx, ip, stack);


Thanks,
Jason

> -Scott
> 
> 
> 
> .
> 

