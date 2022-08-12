Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D37590B31
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 06:33:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3rQY4jDSz3c6S
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 14:33:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=p9G7jaXU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=p9G7jaXU;
	dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3rPx4qhRz2xHd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 14:32:52 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id g12so18228395pfb.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 21:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=vlP+DpoPDTPEvHn7EBy5iCymTHL802NCeyGZP8IN6fA=;
        b=p9G7jaXUBx0n7Cz8YOX1YdYJ1K586VHuW7QQFgBBU573+BSDJUYgCUvzKdU8Scxm6t
         UoCNXBebczrdnDxfEMQyR3W8B01eYoIW8H1dVr5NXS33yDxhJ8PIenkrO3PUEzFg0F9K
         n9/nugxy+wOOnsmINNCA1t4p/gnARHCsXjs0yLb0YS0pH7gGMHbA5esI9dri7nhiOgYG
         wqpI1h/BJvi7ekQ6zvCnyGtW+qo94Z2DzPtduYsgQwaB/AwQaWeTAzyNOuREWsibg4MC
         9T1iu4giYYGPftvmCNVkNgHpOQunLP7aLcrSfD5kU+XVkpjMjDrJiFHp/Yb6mYanEelr
         ExiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=vlP+DpoPDTPEvHn7EBy5iCymTHL802NCeyGZP8IN6fA=;
        b=lLJrigECzYiFxm11pRm7I4d4YBi7OLbDQqR78HaezMtPxPoE2gXBIN2T+4f5jMzbX1
         wTPY6yIM4bZVO2k9+vKSWfGClrjlxZ3nIVsL7LAEQOQSt0G33mHjNxADltD/LAbS8Rsu
         Y/gQ5bfjSYP4DJTnj4BlDNrIsJU6l9ny/0In+acIUWR4PpW7imGOttRcXI/sf2Xmvcgh
         PzfB1nCTQbSGfpcs/eF9YFHNNaKfNB6WvdUgG4SX0mTN9lfKP7DQ++0mIKE4n0ohkGeO
         iRWVmL1E8gB4v0BlRoJXmcpzs/iKmUDx1J1k6IR0pg5RbnWJ9Fsy2nKpqjJZI4WMy9p0
         hXeQ==
X-Gm-Message-State: ACgBeo3EHzEAG/TQkVz6ORAcxlEiyRemQRa+Cuv5TparuuL+9t2ln8wN
	p3dHPwMlvzpJHiVHzViAJaJJOoVbxEc=
X-Google-Smtp-Source: AA6agR6PKRWcmRwI14/El/fSxSRoEZHMvOLOLwyeI9IkFj7PSYSdYFA8qkiIiHS4VUMG2biNGSyKMg==
X-Received: by 2002:a05:6a00:b44:b0:52e:d959:c05b with SMTP id p4-20020a056a000b4400b0052ed959c05bmr1963097pfo.22.1660278769655;
        Thu, 11 Aug 2022 21:32:49 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id h9-20020a170902f7c900b0016c4fb6e0b2sm560490plw.55.2022.08.11.21.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 21:32:49 -0700 (PDT)
Message-ID: <1ba246c5b5961284fe622853d40b4e5a6b4853a0.camel@gmail.com>
Subject: Re: [PATCH 13/17] powerpc/qspinlock: trylock and initial lock
 attempt may steal
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 12 Aug 2022 14:32:45 +1000
In-Reply-To: <20220728063120.2867508-15-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-15-npiggin@gmail.com>
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
+AD4 This gives trylock slightly more strength, and it also gives most
+AD4 of the benefit of passing 'val' back through the slowpath without
+AD4 the complexity.
+AD4 ---
+AD4  arch/powerpc/include/asm/qspinlock.h +AHw 39 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
+AD4  arch/powerpc/lib/qspinlock.c         +AHw  9 +-+-+-+-+-+-+-
+AD4  2 files changed, 47 insertions(+-), 1 deletion(-)
+AD4 
+AD4 diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
+AD4 index 44601b261e08..d3d2039237b2 100644
+AD4 --- a/arch/powerpc/include/asm/qspinlock.h
+AD4 +-+-+- b/arch/powerpc/include/asm/qspinlock.h
+AD4 +AEAAQA -5,6 +-5,8 +AEAAQA
+AD4  +ACM-include +ADw-linux/compiler.h+AD4
+AD4  +ACM-include +ADw-asm/qspinlock+AF8-types.h+AD4
+AD4  
+AD4 +-+ACM-define +AF8-Q+AF8-SPIN+AF8-TRY+AF8-LOCK+AF8-STEAL 1

