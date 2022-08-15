Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7D259275E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 03:12:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5bqb72Wvz3c2W
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 11:12:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mwn8jQV9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mwn8jQV9;
	dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5bpv6C9Zz2xZB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 11:12:06 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id 130so5294768pfy.6
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Aug 2022 18:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=ZYytHb47HbTONEayVj9hecIVdhgjuQuDEKway5cZPTs=;
        b=mwn8jQV9O0vBy7ZEw7Etg7t6UPuOdrMn3PqqGPck2RJfqDQkWU0xXcvQ3fY4ZcRI4g
         Bq5ZEr1Pyp349FivnQ17BlJPBKnMMUngPoSgz/s8V90i2Wt1DI4uivYpHZmp8z1Era8X
         gzAzCOlHs58kORV9k0hJHW8ZaIJuBZn3HQ/cc/Fj2s1Necd5MuTrDX5TUeNB7VtPWYSx
         m4gtyOp2E+135ULUUG2DhMUQts9DJwSmKOaG4zOys3mL6IaZk9k3yEzEo4fB8weBQgGA
         qytmtj9p/ycKggi5W1ozRr0x/pnegWEzvCi/Ddb0wmsdtuOU+DjZRLyTXx+kPjatx7A4
         U+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=ZYytHb47HbTONEayVj9hecIVdhgjuQuDEKway5cZPTs=;
        b=ByYh7JvN47SGXU4VNZ2ywbktj2GaGKzXfj8At5yE4zLkzCZ5ZEplNALevouVqYDH3v
         fXK62WeM+LpcXhdM4dn+My1J3f1rYc/a7QduslxKOSfubMTjQSOxCDiV3uY9OBE4ERZA
         BJ2qjg+Z0i8y4hSfKtFLk3adaoGBebs9/bobmbOWIUoBw6fvPdhbesetYjKwL36KtV0L
         ExZ+NWJ82YoBg9kBK3sQ/lKzp4KR4IqiDyoExCIraHIO31Ih69AkxtfxpIGpIfQXC7i3
         J7N9FA2IgOrBbS9AoKp/6rTdB3YAknuurE1dQYdvDTR5oDnyWU6e2DeZnoWFbtI8aYtX
         z3Kg==
X-Gm-Message-State: ACgBeo3usBh7M6KsEZzhMGKI1SiokF1fBMOGiXxUa3bSlowraWAykYrc
	C1y0WA8Z4pCh743p488VsX8=
X-Google-Smtp-Source: AA6agR4WcB7mKjaz1G/AmUoR0svLH2UiI3tjiIlHOpEwdiWFYqAqO+zmzUEFWRQNdKT3jYJ3fOd0uw==
X-Received: by 2002:a63:2a06:0:b0:41d:95d7:ab4f with SMTP id q6-20020a632a06000000b0041d95d7ab4fmr11675028pgq.187.1660525922074;
        Sun, 14 Aug 2022 18:12:02 -0700 (PDT)
Received: from tee480 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
        by smtp.googlemail.com with ESMTPSA id p6-20020a170902780600b0016efa52d428sm5939537pll.218.2022.08.14.18.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 18:12:01 -0700 (PDT)
