Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E6B5BCDD9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 16:02:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWRFg4vJZz3blb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 00:02:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XNaIlDhO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XNaIlDhO;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWRF90N3gz3bSV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 00:02:02 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id x1so28003947plv.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 07:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=RrY4pbAR9r4cWgnXw1C9PXG1tYIZyR6yQsWkcqf4EW8=;
        b=XNaIlDhOxGQ89pjPaZa5eykUj1uayPgeMc1TU2pMGcbd7GeZUennX6/qN8zO66rjb2
         jXZ1HaCjMhecb7mbxZ0wjHDta/eG4JsfiyxyDQ16fRDhV05m6utQ+GDhSWZS4CVw9YtX
         WUqTRyY9gD91hzj89vt11TTChyLgBq6yl3S0I/5oU31YQCisvrQzeVwlklfP8gUgxzdr
         d1AkvhNbec4e5dhG2NK+ULaIUjpBnvlcb06lgW3M1HGtkbGCvKUBLHWBGQMPQP+kgZjd
         /BrGMkXlO1d98FvRvYl2/5Hqq9ndUbW8XdLszhnmqXstGoQuaeM+PxmKupeT3ZaJRIHm
         5hRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=RrY4pbAR9r4cWgnXw1C9PXG1tYIZyR6yQsWkcqf4EW8=;
        b=mFqFKObiJVflezH7xmTQYiUohCkGjC7xFCovx5o6ee2i/JT9+tlWOzTo/I0AfgOZoy
         sxY0n0r6qBQs8c8KG2lMKEOcQ8Qg6Qfw4UxrCKn7zOg9aXiKbBGFclxJyQuji6Q7zinr
         Kw2DapYPQJCbKEhn3xe2C7Ipu+3U27apYamPZSnFbDQsqHmZs+3bPnSKSDvt0mRdixW4
         b4+41PfJhUZ1mDPfAHT5XqnLnQC/ggLhB0xpiu8BvpzIKHjc5BuqEisYcEUf8gqPI6lW
         upEMM3K4W3/ARZ/WtnWlI0FToqyNHPYpU2SCfTDzjDiNfuPrzv8L3Fi1L+dKAAn32fMJ
         KHdA==
X-Gm-Message-State: ACrzQf2UTbSNegv+eNuM3Wy37Ri1xzcNux0Vew/TiTUqcWY+7oVp4VGa
	qVkLgAY3ikKdX9JyJFp1YH8A57EEtNo=
X-Google-Smtp-Source: AMsMyM4z/5JVKyRYBRvNTfzwZK+Cr1/4/4y9FLsgUmnuyxRtrakVjUVK5YzY9rE96cRvlpuhoh5DtA==
X-Received: by 2002:a17:90b:30d0:b0:200:22a4:bfcf with SMTP id hi16-20020a17090b30d000b0020022a4bfcfmr30185356pjb.181.1663596119319;
        Mon, 19 Sep 2022 07:01:59 -0700 (PDT)
Received: from bobo.ibm.com (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id p8-20020a170902780800b001637529493esm20477931pll.66.2022.09.19.07.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 07:01:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 0/7] powerpc: first hack at pcrel addressing
Date: Tue, 20 Sep 2022 00:01:42 +1000
Message-Id: <20220919140149.4018927-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pcrel surprisingly didn't take much to get working, at least if
we ignore the hard bits (modules, ftrace, kprobes...). I'd like
to get it merged so we can incrementally fix the missing
bits. The series is functional but not quite polished, so this
is a good point to see if people agree with the approach.

Aside from polishing, the major bit missing before merge is Kconfig
detection of compiler pcrel feature.

Thanks,
Nick

Nicholas Piggin (7):
  powerpc: use 16-bit immediate for STACK_FRAME_REGS_MARKER
  powerpc/64: abstract asm global variable declaration and access
  powerpc/64: provide a helper macro to load r2 with the kernel TOC
  powerpc: add CFUNC assembly label annotation
  powerpc/64s: update generic cpu option name and compiler flags
  powerpc/64s: POWER10 CPU Kconfig build option
  powerpc/64s: Add option to build vmlinux with pcrel addressing

 arch/powerpc/Makefile                         |  22 ++-
 arch/powerpc/boot/opal-calls.S                |   6 +-
 arch/powerpc/boot/ppc_asm.h                   |   4 +
 arch/powerpc/include/asm/atomic.h             |  20 ++-
 arch/powerpc/include/asm/io.h                 |  36 ++++
 arch/powerpc/include/asm/ppc_asm.h            | 157 +++++++++++++++++-
 arch/powerpc/include/asm/ptrace.h             |   6 +-
 arch/powerpc/include/asm/uaccess.h            |  22 +++
 arch/powerpc/kernel/entry_32.S                |   9 +-
 arch/powerpc/kernel/exceptions-64e.S          |  12 +-
 arch/powerpc/kernel/exceptions-64s.S          | 116 ++++++-------
 arch/powerpc/kernel/head_32.h                 |   3 +-
 arch/powerpc/kernel/head_64.S                 |  58 +++++--
 arch/powerpc/kernel/head_booke.h              |   3 +-
 arch/powerpc/kernel/interrupt_64.S            |  56 +++----
 arch/powerpc/kernel/irq.c                     |   4 +
 arch/powerpc/kernel/misc_64.S                 |   2 +-
 arch/powerpc/kernel/optprobes_head.S          |   2 +-
 arch/powerpc/kernel/swsusp_asm64.S            |  22 +--
 arch/powerpc/kernel/trace/ftrace_mprofile.S   |   7 +-
 arch/powerpc/kernel/vdso/gettimeofday.S       |   2 +-
 arch/powerpc/kernel/vector.S                  |  41 ++---
 arch/powerpc/kernel/vmlinux.lds.S             |   6 +
 arch/powerpc/kvm/book3s_hv_rmhandlers.S       |  16 +-
 arch/powerpc/lib/copypage_64.S                |  11 +-
 arch/powerpc/lib/copypage_power7.S            |   4 +-
 arch/powerpc/lib/copyuser_power7.S            |   8 +-
 arch/powerpc/lib/hweight_64.S                 |   8 +-
 arch/powerpc/lib/memcmp_64.S                  |   4 +-
 arch/powerpc/lib/memcpy_power7.S              |   6 +-
 arch/powerpc/lib/string_64.S                  |   9 +-
 arch/powerpc/perf/bhrb.S                      |   2 +-
 arch/powerpc/platforms/Kconfig.cputype        |  30 +++-
 .../powerpc/platforms/powernv/opal-wrappers.S |   2 +-
 arch/powerpc/platforms/pseries/hvCall.S       |  14 +-
 arch/powerpc/xmon/spr_access.S                |   4 +-
 36 files changed, 502 insertions(+), 232 deletions(-)

-- 
2.37.2

