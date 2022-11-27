Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 120D6639A9C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 13:50:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKpNx6pFMz3cJ2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 23:50:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PFWQSDQt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PFWQSDQt;
	dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKpN24YrMz2xsD
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 23:49:53 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id f3so7649739pgc.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 04:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RwMLZWYxereVNt+QC+1dKbaDprRFk7Ed+UlCUvjR76Y=;
        b=PFWQSDQtYZuRJIv6tYLsm0zWan6ypjl1RQEU0P3RR2Ic5/9isbrA42GZB42XKEpxyh
         ugrwkAhJFQHwEQwYgwNfWnghk+DWULhXO1DkdvMWnXo32ORujBXCTJGJpAwEfazPUsUr
         vHLWgv/3jBs58mhV0onQ7XHf5EA3mYHKEtjiI09KNq2kT7CSXAOFMWBZYDu6W+USdGW7
         hT1T+G4gNFDb7gcSsFd4z0AKXW3Bw1qOdZgHU52Z65YsmI45OtVvjqnVm0SgsDzOr+0j
         JoZpCqdaUkYllrHUgDV9b7JSQVSIA6xz5acsNhjIw9TFyehpYgCalCqCQ8///6M5IH5u
         LjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RwMLZWYxereVNt+QC+1dKbaDprRFk7Ed+UlCUvjR76Y=;
        b=sMmW1pml5EXjLN+9AtkzXdb7g9bQP4RIkz8wwzr+rm8KGZjokKYwCmjE3FQr19esvz
         DPr/4i8Nc4cfObN+FjCAc+OZIjHTeaAdsmN6yHLeXxxHya8l7Oac1QgmqvGngB1FM1bk
         Dy5CkoRIOHK8/ltn8KiJ2B9Ndxczj8NNasMf3yxAVo4pLDrGkP0ywEPz7RSF+rwWlsN0
         Twf+6xtBJOQbBKPNi+R/Lhr5ChfQJf9NFH0E9l5Ui6+Hiz5aadhxs8O2LOaQIwQO34h3
         6Ks56YCnt7WR8jbpGBZantWDO+olRWMJ/Bj6yZryYVijNn+AAbeA2oJrDoNQ6ODLoj3b
         Ty9w==
X-Gm-Message-State: ANoB5pm45DFeSKOzsz0EHEQJyfGNcz1DD1yZfywq3diMpAWh84EI4yxN
	2tHRN9t4Yj776lrzXCeyae/gnEf/1sM=
X-Google-Smtp-Source: AA0mqf6GrbwBs4As20NLGzJphYWRDjgI6A/B++hYj+36ugsbZSdckBpSmElR/vdEVGXRRUG39ZI0LQ==
X-Received: by 2002:a05:6a00:d69:b0:55a:d8f6:c65 with SMTP id n41-20020a056a000d6900b0055ad8f60c65mr27429624pfv.32.1669553389377;
        Sun, 27 Nov 2022 04:49:49 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id q13-20020a63e20d000000b00473c36ea150sm5102287pgh.92.2022.11.27.04.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 04:49:48 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/17] powerpc: Remove STACK_FRAME_OVERHEAD
Date: Sun, 27 Nov 2022 22:49:25 +1000
Message-Id: <20221127124942.1665522-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since RFC:
- Fix a compile bug.
- Fix BookE KVM properly. Hopefully -- I don't have a BookE
  KVM environment to test. Can QEMU do it? Is it still tested?
- Drop the last two patches that changed the stack layout, they
  can be done later.
- Drop the load/store-multiple change to 32-bit.

Thanks,
Nick

Nicholas Piggin (17):
  KVM: PPC: Book3E: Fix CONFIG_TRACE_IRQFLAGS support
  powerpc/64: Remove asm interrupt tracing call helpers
  powerpc/perf: callchain validate kernel stack pointer bounds
  powerpc: Rearrange copy_thread child stack creation
  powerpc/pseries: hvcall stack frame overhead
  powerpc: simplify ppc_save_regs
  powerpc: add definition for pt_regs offset within an interrupt frame
  powerpc: add a definition for the marker offset within the interrupt
    frame
  powerpc: Rename STACK_FRAME_MARKER and derive it from frame offset
  powerpc: add a define for the user interrupt frame size
  powerpc: add a define for the switch frame size and regs offset
  powerpc: copy_thread fill in interrupt frame marker and back chain
  powerpc: copy_thread add a back chain to the switch stack frame
  powerpc: split validate_sp into two functions
  powerpc: allow minimum sized kernel stack frames
  powerpc/64: ELFv2 use minimal stack frames in int and switch frame
    sizes
  powerpc: remove STACK_FRAME_OVERHEAD

 arch/powerpc/include/asm/irqflags.h           | 58 -------------
 arch/powerpc/include/asm/kvm_ppc.h            | 12 +++
 arch/powerpc/include/asm/processor.h          | 15 +++-
 arch/powerpc/include/asm/ptrace.h             | 37 ++++++---
 arch/powerpc/kernel/asm-offsets.c             |  9 +-
 arch/powerpc/kernel/entry_32.S                | 14 ++--
 arch/powerpc/kernel/exceptions-64e.S          | 44 +++++-----
 arch/powerpc/kernel/exceptions-64s.S          | 82 +++++++++----------
 arch/powerpc/kernel/head_32.h                 |  4 +-
 arch/powerpc/kernel/head_40x.S                |  2 +-
 arch/powerpc/kernel/head_44x.S                |  6 +-
 arch/powerpc/kernel/head_64.S                 |  6 +-
 arch/powerpc/kernel/head_85xx.S               |  8 +-
 arch/powerpc/kernel/head_8xx.S                |  2 +-
 arch/powerpc/kernel/head_book3s_32.S          |  4 +-
 arch/powerpc/kernel/head_booke.h              |  4 +-
 arch/powerpc/kernel/interrupt_64.S            | 32 ++++----
 arch/powerpc/kernel/irq.c                     |  4 +-
 arch/powerpc/kernel/kgdb.c                    |  2 +-
 arch/powerpc/kernel/misc_32.S                 |  2 +-
 arch/powerpc/kernel/misc_64.S                 |  4 +-
 arch/powerpc/kernel/optprobes_head.S          |  4 +-
 arch/powerpc/kernel/ppc_save_regs.S           | 57 ++++---------
 arch/powerpc/kernel/process.c                 | 54 +++++++-----
 arch/powerpc/kernel/smp.c                     |  2 +-
 arch/powerpc/kernel/stacktrace.c              | 10 +--
 arch/powerpc/kernel/tm.S                      |  8 +-
 arch/powerpc/kernel/trace/ftrace_mprofile.S   |  2 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S       |  2 +-
 arch/powerpc/kvm/booke.c                      |  3 +
 arch/powerpc/kvm/bookehv_interrupts.S         |  9 --
 .../lib/test_emulate_step_exec_instr.S        |  2 +-
 arch/powerpc/perf/callchain.c                 |  9 +-
 arch/powerpc/platforms/pseries/hvCall.S       | 38 +++++----
 arch/powerpc/xmon/xmon.c                      | 10 +--
 35 files changed, 259 insertions(+), 302 deletions(-)

-- 
2.37.2

