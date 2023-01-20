Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6457A675618
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 14:45:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nz12k1W1Nz3fZd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 00:45:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=DvldTCND;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=BTcLKl2x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=alexander.stein@ew.tq-group.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=DvldTCND;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=BTcLKl2x;
	dkim-atps=neutral
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nz0qV1Pvgz3fJ4
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 00:35:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674221718; x=1705757718;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UK9in/6pk+cr3TnMOT93DY7cqB9Lku8ZTtDleVDrgtc=;
  b=DvldTCNDYuciafEx2AkeQbRtamAnbP196/wQV4yie8rA3ZYa+bhUyhy7
   j/OiyqGqDiKK3bzSzkbahui+Xdz0prwRCiXt34+8ivQxA8INT8gLns4FG
   VwYCx7KREW8euDR8SnXYevww1y3ajGQpIg1VHg2L9s4GPQQFfvY5g7OY6
   v7b1BSYsKVZYrE6ZgfcJRY0v1fh4Itv5czjJ58Lcc6oZ2H3927MiN819h
   eiXyuCKFOFWAr0O7O207My33rkSXrIgk9nHhpTI6TfgLmoewLfYZgotmu
   r0OOm1gz98hzVF2sfCOZk0v7IZxySSK+Jiqyfy0AL9Yt6swE3BwWev9YL
   A==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561593"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Jan 2023 14:35:06 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 20 Jan 2023 14:35:06 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 20 Jan 2023 14:35:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674221706; x=1705757706;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UK9in/6pk+cr3TnMOT93DY7cqB9Lku8ZTtDleVDrgtc=;
  b=BTcLKl2xHZAJI46pdlQpnyUoeXJGB5vvghfy6DvSWczPmnhpvTq3KHhf
   FS+VA0cCgRPyMOKe22E4juIsD9DEcNnplumKpyZfzoEOAGLeF0qhROIWz
   FEPSaTzqsoOgPn2Nd8j474AhEQQlbmMiMTNUFFYTrWq23WNAhqKKfHv0d
   vb2GcNmFrRphU3wxvR8Om5G/paWw6dqAkxdPWQG2WHokE1VgrSSqSax4o
   kodh/XAZ3vM4XdWAz9ng195o1k50K9OdhiKBCLVcBSqwB4siuy8ivGg0O
   uehXPJbRCKcMeiCg+4JqN/c/bgQ9x2nIQXw4o11CXD6RIinkZrxJFEkWn
   A==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561592"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jan 2023 14:35:06 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 425DC28007F;
	Fri, 20 Jan 2023 14:35:06 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	Marek Vasut <marex@denx.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v2 10/10] ARM: add multi_v7_lpae_defconfig
Date: Fri, 20 Jan 2023 14:34:55 +0100
Message-Id: <20230120133455.3962413-11-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120133455.3962413-1-alexander.stein@ew.tq-group.com>
References: <20230120133455.3962413-1-alexander.stein@ew.tq-group.com>
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
Cc: devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Alexander Stein <alexander.stein@ew.tq-group.com>, soc@kernel.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

The only missing configuration option preventing us from using
multi_v7_defconfig with the Raspberry Pi 4 is ARM_LPAE. It's needed as
the PCIe controller found on the SoC depends on 64bit addressing, yet
can't be included as not all v7 boards support LPAE.

Introduce multi_v7_lpae_defconfig, built off multi_v7_defconfig, which will
avoid us having to duplicate and maintain multiple similar configurations.

Needless to say the Raspberry Pi 4 is not the only platform that can
benefit from this new configuration.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Directly applied from https://lore.kernel.org/linux-arm-kernel/20200203184820.4433-2-nsaenzjulienne@suse.de/T/#m96968dd45c0aaa88e0a7387024b5ac13b002363d
Although I had to apply manually

 arch/arm/Makefile            | 4 ++++
 arch/arm/configs/lpae.config | 1 +
 2 files changed, 5 insertions(+)
 create mode 100644 arch/arm/configs/lpae.config

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 506dbc72323bc..80d9eaf3dc06a 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -314,6 +314,10 @@ endif
 # My testing targets (bypasses dependencies)
 bp:;	$(Q)$(MAKE) $(build)=$(boot) $(boot)/bootpImage
 
+include $(srctree)/scripts/Makefile.defconf
+PHONY += multi_v7_lpae_defconfig
+multi_v7_lpae_defconfig:
+	$(call merge_into_defconfig,multi_v7_defconfig,lpae)
 
 define archhelp
   echo  '* zImage        - Compressed kernel image (arch/$(ARCH)/boot/zImage)'
diff --git a/arch/arm/configs/lpae.config b/arch/arm/configs/lpae.config
new file mode 100644
index 0000000000000..19bab134e014b
--- /dev/null
+++ b/arch/arm/configs/lpae.config
@@ -0,0 +1 @@
+CONFIG_ARM_LPAE=y
-- 
2.34.1

