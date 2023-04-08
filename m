Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8606DBB76
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 16:05:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtxpW0V0Nz3fkp
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Apr 2023 00:05:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JTlRNgAr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JTlRNgAr;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ptxkt6FvNz3fCk
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Apr 2023 00:02:30 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C00B561592;
	Sat,  8 Apr 2023 14:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13F5CC433EF;
	Sat,  8 Apr 2023 14:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680962548;
	bh=z4CMNIF+qP0p1YpfeYDlFb1xIAtUPldYnJb0Qxk6MbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JTlRNgAr6TjlIcgmsijbR4WXf7ZyxtKssulrtvr2jCkDNoKJTRgR9WpZejL5SFGbH
	 0MdsufXtLcjQ2Ojiv1yUOYYT+j2kYkVceCybtLtuZBe7gU4lZRxpHE4D81TCR7p72q
	 naKzPrvJPRNB+27A4b/2NezePV2LLg0iv0xY/LWJzMwfUb8Znxmf9mRXlDf9N2V+TG
	 KaSx8wA4akLn9zUPLzOVUuWqO7syL16K5yDUBIkGANHcx50HIPoM4kJQD46zneXzBz
	 fLhDcdWR/xKZU2v/MpkpZgvOxaMD1VQd0r1TcjP4ywsZmQiqosbnK5YwFWE7VB93mv
	 cazH65j0kHJew==
Received: by pali.im (Postfix)
	id CC2521C97; Sat,  8 Apr 2023 16:02:25 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v5 02/13] powerpc/85xx: mpc85xx_{ds/rdb} compact the call to mpic_alloc()
Date: Sat,  8 Apr 2023 16:01:11 +0200
Message-Id: <20230408140122.25293-3-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230408140122.25293-1-pali@kernel.org>
References: <20230408140122.25293-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Christophe Leroy <christophe.leroy@csgroup.eu>

Reduce number of lines in the call to mpic_alloc().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/platforms/85xx/mpc85xx_ds.c  | 18 ++++++------------
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c | 16 +++++-----------
 2 files changed, 11 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
index 25edfe1b8ae1..c6016915264c 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
@@ -50,23 +50,17 @@ static void mpc85xx_8259_cascade(struct irq_desc *desc)
 void __init mpc85xx_ds_pic_init(void)
 {
 	struct mpic *mpic;
+	int flags = MPIC_BIG_ENDIAN | MPIC_SINGLE_DEST_CPU;
 #ifdef CONFIG_PPC_I8259
 	struct device_node *np;
 	struct device_node *cascade_node = NULL;
 	int cascade_irq;
 #endif
-	if (of_machine_is_compatible("fsl,MPC8572DS-CAMP")) {
-		mpic = mpic_alloc(NULL, 0,
-			MPIC_NO_RESET |
-			MPIC_BIG_ENDIAN |
-			MPIC_SINGLE_DEST_CPU,
-			0, 256, " OpenPIC  ");
-	} else {
-		mpic = mpic_alloc(NULL, 0,
-			  MPIC_BIG_ENDIAN |
-			  MPIC_SINGLE_DEST_CPU,
-			0, 256, " OpenPIC  ");
-	}
+
+	if (of_machine_is_compatible("fsl,MPC8572DS-CAMP"))
+		flags |= MPIC_NO_RESET;
+
+	mpic = mpic_alloc(NULL, 0, flags, 0, 256, " OpenPIC  ");
 
 	BUG_ON(mpic == NULL);
 	mpic_init(mpic);
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
index acc4145adcf7..c7ce8a79992d 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
@@ -32,18 +32,12 @@
 void __init mpc85xx_rdb_pic_init(void)
 {
 	struct mpic *mpic;
+	int flags = MPIC_BIG_ENDIAN | MPIC_SINGLE_DEST_CPU;
 
-	if (of_machine_is_compatible("fsl,MPC85XXRDB-CAMP")) {
-		mpic = mpic_alloc(NULL, 0, MPIC_NO_RESET |
-			MPIC_BIG_ENDIAN |
-			MPIC_SINGLE_DEST_CPU,
-			0, 256, " OpenPIC  ");
-	} else {
-		mpic = mpic_alloc(NULL, 0,
-		  MPIC_BIG_ENDIAN |
-		  MPIC_SINGLE_DEST_CPU,
-		  0, 256, " OpenPIC  ");
-	}
+	if (of_machine_is_compatible("fsl,MPC85XXRDB-CAMP"))
+		flags |= MPIC_NO_RESET;
+
+	mpic = mpic_alloc(NULL, 0, flags, 0, 256, " OpenPIC  ");
 
 	BUG_ON(mpic == NULL);
 	mpic_init(mpic);
-- 
2.20.1

