Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F20432A7EB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 18:27:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqkbV3z2cz3dcl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 04:27:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqkY24p0hz30NS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 04:25:26 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DqkXx1fpcz9v1C3;
 Tue,  2 Mar 2021 18:25:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sT1ZG-RjsZzl; Tue,  2 Mar 2021 18:25:21 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DqkXx0pQZz9v1Bx;
 Tue,  2 Mar 2021 18:25:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D91F38B7B5;
 Tue,  2 Mar 2021 18:25:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id J4vFCr8DsRjb; Tue,  2 Mar 2021 18:25:22 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 849C58B75F;
 Tue,  2 Mar 2021 18:25:22 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 5FB57674A2; Tue,  2 Mar 2021 17:25:22 +0000 (UTC)
Message-Id: <2eb6fad3470256fff5c9f33cd876f344abb1628b.1614705851.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1614705851.git.christophe.leroy@csgroup.eu>
References: <cover.1614705851.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 6/7] cmdline: Gives architectures opportunity to use
 generically defined boot cmdline manipulation
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 danielwa@cisco.com, robh@kernel.org, daniel@gimpelevich.san-francisco.ca.us
Date: Tue,  2 Mar 2021 17:25:22 +0000 (UTC)
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
Cc: linux-arch@vger.kernel.org, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Most architectures have similar boot command line manipulation
options. This patchs adds the definition in init/Kconfig, gated by
CONFIG_HAVE_CMDLINE that the architectures can select to use them.

In order to use this, a few architectures will have to change their
CONFIG options:
- riscv has to replace CMDLINE_FALLBACK by CMDLINE_FROM_BOOTLOADER
- architectures using CONFIG_CMDLINE_OVERRIDE or
CONFIG_CMDLINE_OVERWRITE have to replace them by CONFIG_CMDLINE_FORCE.

Architectures also have to define CONFIG_DEFAULT_CMDLINE.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 init/Kconfig | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index 22946fe5ded9..a0f2ad9467df 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -117,6 +117,62 @@ config INIT_ENV_ARG_LIMIT
 	  Maximum of each of the number of arguments and environment
 	  variables passed to init from the kernel command line.
 
+config HAVE_CMDLINE
+	bool
+
+config CMDLINE_BOOL
+	bool "Default bootloader kernel arguments"
+	depends on HAVE_CMDLINE
+	help
+	  On some platforms, there is currently no way for the boot loader to
+	  pass arguments to the kernel. For these platforms, you can supply
+	  some command-line options at build time by entering them here.  In
+	  most cases you will need to specify the root device here.
+
+config CMDLINE
+	string "Initial kernel command string"
+	depends on CMDLINE_BOOL
+	default DEFAULT_CMDLINE
+	help
+	  On some platforms, there is currently no way for the boot loader to
+	  pass arguments to the kernel. For these platforms, you can supply
+	  some command-line options at build time by entering them here.  In
+	  most cases you will need to specify the root device here.
+
+choice
+	prompt "Kernel command line type" if CMDLINE != ""
+	default CMDLINE_FROM_BOOTLOADER
+	help
+	  Selects the way you want to use the default kernel arguments.
+
+config CMDLINE_FROM_BOOTLOADER
+	bool "Use bootloader kernel arguments if available"
+	help
+	  Uses the command-line options passed by the boot loader. If
+	  the boot loader doesn't provide any, the default kernel command
+	  string provided in CMDLINE will be used.
+
+config CMDLINE_EXTEND
+	bool "Extend bootloader kernel arguments"
+	help
+	  The default kernel command string will be appended to the
+	  command-line arguments provided during boot.
+
+config CMDLINE_PREPEND
+	bool "Prepend bootloader kernel arguments"
+	help
+	  The default kernel command string will be prepend to the
+	  command-line arguments provided during boot.
+
+config CMDLINE_FORCE
+	bool "Always use the default kernel command string"
+	help
+	  Always use the default kernel command string, even if the boot
+	  loader passes other arguments to the kernel.
+	  This is useful if you cannot or don't want to change the
+	  command-line options your boot loader passes to the kernel.
+endchoice
+
 config COMPILE_TEST
 	bool "Compile also drivers which will not load"
 	depends on !UML && !S390
-- 
2.25.0

