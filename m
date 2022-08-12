Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2299590A17
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 04:02:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3n3p4r1xz3blw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 12:01:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ay0t0s0d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ay0t0s0d;
	dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3n373yX9z2xHd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 12:01:22 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id r69so12101958pgr.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 19:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=xLZNqqkSAsmpzR/FT9Qp0Z8F5VAcVX3hktLFZvPZgts=;
        b=ay0t0s0dMp6QByGrp+gc34GTbcjzfCTfU3RIkQ8S3Zbux9ckhTUWHri52ce4VjWDgL
         Az9iEXf5ym01f6GpCQtq54eqAGx5Zp0ppH+/1p/mS+QLJiQ+Kk4fJeFpAEdbYaQquJPC
         U0btDVBgqyGWTQav9qRpbJeX8kC5JLvcrZGN6CCqRNDb6Hj6ht3o3TGsxCWb168osry2
         qYFfseuRGKn0U1xwkuWkW/5ToaIZfODdK2ibpJ4V/4NFOe8Z7uvFTJ5YV/rpnefNTZx3
         F2kGplI8TrRP+0N9NkVQ1G8tlmNwePnimXYm2b8dQu6vu7BLL5iFy4z4r2VPAbpDIJ/7
         aTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=xLZNqqkSAsmpzR/FT9Qp0Z8F5VAcVX3hktLFZvPZgts=;
        b=ihsp0MTZz5bvtE1J8dshnwUEik7Gh6X9CwUp+ioYOzf1oIrAZ3uhK/+8TSTEawUPQe
         HoL/oRSp2cHH4wl3SauKYHWy3F8kS8ZFOKog4wUapY9ReL8bZxltQhaUyhmEqi7LKmir
         gEfLq5/GZEW45asaYxTFkqNAg8+v6ZxxUwlQAG6R2HVD3xQEHMD+zrPXRL+pKpC9PN2R
         FMJAkJlzqo5Iycj+LkpAZTr6DV6KDssXdvVbNkBRf7ZBw7pneDzWsf1Auc9PJsj88VCW
         fJiDZRhtVlNOMT4zGNKo4CrluQiGHbrhMhbxpzKF/KSlIgkNxJTgk/nJWOBsbwTfOIBJ
         PxWQ==
X-Gm-Message-State: ACgBeo0Zj8fJkvgh7RKvsjQIF2SyGzjxl1/0KJZVvsul521mrLWHWUgm
	NpeFr33QvOM+0EeXAd3mSeHfS3XW2DA=
X-Google-Smtp-Source: AA6agR4R2ppp2BhwzajrVHnej7RoESKc4ZcDyj5blIihe/kQ4+v044rAAiiJ4qHWDciRH5w2YD/u9w==
X-Received: by 2002:a65:46c4:0:b0:41d:e36b:1e59 with SMTP id n4-20020a6546c4000000b0041de36b1e59mr1401484pgr.494.1660269679650;
        Thu, 11 Aug 2022 19:01:19 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id u16-20020a170902e5d000b0016ec8286733sm338085plf.243.2022.08.11.19.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 19:01:18 -0700 (PDT)
Message-ID: <80aeef7644c8116c77cc6165aa49518bda873fbf.camel@gmail.com>
Subject: Re: [PATCH 08/17] powerpc/qspinlock: paravirt yield to lock owner
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 12 Aug 2022 12:01:15 +1000
In-Reply-To: <20220728063120.2867508-10-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-10-npiggin@gmail.com>
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
+AD4 Waiters spinning on the lock word should yield to the lock owner if the
+AD4 vCPU is preempted. This improves performance when the hypervisor has
+AD4 oversubscribed physical CPUs.
+AD4 ---
+AD4  arch/powerpc/lib/qspinlock.c +AHw 97 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-------
+AD4  1 file changed, 83 insertions(+-), 14 deletions(-)
+AD4 
+AD4 diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
+AD4 index aa26cfe21f18..55286ac91da5 100644
+AD4 --- a/arch/powerpc/lib/qspinlock.c
+AD4 +-+-+- b/arch/powerpc/lib/qspinlock.c
+AD4 +AEAAQA -5,6 +-5,7 +AEAAQA
+AD4  +ACM-include +ADw-linux/percpu.h+AD4
+AD4  +ACM-include +ADw-linux/smp.h+AD4
+AD4  +ACM-include +ADw-asm/qspinlock.h+AD4
+AD4 +-+ACM-include +ADw-asm/paravirt.h+AD4
+AD4  
+AD4  +ACM-define MAX+AF8-NODES	4
+AD4  
+AD4 +AEAAQA -24,14 +-25,16 +AEAAQA static int STEAL+AF8-SPINS +AF8AXw-read+AF8-mostly +AD0 (1+ADwAPA-5)+ADs
+AD4  static bool MAYBE+AF8-STEALERS +AF8AXw-read+AF8-mostly +AD0 true+ADs
+AD4  static int HEAD+AF8-SPINS +AF8AXw-read+AF8-mostly +AD0 (1+ADwAPA-8)+ADs
+AD4  
+AD4 +-static bool pv+AF8-yield+AF8-owner +AF8AXw-read+AF8-mostly +AD0 true+ADs

