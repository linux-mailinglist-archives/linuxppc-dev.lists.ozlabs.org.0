Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D201630E82
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 12:45:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDsKr2tbNz3f5b
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 22:45:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=heyquark.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=ash@heyquark.com; receiver=<UNKNOWN>)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDsKG733tz3045
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 22:45:22 +1100 (AEDT)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 7805FC0F8C
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 11:31:34 +0000 (UTC)
Received: (Authenticated sender: ash@heyquark.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7F523FF805;
	Sat, 19 Nov 2022 11:31:20 +0000 (UTC)
From: Ash Logan <ash@heyquark.com>
To: krzysztof.kozlowski+dt@linaro.org,
	paulus@samba.org,
	mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu,
	robh+dt@kernel.org,
	benh@kernel.crashing.org,
	segher@kernel.crashing.org,
	pali@kernel.org
Subject: [PATCH v4 04/11] powerpc: wiiu: introduce wiiu platform
Date: Sat, 19 Nov 2022 22:30:34 +1100
Message-Id: <20221119113041.284419-5-ash@heyquark.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119113041.284419-1-ash@heyquark.com>
References: <20220628133144.142185-1-ash@heyquark.com>
 <20221119113041.284419-1-ash@heyquark.com>
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
Cc: devicetree@vger.kernel.org, linkmauve@linkmauve.fr, linux-kernel@vger.kernel.org, rw-r-r-0644@protonmail.com, joel@jms.id.au, linuxppc-dev@lists.ozlabs.org, j.ne@posteo.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adds empty platforms/wiiu for Nintendo Wii U console

Signed-off-by: Ash Logan <ash@heyquark.com>
---
v2->v3: Add help text for CONFIG_WIIU.

 arch/powerpc/platforms/Kconfig       | 1 +
 arch/powerpc/platforms/Makefile      | 1 +
 arch/powerpc/platforms/wiiu/Kconfig  | 8 ++++++++
 arch/powerpc/platforms/wiiu/Makefile | 1 +
 4 files changed, 11 insertions(+)
 create mode 100644 arch/powerpc/platforms/wiiu/Kconfig
 create mode 100644 arch/powerpc/platforms/wiiu/Makefile

diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index d41dad227de8..c4a9c3c0b409 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -22,6 +22,7 @@ source "arch/powerpc/platforms/40x/Kconfig"
 source "arch/powerpc/platforms/amigaone/Kconfig"
 source "arch/powerpc/platforms/book3s/Kconfig"
 source "arch/powerpc/platforms/microwatt/Kconfig"
+source "arch/powerpc/platforms/wiiu/Kconfig"
 
 config KVM_GUEST
 	bool "KVM Guest support"
diff --git a/arch/powerpc/platforms/Makefile b/arch/powerpc/platforms/Makefile
index 94470fb27c99..944ddd938711 100644
--- a/arch/powerpc/platforms/Makefile
+++ b/arch/powerpc/platforms/Makefile
@@ -24,3 +24,4 @@ obj-$(CONFIG_EMBEDDED6xx)	+= embedded6xx/
 obj-$(CONFIG_AMIGAONE)		+= amigaone/
 obj-$(CONFIG_PPC_BOOK3S)	+= book3s/
 obj-$(CONFIG_PPC_MICROWATT)	+= microwatt/
+obj-$(CONFIG_WIIU)		+= wiiu/
diff --git a/arch/powerpc/platforms/wiiu/Kconfig b/arch/powerpc/platforms/wiiu/Kconfig
new file mode 100644
index 000000000000..3834834c6bd7
--- /dev/null
+++ b/arch/powerpc/platforms/wiiu/Kconfig
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config WIIU
+	bool "Nintendo Wii U"
+	depends on PPC_BOOK3S_32
+	help
+	  Select WIIU if configuring for the Nintendo Wii U.
+	  More information at: <https://linux-wiiu.org/>
diff --git a/arch/powerpc/platforms/wiiu/Makefile b/arch/powerpc/platforms/wiiu/Makefile
new file mode 100644
index 000000000000..f66554cd5c45
--- /dev/null
+++ b/arch/powerpc/platforms/wiiu/Makefile
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0
-- 
2.38.1

