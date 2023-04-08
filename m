Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E3A6DBB2B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 15:30:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ptx232z9Dz3fpS
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 23:30:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B5DDK8GI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B5DDK8GI;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ptwtj2yS0z3fCp
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 23:24:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 73DA461073;
	Sat,  8 Apr 2023 13:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA873C433D2;
	Sat,  8 Apr 2023 13:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680960250;
	bh=ps76pyu3TDlG2IApvb70QcdiPajYqBKpLTa4tWI5Ohs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B5DDK8GI+rwvjJPfZEVp80zJfVVp8JpL4yQrVaExPzOfnPcYpewHbcb5OA0jfC1rR
	 FHldYjZtQ3UtLbQmXxZYby67EG6pS3EDZw4FZwfF5wdVDOq+CCE1sYgVfmtd9ay2v5
	 zVWKDlIBpuKD1K3Twseu/S0T8Ou5vkSc0od8dPDrr827ViP++aIiHuocJImOSlfdWr
	 uS7nRFH5WeDt3n83/E0Z/APHg5ni6LV8Un316/6feLD/cHnLGcqps/Q2vp5iEDnwjR
	 qamRvrC64lD4ebM4jH81mls0fVgHqsp08bLb0QrpJvGCvgYe5X+OSYbrOacGvxpc1n
	 SNxbneZmpBL9w==
Received: by pali.im (Postfix)
	id 6F567213C; Sat,  8 Apr 2023 15:24:06 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 7/8] powerpc/mpc86xx: mpc86xx_hpcn: Call uli_init() instead of explicit ppc_md assignment
Date: Sat,  8 Apr 2023 15:21:50 +0200
Message-Id: <20230408132151.8902-8-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230408132151.8902-1-pali@kernel.org>
References: <20230408132151.8902-1-pali@kernel.org>
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

After calling fsl_pci_assign_primary(), it is possible to use uli_init() to
conditionally initialize ppc_md.pci_exclude_device callback based on the
uli1575 detection.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/platforms/86xx/mpc86xx_hpcn.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c b/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
index 645125cc8420..812110673d88 100644
--- a/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
+++ b/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
@@ -46,10 +46,6 @@ mpc86xx_hpcn_setup_arch(void)
 	if (ppc_md.progress)
 		ppc_md.progress("mpc86xx_hpcn_setup_arch()", 0);
 
-#ifdef CONFIG_PCI
-	ppc_md.pci_exclude_device = uli_exclude_device;
-#endif
-
 	printk("MPC86xx HPCN board from Freescale Semiconductor\n");
 
 #ifdef CONFIG_SMP
@@ -57,6 +53,7 @@ mpc86xx_hpcn_setup_arch(void)
 #endif
 
 	fsl_pci_assign_primary();
+	uli_init();
 
 	swiotlb_detect_4g();
 }
-- 
2.20.1

