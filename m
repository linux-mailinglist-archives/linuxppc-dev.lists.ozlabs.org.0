Return-Path: <linuxppc-dev+bounces-3806-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEFB9E4914
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 00:31:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3Ygd0H7Cz30Tx;
	Thu,  5 Dec 2024 10:31:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733355084;
	cv=none; b=ALOYSMgkI7K/uTn+vqU0km6ro/OEAG9SoZ82Oe7+/ZV4JhKxeY2kzgm9Jt4J6jA/4zv1U8b6+Q4NHbMaaLsM7NVFQD5TPlGpQ4cnuXh5Czsvi5sfv4Y3R8mjg4BzsxlX8HveNrhYXoJduI3McFYkMbrAdZeQXWK6KLkvQ7DT2zUBNT6ihF6DEsjKqS+4MOMPYd/BTEofi4NDEuf5I8s7W7Yuxo5ygfheowkEw/uvKXhEMPmdbZ+KmlgulFFa4VP4m1p8k5wWMJ76KlsKhrEzJalMtmHM2zySN0Mm+lPBecG0TYaOyxCwPA6qJHnYrR5yk45SUty6rAtrMwzO8gdzvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733355084; c=relaxed/relaxed;
	bh=LJZHkXM3dpRTS1xpn7u+AstHgHCXCnbAbbq8fG/9tbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLyrEdezVg3a2tBmbD8sXhbSDMXJjz/+N2/W/FEurGbgr35CAAzMepmh3PCA56MSDes19elfVKxg3c3SCyFtayF8sjrsckXGysyBQeL1Pv2eJsktSsWND52q2ca477lUA4Ce3tH1iSXyVn22t7QuGZqXPN28h8QK8r2qasJHbz1u2cOmbbSAtifCTWTjeGyjRW6TPU2x/o+YvGv7GSM5VW6KS+4n1ADycx+WUo1rlDwUYwwmlsbs5BTwQfyFdpG6fP29+fq34NmiFAuKkC+xEtPuLFYGFzS9SPiWat8dx8jLZ3Zt40Rn26m6W//aIr8JslT/Gv4tIkzgktdnbreY+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a94rZvoR; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a94rZvoR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3Ygb57dmz309W
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 10:31:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9E484A41385;
	Wed,  4 Dec 2024 23:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67CCBC4CECD;
	Wed,  4 Dec 2024 23:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733355081;
	bh=UPDQbnLjFtIUDVYYo483+FCn6THQPTwzGxqrRVfxNtk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a94rZvoRbYs+lZ6QMSG+xv38yxT/rI9p110bdikgBKpFF3/8bq+VfLlWRD1oN+tQn
	 tkSfCKkFoH75RzrX/aeZWM6qF6v4GI2s7Byb+xRSpBOaO5DwsAa9hzVSSVs+CdzGb7
	 il899SbzPIz/zh/NElGwnTVwDpgruy5KT+zZ1VcP4uDqFvnZy4OnYi/gmPuJRDkZt0
	 kqfJzlIYINYhMGy9sIv+XfUvKp1wdFJYIuX3VnkoZ+zWST29/w5smSdcv3HitdoG02
	 WV25DJy1AIaUG+41d5KTBdtdBnD1lFH8XfuH8loSuVacCwXd9TNOLrxGXNF/+gmzdx
	 UtLzaDrJiNWrw==
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
Subject: [PATCH AUTOSEL 5.4 3/3] powerpc/prom_init: Fixup missing powermac #size-cells
Date: Wed,  4 Dec 2024 17:19:54 -0500
Message-ID: <20241204221956.2249103-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204221956.2249103-1-sashal@kernel.org>
References: <20241204221956.2249103-1-sashal@kernel.org>
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
X-stable-base: Linux 5.4.286
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
index 7f4e2c031a9ab..b7ef63614417d 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -2856,7 +2856,7 @@ static void __init fixup_device_tree_chrp(void)
 #endif
 
 #if defined(CONFIG_PPC64) && defined(CONFIG_PPC_PMAC)
-static void __init fixup_device_tree_pmac(void)
+static void __init fixup_device_tree_pmac64(void)
 {
 	phandle u3, i2c, mpic;
 	u32 u3_rev;
@@ -2896,7 +2896,31 @@ static void __init fixup_device_tree_pmac(void)
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
@@ -3121,6 +3145,7 @@ static void __init fixup_device_tree(void)
 	fixup_device_tree_maple_memory_controller();
 	fixup_device_tree_chrp();
 	fixup_device_tree_pmac();
+	fixup_device_tree_pmac64();
 	fixup_device_tree_efika();
 	fixup_device_tree_pasemi();
 }
-- 
2.43.0


