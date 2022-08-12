Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D868590AF7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 06:18:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3r4k1rtfz3bmG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 14:17:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PE3WSwxd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PE3WSwxd;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3r453v4Wz2xGy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 14:17:24 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id y1so13030377plb.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 21:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=4eU0QCjb6jf1xZquWBpMszq35Z+e53TkwVrKKtPOO9g=;
        b=PE3WSwxdpXIauoA+5qTeQfC27GwX9ip9WPb8hyH4+JJwp38p3XsAab4HBaSCCgS3A0
         QUM9auB6UDt+FoN3ZJo673rrLOuCuyxUYA1yXK6/x5A/YVWTcisxRJpqbWQhAdM0NCIr
         /T7KlIGJmu7oju+YXBAX4iHVcNESZqFGIKAemcZiSuqvq9Dqff8KlbZUbCSkRny32+bT
         eTnwqmGN13FDAJ/l7k0BOQJ6IHWJKSrKk9jUQvJMpPJFPR9wm1ElhGAe1m1piu3iiE3G
         udlycYWJRUlz1bdEL6iWC6vaTV6acPUfxkU8BTH60Ta6YlzNyCLVFzLtC0ZmzdMnLaYi
         YbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=4eU0QCjb6jf1xZquWBpMszq35Z+e53TkwVrKKtPOO9g=;
        b=sXV7IPJjiT9AX/Ff9hUBHWx0blnhh3Y+bweF5KKnAVv5t3jt9/FgCjgJbXXSUUW3xg
         PEkmR/lQgzMxbI2ovnyID4Au4811XbKckUSrtOvLQvEyl4aSc3Rs9esI5fvl1xgfsDMk
         EkiFCyrG8MpQt5fKW++ajutJ1NZnjWwh2ElqSBUp/T3zINex6YrZEF4GhjVKtYMDi9eX
         c+hxGDOcRT7XZqHlCbHTE+R5GjVwcu7VeiaknB0/kjIkdNaQxmRQJY5+KAWzfBoq9Rl2
         jwS5F/gAW6cZKtqu4TunGMvI9RtHGdGTvpyrsrgtv1dHh/66KKsradcF7Scznre7uoZD
         70Vw==
X-Gm-Message-State: ACgBeo2M5H50LrXOlifNdRb85eEm0L1iQCu5m1rY9bwWYy2lfBFnJicj
	RO9JLMMuzUVeBU3TGIJAHc0ctRODdaQ=
X-Google-Smtp-Source: AA6agR5Ax31UYF16ktEWo/lNhjHUeKqovKiEy/+V1/SCNqjeNMV7ByFJjE8veHTIasn74eZrmTu0Vg==
X-Received: by 2002:a17:902:8302:b0:16d:bf03:847c with SMTP id bd2-20020a170902830200b0016dbf03847cmr2205291plb.125.1660277841679;
        Thu, 11 Aug 2022 21:17:21 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id u16-20020a170902e5d000b0016ec8286733sm506121plf.243.2022.08.11.21.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 21:17:21 -0700 (PDT)
Message-ID: <574e2fbb8fdb0d69c6e1cdadae85f07f89ea694d.camel@gmail.com>
Subject: Re: [PATCH 11/17] powerpc/qspinlock: allow propagation of yield CPU
 down the queue
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 12 Aug 2022 14:17:17 +1000
In-Reply-To: <20220728063120.2867508-13-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-13-npiggin@gmail.com>
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
+AD4 Having all CPUs poll the lock word for the owner CPU that should be
+AD4 yielded to defeats most of the purpose of using MCS queueing for
+AD4 scalability. Yet it may be desirable for queued waiters to to yield
+AD4 to a preempted owner.
+AD4 
+AD4 s390 addreses this problem by having queued waiters sample the lock
+AD4 word to find the owner much less frequently. In this approach, the
+AD4 waiters never sample it directly, but the queue head propagates the
+AD4 owner CPU back to the next waiter if it ever finds the owner has
+AD4 been preempted. Queued waiters then subsequently propagate the owner
+AD4 CPU back to the next waiter, and so on.
+AD4 
+AD4 Disable this option by default for now, i.e., no logical change.
+AD4 ---
+AD4  arch/powerpc/lib/qspinlock.c +AHw 85 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
+AD4  1 file changed, 84 insertions(+-), 1 deletion(-)
+AD4 
+AD4 diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
+AD4 index 94f007f66942..28c85a2d5635 100644
+AD4 --- a/arch/powerpc/lib/qspinlock.c
+AD4 +-+-+- b/arch/powerpc/lib/qspinlock.c
+AD4 +AEAAQA -12,6 +-12,7 +AEAAQA
+AD4  struct qnode +AHs
+AD4  	struct qnode	+ACo-next+ADs
+AD4  	struct qspinlock +ACo-lock+ADs
+AD4 +-	int		yield+AF8-cpu+ADs
+AD4  	u8		locked+ADs /+ACo 1 if lock acquired +ACo-/
+AD4  +AH0AOw
+AD4  
+AD4 +AEAAQA -28,6 +-29,7 +AEAAQA static int HEAD+AF8-SPINS +AF8AXw-read+AF8-mostly +AD0 (1+ADwAPA-8)+ADs
+AD4  static bool pv+AF8-yield+AF8-owner +AF8AXw-read+AF8-mostly +AD0 true+ADs
+AD4  static bool pv+AF8-yield+AF8-allow+AF8-steal +AF8AXw-read+AF8-mostly +AD0 false+ADs
+AD4  static bool pv+AF8-yield+AF8-prev +AF8AXw-read+AF8-mostly +AD0 true+ADs
+AD4 +-static bool pv+AF8-yield+AF8-propagate+AF8-owner +AF8AXw-read+AF8-mostly +AD0 true+ADs

