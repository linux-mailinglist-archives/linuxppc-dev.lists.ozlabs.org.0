Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D312C6FD4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 17:04:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjxBS6wwzzDrSp
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 03:04:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CgE6KOyT; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cjx826J7nzDrQX
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 03:01:52 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id t3so6708256pgi.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 08:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2O6qcQHJ1HIADKlavbzosnF3a3wMtszkYQ/PuPl66qI=;
 b=CgE6KOyTfg3utDcRpZdx3wNg5OyhBXbYyc7PH8oa6j60BTtpQLlHDpvZodUSgtskAv
 kqzv+kzRC8gJVu60u38BrPXBYCz+1pEo0KvxCwXjcwsZBMYy4UyOWOY3pEIZ4CakN9AD
 IlOOeUveQZn2f5Ib6HdtyeE6Xd8O/3Ajz61BxBQaI2kgQLf9g57ysabjeDv/7CTlsJSV
 6GIrzobXL4pzBVG6qscprgZn16B+G8oGEPy3hSkuzq1R6I3T2JlwKWSi3WfN7MY57x/P
 zPH8/jK+/t1BSRextQVoRrJHkVB9PMJuGQ9K8ajrDnT+LwE9dGk9paNd5x5WY4BqSCif
 XnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2O6qcQHJ1HIADKlavbzosnF3a3wMtszkYQ/PuPl66qI=;
 b=hIiNW0QITd5fLLIhY4FR2wS/ZJFkNLejC11LkxVNyVfY8J6lwg3e92xFEIqV25ztlp
 BIt47ZziguDQSGih/WzjSXTBk2mxAiCr+eAQ2/9M+aQRl4VUjK7U5sHF7GQBdDKjrJtu
 3zjkuSfbyzvUhmEHiW8KR1km3LveOT63zHAIIZGwzcdW7zK2ORErm4bChIogmsrv52GK
 /nribaMkk1HlTTuSyNkFAuk6M1/z4N4GbWcAawwHNdbNw0cs2SOCx/T/rP6l3kS4EfXI
 vioSRc2VbzppjUDmedEbZh49APt5Vh8MVQs5tP9sRbFSQ5D5z2Fqoeh7Tu0Joy02BY5Y
 KOqw==
X-Gm-Message-State: AOAM530TunbDB0UdAmLM1JEsLoZZGNj1+5JeZabGKkXUKLKR5vhwS7vJ
 928bV88BeUClu8Kt7S62ktg=
X-Google-Smtp-Source: ABdhPJwuiEos39Kd+yWnNTMmDC8yimmI7zJPon0FpMljcy6a+V40CGpf8EDqJAwgKioFXcJ84fR1pw==
X-Received: by 2002:a17:90a:f695:: with SMTP id
 cl21mr16872124pjb.137.1606579310741; 
 Sat, 28 Nov 2020 08:01:50 -0800 (PST)
Received: from bobo.ibm.com (193-116-103-132.tpgi.com.au. [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id d4sm9762607pjz.28.2020.11.28.08.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 08:01:50 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] shoot lazy tlbs
Date: Sun, 29 Nov 2020 02:01:33 +1000
Message-Id: <20201128160141.1003903-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a rebase now on top of Arnd's asm-generic tree, which has
reduced most of the fluff from this patch series.

The x86 refactoring is still in the way a bit, I hope to get some
movement on that rather than rebase the main patches off it, because
I think it's a good cleanup. I think it could go in a generic
mm/scheduler series if we get arch acks because it's really just
refactoring wrappers.

The main result is reduced contention on lazy tlb mm refcount that
helps very big systems.

Thanks,
Nick

Nicholas Piggin (8):
  lazy tlb: introduce exit_lazy_tlb
  x86: use exit_lazy_tlb rather than
    membarrier_mm_sync_core_before_usermode
  x86: remove ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
  lazy tlb: introduce lazy mm refcount helper functions
  lazy tlb: allow lazy tlb mm switching to be configurable
  lazy tlb: shoot lazies, a non-refcounting lazy tlb option
  powerpc: use lazy mm refcount helper functions
  powerpc/64s: enable MMU_LAZY_TLB_SHOOTDOWN

 .../membarrier-sync-core/arch-support.txt     |  6 +-
 arch/Kconfig                                  | 24 +++++
 arch/arm/mach-rpc/ecard.c                     |  3 +-
 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/kernel/smp.c                     |  2 +-
 arch/powerpc/mm/book3s64/radix_tlb.c          |  5 +-
 arch/x86/Kconfig                              |  1 -
 arch/x86/include/asm/mmu_context.h            | 27 ++++++
 arch/x86/kernel/alternative.c                 |  2 +-
 arch/x86/kernel/cpu/mce/core.c                |  2 +-
 drivers/misc/sgi-gru/grufault.c               |  2 +-
 drivers/misc/sgi-gru/gruhandles.c             |  2 +-
 drivers/misc/sgi-gru/grukservices.c           |  2 +-
 fs/exec.c                                     |  6 +-
 include/asm-generic/mmu_context.h             | 21 ++++
 include/linux/sched/mm.h                      | 34 ++++---
 include/linux/sync_core.h                     | 21 ----
 init/Kconfig                                  |  3 -
 kernel/cpu.c                                  |  6 +-
 kernel/exit.c                                 |  2 +-
 kernel/fork.c                                 | 53 ++++++++++
 kernel/kthread.c                              | 12 ++-
 kernel/sched/core.c                           | 97 +++++++++++++------
 kernel/sched/sched.h                          |  4 +-
 24 files changed, 247 insertions(+), 91 deletions(-)
 delete mode 100644 include/linux/sync_core.h

-- 
2.23.0

