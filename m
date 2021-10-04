Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A920F421224
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 16:58:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNP3L46fxz30BM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 01:58:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OgP3q3Ts;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=OgP3q3Ts; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNP1x3MZXz2xtT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 01:56:51 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id
 d13-20020a17090ad3cd00b0019e746f7bd4so4137905pjw.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 07:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xsqvc/zYW3DgOOoElq9EhlOlpeikMXTqBJGOZTc9avk=;
 b=OgP3q3Ts1pRs5iqv6Q2JYz7uhrSwLDjmnHaLyoGbOOlwc5UDyHQd8Av9CI74qq7OE2
 2/zV/Xk62SXmwEicHCoVpMbD3giXxcUPJRMhbhLjNS9UBXcKxL/nO3rM/66tpjufnj00
 bVAksg3R3wnull6Sb8qS8PV7O1ZDvWDcCgODlCrL5VAtTRjfLGlOzSaHB+afvP91V69S
 l0MqKG3CLydiQiJC7mj4VYpFUJ6BLZncZtXURXefib+MUDgBVon4ZLUg/7e0ewX36xsP
 PANl1Giaa6p5OuIOld9HQZOyx2l506bGRdOHvKjp/g3F9OQuH/fu/DCaYuXHLy9FakcP
 4Bsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xsqvc/zYW3DgOOoElq9EhlOlpeikMXTqBJGOZTc9avk=;
 b=16+uTj/o1xoSD1SvA3EMJ6W+f6UMUdb0cBtVstBRGQ/PNJ5RMT8rGrw0NdyAwrfyrt
 XDm85KZw4ANl+y30vz+st4qmcC3eu7rlSTW3E5sl47zujN9jzdaLmTsZQ5GFWhDZ0GiE
 yPSgm3mPAeOz3fnwsSD2cuDaVxwWZiIZRdigQAAGPIUbOTE7fIEMSFlLmvb7JAo1nN10
 aUwExRfGOxUeREpmXSQfo+xXvS7reLIfyGzw24bml35xbHL0EH3+9CfX5QThSL4Ejnb/
 TaejeE92m38FGQevxt2MOtmJKkG+YaRupayWtIYfyK98y2+Gi8dtlXwGjg5GPsCBPMgZ
 uzrQ==
X-Gm-Message-State: AOAM532Ck2vRL8AqZxGGgsem30TzsS4t/FqZULyp1EYGIAY6dzic2w6h
 hDc5dpTJ1g8Cwz9r7oHyAHBfCrFT8zA=
X-Google-Smtp-Source: ABdhPJz7KIrRjH/GfyRjGfMguo/RR9MxRyzoFvO7YSk3IvhoYLboZwT4ekXD8ZcCkh8EU77N6sLS4g==
X-Received: by 2002:a17:90a:1904:: with SMTP id
 4mr36627747pjg.191.1633359407994; 
 Mon, 04 Oct 2021 07:56:47 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id f16sm13194903pjj.56.2021.10.04.07.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:56:47 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/5] powerpc: various interrupt handling fixes
Date: Tue,  5 Oct 2021 00:56:37 +1000
Message-Id: <20211004145642.1331214-1-npiggin@gmail.com>
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This fixes a number of bugs found mostly looking at a MCE handler issue,
which should be fixed in patch 5 of the series, previous attempt here
which Ganesh found to be wrong.

https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210922020247.209409-1-npiggin@gmail.com/

I didn't increment to patch v2 because it's a different approach (so I
gave it a different title).

Thanks,
Nick

Nicholas Piggin (5):
  powerpc/64s: fix program check interrupt emergency stack path
  powerpc/traps: do not enable irqs in _exception
  powerpc/64: warn if local irqs are enabled in NMI or hardirq context
  powerpc/64/interrupt: Reconcile soft-mask state in NMI and fix false
    BUG
  powerpc/64s: Fix unrecoverable MCE calling async handler from NMI

 arch/powerpc/include/asm/interrupt.h | 18 ++++++------
 arch/powerpc/kernel/exceptions-64s.S | 25 ++++++++++------
 arch/powerpc/kernel/irq.c            |  6 ++++
 arch/powerpc/kernel/traps.c          | 43 +++++++++++++++++-----------
 4 files changed, 59 insertions(+), 33 deletions(-)

-- 
2.23.0

