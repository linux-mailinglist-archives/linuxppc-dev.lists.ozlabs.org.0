Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB53E5909AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 02:50:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3lTm11cBz3c3G
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 10:50:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Rpor5l1f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Rpor5l1f;
	dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3lT83qhWz2xHd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 10:50:19 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id h28so17849419pfq.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 17:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=G2p6/Kab/fRWEw/A2CWz4sHK+o5cZ6MdDfBvAEmzUMc=;
        b=Rpor5l1fp/k7GAwGV48KE4+ZgsO2X7KIodwKrNhEVDf6JkFT1A0pbPjnBBZgnmjcAi
         9SCv/kok9AnMt4REaaUbZUBI7c7jiEf4VxS2N40LAP4N7gLzLpthUkCn0ds9FXd7IyqG
         2DyC1gEGGuxNQ18kNPOViy3SYbhjy4Q4oJUHaQyiqDJ7NOsuh/khIfvlRkLPv+RQ0QSO
         ynQyKwWH116/WokCbEPgq/LNDqcdNyfgAZ0X7j6h4NuH4R/AY0lmPVY4GKOafs75tRB8
         Ed3rTvg0FeNnP8KdCdjwaXhklFHf0IlB6X5EF90+JyAYKlT4FEzN6dnMPU67hK8jvM18
         TAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=G2p6/Kab/fRWEw/A2CWz4sHK+o5cZ6MdDfBvAEmzUMc=;
        b=q5H7lVMY18CuG8IuCTIJb+ob7aRuxAY0lnaSQBAhpIDZA1bM3w7GyfeOIsQtI4c5ZE
         moxFVTJBLPyv79MFfp2vowAwpUxopnL+wtuzzmJXPTaFVOn9fLjHp6kDFPfNVoTUmGXt
         dg/1VBYoGfkWkebnOg9TQ/P/3qR9eOAd68Ql69wHzQlej0Yyr5SPci6PyDL7xDxE8pod
         37/Vbdu94bJz6KeJ1fp3L5Wm+J4Nk2SEATf+sbxqU/nLUwJmc/RbxtO2oTfkoMhaFR6K
         H+yQCoPQJvL/Dq7iAU/4DHTu9yQLebGbK2sscV0nL9IiepwrBGucLMkmXxQ8UBo0ADk3
         3HEw==
X-Gm-Message-State: ACgBeo3qDBTz2pFz8A8uIW0jXqkHE5PzxFW79fmE3ObEtq2IzslwgZAO
	pYda1sdsGmVs/Yrh8Z0Bc7M=
X-Google-Smtp-Source: AA6agR4YswxMRSJLwaWd5OiX4HP9QvjusemTq/c2CVY3WvVEt5nhFyIsNUg1p7HDkVRuO9lmVIB2+w==
X-Received: by 2002:a63:83c1:0:b0:41d:9e78:ff44 with SMTP id h184-20020a6383c1000000b0041d9e78ff44mr1235396pge.22.1660265416537;
        Thu, 11 Aug 2022 17:50:16 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id l9-20020a170903120900b0016cf3f124e5sm290029plh.131.2022.08.11.17.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 17:50:15 -0700 (PDT)
