Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F08B65EF706
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 16:00:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdZkG04x8z3cdJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 00:00:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SZpEN4qh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdZjh4kkjz306m
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 23:59:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SZpEN4qh;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MdZjg3dbDz4xGh;
	Thu, 29 Sep 2022 23:59:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664459975;
	bh=FCsI0ArR7ugiZO3kSBMmYhsqk2/yCXdNDcNCs3JXOUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SZpEN4qhqYQPF1JtrWEFz17V/gjMUpHoJDkaC+bexz206VNnn2SBrwTFYzdZ7Q7b3
	 SlKfhEwvvVTM1dMCCZzC52bOK6W2TG5V992zgr2RPd2YYhR4IO6A2OlSB6L3ijrulq
	 KSxFNh4t2xcKUwDb2HKrN0Fl1lclTX0pY5mzAU65g/2HWuMhS77TDO2us4k1GpYJLC
	 mr0QTk1azSmdujm4RoBvdCX7zDRdfDUl/JQWm6C538/HjLvhj+nbcNrnZFAzp6Ovjg
	 Zwfg8Vos9zI41XNOYDyxkfFm8fhsFuLUzdhLqYxDYMHYouLpjO0VWqxFIzffwkDNBL
	 sXIDDN3FmHRGA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 4/6] powerpc: Add device-tree model to the hardware description
Date: Thu, 29 Sep 2022 23:59:17 +1000
Message-Id: <20220929135919.1983269-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929135919.1983269-1-mpe@ellerman.id.au>
References: <20220929135919.1983269-1-mpe@ellerman.id.au>
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

