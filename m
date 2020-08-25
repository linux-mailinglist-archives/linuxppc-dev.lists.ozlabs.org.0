Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9BF2513A2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 09:54:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbLqs6XvvzDqV4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 17:54:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Htat54Bq; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbLpC4shCzDqSZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 17:53:22 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id k15so202419pfc.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 00:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XewRWLyI3yrr2wDOOlfWzPikdKiI+4PcSfaji8pe8Do=;
 b=Htat54BqcojW27bYbrQ+QMXFI9yWxYacTirCeWkAD/PPlcNqUWRkzzDEKPCH4MgwIk
 6wrR6KV3HZ9CAJUUtRzLnYc6mlWeSbajJubgcF+4kFfcQMkfsN0cqpmcagtDOp31wCgx
 dTB81sPxqyJ56Dufxg8+0qmw4sRq59gjB2iCtGb4/iGCJy7QYYC+6HZLLQ8XFMkMr1+o
 tCwlHC/YwKqWg38HoGhNyfpEBTh4UqKtH0OZBLpoFrtH6aiMmVOodZUBs5o/vISOPC7b
 mAbbYhc/3eKPDo9zr/rXHiTjVMaNFlroGJLAOmQia1cywlYqPUQLOGjlWYYlwN8wyWya
 gP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XewRWLyI3yrr2wDOOlfWzPikdKiI+4PcSfaji8pe8Do=;
 b=XsSUYwgJlmkPk7iu/Lkm1SpIfNpg79zZUsGY2RQFNRKqklaAPKxUWXyjLQtx1x9pc/
 YiisWueYoXpeB/hfQFgWZkU1QO6Uys2KY8uyGAkudrfGx8balX2ZQ1ddR/jNHHTFrwBP
 iPgD1i42MN4Vkt4I7leEeXSNMyI3uSk1gR94OtRPeJbtJpmY5oTsh56fJ/kAGq/oWmdx
 6/jEX/e+p+Ltn6c7c8guF25XS30FAd4WA5s1mWyvLA6W/UFgsXHKf/O4Ps4rk8kMmHVI
 W3euPs4deo4ZX4UAvgNcRz/xlmYHKdq9nAz8SHMjhegWci5xWen731+N0/zG9WtioXiG
 QbAg==
X-Gm-Message-State: AOAM532rFDuL3uB1KGRydfHDRLfKgk1yj90KHT285ITuiqqIBrjqgEVC
 v0kRmVlE1LdA+Art5/UU4/Q3l5q/iIs=
X-Google-Smtp-Source: ABdhPJwZko2X4Af4XQw2QDFwKdqkJR7JhdftekmcIH4Q5OpO9+Bs0s/BFDsPH6MLS1GNII9Lbf12Yg==
X-Received: by 2002:a63:e057:: with SMTP id n23mr5743614pgj.368.1598341998637; 
 Tue, 25 Aug 2020 00:53:18 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id q82sm15903174pfc.139.2020.08.25.00.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 00:53:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: scv entry should set PPR
Date: Tue, 25 Aug 2020 17:53:09 +1000
Message-Id: <20200825075309.224184-1-npiggin@gmail.com>
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

Kernel entry sets PPR to HMT_MEDIUM by convention. The scv entry
path missed this.

Fixes: 7fa95f9adaee ("powerpc/64s: system call support for scv/rfscv instructions")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_64.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 33a42e42c56f..733e40eba4eb 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -113,6 +113,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
 	ld	r11,exception_marker@toc(r2)
 	std	r11,-16(r10)		/* "regshere" marker */
 
+BEGIN_FTR_SECTION
+	HMT_MEDIUM
+END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
+
 	/*
 	 * RECONCILE_IRQ_STATE without calling trace_hardirqs_off(), which
 	 * would clobber syscall parameters. Also we always enter with IRQs
-- 
2.23.0

