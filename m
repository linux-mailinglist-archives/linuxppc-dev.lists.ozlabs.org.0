Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0CE190113
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 23:29:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mTZV1F5RzDr0t
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 09:29:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BK9j0God; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mTXj4K41zDqpL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 09:27:49 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id m14so118174oic.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 15:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tmt/AtSQf/b1AfMKrhHYlgdsJf3jzbEQVXwlMTLV4uU=;
 b=BK9j0Godyj24t7Fh24qKYPTNIBwldF+AKe5Yhrr1AfBOcN8aG8EwvFxZbx3vpsFFVh
 B87k0TbZhIioXj2VyUHHcm/5XznanhVQ+ny95smNcJE4z28rUfToByS+f7/8MbWIENyQ
 eAyq1UDs8Rw6JgYLk/ie0RPDfZ/StIL63C+uQ6UX1/8wqr18nwx16fjUmAI5Fx3rmcoT
 JIXcrJ14x3c7gLEKDHf1e8HrDCZBbsPq4A/OU7NoAF8MLJiRRc1Huh6uixI3uIThDKO2
 y5NnLa0qxRQjO9bG0uqZreariGc++7WXpSM9JU2WP+lOUouk/RMP1iZRiKJ7dEWQhoHY
 k+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tmt/AtSQf/b1AfMKrhHYlgdsJf3jzbEQVXwlMTLV4uU=;
 b=uOttVYBtv2DTjE2r1ag8o3Amt87oDEnsUi0wHDOMiwFRWXSymbhj1Q504C6bxyiTQZ
 QBd7PIt3d4950lGLnZkKb9bWF26UETMfjy1c6EJKMoq9nqPY7vsEnabTsSwDDG4ij4h3
 aNmvTw+qXvj+in/BxctrqJqeJw3W0Ap2v3epMaA4pvx1wuZPt5rDID75Gtn7mr6L3fp0
 wEABCirvfThV/fbuu4TUK9ojR70YnPdfP8OASAtqaCwwXyIXFtDxNXqpBbm0SKT0MVk6
 IRYRi4BtDYX6XhEztzRoC8bkLhT3nS6AJ6aCf2WuEZYAUHR9Rz93Cwz1RH8emEyw7nAt
 pDzw==
X-Gm-Message-State: ANhLgQ0NiSYbTd5ZPOu7bSQGVOYlsVq2CjEDZi62brk35yaVfA5PyAsW
 ZF+q6pAq5syhOzdZz9cbzNU=
X-Google-Smtp-Source: ADFU+vsUUH/xlVPi4/C8Ryv+a8s7tKna64jEsgzR7P/5p5OxS/SoTVln/yBUQR6ydtxBXbp2e0RQhQ==
X-Received: by 2002:aca:3302:: with SMTP id z2mr1282962oiz.3.1585002466086;
 Mon, 23 Mar 2020 15:27:46 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id y9sm5708282oie.0.2020.03.23.15.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 15:27:45 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/maple: Fix declaration made after definition
Date: Mon, 23 Mar 2020 15:27:29 -0700
Message-Id: <20200323222729.15365-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
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
Cc: Ilie Halip <ilie.halip@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When building ppc64 defconfig, Clang errors (trimmed for brevity):

arch/powerpc/platforms/maple/setup.c:365:1: error: attribute declaration
must precede definition [-Werror,-Wignored-attributes]
machine_device_initcall(maple, maple_cpc925_edac_setup);
^

machine_device_initcall expands to __define_machine_initcall, which in
turn has the macro machine_is used in it, which declares mach_##name
with an __attribute__((weak)). define_machine actually defines
mach_##name, which in this file happens before the declaration, hence
the warning.

To fix this, move define_machine after machine_device_initcall so that
the declaration occurs before the definition, which matches how
machine_device_initcall and define_machine work throughout arch/powerpc.

While we're here, remove some spaces before tabs.

Fixes: 8f101a051ef0 ("edac: cpc925 MC platform device setup")
Link: https://godbolt.org/z/kDoYSA
Link: https://github.com/ClangBuiltLinux/linux/issues/662
Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Suggested-by: Ilie Halip <ilie.halip@gmail.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 arch/powerpc/platforms/maple/setup.c | 34 ++++++++++++++--------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/platforms/maple/setup.c b/arch/powerpc/platforms/maple/setup.c
index 6f019df37916..15b2c6eb506d 100644
--- a/arch/powerpc/platforms/maple/setup.c
+++ b/arch/powerpc/platforms/maple/setup.c
@@ -291,23 +291,6 @@ static int __init maple_probe(void)
 	return 1;
 }
 
-define_machine(maple) {
-	.name			= "Maple",
-	.probe			= maple_probe,
-	.setup_arch		= maple_setup_arch,
-	.init_IRQ		= maple_init_IRQ,
-	.pci_irq_fixup		= maple_pci_irq_fixup,
-	.pci_get_legacy_ide_irq	= maple_pci_get_legacy_ide_irq,
-	.restart		= maple_restart,
-	.halt			= maple_halt,
-       	.get_boot_time		= maple_get_boot_time,
-       	.set_rtc_time		= maple_set_rtc_time,
-       	.get_rtc_time		= maple_get_rtc_time,
-      	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= maple_progress,
-	.power_save		= power4_idle,
-};
-
 #ifdef CONFIG_EDAC
 /*
  * Register a platform device for CPC925 memory controller on
@@ -364,3 +347,20 @@ static int __init maple_cpc925_edac_setup(void)
 }
 machine_device_initcall(maple, maple_cpc925_edac_setup);
 #endif
+
+define_machine(maple) {
+	.name			= "Maple",
+	.probe			= maple_probe,
+	.setup_arch		= maple_setup_arch,
+	.init_IRQ		= maple_init_IRQ,
+	.pci_irq_fixup		= maple_pci_irq_fixup,
+	.pci_get_legacy_ide_irq	= maple_pci_get_legacy_ide_irq,
+	.restart		= maple_restart,
+	.halt			= maple_halt,
+	.get_boot_time		= maple_get_boot_time,
+	.set_rtc_time		= maple_set_rtc_time,
+	.get_rtc_time		= maple_get_rtc_time,
+	.calibrate_decr		= generic_calibrate_decr,
+	.progress		= maple_progress,
+	.power_save		= power4_idle,
+};
-- 
2.26.0

