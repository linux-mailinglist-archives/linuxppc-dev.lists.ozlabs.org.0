Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BC82E0DF4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 18:47:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0kLz4Th6zDqTF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 04:47:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0kKH6D4BzDqGX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Dec 2020 04:46:07 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4D0kK44K6fz9v0yl;
 Tue, 22 Dec 2020 18:46:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id PX7TMhZx0fje; Tue, 22 Dec 2020 18:46:00 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4D0kK41B2Tz9v0yj;
 Tue, 22 Dec 2020 18:46:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C98CE8B81B;
 Tue, 22 Dec 2020 18:46:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vLezCVy7nlQs; Tue, 22 Dec 2020 18:46:01 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D3EC68B812;
 Tue, 22 Dec 2020 18:46:00 +0100 (CET)
Subject: Re: [PATCH] powerpc:Don't print raw EIP/LR hex values in dump_stack()
 and show_regs()
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Xiaoming Ni <nixiaoming@huawei.com>
References: <20201221032758.12143-1-nixiaoming@huawei.com>
 <2279fc96-1f10-0c3f-64d9-734f18758620@csgroup.eu>
 <20201221163130.GZ2672@gate.crashing.org>
 <ad814ccf34c14c76b45e50b6e7741c3a@AcuMS.aculab.com>
 <20201221171228.GA2672@gate.crashing.org>
 <9b874bd4-9ac8-eb94-8432-8d6193c3feaf@huawei.com>
 <20201222172922.GE2672@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <57a31937-9332-f05b-9200-b071e2fee132@csgroup.eu>
Date: Tue, 22 Dec 2020 18:45:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201222172922.GE2672@gate.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: "ravi.bangoria@linux.ibm.com" <ravi.bangoria@linux.ibm.com>,
 "mikey@neuling.org" <mikey@neuling.org>,
 "yanaijie@huawei.com" <yanaijie@huawei.com>,
 "wangle6@huawei.com" <wangle6@huawei.com>,
 "haren@linux.ibm.com" <haren@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "npiggin@gmail.com" <npiggin@gmail.com>,
 David Laight <David.Laight@aculab.com>, "paulus@samba.org" <paulus@samba.org>,
 "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 22/12/2020 à 18:29, Segher Boessenkool a écrit :
> On Tue, Dec 22, 2020 at 09:45:03PM +0800, Xiaoming Ni wrote:
>> On 2020/12/22 1:12, Segher Boessenkool wrote:
>>> On Mon, Dec 21, 2020 at 04:42:23PM +0000, David Laight wrote:
>>>> From: Segher Boessenkool
>>>>> Sent: 21 December 2020 16:32
>>>>>
>>>>> On Mon, Dec 21, 2020 at 04:17:21PM +0100, Christophe Leroy wrote:
>>>>>> Le 21/12/2020 à 04:27, Xiaoming Ni a écrit :
>>>>>>> Since the commit 2b0e86cc5de6 ("powerpc/fsl_booke/32: implement KASLR
>>>>>>> infrastructure"), the powerpc system is ready to support KASLR.
>>>>>>> To reduces the risk of invalidating address randomization, don't print
>>>>>>> the
>>>>>>> EIP/LR hex values in dump_stack() and show_regs().
>>>>>
>>>>>> I think your change is not enough to hide EIP address, see below a dump
>>>>>> with you patch, you get "Faulting instruction address: 0xc03a0c14"
>>>>>
>>>>> As far as I can see the patch does nothing to the GPR printout.  Often
>>>>> GPRs contain code addresses.  As one example, the LR is moved via a GPR
>>>>> (often GPR0, but not always) for storing on the stack.
>>>>>
>>>>> So this needs more work.
>>>>
>>>> If the dump_stack() is from an oops you need the real EIP value
>>>> on order to stand any chance of making headway.
>>>
>>> Or at least the function name + offset, yes.
>>>
>> When the system is healthy, only symbols and offsets are printed,
>> Output address and symbol + offset when the system is dying
>> Does this meet both debugging and security requirements?
> 
> If you have the vmlinux, sym+off is enough to find what instruction
> caused the crash.
> 
> It does of course not give all the information you get in a crash dump
> with all the registers, so it does hinder debugging a bit.  This is a
> tradeoff.
> 
> Most debugging will need xmon or similar (or printf-style debugging)
> anyway; and otoh the register dump will render KASLR largely
> ineffective.
> 
>> For example:
>>
>> +static void __show_regs_ip_lr(const char *flag, unsigned long addr)
>> +{
>> + if (system_going_down()) { /* panic oops reboot */
>> +         pr_cont("%s["REG"] %pS", flag, addr, (void *)addr);
>> + } else {
>> +         pr_cont("%s%pS", flag, (void *)addr);
>> + }
>> +}
> 
> *If* you are certain the system goes down immediately, and you are also
> certain this information will not help defeat ASLR after a reboot, you
> could just print whatever, sure.
> 
> Otherwise, you only want to show some very few registers.  Or, make sure
> no attackers can ever see these dumps (which is hard, many systems trust
> all (local) users with it!)  Which means we first will need some very
> different patches, before any of this can be much useful :-(
> 

So IIUC, on one side we enlarge the dumping of registers with commits like 
https://github.com/linuxppc/linux/commit/bf13718bc57ada25016d9fe80323238d0b94506e#diff-8b965e0e62fc1b6ad5e51bf0a539941e929754cdb716041b06b4f4a5f73590f9, 
and on the other side we want to narrow it and hide registers ? I'm lost.

Christophe
