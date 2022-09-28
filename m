Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C52BD5EDDF9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 15:42:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McyNW4Gw8z3c7l
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 23:42:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=o9Ilw5vK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McyL90Tz8z3bkb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 23:40:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=o9Ilw5vK;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4McyL86wWKz4xGH;
	Wed, 28 Sep 2022 23:40:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664372433;
	bh=Y1C3ki1GevbbthhRELULS4p8sdE1ZmXzWqPGNPp0Pzk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=o9Ilw5vKaTMcPFB5ZLHkevBQLThKD/cbilBGTQU2cjhrpLPJNeyIpRvEMjXctXehw
	 192TzTKXirYsI0ooHvK/haNYaKE4SmxVqoglKzRgJ54NxqSJYWKX9+/H8euR+CsoI2
	 8YlTXunjCCZUtbH9XeK3k5ZfGpafX6/W0WjXMsxoSgtmyp3HAktL/SPPX3ZP/XVMA7
	 CKObBpyjdNnDYdNZuw8PYIcstCgo7sn5x22/WHJc/CoQRcf9CDZA7pDNozJEvXzGUd
	 8KmZ5tM2o2GrbXuTPhMqROJTu1CnATHC6+X25F1Jq1fELGFTqW5NLRLKATd7U0PkA6
	 LPyI4xxmIn2NA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 5/6] powerpc/powernv: Add opal details to dump stack arch description
Date: Wed, 28 Sep 2022 23:40:24 +1000
Message-Id: <20220928134025.1739909-5-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928134025.1739909-1-mpe@ellerman.id.au>
References: <20220928134025.1739909-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add OPAL version details to the dump stack arch description, which is
printed in case of an oops.

eg: Hardware name: ... opal:v6.2

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/powernv/setup.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index dac545aa0308..fddc61ec1d5b 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -17,6 +17,7 @@
 #include <linux/console.h>
 #include <linux/delay.h>
 #include <linux/irq.h>
+#include <linux/seq_buf.h>
 #include <linux/seq_file.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
@@ -207,8 +208,33 @@ static void __init pnv_setup_arch(void)
 	pnv_rng_init();
 }
 
+static void __init pnv_add_dump_stack_arch_desc(void)
+{
+	struct device_node *dn;
+	const char *version;
+
+	dn = of_find_node_by_path("/ibm,opal/firmware");
+	if (!dn)
+		return;
+
+	version = of_get_property(dn, "version", NULL);
+	if (!version)
+		version = of_get_property(dn, "git-id", NULL);
+
+	if (version)
+		seq_buf_printf(&ppc_hw_desc, "opal:%s", version);
+
+	version = of_get_property(dn, "mi-version", NULL);
+	if (version)
+		seq_buf_printf(&ppc_hw_desc, "mi:%s", version);
+
+	of_node_put(dn);
+}
+
 static void __init pnv_init(void)
 {
+	pnv_add_dump_stack_arch_desc();
+
 	/*
 	 * Initialize the LPC bus now so that legacy serial
 	 * ports can be found on it
-- 
2.37.3

