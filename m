Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CD216ECEA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 18:44:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RmWf3KtxzDqHZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 04:43:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mQaQM1JR; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RmQs54s7zDqMy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:39:49 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id y8so59299pll.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 09:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8ZdWI+TfNWYqALdnoy4sjYz/YQ5S48Y8aUruQjgOKbk=;
 b=mQaQM1JRpAGmFV5OKz0lMKqN/ciw0R/xhQV/iSV1NYS6NAjiSDvLU1lqlvq9QHjeKS
 JWs0K+0/1V2E2Ame7k9pom2KEidi/dzqMYLm13tbdx+/CCReZFuCZV1+zHpXwKh3uzKb
 ye+VSgkAnQoJMETLmQqx0A839W+2NpbLs6DyfBhF2qUj0H1Qh4WU6p95HAZ4P3LtUsRZ
 cJrnHfWlUkBNG+aiJKfBnSRY2qER60X8DMm+ns9ZvyVApC4wzKRm4Kdo4LmTUicqz7pN
 TODI+J+GnDBadcd55/hsf7izGeV0jCsqVtVjXS2qmPq97KpJtqyLq8mUMTncgGX5ofb7
 I+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8ZdWI+TfNWYqALdnoy4sjYz/YQ5S48Y8aUruQjgOKbk=;
 b=F1xe1p3XSqWRCQ0y5PRwcamaFxMyxqTkC7vzyFylNcF3Fa2DTZ0YgoE8rySzmEOLvn
 1nNZhfk4EiewNje7UAjpJ2YgbbHWsDzcbOP1gSR5WzA2g+LyqhI+duXBREIyjlDAMkcO
 CkPsjvxvLa37A+YWM7yPXI8xatbetBVpBKplZUoveYJVSleaUIIU/EFfQE8jBooZj5EB
 TgXrTawF3MPeK6P5vtZngJW3UJZfr4S4cecKqiywp/FOG4OAV9Z965B3DB9Y03x0qwkq
 kWpKrRD4NX1fm4Qpz+pZPFisT76ZtlEKxaBLes9MPnh2w/ly2/TsOKMu9o8a6pFEjGpD
 fF1Q==
X-Gm-Message-State: APjAAAXl8Tllrk63YdAll8DV6/y2BtbhIm8KaqdHZDEkOjAe9Xx/vxdw
 SnRHrg4Z4yhscSXRbtaUniT7vwcu
X-Google-Smtp-Source: APXvYqyCdszmU0jSzjnfSzUwsC5PDRuIkvT6a/O3AIkrcnrhjR7kqZnCwo+oXQxOpn9vhc+9J3/SMw==
X-Received: by 2002:a17:90a:d807:: with SMTP id a7mr90432pjv.15.1582652385204; 
 Tue, 25 Feb 2020 09:39:45 -0800 (PST)
Received: from bobo.ibm.com ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id z63sm14791480pgd.12.2020.02.25.09.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:39:43 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 00/32] powerpc/64: interrupts and syscalls series
Date: Wed, 26 Feb 2020 03:35:09 +1000
Message-Id: <20200225173541.1549955-1-npiggin@gmail.com>
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
Cc: Michal Suchanek <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a long overdue update of the series, with fixes from me Michal
and Michael. Does not include Michal's syscall compat series.

Patches 1-22 are changes to low level 64s interrupt entry assembly
which has been posted before, no change except adding patch 21 and
fixing patch 22 to reconcile irq state in the soft-nmi handler to
avoid preempt warnings.

Patches 23-26 are to turn system call entry/exit code into C. Bunch
of irq and preempt and TM warnings and bugs caught by selftests etc
fixed, plus a few peripheral patches added (sstep and zeroing regs).

Patches 27-29 are to turn interrupt exit code into C. This had a bit
more change, most significantly a change to how interrupt exit soft
irq replay works.

Patches 30-32 are for scv system call support. Lot of changes here
to turn it into something a bit better than RFC quality. Discussion
about ABI seems to be settling and not very controversial.

Thanks,
Nick

Nicholas Piggin (32):
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
  powerpc/64s/exception: sreset interrupts reconcile fix
  powerpc/64s/exception: soft nmi interrupt should not use
    ret_from_except
  powerpc/64: system call remove non-volatile GPR save optimisation
  powerpc/64: sstep ifdef the deprecated fast endian switch syscall
  powerpc/64: system call implement entry/exit logic in C
  powerpc/64: system call zero volatile registers when returning
  powerpc/64: implement soft interrupt replay in C
  powerpc/64s: interrupt implement exit logic in C
  powerpc/64s/exception: remove lite interrupt return
  powerpc/64: system call reconcile interrupts
  powerpc/64s/exception: treat NIA below __end_interrupts as soft-masked
  powerpc/64s: system call support for scv/rfscv instructions

 Documentation/powerpc/syscall64-abi.rst       |   42 +-
 arch/powerpc/include/asm/asm-prototypes.h     |   17 +-
 .../powerpc/include/asm/book3s/64/kup-radix.h |   24 +-
 arch/powerpc/include/asm/cputime.h            |   29 +
 arch/powerpc/include/asm/exception-64s.h      |   10 +-
 arch/powerpc/include/asm/head-64.h            |    2 +-
 arch/powerpc/include/asm/hw_irq.h             |    6 +-
 arch/powerpc/include/asm/ppc_asm.h            |    2 +
 arch/powerpc/include/asm/processor.h          |    2 +-
 arch/powerpc/include/asm/ptrace.h             |    3 +
 arch/powerpc/include/asm/setup.h              |    4 +-
 arch/powerpc/include/asm/signal.h             |    3 +
 arch/powerpc/include/asm/switch_to.h          |   11 +
 arch/powerpc/include/asm/time.h               |    4 +-
 arch/powerpc/kernel/Makefile                  |    3 +-
 arch/powerpc/kernel/cpu_setup_power.S         |    2 +-
 arch/powerpc/kernel/cputable.c                |    3 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c             |    1 +
 arch/powerpc/kernel/entry_64.S                | 1017 +++-----
 arch/powerpc/kernel/exceptions-64e.S          |  287 ++-
 arch/powerpc/kernel/exceptions-64s.S          | 2168 ++++++++++++-----
 arch/powerpc/kernel/irq.c                     |  183 +-
 arch/powerpc/kernel/process.c                 |   89 +-
 arch/powerpc/kernel/setup_64.c                |    5 +-
 arch/powerpc/kernel/signal.h                  |    2 -
 arch/powerpc/kernel/syscall_64.c              |  379 +++
 arch/powerpc/kernel/syscalls/syscall.tbl      |   22 +-
 arch/powerpc/kernel/systbl.S                  |    9 +-
 arch/powerpc/kernel/time.c                    |    9 -
 arch/powerpc/kernel/vector.S                  |    2 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S       |   11 -
 arch/powerpc/kvm/book3s_segment.S             |    7 -
 arch/powerpc/lib/sstep.c                      |    5 +-
 arch/powerpc/platforms/pseries/setup.c        |    8 +-
 34 files changed, 2769 insertions(+), 1602 deletions(-)
 create mode 100644 arch/powerpc/kernel/syscall_64.c

-- 
2.23.0

