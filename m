Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B6E2683CF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 06:54:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqYtZ2WftzDqYq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 14:54:30 +1000 (AEST)
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
 header.s=20161025 header.b=ejUmrq8I; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqYrT0GgTzDqW0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Sep 2020 14:52:38 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id u13so10563677pgh.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Sep 2020 21:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Q2Ibfk+nQZOW1cqQJ9txIYMhLv+gj4Sy6xqSd9DmWA=;
 b=ejUmrq8Iadf/nWh/k76D9SUjpOWREHXHs/sYszqAIcXvWn01J7LU9SavyNRh5tf3We
 lVdoabqUUuvksTLGvX+nfyOWpdUmbRFmMexlOsIelNCjlPaujuQQhoklVQMjIPZ2LN4U
 lmOAFYsu0p+t6RtwKv1lQhr5H2D9f3RXh/oZkyYldfDPLBwQ3N9LYwG76Y0w6emjqbaR
 THE69ZZ8qCk8byO69uE5yMU8a9cFyS6mbn5LAa5BGhVTRy0r/GDvtIr0lxOhOul8+7dI
 LwlWZgqot0gPmX0nHiFVt7KvA+rW4IJBUkcEAGNxRIrWg734wU3s8k22KSwfcP6FP16q
 5PUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Q2Ibfk+nQZOW1cqQJ9txIYMhLv+gj4Sy6xqSd9DmWA=;
 b=G6lmDy9nAJFxeENqq/4GsdEZaF0cIdZNtMptL8DihiwEj9e4NvF7b45nCf3BLzI1Id
 hJfmd06P9T1juZUo4eKVNAdK+N24b2YqvuWRI2pYMytm4Wt3oiGVa7+64PYulNXsQUhx
 a2Fep3ksSFViWwC7Q2cDMVtXbp2h6kQVCkMvWudoI1fbhZz+3XpBHp+PT7+QyUiIOuJ1
 s3zu4sJcaJeOPShlVl4GBOYlnCGymoOkRSM1kdEiwNX0lZ2G1BVjsKyfAN3dMCxZr7kX
 9RpMKQxKqQhRQ4p+US3vVCjZZQdollw9Dw7SN+OqIsi+WfDKgd23OZoXUIQnisiTU8QB
 rxMw==
X-Gm-Message-State: AOAM530hnVB2CXw60PcVd6Lcq4CYOvdjdhkBUPvDiD6/Pe4QnPA0YuVl
 4EhRjZ4cR5jARZDnqapByho=
X-Google-Smtp-Source: ABdhPJzFrz8mmf96fURpM3KuwwEgUYQJyVtYlAsIcvS5cLVagsaDZEbOGwmLwgd4u8HXatYEzUDalg==
X-Received: by 2002:a63:524a:: with SMTP id s10mr3316432pgl.40.1600059156171; 
 Sun, 13 Sep 2020 21:52:36 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id a13sm6945312pgq.41.2020.09.13.21.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 21:52:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: "linux-mm @ kvack . org" <linux-mm@kvack.org>
Subject: [PATCH v2 0/4] more mm switching vs TLB shootdown and lazy tlb fixes
Date: Mon, 14 Sep 2020 14:52:15 +1000
Message-Id: <20200914045219.3736466-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Peter Zijlstra <peterz@infradead.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an attempt to fix a few different related issues around
switching mm, TLB flushing, and lazy tlb mm handling.

This will require all architectures to eventually move to disabling
irqs over activate_mm, but it's possible we could add another arch
call after irqs are re-enabled for those few which can't do their
entire activation with irqs disabled.

Testing so far indicates this has fixed a mm refcounting bug that
powerpc was running into (via distro report and backport). I haven't
had any real feedback on this series outside powerpc (and it doesn't
really affect other archs), so I propose patches 1,2,4 go via the
powerpc tree.

There is no dependency between them and patch 3, I put it there only
because it follows the history of the code (powerpc code was written
using the sparc64 logic), but I guess they have to go via different arch
trees. Dave, I'll leave patch 3 with you.

Thanks,
Nick

Since v1:
- Updates from Michael Ellerman's review comments.

Nicholas Piggin (4):
  mm: fix exec activate_mm vs TLB shootdown and lazy tlb switching race
  powerpc: select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
  sparc64: remove mm_cpumask clearing to fix kthread_use_mm race
  powerpc/64s/radix: Fix mm_cpumask trimming race vs kthread_use_mm

 arch/Kconfig                           |  7 +++
 arch/powerpc/Kconfig                   |  1 +
 arch/powerpc/include/asm/mmu_context.h |  2 +-
 arch/powerpc/include/asm/tlb.h         | 13 ------
 arch/powerpc/mm/book3s64/radix_tlb.c   | 23 ++++++---
 arch/sparc/kernel/smp_64.c             | 65 ++++++--------------------
 fs/exec.c                              | 17 ++++++-
 7 files changed, 54 insertions(+), 74 deletions(-)

-- 
2.23.0

