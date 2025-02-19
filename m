Return-Path: <linuxppc-dev+bounces-6347-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE1FA3BCA1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2025 12:21:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YyYr603rlz30Nc;
	Wed, 19 Feb 2025 22:21:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::ac"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739964101;
	cv=none; b=ZsUrzNT9rusnxoCAng1MuHrEEzo3mQ/8ytIIQLnnicJK12BdIRyZO00I+YoGZ6e6qg44wKJ/+lrSPrprJvVm4Gzp0t02PpE9QROAH56BUvWHW137dhoTAxeJoMC1ySLV699/Y3gn+xLjX1DYDqpytlBM8EC8qCrR16/ejyN1w9nlMQkWSIPiiRMms4Fn1jcrXOwzsqJ3vnANh5pbY4JFuvbmoaiC0DBWkeI4F6SVtbasCjDAc4xStK3DVfsJRkRgLN2KCP0JHr5hWFAUntfevNzmv7qLbplsyxYXJK56EH7qyXC3ZHvspZ+nUycNED+BmBEnuG7TgijWSXmwVa7xIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739964101; c=relaxed/relaxed;
	bh=VbnfYpgjWkRFEHyP0AjeLJC9trz2T52WuBKfYylRL1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oC/0RVXJI9bVv7Donyhn3NHHYymjrc+DbtzO/BEJn54koi1vd4KtFn3KIjCPWGV7TlRXSbKBnxn3YHsdxk1r/A79uEZTXG052HYdA/lGRVSbK43ZZRwpqKxJnEocO3UqQpP4RWpMVjkSusGWw0GkNfGGnthR+6rboEziXmgu4dnkuKcmIFMzqT6tV+o+gyQyNdV5gqay/h5XMm40Y7LxdrHcAhUyuwVROj0dnqCXP46Jp8DgQlAy77k4RBAjlHIEaE9doCkrZbRN9hwYuzTHoTZjR7kDlRALUW8clTF6FFx9k/LYg4TTlO5RnNjFLkixGCuVS0s70950NDsn0Sin/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ELOE7ZeY; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::ac; helo=out-172.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ELOE7ZeY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::ac; helo=out-172.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [IPv6:2001:41d0:203:375::ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YyYr51GSmz2x9N
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 22:21:40 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739964079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VbnfYpgjWkRFEHyP0AjeLJC9trz2T52WuBKfYylRL1Q=;
	b=ELOE7ZeYVBe7n7GTsLUiWA+YpQPM0B19luO+whrKKrz/ZSizg3ZAkrD05CqAR1J/E7fiSx
	aNp9dJO3S8tyZ+R4/OFCMvox/ut6fRs7hq+jgOCn/6TGx9b7tiWRM5mZw2kbiObtZjp5V0
	SXCFFkX0523/vbML2Rq3ae9+sfeUdj0=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	=?UTF-8?q?Ricardo=20B=2E=20Marli=C3=A8re?= <ricardo@marliere.net>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] powerpc: mpic: Use str_enabled_disabled() helper function
Date: Wed, 19 Feb 2025 12:20:52 +0100
Message-ID: <20250219112053.3352-2-thorsten.blum@linux.dev>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Remove hard-coded strings by using the str_enabled_disabled() helper
function.

Use pr_debug() instead of printk(KERN_DEBUG) to silence a checkpatch
warning.

Reviewed-by: Ricardo B. Marlière <ricardo@marliere.net>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/sysdev/mpic.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index d94cf36b0f65..25fc4ac91814 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -27,6 +27,7 @@
 #include <linux/spinlock.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/syscore_ops.h>
 #include <linux/ratelimit.h>
 #include <linux/pgtable.h>
@@ -474,9 +475,9 @@ static void __init mpic_scan_ht_msi(struct mpic *mpic, u8 __iomem *devbase,
 		addr = addr | ((u64)readl(base + HT_MSI_ADDR_HI) << 32);
 	}
 
-	printk(KERN_DEBUG "mpic:   - HT:%02x.%x %s MSI mapping found @ 0x%llx\n",
-		PCI_SLOT(devfn), PCI_FUNC(devfn),
-		flags & HT_MSI_FLAGS_ENABLE ? "enabled" : "disabled", addr);
+	pr_debug("mpic:   - HT:%02x.%x %s MSI mapping found @ 0x%llx\n",
+		 PCI_SLOT(devfn), PCI_FUNC(devfn),
+		 str_enabled_disabled(flags & HT_MSI_FLAGS_ENABLE), addr);
 
 	if (!(flags & HT_MSI_FLAGS_ENABLE))
 		writeb(flags | HT_MSI_FLAGS_ENABLE, base + HT_MSI_FLAGS);
-- 
2.48.1


