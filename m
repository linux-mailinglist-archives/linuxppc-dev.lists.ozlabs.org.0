Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78755590B49
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 06:36:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3rVW3f5Tz3bnM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 14:36:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=f2l97mfk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=f2l97mfk;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3rTt61kgz2xGy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 14:36:17 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id x23so18673976pll.7
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 21:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=KyBMuSKnYTOwh0uy6R/bjduE9uvERl3FUOOm9edds7g=;
        b=f2l97mfkSiczXGfWYo/VKALeDrNZ9QMHvpwRzKrrShvw7G7c2De5u4CZp3wFR3NRXm
         iUqHDXLggCTdNKMfOHklTJauevQf/dvrvXXZy8TiiEdwLKvChRu/CYFbdhezzfIZojRz
         BzfZvzgadKUUavgjaSBkQVEpllAEwq5JEps1vW2BUvUjHU4XRadepv1x91CoAOqY+Sb9
         Jvl3vV16WPbFQ/hxG5xREe97s7isw6wP3SCfDrK4vGSNNiFlnXOeQaPAg8SpD0KUE7FX
         44Zizr8pVM9tsXp735Cm6syQHtUPaOPO4h6KpZXgfLRvFb5l6PPTWFkzGE73vlnCfc/S
         L66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=KyBMuSKnYTOwh0uy6R/bjduE9uvERl3FUOOm9edds7g=;
        b=Wyueo81jkCco0LXwkbzs2dx8MCrUrzI2LB2D8yiayGx1GazRPMZQBO3mfZylxcohRg
         fjrX9VWcucgUlkcBKJbEgyUfhp/I+8BlIvOkBc2JEDYL6NP5eKnsn4E9eh3U8lBlEq1Z
         1HQ0OAVkTR5PoYQ5S9mp7nIvM5nYH32wvIC5+KkVUGpuv9mYT+4zX9UT9O0rogHQt5n9
         JyNSCxeg0n376Ga8PM6wyCDRlat4Q5tydDUUrcCWup6m63ccdqTZ3ZuIeXEc5Fu1NlgD
         TAMAkgjQMS0AxeWqGeXgPAOBso/6b2JzoawlvySR56AvgbwAEC9QRnIB3RrQA5ZHZ9U6
         PeoA==
X-Gm-Message-State: ACgBeo2lFxGObmF1uyOg6cdilLiJO+qbV0OezPHzTEf3wHkrP6tPkMOu
	hLDeymP1wT4zbhmNER542Ig=
X-Google-Smtp-Source: AA6agR4j2CDUkL5y7Us5UblA6nBo0AqQ8k9R435oPr4GVdfeOi3HszbQh6cRMU3K62Y81k+hUFkEoA==
X-Received: by 2002:a17:902:e84d:b0:16d:c9a0:e502 with SMTP id t13-20020a170902e84d00b0016dc9a0e502mr2344859plg.125.1660278975398;
        Thu, 11 Aug 2022 21:36:15 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id p18-20020a170902e75200b0016f1319d2a7sm535910plf.297.2022.08.11.21.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 21:36:14 -0700 (PDT)
Message-ID: <88b57760685640cdcd1d79d45bd3846fdcfeeffe.camel@gmail.com>
Subject: Re: [PATCH 14/17] powerpc/qspinlock: use spin_begin/end API
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 12 Aug 2022 14:36:11 +1000
In-Reply-To: <20220728063120.2867508-16-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-16-npiggin@gmail.com>
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
+AD4 Use the spin+AF8-begin/spin+AF8-cpu+AF8-relax/spin+AF8-end APIs in qspinlock, which helps
+AD4 to prevent threads issuing a lot of expensive priority nops which may not
+AD4 have much effect due to immediately executing low then medium priority.

Just a general comment regarding the spin+AF8Aew-begin,end+AH0 API, more complicated
than something like

	spin+AF8-begin()
	for(+ADsAOw)
		spin+AF8-cpu+AF8-relax()
	spin+AF8-end()

it becomes difficult to keep track of. Unfortunately, I don't have any good
suggestions how to improve it. Hopefully with P10s wait instruction we can
maybe try and move away from this.

It might be useful to comment the functions pre and post conditions regarding
expectations about spin+AF8-begin() and spin+AF8-end().

