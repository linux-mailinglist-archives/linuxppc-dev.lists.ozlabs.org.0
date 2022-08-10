Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 640E858E4DB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 04:29:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2YmB2Fzjz306m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 12:29:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DLscQOMm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DLscQOMm;
	dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2YlY5K2Pz2xHr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Aug 2022 12:28:39 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id c24so8242525pgg.11
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Aug 2022 19:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=hdHampkBFiHWfti9MTo3JCZaOy4c/2P31XLZas99ygc=;
        b=DLscQOMm0XAc2YErvWgPpsERSWHfY7FxLKVN0j325rhIt46Ar73ITNjZDR3Gud/LCP
         ZtSbueLs0qynMlj6LkNtik/fcn3UqxzeHoHdCowiP+gYY5+e341kmpn9Uw23/lVSff08
         OgOyG0FVEmhazZ30S84zSE6GdIvp0pdktnY26O8ELb+M1He/RqeHQyH1JL9COO9Bhwhy
         ANIPxbaFOJhU1FkNy8Q8L+2UNRM8xBB77tFw2nmLRSX1UCPcQSG7Mfu3CkVbRIIt2FoQ
         P89OEYSsUJxZVgZPff4pfHMHLZMdVUDUhRE2TlWHd7iU8ylCkNo85zj6mf5tYeuGi+ov
         flSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=hdHampkBFiHWfti9MTo3JCZaOy4c/2P31XLZas99ygc=;
        b=B8siKOXhbvtLgMejZBJeicdN6XMAz9wwpf4PBknrNfXjnGSn4C7qL7w2Ha3lUzPOJ6
         PjQNefas8DhD6goi+H7iIdIC1inrht6MoKeznq0fNc8zhTc4FR4MOzcmm+TCqldXwY8f
         OKMZb0/u7wFX4PSScb9ee7yU82fEWyKFYtvkLhQxPIIEzrOWEuBwZAqFv8h+cg+BRcI+
         lB+aIdfe2DXBWO+JElb7SkSr5aP7kvC4I8IbW0jNqxIKTKX9Yznwt831/auTbVnAnZQB
         dIGlKHJLAimS4cPIk4jstq16QggpMrE+J92/oAcyyJq3FDrFFeiDk7kw5FdPJXQGWw24
         UzXA==
X-Gm-Message-State: ACgBeo0CvvNFbQR/0WZKBcmEpmcGep514q8QaWqc2ZuaSPpOK9+vn3E3
	WkNbKUNumlYDIBptt6GA1BwSwi06wGXGUg==
X-Google-Smtp-Source: AA6agR5aLrUnIUvpjv+E5OPpgXB4rKUyDFsfXFAcaUpx1c9lwvex1EDOCvR5eJ0IBJSXwVpIirn6LA==
X-Received: by 2002:a63:c012:0:b0:41c:1148:ec9 with SMTP id h18-20020a63c012000000b0041c11480ec9mr21087624pgg.444.1660098516581;
        Tue, 09 Aug 2022 19:28:36 -0700 (PDT)
Received: from tee480 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
        by smtp.googlemail.com with ESMTPSA id f24-20020a17090a9b1800b001f516895294sm285685pjp.40.2022.08.09.19.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 19:28:35 -0700 (PDT)
Message-ID: <34ba59421eb2fd8696337cac0ce1f19df62cf243.camel@gmail.com>
Subject: Re: [PATCH 02/17] powerpc/qspinlock: add mcs queueing for contended
 waiters
From: Jordan NIethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 10 Aug 2022 12:28:31 +1000
In-Reply-To: <20220728063120.2867508-4-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-4-npiggin@gmail.com>
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
+ADw-snip+AD4