Not macro case for these globals? To me name does not make it super clear this
is a boolean. What about pv+AF8-yield+AF8-owner+AF8-enabled?

+AD4 +-
+AD4  static DEFINE+AF8-PER+AF8-CPU+AF8-ALIGNED(struct qnodes, qnodes)+ADs
+AD4  
+AD4 -static +AF8AXw-always+AF8-inline int get+AF8-steal+AF8-spins(void)
+AD4 +-static +AF8AXw-always+AF8-inline int get+AF8-steal+AF8-spins(bool paravirt)
+AD4  +AHs
+AD4  	return STEAL+AF8-SPINS+ADs
+AD4  +AH0
+AD4  
+AD4 -static +AF8AXw-always+AF8-inline int get+AF8-head+AF8-spins(void)
+AD4 +-static +AF8AXw-always+AF8-inline int get+AF8-head+AF8-spins(bool paravirt)
+AD4  +AHs
+AD4  	return HEAD+AF8-SPINS+ADs
+AD4  +AH0
+AD4 +AEAAQA -46,7 +-49,11 +AEAAQA static inline int get+AF8-tail+AF8-cpu(u32 val)
+AD4  	return (val +AD4APg +AF8-Q+AF8-TAIL+AF8-CPU+AF8-OFFSET) - 1+ADs
+AD4  +AH0
+AD4  
+AD4 -/+ACo Take the lock by setting the bit, no other CPUs may concurrently lock it. +ACo-/
+AD4 +-static inline int get+AF8-owner+AF8-cpu(u32 val)
+AD4 +-+AHs
+AD4 +-	return (val +ACY +AF8-Q+AF8-OWNER+AF8-CPU+AF8-MASK) +AD4APg +AF8-Q+AF8-OWNER+AF8-CPU+AF8-OFFSET+ADs
+AD4 +-+AH0
+AD4 +-
+AD4  /+ACo Take the lock by setting the lock bit, no other CPUs will touch it. +ACo-/
+AD4  static +AF8AXw-always+AF8-inline void lock+AF8-set+AF8-locked(struct qspinlock +ACo-lock)
+AD4  +AHs
+AD4 +AEAAQA -180,7 +-187,45 +AEAAQA static struct qnode +ACo-get+AF8-tail+AF8-qnode(struct qspinlock +ACo-lock, u32 val)
+AD4  	BUG()+ADs
+AD4  +AH0
+AD4  
+AD4 -static inline bool try+AF8-to+AF8-steal+AF8-lock(struct qspinlock +ACo-lock)
+AD4 +-static +AF8AXw-always+AF8-inline void yield+AF8-to+AF8-locked+AF8-owner(struct qspinlock +ACo-lock, u32 val, bool paravirt)

This name doesn't seem correct for the non paravirt case.

+AD4 +-+AHs
+AD4 +-	int owner+ADs
+AD4 +-	u32 yield+AF8-count+ADs
+AD4 +-
+AD4 +-	BUG+AF8-ON(+ACE(val +ACY +AF8-Q+AF8-LOCKED+AF8-VAL))+ADs
+AD4 +-
+AD4 +-	if (+ACE-paravirt)
+AD4 +-		goto relax+ADs
+AD4 +-
+AD4 +-	if (+ACE-pv+AF8-yield+AF8-owner)
+AD4 +-		goto relax+ADs
+AD4 +-
+AD4 +-	owner +AD0 get+AF8-owner+AF8-cpu(val)+ADs
+AD4 +-	yield+AF8-count +AD0 yield+AF8-count+AF8-of(owner)+ADs
+AD4 +-
+AD4 +-	if ((yield+AF8-count +ACY 1) +AD0APQ 0)
+AD4 +-		goto relax+ADs /+ACo owner vcpu is running +ACo-/

