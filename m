Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD2B86C878
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 12:51:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VYvhkL3J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlqLJ1XBJz3vZp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 22:51:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VYvhkL3J;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlqKZ6bzcz3cZN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 22:50:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709207421;
	bh=x+0nc01xdaOOxQkjy8kCF42KJK2qMmYg+0do84sBsXw=;
	h=From:To:Cc:Subject:Date:From;
	b=VYvhkL3Jm56fK/CvMOyFKfZ4D7k+7hWiGHJDfESphFJbtmEsfd/lq+SchAFZqiSfP
	 mr9ITa9qsfgb+zJb9wwe11KEmDNVIgns83xTRcsq51+zRsqDQVkHNpHwhoakybK6pv
	 vKBDq1vvGgbEhW+LX8s2DypL5VC5z6ORY9liNzoclC+ycGKZjhVoPpORAfOyzwF3Wo
	 O/Lz4LN/KI9qyHov8qUiv6CO+vrgBCGg7u5EVYGMGX0t5tByIxcvLNVmbeB7R58fW5
	 tc/vMwBl1IofFs9Q9P2iVtYaszlahQNfPZ9tt1dh6TvLSyPGR+dLTX2RHjS1esUsNs
	 eOpLFeZsjnPVQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TlqKR62hgz4wbh;
	Thu, 29 Feb 2024 22:50:19 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	deller@gmx.de
Subject: [PATCH] fbdev/mb862xxfb: Fix defined but not used error
Date: Thu, 29 Feb 2024 22:50:10 +1100
Message-ID: <20240229115010.748435-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.2
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

socrates_gc_mode is defined at the top-level but then only used inside
an #ifdef CONFIG_FB_MB862XX_LIME, leading to an error with some configs:

  drivers/video/fbdev/mb862xx/mb862xxfbdrv.c:36:31: error: ‘socrates_gc_mode’ defined but not used
     36 | static struct mb862xx_gc_mode socrates_gc_mode = {

Fix it by moving socrates_gc_mode inside that ifdef, immediately prior
to the only function where it's used.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
index 7c402e9fd7a9..baec312d7b33 100644
--- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
+++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
@@ -32,15 +32,6 @@
 #define CARMINE_MEM_SIZE	0x8000000
 #define DRV_NAME		"mb862xxfb"
 
-#if defined(CONFIG_SOCRATES)
-static struct mb862xx_gc_mode socrates_gc_mode = {
-	/* Mode for Prime View PM070WL4 TFT LCD Panel */
-	{ "800x480", 45, 800, 480, 40000, 86, 42, 33, 10, 128, 2, 0, 0, 0 },
-	/* 16 bits/pixel, 16MB, 133MHz, SDRAM memory mode value */
-	16, 0x1000000, GC_CCF_COT_133, 0x4157ba63
-};
-#endif
-
 /* Helpers */
 static inline int h_total(struct fb_var_screeninfo *var)
 {
@@ -666,6 +657,15 @@ static int mb862xx_gdc_init(struct mb862xxfb_par *par)
 	return 0;
 }
 
+#if defined(CONFIG_SOCRATES)
+static struct mb862xx_gc_mode socrates_gc_mode = {
+	/* Mode for Prime View PM070WL4 TFT LCD Panel */
+	{ "800x480", 45, 800, 480, 40000, 86, 42, 33, 10, 128, 2, 0, 0, 0 },
+	/* 16 bits/pixel, 16MB, 133MHz, SDRAM memory mode value */
+	16, 0x1000000, GC_CCF_COT_133, 0x4157ba63
+};
+#endif
+
 static int of_platform_mb862xx_probe(struct platform_device *ofdev)
 {
 	struct device_node *np = ofdev->dev.of_node;
-- 
2.43.2

