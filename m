Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E00665A3A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 12:32:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsQWh3n3lz3fC9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 22:32:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=r2G5tc8B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=r2G5tc8B;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsQVl332tz3fC0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 22:31:27 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 33A2FB81BB9;
	Wed, 11 Jan 2023 11:31:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D567C433D2;
	Wed, 11 Jan 2023 11:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1673436681;
	bh=0Bpc3jZjc4ubxRXEsKaSqd4DQvO/82q+vPfR3P3xTaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r2G5tc8BY8ykHRTD/OsbadLcY1VbAKeAdi6TlC8+3y+LG0eFIpUqlRNPaXjhniqDL
	 ofcdXdlfExzRc5T+fiT8Xz3RLG5A4DfqZyKr1Zs88N17J/jZVrA+gpAkuOLjqrU5tj
	 MpXeAEjbSL302ItcLZrQgjNIM4x0MVe9LfV8AhMI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/16] vio: move to_vio_dev() to use container_of_const()
Date: Wed, 11 Jan 2023 12:30:10 +0100
Message-Id: <20230111113018.459199-9-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111113018.459199-1-gregkh@linuxfoundation.org>
References: <20230111113018.459199-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2143; i=gregkh@linuxfoundation.org; h=from:subject; bh=0Bpc3jZjc4ubxRXEsKaSqd4DQvO/82q+vPfR3P3xTaU=; b=owGbwMvMwCRo6H6F97bub03G02pJDMn75p64zvshJ7oi+c3+BtE+i8Apuy+b/guyP3N4Tu78wtP/ ciJtO2JZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAi1VsY5mfKqPws5+bR2mlWnO3iE2 ykzmb3jGGuqNfd0JrDl5b/V425UlEbUj9xSdYrAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
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
Cc: Kees Cook <keescook@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The driver core is changing to pass some pointers as const, so move
to_vio_dev() to use container_of_const() to handle this change.
to_vio_dev() now properly keeps the const-ness of the pointer passed
into it, while as before it could be lost.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/include/asm/vio.h | 5 +----
 arch/sparc/include/asm/vio.h   | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/vio.h b/arch/powerpc/include/asm/vio.h
index e7479a4abf96..cc9b787627ad 100644
--- a/arch/powerpc/include/asm/vio.h
+++ b/arch/powerpc/include/asm/vio.h
@@ -161,10 +161,7 @@ static inline struct vio_driver *to_vio_driver(struct device_driver *drv)
 	return container_of(drv, struct vio_driver, driver);
 }
 
-static inline struct vio_dev *to_vio_dev(struct device *dev)
-{
-	return container_of(dev, struct vio_dev, dev);
-}
+#define to_vio_dev(__dev)	container_of_const(__dev, struct vio_dev, dev)
 
 #endif /* __KERNEL__ */
 #endif /* _ASM_POWERPC_VIO_H */
diff --git a/arch/sparc/include/asm/vio.h b/arch/sparc/include/asm/vio.h
index 2d7bdf665fd3..8a0c3c11c9ce 100644
--- a/arch/sparc/include/asm/vio.h
+++ b/arch/sparc/include/asm/vio.h
@@ -488,10 +488,7 @@ static inline struct vio_driver *to_vio_driver(struct device_driver *drv)
 	return container_of(drv, struct vio_driver, driver);
 }
 
-static inline struct vio_dev *to_vio_dev(struct device *dev)
-{
-	return container_of(dev, struct vio_dev, dev);
-}
+#define to_vio_dev(__dev)	container_of_const(__dev, struct vio_dev, dev)
 
 int vio_ldc_send(struct vio_driver_state *vio, void *data, int len);
 void vio_link_state_change(struct vio_driver_state *vio, int event);
-- 
2.39.0

