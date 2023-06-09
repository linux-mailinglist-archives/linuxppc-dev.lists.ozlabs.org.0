Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF37372A24B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 20:32:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qd8nh51w0z3fqV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 04:32:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.52; helo=mail-io1-f52.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qd8nC3p81z3dw2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 04:31:59 +1000 (AEST)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-777a8f11e14so117533739f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jun 2023 11:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686335517; x=1688927517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tXMDtdWN6nJZldqwpEUd7GnDVKNRMg93Z/FFZjfMFDo=;
        b=jSDqt6X0sTY6mSk4zYwgrYTh1A26QCzPR33HWg2jO4vlF9WvN4XetU3R56JyxV1wJa
         hOJdDuCJEf1nKbGvn861V0eWJJlsgdp/Pln7h78P1ixA+ukqDdd6sd2LTGuG+rsOB9Sa
         Uyoe1WhIx6QUy6734968nWkr7XU/C0zUumeA2EZGNVQgmNCVFfhGmJB782jYpF7t55K9
         Luez98TA78dNcEaF2X5YgJZ6ZfcBYCWRIH72RR9+CP5VH906vg5kIFr72XIwzLgMGYTW
         dLw5Gmpcxvkg/J7uLAHos1zJdbgdXz2yz5iFvE/9Bf12CvJKbaTa71ZzV6SV70rkCqr9
         6IBA==
X-Gm-Message-State: AC+VfDxcZMurFFDejtgGgcVRj+5x2+j1bOaip4UhgATzQyn1Yz4sLsLC
	4s97lMUNgj6Us+uqh19WHw==
X-Google-Smtp-Source: ACHHUZ6BKEOfSW1H9tTyJANStK6mB/D2kcTclumsnvDTg5+rXrM1pBhCQZNmiN2c2Tm8s0XDxwJlew==
X-Received: by 2002:a5d:925a:0:b0:777:de8a:79a with SMTP id e26-20020a5d925a000000b00777de8a079amr3556373iol.7.1686335517420;
        Fri, 09 Jun 2023 11:31:57 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id y9-20020a02c009000000b004209b1863c4sm1097473jai.52.2023.06.09.11.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 11:31:56 -0700 (PDT)
Received: (nullmailer pid 1766355 invoked by uid 1000);
	Fri, 09 Jun 2023 18:31:55 -0000
From: Rob Herring <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc: fsl: Use of_property_read_reg() to parse "reg"
Date: Fri,  9 Jun 2023 12:31:50 -0600
Message-Id: <20230609183151.1766261-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the recently added of_property_read_reg() helper to get the
untranslated "reg" address value.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/powerpc/sysdev/fsl_rio.c | 14 +++-----------
 arch/powerpc/sysdev/fsl_rmu.c |  9 +--------
 2 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_rio.c b/arch/powerpc/sysdev/fsl_rio.c
index 18176d0df612..33ba1676ef5a 100644
--- a/arch/powerpc/sysdev/fsl_rio.c
+++ b/arch/powerpc/sysdev/fsl_rio.c
@@ -448,13 +448,11 @@ int fsl_rio_setup(struct platform_device *dev)
 	struct rio_mport *port;
 	struct rio_priv *priv;
 	int rc = 0;
-	const u32 *dt_range, *cell, *port_index;
+	const u32 *cell, *port_index;
 	u32 active_ports = 0;
 	struct device_node *np, *rmu_node;
-	int rlen;
 	u32 ccsr;
 	u64 range_start;
-	int aw;
 	u32 i;
 	static int tmp;
 	struct device_node *rmu_np[MAX_MSG_UNIT_NUM] = {NULL};
@@ -528,15 +526,12 @@ int fsl_rio_setup(struct platform_device *dev)
 	dbell->bellirq = irq_of_parse_and_map(np, 1);
 	dev_info(&dev->dev, "bellirq: %d\n", dbell->bellirq);
 
-	aw = of_n_addr_cells(np);
-	dt_range = of_get_property(np, "reg", &rlen);
-	if (!dt_range) {
+	if (of_property_read_reg(np, 0, &range_start, NULL)) {
 		pr_err("%pOF: unable to find 'reg' property\n",
 			np);
 		rc = -ENOMEM;
 		goto err_pw;
 	}
-	range_start = of_read_number(dt_range, aw);
 	dbell->dbell_regs = (struct rio_dbell_regs *)(rmu_regs_win +
 				(u32)range_start);
 
@@ -556,15 +551,12 @@ int fsl_rio_setup(struct platform_device *dev)
 	pw->dev = &dev->dev;
 	pw->pwirq = irq_of_parse_and_map(np, 0);
 	dev_info(&dev->dev, "pwirq: %d\n", pw->pwirq);
-	aw = of_n_addr_cells(np);
-	dt_range = of_get_property(np, "reg", &rlen);
-	if (!dt_range) {
+	if (of_property_read_reg(np, 0, &range_start, NULL)) {
 		pr_err("%pOF: unable to find 'reg' property\n",
 			np);
 		rc = -ENOMEM;
 		goto err;
 	}
-	range_start = of_read_number(dt_range, aw);
 	pw->pw_regs = (struct rio_pw_regs *)(rmu_regs_win + (u32)range_start);
 
 	/*set up ports node*/
diff --git a/arch/powerpc/sysdev/fsl_rmu.c b/arch/powerpc/sysdev/fsl_rmu.c
index 7a5e2e2b9d06..e27c275c9c2e 100644
--- a/arch/powerpc/sysdev/fsl_rmu.c
+++ b/arch/powerpc/sysdev/fsl_rmu.c
@@ -1067,9 +1067,6 @@ int fsl_rio_setup_rmu(struct rio_mport *mport, struct device_node *node)
 	struct rio_priv *priv;
 	struct fsl_rmu *rmu;
 	u64 msg_start;
-	const u32 *msg_addr;
-	int mlen;
-	int aw;
 
 	if (!mport || !mport->priv)
 		return -EINVAL;
@@ -1086,16 +1083,12 @@ int fsl_rio_setup_rmu(struct rio_mport *mport, struct device_node *node)
 	if (!rmu)
 		return -ENOMEM;
 
-	aw = of_n_addr_cells(node);
-	msg_addr = of_get_property(node, "reg", &mlen);
-	if (!msg_addr) {
+	if (of_property_read_reg(node, 0, &msg_start, NULL)) {
 		pr_err("%pOF: unable to find 'reg' property of message-unit\n",
 			node);
 		kfree(rmu);
 		return -ENOMEM;
 	}
-	msg_start = of_read_number(msg_addr, aw);
-
 	rmu->msg_regs = (struct rio_msg_regs *)
 			(rmu_regs_win + (u32)msg_start);
 
-- 
2.39.2

