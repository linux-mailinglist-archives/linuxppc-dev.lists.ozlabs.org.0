Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 288966393FA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 06:13:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NK0Hb0MKhz3fB6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 16:13:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=G23bT3f7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=G23bT3f7;
	dkim-atps=neutral
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NK0Db0hvQz3cNY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 16:10:31 +1100 (AEDT)
From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1669439426;
	bh=bDIxcxkuTt1CVPb93jhG3KHHhCYP/VYgbfXwdy3Az4s=;
	h=From:To:Cc:Subject:Date:From;
	b=G23bT3f7aypq2wGM8D1gp67YAeyYSHs9EevYehqImsq914voa6TFrJbK/dCcmHoob
	 PxBCILTEYNeMnNd63TcdGp8wH/DZteS271vEf4/lugPSA0T5LZgkpUSSgKChvJVfBK
	 Rp/disrLphhMh/5YwUR5LnU+V7ZmyEeW5N65cT+Q=
To: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russell.h.weight@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] firmware_loader: remove #include <generated/utsrelease.h>
Date: Sat, 26 Nov 2022 06:09:59 +0100
Message-Id: <20221126051002.123199-1-linux@weissschuh.net>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1669439380; l=778; i=linux@weissschuh.net; s=20211113; h=from:subject; bh=bDIxcxkuTt1CVPb93jhG3KHHhCYP/VYgbfXwdy3Az4s=; b=fFTES36NcD7vL27XygxIwaM3a4swpMuD3MsBDdgf6SgoftWjxKuVjdLBJA9xj+Azk1WWb37F6j3Y 2qHNLnknDUVPUzHSMqhXMgtTBjtHHS4RQGpqByVbekki4atV9mTS
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

utsrelease.h is potentially generated on each build.
By removing this unused include we can get rid of some spurious
recompilations.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/base/firmware_loader/firmware.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/base/firmware_loader/firmware.h b/drivers/base/firmware_loader/firmware.h
index fe77e91c38a2..bf549d6500d7 100644
--- a/drivers/base/firmware_loader/firmware.h
+++ b/drivers/base/firmware_loader/firmware.h
@@ -9,8 +9,6 @@
 #include <linux/list.h>
 #include <linux/completion.h>
 
-#include <generated/utsrelease.h>
-
 /**
  * enum fw_opt - options to control firmware loading behaviour
  *

base-commit: 0b1dcc2cf55ae6523c6fbd0d741b3ac28c9f4536
-- 
2.38.1

