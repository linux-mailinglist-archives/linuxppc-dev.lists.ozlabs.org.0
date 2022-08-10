Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3926E58E5D9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 05:55:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2bgR1Fj7z3c1M
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 13:55:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ac2gwtU3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ac2gwtU3;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2bfq3fzNz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Aug 2022 13:54:41 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id 17so3785963pli.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Aug 2022 20:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=hHiKq3pNSQqe7VJXrj+FMX61Ib7pvJEPyRyltcHY5tc=;
        b=ac2gwtU3f0+FgsxZI+lpvTxjLGqVXeo5VibVkLAYTYuQuv4ZFT2po6LU84sK7B8w0L
         PcoDMCCBnEMAk/gXk4eApkKSrn7XOK61IYV5D3HEeTKAPpUI7hXNBsKndi++Ig50VBZs
         QX7or/Y0vBVk89OqdPiE5KAQcvvwan4spQNSpdSiFsFan37WFOguQceJ+G3M8aDDFIsO
         B+2QAkvMaFNtkFgUB5/0DKcZ5bcCpjs4k6bcZSGBv1gYhMViNSscLSI9Yiiel6HwfByP
         6IGhHgB3S76uF2MGzYBdUpuuhoL4fXITCg/Fqe/0Hc7LPBw2Lu1GLKvhys/l2JC8mNuZ
         kq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=hHiKq3pNSQqe7VJXrj+FMX61Ib7pvJEPyRyltcHY5tc=;
        b=RrzXVzkXXtfBn8S5W5A2FGavKLCvJdrDKsbWgjs97/sHFSwbhjZiixL34GZA36KCGi
         am6d9zJgQVkd4OQiJyDxEcuqZPrygD/Lqqixf1YURATIhBjvJ13q3ijUoUKtLpINT3Qn
         EIVUqw+LbrK46yX5E8nJao85j7KFO5yeyUrPi4OQY6KmjxO71iC3EIE2Ag6R1JDz8isi
         EArcawS8yIW5k78ntnZ2R3YQH61QDq2OATaE8pNsrvPW7xEPkk+8QsDCFVIZ5PC7RwPN
         SsMPs+813qp2zGEzhLEWCg2Wq9RmXi1nMtQGZpN7t5kwXagngTHNGrorfarP4txEkhtI
         yT4w==
X-Gm-Message-State: ACgBeo2ufxngYbM3XwxKImqDOK+dJXUH8IEp9uoIWjqOBgZujcIcMiTZ
	MnkoqdlLgFyvrSGxej1p78CDQf230Me61g==
X-Google-Smtp-Source: AA6agR7Wop4gyNjvGh+TD4IYPtU/+fTlHYhFQgYsGVVE1ZRnDLHvzFfnYbO4OW5v/JbWR5QmjFcp3w==
X-Received: by 2002:a17:90a:4984:b0:1f4:caba:9008 with SMTP id d4-20020a17090a498400b001f4caba9008mr1660837pjh.151.1660103678278;
        Tue, 09 Aug 2022 20:54:38 -0700 (PDT)
Received: from tee480 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
        by smtp.googlemail.com with ESMTPSA id g26-20020aa79dda000000b0052ceaba7411sm682262pfq.125.2022.08.09.20.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 20:54:37 -0700 (PDT)