+AD4  
+AD4 +-/+ACo
+AD4 +- +ACo Bitfields in the atomic value:
+AD4 +- +ACo
+AD4 +- +ACo     0: locked bit
+AD4 +- +ACo 16-31: tail cpu (+-1)
+AD4 +- +ACo-/
+AD4 +-+ACM-define	+AF8-Q+AF8-SET+AF8-MASK(type)	(((1U +ADwAPA +AF8-Q+AF8 +ACMAIw type +ACMAIw +AF8-BITS) - 1)+AFw
+AD4 +-				      +ADwAPA +AF8-Q+AF8 +ACMAIw type +ACMAIw +AF8-OFFSET)
+AD4 +-+ACM-define +AF8-Q+AF8-LOCKED+AF8-OFFSET	0
+AD4 +-+ACM-define +AF8-Q+AF8-LOCKED+AF8-BITS		1
+AD4 +-+ACM-define +AF8-Q+AF8-LOCKED+AF8-MASK		+AF8-Q+AF8-SET+AF8-MASK(LOCKED)
+AD4 +-+ACM-define +AF8-Q+AF8-LOCKED+AF8-VAL		(1U +ADwAPA +AF8-Q+AF8-LOCKED+AF8-OFFSET)
+AD4 +-
+AD4 +-+ACM-define +AF8-Q+AF8-TAIL+AF8-CPU+AF8-OFFSET	16
+AD4 +-+ACM-define +AF8-Q+AF8-TAIL+AF8-CPU+AF8-BITS	(32 - +AF8-Q+AF8-TAIL+AF8-CPU+AF8-OFFSET)
+AD4 +-+ACM-define +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK	+AF8-Q+AF8-SET+AF8-MASK(TAIL+AF8-CPU)
+AD4 +-

Just to state the obvious this is:

+ACM-define +AF8-Q+AF8-LOCKED+AF8-OFFSET	0
+ACM-define +AF8-Q+AF8-LOCKED+AF8-BITS		1
+ACM-define +AF8-Q+AF8-LOCKED+AF8-MASK		0x00000001
+ACM-define +AF8-Q+AF8-LOCKED+AF8-VAL		1

+ACM-define +AF8-Q+AF8-TAIL+AF8-CPU+AF8-OFFSET	16
+ACM-define +AF8-Q+AF8-TAIL+AF8-CPU+AF8-BITS	16
+ACM-define +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK	0xffff0000

+AD4 +-+ACM-if CONFIG+AF8-NR+AF8-CPUS +AD4APQ (1U +ADwAPA +AF8-Q+AF8-TAIL+AF8-CPU+AF8-BITS)
+AD4 +-+ACM-error +ACI-qspinlock does not support such large CONFIG+AF8-NR+AF8-CPUS+ACI
+AD4 +-+ACM-endif
+AD4 +-
+AD4  +ACM-endif /+ACo +AF8-ASM+AF8-POWERPC+AF8-QSPINLOCK+AF8-TYPES+AF8-H +ACo-/
+AD4 diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
+AD4 index 8dbce99a373c..5ebb88d95636 100644
+AD4 --- a/arch/powerpc/lib/qspinlock.c
+AD4 +-+-+- b/arch/powerpc/lib/qspinlock.c
+AD4 +AEAAQA -1,12 +-1,172 +AEAAQA
+AD4  // SPDX-License-Identifier: GPL-2.0-or-later
+AD4 +-+ACM-include +ADw-linux/atomic.h+AD4
+AD4 +-+ACM-include +ADw-linux/bug.h+AD4
+AD4 +-+ACM-include +ADw-linux/compiler.h+AD4
+AD4  +ACM-include +ADw-linux/export.h+AD4
+AD4 -+ACM-include +ADw-linux/processor.h+AD4
+AD4 +-+ACM-include +ADw-linux/percpu.h+AD4
+AD4 +-+ACM-include +ADw-linux/smp.h+AD4
+AD4  +ACM-include +ADw-asm/qspinlock.h+AD4
+AD4  
+AD4 -void queued+AF8-spin+AF8-lock+AF8-slowpath(struct qspinlock +ACo-lock)
+AD4 +-+ACM-define MAX+AF8-NODES	4
+AD4 +-
+AD4 +-struct qnode +AHs
+AD4 +-	struct qnode	+ACo-next+ADs
+AD4 +-	struct qspinlock +ACo-lock+ADs
+AD4 +-	u8		locked+ADs /+ACo 1 if lock acquired +ACo-/
+AD4 +-+AH0AOw
+AD4 +-
+AD4 +-struct qnodes +AHs
+AD4 +-	int		count+ADs
+AD4 +-	struct qnode nodes+AFs-MAX+AF8-NODES+AF0AOw
+AD4 +-+AH0AOw

