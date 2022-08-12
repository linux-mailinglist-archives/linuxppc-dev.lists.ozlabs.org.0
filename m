Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C7B590AEC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 06:07:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3qrb0Fxrz3c6R
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 14:07:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HPukPzgz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HPukPzgz;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3qqv1jftz3000
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 14:06:49 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id gp7so5027193pjb.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 21:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=TfVjA5tlLne2bEYA+GLsMuHseHlp9N5Tf9AUCItWSuQ=;
        b=HPukPzgz+pC0BiDq2Vebig9ykcNFf1wh4lRFltjxfRu7jAfB5hobd2JY8JYl0POKPN
         6DnitWWfWnKkY4uRL1LO1qQP87slB6opZm81K0HgTAjXcV2B2LK+oRJxeVVunkYzZ8Ux
         pH4DZslxkU1aC/yb8nt56hprMQiOA7dYnhl8/LEQoVFNiKXabgzIGlyFN5brZDCqfqwR
         OtRBrd0PUvYnO1jmPrdHWr2pWdryE0NoMu28OcC75p1+1ybRs5gDX5b2Qv+0HML2TT6Y
         +DxG79wKN3kHqYy/yXCuhFgcvP/y0xSJxVTp9P3P0vCbC0wcFxK4PsTFY+Os6No3iC+S
         kGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=TfVjA5tlLne2bEYA+GLsMuHseHlp9N5Tf9AUCItWSuQ=;
        b=i2j9ub9NQKtQmV3OqKrF8l1fRYb+tntkU6LWa0UzobNOsMYOjrDYs963Z89XLZokNA
         YbFbUgRV7hXuUYhNzRYhef90CJ9d09F2atou0OgcnCNmGh/2/vpEn7gIfg/FWwsZ8G+a
         sF7yZdHF2ljB2c5JtcDRUTL35MIVrG/bPYj0s71hTA8KJKz/wVYRKKn61rgiVqFSq40F
         j2ShY+ddYLAO40n7IdohbZHtoQWkB9SrHtuq39atRSZDTiPD1CAxfs4QpTezfqd0tmcb
         cMiVMkvJRrRzsCFDioz0t5c94jfP+oZaZRHTBpcAFTDV/Zn6oXlK1Q8Zg35Hid57Jl9P
         b01A==
X-Gm-Message-State: ACgBeo3R3qQR3abiBFZlnnsMeQaQyrkyVUhrlfAuDO6NaU3y/CqGrRdz
	px/B+OAKcoz9h3JviigQdxvpAA0OroM=
X-Google-Smtp-Source: AA6agR40QpGq+aAXLXNobwdODuggtPHSXfVHVPj93Ls9HjB7TlQ7q+etQZ35GCpIqe+ZVwXjNEs1Cg==
X-Received: by 2002:a17:903:210b:b0:16f:d62:1384 with SMTP id o11-20020a170903210b00b0016f0d621384mr2249683ple.133.1660277204515;
        Thu, 11 Aug 2022 21:06:44 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id f8-20020a170902ce8800b001714853e503sm521259plg.36.2022.08.11.21.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 21:06:43 -0700 (PDT)
Message-ID: <639d7bd065c894ef3cddfde05cedec9a21936979.camel@gmail.com>
Subject: Re: [PATCH 10/17] powerpc/qspinlock: allow stealing when head of
 queue yields
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 12 Aug 2022 14:06:40 +1000
In-Reply-To: <20220728063120.2867508-12-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-12-npiggin@gmail.com>
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
+AD4 If the head of queue is preventing stealing but it finds the owner vCPU
+AD4 is preempted, it will yield its cycles to the owner which could cause it
+AD4 to become preempted. Add an option to re-allow stealers before yielding,
+AD4 and disallow them again after returning from the yield.
+AD4 
+AD4 Disable this option by default for now, i.e., no logical change.
+AD4 ---
+AD4  arch/powerpc/lib/qspinlock.c +AHw 56 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+---
+AD4  1 file changed, 53 insertions(+-), 3 deletions(-)
+AD4 
+AD4 diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
+AD4 index b39f8c5b329c..94f007f66942 100644
+AD4 --- a/arch/powerpc/lib/qspinlock.c
+AD4 +-+-+- b/arch/powerpc/lib/qspinlock.c
+AD4 +AEAAQA -26,6 +-26,7 +AEAAQA static bool MAYBE+AF8-STEALERS +AF8AXw-read+AF8-mostly +AD0 true+ADs
+AD4  static int HEAD+AF8-SPINS +AF8AXw-read+AF8-mostly +AD0 (1+ADwAPA-8)+ADs
+AD4  
+AD4  static bool pv+AF8-yield+AF8-owner +AF8AXw-read+AF8-mostly +AD0 true+ADs
+AD4 +-static bool pv+AF8-yield+AF8-allow+AF8-steal +AF8AXw-read+AF8-mostly +AD0 false+ADs