Message-ID: <65f2a05aa680709c18f2cf33d7e3af26eab95e87.camel@gmail.com>
Subject: Re: [PATCH 04/17] powerpc/qspinlock: convert atomic operations to
 assembly
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 10 Aug 2022 13:54:33 +1000
In-Reply-To: <20220728063120.2867508-6-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-6-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-7"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-07-28 at 16:31 +-1000, Nicholas Piggin wrote:
+AD4 This uses more optimal ll/sc style access patterns (rather than
+AD4 cmpxchg), and also sets the EH+AD0-1 lock hint on those operations
+AD4 which acquire ownership of the lock.
+AD4 ---
+AD4  arch/powerpc/include/asm/qspinlock.h       +AHw 25 +-+-+-+-+---
+AD4  arch/powerpc/include/asm/qspinlock+AF8-types.h +AHw  6 +--
+AD4  arch/powerpc/lib/qspinlock.c               +AHw 81 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+--------
+AD4  3 files changed, 79 insertions(+-), 33 deletions(-)
+AD4 
+AD4 diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
+AD4 index 79a1936fb68d..3ab354159e5e 100644
+AD4 --- a/arch/powerpc/include/asm/qspinlock.h
+AD4 +-+-+- b/arch/powerpc/include/asm/qspinlock.h
+AD4 +AEAAQA -2,28 +-2,43 +AEAAQA
+AD4  +ACM-ifndef +AF8-ASM+AF8-POWERPC+AF8-QSPINLOCK+AF8-H
+AD4  +ACM-define +AF8-ASM+AF8-POWERPC+AF8-QSPINLOCK+AF8-H
+AD4  
+AD4 -+ACM-include +ADw-linux/atomic.h+AD4
+AD4  +ACM-include +ADw-linux/compiler.h+AD4
+AD4  +ACM-include +ADw-asm/qspinlock+AF8-types.h+AD4
+AD4  
+AD4  static +AF8AXw-always+AF8-inline int queued+AF8-spin+AF8-is+AF8-locked(struct qspinlock +ACo-lock)
+AD4  +AHs
+AD4 -	return atomic+AF8-read(+ACY-lock-+AD4-val)+ADs
+AD4 +-	return READ+AF8-ONCE(lock-+AD4-val)+ADs
+AD4  +AH0
+AD4  
+AD4  static +AF8AXw-always+AF8-inline int queued+AF8-spin+AF8-value+AF8-unlocked(struct qspinlock lock)
+AD4  +AHs
+AD4 -	return +ACE-atomic+AF8-read(+ACY-lock.val)+ADs
+AD4 +-	return +ACE-lock.val+ADs
+AD4  +AH0
+AD4  
+AD4  static +AF8AXw-always+AF8-inline int queued+AF8-spin+AF8-is+AF8-contended(struct qspinlock +ACo-lock)
+AD4  +AHs
+AD4 -	return +ACEAIQ(atomic+AF8-read(+ACY-lock-+AD4-val) +ACY +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK)+ADs
+AD4 +-	return +ACEAIQ(READ+AF8-ONCE(lock-+AD4-val) +ACY +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK)+ADs
+AD4  +AH0
+AD4  
+AD4  static +AF8AXw-always+AF8-inline int queued+AF8-spin+AF8-trylock(struct qspinlock +ACo-lock)
+AD4  +AHs
+AD4 -	if (atomic+AF8-cmpxchg+AF8-acquire(+ACY-lock-+AD4-val, 0, +AF8-Q+AF8-LOCKED+AF8-VAL) +AD0APQ 0)
+AD4 +-	u32 new +AD0 +AF8-Q+AF8-LOCKED+AF8-VAL+ADs
+AD4 +-	u32 prev+ADs
+AD4 +-
+AD4 +-	asm volatile(
+AD4 +-+ACI-1:	lwarx	+ACU-0,0,+ACU-1,+ACU-3	+ACM queued+AF8-spin+AF8-trylock			+AFw-n+ACI
+AD4 +-+ACI	cmpwi	0,+ACU-0,0							+AFw-n+ACI
+AD4 +-+ACI	bne-	2f							+AFw-n+ACI
+AD4 +-+ACI	stwcx.	+ACU-2,0,+ACU-1							+AFw-n+ACI
+AD4 +-+ACI	bne-	1b							+AFw-n+ACI
+AD4 +-+ACIAXA-t+ACI	PPC+AF8-ACQUIRE+AF8-BARRIER +ACI						+AFw-n+ACI
+AD4 +-+ACI-2:									+AFw-n+ACI
+AD4 +-	: +ACIAPQAm-r+ACI (prev)
+AD4 +-	: +ACI-r+ACI (+ACY-lock-+AD4-val), +ACI-r+ACI (new),
+AD4 +-	  +ACI-i+ACI (IS+AF8-ENABLED(CONFIG+AF8-PPC64) ? 1 : 0)

btw IS+AF8-ENABLED() already returns 1 or 0

+AD4 +-	: +ACI-cr0+ACI, +ACI-memory+ACI)+ADs

This is the ISA's +ACI-test and set+ACI atomic primitive. Do you think it would be worth seperating it as a helper?

+AD4 +-
+AD4 +-	if (likely(prev +AD0APQ 0))
+AD4  		return 1+ADs
+AD4  	return 0+ADs

same optional style nit: return likely(prev +AD0APQ 0)+ADs

