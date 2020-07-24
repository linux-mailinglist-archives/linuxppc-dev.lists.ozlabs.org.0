Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C93B922C62B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 15:18:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCqWZ5l6yzF0cd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 23:18:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pXLqcyKc; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqRh4fggzDrB5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:14:39 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id l63so5179259pge.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 06:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pNbiY4rCOWfn291u6DvF/2Ahe4KMxxHPAD/LG/AtX8A=;
 b=pXLqcyKcwadFpxMawcde5uKWsmYRkcG8MkmB7OazkUR1B9BxLPOTtomS0atxp0wsl0
 3K/nBNDtdLM3XMKp/+Q2KWPhTzNaLsUfCbkpvUQYl6EOzkHNK4vD7ZfKDhoLzWCd2/se
 fgoI8WC64Tprw9SX7RVYFGJVh3Fr+l1v+e5gbAofaNSm7BpQNZBwaJXh4KnnE/c7ATBL
 JP1X36gJgrQMWq1w5fNtffUVAvZelPJ7TC9Q/xuCVhzxxomWZcH5/i0edBgmsWZ5thXx
 Ig3Akrdt8zubCyDuzbipimtLx+lMYUOnS0mpNIrbb3vf4jg7KTVvtMzq2Quh777Evv+Z
 RCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pNbiY4rCOWfn291u6DvF/2Ahe4KMxxHPAD/LG/AtX8A=;
 b=poQatTrwgWe1NvLebrx90V+eVarvQsmsT5FJmX6+bSReyuSDKEuJFosoBooQhC/n14
 7PAZ52Wp4unIk01Q34HNcfgsro9aMXBz2lEf+HGx8twf6TSu/MLtZETxhJS7QezMjkhY
 X7DFKx+WFlIH8UvaJh2RlpmaNhuILnDCtYvkYzPbtxpia1P3R7Xm8jBVJ1WJyC98s/T8
 JEL4OS9tDL1l0yHAq8ypov+BNwO4bG3xpcBtL1WEuXuR+Qqdj9e53tz9BbO5i1l8Wr+i
 FXuCygWysQdwS/xq/7xi0Qg/t4NnGsCMWMRIDYawbAREp7pO05T4bu9hz+UvgtRh7m3i
 terg==
X-Gm-Message-State: AOAM533rSkTYLeqDzq0aoCszPzh0nqj6xz9wCRDQE7OMuaH//XBOYvZw
 HbX5ZwL97/S/fDLKeBqi3m3/C42f
X-Google-Smtp-Source: ABdhPJxTM0xNsmofbW6cID6lTwKMAYAg9GWepJp2u9OgGyKYII7bL4WnhIOmRKega9Bzh5DogPa2Zg==
X-Received: by 2002:a05:6a00:1586:: with SMTP id
 u6mr8714565pfk.147.1595596476262; 
 Fri, 24 Jul 2020 06:14:36 -0700 (PDT)
Received: from bobo.ibm.com (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id az16sm5871998pjb.7.2020.07.24.06.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 06:14:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 0/6] powerpc: queued spinlocks and rwlocks
Date: Fri, 24 Jul 2020 23:14:17 +1000
Message-Id: <20200724131423.1362108-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: linux-arch@vger.kernel.org,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 kvm-ppc@vger.kernel.org, Waiman Long <longman@redhat.com>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Updated with everybody's feedback (thanks all), and more performance
results.

What I've found is I might have been measuring the worst load point for
the paravirt case, and by looking at a range of loads it's clear that
queued spinlocks are overall better even on PV, doubly so when you look
at the generally much improved worst case latencies.

I have defaulted it to N even though I'm less concerned about the PV
numbers now, just because I think it needs more stress testing. But
it's very nicely selectable so should be low risk to include.

All in all this is a very cool technology and great results especially
on the big systems but even on smaller ones there are nice gains. Thanks
Waiman and everyone who developed it.

Thanks,
Nick

Nicholas Piggin (6):
  powerpc/pseries: move some PAPR paravirt functions to their own file
  powerpc: move spinlock implementation to simple_spinlock
  powerpc/64s: implement queued spinlocks and rwlocks
  powerpc/pseries: implement paravirt qspinlocks for SPLPAR
  powerpc/qspinlock: optimised atomic_try_cmpxchg_lock that adds the
    lock hint
  powerpc: implement smp_cond_load_relaxed

 arch/powerpc/Kconfig                          |  15 +
 arch/powerpc/include/asm/Kbuild               |   1 +
 arch/powerpc/include/asm/atomic.h             |  28 ++
 arch/powerpc/include/asm/barrier.h            |  14 +
 arch/powerpc/include/asm/paravirt.h           |  87 +++++
 arch/powerpc/include/asm/qspinlock.h          |  91 ++++++
 arch/powerpc/include/asm/qspinlock_paravirt.h |   7 +
 arch/powerpc/include/asm/simple_spinlock.h    | 288 ++++++++++++++++
 .../include/asm/simple_spinlock_types.h       |  21 ++
 arch/powerpc/include/asm/spinlock.h           | 308 +-----------------
 arch/powerpc/include/asm/spinlock_types.h     |  17 +-
 arch/powerpc/lib/Makefile                     |   3 +
 arch/powerpc/lib/locks.c                      |  12 +-
 arch/powerpc/platforms/pseries/Kconfig        |   9 +-
 arch/powerpc/platforms/pseries/setup.c        |   4 +-
 include/asm-generic/qspinlock.h               |   4 +
 16 files changed, 588 insertions(+), 321 deletions(-)
 create mode 100644 arch/powerpc/include/asm/paravirt.h
 create mode 100644 arch/powerpc/include/asm/qspinlock.h
 create mode 100644 arch/powerpc/include/asm/qspinlock_paravirt.h
 create mode 100644 arch/powerpc/include/asm/simple_spinlock.h
 create mode 100644 arch/powerpc/include/asm/simple_spinlock_types.h

-- 
2.23.0

