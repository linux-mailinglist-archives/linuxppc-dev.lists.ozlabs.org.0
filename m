Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 014023F720B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 11:39:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvgtQ6kHkz2ynM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 19:39:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gvgt029y4z2yJq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 19:39:16 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Gvgsq627qz9sTs;
 Wed, 25 Aug 2021 11:39:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 34CjXCyhlRnz; Wed, 25 Aug 2021 11:39:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Gvgsq4YP3z9sTg;
 Wed, 25 Aug 2021 11:39:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 63A8A8B845;
 Wed, 25 Aug 2021 11:39:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id M-sS9n3dwDGU; Wed, 25 Aug 2021 11:39:11 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D79A88B83D;
 Wed, 25 Aug 2021 11:39:10 +0200 (CEST)
Subject: Re: [PATCH] powerpc/32: Don't use lmw/stmw for saving/restoring non
 volatile regs
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <316c543b8906712c108985c8463eec09c8db577b.1629732542.git.christophe.leroy@csgroup.eu>
 <20210823184648.GY1583@gate.crashing.org>
 <9bbc9797-cfc7-1484-90ad-2146ff1a5e18@csgroup.eu>
 <20210824131600.GF1583@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <874407ea-b95f-593d-234c-e896202084e2@csgroup.eu>
Date: Wed, 25 Aug 2021 11:39:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210824131600.GF1583@gate.crashing.org>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/08/2021 à 15:16, Segher Boessenkool a écrit :
> Hi!
> 
> On Tue, Aug 24, 2021 at 07:54:22AM +0200, Christophe Leroy wrote:
>> Le 23/08/2021 à 20:46, Segher Boessenkool a écrit :
>>> On Mon, Aug 23, 2021 at 03:29:12PM +0000, Christophe Leroy wrote:
>>>> Instructions lmw/stmw are interesting for functions that are rarely
>>>> used and not in the cache, because only one instruction is to be
>>>> copied into the instruction cache instead of 19. However those
>>>> instruction are less performant than 19x raw lwz/stw as they require
>>>> synchronisation plus one additional cycle.
>>>
>>> lmw takes N+2 cycles for loading N words on 603/604/750/7400, and N+3 on
>>> 7450.  stmw takes N+1 cycles for storing N words on 603, N+2 on 604/750/
>>> 7400, and N+3 on 7450 (load latency is 3 instead of 2 on 7450).
>>>
>>> There is no synchronisation needed, although there is some serialisation,
>>> which of course doesn't mean much since there can be only 6 or 8 or so
>>> insns executing at once anyway.
>>
>> Yes I meant serialisation, isn't it the same as synchronisation ?
> 
> Ha no, synchronisation are insns like sync and eieio :-)  Synchronisation
> is architectural, serialisation is (mostly) not, it is a feature of the
> specific core.
> 
>>> So, these insns are almost never slower, they can easily win cycles back
>>> because of the smaller code, too.
>>>
>>> What 32-bit core do you see where load/store multiple are more than a
>>> fraction of a cycle (per memory access) slower?
>>>
>>>> SAVE_NVGPRS / REST_NVGPRS are used in only a few places which are
>>>> mostly in interrupts entries/exits and in task switch so they are
>>>> likely already in the cache.
>>>
>>> Nothing is likely in the cache on the older cores (except in
>>> microbenchmarks), the caches are not big enough for that!
>>
>> Even syscall entries/exit pathes and/or most frequent interrupts entries
>> and interrupt exit ?
> 
> It has to be measured.  You are probably right for programs that use a
> lot of system calls, and (unmeasurably :-) ) wrong for those that don't.
> 
> So that is a good argument: it speeds up some scenarios, and does not
> make any real impact on anything else.
> 
> This also does not replace all {l,st}mw in the kernel, only those on
> interrupt paths.  So it is not necessarily bad :-)

Yes exactly, I wanted to focus on interrupt paths which are the bottle neck.

So I take it that you finally don't disagree with the change.

By the way, it has to be noted that later versions of GCC do less and less use of lmw/stmw. See for 
exemple show_user_instructions():

c0007114 <show_user_instructions>:
c0007114:	94 21 ff 50 	stwu    r1,-176(r1)
c0007118:	7d 80 00 26 	mfcr    r12
c000711c:	7c 08 02 a6 	mflr    r0
c0007120:	93 01 00 90 	stw     r24,144(r1)
c0007124:	93 21 00 94 	stw     r25,148(r1)
c0007128:	93 41 00 98 	stw     r26,152(r1)
c000712c:	93 61 00 9c 	stw     r27,156(r1)
c0007130:	93 81 00 a0 	stw     r28,160(r1)
c0007134:	93 c1 00 a8 	stw     r30,168(r1)
c0007138:	91 81 00 8c 	stw     r12,140(r1)
c000713c:	90 01 00 b4 	stw     r0,180(r1)
c0007140:	93 a1 00 a4 	stw     r29,164(r1)
c0007144:	93 e1 00 ac 	stw     r31,172(r1)
...
c0007244:	80 01 00 b4 	lwz     r0,180(r1)
c0007248:	81 81 00 8c 	lwz     r12,140(r1)
c000724c:	83 01 00 90 	lwz     r24,144(r1)
c0007250:	83 21 00 94 	lwz     r25,148(r1)
c0007254:	83 41 00 98 	lwz     r26,152(r1)
c0007258:	83 61 00 9c 	lwz     r27,156(r1)
c000725c:	83 81 00 a0 	lwz     r28,160(r1)
c0007260:	83 a1 00 a4 	lwz     r29,164(r1)
c0007264:	83 c1 00 a8 	lwz     r30,168(r1)
c0007268:	83 e1 00 ac 	lwz     r31,172(r1)
c000726c:	7c 08 03 a6 	mtlr    r0
c0007270:	7d 80 81 20 	mtcrf   8,r12
c0007274:	38 21 00 b0 	addi    r1,r1,176
c0007278:	4e 80 00 20 	blr


On older version (GCC 5.5 here) it used to be:

00000408 <show_user_instructions>:
  408:	7c 08 02 a6 	mflr    r0
  40c:	94 21 ff 40 	stwu    r1,-192(r1)
  410:	7d 80 00 26 	mfcr    r12
  414:	be a1 00 94 	stmw    r21,148(r1)
  418:	91 81 00 90 	stw     r12,144(r1)
  41c:	90 01 00 c4 	stw     r0,196(r1)
...
  504:	80 01 00 c4 	lwz     r0,196(r1)
  508:	81 81 00 90 	lwz     r12,144(r1)
  50c:	7c 08 03 a6 	mtlr    r0
  510:	ba a1 00 94 	lmw     r21,148(r1)
  514:	7d 80 81 20 	mtcrf   8,r12
  518:	38 21 00 c0 	addi    r1,r1,192
  51c:	4e 80 00 20 	blr

Christophe
