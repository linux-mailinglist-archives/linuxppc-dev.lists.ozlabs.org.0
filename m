Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 311F1871F47
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 13:36:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=F+EUHuqA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tpw696z7fz3vgW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 23:36:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=F+EUHuqA;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tpw3t6X9Bz3dSv
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 23:34:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709642056;
	bh=nS4PvJpu6wETIfLmKaqOWSGix7khF3vJOX325G6Xiec=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=F+EUHuqAQSn3Atz14nz4tZa06gMkRXM2BvBNZlOzPwWfO8j3b1/B0Aa6BmLukxIXP
	 GODlJCUJkJPFblDrO6srsUbRY2GBE2PKAtDGMTqdnh6/G0M+n4qIx1VZjDS8vEx3kI
	 B779a9IbZwcrXyw1W7XQ+iNfxy0rIQIpvz3HX3BZM5uhE/3IgAkvWM9tGi73KgOWPc
	 uKib8U1cBWfVaRCQWA+XfSkDBiC/0a0EPkjImw3sEwOHHDIhZvtE47esZwvvJx11J0
	 BINBAya/HvwElYbBSfYUvIzqnEiu9jkEAnpCLnbHb4u3uDo2v8/UflOkcDu/AkdXGe
	 hmWWJ38dDWV/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tpw3r0M6cz4wyq;
	Tue,  5 Mar 2024 23:34:16 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 3/3] powerpc/4xx: Fix warp_gpio_leds build failure
Date: Tue,  5 Mar 2024 23:34:10 +1100
Message-ID: <20240305123410.3306253-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240305123410.3306253-1-mpe@ellerman.id.au>
References: <20240305123410.3306253-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The 44x/warp_defconfig build fails with:

  arch/powerpc/platforms/44x/warp.c:109:15: error: variable ‘warp_gpio_leds’ has initializer but incomplete type
    109 | static struct platform_device warp_gpio_leds = {
        |               ^~~~~~~~~~~~~~~

Fix it by including platform_device.h.

Fixes: ef175b29a242 ("of: Stop circularly including of_device.h and of_platform.h")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/44x/warp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/44x/warp.c b/arch/powerpc/platforms/44x/warp.c
index bf0188dcb918..a5001d32f978 100644
--- a/arch/powerpc/platforms/44x/warp.c
+++ b/arch/powerpc/platforms/44x/warp.c
@@ -8,6 +8,7 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/kthread.h>
 #include <linux/leds.h>
 #include <linux/i2c.h>
-- 
2.43.2

