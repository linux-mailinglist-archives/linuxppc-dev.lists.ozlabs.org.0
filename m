Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F6F14E36C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 20:54:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487rdd1KMpzDqcR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 06:53:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=OQws0o/r; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487rc117MTzDqYK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 06:52:32 +1100 (AEDT)
Received: from localhost.localdomain (unknown [194.230.155.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C802214AF;
 Thu, 30 Jan 2020 19:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580413950;
 bh=gAyYIH9ob0eRGq2U6rLlcQVg/eGpJkA1jigawwxyAnw=;
 h=From:To:Cc:Subject:Date:From;
 b=OQws0o/rXFPZbDvO/xo2jq/rqAib1fjaoqJU/xtZxSaEDVYjBgula2/MmPDf219dD
 +1JCAHynOCj3amJOd27BmxxhJ3ap5G9fAEay755vJX0QYJ0oSLZG9f90ttuXAI0Dth
 q7XWUaVUVUy7PdtEkxvpZSDE7tQsXAC1jgfoy9CQ=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: configs: Cleanup old Kconfig options
Date: Thu, 30 Jan 2020 20:52:23 +0100
Message-Id: <20200130195223.3843-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CONFIG_ENABLE_WARN_DEPRECATED is gone since
commit 771c035372a0 ("deprecate the '__deprecated' attribute warnings
entirely and for good").

CONFIG_IOSCHED_DEADLINE and CONFIG_IOSCHED_CFQ are gone since
commit f382fb0bcef4 ("block: remove legacy IO schedulers").

The IOSCHED_DEADLINE was replaced by MQ_IOSCHED_DEADLINE and it will be
now enabled by default (along with MQ_IOSCHED_KYBER).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/powerpc/configs/44x/sam440ep_defconfig | 2 --
 arch/powerpc/configs/52xx/pcm030_defconfig  | 2 --
 arch/powerpc/configs/83xx/kmeter1_defconfig | 2 --
 arch/powerpc/configs/adder875_defconfig     | 1 -
 arch/powerpc/configs/ep8248e_defconfig      | 1 -
 arch/powerpc/configs/ep88xc_defconfig       | 1 -
 arch/powerpc/configs/mgcoge_defconfig       | 1 -
 arch/powerpc/configs/mpc512x_defconfig      | 1 -
 arch/powerpc/configs/mpc885_ads_defconfig   | 1 -
 arch/powerpc/configs/storcenter_defconfig   | 1 -
 arch/powerpc/configs/tqm8xx_defconfig       | 1 -
 11 files changed, 14 deletions(-)

diff --git a/arch/powerpc/configs/44x/sam440ep_defconfig b/arch/powerpc/configs/44x/sam440ep_defconfig
index ed02f12dbd54..22dc0dadf576 100644
--- a/arch/powerpc/configs/44x/sam440ep_defconfig
+++ b/arch/powerpc/configs/44x/sam440ep_defconfig
@@ -10,8 +10,6 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_AMIGA_PARTITION=y
-# CONFIG_IOSCHED_DEADLINE is not set
-# CONFIG_IOSCHED_CFQ is not set
 # CONFIG_EBONY is not set
 CONFIG_SAM440EP=y
 CONFIG_CMDLINE_BOOL=y
diff --git a/arch/powerpc/configs/52xx/pcm030_defconfig b/arch/powerpc/configs/52xx/pcm030_defconfig
index fdb11daeb688..789622ffd844 100644
--- a/arch/powerpc/configs/52xx/pcm030_defconfig
+++ b/arch/powerpc/configs/52xx/pcm030_defconfig
@@ -14,8 +14,6 @@ CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
-# CONFIG_IOSCHED_DEADLINE is not set
-# CONFIG_IOSCHED_CFQ is not set
 # CONFIG_PPC_CHRP is not set
 CONFIG_PPC_MPC52xx=y
 CONFIG_PPC_MPC5200_SIMPLE=y
diff --git a/arch/powerpc/configs/83xx/kmeter1_defconfig b/arch/powerpc/configs/83xx/kmeter1_defconfig
index 648c6b3dccf9..24bf1bde1bb4 100644
--- a/arch/powerpc/configs/83xx/kmeter1_defconfig
+++ b/arch/powerpc/configs/83xx/kmeter1_defconfig
@@ -11,8 +11,6 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
 # CONFIG_MSDOS_PARTITION is not set
-# CONFIG_IOSCHED_DEADLINE is not set
-# CONFIG_IOSCHED_CFQ is not set
 # CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_83xx=y
diff --git a/arch/powerpc/configs/adder875_defconfig b/arch/powerpc/configs/adder875_defconfig
index 510f7fd1f6a3..f55e23cb176c 100644
--- a/arch/powerpc/configs/adder875_defconfig
+++ b/arch/powerpc/configs/adder875_defconfig
@@ -9,7 +9,6 @@ CONFIG_EXPERT=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
-# CONFIG_IOSCHED_CFQ is not set
 CONFIG_PPC_ADDER875=y
 CONFIG_8xx_COPYBACK=y
 CONFIG_GEN_RTC=y
diff --git a/arch/powerpc/configs/ep8248e_defconfig b/arch/powerpc/configs/ep8248e_defconfig
index 6e08d9502d89..00d69965f898 100644
--- a/arch/powerpc/configs/ep8248e_defconfig
+++ b/arch/powerpc/configs/ep8248e_defconfig
@@ -6,7 +6,6 @@ CONFIG_EXPERT=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_SLAB=y
 CONFIG_PARTITION_ADVANCED=y
-# CONFIG_IOSCHED_CFQ is not set
 # CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_82xx=y
diff --git a/arch/powerpc/configs/ep88xc_defconfig b/arch/powerpc/configs/ep88xc_defconfig
index 9c1bf60f1e19..0e2e5e81a359 100644
--- a/arch/powerpc/configs/ep88xc_defconfig
+++ b/arch/powerpc/configs/ep88xc_defconfig
@@ -11,7 +11,6 @@ CONFIG_EXPERT=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
-# CONFIG_IOSCHED_CFQ is not set
 CONFIG_PPC_EP88XC=y
 CONFIG_8xx_COPYBACK=y
 CONFIG_GEN_RTC=y
diff --git a/arch/powerpc/configs/mgcoge_defconfig b/arch/powerpc/configs/mgcoge_defconfig
index 6ce4f206eac7..dcc8dccf54f3 100644
--- a/arch/powerpc/configs/mgcoge_defconfig
+++ b/arch/powerpc/configs/mgcoge_defconfig
@@ -12,7 +12,6 @@ CONFIG_KALLSYMS_ALL=y
 CONFIG_EMBEDDED=y
 CONFIG_SLAB=y
 CONFIG_PARTITION_ADVANCED=y
-# CONFIG_IOSCHED_CFQ is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_82xx=y
 CONFIG_MGCOGE=y
diff --git a/arch/powerpc/configs/mpc512x_defconfig b/arch/powerpc/configs/mpc512x_defconfig
index 1f3a045ab081..e39346b3dc3b 100644
--- a/arch/powerpc/configs/mpc512x_defconfig
+++ b/arch/powerpc/configs/mpc512x_defconfig
@@ -9,7 +9,6 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
-# CONFIG_IOSCHED_CFQ is not set
 # CONFIG_PPC_CHRP is not set
 CONFIG_PPC_MPC512x=y
 CONFIG_MPC512x_LPBFIFO=y
diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
index 0327a329316f..82a008c04eae 100644
--- a/arch/powerpc/configs/mpc885_ads_defconfig
+++ b/arch/powerpc/configs/mpc885_ads_defconfig
@@ -11,7 +11,6 @@ CONFIG_EXPERT=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
-# CONFIG_IOSCHED_CFQ is not set
 CONFIG_8xx_COPYBACK=y
 CONFIG_GEN_RTC=y
 CONFIG_HZ_100=y
diff --git a/arch/powerpc/configs/storcenter_defconfig b/arch/powerpc/configs/storcenter_defconfig
index 29b19ec7e5d7..b964084e4056 100644
--- a/arch/powerpc/configs/storcenter_defconfig
+++ b/arch/powerpc/configs/storcenter_defconfig
@@ -77,5 +77,4 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
 CONFIG_CRC_T10DIF=y
-# CONFIG_ENABLE_WARN_DEPRECATED is not set
 # CONFIG_ENABLE_MUST_CHECK is not set
diff --git a/arch/powerpc/configs/tqm8xx_defconfig b/arch/powerpc/configs/tqm8xx_defconfig
index ffed2b4256d6..eda8bfb2d0a3 100644
--- a/arch/powerpc/configs/tqm8xx_defconfig
+++ b/arch/powerpc/configs/tqm8xx_defconfig
@@ -14,7 +14,6 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_SRCVERSION_ALL=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
-# CONFIG_IOSCHED_CFQ is not set
 CONFIG_TQM8XX=y
 CONFIG_8xx_COPYBACK=y
 # CONFIG_8xx_CPU15 is not set
-- 
2.17.1

