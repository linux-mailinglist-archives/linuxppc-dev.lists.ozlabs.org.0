Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF51D514DFA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 16:46:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kqb0f6nCkz3c8V
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Apr 2022 00:46:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sg76t27J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b33;
 helo=mail-yb1-xb33.google.com; envelope-from=naresh.kamboju@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=sg76t27J; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqZzt4gwvz3bpH
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Apr 2022 00:46:01 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id i38so14819721ybj.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 07:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=f0pLuqeZXYz1sWaSkPXGqX7Ka9Gz3+f93gXtOcRk6zE=;
 b=sg76t27J/gyCTdgIN57AbjYzistMTapWVkGILL67jpyduU/WbdWJXIc4VGLnSttIYn
 hNGApEWtHCSwnxDURtP54N2ZLF60H9UgJq02rR82FSv1GK177WNDXPhjQGkfWKZsALnL
 BmTKKyP0ssXeCKBfT55o9dekWFj17VSC7Z+fZvkO4rUIi/TQIE37u157A4RlwbL9o8BJ
 8RPwQ9k21QlkIiL3BQAC/2XeJfKe5extkSGRU8EvUGSWXP+Mmq/r3ovudUR5WaUoUrnG
 ulovb0ucLpqI44pMZrrDg9fhHVxXVA0NjBgZVUFZKNHAcZS/GzYvSiogD0SPCrTy2dLM
 TkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=f0pLuqeZXYz1sWaSkPXGqX7Ka9Gz3+f93gXtOcRk6zE=;
 b=wTZQZsCF0n8TtU3gBAa+AdibQtn6GUWImgGeI/JyXZnjBrr/EFgCXq2Np6Z5QGIjko
 v+FV7Pc8ZMBaJxZUk7bplYilkY923M/AMozf45wLTGFucgS6q6vP+k6RIlcen0DtXrs5
 U3VOrkHZn5l6xNy8fCRdYTaDfOlY+olTgOds23mO21mCWLqc+m3nb5dLyahW7g51SD5w
 4MioVNmY6Rt7YmltL5RRDPmGKneRPf37FbGTLXPpeq3rxD/EzgmQcycSIeOreYTS7iAK
 VByCX9/KHEvWVjxi763pdHBYU6Isb4/Ya2ihGd5xtAMpvKVWTOJMEnUmef2+DIm1Jaa3
 CN/w==
X-Gm-Message-State: AOAM5323q7sznP79SPlvtNQQGVNWTq0hIL/Xo/yfa7EMKNjrz7Tb+EQG
 EfXtyruqi5C7EqApdz1K1de34Q1kKdpMQW2TBX9HHw==
X-Google-Smtp-Source: ABdhPJwebZPW8eNXr7R6EmFQmtAGmoO8i+DbeZ/yF9SoTg6ttJi1GAZwMgxz8AT0N8FkWFM0f6Rztj4uwwWpuIStN6k=
X-Received: by 2002:a25:20d4:0:b0:645:d55b:f0df with SMTP id
 g203-20020a2520d4000000b00645d55bf0dfmr32821553ybg.537.1651243558063; Fri, 29
 Apr 2022 07:45:58 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 29 Apr 2022 20:15:47 +0530
Message-ID: <CA+G9fYvSqtsOMEiL7_kffPKnnO-Snhe2cup6g3qRngiwRO+RfA@mail.gmail.com>
Subject: [next] powerpc: multiple definition of `____cacheline_aligned';
 sound/core/oss/pcm_oss.o:(.bss+0x40): first defined here
To: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, lkft-triage@lists.linaro.org
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Baoquan He <bhe@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Matthew Wilcox <willy@infradead.org>,
 aul Mackerras <paulus@samba.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Following powerpc builds failed on Linux next-20220428 and next-20220429.

Regressions found on powerpc:
   - gcc-11-ppc64e_defconfig
   - gcc-10-ppc64e_defconfig
   - gcc-9-ppc64e_defconfig
   - gcc-8-ppc64e_defconfig
   - clang-14-ppc64e_defconfig
   - clang-nightly-ppc64e_defconfig
   - clang-13-ppc64e_defconfig


Build error:
-------------
Error: Section .bss not empty in prom_init.c
make[3]: *** [arch/powerpc/kernel/Makefile:191:
arch/powerpc/kernel/prom_init_check] Error 1
make[3]: Target '__build' not remade because of errors.
make[2]: *** [scripts/Makefile.build:595: arch/powerpc/kernel] Error 2
make[2]: Target '__build' not remade because of errors.
make[1]: *** [Makefile:1996: arch/powerpc] Error 2
powerpc64le-linux-gnu-ld: sound/core/oss/pcm_plugin.o:(.bss+0x0):
multiple definition of `____cacheline_aligned';
sound/core/oss/pcm_oss.o:(.bss+0x40): first defined here
make[4]: *** [scripts/Makefile.build:530: sound/core/oss/snd-pcm-oss.o] Error 1
make[4]: Target '__build' not remade because of errors.
make[3]: *** [scripts/Makefile.build:595: sound/core/oss] Error 2
powerpc64le-linux-gnu-ld: sound/core/seq/seq_clientmgr.o:(.bss+0x900):
multiple definition of `____cacheline_aligned';
sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
powerpc64le-linux-gnu-ld: sound/core/seq/seq_memory.o:(.bss+0x0):
multiple definition of `____cacheline_aligned';
sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
powerpc64le-linux-gnu-ld: sound/core/seq/seq_queue.o:(.bss+0x140):
multiple definition of `____cacheline_aligned';
sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
powerpc64le-linux-gnu-ld: sound/core/seq/seq_fifo.o:(.bss+0x0):
multiple definition of `____cacheline_aligned';
sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
powerpc64le-linux-gnu-ld: sound/core/seq/seq_timer.o:(.bss+0x0):
multiple definition of `____cacheline_aligned';
sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
powerpc64le-linux-gnu-ld: sound/core/seq/seq_system.o:(.bss+0x0):
multiple definition of `____cacheline_aligned';
sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
powerpc64le-linux-gnu-ld: sound/core/seq/seq_ports.o:(.bss+0x0):
multiple definition of `____cacheline_aligned';
sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
powerpc64le-linux-gnu-ld: sound/core/seq/seq_info.o:(.bss+0x40):
multiple definition of `____cacheline_aligned';
sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
make[4]: *** [scripts/Makefile.build:530: sound/core/seq/snd-seq.o] Error 1
make[4]: Target '__build' not remade because of errors.


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


steps to reproduce:
-------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake

tuxmake --runtime podman --target-arch powerpc --toolchain gcc-11
--kconfig ppc64e_defconfig

--
Linaro LKFT
https://lkft.linaro.org

[1] https://builds.tuxbuild.com/28Sn15hB2la1PweieGMLrUdbFMQ/
