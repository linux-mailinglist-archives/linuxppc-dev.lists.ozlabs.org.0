Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6494586C83F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 12:41:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aI/lresb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlq7h03N6z3vZr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 22:41:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aI/lresb;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tlq6y3BGWz3dT4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 22:41:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709206874;
	bh=aL3tl1PT8lDcYk8KS2ba5bQWCVlMdMzcAmbbZlOb3Os=;
	h=From:To:Cc:Subject:Date:From;
	b=aI/lresb799lE/3/bx8QycewfjARqzY8/bq/Q6A1L5uiaLEVdKd0CeGjCWCEpCRuA
	 aGdq6uipG+V/cY80lhmS0wis097MaS7PN245RLPHdFbvmTyRRCvdAhe/egLCNtf9/z
	 1Y/vuDNAMGJpHLAZcW478v6ciadA1D+i3xmfe1PMVRQbVTw7gKcQwr567ZTWEJiP1W
	 wY89r9r4eQU24/Prb+JbvXr3TaAJ+lGVfQ0a7ypWmAiL6i7nD5MUMCoKoAClvAazFW
	 n0k2b7FwUTXSRpvabQinVHpEg5z9TngzmgnEj5iE4IemkO+t9hn1r8DgjDA7zsIQ0c
	 uz1nJoJ4Z90HA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tlq6x5L08z4wZx;
	Thu, 29 Feb 2024 22:41:13 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc: Add allmodconfig for all 32-bit sub-arches
Date: Thu, 29 Feb 2024 22:41:08 +1100
Message-ID: <20240229114108.743810-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.2
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
Cc: u.kleine-koenig@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

32-bit powerpc kernels can be built for one of 5 sub-arches, see
Kconfig.cputype:

  PPC_BOOK3S_32: "512x/52xx/6xx/7xx/74xx/82xx/83xx/86xx"
  PPC_85xx: "Freescale 85xx"
  PPC_8xx: "Freescale 8xx"
  40x: "AMCC 40x"
  44x: "AMCC 44x, 46x or 47x"

By default none of these are built for a plain allmodconfig build,
because it selects PPC64 which builds a 64-bit kernel.

There is already a ppc32_allmodconfig, which enables PPC_BOOK3S_32.

Add similar targets for the other 32-bit sub-arches to increase build
coverage:
  ppc40x_allmodconfig
  ppc44x_allmodconfig
  ppc8xx_allmodconfig
  ppc85xx_allmodconfig

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Makefile                  | 20 ++++++++++++++++++++
 arch/powerpc/configs/40x.config        |  2 ++
 arch/powerpc/configs/44x.config        |  2 ++
 arch/powerpc/configs/85xx-32bit.config |  1 +
 arch/powerpc/configs/8xx.config        |  2 ++
 5 files changed, 27 insertions(+)
 create mode 100644 arch/powerpc/configs/40x.config
 create mode 100644 arch/powerpc/configs/44x.config
 create mode 100644 arch/powerpc/configs/8xx.config

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 051247027da0..4b8c9ff79d0f 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -314,6 +314,26 @@ ppc32_allmodconfig:
 	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/book3s_32.config \
 		-f $(srctree)/Makefile allmodconfig
 
+generated_configs += ppc40x_allmodconfig
+ppc40x_allmodconfig:
+	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/40x.config \
+		-f $(srctree)/Makefile allmodconfig
+
+generated_configs += ppc44x_allmodconfig
+ppc44x_allmodconfig:
+	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/44x.config \
+		-f $(srctree)/Makefile allmodconfig
+
+generated_configs += ppc8xx_allmodconfig
+ppc8xx_allmodconfig:
+	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/8xx.config \
+		-f $(srctree)/Makefile allmodconfig
+
+generated_configs += ppc85xx_allmodconfig
+ppc85xx_allmodconfig:
+	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/85xx-32bit.config \
+		-f $(srctree)/Makefile allmodconfig
+
 generated_configs += ppc_defconfig
 ppc_defconfig:
 	$(call merge_into_defconfig,book3s_32.config,)
diff --git a/arch/powerpc/configs/40x.config b/arch/powerpc/configs/40x.config
new file mode 100644
index 000000000000..82a9d58ddb81
--- /dev/null
+++ b/arch/powerpc/configs/40x.config
@@ -0,0 +1,2 @@
+CONFIG_PPC64=n
+CONFIG_40x=y
diff --git a/arch/powerpc/configs/44x.config b/arch/powerpc/configs/44x.config
new file mode 100644
index 000000000000..79b7b1962995
--- /dev/null
+++ b/arch/powerpc/configs/44x.config
@@ -0,0 +1,2 @@
+CONFIG_PPC64=n
+CONFIG_44x=y
diff --git a/arch/powerpc/configs/85xx-32bit.config b/arch/powerpc/configs/85xx-32bit.config
index 6b8894d727a2..a85310bcb1fd 100644
--- a/arch/powerpc/configs/85xx-32bit.config
+++ b/arch/powerpc/configs/85xx-32bit.config
@@ -1,3 +1,4 @@
+CONFIG_PPC64=n
 CONFIG_HIGHMEM=y
 CONFIG_KEXEC=y
 CONFIG_PPC_85xx=y
diff --git a/arch/powerpc/configs/8xx.config b/arch/powerpc/configs/8xx.config
new file mode 100644
index 000000000000..7eb3ffbbd667
--- /dev/null
+++ b/arch/powerpc/configs/8xx.config
@@ -0,0 +1,2 @@
+CONFIG_PPC64=n
+CONFIG_PPC_8xx=y
-- 
2.43.2

