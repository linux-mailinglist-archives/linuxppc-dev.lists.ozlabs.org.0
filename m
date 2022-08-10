Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 553E058E6D0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 07:51:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2fFy1gjDz3bnM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 15:51:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Acg8ifxx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Acg8ifxx;
	dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2fFJ64hPz2xJL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Aug 2022 15:51:14 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id 73so13426488pgb.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Aug 2022 22:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=5pLp9a35RHVVJW083AjSXtwFU3KvMTfpJnu6w1oW6Wc=;
        b=Acg8ifxx50N/WFDgAzcx5xmnF8dSgqe7vIQA9l3j4kDICwpywFr7rhLh+M2vkSE0Mc
         1ScENb7t41wuEqeDdECofuXp/TG2A49O5Aqt3Whw6/rS+QkNFeh5rv1QMIkV+VqQJwYC
         AeUdUokA1f1nQZoAx/J9k/X3mYhVOUV0gxpnq3PTOCmcSevZVHvnVIp9KOyGxWvnsM8r
         RyDIQRqVu5WFfI4obblS8YXNDH1c8gMurtRkx7eNoBg14evzKONKzzZ9S75JXrfIh8hk
         nD4BD0gj6iN6aooNon3Zou/pOt3qVDP1Z3WwZwmuo90BW1Ie9LACA0DQgDJcldPdc1a7
         0JiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=5pLp9a35RHVVJW083AjSXtwFU3KvMTfpJnu6w1oW6Wc=;
        b=h1YGiDgD/1dCS5xgzRIAyR/Z17JG76mPDXechLJfrYohPQYOas/bXK5G8q/74mGO8j
         +RwIZbESELrYLOhlPQqVBIdrz+nhRVRkL0fP+UdcF5C/w6+Au0Sqbqcnq3qOgdG0g+51
         5KEe+tx5v1WTXu1T3vESYnf4GW20sTs/+KQQJrpej5L7P+Ca6WvJ3ofszWiK8AYOJTDT
         8S48kHX1YgP4WCNLAXkOW/nLpnvxwInpzNdeMWMwtSbuch1pM2ZaSRgUr7iohr1aCtYu
         JWUJHLi+0cDenqGHMgW2poeWZ+Vy2mOF1cHUNLAZfphzMKxyLw1ghZo9iIEitxXJBSQr
         SwWw==
X-Gm-Message-State: ACgBeo3mHmGO3gy42mZGBYo0MOQ1KCXpiJs0pnRcp4b4NsUGRspVQ50j
	vZsTUztNtCwx3rTnPu12VOA=
X-Google-Smtp-Source: AA6agR7T9GDc4Dso8RYmSkxO6f9HU9+zQSBUYXTkC3on2oUXXNInzhwCsr1k7YhGQ3wsAQ9La3NHHg==
X-Received: by 2002:a63:88c8:0:b0:41d:260c:ea29 with SMTP id l191-20020a6388c8000000b0041d260cea29mr16419687pgd.284.1660110672771;
        Tue, 09 Aug 2022 22:51:12 -0700 (PDT)
