Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C98512756D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 07:22:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458dDb23QRzDqSL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 15:22:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="JbAFrb3W"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458dCH0XMjzDqRZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 15:21:30 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id 13so2555837pfw.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 22:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PjLS5rjwECt47OrrJ3GKr48ugpffm8kjSMiiZ4w9zRw=;
 b=JbAFrb3WqlW2DSxbioQiWLu2PpTdyzzvkMxiOBu8aApmZzzvw9fAH3c2i78dK6guml
 DHllE9z0V34b3FJPN05m2/j5ZEIMCHEb58kG/cynqaVROOZg4jUgfJeoERhnTDbUVMv3
 0dREXSSFpoQTCh+qaP6/FS+1WTvE5LnMlInuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PjLS5rjwECt47OrrJ3GKr48ugpffm8kjSMiiZ4w9zRw=;
 b=XKrpkMLy7JdLu88Y21TeO5HCcp48945LOAGxDX92B02d+VxfoUbxaU4L2uxz+zzgRp
 5QG1kbR5bYalQ1i3g8HEGHxBJe7cSqMAcU2PeDQH4OskK1tcwWjJqbIayQ0ZBXdsCy6/
 rw3YogOZ+1d2KrbtGSdLlO35tD2Hh0b84IOITmlhp+7eGGv5PVwm1JRcreO/MagKj+0z
 Owt8N3nW+5fRapnlb+iqZnQRXpTn/FLlchgD7C+y1CWpBx6ULP9HUZ4/8ADV8vzk8B6x
 9cbCBqyHxkMuKgsR12KObhylLNofOvb/umH2tRYr3SJ059pCUH6aNUdQ8OQRAYszy0cS
 5w4A==
X-Gm-Message-State: APjAAAWOfEuluwp/rlSteMKYLn7cIyKbXF7S//Juh2+tOQCfQU4q/xSl
 GnIMqAMBwAP7UOWRAx1tOIU2wg==
X-Google-Smtp-Source: APXvYqzGp/4Uuk501cTuML0xcIfDUK+sEqg9pGu4A07dSKQCo2UFZJJ9a7L5zfevEuOAtp8uqrcQbw==
X-Received: by 2002:a17:90a:b78b:: with SMTP id
 m11mr197936pjr.106.1558588887061; 
 Wed, 22 May 2019 22:21:27 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id g83sm45134574pfb.158.2019.05.22.22.21.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 May 2019 22:21:26 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: aneesh.kumar@linux.ibm.com, christophe.leroy@c-s.fr, bsingharora@gmail.com
Subject: [RFC PATCH 0/7] powerpc: KASAN for 64-bit 3s radix
Date: Thu, 23 May 2019 15:21:13 +1000
Message-Id: <20190523052120.18459-1-dja@axtens.net>
X-Mailer: git-send-email 2.19.1
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
Cc: linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Building on the work of Christophe, Aneesh and Balbir, I've ported
KASAN to Book3S radix.

It builds on top Christophe's work on 32bit, and includes my work for
64-bit Book3E (3S doesn't really depend on 3E, but it was handy to
have around when developing and debugging).

This provides full inline instrumentation on radix, but does require
that you be able to specify the amount of memory on the system at
compile time. More details in patch 7.

Regards,
Daniel

Daniel Axtens (7):
  kasan: do not open-code addr_has_shadow
  kasan: allow architectures to manage the memory-to-shadow mapping
  kasan: allow architectures to provide an outline readiness check
  powerpc: KASAN for 64bit Book3E
  kasan: allow arches to provide their own early shadow setup
  kasan: allow arches to hook into global registration
  powerpc: Book3S 64-bit "heavyweight" KASAN support

 arch/powerpc/Kconfig                         |   2 +
 arch/powerpc/Kconfig.debug                   |  17 ++-
 arch/powerpc/Makefile                        |   7 ++
 arch/powerpc/include/asm/kasan.h             | 116 +++++++++++++++++++
 arch/powerpc/kernel/prom.c                   |  40 +++++++
 arch/powerpc/mm/kasan/Makefile               |   2 +
 arch/powerpc/mm/kasan/kasan_init_book3e_64.c |  50 ++++++++
 arch/powerpc/mm/kasan/kasan_init_book3s_64.c |  67 +++++++++++
 arch/powerpc/mm/nohash/Makefile              |   5 +
 include/linux/kasan.h                        |  13 +++
 mm/kasan/generic.c                           |   9 +-
 mm/kasan/generic_report.c                    |   2 +-
 mm/kasan/init.c                              |  10 ++
 mm/kasan/kasan.h                             |   6 +-
 mm/kasan/report.c                            |   6 +-
 mm/kasan/tags.c                              |   3 +-
 16 files changed, 345 insertions(+), 10 deletions(-)
 create mode 100644 arch/powerpc/mm/kasan/kasan_init_book3e_64.c
 create mode 100644 arch/powerpc/mm/kasan/kasan_init_book3s_64.c

-- 
2.19.1