Message-ID: <82caa10262d24c7484dd8caaff28c7d547858c43.camel@gmail.com>
Subject: Re: [PATCH 07/17] powerpc/qspinlock: store owner CPU in lock word
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 12 Aug 2022 10:50:12 +1000
In-Reply-To: <20220728063120.2867508-9-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-9-npiggin@gmail.com>
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
+AD4 Store the owner CPU number in the lock word so it may be yielded to,
+AD4 as powerpc's paravirtualised simple spinlocks do.
+AD4 ---
+AD4  arch/powerpc/include/asm/qspinlock.h       +AHw  8 +-+-+-+-+-+-+--
+AD4  arch/powerpc/include/asm/qspinlock+AF8-types.h +AHw 10 +-+-+-+-+-+-+-+-+-+-
+AD4  arch/powerpc/lib/qspinlock.c               +AHw  6 +-+-+----
+AD4  3 files changed, 20 insertions(+-), 4 deletions(-)
+AD4 
+AD4 diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
+AD4 index 3ab354159e5e..44601b261e08 100644
+AD4 --- a/arch/powerpc/include/asm/qspinlock.h
+AD4 +-+-+- b/arch/powerpc/include/asm/qspinlock.h
+AD4 +AEAAQA -20,9 +-20,15 +AEAAQA static +AF8AXw-always+AF8-inline int queued+AF8-spin+AF8-is+AF8-contended(struct qspinlock +ACo-lock)
+AD4  	return +ACEAIQ(READ+AF8-ONCE(lock-+AD4-val) +ACY +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK)+ADs
+AD4  +AH0
+AD4  
+AD4 +-static +AF8AXw-always+AF8-inline u32 queued+AF8-spin+AF8-get+AF8-locked+AF8-val(void)

Maybe this function should have +ACI-encode+ACI in the name to match with
encode+AF8-tail+AF8-cpu().


+AD4 +-+AHs
+AD4 +-	/+ACo XXX: make this use lock value in paca like simple spinlocks? +ACo-/

Is that the paca's lock+AF8-token which is 0x8000?


