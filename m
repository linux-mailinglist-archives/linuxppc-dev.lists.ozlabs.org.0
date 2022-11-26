Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 382526393F8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 06:11:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NK0Fb1THbz3f6W
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 16:11:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=paSSMypW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=paSSMypW;
	dkim-atps=neutral
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NK0DY2Z2Dz3cNY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 16:10:36 +1100 (AEDT)
From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1669439428;
	bh=EVRYLbXJT4r/tavtjYFvtvsmMIF+T3VXJ7DLMO3Mjvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=paSSMypWqVVc32GQycN1h492cMml4NmI5izRh13kXBEGH0rcARgKWWqbWxS9t/GFi
	 Y3JPOXI3Y2gJSAOicOpaqKoffFmR/u0ztBX4hdNwOJ13/bSxFNcTY45IxjTk5CK10L
	 hFlS2jno+wK3Zvsm4cwRbo9gpl18+MQwYKAIJ6Bc=
To: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russell.h.weight@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] init/version.c: remove #include <generated/utsversion.h>
Date: Sat, 26 Nov 2022 06:10:01 +0100
Message-Id: <20221126051002.123199-3-linux@weissschuh.net>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221126051002.123199-1-linux@weissschuh.net>
References: <20221126051002.123199-1-linux@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1669439380; l=867; i=linux@weissschuh.net; s=20211113; h=from:subject; bh=EVRYLbXJT4r/tavtjYFvtvsmMIF+T3VXJ7DLMO3Mjvk=; b=F1HxhTKHtpXu/BykxEW66XOAnX88KtYknMzBSigNB14Ozcd2B3B2rppXzAUGtYP2vqAnS1LWKQit 0PUndB9uBZRUnE2ncW+8Kkw6N2OVHHp2fLHhO7W+ChZnDKTkwUJI
X-Developer-Key: i=linux@weissschuh.net; a=ed25519; pk=9LP6KM4vD/8CwHW7nouRBhWLyQLcK1MkP6aTZbzUlj4=
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
Cc: Masahiro Yamada <masahiroy@kernel.org>, =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 2df8220cc511 ("kbuild: build init/built-in.a just once") moved
the usage of the define UTS_VERSION to the file version-timestamp.c.

version-timestamp.c in turn is included from version.c but already
includes utsversion.h itself properly.

The unneeded include of utsversion.h from version.c can be dropped.

Fixes: 2df8220cc511 ("kbuild: build init/built-in.a just once")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 init/version.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/init/version.c b/init/version.c
index 01d4ab05f0ba..f117921811b4 100644
--- a/init/version.c
+++ b/init/version.c
@@ -15,7 +15,6 @@
 #include <linux/printk.h>
 #include <linux/uts.h>
 #include <linux/utsname.h>
-#include <generated/utsrelease.h>
 #include <linux/proc_ns.h>
 
 static int __init early_hostname(char *arg)
-- 
2.38.1