Message-ID: <7964a437fa92cd268509179e75d6fa3bdf862973.camel@gmail.com>
Subject: Re: [PATCH 17/17] powerpc/qspinlock: provide accounting and options
 for sleepy locks
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 15 Aug 2022 11:11:56 +1000
In-Reply-To: <20220728063120.2867508-19-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-19-npiggin@gmail.com>
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
+AD4 Finding the owner or a queued waiter on a lock with a preempted vcpu
+AD4 is indicative of an oversubscribed guest causing the lock to get into
+AD4 trouble. Provide some options to detect this situation and have new
+AD4 CPUs avoid queueing for a longer time (more steal iterations) to
+AD4 minimise the problems caused by vcpu preemption on the queue.
+AD4 ---
+AD4  arch/powerpc/include/asm/qspinlock+AF8-types.h +AHw   7 +--
+AD4  arch/powerpc/lib/qspinlock.c               +AHw 240 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+---
+AD4  2 files changed, 232 insertions(+-), 15 deletions(-)
+AD4 
+AD4 diff --git a/arch/powerpc/include/asm/qspinlock+AF8-types.h b/arch/powerpc/include/asm/qspinlock+AF8-types.h
+AD4 index 35f9525381e6..4fbcc8a4230b 100644
+AD4 --- a/arch/powerpc/include/asm/qspinlock+AF8-types.h
+AD4 +-+-+- b/arch/powerpc/include/asm/qspinlock+AF8-types.h
+AD4 +AEAAQA -30,7 +-30,7 +AEAAQA typedef struct qspinlock +AHs
+AD4   +ACo
+AD4   +ACo     0: locked bit
+AD4   +ACo  1-14: lock holder cpu
+AD4 - +ACo    15: unused bit
+AD4 +- +ACo    15: lock owner or queuer vcpus observed to be preempted bit
+AD4   +ACo    16: must queue bit
+AD4   +ACo 17-31: tail cpu (+-1)
+AD4   +ACo-/
+AD4 +AEAAQA -49,6 +-49,11 +AEAAQA typedef struct qspinlock +AHs
+AD4  +ACM-error +ACI-qspinlock does not support such large CONFIG+AF8-NR+AF8-CPUS+ACI
+AD4  +ACM-endif
+AD4  
+AD4 +-+ACM-define +AF8-Q+AF8-SLEEPY+AF8-OFFSET	15
+AD4 +-+ACM-define +AF8-Q+AF8-SLEEPY+AF8-BITS		1
+AD4 +-+ACM-define +AF8-Q+AF8-SLEEPY+AF8-MASK		+AF8-Q+AF8-SET+AF8-MASK(SLEEPY+AF8-OWNER)
+AD4 +-+ACM-define +AF8-Q+AF8-SLEEPY+AF8-VAL		(1U +ADwAPA +AF8-Q+AF8-SLEEPY+AF8-OFFSET)
+AD4 +-
+AD4  +ACM-define +AF8-Q+AF8-MUST+AF8-Q+AF8-OFFSET	16
+AD4  +ACM-define +AF8-Q+AF8-MUST+AF8-Q+AF8-BITS		1
+AD4  +ACM-define +AF8-Q+AF8-MUST+AF8-Q+AF8-MASK		+AF8-Q+AF8-SET+AF8-MASK(MUST+AF8-Q)
+AD4 diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
+AD4 index 5cfd69931e31..c18133c01450 100644
+AD4 --- a/arch/powerpc/lib/qspinlock.c
+AD4 +-+-+- b/arch/powerpc/lib/qspinlock.c
+AD4 +AEAAQA -5,6 +-5,7 +AEAAQA
+AD4  +ACM-include +ADw-linux/percpu.h+AD4
+AD4  +ACM-include +ADw-linux/smp.h+AD4
+AD4  +ACM-include +ADw-linux/topology.h+AD4
+AD4 +-+ACM-include +ADw-linux/sched/clock.h+AD4
+AD4  +ACM-include +ADw-asm/qspinlock.h+AD4
+AD4  +ACM-include +ADw-asm/paravirt.h+AD4
+AD4  
+AD4 +AEAAQA -36,24 +-37,54 +AEAAQA static int HEAD+AF8-SPINS +AF8AXw-read+AF8-mostly +AD0 (1+ADwAPA-8)+ADs
+AD4  static bool pv+AF8-yield+AF8-owner +AF8AXw-read+AF8-mostly +AD0 true+ADs
+AD4  static bool pv+AF8-yield+AF8-allow+AF8-steal +AF8AXw-read+AF8-mostly +AD0 false+ADs
+AD4  static bool pv+AF8-spin+AF8-on+AF8-preempted+AF8-owner +AF8AXw-read+AF8-mostly +AD0 false+ADs
+AD4 +-static bool pv+AF8-sleepy+AF8-lock +AF8AXw-read+AF8-mostly +AD0 true+ADs
+AD4 +-static bool pv+AF8-sleepy+AF8-lock+AF8-sticky +AF8AXw-read+AF8-mostly +AD0 false+ADs

The sticky part could potentially be its own patch.

+AD4 +-static u64 pv+AF8-sleepy+AF8-lock+AF8-interval+AF8-ns +AF8AXw-read+AF8-mostly +AD0 0+ADs
+AD4 +-static int pv+AF8-sleepy+AF8-lock+AF8-factor +AF8AXw-read+AF8-mostly +AD0 256+ADs
+AD4  static bool pv+AF8-yield+AF8-prev +AF8AXw-read+AF8-mostly +AD0 true+ADs
+AD4  static bool pv+AF8-yield+AF8-propagate+AF8-owner +AF8AXw-read+AF8-mostly +AD0 true+ADs
+AD4  static bool pv+AF8-prod+AF8-head +AF8AXw-read+AF8-mostly +AD0 false+ADs
+AD4  
+AD4  static DEFINE+AF8-PER+AF8-CPU+AF8-ALIGNED(struct qnodes, qnodes)+ADs
+AD4 +-static DEFINE+AF8-PER+AF8-CPU+AF8-ALIGNED(u64, sleepy+AF8-lock+AF8-seen+AF8-clock)+ADs
+AD4  
+AD4 -static +AF8AXw-always+AF8-inline int get+AF8-steal+AF8-spins(bool paravirt, bool remote)
+AD4 +-static +AF8AXw-always+AF8-inline bool recently+AF8-sleepy(void)
+AD4 +-+AHs

Other users of pv+AF8-sleepy+AF8-lock+AF8-interval+AF8-ns first check pv+AF8-sleepy+AF8-lock.

