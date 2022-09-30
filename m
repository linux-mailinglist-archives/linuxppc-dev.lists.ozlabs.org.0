Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A9F5F0672
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 10:31:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf3N94pqWz3f9q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 18:31:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nhy6E9Wt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf3K94pZ6z3c2q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 18:28:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nhy6E9Wt;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mf3K944XMz4xGm;
	Fri, 30 Sep 2022 18:28:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664526509;
	bh=cuRe7ACngr4EwXps7keAtmm1T8/1oPEFS+upHj1ONDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nhy6E9WtULvQFqG5tZw8Y7c6v/+GGZl94vVE5w58Kt7x3CzAWlXGt1sW3B6PXAvUu
	 v4R72nV6KTxPJN1KnCp/ne5lqQHUX4hYwLvdMIe3Ym58ngFzrgQReBu1+HcHhC8H/v
	 qHaM7vkTggySfIbocave302USAvT4vA6NczBXvhGHUsRfv04JQv01z9qBLzneQUFZn
	 ANOpn741AKjI3daiLye6Wen7T2nfpcEDYoreRnpko/3n4SyVRr8BKQ8UplRrtx35S6
	 EHrbJ5w/x+IEP2CKJOgZiNSydfhldJ/SryY5G2K2Huwqr8U7pl7i0xywSKowXFxUhN
	 638XmNJw9nOaQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v3 5/6] powerpc/powernv: Add opal details to the hardware description
Date: Fri, 30 Sep 2022 18:27:08 +1000
Message-Id: <20220930082709.55830-5-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220930082709.55830-1-mpe@ellerman.id.au>
References: <20220930082709.55830-1-mpe@ellerman.id.au>
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
Cc: nathanl@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add OPAL version details to the hardware description, which is printed
at boot and in case of an oops.

eg: Hardware name: ... opal:v6.2

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/powernv/setup.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

v3: Drop quotes for brevity.

diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index dac545aa0308..61ab2d38ff4b 100644
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
@@ -207,8 +208,29 @@ static void __init pnv_setup_arch(void)
 	pnv_rng_init();
 }
 
+static void __init pnv_add_hw_description(void)
+{
+	struct device_node *dn;
+	const char *s;
+
+	dn = of_find_node_by_path("/ibm,opal/firmware");
+	if (!dn)
+		return;
+
+	if (of_property_read_string(dn, "version", &s) == 0 ||
+	    of_property_read_string(dn, "git-id", &s) == 0)
+		seq_buf_printf(&ppc_hw_desc, "opal:%s ", s);
+
+	if (of_property_read_string(dn, "mi-version", &s) == 0)
+		seq_buf_printf(&ppc_hw_desc, "mi:%s ", s);
+
+	of_node_put(dn);
+}
+
 static void __init pnv_init(void)
 {
+	pnv_add_hw_description();
+
 	/*
 	 * Initialize the LPC bus now so that legacy serial
 	 * ports can be found on it
-- 
2.37.3

