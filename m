Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A91488A672E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 11:33:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TxCsEu75;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJf4F3Zt4z3vY4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 19:33:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TxCsEu75;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::a2a; helo=mail-vk1-xa2a.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJf3W2hwlz3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 19:33:09 +1000 (AEST)
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-4daa8e14afbso1378456e0c.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 02:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713259984; x=1713864784; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ndrnd625fhH+o+1Q6bsYpoaFuC2gIYmA4glyfnWSIIc=;
        b=TxCsEu75/irheikAoHfIyUK9WigEQ40HdEiF65Op+VZRHhs54qkbm+/bDvsZhVGl9t
         joGZMMb7dPp+LHl5nvQgVX+G3B1iex0yyZt9zCYfDcsBbsrEyERWpowo7zw/Psk1XXAy
         OnEz9XtScGaSx6A8ej+j8SoYjeclwV2mABKBDm2zJPlXOsz66vzkqEUgoVKu+XD8aEuE
         KiqnXlfMFnkknh/vCx8k3wX9GDs4s6+GJEPbOS3o62bbvTpaAZ6ideJ2x6Hw1eeQV0th
         /NklQmfkSUV3g2JyL0J76zRU5XHDCEcdjKGsT9cnvxcl2nwvs6S3wtzHy1uR8XCamu+t
         knIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713259984; x=1713864784;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ndrnd625fhH+o+1Q6bsYpoaFuC2gIYmA4glyfnWSIIc=;
        b=gMXqEGOfAKHKesBYHMbAP89rg8aanR7JXm0L34X13ANIDHFFaAOc+cNBdAWfFMs0M+
         ENnC8ATpGcSB55HiPFjsapYNAMc3/BXK/zmIZG2oa3tCatcP2unl5ZARyi/gfkxtMx/N
         X3iE5vCfbBMv46GrP9wn5KdtT+G4Toy4ub3pUMq1kuNX4MG6iJxZYyok4pBCwjSefZVJ
         2/836kKIlEgavAH6/dlGA9fpBdSt3yyOD/SKGIeFSwdayDBwwizHwxOovYq2osD9/Hf+
         1EPWKLYt6yFB1B+ZM2ADDZvccYDhNH+P5q2Hgd34g9lfYdMdM25y2VClH6fF6LYt5Zzi
         dwyg==
X-Forwarded-Encrypted: i=1; AJvYcCWu3Mx41aYJtVX3Walp8p3OTmE5+jtOHGobobDt2LxYIOUpdNPqZBY3z1ODvQa7qaYoTB0ip6ILg4VhQrxkQ/ESx71QB7Ul9fdlnKL3JQ==
X-Gm-Message-State: AOJu0Yzl7hIEOPA+laPkXmUUxJC7PXBb0xhHpMsp65wwOg6N3VKEBquJ
	8iDjdVhUfIcAaUq0Iqdow2qseudRb0S3DRHw3bF+7vSVLL06gsYnuTQ6q32WT/VHyZpHiN2oF8B
	+uyeCK5FPmK8/rJrVMNkCvYjPtIzMYtcuAU1b8Q==
X-Google-Smtp-Source: AGHT+IG8D9vuAHmYC+KaM43JW5eMv7zVIbneQHVp8QBSV8dIrkMNPPOSsaQF76mhGJzEt5W5Jxc6s2f74IzVPZ0IMx8=
X-Received: by 2002:a05:6122:31a9:b0:4da:aabe:6f6c with SMTP id
 ch41-20020a05612231a900b004daaabe6f6cmr10367344vkb.7.1713259983821; Tue, 16
 Apr 2024 02:33:03 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 16 Apr 2024 15:02:52 +0530
Message-ID: <CA+G9fYtEh8zmq8k8wE-8RZwW-Qr927RLTn+KqGnq1F=ptaaNsA@mail.gmail.com>
Subject: powerpc: io-defs.h:43:1: error: performing pointer arithmetic on a
 null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, clang-built-linux <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, Jeff Xu <jeffxu@chromium.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The Powerpc clang builds failed due to following warnings / errors on the
Linux next-20240416 tag.

Powerpc:
 - tqm8xx_defconfig + clang-17 - Failed
 - allnoconfig + clang-17 - Failed
 - tinyconfig + clang-17 - Failed

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
--------
In file included from arch/powerpc/kernel/ptrace/ptrace.c:19:
In file included from include/linux/syscalls.h:93:
In file included from include/trace/syscall.h:7:
In file included from include/linux/trace_events.h:9:
In file included from include/linux/hardirq.h:11:
In file included from arch/powerpc/include/asm/hardirq.h:6:
In file included from include/linux/irq.h:20:
In file included from include/linux/io.h:14:
In file included from arch/powerpc/include/asm/io.h:672:
arch/powerpc/include/asm/io-defs.h:43:1: error: performing pointer
arithmetic on a null pointer has undefined behavior
[-Werror,-Wnull-pointer-arithmetic]
   43 | DEF_PCI_AC_NORET(insb, (unsigned long p, void *b, unsigned long c),
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   44 |                  (p, b, c), pio, p)
      |                  ~~~~~~~~~~~~~~~~~~

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240416/testrun/23495171/suite/build/test/clang-17-tqm8xx_defconfig/details/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2fAvI3mKJ0dTHcazPrLl2zNF9JO/

--
Linaro LKFT
https://lkft.linaro.org
