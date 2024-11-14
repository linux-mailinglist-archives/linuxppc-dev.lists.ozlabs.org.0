Return-Path: <linuxppc-dev+bounces-3197-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6999C8B80
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 14:11:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq0sW0Dcsz302N;
	Fri, 15 Nov 2024 00:11:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731589886;
	cv=none; b=lzN1rvrVJMPur9RNzBG85dSyJQ3PsGzenJU/bemJQ7fwhaiFbtO6UyYsG3wPWO6DfYmly8IIVyymijCy7IG0DcNgPVEeU/vXOpxep6E8/GTXgTr3rU/sv1+6TEnQehMla6ND+EbqcOy9XFbc2tsM9b9xZM/tbAWSXBM7JCZgSMZ/2JTQfbvla7r589TPzAXuaWycPLtL79lwXW36yJ7c1NpWczeKu1jF+T80e9wEI3GYL2V9GgYvxPN7xyisa5HtzbPNjRQxiK3EMQB8wMrjLwdbMj8se0skPoi7RMfQ/Tl3HawCTJzA303bQVnxJRTDxgaS16Ph3Ye6Zz98TUM/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731589886; c=relaxed/relaxed;
	bh=4GnC50MH3+7klU5A9jOJt1aNz3Oe/63gV8xLDmnpcJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XCcNhwzTf+6yWW1JjLLPTg1WyFlBa2uF9LU+EWfnQ5XQiDG62G3UM0pz4sn5jaf1H9XRzSeMRqteGBh+DALIY3/tSoa1/mO4h7utu3E1T2aF5HEJOcyvb2ewd6LgsMBeZP/vXbI3QL4gUYf2PlmWJwH1dkOAMVZ5FWxgxuukjhiNkhf8+rfgD6PQag+qRytFPVL/crfcEGtAoGfMzXtaGDXtw3B4VY5if+rGBdSBgPMijgaad1J3SFvXxzItm9aJ4VWHGtmZtf8KkLr7SghrRqHvgfyB+XTKKMXsWhfsu1P+m5Iq8sGC6ZWPsL7/0ZBW+dn3mbwcI3eY8qMTY8Jg2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lN4yzUXD; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lN4yzUXD;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq0sT4MLGz301n
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 00:11:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731589882;
	bh=4GnC50MH3+7klU5A9jOJt1aNz3Oe/63gV8xLDmnpcJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lN4yzUXDak6bgYhDvvn3570dXlIjsAefVxhZ/PPAxHHxjfKfW69Qf6NTRX+tezKZ+
	 mV7C+FqmURyLX9H4srTj4vt/g3vlfTmmHq3TiZ4haIW4asXJJ4m67WGVB6d0n5Aq4a
	 b8qUeuRJJO1YQIrqx3cSK1EUil+LwIsCXOqalU/uwR3Xe16POv9qkK7iSEv1WgVc1j
	 LakmZW2rF/ABvxiSffIKZ/6pcIz0pA8NNfE2SC1hl9OVfNDhfPxFlbAnr+k9dU54KJ
	 1P4ZX2JzKLYmv+xwvEkl9FWlpZ28VpodIf47v32moV7XWFyr6LUWj9QHap2EEXrwvt
	 8Mypizy6UR5Vg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xq0sQ4s0Lz4x7H;
	Fri, 15 Nov 2024 00:11:22 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>,
	<geert@linux-m68k.org>,
	<arnd@arndb.de>
