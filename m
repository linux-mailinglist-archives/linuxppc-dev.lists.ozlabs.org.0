Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE5058E66B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 06:32:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2cVM63vvz3bf5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 14:32:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VIKEs5tF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VIKEs5tF;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2cTj35vLz2xG4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Aug 2022 14:31:52 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id w11-20020a17090a380b00b001f73f75a1feso963262pjb.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Aug 2022 21:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=qS+rCtPyMJP7FcnAnmDjlxzffhpByKnZ1MMA4f6DPX0=;
        b=VIKEs5tFHCbSyJAls3DHl8Q+uB+qaVCOAgrg1bw6+5OuqNcqph4Mz7VLkWVzP1zgXw
         RBClDPkXSlTUH9nGVx2+TkqLxbScxVg+3pFC/zvL3xkL24xU3nlzL1LmiC4g/GfYtOrH
         ssOVGAPG72SYD8FF1uuvYVzCxexVl1rdnO4AlvjvrJC3eN1TuQzs6NKUx88ENvJHo/6P
         hvwwXveF9Ear5sR5ZzfEyd7EsFNrxRi6WzT0iuhz0wKJ5P1H6HcjyBOYdMo6lPN9vQKq
         Geq7rFAzC3JUIVkXat1NfRc+I4F+rSFvIIhxW5eePVdYdMZRI4tzNAXvWRvzgdQBiRVO
         57Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=qS+rCtPyMJP7FcnAnmDjlxzffhpByKnZ1MMA4f6DPX0=;
        b=TuK/tXh6sr6CNIXJgAd6WYBJ4wyt8weGCHFKf/wOgS02jcXcvtnnZVCVrAchZMS2vl
         /G3YXcm3DP7z/vCzSkAOEpLelFHwGyGP2IVyhYqhL4xZ7OgvXCKB4+8f2RbKqJ2njGJo
         Ed0Cq7O98i0jiMovpZ/5j8j1pfigJ023pt3GBFVUOM/uBu0AYUi1yirqrjxNkmohb+NR
         9Vjy/2Gn2ZByZOrpL+E9FbWgD1qkYOiH1pnogxXHl+rjMVrBrcTcWo6AcCEsDiUNE16d
         jarqzo2Y3lLsq5cnf7RjsnI+L20Jmp/VrNIur0R8ZregQY7s4lPF9B+gNwgjOpPtSQXB
         PQMw==
X-Gm-Message-State: ACgBeo0ugX2Lwv40LyMttRaXA+dksXG9MrRUBORlOP+b2jRU7bfXdHVO
	M2c2fBBTT8N+m3LAR+Zxm1s=
X-Google-Smtp-Source: AA6agR78v/CJCp/WeleN25yVR1/mdoW73JEQAnI09qEfCGH/700Fj7dVIFxkYcf5XzvpOeam12W84g==
X-Received: by 2002:a17:90b:314e:b0:1f3:189c:518f with SMTP id ip14-20020a17090b314e00b001f3189c518fmr1718870pjb.193.1660105907845;
        Tue, 09 Aug 2022 21:31:47 -0700 (PDT)
Received: from tee480 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
        by smtp.googlemail.com with ESMTPSA id w8-20020a170902904800b0016d23e941f2sm11577029plz.258.2022.08.09.21.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 21:31:46 -0700 (PDT)
Message-ID: <ba3e6f8bb0d9b45a799f26f8e6af82ea024d4f05.camel@gmail.com>
Subject: Re: [PATCH 05/17] powerpc/qspinlock: allow new waiters to steal the
 lock before queueing
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 10 Aug 2022 14:31:42 +1000
In-Reply-To: <20220728063120.2867508-7-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-7-npiggin@gmail.com>
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
+AD4 Allow new waiters a number of spins on the lock word before queueing,
+AD4 which particularly helps paravirt performance when physical CPUs are
+AD4 oversubscribed.
+AD4 ---
+AD4  arch/powerpc/lib/qspinlock.c +AHw 152 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----
+AD4  1 file changed, 141 insertions(+-), 11 deletions(-)
+AD4 
+AD4 diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
+AD4 index 7c71e5e287df..1625cce714b2 100644
+AD4 --- a/arch/powerpc/lib/qspinlock.c
+AD4 +-+-+- b/arch/powerpc/lib/qspinlock.c
+AD4 +AEAAQA -19,8 +-19,17 +AEAAQA struct qnodes +AHs
+AD4  	struct qnode nodes+AFs-MAX+AF8-NODES+AF0AOw
+AD4  +AH0AOw
+AD4  
+AD4 +-/+ACo Tuning parameters +ACo-/
+AD4 +-static int STEAL+AF8-SPINS +AF8AXw-read+AF8-mostly +AD0 (1+ADwAPA-5)+ADs
+AD4 +-static bool MAYBE+AF8-STEALERS +AF8AXw-read+AF8-mostly +AD0 true+ADs

