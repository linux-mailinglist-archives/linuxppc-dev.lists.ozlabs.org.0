Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F916568DB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Dec 2022 10:28:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nh8TN5ZRnz3c8g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Dec 2022 20:28:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aamR/mAK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aamR/mAK;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nh8RP1NY8z2y6F
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Dec 2022 20:26:23 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id s7so12735772plk.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Dec 2022 01:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UzpuVVJE/4f9S992+1hhG0ZVP4BI2lu1xS7R6Fho8vs=;
        b=aamR/mAKshjNJmoEv1/QsWs0hmz85etjLEuDf4cuXKNVu34YVy7hIYNrjq65yUp3GD
         +puawyIz7Xb0XFG/hfLb4LnxA8pHEoj2ZkUnRTiCdMK2n7nt/k9RbO59SXNSbTI4r/un
         9VIBaR4tLhdzKm95BD6a6uVD3hKH2gOG96qb//FaAEH2mcmh7sZdzKAHJ1Et3K4aFTtH
         rhqb1CQOQ2fqsn8nQyE6yp7JaaFACTheyarJ0a3E32eoth+sVO6PYHFenSqSnAAzKtWR
         /In5c57T95jupNwLckN8QItTSAjmYkWNSFbLEe7tOSqrq/EgQzCI8frTltREk9OPVVoW
         bKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UzpuVVJE/4f9S992+1hhG0ZVP4BI2lu1xS7R6Fho8vs=;
        b=Jk1lTJvzPob+e3hAlkps1oDUQ6R3tpaPJEu3qe/E71M8ysJW369U7Gul8dMeVnGExG
         BjXdWDS/r8tm8Fxvwz1FoDAUxzMOhSFY2MvxWNpqSPXjxbRKKuB5w+76L0YjhySy3991
         vDCh7/5iqDHstU5OztrY7Jf166vwiVoJWp+rkF5f9BMaoul4IHjU/fxnmLaK1hhpcCuG
         WoVc/PvUBHMsarPSw2Qv1J26IqnXLquvCVPraFezNHjPyIhTJrphFzaMmuqQU1lji9/5
         MJuL4hHGXYrl4doFVnbGwixWeVRUuXhPGHOJx8TVY/qD7JYNiSXnQgrmZF340Hw/9qQO
         Pl6w==
X-Gm-Message-State: AFqh2koi8UAhQKadH3V9DUasxWCkwYVFhlJU1ny0B157vOZ8PRL2bhCx
	qqhI0zC9h+/39swrknlHN6kdRzBbSvA=
X-Google-Smtp-Source: AMrXdXt9JHbk5mn7iivYUPu0mDbeNzM55nUrk22Gcl/y7HT34xUOya46R7BHDUpWCdrfy/MSEeaA4Q==
X-Received: by 2002:a17:902:728d:b0:191:3993:801e with SMTP id d13-20020a170902728d00b001913993801emr19674931pll.56.1672133178319;
        Tue, 27 Dec 2022 01:26:18 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (58-6-252-227.tpgi.com.au. [58.6.252.227])
        by smtp.gmail.com with ESMTPSA id f2-20020a170902ce8200b00189947bd9f7sm8598998plg.50.2022.12.27.01.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 01:26:17 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 0/9] powerpc/64: Build with PC-Relative addressing
Date: Tue, 27 Dec 2022 19:26:00 +1000
Message-Id: <20221227092609.2078908-1-npiggin@gmail.com>
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

This is a more complete change than my earlier hack. Namely fixed the
boot code so it's more unified rather than adding a special case for
Book3S+PCREL. Lots of bug fixes, and adding some of the ftrace and BPF
trampoline/stubs. And added module support, which might be the most
interesting bit.

This won't see a lot of real use until POWER10 is the oldest supported
CPU for distros, but being as we're quite a unique user of toolchain I'd
like to start ironing things out earlier rather than later. I'm making a
list of observations here, https://github.com/linuxppc/issues/issues/455
and will take them to toolchan developers after the kernel work is a bit
further along.

Thanks,
Nick

Nicholas Piggin (9):
  crypto: powerpc - Use address generation helper for asm
  powerpc/64s: Refactor initialisation after prom
  powerpc/64e: Simplify address calculation in secondary hold loop
  powerpc/64: Move initial base and TOC pointer calculation
  powerpc/64s: Run at the kernel virtual address earlier in boot
  powerpc: add CFUNC assembly label annotation
  powerpc/64: Add support to build with prefixed instructions
  powerpc/64: vmlinux support building with PCREL addresing
  powerpc/64: modules support building with PCREL addresing

 arch/powerpc/Kconfig                    |   6 +
 arch/powerpc/Makefile                   |  10 +
 arch/powerpc/crypto/crc32-vpmsum_core.S |  13 +-
 arch/powerpc/include/asm/atomic.h       |  24 +-
 arch/powerpc/include/asm/io.h           |  37 +++
 arch/powerpc/include/asm/module.h       |   9 +-
 arch/powerpc/include/asm/paca.h         |   2 +
 arch/powerpc/include/asm/ppc-opcode.h   |   8 +
 arch/powerpc/include/asm/ppc_asm.h      |  24 ++
 arch/powerpc/include/asm/sections.h     |   5 +
 arch/powerpc/include/asm/uaccess.h      |  28 +-
 arch/powerpc/include/uapi/asm/elf.h     |   4 +
 arch/powerpc/kernel/asm-offsets.c       |   2 +
 arch/powerpc/kernel/exceptions-64s.S    | 112 ++++----
 arch/powerpc/kernel/head_64.S           | 179 +++++++-----
 arch/powerpc/kernel/interrupt_64.S      |  28 +-
 arch/powerpc/kernel/irq.c               |   8 +
 arch/powerpc/kernel/misc_64.S           |   2 +-
 arch/powerpc/kernel/module_64.c         | 344 ++++++++++++++++++++----
 arch/powerpc/kernel/paca.c              |   2 +
 arch/powerpc/kernel/trace/ftrace.c      |  52 +++-
 arch/powerpc/kernel/vdso/gettimeofday.S |   6 +-
 arch/powerpc/kernel/vector.S            |   6 +
 arch/powerpc/kernel/vmlinux.lds.S       |   6 +
 arch/powerpc/kvm/book3s_hv_rmhandlers.S |  16 +-
 arch/powerpc/lib/copypage_64.S          |   4 +-
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
 36 files changed, 793 insertions(+), 263 deletions(-)

-- 
2.37.2

