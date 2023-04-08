Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2F76DBB7B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 16:07:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtxrN1z9Dz3fcW
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Apr 2023 00:07:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UPnN8Gzz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UPnN8Gzz;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ptxkw5mzGz3fJd
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Apr 2023 00:02:32 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 590F96159C;
	Sat,  8 Apr 2023 14:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8D9C433A0;
	Sat,  8 Apr 2023 14:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680962548;
	bh=GGCC6nIysok7nRf7iQxTO/BAJu5Xzrmg55AbDqZKllk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UPnN8GzzL8eSxC1PHevEiO0J6Y3trRJtHFRr9FNNO/ug6afpyJzXnxKCIObo0eB9Q
	 ctTRyaNDi78kHf/33i0MfdM2rN88ZBkjsJwLtDKbtKcZBrYWQy2juJoTANT2tq9pP3
	 /YrkOHisbFnduPcDzguSX27zC7gt6Xk4ZE1sOjwwfb3NfHvg4ut7+90Cle8rxI1xTq
	 cLOQJCimaVkVJaeJEV9MwhI9f5ixfsfDqq0m5eXOzXOEtZHF+ex5q1fH9uuNvVSbcv
	 g/w1lKEP5eDDq1WWIBX8uNTQaPJTyVwgKi/O2appN15WD/ynNPM4Ye5GJ9op11ObJY
	 zj9bu1+1M8VGQ==
Received: by pali.im (Postfix)
	id A01CA20C8; Sat,  8 Apr 2023 16:02:26 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v5 06/13] powerpc/85xx: Remove #ifdef CONFIG_QUICC_ENGINE in mpc85xx_rdb
Date: Sat,  8 Apr 2023 16:01:15 +0200
Message-Id: <20230408140122.25293-7-pali@kernel.org>
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

mpc85xx_qe_par_io_init() is a stub when CONFIG_QUICC_ENGINE is not set.

CONFIG_UCC_GETH and CONFIG_SERIAL_QE depend on CONFIG_QUICC_ENGINE.

Remove #ifdef CONFIG_QUICC_ENGINE

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
index 64badacf126d..cdafecaecf56 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
@@ -57,7 +57,6 @@ static void __init mpc85xx_rdb_setup_arch(void)
 
 	fsl_pci_assign_primary();
 
-#ifdef CONFIG_QUICC_ENGINE
 	mpc85xx_qe_par_io_init();
 #if defined(CONFIG_UCC_GETH) || defined(CONFIG_SERIAL_QE)
 	if (machine_is(p1025_rdb)) {
@@ -90,7 +89,6 @@ static void __init mpc85xx_rdb_setup_arch(void)
 
 	}
 #endif
-#endif	/* CONFIG_QUICC_ENGINE */
 
 	pr_info("MPC85xx RDB board from Freescale Semiconductor\n");
 }
-- 
2.20.1