Received: from [192.168.2.27] (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
        by smtp.googlemail.com with ESMTPSA id iw18-20020a170903045200b0016d6d1b610fsm11846259plb.98.2022.08.09.22.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 22:51:12 -0700 (PDT)
Message-ID: <eff017a9afff2477b04a7927d03217924e01f560.camel@gmail.com>
Subject: Re: [PATCH 06/17] powerpc/qspinlock: theft prevention to control
 latency
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 10 Aug 2022 15:51:05 +1000
In-Reply-To: <20220728063120.2867508-8-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-8-npiggin@gmail.com>
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
+AD4 Give the queue head the ability to stop stealers. After a number of
+AD4 spins without sucessfully acquiring the lock, the queue head employs
+AD4 this, which will assure it is the next owner.
+AD4 ---
+AD4  arch/powerpc/include/asm/qspinlock+AF8-types.h +AHw 10 +-+-+--
+AD4  arch/powerpc/lib/qspinlock.c               +AHw 56 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
+AD4  2 files changed, 63 insertions(+-), 3 deletions(-)
+AD4 
+AD4 diff --git a/arch/powerpc/include/asm/qspinlock+AF8-types.h b/arch/powerpc/include/asm/qspinlock+AF8-types.h
+AD4 index 210adf05b235..8b20f5e22bba 100644
+AD4 --- a/arch/powerpc/include/asm/qspinlock+AF8-types.h
+AD4 +-+-+- b/arch/powerpc/include/asm/qspinlock+AF8-types.h
+AD4 +AEAAQA -29,7 +-29,8 +AEAAQA typedef struct qspinlock +AHs
+AD4   +ACo Bitfields in the lock word:
+AD4   +ACo
+AD4   +ACo     0: locked bit
+AD4 - +ACo 16-31: tail cpu (+-1)
+AD4 +- +ACo    16: must queue bit
+AD4 +- +ACo 17-31: tail cpu (+-1)
+AD4   +ACo-/
+AD4  +ACM-define	+AF8-Q+AF8-SET+AF8-MASK(type)	(((1U +ADwAPA +AF8-Q+AF8 +ACMAIw type +ACMAIw +AF8-BITS) - 1)+AFw
+AD4  				      +ADwAPA +AF8-Q+AF8 +ACMAIw type +ACMAIw +AF8-OFFSET)
+AD4 +AEAAQA -38,7 +-39,12 +AEAAQA typedef struct qspinlock +AHs
+AD4  +ACM-define +AF8-Q+AF8-LOCKED+AF8-MASK		+AF8-Q+AF8-SET+AF8-MASK(LOCKED)
+AD4  +ACM-define +AF8-Q+AF8-LOCKED+AF8-VAL		(1U +ADwAPA +AF8-Q+AF8-LOCKED+AF8-OFFSET)
+AD4  
+AD4 -+ACM-define +AF8-Q+AF8-TAIL+AF8-CPU+AF8-OFFSET	16
+AD4 +-+ACM-define +AF8-Q+AF8-MUST+AF8-Q+AF8-OFFSET	16
+AD4 +-+ACM-define +AF8-Q+AF8-MUST+AF8-Q+AF8-BITS		1
+AD4 +-+ACM-define +AF8-Q+AF8-MUST+AF8-Q+AF8-MASK		+AF8-Q+AF8-SET+AF8-MASK(MUST+AF8-Q)
+AD4 +-+ACM-define +AF8-Q+AF8-MUST+AF8-Q+AF8-VAL		(1U +ADwAPA +AF8-Q+AF8-MUST+AF8-Q+AF8-OFFSET)
+AD4 +-
+AD4 +-+ACM-define +AF8-Q+AF8-TAIL+AF8-CPU+AF8-OFFSET	17
+AD4  +ACM-define +AF8-Q+AF8-TAIL+AF8-CPU+AF8-BITS	(32 - +AF8-Q+AF8-TAIL+AF8-CPU+AF8-OFFSET)
+AD4  +ACM-define +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK	+AF8-Q+AF8-SET+AF8-MASK(TAIL+AF8-CPU)

Not a big deal but some of these values could be calculated like in the
generic version. e.g.

	+ACM-define +AF8-Q+AF8-PENDING+AF8-OFFSET	(+AF8-Q+AF8-LOCKED+AF8-OFFSET +-+AF8-Q+AF8-LOCKED+AF8-BITS)

+AD4  
+AD4 diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
+AD4 index 1625cce714b2..a906cc8f15fa 100644
+AD4 --- a/arch/powerpc/lib/qspinlock.c
+AD4 +-+-+- b/arch/powerpc/lib/qspinlock.c
+AD4 +AEAAQA -22,6 +-22,7 +AEAAQA struct qnodes +AHs
+AD4  /+ACo Tuning parameters +ACo-/
+AD4  static int STEAL+AF8-SPINS +AF8AXw-read+AF8-mostly +AD0 (1+ADwAPA-5)+ADs
+AD4  static bool MAYBE+AF8-STEALERS +AF8AXw-read+AF8-mostly +AD0 true+ADs
+AD4 +-static int HEAD+AF8-SPINS +AF8AXw-read+AF8-mostly +AD0 (1+ADwAPA-8)+ADs
+AD4  
+AD4  static DEFINE+AF8-PER+AF8-CPU+AF8-ALIGNED(struct qnodes, qnodes)+ADs
+AD4  
+AD4 +AEAAQA -30,6 +-31,11 +AEAAQA static +AF8AXw-always+AF8-inline int get+AF8-steal+AF8-spins(void)
+AD4  	return STEAL+AF8-SPINS+ADs
+AD4  +AH0
+AD4  
+AD4 +-static +AF8AXw-always+AF8-inline int get+AF8-head+AF8-spins(void)
+AD4 +-+AHs
+AD4 +-	return HEAD+AF8-SPINS+ADs
+AD4 +-+AH0
+AD4 +-
+AD4  static inline u32 encode+AF8-tail+AF8-cpu(void)
+AD4  +AHs
+AD4  	return (smp+AF8-processor+AF8-id() +- 1) +ADwAPA +AF8-Q+AF8-TAIL+AF8-CPU+AF8-OFFSET+ADs
+AD4 +AEAAQA -142,6 +-148,23 +AEAAQA static +AF8AXw-always+AF8-inline u32 publish+AF8-tail+AF8-cpu(struct qspinlock +ACo-lock, u32 tail)
+AD4  	return prev+ADs
+AD4  +AH0
+AD4  
+AD4 +-static +AF8AXw-always+AF8-inline u32 lock+AF8-set+AF8-mustq(struct qspinlock +ACo-lock)
+AD4 +-+AHs
+AD4 +-	u32 new +AD0 +AF8-Q+AF8-MUST+AF8-Q+AF8-VAL+ADs
+AD4 +-	u32 prev+ADs
+AD4 +-
+AD4 +-	asm volatile(
+AD4 +-+ACI-1:	lwarx	+ACU-0,0,+ACU-1		+ACM lock+AF8-set+AF8-mustq			+AFw-n+ACI

Is the EH bit not set because we don't hold the lock here?

+AD4 +-+ACI	or	+ACU-0,+ACU-0,+ACU-2						+AFw-n+ACI
+AD4 +-+ACI	stwcx.	+ACU-0,0,+ACU-1							+AFw-n+ACI
+AD4 +-+ACI	bne-	1b							+AFw-n+ACI
+AD4 +-	: +ACIAPQAm-r+ACI (prev)
+AD4 +-	: +ACI-r+ACI (+ACY-lock-+AD4-val), +ACI-r+ACI (new)
+AD4 +-	: +ACI-cr0+ACI, +ACI-memory+ACI)+ADs

This is another usage close to the DEFINE+AF8-TESTOP() pattern.

+AD4 +-
+AD4 +-	return prev+ADs
+AD4 +-+AH0
+AD4 +-
+AD4  static struct qnode +ACo-get+AF8-tail+AF8-qnode(struct qspinlock +ACo-lock, u32 val)
+AD4  +AHs
+AD4  	int cpu +AD0 get+AF8-tail+AF8-cpu(val)+ADs
+AD4 +AEAAQA -165,6 +-188,9 +AEAAQA static inline bool try+AF8-to+AF8-steal+AF8-lock(struct qspinlock +ACo-lock)
+AD4  	for (+ADsAOw) +AHs
+AD4  		u32 val +AD0 READ+AF8-ONCE(lock-+AD4-val)+ADs
+AD4  
+AD4 +-		if (val +ACY +AF8-Q+AF8-MUST+AF8-Q+AF8-VAL)
+AD4 +-			break+ADs
+AD4 +-
+AD4  		if (unlikely(+ACE(val +ACY +AF8-Q+AF8-LOCKED+AF8-VAL))) +AHs
+AD4  			if (trylock+AF8-with+AF8-tail+AF8-cpu(lock, val))
+AD4  				return true+ADs
+AD4 +AEAAQA -246,11 +-272,22 +AEAAQA static inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock)
+AD4  		/+ACo We must be the owner, just set the lock bit and acquire +ACo-/
+AD4  		lock+AF8-set+AF8-locked(lock)+ADs
+AD4  	+AH0 else +AHs
+AD4 +-		int iters +AD0 0+ADs
+AD4 +-		bool set+AF8-mustq +AD0 false+ADs
+AD4 +-
+AD4  again:
+AD4  		/+ACo We're at the head of the waitqueue, wait for the lock. +ACo-/
+AD4 -		while ((val +AD0 READ+AF8-ONCE(lock-+AD4-val)) +ACY +AF8-Q+AF8-LOCKED+AF8-VAL)
+AD4 +-		while ((val +AD0 READ+AF8-ONCE(lock-+AD4-val)) +ACY +AF8-Q+AF8-LOCKED+AF8-VAL) +AHs
+AD4  			cpu+AF8-relax()+ADs
+AD4  
+AD4 +-			iters+-+-+ADs

