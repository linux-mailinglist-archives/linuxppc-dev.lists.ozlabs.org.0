Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A411D5A8AFF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 03:43:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJ3jP48Ngz3c8C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 11:43:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nGIt+lQ8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJ3hm3M4Zz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 11:43:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nGIt+lQ8;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MJ3hh5w6qz4xGH;
	Thu,  1 Sep 2022 11:43:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1661996580;
	bh=HFlL7T/8TS/XfaNRFSm9IZL6O7tlGgVrX/UpqMXbjA8=;
	h=From:To:Subject:Date:From;
	b=nGIt+lQ8YjKPHeidB3i6/R0wpk+HAzEndGjy1/Igief4R7jeGOukVFsZjR9Yb053l
	 4eOGoojgP7HdnwFUu8PP4/tqyENpsK42180wx1ZMHBiwZpOj+Jbv3mCCSQkOpwRTfA
	 8z9bgrTjpM4BuOf9sSnlw8QB6YrWip0xVMcGVn1gAWXBDXKei0wa/1I/8A13yspX8M
	 MRYNTS70Xf5pJ4d8RE0C7irlSepegGRHf9pgHbnNGj1LlssYeMNafKqB8rEJy1IOuw
	 RwCMtprH59K2ylhierHAI4OTnhu9spMBd0dCJ3YNj2c3c7ezwksKDio6hbvg39whIV
	 8MTY/BKKYtoRg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/configs: Properly enable PAPR_SCM in pseries_defconfig
Date: Thu,  1 Sep 2022 11:42:53 +1000
Message-Id: <20220901014253.252927-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.2
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

My commit to add PAPR_SCM to pseries_defconfig failed to add the
required dependencies, meaning the driver doesn't get built.

Add the required LIBNVDIMM=m.

Fixes: d6481a7195df ("powerpc/configs: Add PAPR_SCM to pseries_defconfig")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/pseries_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/configs/pseries_defconfig
index b571d084c148..c05e37af9f1e 100644
--- a/arch/powerpc/configs/pseries_defconfig
+++ b/arch/powerpc/configs/pseries_defconfig
@@ -40,6 +40,7 @@ CONFIG_PPC_SPLPAR=y
 CONFIG_DTL=y
 CONFIG_PPC_SMLPAR=y
 CONFIG_IBMEBUS=y
+CONFIG_LIBNVDIMM=m
 CONFIG_PAPR_SCM=m
 CONFIG_PPC_SVM=y
 # CONFIG_PPC_PMAC is not set
-- 
2.37.2