Would this be a config option?

+AD4 +-
+AD4  static +AF8AXw-always+AF8-inline int queued+AF8-spin+AF8-is+AF8-locked(struct qspinlock +ACo-lock)
+AD4  +AHs
+AD4  	return READ+AF8-ONCE(lock-+AD4-val)+ADs
+AD4 +AEAAQA -26,11 +-28,12 +AEAAQA static +AF8AXw-always+AF8-inline u32 queued+AF8-spin+AF8-get+AF8-locked+AF8-val(void)
+AD4  	return +AF8-Q+AF8-LOCKED+AF8-VAL +AHw (smp+AF8-processor+AF8-id() +ADwAPA +AF8-Q+AF8-OWNER+AF8-CPU+AF8-OFFSET)+ADs
+AD4  +AH0
+AD4  
+AD4 -static +AF8AXw-always+AF8-inline int queued+AF8-spin+AF8-trylock(struct qspinlock +ACo-lock)
+AD4 +-static +AF8AXw-always+AF8-inline int +AF8AXw-queued+AF8-spin+AF8-trylock+AF8-nosteal(struct qspinlock +ACo-lock)
+AD4  +AHs
+AD4  	u32 new +AD0 queued+AF8-spin+AF8-get+AF8-locked+AF8-val()+ADs
+AD4  	u32 prev+ADs
+AD4  
+AD4 +-	/+ACo Trylock succeeds only when unlocked and no queued nodes +ACo-/
+AD4  	asm volatile(
+AD4  +ACI-1:	lwarx	+ACU-0,0,+ACU-1,+ACU-3	+ACM queued+AF8-spin+AF8-trylock			+AFw-n+ACI

s/queued+AF8-spin+AF8-trylock/+AF8AXw-queued+AF8-spin+AF8-trylock+AF8-nosteal

+AD4  +ACI	cmpwi	0,+ACU-0,0							+AFw-n+ACI
+AD4 +AEAAQA -49,6 +-52,40 +AEAAQA static +AF8AXw-always+AF8-inline int queued+AF8-spin+AF8-trylock(struct qspinlock +ACo-lock)
+AD4  	return 0+ADs
+AD4  +AH0
+AD4  
+AD4 +-static +AF8AXw-always+AF8-inline int +AF8AXw-queued+AF8-spin+AF8-trylock+AF8-steal(struct qspinlock +ACo-lock)
+AD4 +-+AHs
+AD4 +-	u32 new +AD0 queued+AF8-spin+AF8-get+AF8-locked+AF8-val()+ADs
+AD4 +-	u32 prev, tmp+ADs
+AD4 +-
+AD4 +-	/+ACo Trylock may get ahead of queued nodes if it finds unlocked +ACo-/
+AD4 +-	asm volatile(
+AD4 +-+ACI-1:	lwarx	+ACU-0,0,+ACU-2,+ACU-5	+ACM queued+AF8-spin+AF8-trylock			+AFw-n+ACI

s/queued+AF8-spin+AF8-trylock/+AF8AXw-queued+AF8-spin+AF8-trylock+AF8-steal

+AD4 +-+ACI	andc.	+ACU-1,+ACU-0,+ACU-4						+AFw-n+ACI
+AD4 +-+ACI	bne-	2f							+AFw-n+ACI
+AD4 +-+ACI	and	+ACU-1,+ACU-0,+ACU-4						+AFw-n+ACI
+AD4 +-+ACI	or	+ACU-1,+ACU-1,+ACU-3						+AFw-n+ACI
+AD4 +-+ACI	stwcx.	+ACU-1,0,+ACU-2							+AFw-n+ACI
+AD4 +-+ACI	bne-	1b							+AFw-n+ACI
+AD4 +-+ACIAXA-t+ACI	PPC+AF8-ACQUIRE+AF8-BARRIER +ACI						+AFw-n+ACI
+AD4 +-+ACI-2:									+AFw-n+ACI

Just because there's a little bit more going on here...

Q+AF8-TAIL+AF8-CPU+AF8-MASK +AD0 0xFFFE0000
+AH4-Q+AF8-TAIL+AF8-CPU+AF8-MASK +AD0 0x1FFFF


1:	lwarx	prev, 0, +ACY-lock-+AD4-val, IS+AF8-ENABLED+AF8-PPC64
	andc.	tmp, prev, +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK 	(tmp +AD0 prev +ACY +AH4AXw-Q+AF8-TAIL+AF8-CPU+AF8-MASK)
	bne-	2f 				(exit if locked)
	and	tmp, prev, +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK 	(tmp +AD0 prev +ACY +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK)
	or	tmp, tmp, new			(tmp +AHwAPQ new)					
	stwcx.	tmp, 0, +ACY-lock-+AD4-val					
		
	bne-	1b							
	PPC+AF8-ACQUIRE+AF8-BARRIER		
2:

... which seems correct.


+AD4 +-	: +ACIAPQAm-r+ACI (prev), +ACIAPQAm-r+ACI (tmp)
+AD4 +-	: +ACI-r+ACI (+ACY-lock-+AD4-val), +ACI-r+ACI (new), +ACI-r+ACI (+AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK),
+AD4 +-	  +ACI-i+ACI (IS+AF8-ENABLED(CONFIG+AF8-PPC64) ? 1 : 0)
+AD4 +-	: +ACI-cr0+ACI, +ACI-memory+ACI)+ADs
+AD4 +-
+AD4 +-	if (likely(+ACE(prev +ACY +AH4AXw-Q+AF8-TAIL+AF8-CPU+AF8-MASK)))
+AD4 +-		return 1+ADs
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static +AF8AXw-always+AF8-inline int queued+AF8-spin+AF8-trylock(struct qspinlock +ACo-lock)
+AD4 +-+AHs
+AD4 +-	if (+ACEAXw-Q+AF8-SPIN+AF8-TRY+AF8-LOCK+AF8-STEAL)
+AD4 +-		return +AF8AXw-queued+AF8-spin+AF8-trylock+AF8-nosteal(lock)+ADs
+AD4 +-	else
+AD4 +-		return +AF8AXw-queued+AF8-spin+AF8-trylock+AF8-steal(lock)+ADs
+AD4 +-+AH0
+AD4 +-
+AD4  void queued+AF8-spin+AF8-lock+AF8-slowpath(struct qspinlock +ACo-lock)+ADs
+AD4  
+AD4  static +AF8AXw-always+AF8-inline void queued+AF8-spin+AF8-lock(struct qspinlock +ACo-lock)
+AD4 diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
+AD4 index 3b10e31bcf0a..277aef1fab0a 100644
+AD4 --- a/arch/powerpc/lib/qspinlock.c
+AD4 +-+-+- b/arch/powerpc/lib/qspinlock.c
+AD4 +AEAAQA -24,7 +-24,11 +AEAAQA struct qnodes +AHs
+AD4  
+AD4  /+ACo Tuning parameters +ACo-/
+AD4  static int STEAL+AF8-SPINS +AF8AXw-read+AF8-mostly +AD0 (1+ADwAPA-5)+ADs
+AD4 +-+ACM-if +AF8-Q+AF8-SPIN+AF8-TRY+AF8-LOCK+AF8-STEAL +AD0APQ 1
+AD4 +-static const bool MAYBE+AF8-STEALERS +AD0 true+ADs
+AD4 +-+ACM-else
+AD4  static bool MAYBE+AF8-STEALERS +AF8AXw-read+AF8-mostly +AD0 true+ADs
+AD4 +-+ACM-endif
+AD4  static int HEAD+AF8-SPINS +AF8AXw-read+AF8-mostly +AD0 (1+ADwAPA-8)+ADs
+AD4  
+AD4  static bool pv+AF8-yield+AF8-owner +AF8AXw-read+AF8-mostly +AD0 true+ADs
+AD4 +AEAAQA -522,6 +-526,10 +AEAAQA void pv+AF8-spinlocks+AF8-init(void)
+AD4  +ACM-include +ADw-linux/debugfs.h+AD4
+AD4  static int steal+AF8-spins+AF8-set(void +ACo-data, u64 val)
+AD4  +AHs
+AD4 +-+ACM-if +AF8-Q+AF8-SPIN+AF8-TRY+AF8-LOCK+AF8-STEAL +AD0APQ 1
+AD4 +-	/+ACo MAYBE+AF8-STEAL remains true +ACo-/
+AD4 +-	STEAL+AF8-SPINS +AD0 val+ADs
+AD4 +-+ACM-else
+AD4  	static DEFINE+AF8-MUTEX(lock)+ADs
+AD4  
+AD4  	mutex+AF8-lock(+ACY-lock)+ADs
+AD4 +AEAAQA -539,6 +-547,7 +AEAAQA static int steal+AF8-spins+AF8-set(void +ACo-data, u64 val)
+AD4  		STEAL+AF8-SPINS +AD0 val+ADs
+AD4  	+AH0
+AD4  	mutex+AF8-unlock(+ACY-lock)+ADs
+AD4 +-+ACM-endif
+AD4  
+AD4  	return 0+ADs
+AD4  +AH0

