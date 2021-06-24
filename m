Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3D53B2D49
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 13:10:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9cqg3ky1z3bvc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 21:10:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9cq70tzLz2yWL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 21:09:51 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G9cpx3dSFzBDTt;
 Thu, 24 Jun 2021 13:09:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k-tcnJDoux7Z; Thu, 24 Jun 2021 13:09:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G9cpw4Y8dzBDTJ;
 Thu, 24 Jun 2021 13:09:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D0A98B7E7;
 Thu, 24 Jun 2021 13:09:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0xfF4S_8GNu9; Thu, 24 Jun 2021 13:09:44 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E65E88B764;
 Thu, 24 Jun 2021 13:09:43 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc/kprobes: Fix Oops by passing ppc_inst as a
 pointer to emulate_step() on ppc32
To: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <5bdc8cbc9a95d0779e27c9ddbf42b40f51f883c0.1624425798.git.christophe.leroy@csgroup.eu>
 <1624531892.3vdz8ibfty.naveen@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <b44b66f4-3e46-425b-3c8e-d5a7a180494a@csgroup.eu>
Date: Thu, 24 Jun 2021 13:09:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1624531892.3vdz8ibfty.naveen@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/06/2021 à 12:59, Naveen N. Rao a écrit :
> Christophe Leroy wrote:
>> From: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>>
>> Trying to use a kprobe on ppc32 results in the below splat:
>>     BUG: Unable to handle kernel data access on read at 0x7c0802a6
>>     Faulting instruction address: 0xc002e9f0
>>     Oops: Kernel access of bad area, sig: 11 [#1]
>>     BE PAGE_SIZE=4K PowerPC 44x Platform
>>     Modules linked in:
>>     CPU: 0 PID: 89 Comm: sh Not tainted 5.13.0-rc1-01824-g3a81c0495fdb #7
>>     NIP:  c002e9f0 LR: c0011858 CTR: 00008a47
>>     REGS: c292fd50 TRAP: 0300   Not tainted  (5.13.0-rc1-01824-g3a81c0495fdb)
>>     MSR:  00009000 <EE,ME>  CR: 24002002  XER: 20000000
>>     DEAR: 7c0802a6 ESR: 00000000
>>     <snip>
>>     NIP [c002e9f0] emulate_step+0x28/0x324
>>     LR [c0011858] optinsn_slot+0x128/0x10000
>>     Call Trace:
>>      opt_pre_handler+0x7c/0xb4 (unreliable)
>>      optinsn_slot+0x128/0x10000
>>      ret_from_syscall+0x0/0x28
>>
>> The offending instruction is:
>>     81 24 00 00     lwz     r9,0(r4)
>>
>> Here, we are trying to load the second argument to emulate_step():
>> struct ppc_inst, which is the instruction to be emulated. On ppc64,
>> structures are passed in registers when passed by value. However, per
>> the ppc32 ABI, structures are always passed to functions as pointers.
>> This isn't being adhered to when setting up the call to emulate_step()
>> in the optprobe trampoline. Fix the same.
>>
>> Fixes: eacf4c0202654a ("powerpc: Enable OPTPROBES on PPC32")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>> ---
>> v2: Rebased on powerpc/merge 7f030e9d57b8
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> Thanks for rebasing this!
> 
> I think git am drops everything after three dashes, so applying this patch will drop your SOB. The 
> recommended style (*) for adding a changelog is to include it within [] before the second SOB.
> 

Yes, I saw that after sending the mail. Usually I add a signed-off-by with 'git --amend -s' when I 
add the history, so it goes before the '---' I'm adding.

This time I must have forgotten the '-s' so it was added by the 'git format-patch -s' which is in my 
submit script, and so it was added at the end.

It's not really a big deal, up to Michael to either move it at the right place or discard it, I 
don't really mind. Do the easiest for you.

Thanks
Christophe