To me this one does read as a boolean, but if you go with those other changes
I'd make it pv+AF8-yield+AF8-steal+AF8-enable to be consistent.

+AD4  static bool pv+AF8-yield+AF8-prev +AF8AXw-read+AF8-mostly +AD0 true+ADs
+AD4  
+AD4  static DEFINE+AF8-PER+AF8-CPU+AF8-ALIGNED(struct qnodes, qnodes)+ADs
+AD4 +AEAAQA -173,6 +-174,23 +AEAAQA static +AF8AXw-always+AF8-inline u32 lock+AF8-set+AF8-mustq(struct qspinlock +ACo-lock)
+AD4  	return prev+ADs
+AD4  +AH0
+AD4  
+AD4 +-static +AF8AXw-always+AF8-inline u32 lock+AF8-clear+AF8-mustq(struct qspinlock +ACo-lock)
+AD4 +-+AHs
+AD4 +-	u32 new +AD0 +AF8-Q+AF8-MUST+AF8-Q+AF8-VAL+ADs
+AD4 +-	u32 prev+ADs
+AD4 +-
+AD4 +-	asm volatile(
+AD4 +-+ACI-1:	lwarx	+ACU-0,0,+ACU-1		+ACM lock+AF8-clear+AF8-mustq			+AFw-n+ACI
+AD4 +-+ACI	andc	+ACU-0,+ACU-0,+ACU-2						+AFw-n+ACI
+AD4 +-+ACI	stwcx.	+ACU-0,0,+ACU-1							+AFw-n+ACI
+AD4 +-+ACI	bne-	1b							+AFw-n+ACI
+AD4 +-	: +ACIAPQAm-r+ACI (prev)
+AD4 +-	: +ACI-r+ACI (+ACY-lock-+AD4-val), +ACI-r+ACI (new)
+AD4 +-	: +ACI-cr0+ACI, +ACI-memory+ACI)+ADs
+AD4 +-

This is pretty similar to the DEFINE+AF8-TESTOP() pattern again with the same llong caveat.


+AD4 +-	return prev+ADs
+AD4 +-+AH0
+AD4 +-
+AD4  static struct qnode +ACo-get+AF8-tail+AF8-qnode(struct qspinlock +ACo-lock, u32 val)
+AD4  +AHs
+AD4  	int cpu +AD0 get+AF8-tail+AF8-cpu(val)+ADs
+AD4 +AEAAQA -188,7 +-206,7 +AEAAQA static struct qnode +ACo-get+AF8-tail+AF8-qnode(struct qspinlock +ACo-lock, u32 val)
+AD4  	BUG()+ADs
+AD4  +AH0
+AD4  
+AD4 -static +AF8AXw-always+AF8-inline void yield+AF8-to+AF8-locked+AF8-owner(struct qspinlock +ACo-lock, u32 val, bool paravirt)
+AD4 +-static +AF8AXw-always+AF8-inline void +AF8AXw-yield+AF8-to+AF8-locked+AF8-owner(struct qspinlock +ACo-lock, u32 val, bool paravirt, bool clear+AF8-mustq)

 /+ACo See yield+AF8-to+AF8-locked+AF8-owner comment +ACo-/ comment needs to be updated now.


