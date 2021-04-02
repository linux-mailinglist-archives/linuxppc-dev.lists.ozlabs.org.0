Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C98352BAC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 17:19:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBkGz4pq5z3c59
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 02:19:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBkFv011Qz3brL
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Apr 2021 02:18:08 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkFl3Jq5z9v2m1;
 Fri,  2 Apr 2021 17:18:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id otY6ACZI1rY1; Fri,  2 Apr 2021 17:18:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkFl2Mpwz9v2ls;
 Fri,  2 Apr 2021 17:18:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 33C168BB7B;
 Fri,  2 Apr 2021 17:18:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id j0ftI9D6qL0u; Fri,  2 Apr 2021 17:18:05 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A27078BB79;
 Fri,  2 Apr 2021 17:18:04 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7ECCA67989; Fri,  2 Apr 2021 15:18:04 +0000 (UTC)
Message-Id: <76542a49b685ddb41894fd53feb250fcec731b01.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 03/20] x86/efi: Replace CONFIG_CMDLINE_OVERRIDE by
 CONFIG_CMDLINE_FORCE
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Date: Fri,  2 Apr 2021 15:18:04 +0000 (UTC)
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
 microblaze <monstr@monstr.eu>, linux-xtensa@linux-xtensa.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, nios2 <ley.foon.tan@intel.com>,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, openrisc@lists.librecores.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

During boot, x86 uses EFI driver. That driver is also used
by ARM.

In order to refactor the command line processing in that driver
in a following patch, rename CONFIG_CMDLINE_OVERRIDE by
CONFIG_CMDLINE_FORCE on the x86 in order to be similar
to ARM (and most other architectures).

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v4: New
---
 arch/x86/Kconfig                        | 4 ++--
 arch/x86/kernel/setup.c                 | 2 +-
 drivers/firmware/efi/libstub/x86-stub.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 2792879d398e..a20684d56b4b 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2384,14 +2384,14 @@ config CMDLINE
 	  command line at boot time, it is appended to this string to
 	  form the full kernel command line, when the system boots.
 
-	  However, you can use the CONFIG_CMDLINE_OVERRIDE option to
+	  However, you can use the CONFIG_CMDLINE_FORCE option to
 	  change this behavior.
 
 	  In most cases, the command line (whether built-in or provided
 	  by the boot loader) should specify the device for the root
 	  file system.
 
-config CMDLINE_OVERRIDE
+config CMDLINE_FORCE
 	bool "Built-in command line overrides boot loader arguments"
 	depends on CMDLINE_BOOL && CMDLINE != ""
 	help
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index d883176ef2ce..6f2de58eeb54 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -884,7 +884,7 @@ void __init setup_arch(char **cmdline_p)
 	bss_resource.end = __pa_symbol(__bss_stop)-1;
 
 #ifdef CONFIG_CMDLINE_BOOL
-#ifdef CONFIG_CMDLINE_OVERRIDE
+#ifdef CONFIG_CMDLINE_FORCE
 	strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
 #else
 	if (builtin_cmdline[0]) {
diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
index f14c4ff5839f..28659276b6ba 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -742,7 +742,7 @@ unsigned long efi_main(efi_handle_t handle,
 		goto fail;
 	}
 #endif
-	if (!IS_ENABLED(CONFIG_CMDLINE_OVERRIDE)) {
+	if (!IS_ENABLED(CONFIG_CMDLINE_FORCE)) {
 		unsigned long cmdline_paddr = ((u64)hdr->cmd_line_ptr |
 					       ((u64)boot_params->ext_cmd_line_ptr << 32));
 		status = efi_parse_options((char *)cmdline_paddr);
-- 
2.25.0

