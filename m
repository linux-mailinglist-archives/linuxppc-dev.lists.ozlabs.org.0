Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79148544D02
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 15:06:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJkrC2WVMz3cBw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 23:06:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJkqp0cmRz3bmK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 23:06:12 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LJkqj2GqBz9tK7;
	Thu,  9 Jun 2022 15:06:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UtK2C6fZzNDN; Thu,  9 Jun 2022 15:06:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LJkqj0xKdz9tJn;
	Thu,  9 Jun 2022 15:06:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E36848B77C;
	Thu,  9 Jun 2022 15:06:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id tFaIrYSzzxnZ; Thu,  9 Jun 2022 15:06:08 +0200 (CEST)
Received: from [192.168.6.129] (unknown [192.168.6.129])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 91AB58B779;
	Thu,  9 Jun 2022 15:06:08 +0200 (CEST)
Message-ID: <730437cb-62ee-0dfc-61b4-52458ab937bb@csgroup.eu>
Date: Thu, 9 Jun 2022 15:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/6] powerpc: Provide syscall wrapper
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20220601054850.250287-1-rmclure@linux.ibm.com>
 <20220601054850.250287-2-rmclure@linux.ibm.com>
 <a722557b-533a-452d-3355-8f31052df4b4@csgroup.eu>
In-Reply-To: <a722557b-533a-452d-3355-8f31052df4b4@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/06/2022 à 10:29, Christophe Leroy a écrit :
> 
> 
> Le 01/06/2022 à 07:48, Rohan McLure a écrit :
>> [Vous ne recevez pas souvent de courriers de la part de 
>> rmclure@linux.ibm.com. Découvrez pourquoi cela peut être important à 
>> l'adresse https://aka.ms/LearnAboutSenderIdentification.]
>>
>> Syscall wrapper implemented as per s390, x86, arm64, providing the
>> option for gprs to be cleared on entry to the kernel, reducing caller
>> influence influence on speculation within syscall routine. The wrapper
>> is a macro that emits syscall handler implementations with parameters
>> passed by stack pointer.
> 
> Passing parameters by stack is going to be sub-optimal. Did you make any 
> measurement of the implied performance degradation ? We usually use the 
> null_syscall selftest for that everytime we touch syscall entries/exits.

I did a test with null_syscall on an 8xx. Surprisingly I get more than 
20% improvement with your series.

Looking at the generated code in more details, we see that 
system_call_exception() is lighter as now no stack frame is needed, the 
compiler has enough registers available.

Before the patch:

c000c9ec <system_call_exception>:
c000c9ec:	94 21 ff f0 	stwu    r1,-16(r1)
c000c9f0:	93 e1 00 0c 	stw     r31,12(r1)
c000c9f4:	7d 5f 53 78 	mr      r31,r10
c000c9f8:	81 4a 00 84 	lwz     r10,132(r10)
c000c9fc:	90 7f 00 88 	stw     r3,136(r31)
c000ca00:	71 4b 00 02 	andi.   r11,r10,2
c000ca04:	41 82 00 4c 	beq     c000ca50 <system_call_exception+0x64>
c000ca08:	71 4b 40 00 	andi.   r11,r10,16384
c000ca0c:	41 82 00 50 	beq     c000ca5c <system_call_exception+0x70>
c000ca10:	71 4a 80 00 	andi.   r10,r10,32768
c000ca14:	41 82 00 54 	beq     c000ca68 <system_call_exception+0x7c>
c000ca18:	7c 50 13 a6 	mtspr   80,r2
c000ca1c:	81 42 00 4c 	lwz     r10,76(r2)
c000ca20:	71 4a 84 91 	andi.   r10,r10,33937
c000ca24:	40 82 00 50 	bne     c000ca74 <system_call_exception+0x88>
c000ca28:	28 09 01 c2 	cmplwi  r9,450
c000ca2c:	41 81 00 88 	bgt     c000cab4 <system_call_exception+0xc8>
c000ca30:	3d 40 c0 6f 	lis     r10,-16273
c000ca34:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
c000ca38:	39 4a c1 c5 	addi    r10,r10,-15931
c000ca3c:	7d 2a 48 2e 	lwzx    r9,r10,r9
c000ca40:	83 e1 00 0c 	lwz     r31,12(r1)
c000ca44:	7d 29 03 a6 	mtctr   r9
c000ca48:	38 21 00 10 	addi    r1,r1,16
c000ca4c:	4e 80 04 20 	bctr
...

After the patch:
c000cc94 <system_call_exception>:
c000cc94:	81 24 00 84 	lwz     r9,132(r4)
c000cc98:	81 44 00 0c 	lwz     r10,12(r4)
c000cc9c:	71 28 00 02 	andi.   r8,r9,2
c000cca0:	91 44 00 88 	stw     r10,136(r4)
c000cca4:	41 82 00 48 	beq     c000ccec <system_call_exception+0x58>
c000cca8:	71 2a 40 00 	andi.   r10,r9,16384
c000ccac:	41 82 00 44 	beq     c000ccf0 <system_call_exception+0x5c>
c000ccb0:	71 29 80 00 	andi.   r9,r9,32768
c000ccb4:	41 82 00 40 	beq     c000ccf4 <system_call_exception+0x60>
c000ccb8:	7c 50 13 a6 	mtspr   80,r2
c000ccbc:	81 22 00 4c 	lwz     r9,76(r2)
c000ccc0:	71 29 84 91 	andi.   r9,r9,33937
c000ccc4:	40 82 00 34 	bne     c000ccf8 <system_call_exception+0x64>
c000ccc8:	28 03 01 c2 	cmplwi  r3,450
c000cccc:	41 81 00 78 	bgt     c000cd44 <system_call_exception+0xb0>
c000ccd0:	3d 20 c0 70 	lis     r9,-16272
c000ccd4:	54 63 10 3a 	rlwinm  r3,r3,2,0,29
c000ccd8:	39 29 81 c5 	addi    r9,r9,-32315
c000ccdc:	7d 29 18 2e 	lwzx    r9,r9,r3
c000cce0:	7c 83 23 78 	mr      r3,r4
c000cce4:	7d 29 03 a6 	mtctr   r9
c000cce8:	4e 80 04 20 	bctr
...



> 
> Why going via stack ? The main advantage of a RISC processor like 
> powerpc is that, unlike x86, there are enough registers to avoid going 
> through memory. RISC processors are optimised with three operands 
> operations and many registers, and usually have slow memory in return.

Well, thinking about it once more. In fact registers are saved to the 
stack anyway. At the start of syscall functions they are likely to still 
be hot in the cache, so reading them back is just a few cycles. And it 
eventually provide the compiler the opportunity to organise stuff better.


> 
>>
>> For platforms supporting this syscall wrapper, emit symbols with usual
>> in-register parameters (`sys...`) to support calls to syscall handlers
>> from within the kernel.
>>
>> Syscalls are wrapped on all platforms except Cell processor. SPUs require
>> access syscall prototypes which are omitted with ARCH_HAS_SYSCALL_WRAPPER
>> enabled.
> This commit message isn't very clear, please describe in more details 
> what is done, how and why.
> 


Christophe