I can understand why, but macro case variables can be a bit confusing.

+AD4 +-
+AD4  static DEFINE+AF8-PER+AF8-CPU+AF8-ALIGNED(struct qnodes, qnodes)+ADs
+AD4  
+AD4 +-static +AF8AXw-always+AF8-inline int get+AF8-steal+AF8-spins(void)
+AD4 +-+AHs
+AD4 +-	return STEAL+AF8-SPINS+ADs
+AD4 +-+AH0
+AD4 +-
+AD4  static inline u32 encode+AF8-tail+AF8-cpu(void)
+AD4  +AHs
+AD4  	return (smp+AF8-processor+AF8-id() +- 1) +ADwAPA +AF8-Q+AF8-TAIL+AF8-CPU+AF8-OFFSET+ADs
+AD4 +AEAAQA -76,6 +-85,39 +AEAAQA static +AF8AXw-always+AF8-inline int trylock+AF8-clear+AF8-tail+AF8-cpu(struct qspinlock +ACo-lock, u32 ol
+AD4  	return 0+ADs
+AD4  +AH0
+AD4  
+AD4 +-static +AF8AXw-always+AF8-inline u32 +AF8AXw-trylock+AF8-cmpxchg(struct qspinlock +ACo-lock, u32 old, u32 new)
+AD4 +-+AHs
+AD4 +-	u32 prev+ADs
+AD4 +-
+AD4 +-	BUG+AF8-ON(old +ACY +AF8-Q+AF8-LOCKED+AF8-VAL)+ADs
+AD4 +-
+AD4 +-	asm volatile(
+AD4 +-+ACI-1:	lwarx	+ACU-0,0,+ACU-1,+ACU-4	+ACM queued+AF8-spin+AF8-trylock+AF8-cmpxchg		+AFw-n+ACI

s/queued+AF8-spin+AF8-trylock+AF8-cmpxchg/+AF8AXw-trylock+AF8-cmpxchg/

btw what is the format you using for the '+AFw-n's in the inline asm?

+AD4 +-+ACI	cmpw	0,+ACU-0,+ACU-2							+AFw-n+ACI
+AD4 +-+ACI	bne-	2f							+AFw-n+ACI
+AD4 +-+ACI	stwcx.	+ACU-3,0,+ACU-1							+AFw-n+ACI
+AD4 +-+ACI	bne-	1b							+AFw-n+ACI
+AD4 +-+ACIAXA-t+ACI	PPC+AF8-ACQUIRE+AF8-BARRIER +ACI						+AFw-n+ACI
+AD4 +-+ACI-2:									+AFw-n+ACI
+AD4 +-	: +ACIAPQAm-r+ACI (prev)
+AD4 +-	: +ACI-r+ACI (+ACY-lock-+AD4-val), +ACI-r+ACI(old), +ACI-r+ACI (new),
+AD4 +-	  +ACI-i+ACI (IS+AF8-ENABLED(CONFIG+AF8-PPC64) ? 1 : 0)
+AD4 +-	: +ACI-cr0+ACI, +ACI-memory+ACI)+ADs

This is very similar to trylock+AF8-clear+AF8-tail+AF8-cpu(). So maybe it is worth having
some form of +ACI-test and set+ACI primitive helper.

+AD4 +-
+AD4 +-	return prev+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-/+ACo Take lock, preserving tail, cmpxchg with val (which must not be locked) +ACo-/
+AD4 +-static +AF8AXw-always+AF8-inline int trylock+AF8-with+AF8-tail+AF8-cpu(struct qspinlock +ACo-lock, u32 val)
+AD4 +-+AHs
+AD4 +-	u32 newval +AD0 +AF8-Q+AF8-LOCKED+AF8-VAL +AHw (val +ACY +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK)+ADs
+AD4 +-
+AD4 +-	if (+AF8AXw-trylock+AF8-cmpxchg(lock, val, newval) +AD0APQ val)
+AD4 +-		return 1+ADs
+AD4 +-	else
+AD4 +-		return 0+ADs

same optional style nit: return +AF8AXw-trylock+AF8-cmpxchg(lock, val, newval) +AD0APQ val

+AD4 +-+AH0
+AD4 +-
+AD4  /+ACo
+AD4   +ACo Publish our tail, replacing previous tail. Return previous value.
+AD4   +ACo
+AD4 +AEAAQA -115,6 +-157,31 +AEAAQA static struct qnode +ACo-get+AF8-tail+AF8-qnode(struct qspinlock +ACo-lock, u32 val)
+AD4  	BUG()+ADs
+AD4  +AH0
+AD4  
+AD4 +-static inline bool try+AF8-to+AF8-steal+AF8-lock(struct qspinlock +ACo-lock)
+AD4 +-+AHs
+AD4 +-	int iters+ADs
+AD4 +-
+AD4 +-	/+ACo Attempt to steal the lock +ACo-/
+AD4 +-	for (+ADsAOw) +AHs
+AD4 +-		u32 val +AD0 READ+AF8-ONCE(lock-+AD4-val)+ADs
+AD4 +-
+AD4 +-		if (unlikely(+ACE(val +ACY +AF8-Q+AF8-LOCKED+AF8-VAL))) +AHs
+AD4 +-			if (trylock+AF8-with+AF8-tail+AF8-cpu(lock, val))
+AD4 +-				return true+ADs
+AD4 +-			continue+ADs
+AD4 +-		+AH0

The continue would bypass iters+-+-/cpu+AF8-relax but the next time around
  if (unlikely(+ACE(val +ACY +AF8-Q+AF8-LOCKED+AF8-VAL))) +AHs
should fail so everything should be fine?

+AD4 +-
+AD4 +-		cpu+AF8-relax()+ADs
+AD4 +-
+AD4 +-		iters+-+-+ADs
+AD4 +-
+AD4 +-		if (iters +AD4APQ get+AF8-steal+AF8-spins())
+AD4 +-			break+ADs
+AD4 +-	+AH0
+AD4 +-
+AD4 +-	return false+ADs
+AD4 +-+AH0
+AD4 +-
+AD4  static inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock)
+AD4  +AHs
+AD4  	struct qnodes +ACo-qnodesp+ADs
+AD4 +AEAAQA -164,20 +-231,39 +AEAAQA static inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock)
+AD4  		smp+AF8-rmb()+ADs /+ACo acquire barrier for the mcs lock +ACo-/
+AD4  	+AH0
+AD4  
+AD4 -	/+ACo We're at the head of the waitqueue, wait for the lock. +ACo-/
+AD4 -	while ((val +AD0 READ+AF8-ONCE(lock-+AD4-val)) +ACY +AF8-Q+AF8-LOCKED+AF8-VAL)
+AD4 -		cpu+AF8-relax()+ADs
+AD4 +-	if (+ACE-MAYBE+AF8-STEALERS) +AHs
+AD4 +-		/+ACo We're at the head of the waitqueue, wait for the lock. +ACo-/
+AD4 +-		while ((val +AD0 READ+AF8-ONCE(lock-+AD4-val)) +ACY +AF8-Q+AF8-LOCKED+AF8-VAL)
+AD4 +-			cpu+AF8-relax()+ADs
+AD4  
+AD4 -	/+ACo If we're the last queued, must clean up the tail. +ACo-/
+AD4 -	if ((val +ACY +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK) +AD0APQ tail) +AHs
+AD4 -		if (trylock+AF8-clear+AF8-tail+AF8-cpu(lock, val))
+AD4 -			goto release+ADs
+AD4 -		/+ACo Another waiter must have enqueued +ACo-/
+AD4 -	+AH0
+AD4 +-		/+ACo If we're the last queued, must clean up the tail. +ACo-/
+AD4 +-		if ((val +ACY +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK) +AD0APQ tail) +AHs
+AD4 +-			if (trylock+AF8-clear+AF8-tail+AF8-cpu(lock, val))
+AD4 +-				goto release+ADs
+AD4 +-			/+ACo Another waiter must have enqueued. +ACo-/
+AD4 +-		+AH0
+AD4 +-
+AD4 +-		/+ACo We must be the owner, just set the lock bit and acquire +ACo-/
+AD4 +-		lock+AF8-set+AF8-locked(lock)+ADs
+AD4 +-	+AH0 else +AHs
+AD4 +-again:
+AD4 +-		/+ACo We're at the head of the waitqueue, wait for the lock. +ACo-/
+AD4 +-		while ((val +AD0 READ+AF8-ONCE(lock-+AD4-val)) +ACY +AF8-Q+AF8-LOCKED+AF8-VAL)
+AD4 +-			cpu+AF8-relax()+ADs
+AD4  
+AD4 -	/+ACo We must be the owner, just set the lock bit and acquire +ACo-/
+AD4 -	lock+AF8-set+AF8-locked(lock)+ADs
+AD4 +-		/+ACo If we're the last queued, must clean up the tail. +ACo-/
+AD4 +-		if ((val +ACY +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK) +AD0APQ tail) +AHs
+AD4 +-			if (trylock+AF8-clear+AF8-tail+AF8-cpu(lock, val))
+AD4 +-				goto release+ADs
+AD4 +-			/+ACo Another waiter must have enqueued, or lock stolen. +ACo-/
+AD4 +-		+AH0 else +AHs
+AD4 +-			if (trylock+AF8-with+AF8-tail+AF8-cpu(lock, val))
+AD4 +-				goto unlock+AF8-next+ADs
+AD4 +-		+AH0
+AD4 +-		goto again+ADs
+AD4 +-	+AH0
+AD4  
+AD4 +-unlock+AF8-next:
+AD4  	/+ACo contended path+ADs must wait for next +ACEAPQ NULL (MCS protocol) +ACo-/
+AD4  	while (+ACE(next +AD0 READ+AF8-ONCE(node-+AD4-next)))
+AD4  		cpu+AF8-relax()+ADs
+AD4 +AEAAQA -197,6 +-283,9 +AEAAQA static inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock)
+AD4  
+AD4  void queued+AF8-spin+AF8-lock+AF8-slowpath(struct qspinlock +ACo-lock)
+AD4  +AHs
+AD4 +-	if (try+AF8-to+AF8-steal+AF8-lock(lock))
+AD4 +-		return+ADs
+AD4 +-
+AD4  	queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(lock)+ADs
+AD4  +AH0
+AD4  EXPORT+AF8-SYMBOL(queued+AF8-spin+AF8-lock+AF8-slowpath)+ADs
+AD4 +AEAAQA -207,3 +-296,44 +AEAAQA void pv+AF8-spinlocks+AF8-init(void)
+AD4  +AH0
+AD4  +ACM-endif
+AD4  
+AD4 +-+ACM-include +ADw-linux/debugfs.h+AD4
+AD4 +-static int steal+AF8-spins+AF8-set(void +ACo-data, u64 val)
+AD4 +-+AHs
+AD4 +-	static DEFINE+AF8-MUTEX(lock)+ADs