I think it could be worth commenting why qnodes::count instead +AF8-Q+AF8-TAIL+AF8-IDX+AF8-OFFSET.

+AD4 +-
+AD4 +-static DEFINE+AF8-PER+AF8-CPU+AF8-ALIGNED(struct qnodes, qnodes)+ADs
+AD4 +-
+AD4 +-static inline int encode+AF8-tail+AF8-cpu(void)

I think the generic version that takes smp+AF8-processor+AF8-id() as a parameter is clearer - at least with this function name.

+AD4 +-+AHs
+AD4 +-	return (smp+AF8-processor+AF8-id() +- 1) +ADwAPA +AF8-Q+AF8-TAIL+AF8-CPU+AF8-OFFSET+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static inline int get+AF8-tail+AF8-cpu(int val)

It seems like there should be a +ACI-decode+ACI function to pair up with the +ACI-encode+ACI function.

+AD4 +-+AHs
+AD4 +-	return (val +AD4APg +AF8-Q+AF8-TAIL+AF8-CPU+AF8-OFFSET) - 1+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-/+ACo Take the lock by setting the bit, no other CPUs may concurrently lock it. +ACo-/

Does that comment mean it is not necessary to use an atomic+AF8-or here?

+AD4 +-static +AF8AXw-always+AF8-inline void lock+AF8-set+AF8-locked(struct qspinlock +ACo-lock)

nit: could just be called set+AF8-locked()

+AD4 +-+AHs
+AD4 +-	atomic+AF8-or(+AF8-Q+AF8-LOCKED+AF8-VAL, +ACY-lock-+AD4-val)+ADs
+AD4 +-	+AF8AXw-atomic+AF8-acquire+AF8-fence()+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-/+ACo Take lock, clearing tail, cmpxchg with val (which must not be locked) +ACo-/
+AD4 +-static +AF8AXw-always+AF8-inline int trylock+AF8-clear+AF8-tail+AF8-cpu(struct qspinlock +ACo-lock, int val)
+AD4 +-+AHs
+AD4 +-	int newval +AD0 +AF8-Q+AF8-LOCKED+AF8-VAL+ADs
+AD4 +-
+AD4 +-	if (atomic+AF8-cmpxchg+AF8-acquire(+ACY-lock-+AD4-val, val, newval) +AD0APQ val)
+AD4 +-		return 1+ADs
+AD4 +-	else
+AD4 +-		return 0+ADs

same optional style nit: return (atomic+AF8-cmpxchg+AF8-acquire(+ACY-lock-+AD4-val, val, newval) +AD0APQ val)+ADs

+AD4 +-+AH0
+AD4 +-
+AD4 +-/+ACo
+AD4 +- +ACo Publish our tail, replacing previous tail. Return previous value.
+AD4 +- +ACo
+AD4 +- +ACo This provides a release barrier for publishing node, and an acquire barrier
+AD4 +- +ACo for getting the old node.
+AD4 +- +ACo-/
+AD4 +-static +AF8AXw-always+AF8-inline int publish+AF8-tail+AF8-cpu(struct qspinlock +ACo-lock, int tail)

Did you change from the xchg+AF8-tail() name in the generic version because of the release and acquire barriers this provides?
Does +ACI-publish+ACI generally imply the old value will be returned?

