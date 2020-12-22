Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F392E0B92
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 15:17:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0dhK3xSfzDqgS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 01:17:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com;
 envelope-from=nixiaoming@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0czV59mxzDqGL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Dec 2020 00:45:26 +1100 (AEDT)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D0cy65Bv6zLxlQ;
 Tue, 22 Dec 2020 21:44:14 +0800 (CST)
Received: from [10.67.102.197] (10.67.102.197) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Tue, 22 Dec 2020 21:45:03 +0800
Subject: Re: [PATCH] powerpc:Don't print raw EIP/LR hex values in dump_stack()
 and show_regs()
To: Segher Boessenkool <segher@kernel.crashing.org>, David Laight
 <David.Laight@aculab.com>
References: <20201221032758.12143-1-nixiaoming@huawei.com>
 <2279fc96-1f10-0c3f-64d9-734f18758620@csgroup.eu>
 <20201221163130.GZ2672@gate.crashing.org>
 <ad814ccf34c14c76b45e50b6e7741c3a@AcuMS.aculab.com>
 <20201221171228.GA2672@gate.crashing.org>
From: Xiaoming Ni <nixiaoming@huawei.com>
Message-ID: <9b874bd4-9ac8-eb94-8432-8d6193c3feaf@huawei.com>
Date: Tue, 22 Dec 2020 21:45:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.0.1
MIME-Version: 1.0
In-Reply-To: <20201221171228.GA2672@gate.crashing.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.102.197]
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
Cc: "ravi.bangoria@linux.ibm.com" <ravi.bangoria@linux.ibm.com>,
 "mikey@neuling.org" <mikey@neuling.org>,
 "yanaijie@huawei.com" <yanaijie@huawei.com>,
 "wangle6@huawei.com" <wangle6@huawei.com>,
 "haren@linux.ibm.com" <haren@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "paulus@samba.org" <paulus@samba.org>, "npiggin@gmail.com" <npiggin@gmail.com>,
 "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020/12/22 1:12, Segher Boessenkool wrote:
> On Mon, Dec 21, 2020 at 04:42:23PM +0000, David Laight wrote:
>> From: Segher Boessenkool
>>> Sent: 21 December 2020 16:32
>>>
>>> On Mon, Dec 21, 2020 at 04:17:21PM +0100, Christophe Leroy wrote:
>>>> Le 21/12/2020 à 04:27, Xiaoming Ni a écrit :
>>>>> Since the commit 2b0e86cc5de6 ("powerpc/fsl_booke/32: implement KASLR
>>>>> infrastructure"), the powerpc system is ready to support KASLR.
>>>>> To reduces the risk of invalidating address randomization, don't print the
>>>>> EIP/LR hex values in dump_stack() and show_regs().
>>>
>>>> I think your change is not enough to hide EIP address, see below a dump
>>>> with you patch, you get "Faulting instruction address: 0xc03a0c14"
>>>
>>> As far as I can see the patch does nothing to the GPR printout.  Often
>>> GPRs contain code addresses.  As one example, the LR is moved via a GPR
>>> (often GPR0, but not always) for storing on the stack.
>>>
>>> So this needs more work.
>>
>> If the dump_stack() is from an oops you need the real EIP value
>> on order to stand any chance of making headway.
> 
> Or at least the function name + offset, yes.
> 
When the system is healthy, only symbols and offsets are printed,
Output address and symbol + offset when the system is dying
Does this meet both debugging and security requirements?
For example:

+static void __show_regs_ip_lr(const char *flag, unsigned long addr)
+{
+ if (system_going_down()) { /* panic oops reboot */
+         pr_cont("%s["REG"] %pS", flag, addr, (void *)addr);
+ } else {
+         pr_cont("%s%pS", flag, (void *)addr);
+ }
+}
+
  static void __show_regs(struct pt_regs *regs)
  {
         int i, trap;

-   printk("NIP:  "REG" LR: "REG" CTR: "REG"\n",
-          regs->nip, regs->link, regs->ctr);
+ __show_regs_ip_lr("NIP: ", regs->nip);
+ __show_regs_ip_lr(" LR: ", regs->link);
+ pr_cont(" CTR: "REG"\n", regs->ctr);
         printk("REGS: %px TRAP: %04lx   %s  (%s)\n",
                regs, regs->trap, print_tainted(), init_utsname()->release);
         printk("MSR:  "REG" ", regs->msr);




>> Otherwise you might just as well just print 'borked - tough luck'.
> 
> Yes.  ASLR is a house of cards.  But that isn't constructive wrt this
> patch :-)
> 
> 
> Segher
> .
> 

Thanks
Xiaoming Ni