+AD4  +AH0
+AD4 diff --git a/arch/powerpc/include/asm/qspinlock+AF8-types.h b/arch/powerpc/include/asm/qspinlock+AF8-types.h
+AD4 index 3425dab42576..210adf05b235 100644
+AD4 --- a/arch/powerpc/include/asm/qspinlock+AF8-types.h
+AD4 +-+-+- b/arch/powerpc/include/asm/qspinlock+AF8-types.h
+AD4 +AEAAQA -7,7 +-7,7 +AEAAQA
+AD4  
+AD4  typedef struct qspinlock +AHs
+AD4  	union +AHs
+AD4 -		atomic+AF8-t val+ADs
+AD4 +-		u32 val+ADs
+AD4  
+AD4  +ACM-ifdef +AF8AXw-LITTLE+AF8-ENDIAN
+AD4  		struct +AHs
+AD4 +AEAAQA -23,10 +-23,10 +AEAAQA typedef struct qspinlock +AHs
+AD4  	+AH0AOw
+AD4  +AH0 arch+AF8-spinlock+AF8-t+ADs
+AD4  
+AD4 -+ACM-define	+AF8AXw-ARCH+AF8-SPIN+AF8-LOCK+AF8-UNLOCKED	+AHs +AHs .val +AD0 ATOMIC+AF8-INIT(0) +AH0 +AH0
+AD4 +-+ACM-define	+AF8AXw-ARCH+AF8-SPIN+AF8-LOCK+AF8-UNLOCKED	+AHs +AHs .val +AD0 0 +AH0 +AH0
+AD4  
+AD4  /+ACo
+AD4 - +ACo Bitfields in the atomic value:
+AD4 +- +ACo Bitfields in the lock word:
+AD4   +ACo
+AD4   +ACo     0: locked bit
+AD4   +ACo 16-31: tail cpu (+-1)
+AD4 diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
+AD4 index 5ebb88d95636..7c71e5e287df 100644
+AD4 --- a/arch/powerpc/lib/qspinlock.c
+AD4 +-+-+- b/arch/powerpc/lib/qspinlock.c
+AD4 +AEAAQA -1,5 +-1,4 +AEAAQA
+AD4  // SPDX-License-Identifier: GPL-2.0-or-later
+AD4 -+ACM-include +ADw-linux/atomic.h+AD4
+AD4  +ACM-include +ADw-linux/bug.h+AD4
+AD4  +ACM-include +ADw-linux/compiler.h+AD4
+AD4  +ACM-include +ADw-linux/export.h+AD4
+AD4 +AEAAQA -22,32 +-21,59 +AEAAQA struct qnodes +AHs
+AD4  
+AD4  static DEFINE+AF8-PER+AF8-CPU+AF8-ALIGNED(struct qnodes, qnodes)+ADs
+AD4  
+AD4 -static inline int encode+AF8-tail+AF8-cpu(void)
+AD4 +-static inline u32 encode+AF8-tail+AF8-cpu(void)
+AD4  +AHs
+AD4  	return (smp+AF8-processor+AF8-id() +- 1) +ADwAPA +AF8-Q+AF8-TAIL+AF8-CPU+AF8-OFFSET+ADs
+AD4  +AH0
+AD4  
+AD4 -static inline int get+AF8-tail+AF8-cpu(int val)
+AD4 +-static inline int get+AF8-tail+AF8-cpu(u32 val)
+AD4  +AHs
+AD4  	return (val +AD4APg +AF8-Q+AF8-TAIL+AF8-CPU+AF8-OFFSET) - 1+ADs
+AD4  +AH0
+AD4  
+AD4  /+ACo Take the lock by setting the bit, no other CPUs may concurrently lock it. +ACo-/

I think you missed deleting the above line.

+AD4 +-/+ACo Take the lock by setting the lock bit, no other CPUs will touch it. +ACo-/
+AD4  static +AF8AXw-always+AF8-inline void lock+AF8-set+AF8-locked(struct qspinlock +ACo-lock)
+AD4  +AHs
+AD4 -	atomic+AF8-or(+AF8-Q+AF8-LOCKED+AF8-VAL, +ACY-lock-+AD4-val)+ADs
+AD4 -	+AF8AXw-atomic+AF8-acquire+AF8-fence()+ADs
+AD4 +-	u32 new +AD0 +AF8-Q+AF8-LOCKED+AF8-VAL+ADs
+AD4 +-	u32 prev+ADs
+AD4 +-
+AD4 +-	asm volatile(
+AD4 +-+ACI-1:	lwarx	+ACU-0,0,+ACU-1,+ACU-3	+ACM lock+AF8-set+AF8-locked			+AFw-n+ACI
+AD4 +-+ACI	or	+ACU-0,+ACU-0,+ACU-2						+AFw-n+ACI
+AD4 +-+ACI	stwcx.	+ACU-0,0,+ACU-1							+AFw-n+ACI
+AD4 +-+ACI	bne-	1b							+AFw-n+ACI
+AD4 +-+ACIAXA-t+ACI	PPC+AF8-ACQUIRE+AF8-BARRIER +ACI						+AFw-n+ACI
+AD4 +-	: +ACIAPQAm-r+ACI (prev)
+AD4 +-	: +ACI-r+ACI (+ACY-lock-+AD4-val), +ACI-r+ACI (new),
+AD4 +-	  +ACI-i+ACI (IS+AF8-ENABLED(CONFIG+AF8-PPC64) ? 1 : 0)
+AD4 +-	: +ACI-cr0+ACI, +ACI-memory+ACI)+ADs
+AD4  +AH0


