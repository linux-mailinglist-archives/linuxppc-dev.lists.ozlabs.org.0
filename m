Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA67A639516
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 11:00:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NK6g75c41z3f3x
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 21:00:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YRnRDAfU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YRnRDAfU;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NK6fF5M8rz3bhn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 20:59:48 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id w23so5933498ply.12
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 01:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3Z8kk6ZC0CJYlgeWZdEaf4VCa+3JujEHOiI5VHYxbk=;
        b=YRnRDAfUB2ehNZFWPL780h2aDYDwPKbNYO39KmSMV0sAYbYk4ztttWzjXJpdexubFR
         qw0+FHhLZ1PxupRwUN/Ag2IzOhT933dsnOcVgq4Sma6Ua93rBKwDYXmre3J77l4rV2el
         v5CCYPJhn97qjIxsapvjZteHvBsFonBzob7X2cBThvULukEr+eSkGleOTD+Xe8sa7T0p
         08d9Rz2avyH15ollufwU4aQBbnEanrIpcXNJNGQHnvxZpfU+MEsMBZwjXZt10yl+2YgF
         MWHCsN5HYj3U1aD+BRrOTtMJkS4B8WQNI3Zi5TqCXahiBAE69BlPhFqWIG8T8040bByv
         R4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3Z8kk6ZC0CJYlgeWZdEaf4VCa+3JujEHOiI5VHYxbk=;
        b=rknbv19xru3GmiSDLgbSWpLUn8ljf7M5XhArYJv/d2QcPjnITk6Ig33xV2ecCqkDE8
         Iq5Cin2uz1a1/GiOiMtQlJ1xdvnRkrD9nevhpyi64zOTSo37LbrCF6k9SPZticwbYuO7
         BFFdmtVfywnCUbkpoXdTCHlpJsBiGwtC/KaaAxLooEiXaMwlqVc1L24OJ5Mh5/+tcYjf
         OU1zJjza/Nb5d+NyqXDoqLC/WTMu0h8W18c6hJrP3uvTA6dpj+Sw8PMLcB7yUJKd7cSf
         u2vbh3BlNADkUxdhjoSNfvK9+8frXY/YCbW8jynj4ktFMgp8ucTMB81YU3PBpkiH2ExF
         dzew==
X-Gm-Message-State: ANoB5pkEyswdTH+R3kPndVqQESU5kEtp9Y0inchdDvXsSRKzf1NPj/ix
	g01f1s/oMtgKA0AiQOQjDGSrwQ2MwGXvQQ==
X-Google-Smtp-Source: AA0mqf7JqQBWBqQzZgsXflXbEt+t+s9D4RgfENmgojskES9dcacLSWfQymDI8zFReWPpEcGS6dJRtw==
X-Received: by 2002:a17:902:e788:b0:189:14f6:1257 with SMTP id cp8-20020a170902e78800b0018914f61257mr31901535plb.19.1669456784292;
        Sat, 26 Nov 2022 01:59:44 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (110-174-181-90.tpgi.com.au. [110.174.181.90])
        by smtp.gmail.com with ESMTPSA id j3-20020a17090a94c300b00213202d77d9sm4239243pjw.43.2022.11.26.01.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 01:59:43 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 00/17] powerpc: alternate queued spinlock implementation
Date: Sat, 26 Nov 2022 19:59:15 +1000
Message-Id: <20221126095932.1234527-1-npiggin@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
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

Thanks,
Nick

Since v2:
- Rebase the series on upstream and remove the 1a shim patch.
- Squash in the RFC patches that avoid a few more cmpxchg patterns in
  favour of more optimal larx/stcx implementations and allows the
  non-stealing queueing case to be removed, significantly reducing
  the queuing code.
- Reword some changelogs.

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
  powerpc/qspinlock: allow lock stealing in trylock and lock fastpath
  powerpc/qspinlock: use spin_begin/end API
  powerpc/qspinlock: reduce remote node steal spins
  powerpc/qspinlock: allow indefinite spinning on a preempted owner
  powerpc/qspinlock: provide accounting and options for sleepy locks
  powerpc/qspinlock: add compile-time tuning adjustments

 arch/powerpc/include/asm/qspinlock.h       | 130 ++-
 arch/powerpc/include/asm/qspinlock_types.h |  63 +-
 arch/powerpc/lib/qspinlock.c               | 985 ++++++++++++++++++++-
 3 files changed, 1167 insertions(+), 11 deletions(-)

-- 
2.37.2