+AD4  +AHs
+AD4 -	while (+ACE-queued+AF8-spin+AF8-trylock(lock))
+AD4 +-	for (+ADsAOw) +AHs
+AD4 +-		int val +AD0 atomic+AF8-read(+ACY-lock-+AD4-val)+ADs
+AD4 +-		int newval +AD0 (val +ACY +AH4AXw-Q+AF8-TAIL+AF8-CPU+AF8-MASK) +AHw tail+ADs
+AD4 +-		int old+ADs
+AD4 +-
+AD4 +-		old +AD0 atomic+AF8-cmpxchg(+ACY-lock-+AD4-val, val, newval)+ADs
+AD4 +-		if (old +AD0APQ val)
+AD4 +-			return old+ADs
+AD4 +-	+AH0
+AD4 +-+AH0
+AD4 +-
+AD4 +-static struct qnode +ACo-get+AF8-tail+AF8-qnode(struct qspinlock +ACo-lock, int val)
+AD4 +-+AHs
+AD4 +-	int cpu +AD0 get+AF8-tail+AF8-cpu(val)+ADs
+AD4 +-	struct qnodes +ACo-qnodesp +AD0 per+AF8-cpu+AF8-ptr(+ACY-qnodes, cpu)+ADs
+AD4 +-	int idx+ADs
+AD4 +-
+AD4 +-	for (idx +AD0 0+ADs idx +ADw MAX+AF8-NODES+ADs idx+-+-) +AHs
+AD4 +-		struct qnode +ACo-qnode +AD0 +ACY-qnodesp-+AD4-nodes+AFs-idx+AF0AOw
+AD4 +-		if (qnode-+AD4-lock +AD0APQ lock)
+AD4 +-			return qnode+ADs
+AD4 +-	+AH0

In case anyone else is confused by this, Nick explained each cpu can only queue on a unique spinlock once regardless of +ACI-idx+ACI level.

+AD4 +-
+AD4 +-	BUG()+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock)
+AD4 +-+AHs
+AD4 +-	struct qnodes +ACo-qnodesp+ADs
+AD4 +-	struct qnode +ACo-next, +ACo-node+ADs
+AD4 +-	int val, old, tail+ADs
+AD4 +-	int idx+ADs
+AD4 +-
+AD4 +-	BUILD+AF8-BUG+AF8-ON(CONFIG+AF8-NR+AF8-CPUS +AD4APQ (1U +ADwAPA +AF8-Q+AF8-TAIL+AF8-CPU+AF8-BITS))+ADs
+AD4 +-
+AD4 +-	qnodesp +AD0 this+AF8-cpu+AF8-ptr(+ACY-qnodes)+ADs
+AD4 +-	if (unlikely(qnodesp-+AD4-count +AD0APQ MAX+AF8-NODES)) +AHs

The comparison is +AD4APQ in the generic, I guess we've no nested NMI so this is safe?

