Return-Path: <linuxppc-dev+bounces-259-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE406959666
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 10:21:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpfRj2jlRz2yDc;
	Wed, 21 Aug 2024 18:21:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EQvKMQLd;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpfRh5phRz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 18:21:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724228464;
	bh=mbsQ7HQ9AJbv8oqx4aaxoEjhC30iKIQUF2ManMs8PGc=;
	h=From:To:Cc:Subject:Date:From;
	b=EQvKMQLdMrs4Wt4MrVCMOlxgopbmfAnRtBzrkquDk+0zS/JB+1R1+/5zxsYIivnCV
	 KT+mmP+bEiy2tl812imCZsnKOkv/3CJWBF4U5d6Jj1t1mjMi8BKMj3WUdfUhbSYotS
	 wASYlQhiCHUI1pEQfroyj/+JS6tMlEgL/BspUS/ztaVzFMj86uurwWJ7LZs5biSq6e
	 9/GohLZ7pKfp6LNvXszKyJokitKihhfir8C+E4WzyuTGYbhHTiTzg3e5q7LLjuPFhD
	 wrxZkMgvyMxWt9xVRrvc89ixLgiR/mx2ckRy4uAFOqfWNDAit4g8/AKhTXGwe42Xgv
	 WsZ+ypFgn7K1w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WpfRg6bJzz4x5M;
	Wed, 21 Aug 2024 18:21:03 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: linux-m68k@lists.linux-m68k.org,
	geert@linux-m68k.org
Subject: [PATCH] macintosh/via-pmu: register_pmu_pm_ops() can be __init
Date: Wed, 21 Aug 2024 18:21:01 +1000
Message-ID: <20240821082101.877438-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.46.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

register_pmu_pm_ops() is only called at init time, via
device_initcall(), so can be marked __init. The driver can't be built as
a module.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/macintosh/via-pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
index 7b7808281292..2f131ab9bb15 100644
--- a/drivers/macintosh/via-pmu.c
+++ b/drivers/macintosh/via-pmu.c
@@ -2334,7 +2334,7 @@ static const struct platform_suspend_ops pmu_pm_ops = {
 	.valid = pmu_sleep_valid,
 };
 
-static int register_pmu_pm_ops(void)
+static int __init register_pmu_pm_ops(void)
 {
 	if (pmu_kind == PMU_OHARE_BASED)
 		powerbook_sleep_init_3400();
-- 
2.46.0


