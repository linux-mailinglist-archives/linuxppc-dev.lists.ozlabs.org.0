Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A49434112
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 10:02:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J4Cb20VKzDqPg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 18:02:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=krzk@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="tZsd9Cph"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J49N5fD4zDqKZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 18:00:40 +1000 (AEST)
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF8C024D42;
 Tue,  4 Jun 2019 08:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559635238;
 bh=XsjeKwBLWrW85QKC+DpAmi4r92fSYKmIcRtFdDn+uXE=;
 h=From:To:Cc:Subject:Date:From;
 b=tZsd9CphQItnH2TnXg+2J6noOLzoUmrLDItdkZzVPD9rSl6+1ATcfiEGFeSLZqisG
 ghp7rPZsRAagXLXHckUwcUfC3WoeiFIb2cUrCi1bEyWApLtvEcz8MO+6ofkcqCVMUn
 jzDpZBzrWdEDIwGwwgJ3n8UxRnfMnkYTQsV/UhgM=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/configs: Remove useless UEVENT_HELPER_PATH
Date: Tue,  4 Jun 2019 10:00:33 +0200
Message-Id: <1559635233-21385-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove the CONFIG_UEVENT_HELPER_PATH because:
1. It is disabled since commit 1be01d4a5714 ("driver: base: Disable
   CONFIG_UEVENT_HELPER by default") as its dependency (UEVENT_HELPER) was
   made default to 'n',
2. It is not recommended (help message: "This should not be used today
   [...] creates a high system load") and was kept only for ancient
   userland,
3. Certain userland specifically requests it to be disabled (systemd
   README: "Legacy hotplug slows down the system and confuses udev").

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/powerpc/configs/40x/acadia_defconfig         | 1 -
 arch/powerpc/configs/40x/ep405_defconfig          | 1 -
 arch/powerpc/configs/40x/kilauea_defconfig        | 1 -
 arch/powerpc/configs/40x/klondike_defconfig       | 1 -
 arch/powerpc/configs/40x/makalu_defconfig         | 1 -
 arch/powerpc/configs/40x/obs600_defconfig         | 1 -
 arch/powerpc/configs/40x/virtex_defconfig         | 1 -
 arch/powerpc/configs/40x/walnut_defconfig         | 1 -
 arch/powerpc/configs/44x/akebono_defconfig        | 1 -
 arch/powerpc/configs/44x/arches_defconfig         | 1 -
 arch/powerpc/configs/44x/bamboo_defconfig         | 1 -
 arch/powerpc/configs/44x/bluestone_defconfig      | 1 -
 arch/powerpc/configs/44x/canyonlands_defconfig    | 1 -
 arch/powerpc/configs/44x/currituck_defconfig      | 1 -
 arch/powerpc/configs/44x/ebony_defconfig          | 1 -
 arch/powerpc/configs/44x/eiger_defconfig          | 1 -
 arch/powerpc/configs/44x/fsp2_defconfig           | 1 -
 arch/powerpc/configs/44x/icon_defconfig           | 1 -
 arch/powerpc/configs/44x/iss476-smp_defconfig     | 1 -
 arch/powerpc/configs/44x/katmai_defconfig         | 1 -
 arch/powerpc/configs/44x/rainier_defconfig        | 1 -
 arch/powerpc/configs/44x/redwood_defconfig        | 1 -
 arch/powerpc/configs/44x/sam440ep_defconfig       | 1 -
 arch/powerpc/configs/44x/sequoia_defconfig        | 1 -
 arch/powerpc/configs/44x/taishan_defconfig        | 1 -
 arch/powerpc/configs/44x/virtex5_defconfig        | 1 -
 arch/powerpc/configs/44x/warp_defconfig           | 1 -
 arch/powerpc/configs/52xx/cm5200_defconfig        | 1 -
 arch/powerpc/configs/52xx/lite5200b_defconfig     | 1 -
 arch/powerpc/configs/52xx/motionpro_defconfig     | 1 -
 arch/powerpc/configs/52xx/pcm030_defconfig        | 1 -
 arch/powerpc/configs/52xx/tqm5200_defconfig       | 1 -
 arch/powerpc/configs/83xx/asp8347_defconfig       | 1 -
 arch/powerpc/configs/83xx/mpc8313_rdb_defconfig   | 1 -
 arch/powerpc/configs/83xx/mpc8315_rdb_defconfig   | 1 -
 arch/powerpc/configs/83xx/mpc832x_mds_defconfig   | 1 -
 arch/powerpc/configs/83xx/mpc832x_rdb_defconfig   | 1 -
 arch/powerpc/configs/83xx/mpc834x_itx_defconfig   | 1 -
 arch/powerpc/configs/83xx/mpc834x_itxgp_defconfig | 1 -
 arch/powerpc/configs/83xx/mpc834x_mds_defconfig   | 1 -
 arch/powerpc/configs/83xx/mpc836x_mds_defconfig   | 1 -
 arch/powerpc/configs/83xx/mpc836x_rdk_defconfig   | 1 -
 arch/powerpc/configs/83xx/mpc837x_mds_defconfig   | 1 -
 arch/powerpc/configs/83xx/mpc837x_rdb_defconfig   | 1 -
 arch/powerpc/configs/85xx/ge_imp3a_defconfig      | 1 -
 arch/powerpc/configs/85xx/ksi8560_defconfig       | 1 -
 arch/powerpc/configs/85xx/mpc8540_ads_defconfig   | 1 -
 arch/powerpc/configs/85xx/mpc8560_ads_defconfig   | 1 -
 arch/powerpc/configs/85xx/mpc85xx_cds_defconfig   | 1 -
 arch/powerpc/configs/85xx/sbc8548_defconfig       | 1 -
 arch/powerpc/configs/85xx/stx_gp3_defconfig       | 1 -
 arch/powerpc/configs/85xx/tqm8548_defconfig       | 1 -
 arch/powerpc/configs/85xx/xes_mpc85xx_defconfig   | 1 -
 arch/powerpc/configs/adder875_defconfig           | 1 -
 arch/powerpc/configs/amigaone_defconfig           | 1 -
 arch/powerpc/configs/cell_defconfig               | 1 -
 arch/powerpc/configs/chrp32_defconfig             | 1 -
 arch/powerpc/configs/ep8248e_defconfig            | 1 -
 arch/powerpc/configs/ep88xc_defconfig             | 1 -
 arch/powerpc/configs/fsl-emb-nonhw.config         | 1 -
 arch/powerpc/configs/g5_defconfig                 | 1 -
 arch/powerpc/configs/gamecube_defconfig           | 1 -
 arch/powerpc/configs/holly_defconfig              | 1 -
 arch/powerpc/configs/linkstation_defconfig        | 1 -
 arch/powerpc/configs/maple_defconfig              | 1 -
 arch/powerpc/configs/mgcoge_defconfig             | 1 -
 arch/powerpc/configs/mpc512x_defconfig            | 1 -
 arch/powerpc/configs/mpc5200_defconfig            | 1 -
 arch/powerpc/configs/mpc7448_hpc2_defconfig       | 1 -
 arch/powerpc/configs/mpc8272_ads_defconfig        | 1 -
 arch/powerpc/configs/mpc83xx_defconfig            | 1 -
 arch/powerpc/configs/mpc885_ads_defconfig         | 1 -
 arch/powerpc/configs/mvme5100_defconfig           | 1 -
 arch/powerpc/configs/pasemi_defconfig             | 1 -
 arch/powerpc/configs/pmac32_defconfig             | 1 -
 arch/powerpc/configs/powernv_defconfig            | 1 -
 arch/powerpc/configs/ppc40x_defconfig             | 1 -
 arch/powerpc/configs/ppc44x_defconfig             | 1 -
 arch/powerpc/configs/ppc64_defconfig              | 1 -
 arch/powerpc/configs/ppc64e_defconfig             | 1 -
 arch/powerpc/configs/ppc6xx_defconfig             | 1 -
 arch/powerpc/configs/pq2fads_defconfig            | 1 -
 arch/powerpc/configs/ps3_defconfig                | 1 -
 arch/powerpc/configs/pseries_defconfig            | 1 -
 arch/powerpc/configs/skiroot_defconfig            | 1 -
 arch/powerpc/configs/storcenter_defconfig         | 1 -
 arch/powerpc/configs/tqm8xx_defconfig             | 1 -
 arch/powerpc/configs/wii_defconfig                | 1 -
 88 files changed, 88 deletions(-)

diff --git a/arch/powerpc/configs/40x/acadia_defconfig b/arch/powerpc/configs/40x/acadia_defconfig
index e57344c3b0d7..5a75e4f14273 100644
--- a/arch/powerpc/configs/40x/acadia_defconfig
+++ b/arch/powerpc/configs/40x/acadia_defconfig
@@ -22,7 +22,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/40x/ep405_defconfig b/arch/powerpc/configs/40x/ep405_defconfig
index 0f66f8a87be8..e2691c5db766 100644
--- a/arch/powerpc/configs/40x/ep405_defconfig
+++ b/arch/powerpc/configs/40x/ep405_defconfig
@@ -21,7 +21,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/40x/kilauea_defconfig b/arch/powerpc/configs/40x/kilauea_defconfig
index 3da091f651d6..949989ef2322 100644
--- a/arch/powerpc/configs/40x/kilauea_defconfig
+++ b/arch/powerpc/configs/40x/kilauea_defconfig
@@ -24,7 +24,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/40x/klondike_defconfig b/arch/powerpc/configs/40x/klondike_defconfig
index caab658d1da1..4347a87088dc 100644
--- a/arch/powerpc/configs/40x/klondike_defconfig
+++ b/arch/powerpc/configs/40x/klondike_defconfig
@@ -14,7 +14,6 @@ CONFIG_APM8018X=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_MATH_EMULATION=y
 # CONFIG_SUSPEND is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=35000
 CONFIG_SCSI=y
diff --git a/arch/powerpc/configs/40x/makalu_defconfig b/arch/powerpc/configs/40x/makalu_defconfig
index e0b1489b7c7b..90b759bbf426 100644
--- a/arch/powerpc/configs/40x/makalu_defconfig
+++ b/arch/powerpc/configs/40x/makalu_defconfig
@@ -21,7 +21,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/40x/obs600_defconfig b/arch/powerpc/configs/40x/obs600_defconfig
index 38d3d7769a2f..881c300c011d 100644
--- a/arch/powerpc/configs/40x/obs600_defconfig
+++ b/arch/powerpc/configs/40x/obs600_defconfig
@@ -24,7 +24,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/40x/virtex_defconfig b/arch/powerpc/configs/40x/virtex_defconfig
index a2b2770eee8f..5e7c61d1d7d0 100644
--- a/arch/powerpc/configs/40x/virtex_defconfig
+++ b/arch/powerpc/configs/40x/virtex_defconfig
@@ -31,7 +31,6 @@ CONFIG_NETFILTER=y
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=8192
diff --git a/arch/powerpc/configs/40x/walnut_defconfig b/arch/powerpc/configs/40x/walnut_defconfig
index 6faa03cd661c..0ed46704b9fa 100644
--- a/arch/powerpc/configs/40x/walnut_defconfig
+++ b/arch/powerpc/configs/40x/walnut_defconfig
@@ -19,7 +19,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/44x/akebono_defconfig b/arch/powerpc/configs/44x/akebono_defconfig
index 9fcd361607e2..2fa553ebfdc9 100644
--- a/arch/powerpc/configs/44x/akebono_defconfig
+++ b/arch/powerpc/configs/44x/akebono_defconfig
@@ -33,7 +33,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_CONNECTOR=y
diff --git a/arch/powerpc/configs/44x/arches_defconfig b/arch/powerpc/configs/44x/arches_defconfig
index 6bba1a55b827..5a1b9ee18075 100644
--- a/arch/powerpc/configs/44x/arches_defconfig
+++ b/arch/powerpc/configs/44x/arches_defconfig
@@ -24,7 +24,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/44x/bamboo_defconfig b/arch/powerpc/configs/44x/bamboo_defconfig
index 6f3a6ecc81e7..22e1ef5272ab 100644
--- a/arch/powerpc/configs/44x/bamboo_defconfig
+++ b/arch/powerpc/configs/44x/bamboo_defconfig
@@ -22,7 +22,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=35000
diff --git a/arch/powerpc/configs/44x/bluestone_defconfig b/arch/powerpc/configs/44x/bluestone_defconfig
index 6b77aea79b6c..8006a5728afd 100644
--- a/arch/powerpc/configs/44x/bluestone_defconfig
+++ b/arch/powerpc/configs/44x/bluestone_defconfig
@@ -20,7 +20,6 @@ CONFIG_INET=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/44x/canyonlands_defconfig b/arch/powerpc/configs/44x/canyonlands_defconfig
index d427cee027a6..86f34ea4173a 100644
--- a/arch/powerpc/configs/44x/canyonlands_defconfig
+++ b/arch/powerpc/configs/44x/canyonlands_defconfig
@@ -24,7 +24,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/44x/currituck_defconfig b/arch/powerpc/configs/44x/currituck_defconfig
index 5f1df5fe4453..ce3ec5a2cd15 100644
--- a/arch/powerpc/configs/44x/currituck_defconfig
+++ b/arch/powerpc/configs/44x/currituck_defconfig
@@ -31,7 +31,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_CONNECTOR=y
diff --git a/arch/powerpc/configs/44x/ebony_defconfig b/arch/powerpc/configs/44x/ebony_defconfig
index e2b6578993d5..f67447c92e6f 100644
--- a/arch/powerpc/configs/44x/ebony_defconfig
+++ b/arch/powerpc/configs/44x/ebony_defconfig
@@ -20,7 +20,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
diff --git a/arch/powerpc/configs/44x/eiger_defconfig b/arch/powerpc/configs/44x/eiger_defconfig
index f593258806ad..5dbd83a1c11b 100644
--- a/arch/powerpc/configs/44x/eiger_defconfig
+++ b/arch/powerpc/configs/44x/eiger_defconfig
@@ -25,7 +25,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/44x/fsp2_defconfig b/arch/powerpc/configs/44x/fsp2_defconfig
index bae6b26bcfba..e49114f0e526 100644
--- a/arch/powerpc/configs/44x/fsp2_defconfig
+++ b/arch/powerpc/configs/44x/fsp2_defconfig
@@ -44,7 +44,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
 CONFIG_VLAN_8021Q=m
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_CONNECTOR=y
diff --git a/arch/powerpc/configs/44x/icon_defconfig b/arch/powerpc/configs/44x/icon_defconfig
index 4453a4590b1a..fa5378af44f9 100644
--- a/arch/powerpc/configs/44x/icon_defconfig
+++ b/arch/powerpc/configs/44x/icon_defconfig
@@ -24,7 +24,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/44x/iss476-smp_defconfig b/arch/powerpc/configs/44x/iss476-smp_defconfig
index d24bfa6ecd62..aae879c21239 100644
--- a/arch/powerpc/configs/44x/iss476-smp_defconfig
+++ b/arch/powerpc/configs/44x/iss476-smp_defconfig
@@ -33,7 +33,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
diff --git a/arch/powerpc/configs/44x/katmai_defconfig b/arch/powerpc/configs/44x/katmai_defconfig
index 5d3f685a7af8..56eddca998c6 100644
--- a/arch/powerpc/configs/44x/katmai_defconfig
+++ b/arch/powerpc/configs/44x/katmai_defconfig
@@ -22,7 +22,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/44x/rainier_defconfig b/arch/powerpc/configs/44x/rainier_defconfig
index 7b8355a5698d..369bfd2e451d 100644
--- a/arch/powerpc/configs/44x/rainier_defconfig
+++ b/arch/powerpc/configs/44x/rainier_defconfig
@@ -23,7 +23,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/44x/redwood_defconfig b/arch/powerpc/configs/44x/redwood_defconfig
index 918cfb63f0c8..8be95f6fe3a7 100644
--- a/arch/powerpc/configs/44x/redwood_defconfig
+++ b/arch/powerpc/configs/44x/redwood_defconfig
@@ -25,7 +25,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/44x/sam440ep_defconfig b/arch/powerpc/configs/44x/sam440ep_defconfig
index 63302fbd184d..974a4f038cda 100644
--- a/arch/powerpc/configs/44x/sam440ep_defconfig
+++ b/arch/powerpc/configs/44x/sam440ep_defconfig
@@ -27,7 +27,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
diff --git a/arch/powerpc/configs/44x/sequoia_defconfig b/arch/powerpc/configs/44x/sequoia_defconfig
index f34fee9464e5..10e517b69fa4 100644
--- a/arch/powerpc/configs/44x/sequoia_defconfig
+++ b/arch/powerpc/configs/44x/sequoia_defconfig
@@ -24,7 +24,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/44x/taishan_defconfig b/arch/powerpc/configs/44x/taishan_defconfig
index 42cc7b4ed95f..cd08f3ddd609 100644
--- a/arch/powerpc/configs/44x/taishan_defconfig
+++ b/arch/powerpc/configs/44x/taishan_defconfig
@@ -22,7 +22,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/44x/virtex5_defconfig b/arch/powerpc/configs/44x/virtex5_defconfig
index 99cc3dc02df1..1f74079e1703 100644
--- a/arch/powerpc/configs/44x/virtex5_defconfig
+++ b/arch/powerpc/configs/44x/virtex5_defconfig
@@ -30,7 +30,6 @@ CONFIG_NETFILTER=y
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=8192
diff --git a/arch/powerpc/configs/44x/warp_defconfig b/arch/powerpc/configs/44x/warp_defconfig
index 6ae88d4879bf..af66c69c49fe 100644
--- a/arch/powerpc/configs/44x/warp_defconfig
+++ b/arch/powerpc/configs/44x/warp_defconfig
@@ -26,7 +26,6 @@ CONFIG_IP_PNP_DHCP=y
 # CONFIG_IPV6 is not set
 CONFIG_NETFILTER=y
 CONFIG_VLAN_8021Q=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_STANDALONE is not set
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/52xx/cm5200_defconfig b/arch/powerpc/configs/52xx/cm5200_defconfig
index 73948e88ac82..2412a6bf7ee6 100644
--- a/arch/powerpc/configs/52xx/cm5200_defconfig
+++ b/arch/powerpc/configs/52xx/cm5200_defconfig
@@ -23,7 +23,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/52xx/lite5200b_defconfig b/arch/powerpc/configs/52xx/lite5200b_defconfig
index 6fc7f786c83c..63368e677506 100644
--- a/arch/powerpc/configs/52xx/lite5200b_defconfig
+++ b/arch/powerpc/configs/52xx/lite5200b_defconfig
@@ -26,7 +26,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
diff --git a/arch/powerpc/configs/52xx/motionpro_defconfig b/arch/powerpc/configs/52xx/motionpro_defconfig
index ae2a1f74103b..72762da94846 100644
--- a/arch/powerpc/configs/52xx/motionpro_defconfig
+++ b/arch/powerpc/configs/52xx/motionpro_defconfig
@@ -23,7 +23,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/52xx/pcm030_defconfig b/arch/powerpc/configs/52xx/pcm030_defconfig
index 1554de6968ca..303600ff1fdb 100644
--- a/arch/powerpc/configs/52xx/pcm030_defconfig
+++ b/arch/powerpc/configs/52xx/pcm030_defconfig
@@ -36,7 +36,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/52xx/tqm5200_defconfig b/arch/powerpc/configs/52xx/tqm5200_defconfig
index 0777e6efd22d..a3c8ca74032c 100644
--- a/arch/powerpc/configs/52xx/tqm5200_defconfig
+++ b/arch/powerpc/configs/52xx/tqm5200_defconfig
@@ -27,7 +27,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/83xx/asp8347_defconfig b/arch/powerpc/configs/83xx/asp8347_defconfig
index dd884df32dfd..10192410b33c 100644
--- a/arch/powerpc/configs/83xx/asp8347_defconfig
+++ b/arch/powerpc/configs/83xx/asp8347_defconfig
@@ -27,7 +27,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_REDBOOT_PARTS=y
diff --git a/arch/powerpc/configs/83xx/mpc8313_rdb_defconfig b/arch/powerpc/configs/83xx/mpc8313_rdb_defconfig
index 9dffb2e7f735..16a42e2267fb 100644
--- a/arch/powerpc/configs/83xx/mpc8313_rdb_defconfig
+++ b/arch/powerpc/configs/83xx/mpc8313_rdb_defconfig
@@ -24,7 +24,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
diff --git a/arch/powerpc/configs/83xx/mpc8315_rdb_defconfig b/arch/powerpc/configs/83xx/mpc8315_rdb_defconfig
index a42232732c6d..80d40ae668eb 100644
--- a/arch/powerpc/configs/83xx/mpc8315_rdb_defconfig
+++ b/arch/powerpc/configs/83xx/mpc8315_rdb_defconfig
@@ -24,7 +24,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
diff --git a/arch/powerpc/configs/83xx/mpc832x_mds_defconfig b/arch/powerpc/configs/83xx/mpc832x_mds_defconfig
index 4f914906ee4b..e94555452fb2 100644
--- a/arch/powerpc/configs/83xx/mpc832x_mds_defconfig
+++ b/arch/powerpc/configs/83xx/mpc832x_mds_defconfig
@@ -26,7 +26,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
diff --git a/arch/powerpc/configs/83xx/mpc832x_rdb_defconfig b/arch/powerpc/configs/83xx/mpc832x_rdb_defconfig
index a484eb8401e8..1715ff547442 100644
--- a/arch/powerpc/configs/83xx/mpc832x_rdb_defconfig
+++ b/arch/powerpc/configs/83xx/mpc832x_rdb_defconfig
@@ -27,7 +27,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
diff --git a/arch/powerpc/configs/83xx/mpc834x_itx_defconfig b/arch/powerpc/configs/83xx/mpc834x_itx_defconfig
index 37f4d93b3f81..e65c0057147f 100644
--- a/arch/powerpc/configs/83xx/mpc834x_itx_defconfig
+++ b/arch/powerpc/configs/83xx/mpc834x_itx_defconfig
@@ -25,7 +25,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_CFI=y
diff --git a/arch/powerpc/configs/83xx/mpc834x_itxgp_defconfig b/arch/powerpc/configs/83xx/mpc834x_itxgp_defconfig
index 7adb6708a761..17714bf0ed40 100644
--- a/arch/powerpc/configs/83xx/mpc834x_itxgp_defconfig
+++ b/arch/powerpc/configs/83xx/mpc834x_itxgp_defconfig
@@ -25,7 +25,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_CFI=y
diff --git a/arch/powerpc/configs/83xx/mpc834x_mds_defconfig b/arch/powerpc/configs/83xx/mpc834x_mds_defconfig
index d7ce3551529d..e2ff684d8792 100644
--- a/arch/powerpc/configs/83xx/mpc834x_mds_defconfig
+++ b/arch/powerpc/configs/83xx/mpc834x_mds_defconfig
@@ -26,7 +26,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
diff --git a/arch/powerpc/configs/83xx/mpc836x_mds_defconfig b/arch/powerpc/configs/83xx/mpc836x_mds_defconfig
index 92134cee3f37..3eceb6db2982 100644
--- a/arch/powerpc/configs/83xx/mpc836x_mds_defconfig
+++ b/arch/powerpc/configs/83xx/mpc836x_mds_defconfig
@@ -25,7 +25,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/83xx/mpc836x_rdk_defconfig b/arch/powerpc/configs/83xx/mpc836x_rdk_defconfig
index 97f7ea5f205f..093df33f9455 100644
--- a/arch/powerpc/configs/83xx/mpc836x_rdk_defconfig
+++ b/arch/powerpc/configs/83xx/mpc836x_rdk_defconfig
@@ -24,7 +24,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
diff --git a/arch/powerpc/configs/83xx/mpc837x_mds_defconfig b/arch/powerpc/configs/83xx/mpc837x_mds_defconfig
index ee7510a33d06..3f5e5d10789f 100644
--- a/arch/powerpc/configs/83xx/mpc837x_mds_defconfig
+++ b/arch/powerpc/configs/83xx/mpc837x_mds_defconfig
@@ -24,7 +24,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
diff --git a/arch/powerpc/configs/83xx/mpc837x_rdb_defconfig b/arch/powerpc/configs/83xx/mpc837x_rdb_defconfig
index 8966a9af4230..dad53ef86b49 100644
--- a/arch/powerpc/configs/83xx/mpc837x_rdb_defconfig
+++ b/arch/powerpc/configs/83xx/mpc837x_rdb_defconfig
@@ -26,7 +26,6 @@ CONFIG_SYN_COOKIES=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
diff --git a/arch/powerpc/configs/85xx/ge_imp3a_defconfig b/arch/powerpc/configs/85xx/ge_imp3a_defconfig
index d70b60314dad..920f37316fdb 100644
--- a/arch/powerpc/configs/85xx/ge_imp3a_defconfig
+++ b/arch/powerpc/configs/85xx/ge_imp3a_defconfig
@@ -65,7 +65,6 @@ CONFIG_INET6_AH=m
 CONFIG_INET6_IPCOMP=m
 CONFIG_IPV6_TUNNEL=m
 CONFIG_NET_PKTGEN=m
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
diff --git a/arch/powerpc/configs/85xx/ksi8560_defconfig b/arch/powerpc/configs/85xx/ksi8560_defconfig
index 9ce6f48cfb61..9cb211fb6d1e 100644
--- a/arch/powerpc/configs/85xx/ksi8560_defconfig
+++ b/arch/powerpc/configs/85xx/ksi8560_defconfig
@@ -23,7 +23,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
diff --git a/arch/powerpc/configs/85xx/mpc8540_ads_defconfig b/arch/powerpc/configs/85xx/mpc8540_ads_defconfig
index 5fbc3f904046..618e03e0706d 100644
--- a/arch/powerpc/configs/85xx/mpc8540_ads_defconfig
+++ b/arch/powerpc/configs/85xx/mpc8540_ads_defconfig
@@ -24,7 +24,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
diff --git a/arch/powerpc/configs/85xx/mpc8560_ads_defconfig b/arch/powerpc/configs/85xx/mpc8560_ads_defconfig
index ff981d7905c7..9bc6283f2fb2 100644
--- a/arch/powerpc/configs/85xx/mpc8560_ads_defconfig
+++ b/arch/powerpc/configs/85xx/mpc8560_ads_defconfig
@@ -23,7 +23,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
diff --git a/arch/powerpc/configs/85xx/mpc85xx_cds_defconfig b/arch/powerpc/configs/85xx/mpc85xx_cds_defconfig
index 974f0706d777..0683d8c292a8 100644
--- a/arch/powerpc/configs/85xx/mpc85xx_cds_defconfig
+++ b/arch/powerpc/configs/85xx/mpc85xx_cds_defconfig
@@ -25,7 +25,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
diff --git a/arch/powerpc/configs/85xx/sbc8548_defconfig b/arch/powerpc/configs/85xx/sbc8548_defconfig
index 7e3e84a842e4..258881727119 100644
--- a/arch/powerpc/configs/85xx/sbc8548_defconfig
+++ b/arch/powerpc/configs/85xx/sbc8548_defconfig
@@ -22,7 +22,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
diff --git a/arch/powerpc/configs/85xx/stx_gp3_defconfig b/arch/powerpc/configs/85xx/stx_gp3_defconfig
index 5b9cc01b9098..ecbcc853307d 100644
--- a/arch/powerpc/configs/85xx/stx_gp3_defconfig
+++ b/arch/powerpc/configs/85xx/stx_gp3_defconfig
@@ -22,7 +22,6 @@ CONFIG_NETFILTER=y
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_NET_PKTGEN=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_PARPORT=m
 CONFIG_PARPORT_PC=m
diff --git a/arch/powerpc/configs/85xx/tqm8548_defconfig b/arch/powerpc/configs/85xx/tqm8548_defconfig
index 1c63cbdc3211..afa1b9b633f8 100644
--- a/arch/powerpc/configs/85xx/tqm8548_defconfig
+++ b/arch/powerpc/configs/85xx/tqm8548_defconfig
@@ -29,7 +29,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_CFI=y
diff --git a/arch/powerpc/configs/85xx/xes_mpc85xx_defconfig b/arch/powerpc/configs/85xx/xes_mpc85xx_defconfig
index 78f5beb2928c..d50aca608736 100644
--- a/arch/powerpc/configs/85xx/xes_mpc85xx_defconfig
+++ b/arch/powerpc/configs/85xx/xes_mpc85xx_defconfig
@@ -54,7 +54,6 @@ CONFIG_IP_PIMSM_V2=y
 # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_MTD=y
 CONFIG_MTD_REDBOOT_PARTS=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/adder875_defconfig b/arch/powerpc/configs/adder875_defconfig
index 935ea3ade7de..f7a803ab2285 100644
--- a/arch/powerpc/configs/adder875_defconfig
+++ b/arch/powerpc/configs/adder875_defconfig
@@ -26,7 +26,6 @@ CONFIG_SYN_COOKIES=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
diff --git a/arch/powerpc/configs/amigaone_defconfig b/arch/powerpc/configs/amigaone_defconfig
index 12f397d403c6..cf94d28d0e31 100644
--- a/arch/powerpc/configs/amigaone_defconfig
+++ b/arch/powerpc/configs/amigaone_defconfig
@@ -37,7 +37,6 @@ CONFIG_NETFILTER=y
 # CONFIG_NETFILTER_XT_MATCH_CONNTRACK is not set
 # CONFIG_NETFILTER_XT_MATCH_STATE is not set
 # CONFIG_IP_NF_MANGLE is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_STANDALONE is not set
 CONFIG_PARPORT=y
 CONFIG_PARPORT_PC=y
diff --git a/arch/powerpc/configs/cell_defconfig b/arch/powerpc/configs/cell_defconfig
index 560a93a84efe..2dd1b58a18ae 100644
--- a/arch/powerpc/configs/cell_defconfig
+++ b/arch/powerpc/configs/cell_defconfig
@@ -102,7 +102,6 @@ CONFIG_IP_NF_RAW=m
 CONFIG_IP_NF_ARPTABLES=m
 CONFIG_IP_NF_ARPFILTER=m
 CONFIG_IP_NF_ARP_MANGLE=m
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=131072
diff --git a/arch/powerpc/configs/chrp32_defconfig b/arch/powerpc/configs/chrp32_defconfig
index a203b1cf67d3..9ff493dd8439 100644
--- a/arch/powerpc/configs/chrp32_defconfig
+++ b/arch/powerpc/configs/chrp32_defconfig
@@ -38,7 +38,6 @@ CONFIG_NETFILTER=y
 # CONFIG_NETFILTER_XT_MATCH_CONNTRACK is not set
 # CONFIG_NETFILTER_XT_MATCH_STATE is not set
 # CONFIG_IP_NF_MANGLE is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_STANDALONE is not set
 CONFIG_BLK_DEV_FD=y
 CONFIG_BLK_DEV_LOOP=y
diff --git a/arch/powerpc/configs/ep8248e_defconfig b/arch/powerpc/configs/ep8248e_defconfig
index 2e6c8a45ae88..6e08d9502d89 100644
--- a/arch/powerpc/configs/ep8248e_defconfig
+++ b/arch/powerpc/configs/ep8248e_defconfig
@@ -24,7 +24,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 CONFIG_NETFILTER=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
diff --git a/arch/powerpc/configs/ep88xc_defconfig b/arch/powerpc/configs/ep88xc_defconfig
index 7cb590e8f8fd..b20bd0cf3543 100644
--- a/arch/powerpc/configs/ep88xc_defconfig
+++ b/arch/powerpc/configs/ep88xc_defconfig
@@ -28,7 +28,6 @@ CONFIG_SYN_COOKIES=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
diff --git a/arch/powerpc/configs/fsl-emb-nonhw.config b/arch/powerpc/configs/fsl-emb-nonhw.config
index d592ba27b122..3c7dad19a691 100644
--- a/arch/powerpc/configs/fsl-emb-nonhw.config
+++ b/arch/powerpc/configs/fsl-emb-nonhw.config
@@ -118,7 +118,6 @@ CONFIG_SYSVIPC=y
 CONFIG_TMPFS=y
 CONFIG_UBIFS_FS=y
 CONFIG_UDF_FS=m
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_UFS_FS=m
 CONFIG_UIO=y
 CONFIG_UNIX=y
diff --git a/arch/powerpc/configs/g5_defconfig b/arch/powerpc/configs/g5_defconfig
index ceb3c770786f..3f4c141b82b1 100644
--- a/arch/powerpc/configs/g5_defconfig
+++ b/arch/powerpc/configs/g5_defconfig
@@ -52,7 +52,6 @@ CONFIG_NF_CONNTRACK_IRC=m
 CONFIG_NF_CONNTRACK_TFTP=m
 CONFIG_NF_CT_NETLINK=m
 CONFIG_NF_CONNTRACK_IPV4=m
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_BLK_DEV_LOOP=y
diff --git a/arch/powerpc/configs/gamecube_defconfig b/arch/powerpc/configs/gamecube_defconfig
index 805b0f87653c..a39e32ea3035 100644
--- a/arch/powerpc/configs/gamecube_defconfig
+++ b/arch/powerpc/configs/gamecube_defconfig
@@ -35,7 +35,6 @@ CONFIG_IP_PNP_RARP=y
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_STANDALONE is not set
 # CONFIG_FW_LOADER is not set
 CONFIG_BLK_DEV_LOOP=y
diff --git a/arch/powerpc/configs/holly_defconfig b/arch/powerpc/configs/holly_defconfig
index 71d8d2430b6c..067f433c8f5e 100644
--- a/arch/powerpc/configs/holly_defconfig
+++ b/arch/powerpc/configs/holly_defconfig
@@ -27,7 +27,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
diff --git a/arch/powerpc/configs/linkstation_defconfig b/arch/powerpc/configs/linkstation_defconfig
index 477794c41d50..ea59f3d146df 100644
--- a/arch/powerpc/configs/linkstation_defconfig
+++ b/arch/powerpc/configs/linkstation_defconfig
@@ -48,7 +48,6 @@ CONFIG_IP_NF_RAW=m
 CONFIG_IP_NF_ARPTABLES=m
 CONFIG_IP_NF_ARPFILTER=m
 CONFIG_IP_NF_ARP_MANGLE=m
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
diff --git a/arch/powerpc/configs/maple_defconfig b/arch/powerpc/configs/maple_defconfig
index c5f2005005d3..7fab0a540452 100644
--- a/arch/powerpc/configs/maple_defconfig
+++ b/arch/powerpc/configs/maple_defconfig
@@ -36,7 +36,6 @@ CONFIG_IP_MULTICAST=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=8192
 # CONFIG_SCSI_PROC_FS is not set
diff --git a/arch/powerpc/configs/mgcoge_defconfig b/arch/powerpc/configs/mgcoge_defconfig
index 5d5f08e5b8d9..6ce4f206eac7 100644
--- a/arch/powerpc/configs/mgcoge_defconfig
+++ b/arch/powerpc/configs/mgcoge_defconfig
@@ -30,7 +30,6 @@ CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
 CONFIG_NETFILTER=y
 CONFIG_TIPC=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/mpc512x_defconfig b/arch/powerpc/configs/mpc512x_defconfig
index e4bf8aa87e60..6203c1093a3a 100644
--- a/arch/powerpc/configs/mpc512x_defconfig
+++ b/arch/powerpc/configs/mpc512x_defconfig
@@ -35,7 +35,6 @@ CONFIG_CAN_VCAN=y
 CONFIG_CAN_MSCAN=y
 CONFIG_CAN_DEBUG_DEVICES=y
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
diff --git a/arch/powerpc/configs/mpc5200_defconfig b/arch/powerpc/configs/mpc5200_defconfig
index 7a2b2aa37def..6f87a5c74960 100644
--- a/arch/powerpc/configs/mpc5200_defconfig
+++ b/arch/powerpc/configs/mpc5200_defconfig
@@ -27,7 +27,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
diff --git a/arch/powerpc/configs/mpc7448_hpc2_defconfig b/arch/powerpc/configs/mpc7448_hpc2_defconfig
index 4b14c02b437c..19406a6c2648 100644
--- a/arch/powerpc/configs/mpc7448_hpc2_defconfig
+++ b/arch/powerpc/configs/mpc7448_hpc2_defconfig
@@ -25,7 +25,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
diff --git a/arch/powerpc/configs/mpc8272_ads_defconfig b/arch/powerpc/configs/mpc8272_ads_defconfig
index b1e88b64536b..00a4d2bf43b2 100644
--- a/arch/powerpc/configs/mpc8272_ads_defconfig
+++ b/arch/powerpc/configs/mpc8272_ads_defconfig
@@ -23,7 +23,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 CONFIG_NETFILTER=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
diff --git a/arch/powerpc/configs/mpc83xx_defconfig b/arch/powerpc/configs/mpc83xx_defconfig
index 005d00020fb9..be125729635c 100644
--- a/arch/powerpc/configs/mpc83xx_defconfig
+++ b/arch/powerpc/configs/mpc83xx_defconfig
@@ -37,7 +37,6 @@ CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 CONFIG_INET_ESP=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FW_LOADER is not set
diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
index ec3fcc2bf737..285d506c5a76 100644
--- a/arch/powerpc/configs/mpc885_ads_defconfig
+++ b/arch/powerpc/configs/mpc885_ads_defconfig
@@ -27,7 +27,6 @@ CONFIG_SYN_COOKIES=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
diff --git a/arch/powerpc/configs/mvme5100_defconfig b/arch/powerpc/configs/mvme5100_defconfig
index 63e38c7220f1..0a0d046fc445 100644
--- a/arch/powerpc/configs/mvme5100_defconfig
+++ b/arch/powerpc/configs/mvme5100_defconfig
@@ -58,7 +58,6 @@ CONFIG_IP_NF_ARPTABLES=m
 CONFIG_IP_NF_ARPFILTER=m
 CONFIG_IP_NF_ARP_MANGLE=m
 CONFIG_LAPB=m
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_COUNT=2
diff --git a/arch/powerpc/configs/pasemi_defconfig b/arch/powerpc/configs/pasemi_defconfig
index c0423b2cf7c0..4b6d31d4474e 100644
--- a/arch/powerpc/configs/pasemi_defconfig
+++ b/arch/powerpc/configs/pasemi_defconfig
@@ -44,7 +44,6 @@ CONFIG_SYN_COOKIES=y
 CONFIG_INET_AH=y
 CONFIG_INET_ESP=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_MTD=y
diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
index 50b610b48914..ff7955dde23e 100644
--- a/arch/powerpc/configs/pmac32_defconfig
+++ b/arch/powerpc/configs/pmac32_defconfig
@@ -112,7 +112,6 @@ CONFIG_BT_HCIBFUSB=m
 CONFIG_CFG80211=m
 CONFIG_MAC80211=m
 CONFIG_MAC80211_LEDS=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_STANDALONE is not set
 CONFIG_CONNECTOR=y
 CONFIG_MAC_FLOPPY=m
diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
index ef2ef98d3f28..4b657d7f4552 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -98,7 +98,6 @@ CONFIG_NET_ACT_BPF=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BPF_JIT=y
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_MTD=y
diff --git a/arch/powerpc/configs/ppc40x_defconfig b/arch/powerpc/configs/ppc40x_defconfig
index 689d7e276769..8f136b52198b 100644
--- a/arch/powerpc/configs/ppc40x_defconfig
+++ b/arch/powerpc/configs/ppc40x_defconfig
@@ -25,7 +25,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/ppc44x_defconfig b/arch/powerpc/configs/ppc44x_defconfig
index db48039e0b11..67952819593e 100644
--- a/arch/powerpc/configs/ppc44x_defconfig
+++ b/arch/powerpc/configs/ppc44x_defconfig
@@ -36,7 +36,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 CONFIG_BRIDGE=m
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 91fdb619b484..6b54c6b33c24 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -98,7 +98,6 @@ CONFIG_NET_CLS_BPF=m
 CONFIG_NET_CLS_ACT=y
 CONFIG_NET_ACT_BPF=m
 CONFIG_BPF_JIT=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_BLK_DEV_FD=y
diff --git a/arch/powerpc/configs/ppc64e_defconfig b/arch/powerpc/configs/ppc64e_defconfig
index 41d85cb3c9a2..a57bdc5291d7 100644
--- a/arch/powerpc/configs/ppc64e_defconfig
+++ b/arch/powerpc/configs/ppc64e_defconfig
@@ -50,7 +50,6 @@ CONFIG_INET_IPCOMP=m
 CONFIG_NETFILTER=y
 # CONFIG_NETFILTER_ADVANCED is not set
 CONFIG_BRIDGE=m
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_BLK_DEV_FD=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 7c6baf6df139..bbc2521ef2ea 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -346,7 +346,6 @@ CONFIG_MAC80211_LEDS=y
 CONFIG_MAC80211_DEBUGFS=y
 CONFIG_NET_9P=m
 CONFIG_NET_9P_VIRTIO=m
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEBUG_DEVRES=y
 CONFIG_CONNECTOR=y
 CONFIG_PARPORT=m
diff --git a/arch/powerpc/configs/pq2fads_defconfig b/arch/powerpc/configs/pq2fads_defconfig
index 0ededa8c837d..9d8a76857c6f 100644
--- a/arch/powerpc/configs/pq2fads_defconfig
+++ b/arch/powerpc/configs/pq2fads_defconfig
@@ -24,7 +24,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 CONFIG_NETFILTER=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
diff --git a/arch/powerpc/configs/ps3_defconfig b/arch/powerpc/configs/ps3_defconfig
index cf8d55f67272..314c63939816 100644
--- a/arch/powerpc/configs/ps3_defconfig
+++ b/arch/powerpc/configs/ps3_defconfig
@@ -63,7 +63,6 @@ CONFIG_CFG80211=m
 CONFIG_CFG80211_WEXT=y
 CONFIG_MAC80211=m
 # CONFIG_MAC80211_RC_MINSTREL is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=65535
diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/configs/pseries_defconfig
index 62e12f61a3b2..596a44b3d721 100644
--- a/arch/powerpc/configs/pseries_defconfig
+++ b/arch/powerpc/configs/pseries_defconfig
@@ -83,7 +83,6 @@ CONFIG_NET_CLS_BPF=m
 CONFIG_NET_CLS_ACT=y
 CONFIG_NET_ACT_BPF=m
 CONFIG_BPF_JIT=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_PARPORT=m
diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index a887616e35a2..557b530b2f70 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -68,7 +68,6 @@ CONFIG_SYN_COOKIES=y
 # CONFIG_INET_XFRM_MODE_BEET is not set
 CONFIG_DNS_RESOLVER=y
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_MTD=m
diff --git a/arch/powerpc/configs/storcenter_defconfig b/arch/powerpc/configs/storcenter_defconfig
index 74bca2eccd0f..6c39c52b8e4a 100644
--- a/arch/powerpc/configs/storcenter_defconfig
+++ b/arch/powerpc/configs/storcenter_defconfig
@@ -26,7 +26,6 @@ CONFIG_IP_PNP_DHCP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
diff --git a/arch/powerpc/configs/tqm8xx_defconfig b/arch/powerpc/configs/tqm8xx_defconfig
index cd72193fac0a..7493f36dd6e9 100644
--- a/arch/powerpc/configs/tqm8xx_defconfig
+++ b/arch/powerpc/configs/tqm8xx_defconfig
@@ -32,7 +32,6 @@ CONFIG_SYN_COOKIES=y
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
diff --git a/arch/powerpc/configs/wii_defconfig b/arch/powerpc/configs/wii_defconfig
index f5c366b02828..437be0817e01 100644
--- a/arch/powerpc/configs/wii_defconfig
+++ b/arch/powerpc/configs/wii_defconfig
@@ -41,7 +41,6 @@ CONFIG_BT_BNEP_MC_FILTER=y
 CONFIG_BT_HIDP=y
 CONFIG_CFG80211=y
 CONFIG_MAC80211=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_STANDALONE is not set
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
-- 
2.7.4

