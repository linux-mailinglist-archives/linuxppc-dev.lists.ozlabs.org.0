Return-Path: <linuxppc-dev+bounces-4290-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DCA9F62A0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:20:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCqSM4353z2xy0;
	Wed, 18 Dec 2024 21:20:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734517219;
	cv=none; b=DkFtTRqi7hTi63L2U88JVUok1BlalBgKYRQTg0Oxfy1eiQRG8lANIRo3UQt2EveEsBc2WEKLL34NJ0EGBvkMtxXoSCW0PrCp6y2ez5gFF6ie350S++TSP68HJvrE1PhLc42cH33JP0BftpW+t7W1y4FgqV1xhC8fG0JQ6uKCBKjx8XWScva3stNUoVBFR0eIYXYhz7xZ3B8stwoR/R//T31A4F4dajaueul89oNMFR3ympldY+peAFQ/2lrXkeOSoZzf7kCV5Mdpl1AuOA+CAmxAvQdbf2Mft/yCXA/Od+a+aZD6iKOTmncbFJkr3e21pBkl15cyBszrF/lBxRasdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734517219; c=relaxed/relaxed;
	bh=Y+W7VROJYAKWesW0btuLtsny/5rudGPHx9yR2y+wyzo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=dnCZsp9gdwKBEGTrr2WdyM91uVs7zUpc3RUv2cuHDt1oQoc7gyy3gQc6n3+cNWCkLCGIZiX7xMBhxXo8Pead6D+rciHVsGdWrUanfeDmHX1TjqxXN6BgKKOpvryT/IzDoVZapBlFUpeMGM+K9I/lNjh/cgKd0n5W73bISKuSzOCqjVN+HLI8iTSJ73QurXX9QjXa9C+0Ki6+pplRwB2AULs0A6J0sOnOvlQ1pP5Mll8VRLD64l7OyKl2u9+6HO2GPbLrwgW0wsNMTsUjYMVt3k5F8+bX7dl7ct/UHRaBeHn6/+A40XPQ9TjFOTNBLQp4JavKVYW68/pisI0/Gv4fmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCqSL3Qn1z2xtp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:20:17 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YCqSD111Vz9sPd;
	Wed, 18 Dec 2024 11:20:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gKpioB5BCG2d; Wed, 18 Dec 2024 11:20:12 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YCqSC6pM5z9rvV;
	Wed, 18 Dec 2024 11:20:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CC0DD8B770;
	Wed, 18 Dec 2024 11:20:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ffiwrVR0qIrj; Wed, 18 Dec 2024 11:20:11 +0100 (CET)
Received: from [10.25.209.139] (unknown [10.25.209.139])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1D2408B763;
	Wed, 18 Dec 2024 11:20:11 +0100 (CET)
Message-ID: <e69b2927-b415-4e16-a346-8d874c9a8b39@csgroup.eu>
Date: Wed, 18 Dec 2024 11:20:10 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] powerpc/vdso: Switch to generic storage
 implementation
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
 <20241216-vdso-store-rng-v1-12-f7aed1bdb3b2@linutronix.de>
 <12120bbe-1d79-425b-982d-46af1fa5d70d@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <12120bbe-1d79-425b-982d-46af1fa5d70d@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



>>   #ifdef CONFIG_TIME_NS
>> -static __always_inline
>> -const struct vdso_data *__arch_get_timens_vdso_data(const struct 
>> vdso_data *vd)
>> +static __always_inline const struct vdso_time_data 
>> *__ppc_get_vdso_u_timens_data(void)
>>   {
>> -    return (void *)vd + (1U << CONFIG_PAGE_SHIFT);
>> +    struct vdso_time_data *time_data;
>> +
>> +    asm(
>> +        "    bcl    20, 31, .+4\n"
>> +        "0:    mflr    %0\n"
>> +        "    addis    %0, %0, (vdso_u_timens_data - 0b)@ha\n"
>> +        "    addi    %0, %0, (vdso_u_timens_data - 0b)@l\n"
>> +    : "=r" (time_data) :: "lr");
>> +
>> +    return time_data;
> 
> Please don't do that, it kills optimisation efforts done when 
> implementing VDSO time. Commit ce7d8056e38b ("powerpc/vdso: Prepare for 
> switching VDSO to generic C implementation.") explains why.
> 
> For time data, the bcl/mflr dance is done by get_datapage macro called 
> by cvdso_call macro in gettimeofday.S, and given to 
> __cvdso_clock_gettime_data() by __c_kernel_clock_gettime() in 
> vgettimeofday.c . Use that information and don't redo the bcl/mflr 
> sequence.
> 
> See for instance function __c_kernel_clock_getres():
> 
> Before your series it is 30 instructions.
> After your series it is 59 instructions.
> 

It is even more obvious with __c_kernel_time()

Before your series it has 12 instructions,
After your series it has 26 instructions.

Before

00001408 <__c_kernel_time>:
     1408:	81 44 00 04 	lwz     r10,4(r4)
     140c:	6d 49 80 00 	xoris   r9,r10,32768
     1410:	2c 09 ff ff 	cmpwi   r9,-1
     1414:	40 82 00 08 	bne     141c <__c_kernel_time+0x14>
     1418:	38 84 40 00 	addi    r4,r4,16384
     141c:	2c 03 00 00 	cmpwi   r3,0
     1420:	81 44 00 20 	lwz     r10,32(r4)
     1424:	81 64 00 24 	lwz     r11,36(r4)
     1428:	41 82 00 08 	beq     1430 <__c_kernel_time+0x28>
     142c:	91 63 00 00 	stw     r11,0(r3)
     1430:	7d 63 5b 78 	mr      r3,r11
     1434:	4e 80 00 20 	blr

Versus after

00001534 <__c_kernel_time>:
     1534:	81 44 00 04 	lwz     r10,4(r4)
     1538:	6d 49 80 00 	xoris   r9,r10,32768
     153c:	2c 09 ff ff 	cmpwi   r9,-1
     1540:	41 82 00 20 	beq     1560 <__c_kernel_time+0x2c>
     1544:	2c 03 00 00 	cmpwi   r3,0
     1548:	81 44 00 20 	lwz     r10,32(r4)
     154c:	81 64 00 24 	lwz     r11,36(r4)
     1550:	41 82 00 08 	beq     1558 <__c_kernel_time+0x24>
     1554:	91 63 00 00 	stw     r11,0(r3)
     1558:	7d 63 5b 78 	mr      r3,r11
     155c:	4e 80 00 20 	blr
     1560:	7c 08 02 a6 	mflr    r0
     1564:	2c 03 00 00 	cmpwi   r3,0
     1568:	90 01 00 04 	stw     r0,4(r1)
     156c:	42 9f 00 05 	bcl     20,4*cr7+so,1570 <__c_kernel_time+0x3c>
     1570:	7c 88 02 a6 	mflr    r4
     1574:	3c 84 ff ff 	addis   r4,r4,-1
     1578:	38 84 2a 90 	addi    r4,r4,10896
     157c:	81 44 00 20 	lwz     r10,32(r4)
     1580:	81 64 00 24 	lwz     r11,36(r4)
     1584:	41 82 00 08 	beq     158c <__c_kernel_time+0x58>
     1588:	91 63 00 00 	stw     r11,0(r3)
     158c:	80 01 00 04 	lwz     r0,4(r1)
     1590:	7d 63 5b 78 	mr      r3,r11
     1594:	7c 08 03 a6 	mtlr    r0
     1598:	4e 80 00 20 	blr

Christophe

