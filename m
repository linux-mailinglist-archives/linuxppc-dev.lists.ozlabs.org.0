Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B22C613006
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 06:56:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N12Tb75jfz3cHw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 16:56:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DScf6Dmm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DScf6Dmm;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N12Rd3Kv3z2ygC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 16:54:52 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id u8-20020a17090a5e4800b002106dcdd4a0so14980234pji.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 22:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=se3q0Sc63N8ec1lsUADCKnNvzxyV//wSu7eaF78udvw=;
        b=DScf6DmmcGt5TofMVW0REkldJkbIn8BpAUWRQ22uDdQM+x60QYwy0TZ1kaGSiKPuH9
         E9VLO7MMOuonaHxsVVygDt1+F6YL2dVlc9fRqLWxNu+0YEX2cTh2qPK+o/0o4BUEzHKv
         VAVWUJXjJPeyH3hjLpDykiIhI8PzI6rvMgZWvww3SHXNVrL2f5+pvJmo13a38gLeo94c
         Rtee6VoLmIXyda6S/o0RRGtEIeHVqKGsdbGHUiqUW3HmlTLicwrJ81q6dZvaQFcmhlXA
         knynr6ZtL7rx8vO/MwQvUXn0ZrbRRYrvUWC6pyFc603FZ077gMTHZK3Hh0EC5f6kgUDb
         O/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=se3q0Sc63N8ec1lsUADCKnNvzxyV//wSu7eaF78udvw=;
        b=YvS3zPPSlXp/FapsIQn0z8/TK0BiQL1Oflj6itkktqTK07KiF3Omt1+kJ/E7qVfSKZ
         g0M2zHW6cy618dg1D9Rvn751vfQNnLQm1twbakxeZ16somiSTHVtHZV1VeW+qNNy+npP
         PFbyYLrEU6eZ3v2JQvwx/R/FAr9h2Xczsq9fFGXizbz/YQ9Uc0DJon0RmV/BUXG8f6T/
         K1Odp5wdzaylyt7+TgT2vFoOVOOHuiB1N8fLyjGE4Hy/8iqsTymtA9GrkZyBich7KDkn
         kRTi8zGGXeAuMO+TdTvv78DcQ3R5e/ee908ztoI0f0YKGPzGFgKhiAVT+tuwf7r7jPRj
         RQxg==
X-Gm-Message-State: ACrzQf0gcrV0CrxmsSPIeG9qa+ojU0I1amqq+PtdxjDKfyEWML6HREyY
	FLB0HlYXD6MCQLe5R0QLMjj47FbjRTg=
X-Google-Smtp-Source: AMsMyM6eWMSjamFP7yhoXDIel1PPPdS+cKqqoeBLxGkbE34zFEUPgvFaqlbqsHTb0H6yR3l6jhgPjw==
X-Received: by 2002:a17:90b:400e:b0:213:de3a:a20e with SMTP id ie14-20020a17090b400e00b00213de3aa20emr4393672pjb.195.1667195687615;
        Sun, 30 Oct 2022 22:54:47 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id d62-20020a623641000000b005627ddbc7a4sm3599599pfa.191.2022.10.30.22.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 22:54:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 00/19] Remove STACK_FRAME_OVERHEAD
Date: Mon, 31 Oct 2022 15:54:21 +1000
Message-Id: <20221031055440.3594315-1-npiggin@gmail.com>
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

This is some quick hacking, hardly tested but might have potential.

I think we're not validating the perf kernel stack walker bounds
quite correctly, and not setting up decent stack frames for the child
in copy_thread. So at least those two things we could do. Maybe
patch 1 should go upstream as a fix.

Thanks,
Nick

Nicholas Piggin (19):
  powerpc/perf: callchain validate kernel stack pointer bounds
  powerpc: Rearrange copy_thread child stack creation
  powerpc/64: Remove asm interrupt tracing call helpers
  powerpc/pseries: hvcall stack frame overhead
  powerpc/32: Use load and store multiple in GPR save/restore macros
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
  powerpc: change stack marker memory operations to 32-bit
  powerpc/64: ELFv2 use reserved word in the stack frame for the regs
    marker

 arch/powerpc/include/asm/irqflags.h           | 29 -------
 arch/powerpc/include/asm/ppc_asm.h            | 18 +++-
 arch/powerpc/include/asm/processor.h          | 15 +++-
 arch/powerpc/include/asm/ptrace.h             | 41 +++++++---
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
 arch/powerpc/kernel/ppc_save_regs.S           | 58 ++++---------
 arch/powerpc/kernel/process.c                 | 54 +++++++-----
 arch/powerpc/kernel/smp.c                     |  2 +-
 arch/powerpc/kernel/stacktrace.c              | 10 +--
 arch/powerpc/kernel/tm.S                      |  8 +-
 arch/powerpc/kernel/trace/ftrace_mprofile.S   |  2 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S       |  2 +-
 .../lib/test_emulate_step_exec_instr.S        |  2 +-
 arch/powerpc/perf/callchain.c                 |  9 +-
 arch/powerpc/platforms/pseries/hvCall.S       | 38 +++++----
 arch/powerpc/xmon/xmon.c                      | 10 +--
 33 files changed, 263 insertions(+), 268 deletions(-)

-- 
2.37.2

