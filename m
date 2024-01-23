Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3159838EDA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 13:53:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CpDqB7LQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK6TL3wMbz3dWr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 23:53:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CpDqB7LQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TK6S74v9lz3cbC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 23:52:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C3DB61CE6;
	Tue, 23 Jan 2024 12:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4379C433C7;
	Tue, 23 Jan 2024 12:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706014341;
	bh=9Doj/gTHL3//w2tFAh8hYikUi4bc/x4E4gubWtQZ8Cg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CpDqB7LQEcEuqa3niaxIcL4o90Q2HZw/Qz+VvkXmKqwkUbR25SECSEOScNiTct7cM
	 JjYPbk6SY8uN82M9ZYOUV+Dk6xaMl9H58VuOwLr+67E0ZD8F0N8WS7s7XqUBWUQoDA
	 sM/3vhbNNmzC8rhwQyQu6ZR6QZiyKvEenBOO6kawF3P/ftzR4TYoQRpWIU4OZKd6Tq
	 oKvROao5yTDUILfHMF3skeTus0E6DPY7I5iY+H14RUjmt9dkoLvLwMzsmPXeKsaYjJ
	 bLOImNkIChGVw1fAFNWZoxI6SfbZbiWPfnAmcnuypYvOpqGZTSrdl1zJupVXs6Ogks
	 wZo4JgrJK4Lgw==
From: Arnd Bergmann <arnd@kernel.org>
To: Scott Wood <oss@buserror.net>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/2] powerpc: 85xx: mark local functions static
Date: Tue, 23 Jan 2024 13:51:42 +0100
Message-Id: <20240123125148.2004648-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240123125148.2004648-1-arnd@kernel.org>
References: <20240123125148.2004648-1-arnd@kernel.org>
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
Cc: Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

These functions are either used in only one file and can just be
makde static or need an #include statement to avoid a warning:

arch/powerpc/platforms/85xx/mpc8536_ds.c:30:13: error: no previous prototype for 'mpc8536_ds_pic_init' [-Werror=missing-prototypes]
arch/powerpc/platforms/85xx/p1010rdb.c:27:13: error: no previous prototype for 'p1010_rdb_pic_init' [-Werror=missing-prototypes]
arch/powerpc/platforms/85xx/p1022_ds.c:373:6: error: no previous prototype for 'p1022ds_set_pixel_clock' [-Werror=missing-prototypes]
arch/powerpc/platforms/85xx/p1022_ds.c:422:1: error: no previous prototype for 'p1022ds_valid_monitor_port' [-Werror=missing-prototypes]
arch/powerpc/platforms/85xx/p1022_ds.c:435:13: error: no previous prototype for 'p1022_ds_pic_init' [-Werror=missing-prototypes]
arch/powerpc/platforms/85xx/p1022_rdk.c:43:6: error: no previous prototype for 'p1022rdk_set_pixel_clock' [-Werror=missing-prototypes]
arch/powerpc/platforms/85xx/p1022_rdk.c:92:1: error: no previous prototype for 'p1022rdk_valid_monitor_port' [-Werror=missing-prototypes]
arch/powerpc/platforms/85xx/p1022_rdk.c:99:13: error: no previous prototype for 'p1022_rdk_pic_init' [-Werror=missing-prototypes]
arch/powerpc/platforms/85xx/socrates_fpga_pic.c:273:13: error: no previous prototype for 'socrates_fpga_pic_init' [-Werror=missing-prototypes]
arch/powerpc/platforms/85xx/xes_mpc85xx.c:40:13: error: no previous prototype for 'xes_mpc85xx_pic_init' [-Werror=missing-prototypes]
arch/powerpc/platforms/85xx/mvme2500.c:24:13: error: no previous prototype for 'mvme2500_pic_init' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/platforms/85xx/mpc8536_ds.c        | 2 +-
 arch/powerpc/platforms/85xx/mvme2500.c          | 2 +-
 arch/powerpc/platforms/85xx/p1010rdb.c          | 2 +-
 arch/powerpc/platforms/85xx/p1022_ds.c          | 6 +++---
 arch/powerpc/platforms/85xx/p1022_rdk.c         | 6 +++---
 arch/powerpc/platforms/85xx/socrates_fpga_pic.c | 2 ++
 arch/powerpc/platforms/85xx/xes_mpc85xx.c       | 2 +-
 7 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/mpc8536_ds.c b/arch/powerpc/platforms/85xx/mpc8536_ds.c
index e966b2ad8ecd..b3327a358eb4 100644
--- a/arch/powerpc/platforms/85xx/mpc8536_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc8536_ds.c
@@ -27,7 +27,7 @@
 
 #include "mpc85xx.h"
 
