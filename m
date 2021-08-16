Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 376F23ECF67
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 09:31:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp5SN0SL3z3bTC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 17:31:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=rLV/P5f2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rLV/P5f2; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp5Qz6sGpz30GM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 17:30:02 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 w13-20020a17090aea0db029017897a5f7bcso25985231pjy.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 00:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rWiAzCM64+4TyIiGEiyPoRwsmh+8vsLsCUdm+zSDXew=;
 b=rLV/P5f2/DoDMWId3nEtDSnvhD70uoBkxUQkQCzeunWVR3Tq49a8YDBokPGUTm2gp0
 WmV3nO+D0DM2xgOuL/FsCd0q2xBAJh/5X7T4NaQzAOHf5MM5nwwG0Kxj+6rpKXDFGj3X
 mdKk016l6B3H9W0hd0Hg6/Ezi6Dc3tuoGRZz8mjU5UTBrHoU5h7uMhVBBQY3Xhri8icm
 90+YqzNrtNwU0528zPpBvN7sXVs2LpuygXmGVwuzB5BCtrCMv7Vd25LLOpU/CYjM/YW9
 Yq+hWYM/DI76UqONbLR/QAT/H3sNzjfRQwmA3oMMjf6CQ2WGhriHp+A4gunHyz+kk+HM
 5CKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rWiAzCM64+4TyIiGEiyPoRwsmh+8vsLsCUdm+zSDXew=;
 b=P16ztmeP5nDGxCBtHsQ5ZXROKbgcEIRdcuYwscQVImDDEmXOq1+ewTfapjfKUg9ugz
 JxCqftJv6IiNq2plhl7CaRLcoJ1uaxEELHVH8YRlmP4athDqfEH71feGRrKw54e0ZCOF
 AGMgijh74XJ4Co55vfPNAjSAX54qwOV1shaN6azfcqrJqcw8MzlFIu1qHHjYXiTD7Kck
 FzCjcngPVXx6/eBxjkgJzDukQttIhvIDdDWk1hWTKQV5R7axUdOGucbpiHCsU+FfgEEM
 JwA7HqYI2CRhV/QQyhqq80VO2DyetgGXf2JJLJeqscdoWOf/eUgiuwhnDcJoedIR94OW
 WMDw==
X-Gm-Message-State: AOAM531aO9KZclDkAK5E6cCMlZqpXCW5H2AL1waRXtrLZqUpTFrEk1Ef
 c6dQ96vmdbxGbNa2WYxQYgtMyh/qzaI=
X-Google-Smtp-Source: ABdhPJyrEFHZNtMPJ2nn0tlhWEuH65IEDR49PtwoYWeFwa+8aifVIJTaJokzXUFIYBGIRQx5ezYVIA==
X-Received: by 2002:a17:90a:d149:: with SMTP id
 t9mr12183208pjw.0.1629098999613; 
 Mon, 16 Aug 2021 00:29:59 -0700 (PDT)
Received: from bobo.ibm.com (203-219-120-52.tpgi.com.au. [203.219.120.52])
 by smtp.gmail.com with ESMTPSA id e7sm10543887pfc.145.2021.08.16.00.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 00:29:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 0/4] powerpc/64s: interrupt speedups
Date: Mon, 16 Aug 2021 17:29:49 +1000
Message-Id: <20210816072953.1165964-1-npiggin@gmail.com>
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

Here's a few stragglers. The first patch was submitted already but had
some bugs with unrecoverable exceptions on HPT (current->blah being
accessed before MSR[RI] was enabled). Those should be fixed now.

The others are generally for helping asynch interrupts, which are a bit
harder to measure well but important for IO and IPIs.

After this series, the SPR accesses of the interrupt handlers for radix
are becoming pretty optimal except for PPR which we could improve on,
and virt CPU accounting which is very costly -- we might disable that
by default unless someone comes up with a good reason to keep it.

Thanks,
Nick

Nicholas Piggin (4):
  powerpc/64: handle MSR EE and RI in interrupt entry wrapper
  powerpc/64s/perf: add power_pmu_running to query whether perf is being
    used
  powerpc/64s/interrupt: Don't enable MSR[EE] in irq handlers unless
    perf is in use
  powerpc/64s/interrupt: avoid saving CFAR in some asynchronous
    interrupts

 arch/powerpc/include/asm/hw_irq.h    | 49 ++++++++++++---
 arch/powerpc/include/asm/interrupt.h | 31 ++++++++--
 arch/powerpc/kernel/dbell.c          |  3 +-
 arch/powerpc/kernel/exceptions-64s.S | 93 +++++++++++++++++++---------
 arch/powerpc/kernel/fpu.S            |  5 ++
 arch/powerpc/kernel/irq.c            |  3 +-
 arch/powerpc/kernel/time.c           | 30 ++++-----
 arch/powerpc/kernel/vector.S         |  8 +++
 arch/powerpc/perf/core-book3s.c      | 13 ++++
 9 files changed, 175 insertions(+), 60 deletions(-)

-- 
2.23.0

