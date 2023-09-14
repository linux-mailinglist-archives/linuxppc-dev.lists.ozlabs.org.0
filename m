Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D7C7A014E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 12:11:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmY4j55PPz3dQ9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 20:11:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tinylab.org (client-ip=43.155.65.254; helo=bg4.exmail.qq.com; envelope-from=tanyuan@tinylab.org; receiver=lists.ozlabs.org)
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmY3q0dnVz3cF7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 20:10:30 +1000 (AEST)
X-QQ-mid: bizesmtp84t1694686209tkj9wgm6
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 14 Sep 2023 18:10:07 +0800 (CST)
X-QQ-SSF: 00200000000000907000000A0000000
X-QQ-FEAT: V6lChk3hpNQgV/l60MJ4q/AbwN12cRDby832TxlrswhrodDxeGL7W7N0iku2Q
	pVPGTbY6uWZmMofO2upiVhUWMVr13LhBtzEME105WO66HPD50iAzrnihd9IMgzrpUDxmgl/
	+ArKTdnc8jlKnm1hulb4LOO/sPe/ACwXHec3g3rWRUyvHIg1dJzO74L5Vi26Ist9C1vPuv3
	OsU24+bNPwo0hk7sJGy9Omw+ox60ZESQ9B739hgdH1vH0ASueMqtmbaJROKv8BCE4GAzJ+d
	jcziQ2+ok3nsRL0IjKnCTopTkYi2cgOtpn2sBZt0PdPWpmWaSUINKFo+xxKLjF9OC4Yp0AE
	1UGTq8f833IVb9B+jCW0tWfjk/X2Guz10MVZC9TI1NseWDue48=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16107625445446336019
From: Yuan Tan <tanyuan@tinylab.org>
To: mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu
Subject: [PATCH v3 1/3] powerpc/config: Cleanup pmac32_defconfig
Date: Thu, 14 Sep 2023 18:10:06 +0800
Message-Id: <23b30e8e9e31e7a6af4aa7d317699e1538ad89c2.1694685860.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694685860.git.tanyuan@tinylab.org>
References: <cover.1694685860.git.tanyuan@tinylab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, linux@weissschuh.net, linux-kernel@vger.kernel.org, falcon@tinylab.org, linuxppc-dev@lists.ozlabs.org, w@1wt.eu, tanyuan@tinylab.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use 'make savedefconfig' to cleanup pmac32_defconfig, based on Linux
7.6-rc1

Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
---
 arch/powerpc/configs/pmac32_defconfig | 44 ++++++++++++---------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
index a205da9ee5f2..11d489c2c3e0 100644
--- a/arch/powerpc/configs/pmac32_defconfig
+++ b/arch/powerpc/configs/pmac32_defconfig
@@ -1,4 +1,3 @@
-CONFIG_ALTIVEC=y
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
@@ -8,12 +7,8 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
-# CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_FORCE_UNLOAD=y
-CONFIG_PARTITION_ADVANCED=y
+CONFIG_ALTIVEC=y
 # CONFIG_PPC_CHRP is not set
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_GOV_POWERSAVE=y
@@ -21,12 +16,15 @@ CONFIG_CPU_FREQ_GOV_USERSPACE=y
 CONFIG_CPU_FREQ_PMAC=y
 CONFIG_GEN_RTC=y
 CONFIG_HIGHMEM=y
-CONFIG_BINFMT_MISC=m
 CONFIG_HIBERNATION=y
 CONFIG_PM_DEBUG=y
 CONFIG_APM_EMULATION=y
-CONFIG_PCCARD=m
-CONFIG_YENTA=m
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_BINFMT_MISC=m
+# CONFIG_COMPAT_BRK is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -100,6 +98,8 @@ CONFIG_BT_HCIBFUSB=m
 CONFIG_CFG80211=m
 CONFIG_MAC80211=m
 CONFIG_MAC80211_LEDS=y
+CONFIG_PCCARD=m
+CONFIG_YENTA=m
 # CONFIG_STANDALONE is not set
 CONFIG_CONNECTOR=y
 CONFIG_MAC_FLOPPY=m
@@ -179,7 +179,6 @@ CONFIG_SERIAL_8250=m
 CONFIG_SERIAL_PMACZILOG=y
 CONFIG_SERIAL_PMACZILOG_TTYS=y
 CONFIG_SERIAL_PMACZILOG_CONSOLE=y
-CONFIG_NVRAM=y
 CONFIG_I2C_CHARDEV=m
 CONFIG_APM_POWER=y
 CONFIG_BATTERY_PMU=y
@@ -189,7 +188,6 @@ CONFIG_AGP_UNINORTH=m
 CONFIG_DRM=m
 CONFIG_DRM_RADEON=m
 CONFIG_DRM_LEGACY=y
-CONFIG_DRM_R128=m
 CONFIG_FB=y
 CONFIG_FB_OF=y
 CONFIG_FB_CONTROL=y
@@ -275,23 +273,19 @@ CONFIG_NFSD_V3_ACL=y
 CONFIG_NFSD_V4=y
 CONFIG_NLS_CODEPAGE_437=m
 CONFIG_NLS_ISO8859_1=m
-CONFIG_CRC_T10DIF=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_DETECT_HUNG_TASK=y
-CONFIG_XMON=y
-CONFIG_XMON_DEFAULT=y
-CONFIG_BOOTX_TEXT=y
-CONFIG_CRYPTO_PCBC=m
-CONFIG_CRYPTO_MD4=m
-CONFIG_CRYPTO_SHA512=m
-CONFIG_CRYPTO_WP512=m
-CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
-CONFIG_CRYPTO_KHAZAD=m
 CONFIG_CRYPTO_SERPENT=m
-CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
+CONFIG_CRYPTO_PCBC=m
+CONFIG_CRYPTO_MD4=m
+CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_DEFLATE=m
+CONFIG_CRC_T10DIF=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_DETECT_HUNG_TASK=y
+CONFIG_XMON=y
+CONFIG_XMON_DEFAULT=y
+CONFIG_BOOTX_TEXT=y
-- 
2.34.1