This also seems to be enabled by default.

+AD4  
+AD4  static DEFINE+AF8-PER+AF8-CPU+AF8-ALIGNED(struct qnodes, qnodes)+ADs
+AD4  
+AD4 +AEAAQA -257,13 +-259,66 +AEAAQA static +AF8AXw-always+AF8-inline void yield+AF8-head+AF8-to+AF8-locked+AF8-owner(struct qspinlock +ACo-lock, u
+AD4  	+AF8AXw-yield+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt, clear+AF8-mustq)+ADs
+AD4  +AH0
+AD4  
+AD4 +-static +AF8AXw-always+AF8-inline void propagate+AF8-yield+AF8-cpu(struct qnode +ACo-node, u32 val, int +ACo-set+AF8-yield+AF8-cpu, bool paravirt)
+AD4 +-+AHs
+AD4 +-	struct qnode +ACo-next+ADs
+AD4 +-	int owner+ADs
+AD4 +-
+AD4 +-	if (+ACE-paravirt)
+AD4 +-		return+ADs
+AD4 +-	if (+ACE-pv+AF8-yield+AF8-propagate+AF8-owner)
+AD4 +-		return+ADs
+AD4 +-
+AD4 +-	owner +AD0 get+AF8-owner+AF8-cpu(val)+ADs
+AD4 +-	if (+ACo-set+AF8-yield+AF8-cpu +AD0APQ owner)
+AD4 +-		return+ADs
+AD4 +-
+AD4 +-	next +AD0 READ+AF8-ONCE(node-+AD4-next)+ADs
+AD4 +-	if (+ACE-next)
+AD4 +-		return+ADs
+AD4 +-
+AD4 +-	if (vcpu+AF8-is+AF8-preempted(owner)) +AHs

Is there a difference about using vcpu+AF8-is+AF8-preempted() here
vs checking bit 0 in other places?


+AD4 +-		next-+AD4-yield+AF8-cpu +AD0 owner+ADs
+AD4 +-		+ACo-set+AF8-yield+AF8-cpu +AD0 owner+ADs
+AD4 +-	+AH0 else if (+ACo-set+AF8-yield+AF8-cpu +ACEAPQ -1) +AHs

It might be worth giving the -1 CPU a +ACM-define.

+AD4 +-		next-+AD4-yield+AF8-cpu +AD0 owner+ADs
+AD4 +-		+ACo-set+AF8-yield+AF8-cpu +AD0 owner+ADs
+AD4 +-	+AH0
+AD4 +-+AH0

Does this need to pass set+AF8-yield+AF8-cpu by reference? Couldn't it's new value be
returned? To me it makes it more clear the function is used to change
set+AF8-yield+AF8-cpu. I think this would work:

int set+AF8-yield+AF8-cpu +AD0 -1+ADs

static +AF8AXw-always+AF8-inline int propagate+AF8-yield+AF8-cpu(struct qnode +ACo-node, u32 val, int set+AF8-yield+AF8-cpu, bool paravirt)
+AHs
	struct qnode +ACo-next+ADs
	int owner+ADs

	if (+ACE-paravirt)
		goto out+ADs
	if (+ACE-pv+AF8-yield+AF8-propagate+AF8-owner)
		goto out+ADs

	owner +AD0 get+AF8-owner+AF8-cpu(val)+ADs
	if (set+AF8-yield+AF8-cpu +AD0APQ owner)
		goto out+ADs

	next +AD0 READ+AF8-ONCE(node-+AD4-next)+ADs
	if (+ACE-next)
		goto out+ADs

	if (vcpu+AF8-is+AF8-preempted(owner)) +AHs
		next-+AD4-yield+AF8-cpu +AD0 owner+ADs
		return owner+ADs
	+AH0 else if (set+AF8-yield+AF8-cpu +ACEAPQ -1) +AHs
		next-+AD4-yield+AF8-cpu +AD0 owner+ADs
		return owner+ADs
	+AH0

