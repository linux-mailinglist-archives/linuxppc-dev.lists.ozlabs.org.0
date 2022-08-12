Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F997590B50
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 06:49:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3rnN6xWQz3c6V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 14:49:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nY1vxam6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nY1vxam6;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3rmn3fgWz2xHd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 14:49:11 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id h21-20020a17090aa89500b001f31a61b91dso7299779pjq.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 21:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=rQi0IAfzgPLb/ioODMro4UXpbkDSpC8NEkROPfddAoY=;
        b=nY1vxam6CFt0+0j6qSZMMLnt/Td1XNUXZ7l6MdHqLzX5iv3eKBMxcSIbLV1aFr++L6
         H7avSwOlZb6dYRsX8WIm1ef/UqnSyxbjZMPTmSo2Vv3IBENzHEpkk4hEzQ8bRF8387hA
         +3c+vsWqtiesSK/vVx7EbqwPeMFScMmH8HorWX34HVY5e+bbCkmkjM9WNXLOvW9foESL
         38AW5DZ3ZEY44u8zDzpdRnhpLO1h96woSh4YbpQUMQ2xnzjE1X9aeG5RwEuqxBewsSq8
         7sL2sGV8ye4tGmgtbpl5ihvXMlWqTE5YiBy7/nY/s8SHsZXgd51O8nuzHrEEcxHzbfJV
         wcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=rQi0IAfzgPLb/ioODMro4UXpbkDSpC8NEkROPfddAoY=;
        b=QhhF2+qtXow6P3ftv0YLfhaZF07HkuPOd9WPX6DAqtndRC/deH+bWWp4UQ3Org+3PJ
         yMQSjP4l+E03optZe0bkRkPlVRrdjV5yZd9KDpmS2ceD88FKo86T4K3IJJ3Xhys7u/4Q
         /VZxH8SxbqG3dYAVj9yvvbDcr4PHZxdqTeI5MeKnd0ei0UrAcDAhGSHhjDVFChVWGxta
         J97WzMJSKUiuDpVrSGdrk7SggWPPkwPbxWMwNbRq+wWiJfM0PieFuZKrWJHvQDjZhk+r
         Vxh6fwIGOUJy4Eo+pBBLS7pGQ9Tpo54aecKXOoDVK5ykl/ORl+skt/2jiP0pKGGPvD7S
         23FA==
X-Gm-Message-State: ACgBeo0KnD2RXDkEhQ3hSItdZucC91SrJjSGcvhilt/yM5XfygBQEnaN
	Yu/6N5ZwbZGz+hr0iYDwWZW8sfQVX+A=
X-Google-Smtp-Source: AA6agR5kj8ZrKeUUFZsquR+Qq+oLRPxJh5ul+yxmApePxvH4x4cBb2jS54QS2+Qi5UO3lSWZWxKDIQ==
X-Received: by 2002:a17:902:f30c:b0:16d:a79c:4aed with SMTP id c12-20020a170902f30c00b0016da79c4aedmr2304528ple.23.1660279748457;
        Thu, 11 Aug 2022 21:49:08 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id 12-20020a170902c20c00b0015e8d4eb219sm583878pll.99.2022.08.11.21.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 21:49:07 -0700 (PDT)