Subject: [RFC PATCH 03/10] powerpc/chrp: Remove PPC_CHRP from defconfigs
Date: Fri, 15 Nov 2024 00:11:06 +1100
Message-ID: <20241114131114.602234-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114131114.602234-1-mpe@ellerman.id.au>
References: <20241114131114.602234-1-mpe@ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/52xx/cm5200_defconfig        | 1 -
 arch/powerpc/configs/52xx/lite5200b_defconfig     | 1 -
 arch/powerpc/configs/52xx/motionpro_defconfig     | 1 -
 arch/powerpc/configs/52xx/pcm030_defconfig        | 1 -
 arch/powerpc/configs/52xx/tqm5200_defconfig       | 1 -
 arch/powerpc/configs/83xx/asp8347_defconfig       | 1 -
 arch/powerpc/configs/83xx/kmeter1_defconfig       | 1 -
 arch/powerpc/configs/83xx/mpc8313_rdb_defconfig   | 1 -
 arch/powerpc/configs/83xx/mpc8315_rdb_defconfig   | 1 -
 arch/powerpc/configs/83xx/mpc832x_rdb_defconfig   | 1 -
 arch/powerpc/configs/83xx/mpc834x_itx_defconfig   | 1 -
 arch/powerpc/configs/83xx/mpc834x_itxgp_defconfig | 1 -
 arch/powerpc/configs/83xx/mpc836x_rdk_defconfig   | 1 -
 arch/powerpc/configs/83xx/mpc837x_rdb_defconfig   | 1 -
 arch/powerpc/configs/86xx-hw.config               | 1 -
 arch/powerpc/configs/amigaone_defconfig           | 1 -
 arch/powerpc/configs/ep8248e_defconfig            | 1 -
 arch/powerpc/configs/gamecube_defconfig           | 1 -
 arch/powerpc/configs/holly_defconfig              | 1 -
 arch/powerpc/configs/linkstation_defconfig        | 1 -
 arch/powerpc/configs/mpc512x_defconfig            | 1 -
 arch/powerpc/configs/mpc5200_defconfig            | 1 -
 arch/powerpc/configs/mpc83xx_defconfig            | 1 -
 arch/powerpc/configs/mvme5100_defconfig           | 1 -
 arch/powerpc/configs/pmac32_defconfig             | 1 -
 arch/powerpc/configs/storcenter_defconfig         | 1 -
 arch/powerpc/configs/wii_defconfig                | 1 -
 27 files changed, 27 deletions(-)

diff --git a/arch/powerpc/configs/52xx/cm5200_defconfig b/arch/powerpc/configs/52xx/cm5200_defconfig
index 2412a6bf7ee6..1c491b13e94e 100644
--- a/arch/powerpc/configs/52xx/cm5200_defconfig
+++ b/arch/powerpc/configs/52xx/cm5200_defconfig
@@ -6,7 +6,6 @@ CONFIG_EXPERT=y
 # CONFIG_EPOLL is not set
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
-# CONFIG_PPC_CHRP is not set
 CONFIG_PPC_MPC52xx=y
 CONFIG_PPC_MPC5200_SIMPLE=y
 # CONFIG_PPC_PMAC is not set
diff --git a/arch/powerpc/configs/52xx/lite5200b_defconfig b/arch/powerpc/configs/52xx/lite5200b_defconfig
index 7db479dcbc0c..8e5ea519eda2 100644
--- a/arch/powerpc/configs/52xx/lite5200b_defconfig
+++ b/arch/powerpc/configs/52xx/lite5200b_defconfig
@@ -9,7 +9,6 @@ CONFIG_EXPERT=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
-# CONFIG_PPC_CHRP is not set
 CONFIG_PPC_MPC52xx=y
 CONFIG_PPC_MPC5200_SIMPLE=y
 CONFIG_PPC_LITE5200=y
diff --git a/arch/powerpc/configs/52xx/motionpro_defconfig b/arch/powerpc/configs/52xx/motionpro_defconfig
index 6186ead1e105..8c4e2c978504 100644
--- a/arch/powerpc/configs/52xx/motionpro_defconfig
+++ b/arch/powerpc/configs/52xx/motionpro_defconfig
@@ -6,7 +6,6 @@ CONFIG_EXPERT=y
 # CONFIG_EPOLL is not set
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
-# CONFIG_PPC_CHRP is not set
 CONFIG_PPC_MPC52xx=y
 CONFIG_PPC_MPC5200_SIMPLE=y
 # CONFIG_PPC_PMAC is not set
