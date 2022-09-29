Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D70535EF770
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 16:25:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdbHk3BC5z3cfg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 00:25:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cAnvC3Vl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdbFK1zkKz3bSX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 00:23:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cAnvC3Vl;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MdbFK1Bmdz4xGh;
	Fri, 30 Sep 2022 00:23:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664461413;
	bh=FCsI0ArR7ugiZO3kSBMmYhsqk2/yCXdNDcNCs3JXOUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cAnvC3VlCPfkLZAS5qzkWbpEq+y7T0KgfmYejSJC3Bad0xXsgTc2VfDNb2OtuR8nC
	 xgSq09Ts9MkCWB66fx35Q4Xl/3T7XXWJLs8N0JAptXO5tD7TH0sFFDw5k71ZgTSlU9
	 kALuIDcPkpGVb4ZTKG0v9GMG3oAk47JZBL/PHNdfMCMRCP2Z6pE/WKqCn5/jUV3FEE
	 4APNz23qcBWUwGlvvoQDG8jgkt5le6ORquLMe2fEcF0Nu4Q8JSzEFOl1O0SVc2iAhs
	 bzbDXDnLi4RbupljASzZUQOLOHkeSC+XiEJFs/kLztd5qZHlYIWmi93EuukqaxZX1+
	 Tg+L0Pk+hk2Sg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 4/6] powerpc: Add device-tree model to the hardware description
Date: Fri, 30 Sep 2022 00:22:49 +1000
Message-Id: <20220929142251.1987025-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929142251.1987025-1-mpe@ellerman.id.au>
References: <20220929142251.1987025-1-mpe@ellerman.id.au>
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

Add the model of the machine we're on to the hardware description, which
is printed at boot and in case of an oops.

eg: Hardware name: model:'IBM,8247-22L'

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/prom.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 8c4cce6dc1e8..93315c6483de 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -715,6 +715,23 @@ static void __init tm_init(void)
 static void tm_init(void) { }
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
 
+static int __init
+early_init_dt_scan_model(unsigned long node, const char *uname,
+			 int depth, void *data)
+{
+	const char *prop;
+
+	if (depth != 0)
+		return 0;
+
+	prop = of_get_flat_dt_prop(node, "model", NULL);
+	if (prop)
+		seq_buf_printf(&ppc_hw_desc, "model:'%s' ", prop);
+
+	/* break now */
+	return 1;
+}
+
 #ifdef CONFIG_PPC64
 static void __init save_fscr_to_task(void)
 {
@@ -743,6 +760,8 @@ void __init early_init_devtree(void *params)
 	if (!early_init_dt_verify(params))
 		panic("BUG: Failed verifying flat device tree, bad version?");
 
+	of_scan_flat_dt(early_init_dt_scan_model, NULL);
+
 #ifdef CONFIG_PPC_RTAS
 	/* Some machines might need RTAS info for debugging, grab it now. */
 	of_scan_flat_dt(early_init_dt_scan_rtas, NULL);
-- 
2.37.3

