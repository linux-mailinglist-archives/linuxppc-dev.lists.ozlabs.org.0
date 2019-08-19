Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D2591EC0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 10:20:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Bn1f2n23zDqtS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 18:20:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="fY/mLi0C"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Bmzn3QYhzDqn4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 18:19:16 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46Bmzb5Gbfz9tyQN;
 Mon, 19 Aug 2019 10:19:07 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=fY/mLi0C; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id x0jL0orQOV5N; Mon, 19 Aug 2019 10:19:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46Bmzb4Bhhz9tyQK;
 Mon, 19 Aug 2019 10:19:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566202747; bh=hyz93VlF5VshkA7JRIXDWBACAMKFyp3ax7zG4J+d8HU=;
 h=To:Cc:From:Subject:Date:From;
 b=fY/mLi0CeO6g1zbGf3ZPOwk7euPagRZjBZMSmU68iBy6WUlZlmjKNMeZLv7A9BkFK
 qMQ4CdjsDnM/tAYIQ3MCCiLrC4vGCuPuQGFgQUbmmU1+bve8RmkJM0/bFAMFZtmjX6
 bT1nS6ofNuD4rJRyejsBcKID1yF9OH923kktfTAQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A79588B79C;
 Mon, 19 Aug 2019 10:19:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rRWjh1eTtjhR; Mon, 19 Aug 2019 10:19:12 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 73DB18B778;
 Mon, 19 Aug 2019 10:19:12 +0200 (CEST)
To: Drew Davenport <ddavenport@chromium.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: WARN_ON(1) generates ugly code since commit 6b15f678fb7d
Message-ID: <1d4fcfcf-e0b1-5af7-a54d-a5a3bbcedb89@c-s.fr>
Date: Mon, 19 Aug 2019 10:18:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: fr
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Drew,

I recently noticed gcc suddenly generating ugly code for WARN_ON(1).

It looks like commit 6b15f678fb7d ("include/asm-generic/bug.h: fix "cut 
here" for WARN_ON for __WARN_TAINT architectures") is the culprit.

unsigned long test_mul1(unsigned long a, unsigned long b)
{
     unsigned long long r = (unsigned long long)a * (unsigned long long)b;

     if (r > 0xffffffff)
         WARN_ON(1);

     return r;
}

Before that patch, I was getting the following code:

00000008 <test_mul1>:
    8:    7d 23 20 16     mulhwu  r9,r3,r4
    c:    7c 63 21 d6     mullw   r3,r3,r4
   10:    2f 89 00 00     cmpwi   cr7,r9,0
   14:    4d 9e 00 20     beqlr   cr7
   18:    0f e0 00 00     twui    r0,0
   1c:    4e 80 00 20     blr

Now I get:

0000002c <test_mul1>:
   2c:    7d 23 20 16     mulhwu  r9,r3,r4
   30:    94 21 ff f0     stwu    r1,-16(r1)
   34:    7c 08 02 a6     mflr    r0
   38:    93 e1 00 0c     stw     r31,12(r1)
   3c:    90 01 00 14     stw     r0,20(r1)
   40:    7f e3 21 d6     mullw   r31,r3,r4
   44:    2f 89 00 00     cmpwi   cr7,r9,0
   48:    40 9e 00 1c     bne     cr7,64 <test_mul1+0x38>
   4c:    80 01 00 14     lwz     r0,20(r1)
   50:    7f e3 fb 78     mr      r3,r31
   54:    83 e1 00 0c     lwz     r31,12(r1)
   58:    7c 08 03 a6     mtlr    r0
   5c:    38 21 00 10     addi    r1,r1,16
   60:    4e 80 00 20     blr
   64:    3c 60 00 00     lis     r3,0
             66: R_PPC_ADDR16_HA    .rodata.str1.4
   68:    38 63 00 00     addi    r3,r3,0
             6a: R_PPC_ADDR16_LO    .rodata.str1.4
   6c:    48 00 00 01     bl      6c <test_mul1+0x40>
             6c: R_PPC_REL24    printk
   70:    0f e0 00 00     twui    r0,0
   74:    4b ff ff d8     b       4c <test_mul1+0x20>

As you can see, a call to printk() is added, which means setting up a 
stack frame, saving volatile registers, etc ...
That's all the things we want to avoid when using WARN_ON().

And digging a bit more, I see that you are only adding this 'cut here' 
to calls like WARN_ON(1), ie where the condition is a constant.
For calls where the condition is not a constant, there is no change and 
no 'cut here' line added:

unsigned long test_mul2(unsigned long a, unsigned long b)
{
     unsigned long long r = (unsigned long long)a * (unsigned long long)b;

     WARN_ON(r > 0xffffffff);

     return r;
}

Before and after your patch, the code is clean and no call to add any 
'cut here' line.
00000078 <test_mul2>:
   78:    7d 43 20 16     mulhwu  r10,r3,r4
   7c:    7c 63 21 d6     mullw   r3,r3,r4
   80:    31 2a ff ff     addic   r9,r10,-1
   84:    7d 29 51 10     subfe   r9,r9,r10
   88:    0f 09 00 00     twnei   r9,0
   8c:    4e 80 00 20     blr


Was it your intention to modify the behaviour and kill the lightweight 
implementations of WARN_ON() ?

Looking into arch/powerpc/include/bug.h, I see that when the condition 
is constant, WARN_ON() uses __WARN(), which itself calls __WARN_FLAGS() 
with relevant flags.

In the old days, __WARN() was implemented in arch/powerpc/include/bug.h
Commit b2be05273a17 ("panic: Allow warnings to set different taint 
flags") replaced __WARN() by __WARN_TAINT() and added a generic 
definition of __WARN()
In the begining I thought the __WARN() call in 
arch/powerpc/include/bug.h was forgotten, but looking into the commit in 
full, it looks like it was intentional to make __WARN() generic and have 
arches use it.

Then commit 19d436268dde ("debug: Add _ONCE() logic to report_bug()") 
replaced __WARN_TAINT() by __WARN_FLAGS().

So by changing the generic __WARN() you are impacting all users include 
those using 'trap' like instruction in order to avoid function calls.

What is to be done for getting back a clean code which doesn't call 
printk() on the hot path ?

Thanks,
Christophe