Message-ID: <7ae36b6ba44b3deb5c0890466a4110437d91cae7.camel@gmail.com>
Subject: Re: [PATCH 16/17] powerpc/qspinlock: allow indefinite spinning on a
 preempted owner
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 12 Aug 2022 14:49:04 +1000
In-Reply-To: <20220728063120.2867508-18-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-18-npiggin@gmail.com>
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
+AD4 Provide an option that holds off queueing indefinitely while the lock
+AD4 owner is preempted. This could reduce queueing latencies for very
+AD4 overcommitted vcpu situations.
+AD4 
+AD4 This is disabled by default.
+AD4 ---
+AD4  arch/powerpc/lib/qspinlock.c +AHw 91 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+------
+AD4  1 file changed, 79 insertions(+-), 12 deletions(-)
+AD4 
+AD4 diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
+AD4 index 24f68bd71e2b..5cfd69931e31 100644
+AD4 --- a/arch/powerpc/lib/qspinlock.c
+AD4 +-+-+- b/arch/powerpc/lib/qspinlock.c
+AD4 +AEAAQA -35,6 +-35,7 +AEAAQA static int HEAD+AF8-SPINS +AF8AXw-read+AF8-mostly +AD0 (1+ADwAPA-8)+ADs
+AD4  
+AD4  static bool pv+AF8-yield+AF8-owner +AF8AXw-read+AF8-mostly +AD0 true+ADs
+AD4  static bool pv+AF8-yield+AF8-allow+AF8-steal +AF8AXw-read+AF8-mostly +AD0 false+ADs
+AD4 +-static bool pv+AF8-spin+AF8-on+AF8-preempted+AF8-owner +AF8AXw-read+AF8-mostly +AD0 false+ADs
+AD4  static bool pv+AF8-yield+AF8-prev +AF8AXw-read+AF8-mostly +AD0 true+ADs
+AD4  static bool pv+AF8-yield+AF8-propagate+AF8-owner +AF8AXw-read+AF8-mostly +AD0 true+ADs
+AD4  static bool pv+AF8-prod+AF8-head +AF8AXw-read+AF8-mostly +AD0 false+ADs
+AD4 +AEAAQA -220,13 +-221,15 +AEAAQA static struct qnode +ACo-get+AF8-tail+AF8-qnode(struct qspinlock +ACo-lock, u32 val)
+AD4  	BUG()+ADs
+AD4  +AH0
+AD4  
+AD4 -static +AF8AXw-always+AF8-inline void +AF8AXw-yield+AF8-to+AF8-locked+AF8-owner(struct qspinlock +ACo-lock, u32 val, bool paravirt, bool clear+AF8-mustq)
+AD4 +-static +AF8AXw-always+AF8-inline void +AF8AXw-yield+AF8-to+AF8-locked+AF8-owner(struct qspinlock +ACo-lock, u32 val, bool paravirt, bool clear+AF8-mustq, bool +ACo-preempted)
+AD4  +AHs
+AD4  	int owner+ADs
+AD4  	u32 yield+AF8-count+ADs
+AD4  
+AD4  	BUG+AF8-ON(+ACE(val +ACY +AF8-Q+AF8-LOCKED+AF8-VAL))+ADs
+AD4  
+AD4 +-	+ACo-preempted +AD0 false+ADs
+AD4 +-
+AD4  	if (+ACE-paravirt)
+AD4  		goto relax+ADs
+AD4  
+AD4 +AEAAQA -241,6 +-244,8 +AEAAQA static +AF8AXw-always+AF8-inline void +AF8AXw-yield+AF8-to+AF8-locked+AF8-owner(struct qspinlock +ACo-lock, u32
+AD4  
+AD4  	spin+AF8-end()+ADs
+AD4  
+AD4 +-	+ACo-preempted +AD0 true+ADs
+AD4 +-
+AD4  	/+ACo
+AD4  	 +ACo Read the lock word after sampling the yield count. On the other side
+AD4  	 +ACo there may a wmb because the yield count update is done by the
+AD4 +AEAAQA -265,14 +-270,14 +AEAAQA static +AF8AXw-always+AF8-inline void +AF8AXw-yield+AF8-to+AF8-locked+AF8-owner(struct qspinlock +ACo-lock, u32
+AD4  	spin+AF8-cpu+AF8-relax()+ADs
+AD4  +AH0
+AD4  
+AD4 -static +AF8AXw-always+AF8-inline void yield+AF8-to+AF8-locked+AF8-owner(struct qspinlock +ACo-lock, u32 val, bool paravirt)
+AD4 +-static +AF8AXw-always+AF8-inline void yield+AF8-to+AF8-locked+AF8-owner(struct qspinlock +ACo-lock, u32 val, bool paravirt, bool +ACo-preempted)

It seems like preempted parameter could be the return value of
yield+AF8-to+AF8-locked+AF8-owner(). Then callers that don't use the value returned in
preempted don't need to create an unnecessary variable to pass in.

+AD4  +AHs
+AD4 -	+AF8AXw-yield+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt, false)+ADs
+AD4 +-	+AF8AXw-yield+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt, false, preempted)+ADs
+AD4  +AH0
+AD4  
+AD4 -static +AF8AXw-always+AF8-inline void yield+AF8-head+AF8-to+AF8-locked+AF8-owner(struct qspinlock +ACo-lock, u32 val, bool paravirt, bool clear+AF8-mustq)
+AD4 +-static +AF8AXw-always+AF8-inline void yield+AF8-head+AF8-to+AF8-locked+AF8-owner(struct qspinlock +ACo-lock, u32 val, bool paravirt, bool clear+AF8-mustq, bool +ACo-preempted)
+AD4  +AHs
+AD4 -	+AF8AXw-yield+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt, clear+AF8-mustq)+ADs
+AD4 +-	+AF8AXw-yield+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt, clear+AF8-mustq, preempted)+ADs
+AD4  +AH0
+AD4  
+AD4  static +AF8AXw-always+AF8-inline void propagate+AF8-yield+AF8-cpu(struct qnode +ACo-node, u32 val, int +ACo-set+AF8-yield+AF8-cpu, bool paravirt)
+AD4 +AEAAQA -364,12 +-369,33 +AEAAQA static +AF8AXw-always+AF8-inline void yield+AF8-to+AF8-prev(struct qspinlock +ACo-lock, struct qnode +ACo
+AD4  
+AD4  static +AF8AXw-always+AF8-inline bool try+AF8-to+AF8-steal+AF8-lock(struct qspinlock +ACo-lock, bool paravirt)
+AD4  +AHs
+AD4 -	int iters+ADs
+AD4 +-	int iters +AD0 0+ADs
+AD4 +-
+AD4 +-	if (+ACE-STEAL+AF8-SPINS) +AHs
+AD4 +-		if (paravirt +ACYAJg pv+AF8-spin+AF8-on+AF8-preempted+AF8-owner) +AHs
+AD4 +-			spin+AF8-begin()+ADs
+AD4 +-			for (+ADsAOw) +AHs
+AD4 +-				u32 val +AD0 READ+AF8-ONCE(lock-+AD4-val)+ADs
+AD4 +-				bool preempted+ADs
+AD4 +-
+AD4 +-				if (val +ACY +AF8-Q+AF8-MUST+AF8-Q+AF8-VAL)
+AD4 +-					break+ADs
+AD4 +-				if (+ACE(val +ACY +AF8-Q+AF8-LOCKED+AF8-VAL))
+AD4 +-					break+ADs
+AD4 +-				if (+ACE-vcpu+AF8-is+AF8-preempted(get+AF8-owner+AF8-cpu(val)))
+AD4 +-					break+ADs
+AD4 +-				yield+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt, +ACY-preempted)+ADs
+AD4 +-			+AH0
+AD4 +-			spin+AF8-end()+ADs
+AD4 +-		+AH0
+AD4 +-		return false+ADs
+AD4 +-	+AH0
+AD4  
+AD4  	/+ACo Attempt to steal the lock +ACo-/
+AD4  	spin+AF8-begin()+ADs
+AD4  	for (+ADsAOw) +AHs
+AD4  		u32 val +AD0 READ+AF8-ONCE(lock-+AD4-val)+ADs
+AD4 +-		bool preempted+ADs
+AD4  
+AD4  		if (val +ACY +AF8-Q+AF8-MUST+AF8-Q+AF8-VAL)
+AD4  			break+ADs
+AD4 +AEAAQA -382,9 +-408,22 +AEAAQA static +AF8AXw-always+AF8-inline bool try+AF8-to+AF8-steal+AF8-lock(struct qspinlock +ACo-lock, bool parav
+AD4  			continue+ADs
+AD4  		+AH0
+AD4  
+AD4 -		yield+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt)+ADs
+AD4 -
+AD4 -		iters+-+-+ADs
+AD4 +-		yield+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt, +ACY-preempted)+ADs
+AD4 +-
+AD4 +-		if (paravirt +ACYAJg preempted) +AHs
+AD4 +-			if (+ACE-pv+AF8-spin+AF8-on+AF8-preempted+AF8-owner)
+AD4 +-				iters+-+-+ADs
+AD4 +-			/+ACo
+AD4 +-			 +ACo pv+AF8-spin+AF8-on+AF8-preempted+AF8-owner don't increase iters
+AD4 +-			 +ACo while the owner is preempted -- we won't interfere
+AD4 +-			 +ACo with it by definition. This could introduce some
+AD4 +-			 +ACo latency issue if we continually observe preempted
+AD4 +-			 +ACo owners, but hopefully that's a rare corner case of
+AD4 +-			 +ACo a badly oversubscribed system.
+AD4 +-			 +ACo-/
+AD4 +-		+AH0 else +AHs
+AD4 +-			iters+-+-+ADs
+AD4 +-		+AH0
+AD4  
+AD4  		if (iters +AD4APQ get+AF8-steal+AF8-spins(paravirt, false))
+AD4  			break+ADs
+AD4 +AEAAQA -463,8 +-502,10 +AEAAQA static +AF8AXw-always+AF8-inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock, b
+AD4  		/+ACo We're at the head of the waitqueue, wait for the lock. +ACo-/
+AD4  		spin+AF8-begin()+ADs
+AD4  		while ((val +AD0 READ+AF8-ONCE(lock-+AD4-val)) +ACY +AF8-Q+AF8-LOCKED+AF8-VAL) +AHs
+AD4 +-			bool preempted+ADs
+AD4 +-
+AD4  			propagate+AF8-yield+AF8-cpu(node, val, +ACY-set+AF8-yield+AF8-cpu, paravirt)+ADs
+AD4 -			yield+AF8-head+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt, false)+ADs
+AD4 +-			yield+AF8-head+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt, false, +ACY-preempted)+ADs
+AD4  		+AH0
+AD4  		spin+AF8-end()+ADs
+AD4  
+AD4 +AEAAQA -486,11 +-527,20 +AEAAQA static +AF8AXw-always+AF8-inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock, b
+AD4  		/+ACo We're at the head of the waitqueue, wait for the lock. +ACo-/
+AD4  		spin+AF8-begin()+ADs
+AD4  		while ((val +AD0 READ+AF8-ONCE(lock-+AD4-val)) +ACY +AF8-Q+AF8-LOCKED+AF8-VAL) +AHs
+AD4 +-			bool preempted+ADs
+AD4 +-
+AD4  			propagate+AF8-yield+AF8-cpu(node, val, +ACY-set+AF8-yield+AF8-cpu, paravirt)+ADs
+AD4  			yield+AF8-head+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt,
+AD4 -					pv+AF8-yield+AF8-allow+AF8-steal +ACYAJg set+AF8-mustq)+ADs
+AD4 +-					pv+AF8-yield+AF8-allow+AF8-steal +ACYAJg set+AF8-mustq,
+AD4 +-					+ACY-preempted)+ADs
+AD4 +-
+AD4 +-			if (paravirt +ACYAJg preempted) +AHs
+AD4 +-				if (+ACE-pv+AF8-spin+AF8-on+AF8-preempted+AF8-owner)
+AD4 +-					iters+-+-+ADs
+AD4 +-			+AH0 else +AHs
+AD4 +-				iters+-+-+ADs
+AD4 +-			+AH0
+AD4  
+AD4 -			iters+-+-+ADs
+AD4  			if (+ACE-set+AF8-mustq +ACYAJg iters +AD4APQ get+AF8-head+AF8-spins(paravirt)) +AHs
+AD4  				set+AF8-mustq +AD0 true+ADs
+AD4  				lock+AF8-set+AF8-mustq(lock)+ADs
+AD4 +AEAAQA -663,6 +-713,22 +AEAAQA static int pv+AF8-yield+AF8-allow+AF8-steal+AF8-get(void +ACo-data, u64 +ACo-val)
+AD4  
+AD4  DEFINE+AF8-SIMPLE+AF8-ATTRIBUTE(fops+AF8-pv+AF8-yield+AF8-allow+AF8-steal, pv+AF8-yield+AF8-allow+AF8-steal+AF8-get, pv+AF8-yield+AF8-allow+AF8-steal+AF8-set, +ACIAJQ-llu+AFw-n+ACI)+ADs
+AD4  
+AD4 +-static int pv+AF8-spin+AF8-on+AF8-preempted+AF8-owner+AF8-set(void +ACo-data, u64 val)
+AD4 +-+AHs
+AD4 +-	pv+AF8-spin+AF8-on+AF8-preempted+AF8-owner +AD0 +ACEAIQ-val+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static int pv+AF8-spin+AF8-on+AF8-preempted+AF8-owner+AF8-get(void +ACo-data, u64 +ACo-val)
+AD4 +-+AHs
+AD4 +-	+ACo-val +AD0 pv+AF8-spin+AF8-on+AF8-preempted+AF8-owner+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-DEFINE+AF8-SIMPLE+AF8-ATTRIBUTE(fops+AF8-pv+AF8-spin+AF8-on+AF8-preempted+AF8-owner, pv+AF8-spin+AF8-on+AF8-preempted+AF8-owner+AF8-get, pv+AF8-spin+AF8-on+AF8-preempted+AF8-owner+AF8-set, +ACIAJQ-llu+AFw-n+ACI)+ADs
+AD4 +-
+AD4  static int pv+AF8-yield+AF8-prev+AF8-set(void +ACo-data, u64 val)
+AD4  +AHs
+AD4  	pv+AF8-yield+AF8-prev +AD0 +ACEAIQ-val+ADs
+AD4 +AEAAQA -719,6 +-785,7 +AEAAQA static +AF8AXw-init int spinlock+AF8-debugfs+AF8-init(void)
+AD4  	if (is+AF8-shared+AF8-processor()) +AHs
+AD4  		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-yield+AF8-owner+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-yield+AF8-owner)+ADs
+AD4  		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-yield+AF8-allow+AF8-steal+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-yield+AF8-allow+AF8-steal)+ADs
+AD4 +-		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-spin+AF8-on+AF8-preempted+AF8-owner+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-spin+AF8-on+AF8-preempted+AF8-owner)+ADs
+AD4  		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-yield+AF8-prev+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-yield+AF8-prev)+ADs
+AD4  		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-yield+AF8-propagate+AF8-owner+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-yield+AF8-propagate+AF8-owner)+ADs
+AD4  		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-prod+AF8-head+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-prod+AF8-head)+ADs

