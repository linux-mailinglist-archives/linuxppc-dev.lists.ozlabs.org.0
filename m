Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2476F7DA8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 09:19:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCMWm4vvgz3fFm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 17:19:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=SeFpwzWz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=SeFpwzWz;
	dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCMVt4dLzz3c6H
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 17:19:02 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6436e075166so1123717b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 May 2023 00:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683271140; x=1685863140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=36Xmxg1WYSQ/MSuUvJxDzsHOMeHtkjW8yCnvfo0ekI8=;
        b=SeFpwzWzcu749OjWs+4bpINgZzXt/059vGxsGMQEnOYeTVxqZZHGZgByCRFqsHPlMy
         dnFGiTsqfKdEajx6a1ErmBAIe71JeLnJj6gCI/LKzdd2JNUlyxOLL4fZYeWyUmpSXll2
         IGl3EVhGf2muHK0t+5//LmBZ9Eiws1NjwMhwk8GW3/DTf3oc4PUsME43n41i8k55vWVt
         fnjQAGbOPm+yZEzTzAyMEfGzlDDyLlbOVd3z5Z4EHdux32TvuJMcAXN07zsbb4WQhA48
         7Gb9iSoOKq0gsaL9HQeduHRYNURxUZlz7deS6c8poZr4w+RyGaPL7jbi4fF4qnIFboQh
         YJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683271140; x=1685863140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=36Xmxg1WYSQ/MSuUvJxDzsHOMeHtkjW8yCnvfo0ekI8=;
        b=eub/Bnsywe070o7gB5hUPcmx4O28tyWDrSPpoi5S+TABp4RIiOGRAI/O7bvTjEAtpZ
         I3YE1bTHZ6Nm3nzD5H6P16lJFjtM7NdfOW97/Voy5DE0iP5GVZ2AZ4KQlcL6Z1bV31cd
         WP6YjVbsy6BEENZvk9sBtQ3UQxrA4sjjGngUjkCt91LkUs8aByRDgFLWaDNeC4olVQ5S
         vB5LbCs2WiArgssYxRxOIRF0KITxbQWZQv/LBFgHNNePuyU33lE0ywHECOLQLvURHVSw
         /u8EYdG3BNCHrAKCizA1JsUmVn8rzKRHiDhb/yFgUOlKSF36Lpc0qTHa/x289qmKfjdB
         kzzA==
X-Gm-Message-State: AC+VfDxLVMZxQ512ecqc0EldHfxe+iwkmTNKJr9m0XvTB19diloB/Prx
	PDOzb7TgKpvUKMXFnjGcQnn1brVwwxE=
X-Google-Smtp-Source: ACHHUZ6Bac6VbPK/v8279U9cNe7ZddkqLShFStKRhxY92T953WeSEIIUnW5+f08GReIrm+CYy5Ayzw==
X-Received: by 2002:a05:6a00:15ca:b0:63b:19e5:a9ec with SMTP id o10-20020a056a0015ca00b0063b19e5a9ecmr1165829pfu.33.1683271139891;
        Fri, 05 May 2023 00:18:59 -0700 (PDT)
Received: from wheely.local0.net ([203.59.190.92])
        by smtp.gmail.com with ESMTPSA id i10-20020aa78d8a000000b00625d84a0194sm915384pfr.107.2023.05.05.00.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 00:18:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/4] powerpc/64: ELFv2 conversion
Date: Fri,  5 May 2023 17:18:46 +1000
Message-Id: <20230505071850.228734-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
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

This series has the steps to remove ELFv1 from the kernel build.
Patch 1 is a build fix, 2 defaults everything to ELFv2, 3 is
really a separate issue that concerns userspace. 4 removes v1
support.

Would like to try getting patch 1 in as a fix, then 2,3 merged in
the next merge window.

Thanks,
Nick

Nicholas Piggin (4):
  powerpc/64: Force ELFv2 when building with LLVM linker
  powerpc/64: Make ELFv2 the default for big-endian builds
  powerpc/64s: Remove support for ELFv1 little endian userspace
  powerpc/64: Remove support for kernel's built with ELFv1 ABI

 arch/powerpc/Kconfig                     | 21 ------
 arch/powerpc/Makefile                    | 15 +----
 arch/powerpc/boot/Makefile               |  4 +-
 arch/powerpc/include/asm/code-patching.h | 36 ++--------
 arch/powerpc/include/asm/elf.h           |  6 ++
 arch/powerpc/include/asm/kfence.h        |  4 --
 arch/powerpc/include/asm/linkage.h       |  9 ---
 arch/powerpc/include/asm/module.h        |  3 -
 arch/powerpc/include/asm/ppc_asm.h       | 38 +----------
 arch/powerpc/include/asm/ptrace.h        | 17 +----
 arch/powerpc/include/asm/sections.h      |  4 --
 arch/powerpc/include/asm/thread_info.h   |  6 +-
 arch/powerpc/kernel/exceptions-64s.S     |  2 +-
 arch/powerpc/kernel/fadump.c             |  6 +-
 arch/powerpc/kernel/head_64.S            |  5 +-
 arch/powerpc/kernel/interrupt_64.S       |  4 --
 arch/powerpc/kernel/kprobes.c            | 39 +----------
 arch/powerpc/kernel/misc_64.S            |  4 --
 arch/powerpc/kernel/module.c             |  8 ---
 arch/powerpc/kernel/module_64.c          | 84 ++++--------------------
 arch/powerpc/kernel/trace/ftrace.c       | 10 ---
 arch/powerpc/kernel/vdso/Makefile        |  2 +-
 arch/powerpc/kernel/vdso/gettimeofday.S  |  2 +-
 arch/powerpc/kernel/vmlinux.lds.S        |  8 ---
 arch/powerpc/kvm/book3s_hv_rmhandlers.S  | 36 +++++-----
 arch/powerpc/kvm/book3s_interrupts.S     | 14 ++--
 arch/powerpc/kvm/book3s_rmhandlers.S     | 12 +---
 arch/powerpc/net/bpf_jit.h               |  6 --
 arch/powerpc/net/bpf_jit_comp.c          | 14 ++--
 arch/powerpc/net/bpf_jit_comp64.c        | 13 ++--
 arch/powerpc/platforms/Kconfig.cputype   |  6 --
 drivers/crypto/vmx/Makefile              |  4 --
 kernel/extable.c                         |  2 +-
 kernel/trace/ftrace.c                    | 12 ----
 34 files changed, 79 insertions(+), 377 deletions(-)

-- 
2.40.1

