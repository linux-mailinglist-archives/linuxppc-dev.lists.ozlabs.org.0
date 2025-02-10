Return-Path: <linuxppc-dev+bounces-6037-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA2BA2F094
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 16:00:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ys76s2Vnzz2yYy;
	Tue, 11 Feb 2025 02:00:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::af"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739199637;
	cv=none; b=MjUhqVBqmNscpWtt4T1Pd0cipOWnfO6q45eIWsxvMchAMDgCZ1dLIBHkAbkpo5c8xG7ZaNsUkbCSCF2+xGfRIfI29gCy3UhgDWs039TrFSMf8jhWvsI3yZwPzQXimfE9kORKjgMHJJD0yvrmcLu9a8AcZEXVGzZG6gaw/PhUEzfxFw7wD5x1dvakNysZa8ttqeQP7matP/FHKl2iV9mOsrBBrX0OZyuFYRj2DbT9BdJQyI7gRT0kgFaa2Cjuz/+XjOZQALwan1WMA9Ap7Pb8BPSaYQ/fRfmH5jLj4z3Ws4/XyfffXSRqQM7Bo+HwWJ/pETcaE00gyCb1j1IQC30PbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739199637; c=relaxed/relaxed;
	bh=x8sCCa2YKkIDJYFULyVAbrsYRK6dAuQYm39tgqXv8zk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bA21dwUYzknmWePB1HqhhCqCxEOWA9MgvfENI9q5EjW0gkRpGM5XgnigD23AQ35pMY2GfI5AmHe27gRyWH5RmOtaHEEytm7SxcAqMhU2MIamkc23uFzKr2kkLS764L5jcdKx3iiwZinvqVl7TThFkMe1vTU0q00LK4CP4jhzQVEcZ7diacVO5wUiBKNTpU6lcyc2B1Jlwrh4BH+N1aYGWMy+6A4vDRCgZajRpYTVgoPB/pMuRGUmPwoEhQIpH3bsr7BIoTEfH6GIs81Ahmo7imkGfDapwJwgDAQLZ7ZeKmYRk6hKymLBnzbcjkayrzP6ElVtYJuot71229t7a4Wd/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uilgTmXD; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::af; helo=out-175.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uilgTmXD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::af; helo=out-175.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com [IPv6:2001:41d0:1004:224b::af])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ys76p0GGNz2y92
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 02:00:33 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739199599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x8sCCa2YKkIDJYFULyVAbrsYRK6dAuQYm39tgqXv8zk=;
	b=uilgTmXDFxkm32EtyBiJt1IGKej1PPQHsFIgSQFxuqVIQx+7HhBvTaUu1GT7rH4RFIOT6g
	aHsjmXoiAy9D//lDCj00M9X8gPLi9y48uzV66u3OHVmpseemmBDe+/iaTUZKONklSipHIb
	/luFRDgTDc5h6WTMlytkX43+CJPhCgk=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Geoff Levand <geoff@infradead.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/ps3: Use str_write_read() in ps3_notification_read_write()
Date: Mon, 10 Feb 2025 15:59:18 +0100
Message-ID: <20250210145918.138816-2-thorsten.blum@linux.dev>
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Remove hard-coded strings by using the str_write_read() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
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
2.48.1