+AD4 +-	return +AF8-Q+AF8-LOCKED+AF8-VAL +AHw (smp+AF8-processor+AF8-id() +ADwAPA +AF8-Q+AF8-OWNER+AF8-CPU+AF8-OFFSET)+ADs
+AD4 +-+AH0
+AD4 +-
+AD4  static +AF8AXw-always+AF8-inline int queued+AF8-spin+AF8-trylock(struct qspinlock +ACo-lock)
+AD4  +AHs
+AD4 -	u32 new +AD0 +AF8-Q+AF8-LOCKED+AF8-VAL+ADs
+AD4 +-	u32 new +AD0 queued+AF8-spin+AF8-get+AF8-locked+AF8-val()+ADs
+AD4  	u32 prev+ADs
+AD4  
+AD4  	asm volatile(
+AD4 diff --git a/arch/powerpc/include/asm/qspinlock+AF8-types.h b/arch/powerpc/include/asm/qspinlock+AF8-types.h
+AD4 index 8b20f5e22bba..35f9525381e6 100644
+AD4 --- a/arch/powerpc/include/asm/qspinlock+AF8-types.h
+AD4 +-+-+- b/arch/powerpc/include/asm/qspinlock+AF8-types.h
+AD4 +AEAAQA -29,6 +-29,8 +AEAAQA typedef struct qspinlock +AHs
+AD4   +ACo Bitfields in the lock word:
+AD4   +ACo
+AD4   +ACo     0: locked bit
+AD4 +- +ACo  1-14: lock holder cpu
+AD4 +- +ACo    15: unused bit
+AD4   +ACo    16: must queue bit
+AD4   +ACo 17-31: tail cpu (+-1)

So there is one more bit to store the tail cpu vs the lock holder cpu?

+AD4   +ACo-/
+AD4 +AEAAQA -39,6 +-41,14 +AEAAQA typedef struct qspinlock +AHs
+AD4  +ACM-define +AF8-Q+AF8-LOCKED+AF8-MASK		+AF8-Q+AF8-SET+AF8-MASK(LOCKED)
+AD4  +ACM-define +AF8-Q+AF8-LOCKED+AF8-VAL		(1U +ADwAPA +AF8-Q+AF8-LOCKED+AF8-OFFSET)
+AD4  
+AD4 +-+ACM-define +AF8-Q+AF8-OWNER+AF8-CPU+AF8-OFFSET	1
+AD4 +-+ACM-define +AF8-Q+AF8-OWNER+AF8-CPU+AF8-BITS	14
+AD4 +-+ACM-define +AF8-Q+AF8-OWNER+AF8-CPU+AF8-MASK	+AF8-Q+AF8-SET+AF8-MASK(OWNER+AF8-CPU)
+AD4 +-
+AD4 +-+ACM-if CONFIG+AF8-NR+AF8-CPUS +AD4 (1U +ADwAPA +AF8-Q+AF8-OWNER+AF8-CPU+AF8-BITS)
+AD4 +-+ACM-error +ACI-qspinlock does not support such large CONFIG+AF8-NR+AF8-CPUS+ACI
+AD4 +-+ACM-endif
+AD4 +-
+AD4  +ACM-define +AF8-Q+AF8-MUST+AF8-Q+AF8-OFFSET	16
+AD4  +ACM-define +AF8-Q+AF8-MUST+AF8-Q+AF8-BITS		1
+AD4  +ACM-define +AF8-Q+AF8-MUST+AF8-Q+AF8-MASK		+AF8-Q+AF8-SET+AF8-MASK(MUST+AF8-Q)
+AD4 diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
+AD4 index a906cc8f15fa..aa26cfe21f18 100644
+AD4 --- a/arch/powerpc/lib/qspinlock.c
+AD4 +-+-+- b/arch/powerpc/lib/qspinlock.c
+AD4 +AEAAQA -50,7 +-50,7 +AEAAQA static inline int get+AF8-tail+AF8-cpu(u32 val)
+AD4  /+ACo Take the lock by setting the lock bit, no other CPUs will touch it. +ACo-/
+AD4  static +AF8AXw-always+AF8-inline void lock+AF8-set+AF8-locked(struct qspinlock +ACo-lock)
+AD4  +AHs
+AD4 -	u32 new +AD0 +AF8-Q+AF8-LOCKED+AF8-VAL+ADs
+AD4 +-	u32 new +AD0 queued+AF8-spin+AF8-get+AF8-locked+AF8-val()+ADs
+AD4  	u32 prev+ADs
+AD4  
+AD4  	asm volatile(
+AD4 +AEAAQA -68,7 +-68,7 +AEAAQA static +AF8AXw-always+AF8-inline void lock+AF8-set+AF8-locked(struct qspinlock +ACo-lock)
+AD4  /+ACo Take lock, clearing tail, cmpxchg with old (which must not be locked) +ACo-/
+AD4  static +AF8AXw-always+AF8-inline int trylock+AF8-clear+AF8-tail+AF8-cpu(struct qspinlock +ACo-lock, u32 old)
+AD4  +AHs
+AD4 -	u32 new +AD0 +AF8-Q+AF8-LOCKED+AF8-VAL+ADs
+AD4 +-	u32 new +AD0 queued+AF8-spin+AF8-get+AF8-locked+AF8-val()+ADs
+AD4  	u32 prev+ADs
+AD4  
+AD4  	BUG+AF8-ON(old +ACY +AF8-Q+AF8-LOCKED+AF8-VAL)+ADs
+AD4 +AEAAQA -116,7 +-116,7 +AEAAQA static +AF8AXw-always+AF8-inline u32 +AF8AXw-trylock+AF8-cmpxchg(struct qspinlock +ACo-lock, u32 old, u3
+AD4  /+ACo Take lock, preserving tail, cmpxchg with val (which must not be locked) +ACo-/
+AD4  static +AF8AXw-always+AF8-inline int trylock+AF8-with+AF8-tail+AF8-cpu(struct qspinlock +ACo-lock, u32 val)
+AD4  +AHs
+AD4 -	u32 newval +AD0 +AF8-Q+AF8-LOCKED+AF8-VAL +AHw (val +ACY +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK)+ADs
+AD4 +-	u32 newval +AD0 queued+AF8-spin+AF8-get+AF8-locked+AF8-val() +AHw (val +ACY +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK)+ADs
+AD4  
+AD4  	if (+AF8AXw-trylock+AF8-cmpxchg(lock, val, newval) +AD0APQ val)
+AD4  		return 1+ADs