+AD4 +-	if (pv+AF8-sleepy+AF8-lock+AF8-interval+AF8-ns) +AHs
+AD4 +-		u64 seen +AD0 this+AF8-cpu+AF8-read(sleepy+AF8-lock+AF8-seen+AF8-clock)+ADs
+AD4 +-
+AD4 +-		if (seen) +AHs
+AD4 +-			u64 delta +AD0 sched+AF8-clock() - seen+ADs
+AD4 +-			if (delta +ADw pv+AF8-sleepy+AF8-lock+AF8-interval+AF8-ns)
+AD4 +-				return true+ADs
+AD4 +-			this+AF8-cpu+AF8-write(sleepy+AF8-lock+AF8-seen+AF8-clock, 0)+ADs
+AD4 +-		+AH0
+AD4 +-	+AH0
+AD4 +-
+AD4 +-	return false+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static +AF8AXw-always+AF8-inline int get+AF8-steal+AF8-spins(bool paravirt, bool remote, bool sleepy)

It seems like paravirt is implied by sleepy.

+AD4  +AHs
+AD4  	if (remote) +AHs
+AD4 -		return REMOTE+AF8-STEAL+AF8-SPINS+ADs
+AD4 +-		if (paravirt +ACYAJg sleepy)
+AD4 +-			return REMOTE+AF8-STEAL+AF8-SPINS +ACo pv+AF8-sleepy+AF8-lock+AF8-factor+ADs
+AD4 +-		else
+AD4 +-			return REMOTE+AF8-STEAL+AF8-SPINS+ADs
+AD4  	+AH0 else +AHs
+AD4 -		return STEAL+AF8-SPINS+ADs
+AD4 +-		if (paravirt +ACYAJg sleepy)
+AD4 +-			return STEAL+AF8-SPINS +ACo pv+AF8-sleepy+AF8-lock+AF8-factor+ADs
+AD4 +-		else
+AD4 +-			return STEAL+AF8-SPINS+ADs
+AD4  	+AH0
+AD4  +AH0

I think that separate functions would still be nicer but this could get rid of
the nesting conditionals like


	int spins+ADs
	if (remote)
		spins +AD0 REMOTE+AF8-STEAL+AF8-SPINS+ADs
	else
		spins +AD0 STEAL+AF8-SPINS+ADs

	if (sleepy)
		return spins +ACo pv+AF8-sleepy+AF8-lock+AF8-factor+ADs
	return spins+ADs

+AD4  
+AD4 -static +AF8AXw-always+AF8-inline int get+AF8-head+AF8-spins(bool paravirt)
+AD4 +-static +AF8AXw-always+AF8-inline int get+AF8-head+AF8-spins(bool paravirt, bool sleepy)
+AD4  +AHs
+AD4 -	return HEAD+AF8-SPINS+ADs
+AD4 +-	if (paravirt +ACYAJg sleepy)
+AD4 +-		return HEAD+AF8-SPINS +ACo pv+AF8-sleepy+AF8-lock+AF8-factor+ADs
+AD4 +-	else
+AD4 +-		return HEAD+AF8-SPINS+ADs
+AD4  +AH0
+AD4  
+AD4  static inline u32 encode+AF8-tail+AF8-cpu(void)
+AD4 +AEAAQA -206,6 +-237,60 +AEAAQA static +AF8AXw-always+AF8-inline u32 lock+AF8-clear+AF8-mustq(struct qspinlock +ACo-lock)
+AD4  	return prev+ADs
+AD4  +AH0
+AD4  
+AD4 +-static +AF8AXw-always+AF8-inline bool lock+AF8-try+AF8-set+AF8-sleepy(struct qspinlock +ACo-lock, u32 old)
+AD4 +-+AHs
+AD4 +-	u32 prev+ADs
+AD4 +-	u32 new +AD0 old +AHw +AF8-Q+AF8-SLEEPY+AF8-VAL+ADs
+AD4 +-
+AD4 +-	BUG+AF8-ON(+ACE(old +ACY +AF8-Q+AF8-LOCKED+AF8-VAL))+ADs
+AD4 +-	BUG+AF8-ON(old +ACY +AF8-Q+AF8-SLEEPY+AF8-VAL)+ADs
+AD4 +-
+AD4 +-	asm volatile(
+AD4 +-+ACI-1:	lwarx	+ACU-0,0,+ACU-1		+ACM lock+AF8-try+AF8-set+AF8-sleepy			+AFw-n+ACI
+AD4 +-+ACI	cmpw	0,+ACU-0,+ACU-2							+AFw-n+ACI
+AD4 +-+ACI	bne-	2f							+AFw-n+ACI
+AD4 +-+ACI	stwcx.	+ACU-3,0,+ACU-1							+AFw-n+ACI
+AD4 +-+ACI	bne-	1b							+AFw-n+ACI
+AD4 +-+ACI-2:									+AFw-n+ACI
+AD4 +-	: +ACIAPQAm-r+ACI (prev)
+AD4 +-	: +ACI-r+ACI (+ACY-lock-+AD4-val), +ACI-r+ACI(old), +ACI-r+ACI (new)
+AD4 +-	: +ACI-cr0+ACI, +ACI-memory+ACI)+ADs
+AD4 +-
+AD4 +-	if (prev +AD0APQ old)
+AD4 +-		return true+ADs
+AD4 +-	return false+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static +AF8AXw-always+AF8-inline void seen+AF8-sleepy+AF8-owner(struct qspinlock +ACo-lock, u32 val)
+AD4 +-+AHs
+AD4 +-	if (pv+AF8-sleepy+AF8-lock) +AHs
+AD4 +-		if (pv+AF8-sleepy+AF8-lock+AF8-interval+AF8-ns)
+AD4 +-			this+AF8-cpu+AF8-write(sleepy+AF8-lock+AF8-seen+AF8-clock, sched+AF8-clock())+ADs
+AD4 +-		if (+ACE(val +ACY +AF8-Q+AF8-SLEEPY+AF8-VAL))
+AD4 +-			lock+AF8-try+AF8-set+AF8-sleepy(lock, val)+ADs
+AD4 +-	+AH0
+AD4 +-+AH0
+AD4 +-
+AD4 +-static +AF8AXw-always+AF8-inline void seen+AF8-sleepy+AF8-lock(void)
+AD4 +-+AHs
+AD4 +-	if (pv+AF8-sleepy+AF8-lock +ACYAJg pv+AF8-sleepy+AF8-lock+AF8-interval+AF8-ns)
+AD4 +-		this+AF8-cpu+AF8-write(sleepy+AF8-lock+AF8-seen+AF8-clock, sched+AF8-clock())+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static +AF8AXw-always+AF8-inline void seen+AF8-sleepy+AF8-node(struct qspinlock +ACo-lock)
+AD4 +-+AHs

