Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 303803ED02C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 10:25:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp6fR118Hz3cT4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 18:25:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sa13yHWb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sa13yHWb; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp6dl3Swpz30GQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 18:24:25 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id e19so19904989pla.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 01:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=slQOcr3pR1fSb4ywlXA1jXCttibOv/ITmTwkWj7PZVk=;
 b=sa13yHWbG9hlaKtdc3vMLIr3b95AuIkSRVi54nWgsfBQB9AXV6GWwrznuO24FN4l+W
 EThQHnLXZszaAodOfXzcsd7uSTFsKpy+2XQ0Aq4oOb2OEgAw919QPGyhYGAFy3jRwlWO
 E3mRELqXWk6EcsCEaSw9cMbIpy6CB+wwSyeX9fk7dLO21NfdmkXpDmpDe9weJ8fSzx4Q
 U2oGJyNEjYUGnay2No1/UaBmZU24XweXlLN/JSbKggXpS9+fZmS1CsRuv+23x8JIT4nl
 /sDGE299+1xLdE5sNPh+Q4zt0maQaHqmLegVnHQiWPCybiVoE/8vkbvZOjEiKyu8BKyD
 sTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=slQOcr3pR1fSb4ywlXA1jXCttibOv/ITmTwkWj7PZVk=;
 b=S1aYNIFStL0teptIt0kO7V/7UV3709iUSfBR2hdPB0L8ekYsnVIUxovOGQJjA0XvFH
 3romvyVxY2yoOe0hJ0RadG0USBLJPpPi8RVunsXlgx07Bts/FAiG52mHD8yKyEndcTK7
 4zE0a57yr1QLh/yS3U7Pmr0rGWy2FvTiVcxfiRz11EpKjXOYrdKiQNRM7gcNb91CihRa
 jL1rskeiC2WzudF1zyxTFoqUUu5BnaGi0TWUuHPPvoFp75QrjxbrDKC/kL1m1xKlXY5b
 sCrHmwvtrLyhGDNwZi/s9esnjTYG269CwN53/gMmZ+nHyoLnnwx49nlmhNVqBf9P7Twj
 Bs8w==
X-Gm-Message-State: AOAM531eLWxuggZFOm9rHeGT0VKdb8DAqXGLLx7Ngsa4bx20HrUgAnz4
 8FDvuXnfJtQgIqdcfM1ebQIQtvmHHuk=
X-Google-Smtp-Source: ABdhPJx26ZOBVXsqW9ZmPs6LsnG+ZMykwC5HUXfJZ2lrs6VcX7qnqUT4SN23eCRvtVPMexIBdx+BEg==
X-Received: by 2002:a17:902:f20a:b0:12d:a6a9:d124 with SMTP id
 m10-20020a170902f20a00b0012da6a9d124mr8673364plc.16.1629102261860; 
 Mon, 16 Aug 2021 01:24:21 -0700 (PDT)
Received: from voyager.lan ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id u24sm10542358pfm.85.2021.08.16.01.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 01:24:20 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Paul Mackerras <paulus@samba.org>, Michael Neuling <mikey@neuling.org>,
 Anton Blanchard <anton@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/3] powerpc/64s: Fix PPC_BARRIER_NOSPEC=n
Date: Mon, 16 Aug 2021 17:54:00 +0930
Message-Id: <20210816082403.2293846-1-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When disabling PPC_BARRIER_NOSPEC on Microwatt to see if it improved
boot time, I discovered the build was broken (first patch). This got
worse between when I first tried and now (second patch).

The third patch disables PPC_BARRIER_NOSPEC when building for Microwatt.
This one is optional, as it doesn't seem to change boot speed with the
current Microwatt design on an Arty.

Joel Stanley (3):
  powerpc/64s: Fix build when !PPC_BARRIER_NOSPEC
  powerpc: Fix undefined static key
  powerpc/microwatt: CPU doesn't (yet) have speculation bugs

 arch/powerpc/Kconfig                         | 1 +
 arch/powerpc/include/asm/security_features.h | 3 +++
 arch/powerpc/include/asm/setup.h             | 2 --
 3 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.32.0

