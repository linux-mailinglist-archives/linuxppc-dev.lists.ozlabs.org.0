Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ABC3F9C91
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 18:34:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx50R1dXpz3btR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 02:34:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=UxEhwv13;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UxEhwv13; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx4zw74w8z2yd6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 02:34:19 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id e16so5710333pfc.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 09:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wY8+szznmE152jYf8mqg/hGPdJjKzi+Dd5U0xnmTLEI=;
 b=UxEhwv13lEE8IsmsIS1A/oE2ZAIMn7MahYfo99hGTtkWctlP3b7px7W2BBFOr/8jBh
 uLrlp4rI3DB9x4tNjwswQT3tJGwX6VEmRMGKZ+TLKYY8ZjJ38T/ps5nSn7VFFKgd0oAr
 fxHhvjcDCPpX4D+ogDr1Zu7IoICZPxhfSWl5udDRsf1eqXnbwUjcxW1gXE1viTxBqcMC
 dMqxRfYoqES8+MJdOjqqkbSLsX7ySNEhD/zRKuWSxVl+dAgJw/U7En/YdGCfu4dG/6wa
 EHYPA14MjZ9A1eAxtFhQrTh6LbMl/FOYjtbnxCtqBhdp+S+syskuJ5DuNCofW90lQgPN
 oNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wY8+szznmE152jYf8mqg/hGPdJjKzi+Dd5U0xnmTLEI=;
 b=oEljHfqk+b8UzHOPP8MuP3mNIUD/e5sFoeIdtBBD65Y47RIGBqiZ8UwJrHZpEOr7EI
 ZtxLiE9Kp/0zNv/AZsrFrt3qrcBFMjY2+76rQrPbAv7j6SOmOwcZjvrXSm4JrJ/7bNj/
 UNnhSDAc3eOJcK2VbiA21cOZV0gxi83wGLbi65Lvi55WExuGn+FNwcJ41QV4zcQV/+fN
 oA5b9xkfOWeLLNofYZ7BLNaxTopw6mD3nOiH20qXb56oGNbCj7vVwekjniGyj6wUH5mx
 Son8dfi4GmTLNKynFuHXWOp5TWVPhbkGaR/lsmvu2pgZnacXfx/FXMoAQnv3J/fpAZzG
 OSpQ==
X-Gm-Message-State: AOAM5316tcGUhfducsSHUaK1bZTBbheQv3dD79AKRvs2Npj4hp+zWAU2
 9+3N+ecra8Wm5GQY8awE7XN8LDwX/q0=
X-Google-Smtp-Source: ABdhPJyi+MQpkccdiubmw36IpNuLPMY5Hlz/MF9DQRQ+tA+Uqrmx8tVB5hbAv/T/JmWMg0TIt9YlTw==
X-Received: by 2002:aa7:80d9:0:b029:2ed:49fa:6dc5 with SMTP id
 a25-20020aa780d90000b02902ed49fa6dc5mr9867444pfn.3.1630082056791; 
 Fri, 27 Aug 2021 09:34:16 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (220-244-72-10.tpgi.com.au. [220.244.72.10])
 by smtp.gmail.com with ESMTPSA id u24sm7083852pfm.85.2021.08.27.09.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 09:34:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 0/6] powerpc: Make hash MMU code build configurable
Date: Sat, 28 Aug 2021 02:34:04 +1000
Message-Id: <20210827163410.1177154-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that there's a platform that can make good use of it, here's
a series that can prevent the hash MMU code being built for 64s
platforms that don't need it.

Thanks,
Nick

