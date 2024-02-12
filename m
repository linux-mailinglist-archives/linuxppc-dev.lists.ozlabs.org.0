Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F5B85122F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 12:26:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s5jm+8v/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYMbn6YxGz3dVh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 22:26:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s5jm+8v/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYMb51zHgz2yQL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 22:25:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B3BE0CE10C2;
	Mon, 12 Feb 2024 11:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F9C6C43390;
	Mon, 12 Feb 2024 11:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707737150;
	bh=4g4oiPC3x8fy5FEvIMXnSo4ptsk7ZrRn6IXmztKqK+M=;
	h=From:To:Cc:Subject:Date:From;
	b=s5jm+8v/vxlalLNU1FTKvXIXGnrN6mDsipv8Fy7iwa6mpjlK2hr9GV+kOZq7cVuMO
	 6Tx3EdMCDju2jOOMkegn2lu3LqOI5VUfWGkwJFWrbYygEnzK4bRD/aWSL9SBr2Epnw
	 XRk+7gw3fY5zpVwaCAcz+8KHdIC96XKzvJnkq5Lxe4WdfGn+JCIKk8HR3ww/YGgv9T
	 NaBhbPcAnvdEwbw8NuwMWWEoHUl9xe7fGV55r17DsYVWWVgBHWB3I8csIdMAYLVSjk
	 MvRgYLg1ox+8NZKRjHFfjQAbnu7Q0c894kTvW3RaMDhdRFwIBNI7bUn175UQQ2uwhK
	 sTvhtXX0O1rAA==
From: Arnd Bergmann <arnd@kernel.org>
To: Roy Pledge <Roy.Pledge@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] soc: fsl: dpio: fix kcalloc() argument order
Date: Mon, 12 Feb 2024 12:25:27 +0100
Message-Id: <20240212112545.1244685-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

A previous bugfix added a call to kcalloc(), which starting in gcc-14
causes a harmless warning about the argument order:

drivers/soc/fsl/dpio/dpio-service.c: In function 'dpaa2_io_service_enqueue_multiple_desc_fq':
drivers/soc/fsl/dpio/dpio-service.c:526:29: error: 'kcalloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
  526 |         ed = kcalloc(sizeof(struct qbman_eq_desc), 32, GFP_KERNEL);
      |                             ^~~~~~
drivers/soc/fsl/dpio/dpio-service.c:526:29: note: earlier argument should specify number of elements, later size of each element

Since the two are only multiplied, the order does not change the
behavior, so just fix it now to shut up the compiler warning.

Fixes: 5c4a5999b245 ("soc: fsl: dpio: avoid stack usage warning")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/soc/fsl/dpio/dpio-service.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/dpio/dpio-service.c b/drivers/soc/fsl/dpio/dpio-service.c
index 1d2b27e3ea63..b811446e0fa5 100644
--- a/drivers/soc/fsl/dpio/dpio-service.c
+++ b/drivers/soc/fsl/dpio/dpio-service.c
@@ -523,7 +523,7 @@ int dpaa2_io_service_enqueue_multiple_desc_fq(struct dpaa2_io *d,
 	struct qbman_eq_desc *ed;
 	int i, ret;
 
-	ed = kcalloc(sizeof(struct qbman_eq_desc), 32, GFP_KERNEL);
+	ed = kcalloc(32, sizeof(struct qbman_eq_desc), GFP_KERNEL);
 	if (!ed)
 		return -ENOMEM;
 
-- 
2.39.2