I wonder why not use vcpu+AF8-is+AF8-preempted()?

+AD4 +-
+AD4 +-	/+ACo
+AD4 +-	 +ACo Read the lock word after sampling the yield count. On the other side
+AD4 +-	 +ACo there may a wmb because the yield count update is done by the
+AD4 +-	 +ACo hypervisor preemption and the value update by the OS, however this
+AD4 +-	 +ACo ordering might reduce the chance of out of order accesses and
+AD4 +-	 +ACo improve the heuristic.
+AD4 +-	 +ACo-/
+AD4 +-	smp+AF8-rmb()+ADs
+AD4 +-
+AD4 +-	if (READ+AF8-ONCE(lock-+AD4-val) +AD0APQ val) +AHs
+AD4 +-		yield+AF8-to+AF8-preempted(owner, yield+AF8-count)+ADs
+AD4 +-		/+ACo Don't relax if we yielded. Maybe we should? +ACo-/
+AD4 +-		return+ADs
+AD4 +-	+AH0
+AD4 +-relax:
+AD4 +-	cpu+AF8-relax()+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-
+AD4 +-static +AF8AXw-always+AF8-inline bool try+AF8-to+AF8-steal+AF8-lock(struct qspinlock +ACo-lock, bool paravirt)
+AD4  +AHs
+AD4  	int iters+ADs
+AD4  
+AD4 +AEAAQA -197,18 +-242,18 +AEAAQA static inline bool try+AF8-to+AF8-steal+AF8-lock(struct qspinlock +ACo-lock)
+AD4  			continue+ADs
+AD4  		+AH0
+AD4  
+AD4 -		cpu+AF8-relax()+ADs
+AD4 +-		yield+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt)+ADs
+AD4  
+AD4  		iters+-+-+ADs
+AD4  
+AD4 -		if (iters +AD4APQ get+AF8-steal+AF8-spins())
+AD4 +-		if (iters +AD4APQ get+AF8-steal+AF8-spins(paravirt))
+AD4  			break+ADs
+AD4  	+AH0
+AD4  
+AD4  	return false+ADs
+AD4  +AH0
+AD4  
+AD4 -static inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock)
+AD4 +-static +AF8AXw-always+AF8-inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock, bool paravirt)
+AD4  +AHs
+AD4  	struct qnodes +ACo-qnodesp+ADs
+AD4  	struct qnode +ACo-next, +ACo-node+ADs
+AD4 +AEAAQA -260,7 +-305,7 +AEAAQA static inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock)
+AD4  	if (+ACE-MAYBE+AF8-STEALERS) +AHs
+AD4  		/+ACo We're at the head of the waitqueue, wait for the lock. +ACo-/
+AD4  		while ((val +AD0 READ+AF8-ONCE(lock-+AD4-val)) +ACY +AF8-Q+AF8-LOCKED+AF8-VAL)
+AD4 -			cpu+AF8-relax()+ADs
+AD4 +-			yield+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt)+ADs
+AD4  
+AD4  		/+ACo If we're the last queued, must clean up the tail. +ACo-/
+AD4  		if ((val +ACY +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK) +AD0APQ tail) +AHs
+AD4 +AEAAQA -278,10 +-323,10 +AEAAQA static inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock)
+AD4  again:
+AD4  		/+ACo We're at the head of the waitqueue, wait for the lock. +ACo-/
+AD4  		while ((val +AD0 READ+AF8-ONCE(lock-+AD4-val)) +ACY +AF8-Q+AF8-LOCKED+AF8-VAL) +AHs
+AD4 -			cpu+AF8-relax()+ADs
+AD4 +-			yield+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt)+ADs
+AD4  
+AD4  			iters+-+-+ADs
+AD4 -			if (+ACE-set+AF8-mustq +ACYAJg iters +AD4APQ get+AF8-head+AF8-spins()) +AHs
+AD4 +-			if (+ACE-set+AF8-mustq +ACYAJg iters +AD4APQ get+AF8-head+AF8-spins(paravirt)) +AHs
+AD4  				set+AF8-mustq +AD0 true+ADs
+AD4  				lock+AF8-set+AF8-mustq(lock)+ADs
+AD4  				val +AHwAPQ +AF8-Q+AF8-MUST+AF8-Q+AF8-VAL+ADs
+AD4 +AEAAQA -320,10 +-365,15 +AEAAQA static inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock)
+AD4  
+AD4  void queued+AF8-spin+AF8-lock+AF8-slowpath(struct qspinlock +ACo-lock)
+AD4  +AHs
+AD4 -	if (try+AF8-to+AF8-steal+AF8-lock(lock))
+AD4 -		return+ADs
+AD4 -
+AD4 -	queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(lock)+ADs
+AD4 +-	if (IS+AF8-ENABLED(CONFIG+AF8-PARAVIRT+AF8-SPINLOCKS) +ACYAJg is+AF8-shared+AF8-processor()) +AHs
+AD4 +-		if (try+AF8-to+AF8-steal+AF8-lock(lock, true))
+AD4 +-			return+ADs
+AD4 +-		queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(lock, true)+ADs
+AD4 +-	+AH0 else +AHs
+AD4 +-		if (try+AF8-to+AF8-steal+AF8-lock(lock, false))
+AD4 +-			return+ADs
+AD4 +-		queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(lock, false)+ADs
+AD4 +-	+AH0
+AD4  +AH0

