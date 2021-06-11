Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB2A3A3B98
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 08:02:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1Vcm5Tdpz3c1n
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 16:02:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1VcQ1bXdz303H
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 16:02:26 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G1VcH1cq2zBDlq;
 Fri, 11 Jun 2021 08:02:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PxNuC8tuxM4E; Fri, 11 Jun 2021 08:02:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G1VcH0h93zBDkH;
 Fri, 11 Jun 2021 08:02:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0869B8B82C;
 Fri, 11 Jun 2021 08:02:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oDNhFMeazg2W; Fri, 11 Jun 2021 08:02:22 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5470E8B765;
 Fri, 11 Jun 2021 08:02:22 +0200 (CEST)
Subject: Re: [PATCH 0/1] PPC32: fix ptrace() access to FPU registers
To: Radu Rendec <radu.rendec@gmail.com>, Daniel Axtens <dja@axtens.net>,
 Andreas Schwab <schwab@linux-m68k.org>
References: <20190610232758.19010-1-radu.rendec@gmail.com>
 <87r27t2el0.fsf@dja-thinkpad.axtens.net>
 <5fcdb5767b7cf4c7d5b7496c0032021e43115d39.camel@gmail.com>
 <87muif2y4l.fsf@dja-thinkpad.axtens.net>
 <fbf9f9cbb99fc40c7d7af86fee3984427c61b799.camel__46559.9162316479$1560860409$gmane$org@gmail.com>
 <875zp2rcip.fsf@igel.home> <87k1di2yxg.fsf@dja-thinkpad.axtens.net>
 <fd936660cde0d5f151b732d0f885ddf0b6ba67eb.camel@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <39d6eb22-2142-d869-7649-0242cecf5532@csgroup.eu>
Date: Fri, 11 Jun 2021 08:02:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fd936660cde0d5f151b732d0f885ddf0b6ba67eb.camel@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 Oleg Nesterov <oleg@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/06/2019 à 14:57, Radu Rendec a écrit :
> On Wed, 2019-06-19 at 10:36 +1000, Daniel Axtens wrote:
>> Andreas Schwab <
>> schwab@linux-m68k.org
>>> writes:
>>
>>> On Jun 18 2019, Radu Rendec <
>>> radu.rendec@gmail.com
>>>> wrote:
>>>
>>>> Since you already have a working setup, it would be nice if you could
>>>> add a printk to arch_ptrace() to print the address and confirm what I
>>>> believe happens (by reading the gdb source code).
>>>
>>> A ppc32 ptrace syscall goes through compat_arch_ptrace.
> 
> Right. I completely overlooked that part.
> 
>> Ah right, and that (in ptrace32.c) contains code that will work:
>>
>>
>> 			/*
>> 			 * the user space code considers the floating point
>> 			 * to be an array of unsigned int (32 bits) - the
>> 			 * index passed in is based on this assumption.
>> 			 */
>> 			tmp = ((unsigned int *)child->thread.fp_state.fpr)
>> 				[FPRINDEX(index)];
>>
>> FPRINDEX is defined above to deal with the various manipulations you
>> need to do.
> 
> Correct. Basically it does the same that I did in my patch: it divides
> the index again by 2 (it's already divided by 4 in compat_arch_ptrace()
> so it ends up divided by 8), then takes the least significant bit and
> adds it to the index. I take bit 2 of the original address, which is the
> same thing (because in FPRHALF() the address is already divided by 4).
> 
> So we have this in ptrace32.c:
> 
> #define FPRNUMBER(i) (((i) - PT_FPR0) >> 1)
> #define FPRHALF(i) (((i) - PT_FPR0) & 1)
> #define FPRINDEX(i) TS_FPRWIDTH * FPRNUMBER(i) * 2 + FPRHALF(i)
> 
> index = (unsigned long) addr >> 2;
> (unsigned int *)child->thread.fp_state.fpr)[FPRINDEX(index)]
> 
> 
> And we have this in my patch:
> 
> fpidx = (addr - PT_FPR0 * sizeof(long)) / 8;
> (void *)&child->thread.TS_FPR(fpidx) + (addr & 4)
> 
>> Radu: I think we want to copy that working code back into ptrace.c.
> 
> I'm not sure that would work. There's a subtle difference: the code in
> ptrace32.c is always compiled on a 64-bit kernel and the user space
> calling it is always 32-bit; on the other hand, the code in ptrace.c can
> be compiled on either a 64-bit kernel or a 32-bit kernel and the user
> space calling it always has the same "bitness" as the kernel.
> 
> One difference is the size of the CPU registers. On 64-bit they are 8
> byte long and user space knows that and generates 8-byte aligned
> addresses. So you have to divide the address by 8 to calculate the CPU
> register index correctly, which compat_arch_ptrace() currently doesn't.
> 
> Another difference is that on 64-bit `long` is 8 bytes, so user space
> can read a whole FPU register in a single ptrace call.
> 
> Now that we are all aware of compat_arch_ptrace() (which handles the
> special case of a 32-bit process running on a 64-bit kernel) I would say
> the patch is correct and does the right thing for both 32-bit and 64-bit
> kernels and processes.
> 
>> The challenge will be unpicking the awful mess of ifdefs in ptrace.c
>> and making it somewhat more comprehensible.
> 
> I'm not sure what ifdefs you're thinking about. The only that are used
> inside arch_ptrace() are PT_FPR0, PT_FPSCR and TS_FPR, which seem to be
> correct.
> 
> But perhaps it would be useful to change my patch and add a comment just
> before arch_ptrace() that explains how the math is done and that the
> code must work on both 32-bit and 64-bit, the user space address
> assumptions, etc.
> 
> By the way, I'm not sure the code in compat_arch_ptrace() handles
> PT_FPSCR correctly. It might (just because fpscr is right next to fpr[]
> in memory - and that's a hack), but I can't figure out if it accesses
> the right half.
> 


Does the issue still exists ? If yes, the patch has to be rebased.