diff --git a/arch/powerpc/configs/52xx/pcm030_defconfig b/arch/powerpc/configs/52xx/pcm030_defconfig
index 88fbe0d42e11..ea0880e2cd9f 100644
--- a/arch/powerpc/configs/52xx/pcm030_defconfig
+++ b/arch/powerpc/configs/52xx/pcm030_defconfig
@@ -13,7 +13,6 @@ CONFIG_EXPERT=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
-# CONFIG_PPC_CHRP is not set
 CONFIG_PPC_MPC52xx=y
 CONFIG_PPC_MPC5200_SIMPLE=y
 # CONFIG_PPC_PMAC is not set
diff --git a/arch/powerpc/configs/52xx/tqm5200_defconfig b/arch/powerpc/configs/52xx/tqm5200_defconfig
index 688f703d8e22..45f9924a8406 100644
--- a/arch/powerpc/configs/52xx/tqm5200_defconfig
+++ b/arch/powerpc/configs/52xx/tqm5200_defconfig
@@ -9,7 +9,6 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_MODVERSIONS=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
-# CONFIG_PPC_CHRP is not set
 CONFIG_PPC_MPC52xx=y
 CONFIG_PPC_MPC5200_SIMPLE=y
 CONFIG_PPC_MPC5200_BUGFIX=y
diff --git a/arch/powerpc/configs/83xx/asp8347_defconfig b/arch/powerpc/configs/83xx/asp8347_defconfig
index 10192410b33c..d3a440ee6fa0 100644
--- a/arch/powerpc/configs/83xx/asp8347_defconfig
+++ b/arch/powerpc/configs/83xx/asp8347_defconfig
@@ -11,7 +11,6 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
 # CONFIG_MSDOS_PARTITION is not set
-# CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_83xx=y
 CONFIG_ASP834x=y
diff --git a/arch/powerpc/configs/83xx/kmeter1_defconfig b/arch/powerpc/configs/83xx/kmeter1_defconfig
index 487e5e1bbf4c..7895c1139639 100644
--- a/arch/powerpc/configs/83xx/kmeter1_defconfig
+++ b/arch/powerpc/configs/83xx/kmeter1_defconfig
@@ -10,7 +10,6 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
 # CONFIG_MSDOS_PARTITION is not set
-# CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_83xx=y
 CONFIG_KMETER1=y
diff --git a/arch/powerpc/configs/83xx/mpc8313_rdb_defconfig b/arch/powerpc/configs/83xx/mpc8313_rdb_defconfig
index 16a42e2267fb..d1949e3ddc2b 100644
--- a/arch/powerpc/configs/83xx/mpc8313_rdb_defconfig
+++ b/arch/powerpc/configs/83xx/mpc8313_rdb_defconfig
@@ -9,7 +9,6 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
-# CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_83xx=y
 CONFIG_MPC831x_RDB=y
diff --git a/arch/powerpc/configs/83xx/mpc8315_rdb_defconfig b/arch/powerpc/configs/83xx/mpc8315_rdb_defconfig
index 80d40ae668eb..666f39f1a178 100644
--- a/arch/powerpc/configs/83xx/mpc8315_rdb_defconfig
+++ b/arch/powerpc/configs/83xx/mpc8315_rdb_defconfig
@@ -9,7 +9,6 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
-# CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_83xx=y
 CONFIG_MPC831x_RDB=y
diff --git a/arch/powerpc/configs/83xx/mpc832x_rdb_defconfig b/arch/powerpc/configs/83xx/mpc832x_rdb_defconfig
index 1715ff547442..34ebb2a92382 100644
--- a/arch/powerpc/configs/83xx/mpc832x_rdb_defconfig
+++ b/arch/powerpc/configs/83xx/mpc832x_rdb_defconfig
@@ -10,7 +10,6 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_LDM_PARTITION=y
-# CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_83xx=y
 CONFIG_MPC832x_RDB=y
diff --git a/arch/powerpc/configs/83xx/mpc834x_itx_defconfig b/arch/powerpc/configs/83xx/mpc834x_itx_defconfig
index e65c0057147f..a78908582cc1 100644
--- a/arch/powerpc/configs/83xx/mpc834x_itx_defconfig
+++ b/arch/powerpc/configs/83xx/mpc834x_itx_defconfig
@@ -10,7 +10,6 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_MAC_PARTITION=y
-# CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_83xx=y
 CONFIG_MPC834x_ITX=y
