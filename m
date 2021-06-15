Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA393A7379
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 03:48:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3rmy5wCHz3cBf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 11:48:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=H4VDtuCl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=H4VDtuCl; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3rm34R2zz2xg5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 11:47:14 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id h12so7608549plf.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 18:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ok1AmBf91H6Q/IhwbEd4jKqOoWLU/Xv6mOEECK2NByo=;
 b=H4VDtuClI+xBARo/PkX4faHPWxSILJD209oddgYal3t0beaYPakrVo/4tTDPLfWJ3r
 gotXX1n6Iq929WNOAdC9iC1VR2H3HXFpK3i9YDiyBj5NeVven5qtdU0yZITIYwJfT18R
 R402qr5t3f3fnjNl8J8Y7kwZfOxy0uVpk1qNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ok1AmBf91H6Q/IhwbEd4jKqOoWLU/Xv6mOEECK2NByo=;
 b=oDqCUOnasDBFZGgi9c2HB7TxY/YIW76IyzkRjAPTF6tPD0W6R6zoH6T+RiqdYD4BpF
 qUJ0lghca0kYhLJVfLFAWbeiIHy/hEIIUoEDhcDqu/h3F7Pon8VgqYTBzMeEJ8MKLbe/
 ej5lMKzDe6IT0EmN7bf2bdM3xIg/8l8aBMXbFBhXSYLmLXZE1acz6lAXDKtGh0Y4aYRs
 1bq3uukGqCE8UwpmO8uwdHNmtHnp8evCpZe3ilR9GnnOIsOC1lAuOn0wAQUKYq0jvkd/
 CG/RCeubYhu9S8DzaXHp1S65ZKqJTD7i5sRA21/DmV1vU71A4yrEvcKXGsRifgIUAOMB
 hNNQ==
X-Gm-Message-State: AOAM530yIx5OA0qHKj8AD5FvRd6uoz0fBd8V56O7uq10PjfyJcWNZCJ9
 vgeM7QuxokSpkGSJvLa9wcKhzZLuMjreFg==
X-Google-Smtp-Source: ABdhPJwweEOVq3GJfsTJTL6yeQhZ4Ms23CXanMBJCKsQmXd9Q1u6Wl2KRDctbbN/XtM4RyiyKCDmeA==
X-Received: by 2002:a17:90a:8546:: with SMTP id
 a6mr22237711pjw.128.1623721630780; 
 Mon, 14 Jun 2021 18:47:10 -0700 (PDT)
Received: from localhost ([203.206.29.204])
 by smtp.gmail.com with ESMTPSA id gl13sm628913pjb.5.2021.06.14.18.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 18:47:10 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
Subject: [PATCH v12 0/6] KASAN core changes for ppc64 radix KASAN
Date: Tue, 15 Jun 2021 11:46:59 +1000
Message-Id: <20210615014705.2234866-1-dja@axtens.net>
X-Mailer: git-send-email 2.27.0
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
Cc: elver@google.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Building on the work of Christophe, Aneesh and Balbir, I've ported
KASAN to 64-bit Book3S kernels running on the Radix MMU.

I've been trying this for a while, but we keep having collisions
between the kasan code in the mm tree and the code I want to put in to
the ppc tree. So my aim here is for patches 1 through 4 or 1 through 5
to go in via the mm tree. I will then propose the powerpc changes for
a later cycle. (I have attached them to this series as an RFC, and
there are still outstanding review comments I need to attend to.)

v12 applies to next-20210611. There should be no noticable changes to
other platforms.

Kind regards,
Daniel

Daniel Axtens (6):
  kasan: allow an architecture to disable inline instrumentation
  kasan: allow architectures to provide an outline readiness check
  kasan: define and use MAX_PTRS_PER_* for early shadow tables
  kasan: Document support on 32-bit powerpc
  powerpc/mm/kasan: rename kasan_init_32.c to init_32.c
  [RFC] powerpc: Book3S 64-bit outline-only KASAN support

 Documentation/dev-tools/kasan.rst             |  7 +-
 Documentation/powerpc/kasan.txt               | 58 +++++++++++
 arch/powerpc/Kconfig                          |  4 +-
 arch/powerpc/Kconfig.debug                    |  3 +-
 arch/powerpc/include/asm/book3s/64/hash.h     |  4 +
 arch/powerpc/include/asm/book3s/64/pgtable.h  |  4 +
 arch/powerpc/include/asm/book3s/64/radix.h    | 13 ++-
 arch/powerpc/include/asm/kasan.h              | 22 +++++
 arch/powerpc/kernel/Makefile                  | 11 +++
 arch/powerpc/kernel/process.c                 | 16 ++--
 arch/powerpc/kvm/Makefile                     |  5 +
 arch/powerpc/mm/book3s64/Makefile             |  9 ++
 arch/powerpc/mm/kasan/Makefile                |  3 +-
 .../mm/kasan/{kasan_init_32.c => init_32.c}   |  0
 arch/powerpc/mm/kasan/init_book3s_64.c        | 95 +++++++++++++++++++
 arch/powerpc/mm/ptdump/ptdump.c               | 20 +++-
 arch/powerpc/platforms/Kconfig.cputype        |  1 +
 arch/powerpc/platforms/powernv/Makefile       |  6 ++
 arch/powerpc/platforms/pseries/Makefile       |  3 +
 include/linux/kasan.h                         | 18 +++-
 lib/Kconfig.kasan                             | 14 +++
 mm/kasan/common.c                             |  4 +
 mm/kasan/generic.c                            |  3 +
 mm/kasan/init.c                               |  6 +-
 mm/kasan/kasan.h                              |  4 +
 mm/kasan/shadow.c                             |  4 +
 26 files changed, 316 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/powerpc/kasan.txt
 rename arch/powerpc/mm/kasan/{kasan_init_32.c => init_32.c} (100%)
 create mode 100644 arch/powerpc/mm/kasan/init_book3s_64.c

-- 
2.27.0

