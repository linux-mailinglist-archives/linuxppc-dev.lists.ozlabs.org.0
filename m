Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5855211A5D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 04:58:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49y2q45XrzzDqtG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 12:58:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=cP7JTsXr; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49y2kW5rxYzDqsQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 12:54:41 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id 72so119414ple.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jul 2020 19:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hmqaZJTWyrZ0FbjDXm8RaPiEdszyKtA9q/J035BPFVA=;
 b=cP7JTsXrRAwaUk/s3r6046kZthbuvo+pnMiLbeJ92TN5Df4IlY5imhcjw6DhnGkCbp
 kvsnwkrOkzH3a3JGOqOwZGog/7b3prPfeaBhvzie1IFd3qYoC3heY995lUjewiSw6d1H
 4AB3xQJu+LyZ+/b9OESxctzddqplBAiW2jQkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hmqaZJTWyrZ0FbjDXm8RaPiEdszyKtA9q/J035BPFVA=;
 b=FmNdWBEezS3ymewrkOQ9mGr8qRKucBBavaKCARv7YMBtX4h+VAzJzHjisnlW2DDUot
 3WLTh5lpI7JHGFU22DUrXS0YentuN/Lsuv6iIXzxJ0ZloWf/imLNs+0TOj6dsaHt8RPo
 70wj7xRjo+n6MEPFSSczozz7mWe4jKyzLnAnahvyUBT67dy7HscfgDQp3zHcIxGxhY/S
 WS3uCsZGgSmnI9E/CUq5oK5PGY5tqYyvYdlJv1QMEcdjqDup+t70EiJtGPBW+S41G7bY
 nYOsOObu97ThTw3ElYlkMkfeIQf4HDVUkBQIQnpDYZGR3EsG+vPKMgUZ1nZYp9eqEZFV
 WV9g==
X-Gm-Message-State: AOAM530u/33XRDfvPfpYbMVCeiupCEpr5zUOF0vdZa/Comz9O+IHEyrm
 xc/eNvW1mT9xesFYuqUjlgpcRw==
X-Google-Smtp-Source: ABdhPJyo4y4l83li9ExCVZOeOn/mYCprRDsvcN4pWndY1hK1p+y5El3vuSv4CxjdcbgqE8OWQCYmKA==
X-Received: by 2002:a17:902:6bc1:: with SMTP id
 m1mr25456864plt.158.1593658477129; 
 Wed, 01 Jul 2020 19:54:37 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-3c80-6152-10ca-83bc.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:3c80:6152:10ca:83bc])
 by smtp.gmail.com with ESMTPSA id u26sm7243117pgo.71.2020.07.01.19.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 19:54:36 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v8 0/4] KASAN for powerpc64 radix
Date: Thu,  2 Jul 2020 12:54:28 +1000
Message-Id: <20200702025432.16912-1-dja@axtens.net>
X-Mailer: git-send-email 2.25.1
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Building on the work of Christophe, Aneesh and Balbir, I've ported
KASAN to 64-bit Book3S kernels running on the Radix MMU.

This provides full inline instrumentation on radix, but does require
that you be able to specify the amount of physically contiguous memory
on the system at compile time. More details in patch 4.

v8 is just a rebase of v7 on a more recent powerpc/merge and a fixup
of a whitespace error.

Module globals still don't work, but that's due to some 'clever'
renaming of a section that the powerpc module loading code does to
avoid more complicated relocations/tramplines rather than anything to
do with KASAN.

Daniel Axtens (4):
  kasan: define and use MAX_PTRS_PER_* for early shadow tables
  kasan: Document support on 32-bit powerpc
  powerpc/mm/kasan: rename kasan_init_32.c to init_32.c
  powerpc: Book3S 64-bit "heavyweight" KASAN support

 Documentation/dev-tools/kasan.rst             |   8 +-
 Documentation/powerpc/kasan.txt               | 122 ++++++++++++++++++
 arch/powerpc/Kconfig                          |   3 +-
 arch/powerpc/Kconfig.debug                    |  23 +++-
 arch/powerpc/Makefile                         |  11 ++
 arch/powerpc/include/asm/book3s/64/hash.h     |   4 +
 arch/powerpc/include/asm/book3s/64/pgtable.h  |   7 +
 arch/powerpc/include/asm/book3s/64/radix.h    |   5 +
 arch/powerpc/include/asm/kasan.h              |  11 +-
 arch/powerpc/kernel/Makefile                  |   2 +
 arch/powerpc/kernel/process.c                 |  16 ++-
 arch/powerpc/kernel/prom.c                    |  76 ++++++++++-
 arch/powerpc/mm/kasan/Makefile                |   3 +-
 .../mm/kasan/{kasan_init_32.c => init_32.c}   |   0
 arch/powerpc/mm/kasan/init_book3s_64.c        |  73 +++++++++++
 arch/powerpc/mm/ptdump/ptdump.c               |  10 +-
 arch/powerpc/platforms/Kconfig.cputype        |   1 +
 include/linux/kasan.h                         |  18 ++-
 mm/kasan/init.c                               |   6 +-
 19 files changed, 377 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/powerpc/kasan.txt
 rename arch/powerpc/mm/kasan/{kasan_init_32.c => init_32.c} (100%)
 create mode 100644 arch/powerpc/mm/kasan/init_book3s_64.c

-- 
2.25.1

