Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9368D679649
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 12:12:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1PSk2rN3z3cdC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 22:12:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=TU/XCxYK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=eMup3qfn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=alexander.stein@ew.tq-group.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=TU/XCxYK;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=eMup3qfn;
	dkim-atps=neutral
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1PFM5yvhz3cDD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 22:02:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558152; x=1706094152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xz/vRD3dolKFyEebpOql6jJYuQ0Wvwmw1Ox1BdnhLHg=;
  b=TU/XCxYKv4Zj8dVivIkgdWRevGd1fAwxa5J2ZKSnrRHLqSBe6RIUtPfW
   xYy3UYAn0aK3jWcmGkdJMrgnkIO19PEI9xmQSBkVoUDtmD2D73HI60480
   sshd8FR+/FC26U9NWZ/OzX2fBPQWTvC/Sou2fnYTJOK6JKQDCj3LlXUA3
   PzJHSJe2rvW76jT7vwNKhQbbWwxlxLrTLjaNbwupJd6RaK8PemJtc6pL5
   bFrOBN2ECVB8HC1oEjuIRSefZaU46B7bKG/OOOcRDcXjWRH+hS4yYT+5I
   Ce33Qmm10Xxrt6Jnqi9wJ4yt8PIy5HBoxb/hUYKOGvTl+PJPW+zv529+J
   A==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616635"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 Jan 2023 12:02:20 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 24 Jan 2023 12:02:20 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Tue, 24 Jan 2023 12:02:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558140; x=1706094140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xz/vRD3dolKFyEebpOql6jJYuQ0Wvwmw1Ox1BdnhLHg=;
  b=eMup3qfn4lFtLO7j8ckfrOw8PImobHyBd9qVInP+6ZzxcKCVJ58dqHWo
   4fy7SAcrHB0aiLY7NIf7chdhBivtGxL5ZnGIsKSr5CFNEfSQCJqXMOzC4
   BmGU2mEESNDkqVCXaECiiWAkiamjebSWY/RLQjY6paHaACda0VrMAhbvH
   7NYR+59jk87bYGmBTXuP82kxgSP62HItuvEp+BljBXsQNSv16yHMXg0QH
   Ib66RmGgg96G8lQbxnILTNoeVvWdOp1vqzqC+w54APXaiMf6ZBsoa9ILu
   iME9haXJJNrvaT+zNCwgnFeC5nlGdHn8nvPgqzGCkGNorbQrgVoCwbw+B
   A==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616633"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jan 2023 12:02:19 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8AA25280073;
	Tue, 24 Jan 2023 12:02:19 +0100 (CET)
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
Subject: [PATCH v3 10/10] ARM: add multi_v7_lpae_defconfig
Date: Tue, 24 Jan 2023 12:02:13 +0100
Message-Id: <20230124110213.3221264-11-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124110213.3221264-1-alexander.stein@ew.tq-group.com>
References: <20230124110213.3221264-1-alexander.stein@ew.tq-group.com>
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
Changes in v3:
* As per Arnd's suggestion add CONFIG_VMSPLIT_2G to lpae.config fragment
* List multi_v7_lpae_defconfig target in 'make help' as well

Unfortunately the list of defconfigs is autogenerated, so this new
(explicit) target doesn't fit into this list. Therefore it's added to
'archhelp' instead.

 arch/arm/Makefile            | 6 ++++++
 arch/arm/configs/lpae.config | 2 ++
 2 files changed, 8 insertions(+)
 create mode 100644 arch/arm/configs/lpae.config

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index a353b92641f36..485a439e22ca8 100644
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
@@ -329,4 +333,6 @@ define archhelp
   echo  '                  (distribution) /sbin/$(INSTALLKERNEL) or'
   echo  '                  install to $$(INSTALL_PATH) and run lilo'
   echo  '  vdso_install  - Install unstripped vdso.so to $$(INSTALL_MOD_PATH)/vdso'
+  echo
+  echo  '  multi_v7_lpae_defconfig     - multi_v7_defconfig with CONFIG_ARM_LPAE enabled'
 endef
diff --git a/arch/arm/configs/lpae.config b/arch/arm/configs/lpae.config
new file mode 100644
index 0000000000000..a6d6f7ab3c01a
--- /dev/null
+++ b/arch/arm/configs/lpae.config
@@ -0,0 +1,2 @@
+CONFIG_ARM_LPAE=y
+CONFIG_VMSPLIT_2G=y
-- 
2.34.1