out:
	return set+AF8-yield+AF8-cpu+ADs
+AH0

set+AF8-yield+AF8-cpu +AD0 propagate+AF8-yield+AF8-cpu(...  set+AF8-yield+AF8-cpu ...)+ADs



+AD4 +-
+AD4  static +AF8AXw-always+AF8-inline void yield+AF8-to+AF8-prev(struct qspinlock +ACo-lock, struct qnode +ACo-node, int prev+AF8-cpu, bool paravirt)
+AD4  +AHs
+AD4  	u32 yield+AF8-count+ADs
+AD4 +-	int yield+AF8-cpu+ADs
+AD4  
+AD4  	if (+ACE-paravirt)
+AD4  		goto relax+ADs
+AD4  
+AD4 +-	if (+ACE-pv+AF8-yield+AF8-propagate+AF8-owner)
+AD4 +-		goto yield+AF8-prev+ADs
+AD4 +-
+AD4 +-	yield+AF8-cpu +AD0 READ+AF8-ONCE(node-+AD4-yield+AF8-cpu)+ADs
+AD4 +-	if (yield+AF8-cpu +AD0APQ -1) +AHs
+AD4 +-		/+ACo Propagate back the -1 CPU +ACo-/
+AD4 +-		if (node-+AD4-next +ACYAJg node-+AD4-next-+AD4-yield+AF8-cpu +ACEAPQ -1)
+AD4 +-			node-+AD4-next-+AD4-yield+AF8-cpu +AD0 yield+AF8-cpu+ADs
+AD4 +-		goto yield+AF8-prev+ADs
+AD4 +-	+AH0
+AD4 +-
+AD4 +-	yield+AF8-count +AD0 yield+AF8-count+AF8-of(yield+AF8-cpu)+ADs
+AD4 +-	if ((yield+AF8-count +ACY 1) +AD0APQ 0)
+AD4 +-		goto yield+AF8-prev+ADs /+ACo owner vcpu is running +ACo-/
+AD4 +-
+AD4 +-	smp+AF8-rmb()+ADs
+AD4 +-
+AD4 +-	if (yield+AF8-cpu +AD0APQ node-+AD4-yield+AF8-cpu) +AHs
+AD4 +-		if (node-+AD4-next +ACYAJg node-+AD4-next-+AD4-yield+AF8-cpu +ACEAPQ yield+AF8-cpu)
+AD4 +-			node-+AD4-next-+AD4-yield+AF8-cpu +AD0 yield+AF8-cpu+ADs
+AD4 +-		yield+AF8-to+AF8-preempted(yield+AF8-cpu, yield+AF8-count)+ADs
+AD4 +-		return+ADs
+AD4 +-	+AH0
+AD4 +-
+AD4 +-yield+AF8-prev:
+AD4  	if (+ACE-pv+AF8-yield+AF8-prev)
+AD4  		goto relax+ADs
+AD4  
+AD4 +AEAAQA -337,6 +-392,7 +AEAAQA static +AF8AXw-always+AF8-inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock, b
+AD4  	node +AD0 +ACY-qnodesp-+AD4-nodes+AFs-idx+AF0AOw
+AD4  	node-+AD4-next +AD0 NULL+ADs
+AD4  	node-+AD4-lock +AD0 lock+ADs
+AD4 +-	node-+AD4-yield+AF8-cpu +AD0 -1+ADs
+AD4  	node-+AD4-locked +AD0 0+ADs
+AD4  
+AD4  	tail +AD0 encode+AF8-tail+AF8-cpu()+ADs
+AD4 +AEAAQA -358,13 +-414,21 +AEAAQA static +AF8AXw-always+AF8-inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock, b
+AD4  		while (+ACE-node-+AD4-locked)
+AD4  			yield+AF8-to+AF8-prev(lock, node, prev+AF8-cpu, paravirt)+ADs
+AD4  
+AD4 +-		/+ACo Clear out stale propagated yield+AF8-cpu +ACo-/
+AD4 +-		if (paravirt +ACYAJg pv+AF8-yield+AF8-propagate+AF8-owner +ACYAJg node-+AD4-yield+AF8-cpu +ACEAPQ -1)
+AD4 +-			node-+AD4-yield+AF8-cpu +AD0 -1+ADs
+AD4 +-
+AD4  		smp+AF8-rmb()+ADs /+ACo acquire barrier for the mcs lock +ACo-/
+AD4  	+AH0
+AD4  
+AD4  	if (+ACE-MAYBE+AF8-STEALERS) +AHs
+AD4 +-		int set+AF8-yield+AF8-cpu +AD0 -1+ADs
+AD4 +-
+AD4  		/+ACo We're at the head of the waitqueue, wait for the lock. +ACo-/
+AD4 -		while ((val +AD0 READ+AF8-ONCE(lock-+AD4-val)) +ACY +AF8-Q+AF8-LOCKED+AF8-VAL)
+AD4 +-		while ((val +AD0 READ+AF8-ONCE(lock-+AD4-val)) +ACY +AF8-Q+AF8-LOCKED+AF8-VAL) +AHs
+AD4 +-			propagate+AF8-yield+AF8-cpu(node, val, +ACY-set+AF8-yield+AF8-cpu, paravirt)+ADs
+AD4  			yield+AF8-head+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt, false)+ADs
+AD4 +-		+AH0
+AD4  
+AD4  		/+ACo If we're the last queued, must clean up the tail. +ACo-/
+AD4  		if ((val +ACY +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK) +AD0APQ tail) +AHs
+AD4 +AEAAQA -376,12 +-440,14 +AEAAQA static +AF8AXw-always+AF8-inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock, b
+AD4  		/+ACo We must be the owner, just set the lock bit and acquire +ACo-/
+AD4  		lock+AF8-set+AF8-locked(lock)+ADs
+AD4  	+AH0 else +AHs
+AD4 +-		int set+AF8-yield+AF8-cpu +AD0 -1+ADs
+AD4  		int iters +AD0 0+ADs
+AD4  		bool set+AF8-mustq +AD0 false+ADs
+AD4  
+AD4  again:
+AD4  		/+ACo We're at the head of the waitqueue, wait for the lock. +ACo-/
+AD4  		while ((val +AD0 READ+AF8-ONCE(lock-+AD4-val)) +ACY +AF8-Q+AF8-LOCKED+AF8-VAL) +AHs
+AD4 +-			propagate+AF8-yield+AF8-cpu(node, val, +ACY-set+AF8-yield+AF8-cpu, paravirt)+ADs
+AD4  			yield+AF8-head+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt,
+AD4  					pv+AF8-yield+AF8-allow+AF8-steal +ACYAJg set+AF8-mustq)+ADs
+AD4  
+AD4 +AEAAQA -540,6 +-606,22 +AEAAQA static int pv+AF8-yield+AF8-prev+AF8-get(void +ACo-data, u64 +ACo-val)
+AD4  
+AD4  DEFINE+AF8-SIMPLE+AF8-ATTRIBUTE(fops+AF8-pv+AF8-yield+AF8-prev, pv+AF8-yield+AF8-prev+AF8-get, pv+AF8-yield+AF8-prev+AF8-set, +ACIAJQ-llu+AFw-n+ACI)+ADs
+AD4  
+AD4 +-static int pv+AF8-yield+AF8-propagate+AF8-owner+AF8-set(void +ACo-data, u64 val)
+AD4 +-+AHs
+AD4 +-	pv+AF8-yield+AF8-propagate+AF8-owner +AD0 +ACEAIQ-val+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static int pv+AF8-yield+AF8-propagate+AF8-owner+AF8-get(void +ACo-data, u64 +ACo-val)
+AD4 +-+AHs
+AD4 +-	+ACo-val +AD0 pv+AF8-yield+AF8-propagate+AF8-owner+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-DEFINE+AF8-SIMPLE+AF8-ATTRIBUTE(fops+AF8-pv+AF8-yield+AF8-propagate+AF8-owner, pv+AF8-yield+AF8-propagate+AF8-owner+AF8-get, pv+AF8-yield+AF8-propagate+AF8-owner+AF8-set, +ACIAJQ-llu+AFw-n+ACI)+ADs
+AD4 +-
+AD4  static +AF8AXw-init int spinlock+AF8-debugfs+AF8-init(void)
+AD4  +AHs
+AD4  	debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-steal+AF8-spins+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-steal+AF8-spins)+ADs
+AD4 +AEAAQA -548,6 +-630,7 +AEAAQA static +AF8AXw-init int spinlock+AF8-debugfs+AF8-init(void)
+AD4  		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-yield+AF8-owner+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-yield+AF8-owner)+ADs
+AD4  		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-yield+AF8-allow+AF8-steal+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-yield+AF8-allow+AF8-steal)+ADs
+AD4  		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-yield+AF8-prev+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-yield+AF8-prev)+ADs
+AD4 +-		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-yield+AF8-propagate+AF8-owner+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-yield+AF8-propagate+AF8-owner)+ADs
+AD4  	+AH0
+AD4  
+AD4  	return 0+ADs

