Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 663D6852DB4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 11:18:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s9rSz7y2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYy382CrYz3dVq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 21:18:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s9rSz7y2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYy2N5L6jz3bcJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 21:18:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 562E0CE12AD;
	Tue, 13 Feb 2024 10:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 311D5C433F1;
	Tue, 13 Feb 2024 10:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707819481;
	bh=M0omCzupnR3eO9G0ZEKmTrZW1r/VLKkL8eLhQp9cwrA=;
	h=From:To:Cc:Subject:Date:From;
	b=s9rSz7y2uHJMnZhKr4qSW9mpG7iRl6rFaesUumx6kTwL75nBPio0n+kTi3qJv/DKP
	 gNGyOl0ZlFS40+OiuZJuVQV18VucJadwMoEhCT8xe5gBgM1y8CHioDDwWwczTl02G7
	 DiJDA8DIUmNoelB2CJCau+WyZulEZK67E53aoxc+Wnfbc3TOjsjDoVG1UyoiAJPYJc
	 Naqu3voXnhoBzjqKcUvajkwaOASC+Q0ljhyjtD19NregQBDzt6GyzkCgVjB4XK5DkP
	 I9Z0+AvAv0g3JtOSu3ydnaCIY6C1beITu7hnuSMBApg08r46EuSu/Ye7oFNzdSg/mH
	 KREKGIuYyWMZQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH] tty: hvc-iucv: fix function pointer casts
Date: Tue, 13 Feb 2024 11:17:49 +0100
Message-Id: <20240213101756.461701-1-arnd@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, linux-serial@vger.kernel.org, Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

clang warns about explicitly casting between incompatible function
pointers:

drivers/tty/hvc/hvc_iucv.c:1100:23: error: cast from 'void (*)(const void *)' to 'void (*)(struct device *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
 1100 |         priv->dev->release = (void (*)(struct device *)) kfree;
      |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Add a separate function to handle this correctly.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/tty/hvc/hvc_iucv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/hvc/hvc_iucv.c b/drivers/tty/hvc/hvc_iucv.c
index fdecc0d63731..b1149bc62ca1 100644
--- a/drivers/tty/hvc/hvc_iucv.c
+++ b/drivers/tty/hvc/hvc_iucv.c
@@ -1035,6 +1035,10 @@ static const struct attribute_group *hvc_iucv_dev_attr_groups[] = {
 	NULL,
 };
 
+static void hvc_iucv_free(struct device *data)
+{
+	kfree(data);
+}
 
 /**
  * hvc_iucv_alloc() - Allocates a new struct hvc_iucv_private instance
@@ -1097,7 +1101,7 @@ static int __init hvc_iucv_alloc(int id, unsigned int is_console)
 	priv->dev->bus = &iucv_bus;
 	priv->dev->parent = iucv_root;
 	priv->dev->groups = hvc_iucv_dev_attr_groups;
-	priv->dev->release = (void (*)(struct device *)) kfree;
+	priv->dev->release = hvc_iucv_free;
 	rc = device_register(priv->dev);
 	if (rc) {
 		put_device(priv->dev);
-- 
2.39.2

