Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D687C1BF02A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 08:19:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CQGG1ZJmzDrKd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 16:19:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=l548/TPg; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CQDV6HX2zDrHn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 16:18:18 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49CQDM4z8Lz9vBLH;
 Thu, 30 Apr 2020 08:18:11 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=l548/TPg; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id H1bsw7cLZgun; Thu, 30 Apr 2020 08:18:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49CQDM3wH1z9vBLG;
 Thu, 30 Apr 2020 08:18:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1588227491; bh=RLmilVYwU8CdIeLQQmIrkhhoeYJQ63SXqiUUPlNYCmw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=l548/TPg0HDDMDQzu6EIkV4ye4EaH8p5Anfr3F6CatFeLvp07Z0bl2XNnUOiVPPYG
 ezf7+dmfKKGOHfLX05mEUxyooMbeuXgGrX62fPHIbT6p2nHaFGTRMz+QCtjwPD7sHF
 RKYjABJbY5c0FtBqAzn2uiJsh7QNeUYDXW60ezSw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3CFAA8B8D9;
 Thu, 30 Apr 2020 08:18:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id plBuBBYqVGwx; Thu, 30 Apr 2020 08:18:12 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A83A38B75B;
 Thu, 30 Apr 2020 08:18:11 +0200 (CEST)
Subject: Re: [PATCH 2/2] powerpc/spufs: stop using access_ok
To: Christoph Hellwig <hch@lst.de>, Jeremy Kerr <jk@ozlabs.org>
References: <20200429070303.17599-1-jk@ozlabs.org>
 <20200429070303.17599-2-jk@ozlabs.org>
 <ebc47890-649e-71c7-02b1-179db964db37@c-s.fr>
 <9c629b09cf25d143c7787548516c1f276bd09aa5.camel@ozlabs.org>
 <20200430053901.GA6981@lst.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <0273f0a5-9b6a-ed3d-e7b3-e95e23492608@c-s.fr>
Date: Thu, 30 Apr 2020 08:18:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430053901.GA6981@lst.de>
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
Cc: linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/04/2020 à 07:39, Christoph Hellwig a écrit :
> On Thu, Apr 30, 2020 at 08:39:00AM +0800, Jeremy Kerr wrote:
>> Hi Christophe,
>>
>>>> Just use the proper non __-prefixed get/put_user variants where
>>>> that is not done yet.
>>>
>>> But it means you are doing the access_ok() check everytime, which is
>>> what is to be avoided by doing the access_ok() once then using the
>>> __-prefixed variant.
>>
>> 5 out of 8 of these are just a access_ok(); simple_read_from_buffer().
>>
>> For the cases where it's multiple __put/get_user()s, the max will be 5.
>> (for the mbox access). Is that worth optimising the access_ok() checks?
> 
> access_ok is just trivial comparism to the segment limit, I don't
> think it has a relavant performance impact.
> 

I think it has an impact. See the difference between the two following 
trivial functions:

int test1(unsigned long val, unsigned long *addr)
{
	return __put_user(val, addr);
}

int test2(unsigned long val, unsigned long *addr)
{
	return put_user(val, addr);
}


00000000 <test1>:
    0:	39 20 00 00 	li      r9,0
    4:	90 64 00 00 	stw     r3,0(r4)
    8:	7d 23 4b 78 	mr      r3,r9
    c:	4e 80 00 20 	blr

00000000 <test2>:
    0:	81 22 04 38 	lwz     r9,1080(r2)
    4:	7c 6a 1b 78 	mr      r10,r3
    8:	7f 89 20 40 	cmplw   cr7,r9,r4
    c:	41 9c 00 24 	blt     cr7,30 <test2+0x30>
   10:	7d 24 48 50 	subf    r9,r4,r9
   14:	38 60 ff f2 	li      r3,-14
   18:	2b 89 00 02 	cmplwi  cr7,r9,2
   1c:	4c 9d 00 20 	blelr   cr7
   20:	39 20 00 00 	li      r9,0
   24:	91 44 00 00 	stw     r10,0(r4)
   28:	7d 23 4b 78 	mr      r3,r9
   2c:	4e 80 00 20 	blr
   30:	38 60 ff f2 	li      r3,-14
   34:	4e 80 00 20 	blr


It looks like GCC is smart enough to read the limit in task struct only 
once when we have two consecutive put_user() but there is still some 
difference:

int test3(unsigned long val, unsigned long *addr)
{
	return put_user(val, addr) ? : put_user(val, addr + 1);
}

int test4(unsigned long val, unsigned long *addr)
{
	if (!access_ok(addr, sizeof(*addr)))
		return -EFAULT;

	return __put_user(val, addr) ? : __put_user(val, addr + 1);
}

00000000 <test3>:
    0:	81 42 04 38 	lwz     r10,1080(r2)
    4:	7f 8a 20 40 	cmplw   cr7,r10,r4
    8:	41 9c 00 48 	blt     cr7,50 <test3+0x50>
    c:	7d 04 50 50 	subf    r8,r4,r10
   10:	39 20 ff f2 	li      r9,-14
   14:	2b 88 00 02 	cmplwi  cr7,r8,2
   18:	40 9d 00 30 	ble     cr7,48 <test3+0x48>
   1c:	39 20 00 00 	li      r9,0
   20:	90 64 00 00 	stw     r3,0(r4)
   24:	2f 89 00 00 	cmpwi   cr7,r9,0
   28:	40 9e 00 20 	bne     cr7,48 <test3+0x48>
   2c:	38 84 00 04 	addi    r4,r4,4
   30:	7f 8a 20 40 	cmplw   cr7,r10,r4
   34:	41 9c 00 1c 	blt     cr7,50 <test3+0x50>
   38:	7d 44 50 50 	subf    r10,r4,r10
   3c:	2b 8a 00 02 	cmplwi  cr7,r10,2
   40:	40 9d 00 10 	ble     cr7,50 <test3+0x50>
   44:	90 64 00 00 	stw     r3,0(r4)
   48:	7d 23 4b 78 	mr      r3,r9
   4c:	4e 80 00 20 	blr
   50:	39 20 ff f2 	li      r9,-14
   54:	4b ff ff f4 	b       48 <test3+0x48>

Disassembly of section .text.test4:

00000000 <test4>:
    0:	81 22 04 38 	lwz     r9,1080(r2)
    4:	7f 89 20 40 	cmplw   cr7,r9,r4
    8:	41 9c 00 34 	blt     cr7,3c <test4+0x3c>
    c:	7d 44 48 50 	subf    r10,r4,r9
   10:	39 20 ff f2 	li      r9,-14
   14:	2b 8a 00 06 	cmplwi  cr7,r10,6
   18:	40 9d 00 1c 	ble     cr7,34 <test4+0x34>
   1c:	39 20 00 00 	li      r9,0
   20:	90 64 00 00 	stw     r3,0(r4)
   24:	2f 89 00 00 	cmpwi   cr7,r9,0
   28:	40 9e 00 0c 	bne     cr7,34 <test4+0x34>
   2c:	38 84 00 04 	addi    r4,r4,4
   30:	90 64 00 00 	stw     r3,0(r4)
   34:	7d 23 4b 78 	mr      r3,r9
   38:	4e 80 00 20 	blr
   3c:	39 20 ff f2 	li      r9,-14
   40:	4b ff ff f4 	b       34 <test4+0x34>
