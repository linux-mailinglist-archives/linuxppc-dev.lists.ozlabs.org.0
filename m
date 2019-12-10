Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 220E3117F36
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 05:49:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47X6zv00fFzDqW3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 15:49:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="Q5ohWjCI"; 
 dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47X6xC0C9WzDqVj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 15:47:24 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id j11so5743997pjs.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2019 20:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y8tQSVFZXpglTzCwnCQJ/H8jDbSquTv0j0/ujEPlW6k=;
 b=Q5ohWjCIeOzukO5LCkWh2UDZUjzpG6Dg+k5QibSsNEXqnEUsNI3eOHJLFy8voZYt1D
 zWAwzTdpWafUiM/2V3jWWisOZsqR4bWCl+3Si1gmC/LlI61VQXqM8pt6m9UAyMGHCMQR
 a4aAP4oUxg9Iibn2yn+JTh0K/J6050DPkyO3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y8tQSVFZXpglTzCwnCQJ/H8jDbSquTv0j0/ujEPlW6k=;
 b=iwmJB4wqMi6BGh6NeEHY7PiAQF2Y4xEiWAKd3su+h0PfMQk+bzJe82hOdevtMjPFdt
 KYrXMrVPdGxVlxQiiaqC3V3K0lmXgQsBTC6fX5l2W6n3KeqIsIWfS3k0cvGONUgkKozR
 JV9LgbSu5TzDXf7RpY2Md+GItLswXGKXDdV6hy2oCGUzxyr4A71s5Dx1jYhGj7JUgp4y
 LCwZeqOQicf/9q2C53yl2b7EgMpb774EeXprBFDUA+JfszjVESHDplpo1ttvW1lOl4vn
 vuX18oaFieapQ2lAjCjpqIVyo0t9ZOHazLo1/zphInXxU4sRQpRu92ND+VtVkpFmni9P
 hZaA==
X-Gm-Message-State: APjAAAXBtQh69V5wDWO6lez6/Wp8MDP22FMzwEuBCinI2QTLsiL6C2WR
 rnJIji6Fdq+sHOqTf7PMbOi8OQ==
X-Google-Smtp-Source: APXvYqzZzlhFQwpykUHNZoV4iqQbstcouL0rgALlQzDURKcSExHxCCWi3YgmjP5uPHJuX5j1JCnLyA==
X-Received: by 2002:a17:902:9f83:: with SMTP id
 g3mr30957647plq.234.1575953242726; 
 Mon, 09 Dec 2019 20:47:22 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-e460-0b66-7007-c654.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:e460:b66:7007:c654])
 by smtp.gmail.com with ESMTPSA id e16sm1159270pgk.77.2019.12.09.20.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 20:47:21 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v2 0/4] KASAN for powerpc64 radix, plus generic mm change
Date: Tue, 10 Dec 2019 15:47:10 +1100
Message-Id: <20191210044714.27265-1-dja@axtens.net>
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

The big change from v1 is the introduction of tree-wide(ish)
MAX_PTRS_PER_{PTE,PMD,PUD} macros in preference to the previous
approach, which was for the arch to override the page table array
definitions with their own. (And I squashed the annoying intermittent
crash!)

Apart from that there's just a lot of cleanup. Christophe, I've
addressed most of what you asked for and I will reply to your v1
emails to clarify what remains unchanged.

Regards,
Daniel

Daniel Axtens (4):
  mm: define MAX_PTRS_PER_{PTE,PMD,PUD}
  kasan: use MAX_PTRS_PER_* for early shadow
  kasan: Document support on 32-bit powerpc
  powerpc: Book3S 64-bit "heavyweight" KASAN support

 Documentation/dev-tools/kasan.rst             |   7 +-
 Documentation/powerpc/kasan.txt               | 112 ++++++++++++++++++
 arch/arm64/include/asm/pgtable-hwdef.h        |   3 +
 arch/powerpc/Kconfig                          |   3 +
 arch/powerpc/Kconfig.debug                    |  21 ++++
 arch/powerpc/Makefile                         |  11 ++
 arch/powerpc/include/asm/book3s/64/hash.h     |   4 +
 arch/powerpc/include/asm/book3s/64/pgtable.h  |   7 ++
 arch/powerpc/include/asm/book3s/64/radix.h    |   5 +
 arch/powerpc/include/asm/kasan.h              |  20 +++-
 arch/powerpc/kernel/process.c                 |   8 ++
 arch/powerpc/kernel/prom.c                    |  59 ++++++++-
 arch/powerpc/mm/kasan/Makefile                |   3 +-
 .../mm/kasan/{kasan_init_32.c => init_32.c}   |   0
 arch/powerpc/mm/kasan/init_book3s_64.c        |  67 +++++++++++
 arch/s390/include/asm/pgtable.h               |   3 +
 arch/x86/include/asm/pgtable_types.h          |   5 +
 arch/xtensa/include/asm/pgtable.h             |   1 +
 include/asm-generic/pgtable-nop4d-hack.h      |   9 +-
 include/asm-generic/pgtable-nopmd.h           |   9 +-
 include/asm-generic/pgtable-nopud.h           |   9 +-
 include/linux/kasan.h                         |   6 +-
 mm/kasan/init.c                               |   6 +-
 23 files changed, 353 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/powerpc/kasan.txt
 rename arch/powerpc/mm/kasan/{kasan_init_32.c => init_32.c} (100%)
 create mode 100644 arch/powerpc/mm/kasan/init_book3s_64.c

-- 
2.20.1

