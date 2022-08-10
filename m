Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3A358E57A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 05:28:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2b4x1qcCz3bxC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 13:28:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mTJ72JeH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mTJ72JeH;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2b4C6dtNz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Aug 2022 13:28:09 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id h21-20020a17090aa89500b001f31a61b91dso840242pjq.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Aug 2022 20:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=ltomoN/n6UFNHBOBgypSoIshfxnv4rPWHeboNxw0ykU=;
        b=mTJ72JeH4UYb0t29O/8XdYxszv4SmuiJle+yGhXFp4CUmsWo0zGtzZg/c3WKApD+qm
         RFr82tTddxEa4ev93rZYOFX4aTMq7FstJ/JE+TG0Ar3MsAxlP9Zsrk5vWu+5BrdYkPlP
         Mmf0l865vWq3OJdAL2AKMmZZMkoC2m+fxp8K38vYQRmrt8O0toWqk/JVMNeUpCgSFvdE
         5u+117iKzcfviIVTXwcC+md+ZLzwDZ2g0/plwT/k12C0mmkFbsowD1bmo5VlblmeAihr
         BKFJxT/kvLueefiTj2Js8cH9MXvmLDfnjJj4swsblfwXevpWFWpdmsu2bliqhbCiS9Z6
         G/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=ltomoN/n6UFNHBOBgypSoIshfxnv4rPWHeboNxw0ykU=;
        b=i0J4Z08sR03EdrtPEsqE1LO28kK/A2JlkksRTqeczNUO6HfAMZ0OkVKYJInpMvPwgF
         +b6zASEaPDcmJHOh74NdtP1tGmbwHsBMnyf2rhcFOSFJnqUqlj+cgUpLuvMHx1AC4wq1
         cmxHSFBWLEyyA7SeDAix3L1wm64D/b7tJ1kpAJVhgShU3OuI2VDOdpd2+iDMtzwvdamL
         SRcFRAldnlY1m/PEvKmPXefALf3aa5FVovvgUhs0tSV2ZMG7OOoME/t71Qcz0K1jIiIL
         B8iVwBB0TjtknbIEFOiQ96BjHvvzwaKyLbu3yCjEd3jcMlILscGpYV8J+478vVNhJuyj
         wLVw==
X-Gm-Message-State: ACgBeo2OIjrrwyJ03AUQyxPVX0Uwd5i+3EUPRJgExx/E760dow9tADeC
	gxKgtJ+HMGXFWIjJZkJA7qc=
X-Google-Smtp-Source: AA6agR6S0K0gjl49xguwK6/tBzoncVZELRigPhLzNmrNhFBVd1YfoMlQopbvE4ITPXfIS4vtSMBY6Q==
X-Received: by 2002:a17:90a:6281:b0:1f2:1f17:4023 with SMTP id d1-20020a17090a628100b001f21f174023mr1535649pjj.243.1660102087269;
        Tue, 09 Aug 2022 20:28:07 -0700 (PDT)
Received: from tee480 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
        by smtp.googlemail.com with ESMTPSA id a75-20020a621a4e000000b00525302fe9c4sm630832pfa.190.2022.08.09.20.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 20:28:06 -0700 (PDT)
Message-ID: <d81a5c22db2bfd67459cefdd28aeb495eb50d6f3.camel@gmail.com>
Subject: Re: [PATCH 03/17] powerpc/qspinlock: use a half-word store to
 unlock to avoid larx/stcx.
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 10 Aug 2022 13:28:02 +1000
In-Reply-To: <20220728063120.2867508-5-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-5-npiggin@gmail.com>
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
+AD4 The first 16 bits of the lock are only modified by the owner, and other
+AD4 modifications always use atomic operations on the entire 32 bits, so
+AD4 unlocks can use plain stores on the 16 bits. This is the same kind of
+AD4 optimisation done by core qspinlock code.
+AD4 ---
+AD4  arch/powerpc/include/asm/qspinlock.h       +AHw  6 +------
+AD4  arch/powerpc/include/asm/qspinlock+AF8-types.h +AHw 19 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+---
+AD4  2 files changed, 18 insertions(+-), 7 deletions(-)
+AD4 
+AD4 diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
+AD4 index f06117aa60e1..79a1936fb68d 100644
+AD4 --- a/arch/powerpc/include/asm/qspinlock.h
+AD4 +-+-+- b/arch/powerpc/include/asm/qspinlock.h
+AD4 +AEAAQA -38,11 +-38,7 +AEAAQA static +AF8AXw-always+AF8-inline void queued+AF8-spin+AF8-lock(struct qspinlock +ACo-lock)
+AD4  
+AD4  static inline void queued+AF8-spin+AF8-unlock(struct qspinlock +ACo-lock)
+AD4  +AHs
+AD4 -	for (+ADsAOw) +AHs
+AD4 -		int val +AD0 atomic+AF8-read(+ACY-lock-+AD4-val)+ADs
+AD4 -		if (atomic+AF8-cmpxchg+AF8-release(+ACY-lock-+AD4-val, val, val +ACY +AH4AXw-Q+AF8-LOCKED+AF8-VAL) +AD0APQ val)
+AD4 -			return+ADs
+AD4 -	+AH0
+AD4 +-	smp+AF8-store+AF8-release(+ACY-lock-+AD4-locked, 0)+ADs