-void __init mpc8536_ds_pic_init(void)
+static void __init mpc8536_ds_pic_init(void)
 {
 	struct mpic *mpic = mpic_alloc(NULL, 0, MPIC_BIG_ENDIAN,
 			0, 256, " OpenPIC  ");
diff --git a/arch/powerpc/platforms/85xx/mvme2500.c b/arch/powerpc/platforms/85xx/mvme2500.c
index 1b59e45a0c64..19122daadb55 100644
--- a/arch/powerpc/platforms/85xx/mvme2500.c
+++ b/arch/powerpc/platforms/85xx/mvme2500.c
@@ -21,7 +21,7 @@
 
 #include "mpc85xx.h"
 
-void __init mvme2500_pic_init(void)
+static void __init mvme2500_pic_init(void)
 {
 	struct mpic *mpic = mpic_alloc(NULL, 0,
 		  MPIC_BIG_ENDIAN | MPIC_SINGLE_DEST_CPU,
diff --git a/arch/powerpc/platforms/85xx/p1010rdb.c b/arch/powerpc/platforms/85xx/p1010rdb.c
index 10d6f1fa3327..491895ac8bcf 100644
--- a/arch/powerpc/platforms/85xx/p1010rdb.c
+++ b/arch/powerpc/platforms/85xx/p1010rdb.c
@@ -24,7 +24,7 @@
 
 #include "mpc85xx.h"
 
-void __init p1010_rdb_pic_init(void)
+static void __init p1010_rdb_pic_init(void)
 {
 	struct mpic *mpic = mpic_alloc(NULL, 0, MPIC_BIG_ENDIAN |
 	  MPIC_SINGLE_DEST_CPU,
diff --git a/arch/powerpc/platforms/85xx/p1022_ds.c b/arch/powerpc/platforms/85xx/p1022_ds.c
index 0dd786a061a6..adc3a2ee1415 100644
--- a/arch/powerpc/platforms/85xx/p1022_ds.c
+++ b/arch/powerpc/platforms/85xx/p1022_ds.c
@@ -370,7 +370,7 @@ static void p1022ds_set_monitor_port(enum fsl_diu_monitor_port port)
  *
  * @pixclock: the wavelength, in picoseconds, of the clock
  */
-void p1022ds_set_pixel_clock(unsigned int pixclock)
+static void p1022ds_set_pixel_clock(unsigned int pixclock)
 {
 	struct device_node *guts_np = NULL;
 	struct ccsr_guts __iomem *guts;
@@ -418,7 +418,7 @@ void p1022ds_set_pixel_clock(unsigned int pixclock)
 /**
  * p1022ds_valid_monitor_port: set the monitor port for sysfs
  */
-enum fsl_diu_monitor_port
+static enum fsl_diu_monitor_port
 p1022ds_valid_monitor_port(enum fsl_diu_monitor_port port)
 {
 	switch (port) {
@@ -432,7 +432,7 @@ p1022ds_valid_monitor_port(enum fsl_diu_monitor_port port)
 
 #endif
 
-void __init p1022_ds_pic_init(void)
+static void __init p1022_ds_pic_init(void)
 {
 	struct mpic *mpic = mpic_alloc(NULL, 0, MPIC_BIG_ENDIAN |
 		MPIC_SINGLE_DEST_CPU,
diff --git a/arch/powerpc/platforms/85xx/p1022_rdk.c b/arch/powerpc/platforms/85xx/p1022_rdk.c
index 25ab6e9c1470..6198299d95b1 100644
--- a/arch/powerpc/platforms/85xx/p1022_rdk.c
+++ b/arch/powerpc/platforms/85xx/p1022_rdk.c
@@ -40,7 +40,7 @@
  *
  * @pixclock: the wavelength, in picoseconds, of the clock
  */
-void p1022rdk_set_pixel_clock(unsigned int pixclock)
+static void p1022rdk_set_pixel_clock(unsigned int pixclock)
 {
 	struct device_node *guts_np = NULL;
 	struct ccsr_guts __iomem *guts;
@@ -88,7 +88,7 @@ void p1022rdk_set_pixel_clock(unsigned int pixclock)
 /**
  * p1022rdk_valid_monitor_port: set the monitor port for sysfs
  */
-enum fsl_diu_monitor_port
+static enum fsl_diu_monitor_port
 p1022rdk_valid_monitor_port(enum fsl_diu_monitor_port port)
 {
 	return FSL_DIU_PORT_DVI;
@@ -96,7 +96,7 @@ p1022rdk_valid_monitor_port(enum fsl_diu_monitor_port port)
 
 #endif
 
-void __init p1022_rdk_pic_init(void)
+static void __init p1022_rdk_pic_init(void)
 {
 	struct mpic *mpic = mpic_alloc(NULL, 0, MPIC_BIG_ENDIAN |
 		MPIC_SINGLE_DEST_CPU,
diff --git a/arch/powerpc/platforms/85xx/socrates_fpga_pic.c b/arch/powerpc/platforms/85xx/socrates_fpga_pic.c
index baa12eff6d5d..60e0b8947ce6 100644
--- a/arch/powerpc/platforms/85xx/socrates_fpga_pic.c
+++ b/arch/powerpc/platforms/85xx/socrates_fpga_pic.c
@@ -8,6 +8,8 @@
 #include <linux/of_irq.h>
 #include <linux/io.h>
 
+#include "socrates_fpga_pic.h"
+
 /*
  * The FPGA supports 9 interrupt sources, which can be routed to 3
  * interrupt request lines of the MPIC. The line to be used can be
diff --git a/arch/powerpc/platforms/85xx/xes_mpc85xx.c b/arch/powerpc/platforms/85xx/xes_mpc85xx.c
index 45f257fc1ade..2582427d8d01 100644
--- a/arch/powerpc/platforms/85xx/xes_mpc85xx.c
+++ b/arch/powerpc/platforms/85xx/xes_mpc85xx.c
@@ -37,7 +37,7 @@
 #define MPC85xx_L2CTL_L2I		0x40000000 /* L2 flash invalidate */
 #define MPC85xx_L2CTL_L2SIZ_MASK	0x30000000 /* L2 SRAM size (R/O) */
 
-void __init xes_mpc85xx_pic_init(void)
+static void __init xes_mpc85xx_pic_init(void)
 {
 	struct mpic *mpic = mpic_alloc(NULL, 0, MPIC_BIG_ENDIAN,
 			0, 256, " OpenPIC  ");
-- 
2.39.2

