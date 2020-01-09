Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B070135388
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 08:10:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tchD3t9szDqWh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 18:10:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=X0mwyBro; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tcdw0TK6zDqWg
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 18:08:19 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id u63so652245pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2020 23:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T66c+Moc6bo3p93sqP0BtCTOoS4UuskhqiuSGC0rhF8=;
 b=X0mwyBronhFAvsmlzbsKHNTgZEAlq+hZMT0u/m/S4Ga/TZgU/CFDxsjZZ3Sb7W55KC
 CdkUz5Dg0Rm3zAxOestRih3sAYV0lUc8gsaw9ERRphopmY3ahW9F7n7rj8luEwH0+y67
 wtXFs2N+rq3CmbwLg9VRq/leG03nLJfNUz9uA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T66c+Moc6bo3p93sqP0BtCTOoS4UuskhqiuSGC0rhF8=;
 b=qwKHegXEzfX5Nxhe4dQf15mMXAX5j6mBSklyyRcfENVQS3kCjuCe7K+r+tvXIEiWmu
 x12gE0y9DbHpYPyAh2A9aS9Xl7JwTy3UkbVgVTlRFcNGZ+8tO8TCoRiXG+PDb8PLlwE7
 +80jcNeNS9H6vYypyiwThm0uLg3EI14HdE2MiiabDo3xRfyvXCA/9pAlvm2La8FoWfXk
 jP3spymI5B2yEADVe7Ls7vaSsvf0NLASxK8kxbXaK3QSsfxm3aIx/3c4xUzqhJDQRu4t
 sBPdzr/0j/L0L6KFhOQSAahZhtkR4z7Ni/Vp8CyAfCdhaRvegKNdSxdFAymt1CefEeeI
 z7Bg==
X-Gm-Message-State: APjAAAVjZMRXufjGxIhHHVNYxbt0+RE5Lf5YYQTGfmVztaUEADJC++jA
 MWdh/CBfSrqkOrATD0C/jlFv3A==
X-Google-Smtp-Source: APXvYqwzwS6C8pCrRttWQJOjzO+q0lE36tEIXD7GIldhthPyaszfHYJdYFpvK3Y8vgvuZ304JF1PRA==
X-Received: by 2002:a17:90a:cb83:: with SMTP id
 a3mr3531968pju.80.1578553697170; 
 Wed, 08 Jan 2020 23:08:17 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-5cb3-ebc3-7dc6-a17b.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:5cb3:ebc3:7dc6:a17b])
 by smtp.gmail.com with ESMTPSA id i23sm6139143pfo.11.2020.01.08.23.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 23:08:16 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v5 0/4] KASAN for powerpc64 radix
Date: Thu,  9 Jan 2020 18:08:07 +1100
Message-Id: <20200109070811.31169-1-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
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

v5: ptdump support. More cleanups, tweaks and fixes, thanks
    Christophe. Details in patch 4.

    I have seen another stack walk splat, but I don't think it's
    related to the patch set, I think there's a bug somewhere else,
    probably in stack frame manipulation in the kernel or (more
    unlikely) in the compiler.

v4: More cleanups, split renaming out, clarify bits and bobs.
    Drop the stack walk disablement, that isn't needed. No other
    functional change.

v3: Reduce the overly ambitious scope of the MAX_PTRS change.
    Document more things, including around why some of the
    restrictions apply.
    Clean up the code more, thanks Christophe.

v2: The big change is the introduction of tree-wide(ish)
    MAX_PTRS_PER_{PTE,PMD,PUD} macros in preference to the previous
    approach, which was for the arch to override the page table array
    definitions with their own. (And I squashed the annoying
    intermittent crash!)

    Apart from that there's just a lot of cleanup. Christophe, I've
    addressed most of what you asked for and I will reply to your v1
    emails to clarify what remains unchanged.

Daniel Axtens (4):
  kasan: define and use MAX_PTRS_PER_* for early shadow tables
  kasan: Document support on 32-bit powerpc
  powerpc/mm/kasan: rename kasan_init_32.c to init_32.c
  powerpc: Book3S 64-bit "heavyweight" KASAN support

 Documentation/dev-tools/kasan.rst             |   7 +-
 Documentation/powerpc/kasan.txt               | 122 ++++++++++++++++++
 arch/powerpc/Kconfig                          |   2 +
 arch/powerpc/Kconfig.debug                    |  23 +++-
 arch/powerpc/Makefile                         |  11 ++
 arch/powerpc/include/asm/book3s/64/hash.h     |   4 +
 arch/powerpc/include/asm/book3s/64/pgtable.h  |   7 +
 arch/powerpc/include/asm/book3s/64/radix.h    |   5 +
 arch/powerpc/include/asm/kasan.h              |  15 ++-
 arch/powerpc/kernel/prom.c                    |  61 ++++++++-
 arch/powerpc/mm/kasan/Makefile                |   3 +-
 .../mm/kasan/{kasan_init_32.c => init_32.c}   |   0
 arch/powerpc/mm/kasan/init_book3s_64.c        |  71 ++++++++++
 arch/powerpc/mm/ptdump/ptdump.c               |  10 +-
 arch/powerpc/platforms/Kconfig.cputype        |   1 +
 include/linux/kasan.h                         |  18 ++-
 mm/kasan/init.c                               |   6 +-
 17 files changed, 350 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/powerpc/kasan.txt
 rename arch/powerpc/mm/kasan/{kasan_init_32.c => init_32.c} (100%)
 create mode 100644 arch/powerpc/mm/kasan/init_book3s_64.c

-- 
2.20.1