Nicholas Piggin (6):
  powerpc: Remove unused FW_FEATURE_NATIVE references
  powerpc: Rename PPC_NATIVE to PPC_HASH_MMU_NATIVE
  powerpc/pseries: Stop selecting PPC_HASH_MMU_NATIVE
  powerpc/64s: Make hash MMU code build configurable
  powerpc/microwatt: select POWER9_CPU
  powerpc/microwatt: Stop building the hash MMU code

 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/configs/microwatt_defconfig      |   2 +-
 arch/powerpc/include/asm/book3s/64/mmu.h      |  22 +++-
 .../include/asm/book3s/64/tlbflush-hash.h     |   7 ++
 arch/powerpc/include/asm/book3s/64/tlbflush.h |   4 -
 arch/powerpc/include/asm/book3s/pgtable.h     |   4 +
 arch/powerpc/include/asm/firmware.h           |   8 --
 arch/powerpc/include/asm/mmu.h                |  38 +++++-
 arch/powerpc/include/asm/mmu_context.h        |   2 +
 arch/powerpc/include/asm/paca.h               |   8 ++
 arch/powerpc/kernel/asm-offsets.c             |   2 +
 arch/powerpc/kernel/dt_cpu_ftrs.c             |  10 +-
 arch/powerpc/kernel/entry_64.S                |   4 +-
 arch/powerpc/kernel/exceptions-64s.S          |  16 +++
 arch/powerpc/kernel/mce.c                     |   2 +-
 arch/powerpc/kernel/mce_power.c               |  10 +-
 arch/powerpc/kernel/paca.c                    |  18 ++-
 arch/powerpc/kernel/process.c                 |  13 +-
 arch/powerpc/kernel/prom.c                    |   2 +
 arch/powerpc/kernel/setup_64.c                |   4 +
 arch/powerpc/kexec/core_64.c                  |   4 +-
 arch/powerpc/kexec/ranges.c                   |   4 +
 arch/powerpc/kvm/Kconfig                      |   1 +
 arch/powerpc/mm/book3s64/Makefile             |  19 +--
 arch/powerpc/mm/book3s64/hash_native.c        | 104 ----------------
 arch/powerpc/mm/book3s64/hash_pgtable.c       |   1 -
 arch/powerpc/mm/book3s64/hash_utils.c         | 116 ++++++++++++++++--
 .../{hash_hugetlbpage.c => hugetlbpage.c}     |   6 +
 arch/powerpc/mm/book3s64/mmu_context.c        |  16 +++
 arch/powerpc/mm/book3s64/pgtable.c            |  22 +++-
 arch/powerpc/mm/book3s64/radix_pgtable.c      |   4 +
 arch/powerpc/mm/book3s64/slb.c                |  16 ---
 arch/powerpc/mm/copro_fault.c                 |   2 +
 arch/powerpc/mm/fault.c                       |  17 +++
 arch/powerpc/mm/pgtable.c                     |  10 +-
 arch/powerpc/platforms/52xx/Kconfig           |   2 +-
 arch/powerpc/platforms/Kconfig                |   4 +-
 arch/powerpc/platforms/Kconfig.cputype        |  21 +++-
 arch/powerpc/platforms/cell/Kconfig           |   3 +-
 arch/powerpc/platforms/chrp/Kconfig           |   2 +-
 arch/powerpc/platforms/embedded6xx/Kconfig    |   2 +-
 arch/powerpc/platforms/maple/Kconfig          |   3 +-
 arch/powerpc/platforms/microwatt/Kconfig      |   2 +-
 arch/powerpc/platforms/pasemi/Kconfig         |   3 +-
 arch/powerpc/platforms/powermac/Kconfig       |   3 +-
 arch/powerpc/platforms/powernv/Kconfig        |   2 +-
 arch/powerpc/platforms/powernv/idle.c         |   2 +
 arch/powerpc/platforms/powernv/setup.c        |   2 +
 arch/powerpc/platforms/pseries/Kconfig        |   1 -
 arch/powerpc/platforms/pseries/lpar.c         |  68 +++++-----
 arch/powerpc/platforms/pseries/lparcfg.c      |   2 +-
 arch/powerpc/platforms/pseries/mobility.c     |   6 +
 arch/powerpc/platforms/pseries/ras.c          |   4 +
 arch/powerpc/platforms/pseries/reconfig.c     |   2 +
 arch/powerpc/platforms/pseries/setup.c        |   6 +-
 arch/powerpc/xmon/xmon.c                      |   8 +-
 56 files changed, 427 insertions(+), 240 deletions(-)
 rename arch/powerpc/mm/book3s64/{hash_hugetlbpage.c => hugetlbpage.c} (95%)

-- 
2.23.0

