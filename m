Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE986DB81B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 04:19:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ptf7w64GRz3fb4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 12:19:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YES0KXe9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YES0KXe9;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ptf670szxz3cjW
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 12:18:06 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id v9so5021370pjk.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Apr 2023 19:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680920281; x=1683512281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EZ5pDWVAfCYMt3CtCued/ZR5758nWJMVEl2HGKc0JRc=;
        b=YES0KXe9KlKz/6DZ4HcEzHh+wkfLDWd05Z+gP2Ob9oN0RgdZtvUDjuGKovUnRg//Up
         xZ1fs0AEdI30u+qDNkIW1v3gG3uQWS8EWuLdazQY9vTbMQgEHiUss4v83yhJTonmXQaO
         OxqOAlQ7g3yFud44nWegVOwBG7225OSBaZCPoFMzfLWutyFFa+Rf276Sno8wHFa1qRyn
         Q6Fg9tNlmPbUBL9tFPAuxB+WHhIZdcOJitgfk5QFGBQYps4MnmJtobwlbFWb1poyR+kH
         7yzm/wG8jY6UA18k896ApQhvSVrSgDLXKOmN6MXT+npQ+ZWcNW5zp5TR4Yt9JMhcxupV
         lm6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680920281; x=1683512281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZ5pDWVAfCYMt3CtCued/ZR5758nWJMVEl2HGKc0JRc=;
        b=tTvMXf6qnRn0gfuuQKRhVeXlDkSEFUdBjW8LcqLLwVeZ4pReJyLHg1VWvMx0sjt+8o
         RJQGes6c+hh8GI5lEO2hs83fYqQ1degA+pYiHJfCsdjbTR9Yk69gh2aNoTlGAFsCirwG
         f2jE1Cr5VchM5XG/JXKztuZNLkn2kBnnFp83SmqMupXTNgRIsl1VGuCUUMnaPbuy5n+q
         rabrpRd2fciyBfOnVC9aNrhhPNiyyfoYhTG9jbuGPWzBTtuBa/aeYJ3xIZzdJojsYFHO
         uMCT4u6JhQk1gZEkdk3CkKPlQvtXd2J20xPfLyPerLaBzSu2CocCCFyZM/hvWTLA26V3
         XplQ==
X-Gm-Message-State: AAQBX9dI074DJ2+V8L+E6hpSzeUOsw3qkDcmuwGXnpPhaYpE+DiPO4Tl
	bzghd3tm2ENKewVgpgQ5cV9Ejz4Fh7ma5g==
X-Google-Smtp-Source: AKy350YD4coUp7MvN+3o8IyI1+Dzs6xhyIryBHySRWXJ8/qrDTJ2XIpPg6nb6EiNjJwYDLEYNZCeyw==
X-Received: by 2002:a17:902:e405:b0:1a4:f1cd:c286 with SMTP id m5-20020a170902e40500b001a4f1cdc286mr516595ple.9.1680920281438;
        Fri, 07 Apr 2023 19:18:01 -0700 (PDT)
Received: from wheely.local0.net ([203.59.189.25])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902654b00b001a19f3a661esm3498577pln.138.2023.04.07.19.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 19:18:00 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/6] powerpc/64: Build with PC-Relative addressing
Date: Sat,  8 Apr 2023 12:17:46 +1000
Message-Id: <20230408021752.862660-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.0
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

This won't see a lot of real use until POWER10 is the oldest supported
CPU for distros, but being as we're quite a unique user of toolchain I'd
like to start ironing things out earlier rather than later. I'm making a
list of observations here, https://github.com/linuxppc/issues/issues/455
and will take them to toolchan developers after the kernel work is a bit
further along.

The series is working pretty well for me on pseries and powernv systems.
Since RFC I've tidied things a bit and fixed the remaining hacks and
known issues, mainly in the module loader.

The first two patches are already posted to the list, boot code changes
that aren't too interesting to toolchain.

Thanks,
Nick

Nicholas Piggin (6):
  powerpc/64: Move initial base and TOC pointer calculation
  powerpc/64s: Run at the kernel virtual address earlier in boot
  powerpc/64: Add support to build with prefixed instructions
  powerpc: add CFUNC assembly label annotation
  powerpc/64: vmlinux support building with PCREL addresing
  powerpc/64: modules support building with PCREL addresing

 arch/powerpc/Kconfig                    |   6 +
 arch/powerpc/Makefile                   |  10 +
 arch/powerpc/include/asm/atomic.h       |  24 +-
 arch/powerpc/include/asm/io.h           |  37 +++
 arch/powerpc/include/asm/module.h       |  10 +-
 arch/powerpc/include/asm/paca.h         |   2 +
 arch/powerpc/include/asm/ppc-opcode.h   |   8 +
 arch/powerpc/include/asm/ppc_asm.h      |  24 ++
 arch/powerpc/include/asm/sections.h     |   5 +
 arch/powerpc/include/asm/uaccess.h      |  28 +-
 arch/powerpc/include/uapi/asm/elf.h     |   4 +
 arch/powerpc/kernel/asm-offsets.c       |   2 +
 arch/powerpc/kernel/exceptions-64s.S    | 112 +++----
 arch/powerpc/kernel/head_64.S           | 130 ++++----
 arch/powerpc/kernel/interrupt_64.S      |  28 +-
 arch/powerpc/kernel/irq.c               |   8 +
 arch/powerpc/kernel/misc_64.S           |   2 +-
 arch/powerpc/kernel/module_64.c         | 376 +++++++++++++++++++++---
 arch/powerpc/kernel/paca.c              |   2 +
 arch/powerpc/kernel/trace/ftrace.c      |  52 +++-
 arch/powerpc/kernel/vdso/gettimeofday.S |   6 +-
 arch/powerpc/kernel/vector.S            |   6 +
 arch/powerpc/kernel/vmlinux.lds.S       |   6 +
 arch/powerpc/kvm/book3s_hv_rmhandlers.S |  16 +-
 arch/powerpc/lib/copypage_64.S          |  10 +
 arch/powerpc/lib/copypage_power7.S      |   4 +-
 arch/powerpc/lib/copyuser_power7.S      |   8 +-
 arch/powerpc/lib/hweight_64.S           |   8 +-
 arch/powerpc/lib/memcmp_64.S            |   4 +-
 arch/powerpc/lib/memcpy_power7.S        |   6 +-
 arch/powerpc/net/bpf_jit.h              |  10 +-
 arch/powerpc/net/bpf_jit_comp64.c       |  35 ++-
 arch/powerpc/platforms/Kconfig.cputype  |  38 +++
 arch/powerpc/platforms/pseries/hvCall.S |   4 +-
 arch/powerpc/xmon/xmon.c                |   2 +
 35 files changed, 814 insertions(+), 219 deletions(-)

-- 
2.40.0

