Return-Path: <linuxppc-dev+bounces-6346-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DA7A3BC85
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2025 12:15:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YyYhz27Nmz2ypP;
	Wed, 19 Feb 2025 22:15:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.176
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739963731;
	cv=none; b=ZAo3q5Tf9X3UYgj4ZgvUGVml9yuP1lAbzOSeizNa/X2Ao4ClmTDx7WIgxkzA+gksE4ptaI5uHjBI/28aNL5HZ/xtLUXOiWXTK4t2xhCo1ZZbItmgvY3AFOE0FRsBW9Zz0v5qlCKLBg0HbOJ+J7IYKHL82etix7UX2Qa4USH0HmICsEMnRgL9fPm07pHnRyqZYFKTcejo2PmHFqQfJbXq5viLR5BkunyJfLFO6TapvKsxnnBSwj+mvVvC+0nB3FfskT38dFwau+ET6UR2j6sUmPwanNrbAKpqlLZ67CmA6OXnGeCCB46v2dAjmTf1AjbJtF4+H0EK4EY9CFanm1QMjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739963731; c=relaxed/relaxed;
	bh=V7J6bjtaJTUd2K3lHUzfdRkSYg0oGbnN7LsQbAU/9XM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eue2XzIuvR6Z//dJO9Ya1Gtq6bntGpEvpk+k2v36JA0Q3kVqBZmIf+d8IPihVvTVAiHPRPHk4ZESYJ73ZZB8KrvOsjas+03Bwiko4mva/q2554nlxp83tVlodwjaRAwxIsLA/+oC1bSS6HzN0S1zAkEfmrwaQk0L+Nc0gLts/Umd6mn7NYhVyD7n7/Zxquk4RgoT1F3QT+XHYZUml1bzUW7d9Sdev3flsyLPFckzyryfKVf8J0VLq2MckDVsyK/GcRUPQS23M2Hjv9WSu1ehTLgQ4DD5ezlg6V/YbBZkL9kgh7G0q4CstHc8FLOphT24e33Wilulrqw4XbJikzUgSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Hu5kFdvD; dkim-atps=neutral; spf=pass (client-ip=95.215.58.176; helo=out-176.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Hu5kFdvD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.176; helo=out-176.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YyYhw07rbz2ykZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 22:15:26 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739963705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V7J6bjtaJTUd2K3lHUzfdRkSYg0oGbnN7LsQbAU/9XM=;
	b=Hu5kFdvDAl32MVBunidKz0lAaU+XD+kJfkL4Cw+vHuYkNw4YLkqIORjg824bxqSwl28IkG
	B7EMVX+KJFYNsnHnGg8R60lwGEB+rdEY6Lw5HbGMS8oz751Bme1exo81wBvwzpgDB+zw3c
	kkaUKDbj7EeQsujtqYSMAFns28sKWRc=
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
Subject: [RESEND PATCH] powerpc/ps3: Use str_write_read() in ps3_notification_read_write()
Date: Wed, 19 Feb 2025 12:14:45 +0100
Message-ID: <20250219111445.2875-2-thorsten.blum@linux.dev>
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
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Remove hard-coded strings by using the str_write_read() helper function.

Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
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
2.48.1


