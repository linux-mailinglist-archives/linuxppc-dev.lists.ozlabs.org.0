Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0A4211D8B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 09:52:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49y9Kq6HT9zDqVP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 17:52:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VBfP9Efu; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49y9G22MgQzDqKl
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 17:48:57 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id o13so10097784pgf.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 00:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BGkFFlz3CL02oLLT9btRQ7t/uEdtktYrj+rJR3OzJfE=;
 b=VBfP9EfuSC5B01Yl75AWN5yemr1U1nXAUk5J9ZUrRV6z1IlF+wqWTn7hCEuC1eO+pI
 8f86dVB/F+CRd2am9M5cdc/3ApYWU6kEbVD5j3DjFhKedIbYD6rPBQFjGeEFgjvWKhXo
 0e1AZa92QpzFmLh0b6SRUIBVyzGbRd5JemEOktspm7S9V6vAkyWXCfRj4tjCBfWyfnT+
 ibbtdkwflelrAnPwkuhudW8uZVK9d9lclyVgPdyVkQ6uqW230GSyTCzVVXtq2CoRm+Q3
 kcR2wSgzchyBlq61itWFoQtZn4e2Yc2BMOZTuceB0zw5NeG/q5iyNoN40PF6g1sA1DIe
 pXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BGkFFlz3CL02oLLT9btRQ7t/uEdtktYrj+rJR3OzJfE=;
 b=DB5pQRRPrCcBwdghSNmRzXimnX3UDZaqwFjLGj1xwvar22zae03KXg8iNN3qIbERph
 cjyiOMM2yPwJSd8qsXrbuq+Q2sA9AmusMLEsEmaVMKwCjwb+h/ByinWej1dybpNkV8nk
 zIXRvP3+T4G6SYqG/DapPFdp8XsxOIPULAkLew7oZOmlWYcTuafkpGHTel8Sph5SVV8s
 X+0QgNFD5hRr70OpmtX4RtZBOwIGLgf4CMtRhE9GPLZddS90iiKaiuE5DUAFfyJ8BMxk
 3YkQ+yNhdJdCrG1FaYTEzT+5Igbkya1KBFHLVGgU0GoWDOqZ3MDYfp+N0RCpmHIqGoKR
 c7RQ==
X-Gm-Message-State: AOAM532cWwogKNZw8zsYDZAsjo1niMROVIneWoR9uisRuuiNjwhwzzAU
 0ijIVDC38BVYBVdMYEvxkcY=
X-Google-Smtp-Source: ABdhPJyZZV6c4bnHmvuCFcUHb/+F9EKbXInlk5xywpAnKg6m7EzNfoqKOOHYh+AmFZBFfTL3c0/qMQ==
X-Received: by 2002:a65:4847:: with SMTP id i7mr14123759pgs.385.1593676134139; 
 Thu, 02 Jul 2020 00:48:54 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id 17sm6001953pfv.16.2020.07.02.00.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 00:48:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH 0/8] powerpc: queued spinlocks and rwlocks
Date: Thu,  2 Jul 2020 17:48:31 +1000
Message-Id: <20200702074839.1057733-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 kvm-ppc@vger.kernel.org, Waiman Long <longman@redhat.com>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series adds an option to use queued spinlocks for powerpc, and
makes it the default for the Book3S-64 subarch.

This effort starts with the generic code so it's very simple but
still very performant. There are optimisations that can be made to
slowpaths, but I think it's better to attack those incrementally
if/when we find things, and try to add the improvements to generic
code as much as possible.

Still in the process of getting numbers and testing, but the
implementation turned out to be surprisingly simple and we have a
config option, so I think we could merge it fairly soon.

Thanks,
Nick

Nicholas Piggin (8):
  powerpc/powernv: must include hvcall.h to get PAPR defines
  powerpc/pseries: use smp_rmb() in H_CONFER spin yield
  powerpc/pseries: move some PAPR paravirt functions to their own file
  powerpc: move spinlock implementation to simple_spinlock
  powerpc/64s: implement queued spinlocks and rwlocks
  powerpc/pseries: implement paravirt qspinlocks for SPLPAR
  powerpc/qspinlock: optimised atomic_try_cmpxchg_lock that adds the
    lock hint
  powerpc/64s: remove paravirt from simple spinlocks (RFC only)

 arch/powerpc/Kconfig                          |  13 +
 arch/powerpc/include/asm/Kbuild               |   2 +
 arch/powerpc/include/asm/atomic.h             |  28 ++
 arch/powerpc/include/asm/paravirt.h           |  84 +++++
 arch/powerpc/include/asm/qspinlock.h          |  75 +++++
 arch/powerpc/include/asm/qspinlock_paravirt.h |   5 +
 arch/powerpc/include/asm/simple_spinlock.h    | 235 +++++++++++++
 .../include/asm/simple_spinlock_types.h       |  21 ++
 arch/powerpc/include/asm/spinlock.h           | 308 +-----------------
 arch/powerpc/include/asm/spinlock_types.h     |  17 +-
 arch/powerpc/kvm/book3s_hv_rm_mmu.c           |   6 -
 arch/powerpc/lib/Makefile                     |   1 -
 arch/powerpc/lib/locks.c                      |  65 ----
 arch/powerpc/platforms/powernv/pci-ioda-tce.c |   1 +
 arch/powerpc/platforms/pseries/Kconfig        |   5 +
 arch/powerpc/platforms/pseries/setup.c        |   6 +-
 include/asm-generic/qspinlock.h               |   4 +
 17 files changed, 488 insertions(+), 388 deletions(-)
 create mode 100644 arch/powerpc/include/asm/paravirt.h
 create mode 100644 arch/powerpc/include/asm/qspinlock.h
 create mode 100644 arch/powerpc/include/asm/qspinlock_paravirt.h
 create mode 100644 arch/powerpc/include/asm/simple_spinlock.h
 create mode 100644 arch/powerpc/include/asm/simple_spinlock_types.h
 delete mode 100644 arch/powerpc/lib/locks.c

-- 
2.23.0

