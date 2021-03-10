Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6EA334801
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 20:33:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dwj0w0kJKz3cRD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 06:33:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YOvJsN6T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YOvJsN6T; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dwj0W73vnz3cKR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 06:32:59 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B523B64EF6;
 Wed, 10 Mar 2021 19:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615404776;
 bh=gwXRZ5UJgu1hAM5FqZTaeDqfPX+e70coJ6SxO4EqahY=;
 h=From:To:Cc:Subject:Date:From;
 b=YOvJsN6TCfMtjSBAln04iUJm6N65fMwIiUNbErAkavduoU8h6zxQMhvwS/p2hIHK9
 A3UYTsttiL86iZWxbFFbULMD63KUDegYsnQgcnFCb1l22KnLOm0o3v6TYqBEHHycBi
 GorVFe9druHSl6Qr21BA3qKnrMjVUvdqrlrKO6g+jfu8egSgd+tbAU0Ef+JOyZwjxI
 jujvGVKaVhxOYQaYIza+Y0pJAhyjaDAWgRzRgbaTehmJMyTDQ7HsfeE5bmtl1hgc1W
 eb+okHttbgJkjy0Y8ifgl+ZFgDnrvHU1OWhIe2uXS737dZ0Jik5eutW+Y+qquzTD3R
 V+9oc09fRW62Q==
From: Wolfram Sang <wsa@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: ppc: keywest: remove outdated comment
Date: Wed, 10 Mar 2021 20:32:27 +0100
Message-Id: <20210310193227.333140-1-wsa@kernel.org>
X-Mailer: git-send-email 2.30.0
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
Cc: Wolfram Sang <wsa@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The I2C attach_adapter callback is gone. Remove this reference.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 sound/ppc/keywest.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/ppc/keywest.c b/sound/ppc/keywest.c
index a6c1905039de..a8915100d6bb 100644
--- a/sound/ppc/keywest.c
+++ b/sound/ppc/keywest.c
@@ -13,12 +13,7 @@
 #include <sound/core.h>
 #include "pmac.h"
 
-/*
- * we have to keep a static variable here since i2c attach_adapter
- * callback cannot pass a private data.
- */
 static struct pmac_keywest *keywest_ctx;
-
 static bool keywest_probed;
 
 static int keywest_probe(struct i2c_client *client,
-- 
2.30.0

