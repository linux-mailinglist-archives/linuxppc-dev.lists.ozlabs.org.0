Return-Path: <linuxppc-dev+bounces-3805-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E74559E4912
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 00:31:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3YgQ5nVkz30TH;
	Thu,  5 Dec 2024 10:31:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733355074;
	cv=none; b=g02JgLqT3DpZUNB00pPkSKf0OtnDk8OjvToF9qx78TMBbfNVddM8QA1MzztQsFjRLG9NSa6kiCIC/rrAvjqTMmnXpwAPHawAb6rIkclQn3JpmlwprbCCG8s7M1DXNVvAmldacpuc2zYJutX2JIZeOP2eZS1EcR/DtWTpz6cV37rCEfkwwxxZKj+8x36Xae8e7qAGJ7TGnVCabEew88uUK2yg+CVgznO1Fjh9LYDbdVrcu22HddotN8AfpOYaVpzaYo1FDBcT3dqmbvv1WkeY4fohFgNuAlXEW9r294VN+jHoEhVg6HCF+CJH8z5c5sZ7IqDtuhYV4g6Rvr40ZEb4iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733355074; c=relaxed/relaxed;
	bh=w5UobfL3u35oDlcbf4bUb4LLuv2mByJqmbFgyB1f0Es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=byeHKQDB557L5XmTcUr2dijc7TiOilpAbX1nac/cgYNMWw0Zgy3AkI8n0GCTq30K8nB+82injuugunQxQgccI3uKm4JUGsGWWkrhpEy+tDjDCLJ2M5VR59mx2/m0sgEawqsfRh/Jp+p7mvHOZyNyDg1Vs/JtjkpYygnovMtdAUyYTSvjITEPph5zQCRmtQ8uMojTkTc3IdoPVQUUM7k9efy+DYHeueFiRuUGDDtEEki/LJN0FxpSj1knNQ+9Mi3K8Hy217JqRW65QE0/HtrclE5RT3cmvmyDQecVy7IqA91726vlqtUglqtcnNNjtRBwyVYUj6ZX4lO0xJHi+WKu8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sh5+Quke; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sh5+Quke;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3YgP4qNNz309W
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 10:31:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 153845C691D;
	Wed,  4 Dec 2024 23:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F28CC4CECD;
	Wed,  4 Dec 2024 23:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733355071;
	bh=Rqv8PAnLxCn/JuTd8rNS5MhALsZrjXXeyh7vtZlHNAk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sh5+Quke1fl3i5m8vh8ycqJnwhz0y1ubM/VlLXJWNyN6zV6/FJLl0WFfsgJRDUeiL
	 dILEcdTktrH+Va7ba3gYhrrH9ZMXCXbrhlVXqZSCixTrfGgOtD4Q1cNV7KV0qXJ8Yw
	 nlktAO3SdlphUqBCIt7Rvp446Rp7m9/YPsfnQhQV4dVdox0Yj0yO66/VJZ1av13L/W
	 pYj0HwNztttFOTG/BXw9cVFd7Aih+Jvyr7638gyHjpGH3fDRWs6xCGCj+kbzgiUTL2
	 j7jlWPmfSkJkpKgP3PXc2IG8a2nyBD0YWFbVW3y+DtRIYcvp+xyVVd4lnlXjN52eFe
	 dw9datVJp6VyA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Rob Herring <robh@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Sasha Levin <sashal@kernel.org>,
	aneesh.kumar@kernel.org,
	jsavitz@redhat.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 5.10 5/5] powerpc/prom_init: Fixup missing powermac #size-cells
Date: Wed,  4 Dec 2024 17:19:38 -0500
Message-ID: <20241204221942.2248973-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204221942.2248973-1-sashal@kernel.org>
References: <20241204221942.2248973-1-sashal@kernel.org>
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
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.230
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit cf89c9434af122f28a3552e6f9cc5158c33ce50a ]

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
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Link: https://patch.msgid.link/20241126025710.591683-1-mpe@ellerman.id.au
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/prom_init.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 6f7ad80763159..9a753c4dafab6 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -2894,7 +2894,7 @@ static void __init fixup_device_tree_chrp(void)
 #endif
 
 #if defined(CONFIG_PPC64) && defined(CONFIG_PPC_PMAC)
-static void __init fixup_device_tree_pmac(void)
+static void __init fixup_device_tree_pmac64(void)
 {
 	phandle u3, i2c, mpic;
 	u32 u3_rev;
@@ -2934,7 +2934,31 @@ static void __init fixup_device_tree_pmac(void)
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
@@ -3159,6 +3183,7 @@ static void __init fixup_device_tree(void)
 	fixup_device_tree_maple_memory_controller();
 	fixup_device_tree_chrp();
 	fixup_device_tree_pmac();
+	fixup_device_tree_pmac64();
 	fixup_device_tree_efika();
 	fixup_device_tree_pasemi();
 }
-- 
2.43.0


