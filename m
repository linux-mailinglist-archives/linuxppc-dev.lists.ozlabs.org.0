Return-Path: <linuxppc-dev+bounces-7600-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 876C8A85703
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 10:52:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYr6800K0z2x9g;
	Fri, 11 Apr 2025 18:52:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.186
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744361535;
	cv=none; b=PJIkCzqdJYGrr8NNLNuENeLhYQRURzpfGUzei0SnKTbwxwR/c0NfyhIbRctBuicSh9QeMu4wAhhU7WG5errwGQ2YWQ6pM+IrzSyPV08Boej5hQk8hTQ3uLSKubqdKN3AId2Fnau8vAThD+MZnpvXGH9Z7Jk+fD2be/bApvy3i+lln0jvpOBSMWnUXOiz6ntHDvxukTvI18+ihG1NPD3FBQTwKqh5dT+XSyI98LTxPGCDFQzonSRuxwhVXTSrSdMzlr7TtyCybcT1mDKVskNWnAbgfTukTGdE825ZujlBgd3X/XUuTn6kVOIziePoqF9/2RmNBGUacaMj+gMPgf2KiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744361535; c=relaxed/relaxed;
	bh=rD0AeWa3VYYnbBf/+BWpTsXB9fuGYu1O2IlTp9BrMoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kyxeUTwyE6xqvdHAi3QOJcLT0D+S2396J3otfIIPrUleIBysVT7nsvPx01Vnq2oYeb8i2sQ6D+lapKHwtf5rk8qqiHH/XwCFtb/qtOd7w2jnNr7p0DTQHL6uhuiSB6+NngghY4i+WMHXhC8OPqu8WcgPNEjfH1ZFsan1KW0dyVCc+qJZBslBQ6SoJapb8wXuwTpQTXvb6ZSrhOgbgdF2KX+ZUuL23UDUEmv3/BfHXlvnkkieTVjGD+foqxenbkDWKZ1PnSSgkrEDnv8AIGIyP6NCIIBrw9baIrlUcMTwU80Y+nt4ukKot5ywI6mHVyIVbkipivHye0S+yibuClkM2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WoFndN8k; dkim-atps=neutral; spf=pass (client-ip=95.215.58.186; helo=out-186.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WoFndN8k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.186; helo=out-186.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYr666qF2z2x9N
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 18:52:14 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744361516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rD0AeWa3VYYnbBf/+BWpTsXB9fuGYu1O2IlTp9BrMoU=;
	b=WoFndN8kzgMVyUySouKB4elQnoEc5kScFJ51C5wivJqaHbv7CGmh2Lqm0Q7p8iufUDD/yd
	9l5TwN7oo8l7L0Ni9V1rilPmEFQFNXA/1C9fkL2Q4q7+NJcElHcp5usdc15AZaxvSwWBtR
	vhnmqZxYcLuZdEYdy3Q8xDByfuGkjLg=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Geoff Levand <geoff@infradead.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] powerpc/ps3: Use str_write_read() in ps3_notification_read_write()
Date: Fri, 11 Apr 2025 10:51:33 +0200
Message-ID: <20250411085134.7657-1-thorsten.blum@linux.dev>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Remove hard-coded strings by using the str_write_read() helper function.

Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/platforms/ps3/device-init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/ps3/device-init.c b/arch/powerpc/platforms/ps3/device-init.c
index 61722133eb2d..22d91ac424dd 100644
--- a/arch/powerpc/platforms/ps3/device-init.c
+++ b/arch/powerpc/platforms/ps3/device-init.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/reboot.h>
 #include <linux/rcuwait.h>
+#include <linux/string_choices.h>
 
 #include <asm/firmware.h>
 #include <asm/lv1call.h>
@@ -724,7 +725,7 @@ static irqreturn_t ps3_notification_interrupt(int irq, void *data)
 static int ps3_notification_read_write(struct ps3_notification_device *dev,
 				       u64 lpar, int write)
 {
-	const char *op = write ? "write" : "read";
+	const char *op = str_write_read(write);
 	unsigned long flags;
 	int res;
 
-- 
2.49.0


