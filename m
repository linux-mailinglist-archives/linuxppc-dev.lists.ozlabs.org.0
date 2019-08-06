Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 125BE83DE5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 01:40:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463B2k226QzDr10
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 09:40:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="YF7OjRrF"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463B0g2WgFzDqtZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 09:38:39 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id c14so38406666plo.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Aug 2019 16:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n86VTUimVDYp3c15YC9BaKGXMcoo6OcCYb6cMaite0k=;
 b=YF7OjRrFIWJH2SUYu5jmSKxwzpcU/NQD+BgeFVEABQqlZyT9HI8RYyXYxfOtZxqbl2
 USh10uJojGKvp0k49pBb0WlxBgNrS4CohdGWWobMSZwm6n5b9k1F5yO8dM1hgpY+pZ/M
 wBNfDkUGY9tDeiWxVmBkp2Fsp/epXQcdbkW/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n86VTUimVDYp3c15YC9BaKGXMcoo6OcCYb6cMaite0k=;
 b=b6z5StirsG8Ke8yudzMaQSr+q9lZ639u4YJdHKcztIBhxuX23XwwDVUZsoaR96ExKs
 gieiybqO/i3iTas1HzP/7CmRn+iJ0PbVdWaSsL7Socmt4Y9qTYd4zqMa8YHSwWel4bdI
 owxbSlyMazUIdV3ozm11431h1mbrTwMFH4MOE15tQezNM269ksmaOLWfL9kW/4hAdvVb
 zkFd7BhUZQhaKR/V4nHD9zc0V2YmAyXTwNCcGrv5v5F2PB1QvrHvVh0c3keUCOcSNd8N
 Ts4bxv+stfi+yAVKVeroFHM/iVWRhwJwd6d36NThACFjBhXzLWcpLf/yezbxyvqYkOEB
 yMqA==
X-Gm-Message-State: APjAAAXC2uJSPxy+85fBaF8YY0dVnZokSnHgssWtrCgtVt72kEIccjUZ
 JZ1phbOJNGHo5Ht/H9lMRjTCrw==
X-Google-Smtp-Source: APXvYqx5pWstY41VbEf4SkkdXygb/AJYD1jlSMisNk3ca7cjnZeL5HQpoHREWvcqpJm/i+ZYEOKEiA==
X-Received: by 2002:a17:902:bf07:: with SMTP id
 bi7mr5574545plb.167.1565134716359; 
 Tue, 06 Aug 2019 16:38:36 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id c70sm63183864pfb.36.2019.08.06.16.38.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 16:38:35 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: aneesh.kumar@linux.ibm.com, christophe.leroy@c-s.fr, bsingharora@gmail.com
Subject: [PATCH 0/4] powerpc: KASAN for 64-bit Book3S on Radix
Date: Wed,  7 Aug 2019 09:38:23 +1000
Message-Id: <20190806233827.16454-1-dja@axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Building on the work of Christophe, Aneesh and Balbir, I've ported
KASAN to 64-bit Book3S kernels running on the Radix MMU.

It builds on top Christophe's work on 32bit. It also builds on my
generic KASAN_VMALLOC series, available at:
https://patchwork.kernel.org/project/linux-mm/list/?series=153209

This provides full inline instrumentation on radix, but does require
that you be able to specify the amount of memory on the system at
compile time. More details in patch 4.

Notable changes from the RFC:

 - I've dropped Book3E 64-bit for now.

 - Now instead of hacking into the KASAN core to disable module
   allocations, we use KASAN_VMALLOC.

 - More testing, including on real hardware. This revealed that
   discontiguous memory is a bit of a headache, at the moment we
   must disable memory not contiguous from 0. 
   
 - Update to deal with kasan bitops instrumentation that landed
   between RFC and now.

 - Documentation!

 - Various cleanups and tweaks.

I am getting occasional problems on boot of real hardware where it
seems vmalloc space mappings don't get installed in time. (We get a
BUG that memory is not accessible, but by the time we hit xmon the
memory then is accessible!) It happens once every few boots. I haven't
yet been able to figure out what is happening and why. I'm going to
look in to it, but I think the patches are in good enough shape to
review while I work on it.

Regards,
Daniel

Daniel Axtens (4):
  kasan: allow arches to provide their own early shadow setup
  kasan: support instrumented bitops with generic non-atomic bitops
  powerpc: support KASAN instrumentation of bitops
  powerpc: Book3S 64-bit "heavyweight" KASAN support

 Documentation/dev-tools/kasan.rst            |   7 +-
 Documentation/powerpc/kasan.txt              | 111 ++++++++++++++
 arch/powerpc/Kconfig                         |   4 +
 arch/powerpc/Kconfig.debug                   |  21 +++
 arch/powerpc/Makefile                        |   7 +
 arch/powerpc/include/asm/bitops.h            |  25 ++--
 arch/powerpc/include/asm/book3s/64/radix.h   |   5 +
 arch/powerpc/include/asm/kasan.h             |  35 ++++-
 arch/powerpc/kernel/process.c                |   8 ++
 arch/powerpc/kernel/prom.c                   |  57 +++++++-
 arch/powerpc/mm/kasan/Makefile               |   1 +
 arch/powerpc/mm/kasan/kasan_init_book3s_64.c |  76 ++++++++++
 include/asm-generic/bitops-instrumented.h    | 144 ++++++++++---------
 include/linux/kasan.h                        |   2 +
 lib/Kconfig.kasan                            |   3 +
 mm/kasan/init.c                              |  10 ++
 16 files changed, 431 insertions(+), 85 deletions(-)
 create mode 100644 Documentation/powerpc/kasan.txt
 create mode 100644 arch/powerpc/mm/kasan/kasan_init_book3s_64.c

-- 
2.20.1

