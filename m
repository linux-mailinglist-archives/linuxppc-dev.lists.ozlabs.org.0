Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9758B7293
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 07:25:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Ylfj4qr0zF4D0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 15:25:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="AjITiU4z"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YlcY11P6zDrN7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 15:23:24 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46YlcR0Mfhz9v4gb;
 Thu, 19 Sep 2019 07:23:19 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=AjITiU4z; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id W0ZjiSo4UdoG; Thu, 19 Sep 2019 07:23:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46YlcQ6Qbkz9v4gY;
 Thu, 19 Sep 2019 07:23:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568870598; bh=U7o25f1gtEsBxQM8z6wcetUpJ35EiEndIk0n8Ib4tnA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=AjITiU4z12BJw9kZqMy9qm6OfxEhLABIVX23Ntzy4PzVm9V3k5kgIdrT/EE1pFFxN
 XSee4lZqpXrFzjDWE8MH/8e8mqYyhe1DBSqNlThvuFHwkOHqOa1lexWcVUWxdD7K4q
 KtPbJzIlOEfrHp9Q+EbRVt024dLmQFDf6fxysRFM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B6FDE8B80B;
 Thu, 19 Sep 2019 07:23:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LHmi5fzDEdPX; Thu, 19 Sep 2019 07:23:19 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0F0018B783;
 Thu, 19 Sep 2019 07:23:19 +0200 (CEST)
Subject: Re: [PATCH v3 2/2] powerpc/irq: inline call_do_irq() and
 call_do_softirq()
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <d0b002c96cfc069a1bc7bafcac28defe5d7d3643.1568821668.git.christophe.leroy@c-s.fr>
 <5fb4aedadbd28b9849cf2fabe13392fb3b5cd3ed.1568821668.git.christophe.leroy@c-s.fr>
 <20190918163919.GH9749@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a7a46d1b-873c-1267-b8ca-615a7fabfd6b@c-s.fr>
Date: Thu, 19 Sep 2019 07:23:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190918163919.GH9749@gate.crashing.org>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 18/09/2019 à 18:39, Segher Boessenkool a écrit :
> Hi Christophe,
> 
> On Wed, Sep 18, 2019 at 03:48:20PM +0000, Christophe Leroy wrote:
>> call_do_irq() and call_do_softirq() are quite similar on PPC32 and
>> PPC64 and are simple enough to be worth inlining.
>>
>> Inlining them avoids an mflr/mtlr pair plus a save/reload on stack.
> 
> But you hardcode the calling sequence in inline asm, which for various
> reasons is not a great idea.
> 
>> +static inline void call_do_irq(struct pt_regs *regs, void *sp)
>> +{
>> +	register unsigned long r3 asm("r3") = (unsigned long)regs;
>> +
>> +	asm volatile(
>> +		"	"PPC_STLU"	1, %2(%1);\n"
>> +		"	mr		1, %1;\n"
>> +		"	bl		%3;\n"
>> +		"	"PPC_LL"	1, 0(1);\n" : "+r"(r3) :
>> +		"b"(sp), "i"(THREAD_SIZE - STACK_FRAME_OVERHEAD), "i"(__do_irq) :
>> +		"lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6", "cr7",
>> +		"r0", "r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12");
>> +}
> 
> I realise the original code had this...  Loading the old stack pointer
> value back from the stack creates a bottleneck (via the store->load
> forwarding it requires).  It could just use
>    addi 1,1,-(%2)
> here, which can also be written as
>    addi 1,1,%n2
> (that is portable to all architectures btw).

No, we switched stack before the bl call, we replaced r1 by r3 after 
saving r1 into r3 stack. Now we have to restore the original r1.

> 
> 
> Please write the  "+r"(r3)  on the next line?  Not on the same line as
> the multi-line template.  This make things more readable.
> 
> 
> I don't know if using functions as an "i" works properly...  It probably
> does, it's just not something that you see often :-)
> 
> 
> What about r2?  Various ABIs handle that differently.  This might make
> it impossible to share implementation between 32-bit and 64-bit for this.
> But we could add it to the clobber list worst case, that will always work.

Isn't r2 non-volatile on all ABIs ?

> 
> 
> So anyway, it looks to me like it will work.  Nice cleanup.  Would be
> better if you could do the call to __do_irq from C code, but maybe we
> cannot have everything ;-)

sparc do it the following way, is there no risk that GCC adds unwanted 
code inbetween that is not aware there the stack pointer has changed ?

void do_softirq_own_stack(void)
{
	void *orig_sp, *sp = softirq_stack[smp_processor_id()];

	sp += THREAD_SIZE - 192 - STACK_BIAS;

	__asm__ __volatile__("mov %%sp, %0\n\t"
			     "mov %1, %%sp"
			     : "=&r" (orig_sp)
			     : "r" (sp));
	__do_softirq();
	__asm__ __volatile__("mov %0, %%sp"
			     : : "r" (orig_sp));
}

If the above is no risk, then can we do the same on powerpc ?

> 
> Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>

Thanks for the review.

Christophe