This is pretty similar with the DEFINE+AF8-TESTOP() pattern from
arch/powerpc/include/asm/bitops.h (such as test+AF8-and+AF8-set+AF8-bits+AF8-lock()) except for
word instead of double word. Do you think it's possible / beneficial to make
use of those macros?


+AD4  
+AD4 -/+ACo Take lock, clearing tail, cmpxchg with val (which must not be locked) +ACo-/
+AD4 -static +AF8AXw-always+AF8-inline int trylock+AF8-clear+AF8-tail+AF8-cpu(struct qspinlock +ACo-lock, int val)
+AD4 +-/+ACo Take lock, clearing tail, cmpxchg with old (which must not be locked) +ACo-/
+AD4 +-static +AF8AXw-always+AF8-inline int trylock+AF8-clear+AF8-tail+AF8-cpu(struct qspinlock +ACo-lock, u32 old)
+AD4  +AHs
+AD4 -	int newval +AD0 +AF8-Q+AF8-LOCKED+AF8-VAL+ADs
+AD4 -
+AD4 -	if (atomic+AF8-cmpxchg+AF8-acquire(+ACY-lock-+AD4-val, val, newval) +AD0APQ val)
+AD4 +-	u32 new +AD0 +AF8-Q+AF8-LOCKED+AF8-VAL+ADs
+AD4 +-	u32 prev+ADs
+AD4 +-
+AD4 +-	BUG+AF8-ON(old +ACY +AF8-Q+AF8-LOCKED+AF8-VAL)+ADs

The BUG+AF8-ON() could have been introduced in an earlier patch I think.