+AD4 +-		while (+ACE-queued+AF8-spin+AF8-trylock(lock))
+AD4 +-			cpu+AF8-relax()+ADs
+AD4 +-		return+ADs
+AD4 +-	+AH0
+AD4 +-
+AD4 +-	idx +AD0 qnodesp-+AD4-count+-+-+ADs
+AD4 +-	/+ACo
+AD4 +-	 +ACo Ensure that we increment the head node-+AD4-count before initialising
+AD4 +-	 +ACo the actual node. If the compiler is kind enough to reorder these
+AD4 +-	 +ACo stores, then an IRQ could overwrite our assignments.
+AD4 +-	 +ACo-/
+AD4 +-	barrier()+ADs
+AD4 +-	node +AD0 +ACY-qnodesp-+AD4-nodes+AFs-idx+AF0AOw
+AD4 +-	node-+AD4-next +AD0 NULL+ADs
+AD4 +-	node-+AD4-lock +AD0 lock+ADs
+AD4 +-	node-+AD4-locked +AD0 0+ADs
+AD4 +-
+AD4 +-	tail +AD0 encode+AF8-tail+AF8-cpu()+ADs
+AD4 +-
+AD4 +-	old +AD0 publish+AF8-tail+AF8-cpu(lock, tail)+ADs
+AD4 +-
+AD4 +-	/+ACo
+AD4 +-	 +ACo If there was a previous node+ADs link it and wait until reaching the
+AD4 +-	 +ACo head of the waitqueue.
+AD4 +-	 +ACo-/
+AD4 +-	if (old +ACY +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK) +AHs
+AD4 +-		struct qnode +ACo-prev +AD0 get+AF8-tail+AF8-qnode(lock, old)+ADs
+AD4 +-
+AD4 +-		/+ACo Link +AEA-node into the waitqueue. +ACo-/
+AD4 +-		WRITE+AF8-ONCE(prev-+AD4-next, node)+ADs
+AD4 +-
+AD4 +-		/+ACo Wait for mcs node lock to be released +ACo-/
+AD4 +-		while (+ACE-node-+AD4-locked)
+AD4 +-			cpu+AF8-relax()+ADs
+AD4 +-
+AD4 +-		smp+AF8-rmb()+ADs /+ACo acquire barrier for the mcs lock +ACo-/
+AD4 +-	+AH0
+AD4 +-
+AD4 +-	/+ACo We're at the head of the waitqueue, wait for the lock. +ACo-/
+AD4 +-	while ((val +AD0 atomic+AF8-read(+ACY-lock-+AD4-val)) +ACY +AF8-Q+AF8-LOCKED+AF8-VAL)
+AD4 +-		cpu+AF8-relax()+ADs
+AD4 +-
+AD4 +-	/+ACo If we're the last queued, must clean up the tail. +ACo-/
+AD4 +-	if ((val +ACY +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK) +AD0APQ tail) +AHs
+AD4 +-		if (trylock+AF8-clear+AF8-tail+AF8-cpu(lock, val))
+AD4 +-			goto release+ADs
+AD4 +-		/+ACo Another waiter must have enqueued +ACo-/
+AD4 +-	+AH0
+AD4 +-
+AD4 +-	/+ACo We must be the owner, just set the lock bit and acquire +ACo-/
+AD4 +-	lock+AF8-set+AF8-locked(lock)+ADs
+AD4 +-
+AD4 +-	/+ACo contended path+ADs must wait for next +ACEAPQ NULL (MCS protocol) +ACo-/
+AD4 +-	while (+ACE(next +AD0 READ+AF8-ONCE(node-+AD4-next)))
+AD4  		cpu+AF8-relax()+ADs
+AD4 +-
+AD4 +-	/+ACo
+AD4 +-	 +ACo Unlock the next mcs waiter node. Release barrier is not required
+AD4 +-	 +ACo here because the acquirer is only accessing the lock word, and
+AD4 +-	 +ACo the acquire barrier we took the lock with orders that update vs
+AD4 +-	 +ACo this store to locked. The corresponding barrier is the smp+AF8-rmb()
+AD4 +-	 +ACo acquire barrier for mcs lock, above.
+AD4 +-	 +ACo-/
+AD4 +-	WRITE+AF8-ONCE(next-+AD4-locked, 1)+ADs
+AD4 +-
+AD4 +-release:
+AD4 +-	qnodesp-+AD4-count--+ADs /+ACo release the node +ACo-/
+AD4 +-+AH0
+AD4 +-
+AD4 +-void queued+AF8-spin+AF8-lock+AF8-slowpath(struct qspinlock +ACo-lock)
+AD4 +-+AHs
+AD4 +-	queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(lock)+ADs
+AD4  +AH0
+AD4  EXPORT+AF8-SYMBOL(queued+AF8-spin+AF8-lock+AF8-slowpath)+ADs
+AD4  