+AD4  +AHs
+AD4  	int owner+ADs
+AD4  	u32 yield+AF8-count+ADs
+AD4 +AEAAQA -217,7 +-235,11 +AEAAQA static +AF8AXw-always+AF8-inline void yield+AF8-to+AF8-locked+AF8-owner(struct qspinlock +ACo-lock, u32 va
+AD4  	smp+AF8-rmb()+ADs
+AD4  
+AD4  	if (READ+AF8-ONCE(lock-+AD4-val) +AD0APQ val) +AHs
+AD4 +-		if (clear+AF8-mustq)
+AD4 +-			lock+AF8-clear+AF8-mustq(lock)+ADs
+AD4  		yield+AF8-to+AF8-preempted(owner, yield+AF8-count)+ADs
+AD4 +-		if (clear+AF8-mustq)
+AD4 +-			lock+AF8-set+AF8-mustq(lock)+ADs
+AD4  		/+ACo Don't relax if we yielded. Maybe we should? +ACo-/
+AD4  		return+ADs
+AD4  	+AH0
+AD4 +AEAAQA -225,6 +-247,16 +AEAAQA static +AF8AXw-always+AF8-inline void yield+AF8-to+AF8-locked+AF8-owner(struct qspinlock +ACo-lock, u32 va
+AD4  	cpu+AF8-relax()+ADs
+AD4  +AH0
+AD4  
+AD4 +-static +AF8AXw-always+AF8-inline void yield+AF8-to+AF8-locked+AF8-owner(struct qspinlock +ACo-lock, u32 val, bool paravirt)
+AD4 +-+AHs
+AD4 +-	+AF8AXw-yield+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt, false)+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static +AF8AXw-always+AF8-inline void yield+AF8-head+AF8-to+AF8-locked+AF8-owner(struct qspinlock +ACo-lock, u32 val, bool paravirt, bool clear+AF8-mustq)
+AD4 +-+AHs

The check for pv+AF8-yield+AF8-allow+AF8-steal seems like it could go here instead of
being done by the caller.
+AF8AXw-yield+AF8-to+AF8-locked+AF8-owner() checks for pv+AF8-yield+AF8-owner so it seems more
  consistent.



+AD4 +-	+AF8AXw-yield+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt, clear+AF8-mustq)+ADs
+AD4 +-+AH0
+AD4 +-
+AD4  static +AF8AXw-always+AF8-inline void yield+AF8-to+AF8-prev(struct qspinlock +ACo-lock, struct qnode +ACo-node, int prev+AF8-cpu, bool paravirt)
+AD4  +AHs
+AD4  	u32 yield+AF8-count+ADs
+AD4 +AEAAQA -332,7 +-364,7 +AEAAQA static +AF8AXw-always+AF8-inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock, b
+AD4  	if (+ACE-MAYBE+AF8-STEALERS) +AHs
+AD4  		/+ACo We're at the head of the waitqueue, wait for the lock. +ACo-/
+AD4  		while ((val +AD0 READ+AF8-ONCE(lock-+AD4-val)) +ACY +AF8-Q+AF8-LOCKED+AF8-VAL)
+AD4 -			yield+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt)+ADs
+AD4 +-			yield+AF8-head+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt, false)+ADs
+AD4  
+AD4  		/+ACo If we're the last queued, must clean up the tail. +ACo-/
+AD4  		if ((val +ACY +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK) +AD0APQ tail) +AHs
+AD4 +AEAAQA -350,7 +-382,8 +AEAAQA static +AF8AXw-always+AF8-inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock, b
+AD4  again:
+AD4  		/+ACo We're at the head of the waitqueue, wait for the lock. +ACo-/
+AD4  		while ((val +AD0 READ+AF8-ONCE(lock-+AD4-val)) +ACY +AF8-Q+AF8-LOCKED+AF8-VAL) +AHs
+AD4 -			yield+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt)+ADs
+AD4 +-			yield+AF8-head+AF8-to+AF8-locked+AF8-owner(lock, val, paravirt,
+AD4 +-					pv+AF8-yield+AF8-allow+AF8-steal +ACYAJg set+AF8-mustq)+ADs
+AD4  
+AD4  			iters+-+-+ADs
+AD4  			if (+ACE-set+AF8-mustq +ACYAJg iters +AD4APQ get+AF8-head+AF8-spins(paravirt)) +AHs
+AD4 +AEAAQA -475,6 +-508,22 +AEAAQA static int pv+AF8-yield+AF8-owner+AF8-get(void +ACo-data, u64 +ACo-val)
+AD4  
+AD4  DEFINE+AF8-SIMPLE+AF8-ATTRIBUTE(fops+AF8-pv+AF8-yield+AF8-owner, pv+AF8-yield+AF8-owner+AF8-get, pv+AF8-yield+AF8-owner+AF8-set, +ACIAJQ-llu+AFw-n+ACI)+ADs
+AD4  
+AD4 +-static int pv+AF8-yield+AF8-allow+AF8-steal+AF8-set(void +ACo-data, u64 val)
+AD4 +-+AHs
+AD4 +-	pv+AF8-yield+AF8-allow+AF8-steal +AD0 +ACEAIQ-val+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static int pv+AF8-yield+AF8-allow+AF8-steal+AF8-get(void +ACo-data, u64 +ACo-val)
+AD4 +-+AHs
+AD4 +-	+ACo-val +AD0 pv+AF8-yield+AF8-allow+AF8-steal+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-DEFINE+AF8-SIMPLE+AF8-ATTRIBUTE(fops+AF8-pv+AF8-yield+AF8-allow+AF8-steal, pv+AF8-yield+AF8-allow+AF8-steal+AF8-get, pv+AF8-yield+AF8-allow+AF8-steal+AF8-set, +ACIAJQ-llu+AFw-n+ACI)+ADs
+AD4 +-
+AD4  static int pv+AF8-yield+AF8-prev+AF8-set(void +ACo-data, u64 val)
+AD4  +AHs
+AD4  	pv+AF8-yield+AF8-prev +AD0 +ACEAIQ-val+ADs
+AD4 +AEAAQA -497,6 +-546,7 +AEAAQA static +AF8AXw-init int spinlock+AF8-debugfs+AF8-init(void)
+AD4  	debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-head+AF8-spins+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-head+AF8-spins)+ADs
+AD4  	if (is+AF8-shared+AF8-processor()) +AHs
+AD4  		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-yield+AF8-owner+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-yield+AF8-owner)+ADs
+AD4 +-		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-yield+AF8-allow+AF8-steal+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-yield+AF8-allow+AF8-steal)+ADs
+AD4  		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-yield+AF8-prev+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-yield+AF8-prev)+ADs
+AD4  	+AH0
+AD4  