+AD4 +-
+AD4 +-	asm volatile(
+AD4 +-+ACI-1:	lwarx	+ACU-0,0,+ACU-1,+ACU-4	+ACM trylock+AF8-clear+AF8-tail+AF8-cpu		+AFw-n+ACI
+AD4 +-+ACI	cmpw	0,+ACU-0,+ACU-2							+AFw-n+ACI
+AD4 +-+ACI	bne-	2f							+AFw-n+ACI
+AD4 +-+ACI	stwcx.	+ACU-3,0,+ACU-1							+AFw-n+ACI
+AD4 +-+ACI	bne-	1b							+AFw-n+ACI
+AD4 +-+ACIAXA-t+ACI	PPC+AF8-ACQUIRE+AF8-BARRIER +ACI						+AFw-n+ACI
+AD4 +-+ACI-2:									+AFw-n+ACI
+AD4 +-	: +ACIAPQAm-r+ACI (prev)
+AD4 +-	: +ACI-r+ACI (+ACY-lock-+AD4-val), +ACI-r+ACI(old), +ACI-r+ACI (new),

Could this be like  +ACI-r+ACI(+AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK) below?
i.e. +ACI-r+ACI (+AF8-Q+AF8-LOCKED+AF8-VAL)? Makes it clear new doesn't change.

+AD4 +-	  +ACI-i+ACI (IS+AF8-ENABLED(CONFIG+AF8-PPC64) ? 1 : 0)
+AD4 +-	: +ACI-cr0+ACI, +ACI-memory+ACI)+ADs
+AD4 +-
+AD4 +-	if (likely(prev +AD0APQ old))
+AD4  		return 1+ADs
+AD4 -	else
+AD4 -		return 0+ADs
+AD4 +-	return 0+ADs
+AD4  +AH0
+AD4  
+AD4  /+ACo
+AD4 +AEAAQA -56,20 +-82,25 +AEAAQA static +AF8AXw-always+AF8-inline int trylock+AF8-clear+AF8-tail+AF8-cpu(struct qspinlock +ACo-lock, int va
+AD4   +ACo This provides a release barrier for publishing node, and an acquire barrier


Does the comment mean there needs to be an acquire barrier in this assembly?


+AD4   +ACo for getting the old node.
+AD4   +ACo-/
+AD4 -static +AF8AXw-always+AF8-inline int publish+AF8-tail+AF8-cpu(struct qspinlock +ACo-lock, int tail)
+AD4 +-static +AF8AXw-always+AF8-inline u32 publish+AF8-tail+AF8-cpu(struct qspinlock +ACo-lock, u32 tail)
+AD4  +AHs
+AD4 -	for (+ADsAOw) +AHs
+AD4 -		int val +AD0 atomic+AF8-read(+ACY-lock-+AD4-val)+ADs
+AD4 -		int newval +AD0 (val +ACY +AH4AXw-Q+AF8-TAIL+AF8-CPU+AF8-MASK) +AHw tail+ADs
+AD4 -		int old+ADs
+AD4 -
+AD4 -		old +AD0 atomic+AF8-cmpxchg(+ACY-lock-+AD4-val, val, newval)+ADs
+AD4 -		if (old +AD0APQ val)
+AD4 -			return old+ADs
+AD4 -	+AH0
+AD4 +-	u32 prev, tmp+ADs
+AD4 +-
+AD4 +-	asm volatile(
+AD4 +-+ACIAXA-t+ACI	PPC+AF8-RELEASE+AF8-BARRIER +ACI						+AFw-n+ACI
+AD4 +-+ACI-1:	lwarx	+ACU-0,0,+ACU-2		+ACM publish+AF8-tail+AF8-cpu			+AFw-n+ACI
+AD4 +-+ACI	andc	+ACU-1,+ACU-0,+ACU-4						+AFw-n+ACI
+AD4 +-+ACI	or	+ACU-1,+ACU-1,+ACU-3						+AFw-n+ACI
+AD4 +-+ACI	stwcx.	+ACU-1,0,+ACU-2							+AFw-n+ACI
+AD4 +-+ACI	bne-	1b							+AFw-n+ACI
+AD4 +-	: +ACIAPQAm-r+ACI (prev), +ACIAPQAm-r+ACI(tmp)
+AD4 +-	: +ACI-r+ACI (+ACY-lock-+AD4-val), +ACI-r+ACI (tail), +ACI-r+ACI(+AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK)
+AD4 +-	: +ACI-cr0+ACI, +ACI-memory+ACI)+ADs
+AD4 +-
+AD4 +-	return prev+ADs
+AD4  +AH0
+AD4  
+AD4 -static struct qnode +ACo-get+AF8-tail+AF8-qnode(struct qspinlock +ACo-lock, int val)
+AD4 +-static struct qnode +ACo-get+AF8-tail+AF8-qnode(struct qspinlock +ACo-lock, u32 val)
+AD4  +AHs
+AD4  	int cpu +AD0 get+AF8-tail+AF8-cpu(val)+ADs
+AD4  	struct qnodes +ACo-qnodesp +AD0 per+AF8-cpu+AF8-ptr(+ACY-qnodes, cpu)+ADs
+AD4 +AEAAQA -88,7 +-119,7 +AEAAQA static inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock)
+AD4  +AHs
+AD4  	struct qnodes +ACo-qnodesp+ADs
+AD4  	struct qnode +ACo-next, +ACo-node+ADs
+AD4 -	int val, old, tail+ADs
+AD4 +-	u32 val, old, tail+ADs
+AD4  	int idx+ADs
+AD4  
+AD4  	BUILD+AF8-BUG+AF8-ON(CONFIG+AF8-NR+AF8-CPUS +AD4APQ (1U +ADwAPA +AF8-Q+AF8-TAIL+AF8-CPU+AF8-BITS))+ADs
+AD4 +AEAAQA -134,7 +-165,7 +AEAAQA static inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock)
+AD4  	+AH0
+AD4  
+AD4  	/+ACo We're at the head of the waitqueue, wait for the lock. +ACo-/
+AD4 -	while ((val +AD0 atomic+AF8-read(+ACY-lock-+AD4-val)) +ACY +AF8-Q+AF8-LOCKED+AF8-VAL)
+AD4 +-	while ((val +AD0 READ+AF8-ONCE(lock-+AD4-val)) +ACY +AF8-Q+AF8-LOCKED+AF8-VAL)
+AD4  		cpu+AF8-relax()+ADs
+AD4  
+AD4  	/+ACo If we're the last queued, must clean up the tail. +ACo-/