There is not really a need for a conditional: 

bool paravirt +AD0 IS+AF8-ENABLED(CONFIG+AF8-PARAVIRT+AF8-SPINLOCKS) +ACYAJg
is+AF8-shared+AF8-processor()+ADs

if (try+AF8-to+AF8-steal+AF8-lock(lock, paravirt))
	return+ADs

queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(lock, paravirt)+ADs


The paravirt parameter used by the various functions seems always to be
equivalent to (IS+AF8-ENABLED(CONFIG+AF8-PARAVIRT+AF8-SPINLOCKS) +ACYAJg is+AF8-shared+AF8-processor()).
I wonder if it would be simpler testing (IS+AF8-ENABLED(CONFIG+AF8-PARAVIRT+AF8-SPINLOCKS) +ACYAJg is+AF8-shared+AF8-processor())
(using a helper function) in those functions instead passing it as a parameter?


+AD4  EXPORT+AF8-SYMBOL(queued+AF8-spin+AF8-lock+AF8-slowpath)+ADs
+AD4  
+AD4 +AEAAQA -382,10 +-432,29 +AEAAQA static int head+AF8-spins+AF8-get(void +ACo-data, u64 +ACo-val)
+AD4  
+AD4  DEFINE+AF8-SIMPLE+AF8-ATTRIBUTE(fops+AF8-head+AF8-spins, head+AF8-spins+AF8-get, head+AF8-spins+AF8-set, +ACIAJQ-llu+AFw-n+ACI)+ADs
+AD4  
+AD4 +-static int pv+AF8-yield+AF8-owner+AF8-set(void +ACo-data, u64 val)
+AD4 +-+AHs
+AD4 +-	pv+AF8-yield+AF8-owner +AD0 +ACEAIQ-val+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static int pv+AF8-yield+AF8-owner+AF8-get(void +ACo-data, u64 +ACo-val)
+AD4 +-+AHs
+AD4 +-	+ACo-val +AD0 pv+AF8-yield+AF8-owner+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-DEFINE+AF8-SIMPLE+AF8-ATTRIBUTE(fops+AF8-pv+AF8-yield+AF8-owner, pv+AF8-yield+AF8-owner+AF8-get, pv+AF8-yield+AF8-owner+AF8-set, +ACIAJQ-llu+AFw-n+ACI)+ADs
+AD4 +-
+AD4  static +AF8AXw-init int spinlock+AF8-debugfs+AF8-init(void)
+AD4  +AHs
+AD4  	debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-steal+AF8-spins+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-steal+AF8-spins)+ADs
+AD4  	debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-head+AF8-spins+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-head+AF8-spins)+ADs
+AD4 +-	if (is+AF8-shared+AF8-processor()) +AHs
+AD4 +-		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-yield+AF8-owner+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-yield+AF8-owner)+ADs
+AD4 +-	+AH0
+AD4  
+AD4  	return 0+ADs
+AD4  +AH0