I just want to check if it would be possible to get rid of the MAYBE+AF8-STEALERS
variable completely and do something like:

  bool maybe+AF8-stealers() +AHs return STEAL+AF8-SPINS +AD4 0+ADs +AH0

I guess based on the below code it wouldn't work, but I'm still not quite sure
why that is.

+AD4 +-
+AD4 +-	mutex+AF8-lock(+ACY-lock)+ADs
+AD4 +-	if (val +ACYAJg +ACE-STEAL+AF8-SPINS) +AHs
+AD4 +-		MAYBE+AF8-STEALERS +AD0 true+ADs
+AD4 +-		/+ACo wait for waiter to go away +ACo-/
+AD4 +-		synchronize+AF8-rcu()+ADs
+AD4 +-		STEAL+AF8-SPINS +AD0 val+ADs
+AD4 +-	+AH0 else if (+ACE-val +ACYAJg STEAL+AF8-SPINS) +AHs
+AD4 +-		STEAL+AF8-SPINS +AD0 val+ADs
+AD4 +-		/+ACo wait for all possible stealers to go away +ACo-/
+AD4 +-		synchronize+AF8-rcu()+ADs
+AD4 +-		MAYBE+AF8-STEALERS +AD0 false+ADs
+AD4 +-	+AH0 else +AHs
+AD4 +-		STEAL+AF8-SPINS +AD0 val+ADs
+AD4 +-	+AH0
+AD4 +-	mutex+AF8-unlock(+ACY-lock)+ADs

STEAL+AF8-SPINS is an int not a u64.

+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static int steal+AF8-spins+AF8-get(void +ACo-data, u64 +ACo-val)
+AD4 +-+AHs
+AD4 +-	+ACo-val +AD0 STEAL+AF8-SPINS+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-DEFINE+AF8-SIMPLE+AF8-ATTRIBUTE(fops+AF8-steal+AF8-spins, steal+AF8-spins+AF8-get, steal+AF8-spins+AF8-set, +ACIAJQ-llu+AFw-n+ACI)+ADs
+AD4 +-
+AD4 +-static +AF8AXw-init int spinlock+AF8-debugfs+AF8-init(void)
+AD4 +-+AHs
+AD4 +-	debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-steal+AF8-spins+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-steal+AF8-spins)+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-device+AF8-initcall(spinlock+AF8-debugfs+AF8-init)+ADs
+AD4 +-

