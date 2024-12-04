Return-Path: <linuxppc-dev+bounces-3807-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B91B9E4917
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 00:31:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3Ygp1Nv5z30TL;
	Thu,  5 Dec 2024 10:31:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733355094;
	cv=none; b=PQBJlQr4XWsc3jS+tiG9hA/dUlk3hUocm+EoKnwR/ODoiYbWeY9tMZnyZIYyqPU57mR5Dxnvp3LS6AXGlgdvMiaJQepL/yMUX5CHeJwlm1agqWW8+1sMqSLWr+fhP37ob3Hm1WNG4I99Furc4Uq5jaqwRiEkOpLkK3gX2b3LzzpI4oyaIg8VZQ1f9Zy74Ofu+FGtkeWgcydS0zBI+1xV1V8iG6gYrpGSCeVN168JCsz7sPk3LaezvI95ZcbiASAjOWA5Jr58l+9nPRCrZkrexuZogK+mUDJoQonS52TNMfJryXWsupK1UlYv8ByM5yNsNOtKf0KjG03tipbdZZH14A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733355094; c=relaxed/relaxed;
	bh=aCK7pQH9MMOOAhaZ/c/vuccYyA7ea5M/YvZQjw+BQMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cyO61LSulc8nRKZmk0VEYTc7d1Ro6aKj+5L+cjKf6qS+E2ZxryCa7fta0R8lZzWObAizIqVj08GUaHL5h6KWXP9puRQbikSMoSdTGy/UnbHLGmFVnssQrNsmj9P5JC2Xu2A4MwzcFFz3xoTKvIoYdb+t4lFuamrq9PFCDSDaF8uC9Vjj4ahigICkDqyEpO0oicwCd9ne7jb6f6XCBYnrU3ZIU2c5NGkuGWd0eV7xMuNYuNS9fLz+heQWamIDN3CTkCCdvM34/RkTzGg3L37IO89QTIgy+V00ZUIn8OsMosAAJzi62a0/Z+7M4ZshYUMQUbyItQnaZxXdYEy12NsHfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=akhXBz/Q; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=akhXBz/Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3Ygn1Ln7z309W
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 10:31:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 898A15C6943;
	Wed,  4 Dec 2024 23:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18529C4CED2;
	Wed,  4 Dec 2024 23:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733355091;
	bh=IpvscR4FRk2N9TooPIqTQd7K/6N/z5+Gt8qd9x6Md8s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=akhXBz/Qb89W3kGsbFe1wEc2CNPWL6T65wgHzpAH4mf8OF8kHyNSDWJoofXE/7Bkv
	 +DtlBJHohc2J+m2lOcgX6GmoB59gXFR/3ADCgcp+erjcnEwwkYRW931vqibZiseQ/3
	 rsY+THmolVxTT+QIzRoAi+kHmbQd5Y+LwAGwba+iXYxopfhT3CpCtbBflzPfN5Cvj1
	 OJ5Ka0iNpPk9/xFpw/TtolDtxK106rrPkkGPCHcNeQnASEs722wvYnpi4vk7T/9jCy
	 RwZwx+iMpnSHEEZCQWlaEcRrVwkGPBn+ezCqVu9i4XY+8iE2+sTR6kzEueOXO0Z2+T
	 JDhr0+IEl2PxQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Rob Herring <robh@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Sasha Levin <sashal@kernel.org>,
	jsavitz@redhat.com,
	aneesh.kumar@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 4.19 3/3] powerpc/prom_init: Fixup missing powermac #size-cells
Date: Wed,  4 Dec 2024 17:20:03 -0500
Message-ID: <20241204222006.2249186-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204222006.2249186-1-sashal@kernel.org>
References: <20241204222006.2249186-1-sashal@kernel.org>
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
X-stable-base: Linux 4.19.324
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
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
index 29a8087a49010..7a92794309e31 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -2742,7 +2742,7 @@ static void __init fixup_device_tree_chrp(void)
 #endif
 
 #if defined(CONFIG_PPC64) && defined(CONFIG_PPC_PMAC)
-static void __init fixup_device_tree_pmac(void)
+static void __init fixup_device_tree_pmac64(void)
 {
 	phandle u3, i2c, mpic;
 	u32 u3_rev;
@@ -2782,7 +2782,31 @@ static void __init fixup_device_tree_pmac(void)
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
@@ -3007,6 +3031,7 @@ static void __init fixup_device_tree(void)
 	fixup_device_tree_maple_memory_controller();
 	fixup_device_tree_chrp();
 	fixup_device_tree_pmac();
+	fixup_device_tree_pmac64();
 	fixup_device_tree_efika();
 	fixup_device_tree_pasemi();
 }
-- 
2.43.0


