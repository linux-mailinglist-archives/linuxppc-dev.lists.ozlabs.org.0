Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BF35F0663
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 10:28:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf3Kh2JWzz3cFT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 18:28:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RhXDMe+j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf3K91PzMz3btV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 18:28:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RhXDMe+j;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mf3K907b3z4xGl;
	Fri, 30 Sep 2022 18:28:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664526509;
	bh=Hz5Oi+CaYA2Oe0BxqU5l5ZnvEL76zRP5lVRSJIUwwUE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RhXDMe+jGXWhlEnnw1LSVAPHdyrWjOSeMvQgj75Z7stXABVNhQ5qxtyCdhEvPbe84
	 WyuklTk+mEaxH+foYQM9FeRsXyU0NsgVKlOEk4/mjZR23FHE73HRYvgKS5HUVGe+yD
	 Z4dcVV6ER3PreXO+B0w5+uDhAhDDzX2vPH7YJmi/Zj045QqGpTfeWiyY4eGQcNZMnT
	 yq3XY12J6XLzY4sHmO8dQfvNdzDtUOrq9GTi3W8lYIip5dnkf6chGuJe8C4szo+B3A
	 KEdxNJJ59HOzk4iX4AjcSpSYi8JWcGEl5K+O69XZy9fugBsiO4p00Mzt5lC4ofzO3S
	 dRMaKH1iXiuJg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v3 4/6] powerpc: Add device-tree model to the hardware description
Date: Fri, 30 Sep 2022 18:27:07 +1000
Message-Id: <20220930082709.55830-4-mpe@ellerman.id.au>
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

Add the model of the machine we're on to the hardware description, which
is printed at boot and in case of an oops.

eg: Hardware name: IBM,8247-22L

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/prom.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

v3: Drop "model:" tag for brevity.

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 83fc72202838..1eed87d954ba 100644
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
+		seq_buf_printf(&ppc_hw_desc, "%s ", prop);
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

