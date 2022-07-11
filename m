Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B46CA56D331
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:05:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh8084wk7z3ch3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:05:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lnMfsmkp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lnMfsmkp;
	dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh7zP0Gd4z3c3B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:05:04 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id e16so3685330pfm.11
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 20:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oHM//PYg1x3gMyrl0sYm4xEvz2lJTvH/CIhChokrqKU=;
        b=lnMfsmkpoaNz7D1ySYO1W55AVHbwpxXbDPBNzvrbevQ4hgIiIiVSIclmHfvskTv4W0
         vgSF6t/1H8C0Taf7wjSldNKHK/jX/svKjSEKtuA22DnZf8YbUL3KhaKovzvnM+VcQDJv
         rwiIXlBjc4E2C8eRXPWHRrP+aSOXhc8/maS+ewgQTQ/E1i1DGwN7K6AIitssPgkLajes
         LuWSZA50tVYPAc0bWsFlRFDJ3j3IHZBcHRwuApDD5eWeHPgRVR54zNbdFwIoN5nloz+P
         kamRQ1uKswLKDUWcSd3Yeg1rXI7O5TNnUyY8VJpP4jdvN6wc14l7qIBp1NtE2sfkg6Lt
         NXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oHM//PYg1x3gMyrl0sYm4xEvz2lJTvH/CIhChokrqKU=;
        b=Q3/zEcPOV//j93/huyjss1Vp8Gx85KlD0zKI6T1aOMRc89c8M0MBCCnq/wSCU2Bgd9
         H7x73fezPIZqZZtDnmgTJWAkMwDCt05xchCqutiehFg0H0D4fHXUyqL/ls0i/iJgMI7w
         ERCOmi1sZypYANVJR9PnL1iyep2x/xSHhLrSZaNPqY4PktljWztZxTwp+i9uFXausE0p
         ho3U8XJ5mDdW0mz5N0HkLycpRSZh3o2DtHiJaPe3mFw6EmiMgbGrSWSftBvxa6T9tRur
         eVVozn7lXxDjzl9j/ar6Emf7Ccq5lszqJWdyyyBT/XkcF3+JFDseRe5+PTA+k02jc6P+
         GC+A==
X-Gm-Message-State: AJIora8vGbZFwKC1RAbN7hSQ9GRnZTuNSXVFmZfihuc0RPe387pLEAzk
	LZtp2IL30L7a0O2A3K3tAfQvKdo9cVg=
X-Google-Smtp-Source: AGRyM1safWSCgd6ZhmMMaXMIZcOIHJF9HJmgm3P9D6W50pvFqT6XmuaH+vRyprmmeWghokYwRWyoog==
X-Received: by 2002:a63:500d:0:b0:415:e89e:42b7 with SMTP id e13-20020a63500d000000b00415e89e42b7mr6216182pgb.140.1657508700911;
        Sun, 10 Jul 2022 20:05:00 -0700 (PDT)
Received: from bobo.ibm.com ([203.220.77.143])
        by smtp.gmail.com with ESMTPSA id o4-20020a17090a5b0400b001ef8c81959dsm3562232pji.16.2022.07.10.20.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:05:00 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 00/14] add our own qspinlock implementation
Date: Mon, 11 Jul 2022 13:04:39 +1000
Message-Id: <20220711030453.150644-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The qspinlock conversion resulted in some latency regressions
particularly in the paravirt (SPLPAR) case. I haven't been able to
improve them much so for now I rewrite with a different paravirt
algorithm (as s390 does). This isn't the same as s390 but they have
some of the same concerns by the looks, so possibly if we can't
unify with generic code we could unify with them at some point.

Thanks,
Nick

Nicholas Piggin (14):
  powerpc/qspinlock: powerpc qspinlock implementation
  powerpc/qspinlock: add mcs queueing for contended waiters
  powerpc/qspinlock: use a half-word store to unlock to avoid larx/stcx.
  powerpc/qspinlock: convert atomic operations to assembly
  powerpc/qspinlock: allow new waiters to steal the lock before queueing
  powerpc/qspinlock: theft prevention to control latency
  powerpc/qspinlock: store owner CPU in lock word
  powerpc/qspinlock: paravirt yield to lock owner
  powerpc/qspinlock: implement option to yield to previous node
  powerpc/qspinlock: allow stealing when head of queue yields
  powerpc/qspinlock: allow propagation of yield CPU down the queue
  powerpc/qspinlock: add ability to prod new queue head CPU
  powerpc/qspinlock: trylock and initial lock attempt may steal
  powerpc/qspinlock: use spin_begin/end API

 arch/powerpc/Kconfig                       |   1 -
 arch/powerpc/include/asm/qspinlock.h       | 130 ++--
 arch/powerpc/include/asm/qspinlock_types.h |  65 ++
 arch/powerpc/include/asm/spinlock_types.h  |   2 +-
 arch/powerpc/lib/Makefile                  |   4 +-
 arch/powerpc/lib/qspinlock.c               | 671 +++++++++++++++++++++
 6 files changed, 829 insertions(+), 44 deletions(-)
 create mode 100644 arch/powerpc/include/asm/qspinlock_types.h
 create mode 100644 arch/powerpc/lib/qspinlock.c

-- 
2.35.1