If yield+AF8-to+AF8-prev() was made to take a raw val, that val could be passed to
seen+AF8-sleepy+AF8-node() and it would not need to get it by itself.

+AD4 +-	if (pv+AF8-sleepy+AF8-lock) +AHs
+AD4 +-		u32 val +AD0 READ+AF8-ONCE(lock-+AD4-val)+ADs
+AD4 +-
+AD4 +-		if (pv+AF8-sleepy+AF8-lock+AF8-interval+AF8-ns)
+AD4 +-			this+AF8-cpu+AF8-write(sleepy+AF8-lock+AF8-seen+AF8-clock, sched+AF8-clock())+ADs
+AD4 +-		if (val +ACY +AF8-Q+AF8-LOCKED+AF8-VAL) +AHs
+AD4 +-			if (+ACE(val +ACY +AF8-Q+AF8-SLEEPY+AF8-VAL))
+AD4 +-				lock+AF8-try+AF8-set+AF8-sleepy(lock, val)+ADs
+AD4 +-		+AH0
+AD4 +-	+AH0
+AD4 +-+AH0
+AD4 +-
+AD4  static struct qnode +ACo-get+AF8-tail+AF8-qnode(struct qspinlock +ACo-lock, u32 val)
+AD4  +AHs
+AD4  	int cpu +AD0 get+AF8-tail+AF8-cpu(val)+ADs
+AD4 +AEAAQA -244,6 +-329,7 +AEAAQA static +AF8AXw-always+AF8-inline void +AF8AXw-yield+AF8-to+AF8-locked+AF8-owner(struct qspinlock +ACo-lock, u32
+AD4  
+AD4  	spin+AF8-end()+ADs
+AD4  
+AD4 +-	seen+AF8-sleepy+AF8-owner(lock, val)+ADs
+AD4  	+ACo-preempted +AD0 true+ADs
+AD4  
+AD4  	/+ACo
+AD4 +AEAAQA -307,11 +-393,13 +AEAAQA static +AF8AXw-always+AF8-inline void propagate+AF8-yield+AF8-cpu(struct qnode +ACo-node, u32 val, int
+AD4  	+AH0
+AD4  +AH0
+AD4  
+AD4 -static +AF8AXw-always+AF8-inline void yield+AF8-to+AF8-prev(struct qspinlock +ACo-lock, struct qnode +ACo-node, int prev+AF8-cpu, bool paravirt)
+AD4 +-static +AF8AXw-always+AF8-inline void yield+AF8-to+AF8-prev(struct qspinlock +ACo-lock, struct qnode +ACo-node, int prev+AF8-cpu, bool paravirt, bool +ACo-preempted)
+AD4  +AHs
+AD4  	u32 yield+AF8-count+ADs
+AD4  	int yield+AF8-cpu+ADs
+AD4  
+AD4 +-	+ACo-preempted +AD0 false+ADs
+AD4 +-
+AD4  	if (+ACE-paravirt)
+AD4  		goto relax+ADs
+AD4  
+AD4 +AEAAQA -332,6 +-420,9 +AEAAQA static +AF8AXw-always+AF8-inline void yield+AF8-to+AF8-prev(struct qspinlock +ACo-lock, struct qnode +ACo
+AD4  
+AD4  	spin+AF8-end()+ADs
+AD4  
+AD4 +-	+ACo-preempted +AD0 true+ADs
+AD4 +-	seen+AF8-sleepy+AF8-node(lock)+ADs
+AD4 +-
+AD4  	smp+AF8-rmb()+ADs
+AD4  
+AD4  	if (yield+AF8-cpu +AD0APQ node-+AD4-yield+AF8-cpu) +AHs
+AD4 +AEAAQA -353,6 +-444,9 +AEAAQA static +AF8AXw-always+AF8-inline void yield+AF8-to+AF8-prev(struct qspinlock +ACo-lock, struct qnode +ACo
+AD4  
+AD4  	spin+AF8-end()+ADs
+AD4  
+AD4 +-	+ACo-preempted +AD0 true+ADs
+AD4 +-	seen+AF8-sleepy+AF8-node(lock)+ADs
+AD4 +-
+AD4  	smp+AF8-rmb()+ADs /+ACo See yield+AF8-to+AF8-locked+AF8-owner comment +ACo-/
+AD4  
+AD4  	if (+ACE-node-+AD4-locked) +AHs
+AD4 +AEAAQA -369,6 +-463,9 +AEAAQA static +AF8AXw-always+AF8-inline void yield+AF8-to+AF8-prev(struct qspinlock +ACo-lock, struct qnode +ACo
+AD4  
+AD4  static +AF8AXw-always+AF8-inline bool try+AF8-to+AF8-steal+AF8-lock(struct qspinlock +ACo-lock, bool paravirt)
+AD4  +AHs
+AD4 +-	bool preempted+ADs
+AD4 +-	bool seen+AF8-preempted +AD0 false+ADs
+AD4 +-	bool sleepy +AD0 false+ADs
+AD4  	int iters +AD0 0+ADs
+AD4  
+AD4  	if (+ACE-STEAL+AF8-SPINS) +AHs
+AD4 +AEAAQA -376,7 +-473,6 +AEAAQA static +AF8AXw-always+AF8-inline bool try+AF8-to+AF8-steal+AF8-lock(struct qspinlock +ACo-lock, bool parav
+AD4  			spin+AF8-begin()+ADs
+AD4  			for (+ADsAOw) +AHs
+AD4  				u32 val +AD0 READ+AF8-ONCE(lock-+AD4-val)+ADs
+AD4 -				bool preempted+ADs
+AD4  
+AD4  				if (val +ACY +AF8-Q+AF8-MUST+AF8-Q+AF8-VAL)
+AD4  					break+ADs
+AD4 +AEAAQA -395,7 +-491,6 +AEAAQA static +AF8AXw-always+AF8-inline bool try+AF8-to+AF8-steal+AF8-lock(struct qspinlock +ACo-lock, bool parav
+AD4  	spin+AF8-begin()+ADs
+AD4  	for (+ADsAOw) +AHs
+AD4  		u32 val +AD0 READ+AF8-ONCE(lock-+AD4-val)+ADs
+AD4 -		bool preempted+ADs
+AD4  
+AD4  		if (val +ACY +AF8-Q+AF8-MUST+AF8-Q+AF8-VAL)
+AD4  			break+ADs
+AD4 +AEAAQA -408,9 +-503,29 +AEAAQA static +AF8AXw-always+AF8-inline bool try+AF8-to+AF8-steal+AF8-lock(struct qspinlock +ACo-lock, bool parav
+AD4  			continue+ADs
+AD4  		+AH0
+AD4  
+AD4 +-		if (paravirt +ACYAJg pv+AF8-sleepy+AF8-lock +ACYAJg +ACE-sleepy) +AHs
+AD4 +-			if (+ACE-sleepy) +AHs


The enclosing conditional means this would always be true. I think the out conditional should be
if (paravirt +ACYAJg pv+AF8-sleepy+AF8-lock)
otherwise the pv+AF8-sleepy+AF8-lock+AF8-sticky part wouldn't work properly.


+AD4 +-				if (val +ACY +AF8-Q+AF8-SLEEPY+AF8-VAL) +AHs
+AD4 +-					seen+AF8-sleepy+AF8-lock()+ADs
+AD4 +-					sleepy +AD0 true+ADs
+AD4 +-				+AH0 else if (recently+AF8-sleepy()) +AHs
+AD4 +-					sleepy +AD0 true+ADs
+AD4 +-				+AH0
+AD4 +-
+AD4 +-			if (pv+AF8-sleepy+AF8-lock+AF8-sticky +ACYAJg seen+AF8-preempted +ACYAJg
+AD4 +-					+ACE(val +ACY +AF8-Q+AF8-SLEEPY+AF8-VAL)) +AHs
+AD4 +-				if (lock+AF8-try+AF8-set+AF8-sleepy(lock, val))
+AD4 +-					val +AHwAPQ +AF8-Q+AF8-SLEEPY+AF8-VAL+ADs
+AD4 +-			+AH0
+AD4 +-
+AD4 +-
+AD4  		yield+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt, +ACY-preempted)+ADs
+AD4 +-		if (preempted)
+AD4 +-			seen+AF8-preempted +AD0 true+ADs

This could belong to the next if statement, there can not be +ACE-paravirt +ACYAJg preempted ?

+AD4  
+AD4  		if (paravirt +ACYAJg preempted) +AHs
+AD4 +-			sleepy +AD0 true+ADs
+AD4 +-
+AD4  			if (+ACE-pv+AF8-spin+AF8-on+AF8-preempted+AF8-owner)
+AD4  				iters+-+-+ADs
+AD4  			/+ACo
+AD4 +AEAAQA -425,14 +-540,15 +AEAAQA static +AF8AXw-always+AF8-inline bool try+AF8-to+AF8-steal+AF8-lock(struct qspinlock +ACo-lock, bool parav
+AD4  			iters+-+-+ADs
+AD4  		+AH0
+AD4  
+AD4 -		if (iters +AD4APQ get+AF8-steal+AF8-spins(paravirt, false))
+AD4 +-		if (iters +AD4APQ get+AF8-steal+AF8-spins(paravirt, false, sleepy))
+AD4  			break+ADs
+AD4 -		if (iters +AD4APQ get+AF8-steal+AF8-spins(paravirt, true)) +AHs
+AD4 +-		if (iters +AD4APQ get+AF8-steal+AF8-spins(paravirt, true, sleepy)) +AHs
+AD4  			int cpu +AD0 get+AF8-owner+AF8-cpu(val)+ADs
+AD4  			if (numa+AF8-node+AF8-id() +ACEAPQ cpu+AF8-to+AF8-node(cpu))
+AD4  				break+ADs
+AD4  		+AH0
+AD4  	+AH0
+AD4 +-
+AD4  	spin+AF8-end()+ADs
+AD4  
+AD4  	return false+ADs
+AD4 +AEAAQA -443,6 +-559,7 +AEAAQA static +AF8AXw-always+AF8-inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock, b
+AD4  	struct qnodes +ACo-qnodesp+ADs
+AD4  	struct qnode +ACo-next, +ACo-node+ADs
+AD4  	u32 val, old, tail+ADs
+AD4 +-	bool seen+AF8-preempted +AD0 false+ADs
+AD4  	int idx+ADs
+AD4  
+AD4  	BUILD+AF8-BUG+AF8-ON(CONFIG+AF8-NR+AF8-CPUS +AD4APQ (1U +ADwAPA +AF8-Q+AF8-TAIL+AF8-CPU+AF8-BITS))+ADs
+AD4 +AEAAQA -485,8 +-602,13 +AEAAQA static +AF8AXw-always+AF8-inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock, b
+AD4  
+AD4  		/+ACo Wait for mcs node lock to be released +ACo-/
+AD4  		spin+AF8-begin()+ADs
+AD4 -		while (+ACE-node-+AD4-locked)
+AD4 -			yield+AF8-to+AF8-prev(lock, node, prev+AF8-cpu, paravirt)+ADs
+AD4 +-		while (+ACE-node-+AD4-locked) +AHs
+AD4 +-			bool preempted+ADs
+AD4 +-
+AD4 +-			yield+AF8-to+AF8-prev(lock, node, prev+AF8-cpu, paravirt, +ACY-preempted)+ADs
+AD4 +-			if (preempted)
+AD4 +-				seen+AF8-preempted +AD0 true+ADs
+AD4 +-		+AH0
+AD4  		spin+AF8-end()+ADs
+AD4  
+AD4  		/+ACo Clear out stale propagated yield+AF8-cpu +ACo-/
+AD4 +AEAAQA -506,6 +-628,8 +AEAAQA static +AF8AXw-always+AF8-inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock, b
+AD4  
+AD4  			propagate+AF8-yield+AF8-cpu(node, val, +ACY-set+AF8-yield+AF8-cpu, paravirt)+ADs
+AD4  			yield+AF8-head+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt, false, +ACY-preempted)+ADs
+AD4 +-			if (preempted)
+AD4 +-				seen+AF8-preempted +AD0 true+ADs
+AD4  		+AH0
+AD4  		spin+AF8-end()+ADs
+AD4  
+AD4 +AEAAQA -521,27 +-645,47 +AEAAQA static +AF8AXw-always+AF8-inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock, b
+AD4  	+AH0 else +AHs
+AD4  		int set+AF8-yield+AF8-cpu +AD0 -1+ADs
+AD4  		int iters +AD0 0+ADs
+AD4 +-		bool sleepy +AD0 false+ADs
+AD4  		bool set+AF8-mustq +AD0 false+ADs
+AD4 +-		bool preempted+ADs
+AD4  
+AD4  again:
+AD4  		/+ACo We're at the head of the waitqueue, wait for the lock. +ACo-/
+AD4  		spin+AF8-begin()+ADs
+AD4  		while ((val +AD0 READ+AF8-ONCE(lock-+AD4-val)) +ACY +AF8-Q+AF8-LOCKED+AF8-VAL) +AHs
+AD4 -			bool preempted+ADs
+AD4 +-			if (paravirt +ACYAJg pv+AF8-sleepy+AF8-lock) +AHs
+AD4 +-				if (+ACE-sleepy) +AHs
+AD4 +-					if (val +ACY +AF8-Q+AF8-SLEEPY+AF8-VAL) +AHs
+AD4 +-						seen+AF8-sleepy+AF8-lock()+ADs
+AD4 +-						sleepy +AD0 true+ADs
+AD4 +-					+AH0 else if (recently+AF8-sleepy()) +AHs
+AD4 +-						sleepy +AD0 true+ADs
+AD4 +-					+AH0
+AD4 +-				+AH0
+AD4 +-				if (pv+AF8-sleepy+AF8-lock+AF8-sticky +ACYAJg seen+AF8-preempted +ACYAJg
+AD4 +-						+ACE(val +ACY +AF8-Q+AF8-SLEEPY+AF8-VAL)) +AHs
+AD4 +-					if (lock+AF8-try+AF8-set+AF8-sleepy(lock, val))
+AD4 +-						val +AHwAPQ +AF8-Q+AF8-SLEEPY+AF8-VAL+ADs
+AD4 +-				+AH0
+AD4 +-			+AH0
+AD4  
+AD4  			propagate+AF8-yield+AF8-cpu(node, val, +ACY-set+AF8-yield+AF8-cpu, paravirt)+ADs
+AD4  			yield+AF8-head+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt,
+AD4  					pv+AF8-yield+AF8-allow+AF8-steal +ACYAJg set+AF8-mustq,
+AD4  					+ACY-preempted)+ADs
+AD4 +-			if (preempted)
+AD4 +-				seen+AF8-preempted +AD0 true+ADs
+AD4  
+AD4  			if (paravirt +ACYAJg preempted) +AHs
+AD4 +-				sleepy +AD0 true+ADs
+AD4 +-
+AD4  				if (+ACE-pv+AF8-spin+AF8-on+AF8-preempted+AF8-owner)
+AD4  					iters+-+-+ADs
+AD4  			+AH0 else +AHs
+AD4  				iters+-+-+ADs
+AD4  			+AH0
+AD4  
+AD4 -			if (+ACE-set+AF8-mustq +ACYAJg iters +AD4APQ get+AF8-head+AF8-spins(paravirt)) +AHs
+AD4 +-			if (+ACE-set+AF8-mustq +ACYAJg iters +AD4APQ get+AF8-head+AF8-spins(paravirt, sleepy)) +AHs
+AD4  				set+AF8-mustq +AD0 true+ADs
+AD4  				lock+AF8-set+AF8-mustq(lock)+ADs
+AD4  				val +AHwAPQ +AF8-Q+AF8-MUST+AF8-Q+AF8-VAL+ADs
+AD4 +AEAAQA -729,6 +-873,70 +AEAAQA static int pv+AF8-spin+AF8-on+AF8-preempted+AF8-owner+AF8-get(void +ACo-data, u64 +ACo-val)
+AD4  
+AD4  DEFINE+AF8-SIMPLE+AF8-ATTRIBUTE(fops+AF8-pv+AF8-spin+AF8-on+AF8-preempted+AF8-owner, pv+AF8-spin+AF8-on+AF8-preempted+AF8-owner+AF8-get, pv+AF8-spin+AF8-on+AF8-preempted+AF8-owner+AF8-set, +ACIAJQ-llu+AFw-n+ACI)+ADs
+AD4  
+AD4 +-static int pv+AF8-sleepy+AF8-lock+AF8-set(void +ACo-data, u64 val)
+AD4 +-+AHs
+AD4 +-	pv+AF8-sleepy+AF8-lock +AD0 +ACEAIQ-val+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static int pv+AF8-sleepy+AF8-lock+AF8-get(void +ACo-data, u64 +ACo-val)
+AD4 +-+AHs
+AD4 +-	+ACo-val +AD0 pv+AF8-sleepy+AF8-lock+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-DEFINE+AF8-SIMPLE+AF8-ATTRIBUTE(fops+AF8-pv+AF8-sleepy+AF8-lock, pv+AF8-sleepy+AF8-lock+AF8-get, pv+AF8-sleepy+AF8-lock+AF8-set, +ACIAJQ-llu+AFw-n+ACI)+ADs
+AD4 +-
+AD4 +-static int pv+AF8-sleepy+AF8-lock+AF8-sticky+AF8-set(void +ACo-data, u64 val)
+AD4 +-+AHs
+AD4 +-	pv+AF8-sleepy+AF8-lock+AF8-sticky +AD0 +ACEAIQ-val+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static int pv+AF8-sleepy+AF8-lock+AF8-sticky+AF8-get(void +ACo-data, u64 +ACo-val)
+AD4 +-+AHs
+AD4 +-	+ACo-val +AD0 pv+AF8-sleepy+AF8-lock+AF8-sticky+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-DEFINE+AF8-SIMPLE+AF8-ATTRIBUTE(fops+AF8-pv+AF8-sleepy+AF8-lock+AF8-sticky, pv+AF8-sleepy+AF8-lock+AF8-sticky+AF8-get, pv+AF8-sleepy+AF8-lock+AF8-sticky+AF8-set, +ACIAJQ-llu+AFw-n+ACI)+ADs
+AD4 +-
+AD4 +-static int pv+AF8-sleepy+AF8-lock+AF8-interval+AF8-ns+AF8-set(void +ACo-data, u64 val)
+AD4 +-+AHs
+AD4 +-	pv+AF8-sleepy+AF8-lock+AF8-interval+AF8-ns +AD0 val+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static int pv+AF8-sleepy+AF8-lock+AF8-interval+AF8-ns+AF8-get(void +ACo-data, u64 +ACo-val)
+AD4 +-+AHs
+AD4 +-	+ACo-val +AD0 pv+AF8-sleepy+AF8-lock+AF8-interval+AF8-ns+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-DEFINE+AF8-SIMPLE+AF8-ATTRIBUTE(fops+AF8-pv+AF8-sleepy+AF8-lock+AF8-interval+AF8-ns, pv+AF8-sleepy+AF8-lock+AF8-interval+AF8-ns+AF8-get, pv+AF8-sleepy+AF8-lock+AF8-interval+AF8-ns+AF8-set, +ACIAJQ-llu+AFw-n+ACI)+ADs
+AD4 +-
+AD4 +-static int pv+AF8-sleepy+AF8-lock+AF8-factor+AF8-set(void +ACo-data, u64 val)
+AD4 +-+AHs
+AD4 +-	pv+AF8-sleepy+AF8-lock+AF8-factor +AD0 val+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static int pv+AF8-sleepy+AF8-lock+AF8-factor+AF8-get(void +ACo-data, u64 +ACo-val)
+AD4 +-+AHs
+AD4 +-	+ACo-val +AD0 pv+AF8-sleepy+AF8-lock+AF8-factor+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-DEFINE+AF8-SIMPLE+AF8-ATTRIBUTE(fops+AF8-pv+AF8-sleepy+AF8-lock+AF8-factor, pv+AF8-sleepy+AF8-lock+AF8-factor+AF8-get, pv+AF8-sleepy+AF8-lock+AF8-factor+AF8-set, +ACIAJQ-llu+AFw-n+ACI)+ADs
+AD4 +-
+AD4  static int pv+AF8-yield+AF8-prev+AF8-set(void +ACo-data, u64 val)
+AD4  +AHs
+AD4  	pv+AF8-yield+AF8-prev +AD0 +ACEAIQ-val+ADs
+AD4 +AEAAQA -786,6 +-994,10 +AEAAQA static +AF8AXw-init int spinlock+AF8-debugfs+AF8-init(void)
+AD4  		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-yield+AF8-owner+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-yield+AF8-owner)+ADs
+AD4  		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-yield+AF8-allow+AF8-steal+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-yield+AF8-allow+AF8-steal)+ADs
+AD4  		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-spin+AF8-on+AF8-preempted+AF8-owner+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-spin+AF8-on+AF8-preempted+AF8-owner)+ADs
+AD4 +-		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-sleepy+AF8-lock+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-sleepy+AF8-lock)+ADs
+AD4 +-		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-sleepy+AF8-lock+AF8-sticky+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-sleepy+AF8-lock+AF8-sticky)+ADs
+AD4 +-		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-sleepy+AF8-lock+AF8-interval+AF8-ns+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-sleepy+AF8-lock+AF8-interval+AF8-ns)+ADs
+AD4 +-		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-sleepy+AF8-lock+AF8-factor+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-sleepy+AF8-lock+AF8-factor)+ADs
+AD4  		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-yield+AF8-prev+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-yield+AF8-prev)+ADs
+AD4  		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-yield+AF8-propagate+AF8-owner+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-yield+AF8-propagate+AF8-owner)+ADs
+AD4  		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-prod+AF8-head+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-prod+AF8-head)+ADs