diff --git a/arch/powerpc/configs/83xx/mpc834x_itxgp_defconfig b/arch/powerpc/configs/83xx/mpc834x_itxgp_defconfig
index 17714bf0ed40..5050654bbd0f 100644
--- a/arch/powerpc/configs/83xx/mpc834x_itxgp_defconfig
+++ b/arch/powerpc/configs/83xx/mpc834x_itxgp_defconfig
@@ -10,7 +10,6 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_MAC_PARTITION=y
-# CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_83xx=y
 CONFIG_MPC834x_ITX=y
diff --git a/arch/powerpc/configs/83xx/mpc836x_rdk_defconfig b/arch/powerpc/configs/83xx/mpc836x_rdk_defconfig
index 093df33f9455..f6d9fcb2eef6 100644
--- a/arch/powerpc/configs/83xx/mpc836x_rdk_defconfig
+++ b/arch/powerpc/configs/83xx/mpc836x_rdk_defconfig
@@ -8,7 +8,6 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
 # CONFIG_MSDOS_PARTITION is not set
-# CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_83xx=y
 CONFIG_MPC836x_RDK=y
diff --git a/arch/powerpc/configs/83xx/mpc837x_rdb_defconfig b/arch/powerpc/configs/83xx/mpc837x_rdb_defconfig
index 58fae5131fa7..b53c6ab46c04 100644
--- a/arch/powerpc/configs/83xx/mpc837x_rdb_defconfig
+++ b/arch/powerpc/configs/83xx/mpc837x_rdb_defconfig
@@ -6,7 +6,6 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
-# CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_83xx=y
 CONFIG_MPC837x_RDB=y
diff --git a/arch/powerpc/configs/86xx-hw.config b/arch/powerpc/configs/86xx-hw.config
index 0cb24b33c88e..d452868b1042 100644
--- a/arch/powerpc/configs/86xx-hw.config
+++ b/arch/powerpc/configs/86xx-hw.config
@@ -57,7 +57,6 @@ CONFIG_PCI_DEBUG=y
 CONFIG_PCIEPORTBUS=y
 CONFIG_PCI=y
 # CONFIG_PCMCIA_LOAD_CIS is not set
-# CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_CMOS=y
diff --git a/arch/powerpc/configs/amigaone_defconfig b/arch/powerpc/configs/amigaone_defconfig
index 200bb1ecb560..7d5f59f824d1 100644
--- a/arch/powerpc/configs/amigaone_defconfig
+++ b/arch/powerpc/configs/amigaone_defconfig
@@ -15,7 +15,6 @@ CONFIG_MODULE_FORCE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_AMIGA_PARTITION=y
-# CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_AMIGAONE=y
 CONFIG_HIGHMEM=y
diff --git a/arch/powerpc/configs/ep8248e_defconfig b/arch/powerpc/configs/ep8248e_defconfig
index 0d8d3f41f194..cb66f72806a2 100644
--- a/arch/powerpc/configs/ep8248e_defconfig
+++ b/arch/powerpc/configs/ep8248e_defconfig
@@ -5,7 +5,6 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_PARTITION_ADVANCED=y
-# CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_82xx=y
 CONFIG_EP8248E=y
diff --git a/arch/powerpc/configs/gamecube_defconfig b/arch/powerpc/configs/gamecube_defconfig
index d77eeb525366..47a233c903cc 100644
--- a/arch/powerpc/configs/gamecube_defconfig
+++ b/arch/powerpc/configs/gamecube_defconfig
@@ -11,7 +11,6 @@ CONFIG_PERF_EVENTS=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
-# CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_EMBEDDED6xx=y
 CONFIG_GAMECUBE=y