+AD4 ---
+AD4  arch/powerpc/lib/qspinlock.c +AHw 35 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-----
+AD4  1 file changed, 31 insertions(+-), 4 deletions(-)
+AD4 
+AD4 diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
+AD4 index 277aef1fab0a..d4594c701f7d 100644
+AD4 --- a/arch/powerpc/lib/qspinlock.c
+AD4 +-+-+- b/arch/powerpc/lib/qspinlock.c
+AD4 +AEAAQA -233,6 +-233,8 +AEAAQA static +AF8AXw-always+AF8-inline void +AF8AXw-yield+AF8-to+AF8-locked+AF8-owner(struct qspinlock +ACo-lock, u32
+AD4  	if ((yield+AF8-count +ACY 1) +AD0APQ 0)
+AD4  		goto relax+ADs /+ACo owner vcpu is running +ACo-/
+AD4  
+AD4 +-	spin+AF8-end()+ADs
+AD4 +-
+AD4  	/+ACo
+AD4  	 +ACo Read the lock word after sampling the yield count. On the other side
+AD4  	 +ACo there may a wmb because the yield count update is done by the
+AD4 +AEAAQA -248,11 +-250,13 +AEAAQA static +AF8AXw-always+AF8-inline void +AF8AXw-yield+AF8-to+AF8-locked+AF8-owner(struct qspinlock +ACo-lock, u32
+AD4  		yield+AF8-to+AF8-preempted(owner, yield+AF8-count)+ADs
+AD4  		if (clear+AF8-mustq)
+AD4  			lock+AF8-set+AF8-mustq(lock)+ADs
+AD4 +-		spin+AF8-begin()+ADs
+AD4  		/+ACo Don't relax if we yielded. Maybe we should? +ACo-/
+AD4  		return+ADs
+AD4  	+AH0
+AD4 +-	spin+AF8-begin()+ADs
+AD4  relax:
+AD4 -	cpu+AF8-relax()+ADs
+AD4 +-	spin+AF8-cpu+AF8-relax()+ADs
+AD4  +AH0
+AD4  
+AD4  static +AF8AXw-always+AF8-inline void yield+AF8-to+AF8-locked+AF8-owner(struct qspinlock +ACo-lock, u32 val, bool paravirt)
+AD4 +AEAAQA -315,14 +-319,18 +AEAAQA static +AF8AXw-always+AF8-inline void yield+AF8-to+AF8-prev(struct qspinlock +ACo-lock, struct qnode +ACo
+AD4  	if ((yield+AF8-count +ACY 1) +AD0APQ 0)
+AD4  		goto yield+AF8-prev+ADs /+ACo owner vcpu is running +ACo-/
+AD4  
+AD4 +-	spin+AF8-end()+ADs
+AD4 +-
+AD4  	smp+AF8-rmb()+ADs
+AD4  
+AD4  	if (yield+AF8-cpu +AD0APQ node-+AD4-yield+AF8-cpu) +AHs
+AD4  		if (node-+AD4-next +ACYAJg node-+AD4-next-+AD4-yield+AF8-cpu +ACEAPQ yield+AF8-cpu)
+AD4  			node-+AD4-next-+AD4-yield+AF8-cpu +AD0 yield+AF8-cpu+ADs
+AD4  		yield+AF8-to+AF8-preempted(yield+AF8-cpu, yield+AF8-count)+ADs
+AD4 +-		spin+AF8-begin()+ADs
+AD4  		return+ADs
+AD4  	+AH0
+AD4 +-	spin+AF8-begin()+ADs
+AD4  
+AD4  yield+AF8-prev:
+AD4  	if (+ACE-pv+AF8-yield+AF8-prev)
+AD4 +AEAAQA -332,15 +-340,19 +AEAAQA static +AF8AXw-always+AF8-inline void yield+AF8-to+AF8-prev(struct qspinlock +ACo-lock, struct qnode +ACo
+AD4  	if ((yield+AF8-count +ACY 1) +AD0APQ 0)
+AD4  		goto relax+ADs /+ACo owner vcpu is running +ACo-/
+AD4  
+AD4 +-	spin+AF8-end()+ADs
+AD4 +-
+AD4  	smp+AF8-rmb()+ADs /+ACo See yield+AF8-to+AF8-locked+AF8-owner comment +ACo-/
+AD4  
+AD4  	if (+ACE-node-+AD4-locked) +AHs
+AD4  		yield+AF8-to+AF8-preempted(prev+AF8-cpu, yield+AF8-count)+ADs
+AD4 +-		spin+AF8-begin()+ADs
+AD4  		return+ADs
+AD4  	+AH0
+AD4 +-	spin+AF8-begin()+ADs
+AD4  
+AD4  relax:
+AD4 -	cpu+AF8-relax()+ADs
+AD4 +-	spin+AF8-cpu+AF8-relax()+ADs
+AD4  +AH0
+AD4  
+AD4  
+AD4 +AEAAQA -349,6 +-361,7 +AEAAQA static +AF8AXw-always+AF8-inline bool try+AF8-to+AF8-steal+AF8-lock(struct qspinlock +ACo-lock, bool parav
+AD4  	int iters+ADs
+AD4  
+AD4  	/+ACo Attempt to steal the lock +ACo-/
+AD4 +-	spin+AF8-begin()+ADs
+AD4  	for (+ADsAOw) +AHs
+AD4  		u32 val +AD0 READ+AF8-ONCE(lock-+AD4-val)+ADs
+AD4  
+AD4 +AEAAQA -356,8 +-369,10 +AEAAQA static +AF8AXw-always+AF8-inline bool try+AF8-to+AF8-steal+AF8-lock(struct qspinlock +ACo-lock, bool parav
+AD4  			break+ADs
+AD4  
+AD4  		if (unlikely(+ACE(val +ACY +AF8-Q+AF8-LOCKED+AF8-VAL))) +AHs
+AD4 +-			spin+AF8-end()+ADs
+AD4  			if (trylock+AF8-with+AF8-tail+AF8-cpu(lock, val))
+AD4  				return true+ADs
+AD4 +-			spin+AF8-begin()+ADs
+AD4  			continue+ADs
+AD4  		+AH0
+AD4  
+AD4 +AEAAQA -368,6 +-383,7 +AEAAQA static +AF8AXw-always+AF8-inline bool try+AF8-to+AF8-steal+AF8-lock(struct qspinlock +ACo-lock, bool parav
+AD4  		if (iters +AD4APQ get+AF8-steal+AF8-spins(paravirt))
+AD4  			break+ADs
+AD4  	+AH0
+AD4 +-	spin+AF8-end()+ADs
+AD4  
+AD4  	return false+ADs
+AD4  +AH0
+AD4 +AEAAQA -418,8 +-434,10 +AEAAQA static +AF8AXw-always+AF8-inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock, b
+AD4  		WRITE+AF8-ONCE(prev-+AD4-next, node)+ADs
+AD4  
+AD4  		/+ACo Wait for mcs node lock to be released +ACo-/
+AD4 +-		spin+AF8-begin()+ADs
+AD4  		while (+ACE-node-+AD4-locked)
+AD4  			yield+AF8-to+AF8-prev(lock, node, prev+AF8-cpu, paravirt)+ADs
+AD4 +-		spin+AF8-end()+ADs
+AD4  
+AD4  		/+ACo Clear out stale propagated yield+AF8-cpu +ACo-/
+AD4  		if (paravirt +ACYAJg pv+AF8-yield+AF8-propagate+AF8-owner +ACYAJg node-+AD4-yield+AF8-cpu +ACEAPQ -1)
+AD4 +AEAAQA -432,10 +-450,12 +AEAAQA static +AF8AXw-always+AF8-inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock, b
+AD4  		int set+AF8-yield+AF8-cpu +AD0 -1+ADs
+AD4  
+AD4  		/+ACo We're at the head of the waitqueue, wait for the lock. +ACo-/
+AD4 +-		spin+AF8-begin()+ADs
+AD4  		while ((val +AD0 READ+AF8-ONCE(lock-+AD4-val)) +ACY +AF8-Q+AF8-LOCKED+AF8-VAL) +AHs
+AD4  			propagate+AF8-yield+AF8-cpu(node, val, +ACY-set+AF8-yield+AF8-cpu, paravirt)+ADs
+AD4  			yield+AF8-head+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt, false)+ADs
+AD4  		+AH0
+AD4 +-		spin+AF8-end()+ADs
+AD4  
+AD4  		/+ACo If we're the last queued, must clean up the tail. +ACo-/
+AD4  		if ((val +ACY +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK) +AD0APQ tail) +AHs
+AD4 +AEAAQA -453,6 +-473,7 +AEAAQA static +AF8AXw-always+AF8-inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock, b
+AD4  
+AD4  again:
+AD4  		/+ACo We're at the head of the waitqueue, wait for the lock. +ACo-/
+AD4 +-		spin+AF8-begin()+ADs
+AD4  		while ((val +AD0 READ+AF8-ONCE(lock-+AD4-val)) +ACY +AF8-Q+AF8-LOCKED+AF8-VAL) +AHs
+AD4  			propagate+AF8-yield+AF8-cpu(node, val, +ACY-set+AF8-yield+AF8-cpu, paravirt)+ADs
+AD4  			yield+AF8-head+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt,
+AD4 +AEAAQA -465,6 +-486,7 +AEAAQA static +AF8AXw-always+AF8-inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock, b
+AD4  				val +AHwAPQ +AF8-Q+AF8-MUST+AF8-Q+AF8-VAL+ADs
+AD4  			+AH0
+AD4  		+AH0
+AD4 +-		spin+AF8-end()+ADs
+AD4  
+AD4  		/+ACo If we're the last queued, must clean up the tail. +ACo-/
+AD4  		if ((val +ACY +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK) +AD0APQ tail) +AHs
+AD4 +AEAAQA -480,8 +-502,13 +AEAAQA static +AF8AXw-always+AF8-inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock, b
+AD4  
+AD4  unlock+AF8-next:
+AD4  	/+ACo contended path+ADs must wait for next +ACEAPQ NULL (MCS protocol) +ACo-/
+AD4 -	while (+ACE(next +AD0 READ+AF8-ONCE(node-+AD4-next)))
+AD4 -		cpu+AF8-relax()+ADs
+AD4 +-	next +AD0 READ+AF8-ONCE(node-+AD4-next)+ADs
+AD4 +-	if (+ACE-next) +AHs
+AD4 +-		spin+AF8-begin()+ADs
+AD4 +-		while (+ACE(next +AD0 READ+AF8-ONCE(node-+AD4-next)))
+AD4 +-			cpu+AF8-relax()+ADs
+AD4 +-		spin+AF8-end()+ADs
+AD4 +-	+AH0
+AD4  
+AD4  	/+ACo
+AD4  	 +ACo Unlock the next mcs waiter node. Release barrier is not required

