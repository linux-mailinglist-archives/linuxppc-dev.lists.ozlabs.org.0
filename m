Return-Path: <linuxppc-dev+bounces-3556-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5A79D9089
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2024 03:57:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xy6gJ696sz2xr4;
	Tue, 26 Nov 2024 13:57:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732589836;
	cv=none; b=LXOXD49CCHIrxpy9JztW5PXTH10pmMQKhCOKxnEBR1yk1wFTn23r+DNZ04VZ65OPLS4rMn8Xf8GM45ihaeqV5IP6DZ52nuNzCiISdJHpyG4jNRx/308sBnPVwdutW6xRm5J48e9jDnxpQFVLM8KpxIgyeYDdAvG9f75VUfuObc6RqgYL5Q2qXqpIE0eT2DP+nfgBDLCMpsIKcPYkCmlMpU5Ur2w4oQw2MiE5Oa+N34c8nuDjKQiSjX4IYVRsmkqLLBA+HeLFyu0XMpzQGJPYTwKPhoXiQXvCWq7OJ4jZEIrqVH76dNM9Y1qcsLxoUCZYKimuuQNSJgrG//EXBaPfRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732589836; c=relaxed/relaxed;
	bh=M1EXjRSBmP+TbGxC4zWxWzgMAO1bJQeJ9HrvP6LtBWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uofa+SO+AISYMzeHP7PX7GFYs5OvJ0h4qxlupe8WXde6QgTt53ywoqvwThhaO8G3rJOH2L6+Jw6NQ+I5tlpEZ786xO+I50rEUleGlytph5JbxzY7CDlEvuYGDHGy+G9xwXXPm+IuB/39Gwl3/UM+9o1wRi1ESEoDNALGerUVrg2sUMsQYR1LoQIMSQgJCTB3cu6bZOb83dtiChhT5flADqzX9tU8boeHw9L1lB23ghzFErknbu+zYRwH/I/sBRfQPDlJ5EHFjmduI/4Rp33owH0TdExNYYgmuLPODdWm2dKhlu35FuPGKweOacUBfcW96GVWzs5uqa5AqV4+x0lQ1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qhJIQKQK; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qhJIQKQK;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xy6gG1Nn5z2xps
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 13:57:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1732589830;
	bh=M1EXjRSBmP+TbGxC4zWxWzgMAO1bJQeJ9HrvP6LtBWs=;
	h=From:To:Cc:Subject:Date:From;
	b=qhJIQKQKLTQaD+QnmtrGCL1EMknmPlAIm2ZuL3DNNdreJusuadCrpFcTwpJkB4Hs4
	 euIHgc3/iY0KOIjx+pltpm38SrITbir/fz43bV7xEhJnYFBrgjfxTT4rFPW3SDg/MM
	 GONOTy0X0l0gToTZb19LiQylSM6wUBJE98JuAFaXpZ+2ozi4qAO9wWQJuYsGpUo4ik
	 k1CLMT/WVyqsgu4rAMt7D44vpumDR4j8VmhVlI4TZk/7Y/Jr05jk6zkSwqLXMFtA3Z
	 uO4kemJGzo97mLVjqZMzXftHPfFTbdHiO5GJhszWl0iPf/pe3MJJlbXQbfwrjsWyky
	 OA5K+nja/Pw3A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xy6gB3dMjz4wyV;
	Tue, 26 Nov 2024 13:57:10 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <robh@kernel.org>,
	saravanak@google.com,
	<linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH] powerpc/prom_init: Fixup missing powermac #size-cells
Date: Tue, 26 Nov 2024 13:57:10 +1100
Message-ID: <20241126025710.591683-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
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

On some powermacs `escc` nodes are missing `#size-cells` properties,
which is deprecated and now triggers a warning at boot since commit
045b14ca5c36 ("of: WARN on deprecated #address-cells/#size-cells
handling").

For example:

  Missing '#size-cells' in /pci@f2000000/mac-io@c/escc@13000
  WARNING: CPU: 0 PID: 0 at drivers/of/base.c:133 of_bus_n_size_cells+0x98/0x108
  Hardware name: PowerMac3,1 7400 0xc0209 PowerMac
  ...
  Call Trace:
    of_bus_n_size_cells+0x98/0x108 (unreliable)
    of_bus_default_count_cells+0x40/0x60
    __of_get_address+0xc8/0x21c
    __of_address_to_resource+0x5c/0x228
    pmz_init_port+0x5c/0x2ec
    pmz_probe.isra.0+0x144/0x1e4
    pmz_console_init+0x10/0x48
    console_init+0xcc/0x138
    start_kernel+0x5c4/0x694

As powermacs boot via prom_init it's possible to add the missing
properties to the device tree during boot, avoiding the warning. Note
that `escc-legacy` nodes are also missing `#size-cells` properties, but
they are skipped by the macio driver, so leave them alone.

Depends-on: 045b14ca5c36 ("of: WARN on deprecated #address-cells/#size-cells handling")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/prom_init.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 73210e5bcfa7..8e776ba39497 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -2848,7 +2848,7 @@ static void __init fixup_device_tree_chrp(void)
 #endif
 
 #if defined(CONFIG_PPC64) && defined(CONFIG_PPC_PMAC)
-static void __init fixup_device_tree_pmac(void)
+static void __init fixup_device_tree_pmac64(void)
 {
 	phandle u3, i2c, mpic;
 	u32 u3_rev;
@@ -2888,7 +2888,31 @@ static void __init fixup_device_tree_pmac(void)
 		     &parent, sizeof(parent));
 }
 #else
-#define fixup_device_tree_pmac()
+#define fixup_device_tree_pmac64()
+#endif
+
+#ifdef CONFIG_PPC_PMAC
+static void __init fixup_device_tree_pmac(void)
+{
+	__be32 val = 1;
+	char type[8];
+	phandle node;
+
+	// Some pmacs are missing #size-cells on escc nodes
+	for (node = 0; prom_next_node(&node); ) {
+		type[0] = '\0';
+		prom_getprop(node, "device_type", type, sizeof(type));
+		if (prom_strcmp(type, "escc"))
+			continue;
+
+		if (prom_getproplen(node, "#size-cells") != PROM_ERROR)
+			continue;
+
+		prom_setprop(node, NULL, "#size-cells", &val, sizeof(val));
+	}
+}
+#else
+static inline void fixup_device_tree_pmac(void) { }
 #endif
 
 #ifdef CONFIG_PPC_EFIKA
@@ -3111,6 +3135,7 @@ static void __init fixup_device_tree(void)
 {
 	fixup_device_tree_chrp();
 	fixup_device_tree_pmac();
+	fixup_device_tree_pmac64();
 	fixup_device_tree_efika();
 	fixup_device_tree_pasemi();
 }
-- 
2.47.0