Is it also possible for lock+AF8-set+AF8-locked() to use a non-atomic acquire
operation?

+AD4  +AH0
+AD4  
+AD4  +ACM-define arch+AF8-spin+AF8-is+AF8-locked(l)		queued+AF8-spin+AF8-is+AF8-locked(l)
+AD4 diff --git a/arch/powerpc/include/asm/qspinlock+AF8-types.h b/arch/powerpc/include/asm/qspinlock+AF8-types.h
+AD4 index 9630e714c70d..3425dab42576 100644
+AD4 --- a/arch/powerpc/include/asm/qspinlock+AF8-types.h
+AD4 +-+-+- b/arch/powerpc/include/asm/qspinlock+AF8-types.h
+AD4 +AEAAQA -3,12 +-3,27 +AEAAQA
+AD4  +ACM-define +AF8-ASM+AF8-POWERPC+AF8-QSPINLOCK+AF8-TYPES+AF8-H
+AD4  
+AD4  +ACM-include +ADw-linux/types.h+AD4
+AD4 +-+ACM-include +ADw-asm/byteorder.h+AD4
+AD4  
+AD4  typedef struct qspinlock +AHs
+AD4 -	atomic+AF8-t val+ADs
+AD4 +-	union +AHs
+AD4 +-		atomic+AF8-t val+ADs
+AD4 +-
+AD4 +-+ACM-ifdef +AF8AXw-LITTLE+AF8-ENDIAN
+AD4 +-		struct +AHs
+AD4 +-			u16	locked+ADs
+AD4 +-			u8	reserved+AFs-2+AF0AOw
+AD4 +-		+AH0AOw
+AD4 +-+ACM-else
+AD4 +-		struct +AHs
+AD4 +-			u8	reserved+AFs-2+AF0AOw
+AD4 +-			u16	locked+ADs
+AD4 +-		+AH0AOw
+AD4 +-+ACM-endif
+AD4 +-	+AH0AOw
+AD4  +AH0 arch+AF8-spinlock+AF8-t+ADs

Just to double check we have:

+ACM-define +AF8-Q+AF8-LOCKED+AF8-OFFSET	0
+ACM-define +AF8-Q+AF8-LOCKED+AF8-BITS		1
+ACM-define +AF8-Q+AF8-LOCKED+AF8-MASK		0x00000001
+ACM-define +AF8-Q+AF8-LOCKED+AF8-VAL		1

+ACM-define +AF8-Q+AF8-TAIL+AF8-CPU+AF8-OFFSET	16
+ACM-define +AF8-Q+AF8-TAIL+AF8-CPU+AF8-BITS	16
+ACM-define +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK	0xffff0000


so the ordering here looks correct.

+AD4  
+AD4 -+ACM-define	+AF8AXw-ARCH+AF8-SPIN+AF8-LOCK+AF8-UNLOCKED	+AHs .val +AD0 ATOMIC+AF8-INIT(0) +AH0
+AD4 +-+ACM-define	+AF8AXw-ARCH+AF8-SPIN+AF8-LOCK+AF8-UNLOCKED	+AHs +AHs .val +AD0 ATOMIC+AF8-INIT(0) +AH0 +AH0
+AD4  
+AD4  /+ACo
+AD4   +ACo Bitfields in the atomic value:

