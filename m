Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 323C843D6E7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 00:46:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfkM80yHjz3cXv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 09:46:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linkmauve.fr (client-ip=82.65.109.163; helo=luna.linkmauve.fr;
 envelope-from=linkmauve@linkmauve.fr; receiver=<UNKNOWN>)
Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net
 [82.65.109.163])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfkLH13Tlz3bWq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 09:45:43 +1100 (AEDT)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
 id AF7DAF40CA7; Thu, 28 Oct 2021 00:35:25 +0200 (CEST)
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alessandro Zummo <a.zummo@towertech.it>
Subject: [PATCH v2 5/5] powerpc: wii_defconfig: Enable the RTC driver
Date: Thu, 28 Oct 2021 00:35:15 +0200
Message-Id: <20211027223516.2031-6-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027223516.2031-1-linkmauve@linkmauve.fr>
References: <20211014220524.9988-1-linkmauve@linkmauve.fr>
 <20211027223516.2031-1-linkmauve@linkmauve.fr>
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, linux-kernel@vger.kernel.org,
 rw-r-r-0644 <r.r.qwertyuiop.r.r@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Ash Logan <ash@heyquark.com>,
 linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This selects the rtc-gamecube driver, which provides a real-time clock
on this platform.

Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
---
 arch/powerpc/configs/wii_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/configs/wii_defconfig b/arch/powerpc/configs/wii_defconfig
index 752e081d28d0..ad4302a12fd7 100644
--- a/arch/powerpc/configs/wii_defconfig
+++ b/arch/powerpc/configs/wii_defconfig
@@ -98,7 +98,7 @@ CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_LEDS_TRIGGER_PANIC=y
 CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_GENERIC=y
+CONFIG_RTC_DRV_GAMECUBE=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT4_FS=y
 CONFIG_FUSE_FS=m
-- 
2.33.1