diff --git a/arch/powerpc/configs/holly_defconfig b/arch/powerpc/configs/holly_defconfig
index 271daff47d1d..4ec803a6dcbc 100644
--- a/arch/powerpc/configs/holly_defconfig
+++ b/arch/powerpc/configs/holly_defconfig
@@ -7,7 +7,6 @@ CONFIG_EXPERT=y
 CONFIG_MODULES=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
-# CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_EMBEDDED6xx=y
 CONFIG_PPC_HOLLY=y
diff --git a/arch/powerpc/configs/linkstation_defconfig b/arch/powerpc/configs/linkstation_defconfig
index fa707de761be..230835f1a14b 100644
--- a/arch/powerpc/configs/linkstation_defconfig
+++ b/arch/powerpc/configs/linkstation_defconfig
@@ -10,7 +10,6 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
-# CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_EMBEDDED6xx=y
 CONFIG_LINKSTATION=y
diff --git a/arch/powerpc/configs/mpc512x_defconfig b/arch/powerpc/configs/mpc512x_defconfig
index d24457bc5791..3991229be610 100644
--- a/arch/powerpc/configs/mpc512x_defconfig
+++ b/arch/powerpc/configs/mpc512x_defconfig
@@ -8,7 +8,6 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
-# CONFIG_PPC_CHRP is not set
 CONFIG_PPC_MPC512x=y
 CONFIG_MPC512x_LPBFIFO=y
 CONFIG_MPC5121_ADS=y
diff --git a/arch/powerpc/configs/mpc5200_defconfig b/arch/powerpc/configs/mpc5200_defconfig
index c0fe5e76604a..8a3fa19f66a1 100644
--- a/arch/powerpc/configs/mpc5200_defconfig
+++ b/arch/powerpc/configs/mpc5200_defconfig
@@ -6,7 +6,6 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
-# CONFIG_PPC_CHRP is not set
 CONFIG_PPC_MPC52xx=y
 CONFIG_PPC_MPC5200_SIMPLE=y
 CONFIG_PPC_EFIKA=y
diff --git a/arch/powerpc/configs/mpc83xx_defconfig b/arch/powerpc/configs/mpc83xx_defconfig
index 83c4710017e9..00f37a564d73 100644
--- a/arch/powerpc/configs/mpc83xx_defconfig
+++ b/arch/powerpc/configs/mpc83xx_defconfig
@@ -6,7 +6,6 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
-# CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_83xx=y
 CONFIG_MPC831x_RDB=y
diff --git a/arch/powerpc/configs/mvme5100_defconfig b/arch/powerpc/configs/mvme5100_defconfig
index d1c7fd5bf34b..c868a4681d7b 100644
--- a/arch/powerpc/configs/mvme5100_defconfig
+++ b/arch/powerpc/configs/mvme5100_defconfig
@@ -14,7 +14,6 @@ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
-# CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_EMBEDDED6xx=y
 CONFIG_MVME5100=y
diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
index 57ded82c2840..b2b8c46814dd 100644
--- a/arch/powerpc/configs/pmac32_defconfig
+++ b/arch/powerpc/configs/pmac32_defconfig
@@ -14,7 +14,6 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
-# CONFIG_PPC_CHRP is not set
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_GOV_POWERSAVE=y
 CONFIG_CPU_FREQ_GOV_USERSPACE=y
diff --git a/arch/powerpc/configs/storcenter_defconfig b/arch/powerpc/configs/storcenter_defconfig
index 7a978d396991..b1e55cd34ce1 100644
--- a/arch/powerpc/configs/storcenter_defconfig
+++ b/arch/powerpc/configs/storcenter_defconfig
@@ -6,7 +6,6 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
-# CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_EMBEDDED6xx=y
 CONFIG_STORCENTER=y
diff --git a/arch/powerpc/configs/wii_defconfig b/arch/powerpc/configs/wii_defconfig
index 5017a697b67b..e6ca8c175fdf 100644
--- a/arch/powerpc/configs/wii_defconfig
+++ b/arch/powerpc/configs/wii_defconfig
@@ -11,7 +11,6 @@ CONFIG_PERF_EVENTS=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-# CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_EMBEDDED6xx=y
 CONFIG_WII=y
-- 
2.47.0


