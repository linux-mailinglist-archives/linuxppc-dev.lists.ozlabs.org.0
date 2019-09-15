Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47971B2D8D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 03:30:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WBdh3GzczF5pw
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 11:30:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XVK8+KMD"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WBbM11r3zF5pl
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2019 11:28:30 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id 4so17238889pgm.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 18:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aTYLKIjzuo4ebngefpf2lIDCWUAwqQfGZrtOcbPKL+I=;
 b=XVK8+KMDYiv7kK0/TlN1LwufxyzXrQKG6aNJYMBD8OmyPtdQxDlAdAfGKHP/1bxHBe
 niIOd4o3bcy7ymSULI6FoYuJBK5jWIhfJXWXwqzOD8sgdTjQGZ5AiP3kwF2QmL4wOkLg
 XeH+bLqNpqpH4cisyMkAk4G9ahwTntjsTVeDz5r+T0iw3f7TcSRZg5K4xzMQbXwf5oLy
 GoU2jIHiBSiUZYMxwhqOss0zEmX1vV7/ALLiKiMJ1C+JpDR5sI8jXfOqENLXP5VP+MfP
 jvAYrOzC4BLSaV80KLSJ65Dkws1Aq0HcBMXBgciFvSf0prTQ/5ieWPRb/JH/2DurPMk6
 kBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aTYLKIjzuo4ebngefpf2lIDCWUAwqQfGZrtOcbPKL+I=;
 b=UgBQkAsS2izHrSCOLShGSc+rUfIzf2VEyMZh9UEFQpwmNRcbbZ3WQoJGlhVdygncdh
 kbdWc9dap9f4PQBOgTW/ypCYOldEjLAsGyyoMF9nyqLhuxVCszrRY69q+9WFz7YY4QJL
 ehNqGcPng8fUTkNAGneJtJyq1Tnr7zhkeYoUX86KXOkJzWx6gEvMkbGwrK97eCGCaoXg
 1ql+STTiI08aH4NN4jS5JzoO8QHGv+fGcV+jyMQexnHthZM6KZZNQfGjGsFGzI1zDQAF
 4M07qB5RBPC5pMU9gvt0Wek77cd+NkKhLE+Qf+Rg56idjnDsV/hPhPdaGJ9sX2TNg1DS
 arHA==
X-Gm-Message-State: APjAAAWMw3dlNwZFAu92xZBUPmUMk/q/oNzQD88mM3CL5X2uivM7j63U
 +x2HvHBQNe0bxcr/7Y1gJlF0wbVT
X-Google-Smtp-Source: APXvYqyOH3mqI+5MPLZ069Ek/yK/7gDdoaEW4i5TGviupqCnsQhlq4c8jkHZ6hwIViLL5Nx90+zwwg==
X-Received: by 2002:a17:90a:ac16:: with SMTP id
 o22mr13648375pjq.8.1568510906301; 
 Sat, 14 Sep 2019 18:28:26 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id bt1sm6267043pjb.17.2019.09.14.18.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 18:28:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 00/27] current interrupt series plus scv syscall
Date: Sun, 15 Sep 2019 11:27:46 +1000
Message-Id: <20190915012813.29317-1-npiggin@gmail.com>
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

My interrupt entry patches have finally collided with syscall and
interrupt exit patches, so I'll merge the series. Most patches have
been seen already, however there have been a number of small changes
and fixes throughout the series.

The final two patches add support for 'scv' and 'rfscv' instructions.

I'm posting this out now so we can start considering ABI and userspace
support. We have the PPC_FEATURE2_SCV hwcap for this.

Thanks,
Nick

Nicholas Piggin (27):
  powerpc/64s/exception: Introduce INT_DEFINE parameter block for code
    generation
  powerpc/64s/exception: Add GEN_COMMON macro that uses INT_DEFINE
    parameters
  powerpc/64s/exception: Add GEN_KVM macro that uses INT_DEFINE
    parameters
  powerpc/64s/exception: Expand EXC_COMMON and EXC_COMMON_ASYNC macros
  powerpc/64s/exception: Move all interrupt handlers to new style code
    gen macros
  powerpc/64s/exception: Remove old INT_ENTRY macro
  powerpc/64s/exception: Remove old INT_COMMON macro
  powerpc/64s/exception: Remove old INT_KVM_HANDLER
  powerpc/64s/exception: Add ISIDE option
  powerpc/64s/exception: move real->virt switch into the common handler
  powerpc/64s/exception: move soft-mask test to common code
  powerpc/64s/exception: move KVM test to common code
  powerpc/64s/exception: remove confusing IEARLY option
  powerpc/64s/exception: remove the SPR saving patch code macros
  powerpc/64s/exception: trim unused arguments from KVMTEST macro
  powerpc/64s/exception: hdecrementer avoid touching the stack
  powerpc/64s/exception: re-inline some handlers
  powerpc/64s/exception: Clean up SRR specifiers
  powerpc/64s/exception: add more comments for interrupt handlers
  powerpc/64s/exception: only test KVM in SRR interrupts when PR KVM is
    supported
  powerpc/64s/exception: soft nmi interrupt should not use
    ret_from_except
  powerpc/64: system call remove non-volatile GPR save optimisation
  powerpc/64: system call implement the bulk of the logic in C
  powerpc/64s: interrupt return in C
  powerpc/64s/exception: remove lite interrupt return
  powerpc/64s/exception: treat NIA below __end_interrupts as soft-masked
  powerpc/64s: system call support for scv/rfscv instructions

 arch/powerpc/include/asm/asm-prototypes.h     |   11 -
 .../powerpc/include/asm/book3s/64/kup-radix.h |   24 +-
 arch/powerpc/include/asm/cputime.h            |   24 +
 arch/powerpc/include/asm/exception-64s.h      |    4 -
 arch/powerpc/include/asm/head-64.h            |    2 +-
 arch/powerpc/include/asm/hw_irq.h             |    4 +
 arch/powerpc/include/asm/ppc_asm.h            |    2 +
 arch/powerpc/include/asm/processor.h          |    2 +-
 arch/powerpc/include/asm/ptrace.h             |    3 +
 arch/powerpc/include/asm/signal.h             |    3 +
 arch/powerpc/include/asm/switch_to.h          |   11 +
 arch/powerpc/include/asm/time.h               |    4 +-
 arch/powerpc/kernel/Makefile                  |    3 +-
 arch/powerpc/kernel/cpu_setup_power.S         |    2 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c             |    1 +
 arch/powerpc/kernel/entry_64.S                |  964 ++------
 arch/powerpc/kernel/exceptions-64e.S          |  254 +-
 arch/powerpc/kernel/exceptions-64s.S          | 2046 ++++++++++++-----
 arch/powerpc/kernel/process.c                 |    2 +
 arch/powerpc/kernel/signal.h                  |    2 -
 arch/powerpc/kernel/syscall_64.c              |  422 ++++
 arch/powerpc/kernel/syscalls/syscall.tbl      |   22 +-
 arch/powerpc/kernel/systbl.S                  |    9 +-
 arch/powerpc/kernel/time.c                    |    9 -
 arch/powerpc/kernel/vector.S                  |    2 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S       |   11 -
 arch/powerpc/kvm/book3s_segment.S             |    7 -
 27 files changed, 2458 insertions(+), 1392 deletions(-)
 create mode 100644 arch/powerpc/kernel/syscall_64.c

-- 
2.23.0

