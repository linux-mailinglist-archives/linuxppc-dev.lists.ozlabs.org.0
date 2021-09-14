Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA9340AB0B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 11:40:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7yxY6ZQvz305V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 19:40:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux-m68k.org
 (client-ip=195.130.137.77; helo=leibniz.telenet-ops.be;
 envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
X-Greylist: delayed 574 seconds by postgrey-1.36 at boromir;
 Tue, 14 Sep 2021 19:39:37 AEST
Received: from leibniz.telenet-ops.be (leibniz.telenet-ops.be [195.130.137.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7yx54JLgz2xrm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 19:39:36 +1000 (AEST)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4H7yjv19XMzMqgC8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 11:29:55 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d46f:7eb5:4a37:9d14])
 by xavier.telenet-ops.be with bizsmtp
 id tlVr2500F2aSKa101lVr2l; Tue, 14 Sep 2021 11:29:54 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mQ4lC-004R8x-M8; Tue, 14 Sep 2021 11:29:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mQ4lC-000i9G-7c; Tue, 14 Sep 2021 11:29:50 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Subject: [PATCH] nvmem: NVMEM_NINTENDO_OTP should depend on WII
Date: Tue, 14 Sep 2021 11:29:49 +0200
Message-Id: <01318920709dddc4d85fe895e2083ca0eee234d8.1631611652.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The Nintendo Wii and Wii U OTP is only present on Nintendo Wii and Wii U
consoles.  Hence add a dependency on WII, to prevent asking the user
about this driver when configuring a kernel without Nintendo Wii and Wii
U console support.

Fixes: 3683b761fe3a10ad ("nvmem: nintendo-otp: Add new driver for the Wii and Wii U OTP")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/nvmem/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 39854d43758be3fb..da414617a54d4b99 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -109,6 +109,7 @@ config MTK_EFUSE
 
 config NVMEM_NINTENDO_OTP
 	tristate "Nintendo Wii and Wii U OTP Support"
+	depends on WII || COMPILE_TEST
 	help
 	  This is a driver exposing the OTP of a Nintendo Wii or Wii U console.
 
-- 
2.25.1

