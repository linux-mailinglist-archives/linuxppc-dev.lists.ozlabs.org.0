Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B75E626F44
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Nov 2022 12:26:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N99Bh0p59z3cMJ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Nov 2022 22:26:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=b+WhP7YA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=b+WhP7YA;
	dkim-atps=neutral
X-Greylist: delayed 495 seconds by postgrey-1.36 at boromir; Sun, 13 Nov 2022 14:39:05 AEDT
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N8ypx0lXjz2yHc
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Nov 2022 14:39:04 +1100 (AEDT)
From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1668310234;
	bh=2gTkiOcwRu1rvtsieSB6uYYfG6KwpnDzYJ7VI3RNyQA=;
	h=From:To:Cc:Subject:Date:From;
	b=b+WhP7YAnAS8pr7aHdB3Jd89kWdSvdLDW7JXO+7p6QDkJPFCKHIeablhfi6hZJVAk
	 aUPJmiokBqqZEYesqNT2f2QNOEsfiRhZ0byPrg7N8FzHSxPzcBp0KmR5X8OuA1+k0/
	 qh3BCMAbMS2ky54HSMU/PAH9kuVRnT3Xx/bcUyf8=
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] macintosh/mac_hid.c: don't load by default
Date: Sun, 13 Nov 2022 04:30:22 +0100
Message-Id: <20221113033022.2639-1-linux@weissschuh.net>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1668310220; l=1025; i=linux@weissschuh.net; s=20211113; h=from:subject; bh=2gTkiOcwRu1rvtsieSB6uYYfG6KwpnDzYJ7VI3RNyQA=; b=/j6qqxCFitLVms6T0bo554pD1PYuGU4fej2PB1Xt0KyhqBLYFyNUkX4SOqLu/KdIPnSZhFsqjkBg 3h1eojjyBbDRrxOrzFCCOvAKyxqK+6wbQJaNfxQj6LsvS1MZuqjR
X-Developer-Key: i=linux@weissschuh.net; a=ed25519; pk=9LP6KM4vD/8CwHW7nouRBhWLyQLcK1MkP6aTZbzUlj4=
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 13 Nov 2022 22:26:07 +1100
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
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>, linux-input@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There should be no need to automatically load this driver on *all*
machines with a keyboard.

This driver is of very limited utility and has to be enabled by the user
explicitly anyway.
Furthermore its own header comment has deprecated it for 17 years.

Fixes: 99b089c3c38a ("Input: Mac button emulation - implement as an input filter")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/macintosh/mac_hid.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/macintosh/mac_hid.c b/drivers/macintosh/mac_hid.c
index d8c4d5664145..d01d28890db4 100644
--- a/drivers/macintosh/mac_hid.c
+++ b/drivers/macintosh/mac_hid.c
@@ -149,8 +149,6 @@ static const struct input_device_id mac_hid_emumouse_ids[] = {
 	{ },
 };
 
-MODULE_DEVICE_TABLE(input, mac_hid_emumouse_ids);
-
 static struct input_handler mac_hid_emumouse_handler = {
 	.filter		= mac_hid_emumouse_filter,
 	.connect	= mac_hid_emumouse_connect,

base-commit: fef7fd48922d11b22620e19f9c9101647bfe943d
-- 
2.38.1

