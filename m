Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EA7627496
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 03:32:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9YJ30XT0z3cMK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:32:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NPOTcs7v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NPOTcs7v;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9YH46X5pz3c1x
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 13:31:58 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id d59-20020a17090a6f4100b00213202d77e1so12535240pjk.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Nov 2022 18:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tVqZnn6Y4rG6ldfeahuLNs9CiukmTklUAlrUJLSmgxA=;
        b=NPOTcs7voT8fZSmpOVKXy7pQzWEpOCegMx2dQu/PIvbhTkFFMc88sZ/pxR6CgbgYN8
         mjSvNJ1QdmoabLfGDxWmP/4J3UHb8kDjf0zVImZzGyjTs9il8fcqym/A/AkOMLmrSOTu
         9AAKRjVRLsNB0i7LGO8BtTenr7XgNi3IgF2cCWOQYcmIzeaxNvJKJW5GzYJs6fq1NOIX
         WV3e6lk/q+ffrUiVEk/bWHDWyTLCca7i93RIy6g6YbgbF4vLGbWb3UsiN+8Hd1ahOhtF
         4CJHeuxYpebnitmoHoWQVRcOMFsFj6jPRqvhW+5KPpn8QZqOXi8wWeoQ4HTtxN3FPoAu
         jvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVqZnn6Y4rG6ldfeahuLNs9CiukmTklUAlrUJLSmgxA=;
        b=IrHNUxmDgRRG4tF+zOD/bvb/UOMAyv4DWf8YJxZBNcc7BOHKfUOne056449Afw9Ytj
         5AE3qMkS44/EpIU7vjY3tGcJfTc6M2HPrTv75caLKD62gL3gq643/avifLO4SMAAA0q4
         ic/SgWK8m8Zz8L6piZMUHmBXftjs2KxOziX62crHwiKWYf9c0P/Z5jdhjLIl7sMj04cp
         zvleJJFp5XCwG2hCIzjDh5BwGTjBcJ9N5ST8By8W2pzM53JclNewW8X0M9X90AZ4HulQ
         d05tvQxNKiB5xHDNXZ2AzZPIv80QJY27JzI9gCmFnLhYGmN18Y+XgLCqVAOOomDG1+Zi
         Ef/Q==
X-Gm-Message-State: ANoB5pkFr1Yuovss10rGz3ACt2wkGf4aBw2XNr3tj4rq9WUUTNYGMGX+
	R4Yz/DmhJ8H9qfZLkQtaljgdaykNkUk=
X-Google-Smtp-Source: AA0mqf54m8zC3UUzDyb7Y6k/bkccdvfJJp5IVpNMQuwrRO7gLiwArzlxanXm0iq10Nbc/ntWp+DSoA==
X-Received: by 2002:a17:90a:e60f:b0:214:1a8a:a415 with SMTP id j15-20020a17090ae60f00b002141a8aa415mr11624925pjy.197.1668393110773;
        Sun, 13 Nov 2022 18:31:50 -0800 (PST)
Received: from bobo.ibm.com (14-200-187-164.tpgi.com.au. [14.200.187.164])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b00186616b8fbasm5973655plc.10.2022.11.13.18.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 18:31:49 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 00/17] powerpc: alternate queued spinlock implementation
Date: Mon, 14 Nov 2022 12:31:19 +1000
Message-Id: <20221114023137.2679627-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Jordan Niethe <jniethe5@gmail.com>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This replaces the generic queued spinlock code (like s390 does) with
our own implementation. There is an extra shim patch 1a to get the
series to apply.

Generic PV qspinlock code is causing latency / starvation regressions on
large systems that are resulting in hard lockups reported (mostly in
pathoogical cases).  The generic qspinlock code has a number of issues
important for powerpc hardware and hypervisors that aren't easily solved
without changing code that would impact other architectures. Follow
s390's lead and implement our own for now.

Issues for powerpc using generic qspinlocks:
- The previous lock value should not be loaded with simple loads, and
  need not be passed around from previous loads or cmpxchg results,
  because powerpc uses ll/sc-style atomics which can perform more
  complex operations that do not require this. powerpc implementations
  tend to prefer loads use larx for improved coherency performance.
- The queueing process should absolutely minimise the number of stores
  to the lock word to reduce exclusive coherency probes, important for
  large system scalability. The pending logic is counter productive
  here.
- Non-atomic unlock for paravirt locks is important (atomic instructions
  tend to still be more expensive than x86 CPUs).
- Yielding to the lock owner is important in the oversubscribed paravirt
  case, which requires storing the owner CPU in the lock word.
- More control of lock stealing for the paravirt case is important to
  keep latency down on large systems.
- The lock acquisition operation should always be made with a special
  variant of atomic instructions with the lock hint bit set, including
  (especially) in the queueing paths. This is more a matter of adding
  more arch lock helpers so not an insurmountable problem for generic
  code.

So far this still has some work to test and tune performance. It does
improve some of the latency and starvation issues, it also has some
throughput regressions in some cases, but I already left it too long
since Jordan's really nice review including two subtle bugs found, so
I'm posting the current state of things...

Since v1:
- Change most 'if (cond) return 1 ; return 0;'
- Bug fix: was testing count == MAX, but reentrant NMIs could bring that
  > MAX and crash.
- Fix missing memory barrier lost in asm conversion patch.
- Seperate the release barrier in publish_tail from the acquire barrier
  in get_tail_qnode.
- Moving a few minor things into their logically correct change.
- Make encode_tail_cpu take a cpu argument to match get_tail_cpu.
- Rename get_tail_cpu to decode_tail_cpu to match encode_tail_cpu.
- Rename lock_set_locked to set_locked.
- IS_ENABLED(x) ? 1 : 0 -> IS_ENABLED(x)
- Fix some comments inside inline asm.
- Change tunable names to lowercase.
- Consolidate asm for trylock_clear_tail_cpu and trylock_with_tail_cpu
- Restructure steal/wait loops to be more readable
- Count a failed cmpxchg as an iteration in steal/wait loops to avoid
  theoretical livelock/latency concern.

Nicholas Piggin (17):
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
  powerpc/qspinlock: reduce remote node steal spins
  powerpc/qspinlock: allow indefinite spinning on a preempted owner
  powerpc/qspinlock: provide accounting and options for sleepy locks

 arch/powerpc/Kconfig                       |    1 -
 arch/powerpc/include/asm/qspinlock.h       |  133 ++-
 arch/powerpc/include/asm/qspinlock_types.h |   70 ++
 arch/powerpc/include/asm/spinlock_types.h  |    2 +-
 arch/powerpc/lib/Makefile                  |    4 +-
 arch/powerpc/lib/qspinlock.c               | 1008 ++++++++++++++++++++
 6 files changed, 1174 insertions(+), 44 deletions(-)
 create mode 100644 arch/powerpc/include/asm/qspinlock_types.h
 create mode 100644 arch/powerpc/lib/qspinlock.c

-- 
2.37.2

