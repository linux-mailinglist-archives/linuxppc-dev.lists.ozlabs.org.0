Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ACD23D68C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 07:48:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMcwQ0BShzDql5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 15:48:06 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMctj4HgLzDqW5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 15:46:34 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BMctW4D6qz9tytV;
 Thu,  6 Aug 2020 07:46:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Cn2j-KJGPYQE; Thu,  6 Aug 2020 07:46:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BMctW21YWz9tysQ;
 Thu,  6 Aug 2020 07:46:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 50E668B770;
 Thu,  6 Aug 2020 07:46:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9Cs47VjaX3ER; Thu,  6 Aug 2020 07:46:28 +0200 (CEST)
Received: from po16052vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E77838B75E;
 Thu,  6 Aug 2020 07:46:27 +0200 (CEST)
Subject: Re: [PATCH v10 2/5] powerpc/vdso: Prepare for switching VDSO to
 generic C implementation.
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <cover.1596611196.git.christophe.leroy@csgroup.eu>
 <348528c33cd4007f3fee7fe643ef160843d09a6c.1596611196.git.christophe.leroy@csgroup.eu>
 <20200805140307.GO6753@gate.crashing.org>
 <3db2a590-b842-83db-ed2b-f3ee62595f18@csgroup.eu>
 <20200805184054.GQ6753@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <24b9a5ea-f860-3b38-aee8-4d5676453d50@csgroup.eu>
Date: Thu, 6 Aug 2020 05:46:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20200805184054.GQ6753@gate.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: nathanl@linux.ibm.com, linux-arch@vger.kernel.org,
 vincenzo.frascino@arm.com, arnd@arndb.de, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, luto@kernel.org, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 08/05/2020 06:40 PM, Segher Boessenkool wrote:
> Hi!
> 
> On Wed, Aug 05, 2020 at 04:40:16PM +0000, Christophe Leroy wrote:
>>> It cannot optimise it because it does not know shift < 32.  The code
>>> below is incorrect for shift equal to 32, fwiw.
>>
>> Is there a way to tell it ?
> 
> Sure, for example the &31 should work (but it doesn't, with the GCC
> version you used -- which version is that?)

GCC 10.1

> 
>>> What does the compiler do for just
>>>
>>> static __always_inline u64 vdso_shift_ns(u64 ns, unsigned long shift)
>>> 	return ns >> (shift & 31);
>>> }
>>>
>>
>> Worse:
> 
> I cannot make heads or tails of all that branch spaghetti, sorry.
> 
>>   73c:	55 8c 06 fe 	clrlwi  r12,r12,27
>>   740:	7f c8 f0 14 	addc    r30,r8,r30
>>   744:	7c c6 4a 14 	add     r6,r6,r9
>>   748:	7c c6 e1 14 	adde    r6,r6,r28
>>   74c:	34 6c ff e0 	addic.  r3,r12,-32
>>   750:	41 80 00 70 	blt     7c0 <__c_kernel_clock_gettime+0x114>
> 
> This branch is always true.  Hrm.

As a standalone function:

With your suggestion:

000006ac <vdso_shift_ns>:
  6ac:	54 a5 06 fe 	clrlwi  r5,r5,27
  6b0:	35 25 ff e0 	addic.  r9,r5,-32
  6b4:	41 80 00 10 	blt     6c4 <vdso_shift_ns+0x18>
  6b8:	7c 64 4c 30 	srw     r4,r3,r9
  6bc:	38 60 00 00 	li      r3,0
  6c0:	4e 80 00 20 	blr
  6c4:	54 69 08 3c 	rlwinm  r9,r3,1,0,30
  6c8:	21 45 00 1f 	subfic  r10,r5,31
  6cc:	7c 84 2c 30 	srw     r4,r4,r5
  6d0:	7d 29 50 30 	slw     r9,r9,r10
  6d4:	7c 63 2c 30 	srw     r3,r3,r5
  6d8:	7d 24 23 78 	or      r4,r9,r4
  6dc:	4e 80 00 20 	blr


With the version as is in my series:

000006ac <vdso_shift_ns>:
  6ac:	21 25 00 20 	subfic  r9,r5,32
  6b0:	7c 69 48 30 	slw     r9,r3,r9
  6b4:	7c 84 2c 30 	srw     r4,r4,r5
  6b8:	7d 24 23 78 	or      r4,r9,r4
  6bc:	7c 63 2c 30 	srw     r3,r3,r5
  6c0:	4e 80 00 20 	blr


Christophe
