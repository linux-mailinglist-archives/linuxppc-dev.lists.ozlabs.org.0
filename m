Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDFD783F11
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 13:33:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mA9ZNhOC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVRzk12Hyz3cM3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 21:33:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mA9ZNhOC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVRyR2x9pz3c1K
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 21:31:59 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7D59665295;
	Tue, 22 Aug 2023 11:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA598C433C7;
	Tue, 22 Aug 2023 11:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692703914;
	bh=ztcJ1CN4cWHcEnGXHXCyGiTRo9NclIPqHiohb6JvUTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mA9ZNhOCf9VKnInkT427v4vrHQHRNtN9U+hE0sgG+9ICJWq0SzYSAnPx8Ay5xdRuL
	 QiB9FvW87JbQZ3ZmtUDXWi1cJ5momn8FYs0JEnpPLA+hOzSQH+d+Lxa9HhUdAP4qSo
	 erApMzpkWGxfMqPhBBHQkh5ujaypEFVndZZUv14Jrt1JRrjrObf/ANhqih1DrzXF2x
	 hJRBaOOtbz94O1U4BSttnxyWFjIy7JSaXmIrlqndkinwbdgMGBUceUEyYXljw8Cdvo
	 zVZz/1zg+lkpDtXpJ4Z5ylXXKIMv+IF1PqDPfPFp4GhJ2lS49CTmuokWQAZgyM7B+q
	 2keAGgAyigG6Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 9/9] powerpc/powermac: Use early_* IO variants in via_calibrate_decr()
Date: Tue, 22 Aug 2023 07:31:30 -0400
Message-Id: <20230822113130.3550050-9-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230822113130.3550050-1-sashal@kernel.org>
References: <20230822113130.3550050-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.46
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Benjamin Gray <bgray@linux.ibm.com>

[ Upstream commit 86582e6189dd8f9f52c25d46c70fe5d111da6345 ]

On a powermac platform, via the call path:

  start_kernel()
    time_init()
      ppc_md.calibrate_decr() (pmac_calibrate_decr)
        via_calibrate_decr()

ioremap() and iounmap() are called. The unmap can enable interrupts
unexpectedly (cond_resched() in vunmap_pmd_range()), which causes a
warning later in the boot sequence in start_kernel().

Use the early_* variants of these IO functions to prevent this.

The issue is pre-existing, but is surfaced by commit 721255b9826b
("genirq: Use a maple tree for interrupt descriptor management").

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://msgid.link/20230706010816.72682-1-bgray@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/powermac/time.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/time.c b/arch/powerpc/platforms/powermac/time.c
index 4c5790aff1b54..8633891b7aa58 100644
--- a/arch/powerpc/platforms/powermac/time.c
+++ b/arch/powerpc/platforms/powermac/time.c
@@ -26,8 +26,8 @@
 #include <linux/rtc.h>
 #include <linux/of_address.h>
 
+#include <asm/early_ioremap.h>
 #include <asm/sections.h>
-#include <asm/io.h>
 #include <asm/machdep.h>
 #include <asm/time.h>
 #include <asm/nvram.h>
@@ -182,7 +182,7 @@ static int __init via_calibrate_decr(void)
 		return 0;
 	}
 	of_node_put(vias);
-	via = ioremap(rsrc.start, resource_size(&rsrc));
+	via = early_ioremap(rsrc.start, resource_size(&rsrc));
 	if (via == NULL) {
 		printk(KERN_ERR "Failed to map VIA for timer calibration !\n");
 		return 0;
@@ -207,7 +207,7 @@ static int __init via_calibrate_decr(void)
 
 	ppc_tb_freq = (dstart - dend) * 100 / 6;
 
-	iounmap(via);
+	early_iounmap((void *)via, resource_size(&rsrc));
 
 	return 1;
 }
-- 
2.40.1

