Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 215141258A2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 01:39:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dY0f00ZczDqnM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 11:39:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="Dka6E6Kx"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dXxh0Cq7zDqjM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 11:36:39 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id l24so2176085pgk.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 16:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5NTtETEykOhr2nCmuKVWtyUmiz45NkjCC1EiRzotiV0=;
 b=Dka6E6KxQMKWIOq8r+b70xVQGVo4OdLoMXnwm6m0mMIhAJbUreti/BnUsZplcC3I5t
 6GAQjfkecTIR6/e4HR3gYnoHqRT2G92zcwNrRuEl+OBpwkq1wQoWTGNOlJhGkDhGvv+W
 DmQ7nlRQ3ekghRHA1hXbbgQbWCNx+vBJP1blU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5NTtETEykOhr2nCmuKVWtyUmiz45NkjCC1EiRzotiV0=;
 b=gL3gwq7ANRnvALA7qzDVGQmo/w4hOFJQUBOt4EIuWKK1Ry+PQEaAqwAlTuNeFX9h0O
 CqZdFxd7+ZC9CmaOXIE8kSouD8dyVpTOlJLj58BnCZ23gRV1Ej9OKYXRy4CmmeRBAdsy
 mrq8EtqLDZhUESeLvyCbOPDl3twSBcZV+Uek9AMSjqoAFgsewTuvO3ixmiYFOm3aT5LB
 DID0Et2k68p4CEifuJFldbk3COVOHljPLs43TH0xnc6uHuqLyzNT6fUh/p18E5UxBJTn
 oYp50aBbD0MwCDqRTwAPCc8v4BV0mJYd0hSaooskDCaRFnPFRL31lq2TrG7zJF/lomly
 5yog==
X-Gm-Message-State: APjAAAWNnWOZ7yOzgIPAKLqthCNPbQKIxF1o+TUR6XcgmMD1OwCTkhsf
 l4ZblWmmAgY+u95HW6ZfHmuWpg==
X-Google-Smtp-Source: APXvYqzmq4U/2uhuZHM/lC5xUAdQDDtPlzppqNzyl6j6ILF9v1mdA5FmXeloldbfX3xoXhZz9lR/qg==
X-Received: by 2002:aa7:93ce:: with SMTP id y14mr6301702pff.185.1576715796122; 
 Wed, 18 Dec 2019 16:36:36 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-b05d-cbfe-b2ee-de17.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:b05d:cbfe:b2ee:de17])
 by smtp.gmail.com with ESMTPSA id l1sm4610430pgs.47.2019.12.18.16.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 16:36:35 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v4 0/4] KASAN for powerpc64 radix
Date: Thu, 19 Dec 2019 11:36:26 +1100
Message-Id: <20191219003630.31288-1-dja@axtens.net>
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
 arch/powerpc/Kconfig.debug                    |  21 +++
 arch/powerpc/Makefile                         |  11 ++
 arch/powerpc/include/asm/book3s/64/hash.h     |   4 +
 arch/powerpc/include/asm/book3s/64/pgtable.h  |   7 +
 arch/powerpc/include/asm/book3s/64/radix.h    |   5 +
 arch/powerpc/include/asm/kasan.h              |  21 ++-
 arch/powerpc/kernel/prom.c                    |  61 ++++++++-
 arch/powerpc/mm/kasan/Makefile                |   3 +-
 .../mm/kasan/{kasan_init_32.c => init_32.c}   |   0
 arch/powerpc/mm/kasan/init_book3s_64.c        |  70 ++++++++++
 arch/powerpc/platforms/Kconfig.cputype        |   1 +
 include/linux/kasan.h                         |  18 ++-
 mm/kasan/init.c                               |   6 +-
 16 files changed, 346 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/powerpc/kasan.txt
 rename arch/powerpc/mm/kasan/{kasan_init_32.c => init_32.c} (100%)
 create mode 100644 arch/powerpc/mm/kasan/init_book3s_64.c

-- 
2.20.1

