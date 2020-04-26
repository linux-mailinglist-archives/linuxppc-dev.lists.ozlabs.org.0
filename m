Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C47E21B904F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 15:03:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4997PL5wdPzDqbt
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 23:03:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4996z30zK5zDq9Z
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 22:43:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=RkACzJyd; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4996z20p5Xz9sPF; Sun, 26 Apr 2020 22:43:42 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4996z14MFnz9sRf; Sun, 26 Apr 2020 22:43:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1587905021;
 bh=WQNSdgyUxYa+iM/mHe8uHI9BW4cVp5FLI37CyyizlKg=;
 h=From:To:Cc:Subject:Date:From;
 b=RkACzJyd8GsvZl/IdEMOOnwSGNS3DngiEXMw9STVgGZygEfUeWuxtdPqb+cNbddi/
 aEKbDjbc9ghy+lyoYEpDLMM+0zxewoIsYo86CpibzwiHyxSFqfMnKk8xAEuFjmwmo9
 OquEi07HmreYjA6sMDt5q1EOUgPtTHR4lpUTUezAdwrmuvaz2spswhrslE/laEtIXf
 CCZj151vc1A1qMcx/naFfc4eEbV1yGSDdnotBMay2NxTKB7RBNF/t8weEHHRjZlXN6
 yHhX0X9/2UZoYrjlw2kWTMDtng+Yw/0ZuX6Ipwp6JDHpwxg0/+wA2eqfSYCQvB5csI
 iKifE4fmb6EWQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: daniel.lezcano@linaro.org
Subject: [PATCH] clocksource/drivers/timer-microchip-pit64b: Select
 CONFIG_TIMER_OF
Date: Sun, 26 Apr 2020 22:43:56 +1000
Message-Id: <20200426124356.3929682-1-mpe@ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org, tglx@linutronix.de, linux-kernel@vger.kernel.org,
 claudiu.beznea@microchip.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This driver is an OF driver, it depends on OF, and uses
TIMER_OF_DECLARE, so it should select CONFIG_TIMER_OF.

Without CONFIG_TIMER_OF enabled this can lead to warnings such as:

  powerpc-linux-ld: warning: orphan section `__timer_of_table' from
  `drivers/clocksource/timer-microchip-pit64b.o' being placed in
  section `__timer_of_table'.

Because TIMER_OF_TABLES in vmlinux.lds.h doesn't emit anything into
the linker script when CONFIG_TIMER_OF is not enabled.

Fixes: 625022a5f160 ("clocksource/drivers/timer-microchip-pit64b: Add Microchip PIT64B support")
Cc: stable@vger.kernel.org # v5.6+
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/clocksource/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index f2142e6bbea3..f225c27b70f7 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -709,6 +709,7 @@ config MICROCHIP_PIT64B
 	bool "Microchip PIT64B support"
 	depends on OF || COMPILE_TEST
 	select CLKSRC_MMIO
+	select TIMER_OF
 	help
 	  This option enables Microchip PIT64B timer for Atmel
 	  based system. It supports the oneshot, the periodic
-- 
2.25.1

