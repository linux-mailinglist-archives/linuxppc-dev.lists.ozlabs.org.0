Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 731A31BEEE2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 06:03:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CMFD2VxmzDrFb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 14:03:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pyIUvTbe; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CMCW5mfqzDr7b
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 14:02:15 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id c21so1759616plz.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 21:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=806taYgfx/Bxj+McXFMhGNJZb30+0DKm6BcSOyalqSs=;
 b=pyIUvTbeLLucWLqwMaBeiBEy0Ing49bplAb9GBIrfz/va/9nGIcXIrWUdGCMwDY0ly
 mTcPPtxyUIbRNbj3NWxmTpZN//GhxiWbHbq47uue2GqfnQ1P9Rw9ftNf+S35FhRcNRH0
 Ghyp1/ePTANkdJYOlYjn61hiHFbGhTPTyP75nqNgKeYhKmAuyGAKjnBTqiZQoFD2jX3t
 ZRs5UCIbPpSONMpb5VP7o/cCvviQBEknHbh2bW62w9caM4ba6eMNctrqqLAZPJxtH13i
 OjudIFgJSxBmo4jyqdEe0toEUw2yXpz/MLt+Lt6LhjU6XCvfVT23XfuDxKe6wVSIKvQK
 SQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=806taYgfx/Bxj+McXFMhGNJZb30+0DKm6BcSOyalqSs=;
 b=A7QW6Ua3aZTC7J+SgLmW8abtgu6BRgsZV5PCSa+ri0zU0rMbfMzPdcUe6C2YQaJgew
 L7QMCLTXCPhmK1T+FHVqes63TVq+Mb6LRIa0qV2lbeFRHnLqHPFwboAp4Uip8GoKqGSy
 okiQMpcGj8iFppih/zQkuQI+nZHjG1QoiWcrw33na61k6eHC7qDBchSqLkaJCnGswWrZ
 B0cvuzza+/RpaIn+9yA74Xpf+pEtIdwAaIWiAbB1oVUnxBBUZTOTg27bIx+hvMdw1rFd
 MT4oQOzU517jN1u2JtIGggYz64pEKcjyZNMqhGe7XQazsih6/uhyXBAY1Sao55EdRTik
 xeRA==
X-Gm-Message-State: AGi0PubjxRBpUkK7qvbBmEpC7nxMggyzfbTOzA8cfgxldSTHeKebfue5
 wjqUddK/pv4+td272mBmpk76QWsJ
X-Google-Smtp-Source: APiQypJtwj6I38gJyPk3YIsGQ01xdtH1IA0cHdPEw0CQJ9HjEvj+hGOJCDOwkYSLghLDX/GlMSbMNw==
X-Received: by 2002:a17:90a:840e:: with SMTP id
 j14mr633745pjn.85.1588219331618; 
 Wed, 29 Apr 2020 21:02:11 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id b9sm2251890pfp.12.2020.04.29.21.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 21:02:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 0/2] powerpc/64s: scv support
Date: Thu, 30 Apr 2020 14:02:00 +1000
Message-Id: <20200430040202.1735506-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Another round of scv, which is getting closer to done. ABI and
compatibility / feature testing still not set in stone, but some
good discussion among the various libcs etc. and it's close enough
that changes should just be small tweaks to clobbers etc. Posting
now because there is some interest to prototype userspace support
which we should do before fixing the ABI.

This relies on some of the signal handling and kuap patches I
already posted, so tree is here:

https://github.com/npiggin/linux/commits/next-test

I have qemu scv support apatches I need to resend, but they're not
merged yet. POWER9 system simulator should support it, but I have
not tested the public version:

https://www14.software.ibm.com/support/customercare/sas/f/pwrfs/pwr9/home.html

Thanks,
Nick

Nicholas Piggin (2):
  powerpc/64s/exception: treat NIA below __end_interrupts as soft-masked
  powerpc/64s: system call support for scv/rfscv instructions

 Documentation/powerpc/syscall64-abi.rst   |  42 ++++--
 arch/powerpc/include/asm/asm-prototypes.h |   2 +-
 arch/powerpc/include/asm/exception-64s.h  |   6 +
 arch/powerpc/include/asm/head-64.h        |   2 +-
 arch/powerpc/include/asm/ppc-opcode.h     |   2 +
 arch/powerpc/include/asm/ppc_asm.h        |   2 +
 arch/powerpc/include/asm/processor.h      |   2 +-
 arch/powerpc/include/asm/ptrace.h         |   8 +-
 arch/powerpc/include/asm/setup.h          |   4 +-
 arch/powerpc/include/asm/sstep.h          |   1 +
 arch/powerpc/include/asm/vdso.h           |   1 +
 arch/powerpc/kernel/cpu_setup_power.S     |   2 +-
 arch/powerpc/kernel/cputable.c            |   3 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c         |   1 +
 arch/powerpc/kernel/entry_64.S            | 158 +++++++++++++++++++++-
 arch/powerpc/kernel/exceptions-64s.S      | 150 +++++++++++++++++++-
 arch/powerpc/kernel/process.c             |  10 +-
 arch/powerpc/kernel/setup_64.c            |   5 +-
 arch/powerpc/kernel/signal.c              |  19 ++-
 arch/powerpc/kernel/signal_64.c           |  28 +++-
 arch/powerpc/kernel/syscall_64.c          |  32 +++--
 arch/powerpc/kernel/vdso.c                |   2 +
 arch/powerpc/kernel/vdso64/sigtramp.S     |  34 ++++-
 arch/powerpc/kernel/vdso64/vdso64.lds.S   |   1 +
 arch/powerpc/lib/sstep.c                  |  14 ++
 arch/powerpc/perf/callchain_64.c          |   9 +-
 arch/powerpc/platforms/pseries/setup.c    |   8 +-
 arch/powerpc/xmon/xmon.c                  |   1 +
 28 files changed, 492 insertions(+), 57 deletions(-)

-- 
2.23.0