It seems instead of using set+AF8-mustq, (val +ACY +AF8-Q+AF8-MUST+AF8-Q+AF8-VAL) could be checked?

+AD4 +-			if (+ACE-set+AF8-mustq +ACYAJg iters +AD4APQ get+AF8-head+AF8-spins()) +AHs
+AD4 +-				set+AF8-mustq +AD0 true+ADs
+AD4 +-				lock+AF8-set+AF8-mustq(lock)+ADs
+AD4 +-				val +AHwAPQ +AF8-Q+AF8-MUST+AF8-Q+AF8-VAL+ADs
+AD4 +-			+AH0
+AD4 +-		+AH0
+AD4 +-
+AD4  		/+ACo If we're the last queued, must clean up the tail. +ACo-/
+AD4  		if ((val +ACY +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK) +AD0APQ tail) +AHs
+AD4  			if (trylock+AF8-clear+AF8-tail+AF8-cpu(lock, val))
+AD4 +AEAAQA -329,9 +-366,26 +AEAAQA static int steal+AF8-spins+AF8-get(void +ACo-data, u64 +ACo-val)
+AD4  
+AD4  DEFINE+AF8-SIMPLE+AF8-ATTRIBUTE(fops+AF8-steal+AF8-spins, steal+AF8-spins+AF8-get, steal+AF8-spins+AF8-set, +ACIAJQ-llu+AFw-n+ACI)+ADs
+AD4  
+AD4 +-static int head+AF8-spins+AF8-set(void +ACo-data, u64 val)
+AD4 +-+AHs
+AD4 +-	HEAD+AF8-SPINS +AD0 val+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static int head+AF8-spins+AF8-get(void +ACo-data, u64 +ACo-val)
+AD4 +-+AHs
+AD4 +-	+ACo-val +AD0 HEAD+AF8-SPINS+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-DEFINE+AF8-SIMPLE+AF8-ATTRIBUTE(fops+AF8-head+AF8-spins, head+AF8-spins+AF8-get, head+AF8-spins+AF8-set, +ACIAJQ-llu+AFw-n+ACI)+ADs
+AD4 +-
+AD4  static +AF8AXw-init int spinlock+AF8-debugfs+AF8-init(void)
+AD4  +AHs
+AD4  	debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-steal+AF8-spins+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-steal+AF8-spins)+ADs
+AD4 +-	debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-head+AF8-spins+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-head+AF8-spins)+ADs
+AD4  
+AD4  	return 0+ADs
+AD4  +AH0

