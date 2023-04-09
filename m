Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C71066DBE31
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Apr 2023 02:15:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PvCLZ4LcMz2x9d
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Apr 2023 10:15:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tK6Zxue4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tK6Zxue4;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PvCCB694Rz3fSv
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Apr 2023 10:09:26 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 42F54616CC;
	Sun,  9 Apr 2023 00:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A17C433A8;
	Sun,  9 Apr 2023 00:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680998961;
	bh=ps76pyu3TDlG2IApvb70QcdiPajYqBKpLTa4tWI5Ohs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tK6Zxue4K7UPtqIlVK/fMHIZgv7oixQdk1BL5ZW14GAUjy6ZqGU9ktImZlxBMtfNv
	 bbUiMeGuiiZ4QqYQriftxfvFRdS9o8QL+r9OUKQiBvYBQ5AfuRHEZ4SCKQpjtmou1Z
	 pbQUDhMTbzRD4nylA/2lDqhUZCu6MXFOLyXiRfaBppk44OCJPG/kvzs6oeB7gb+TBE
	 ASRjwIELp0sKp3YYK0XneCuLGY+FrIzj9DzOaASnKjpgMcR8ziB4hjxqKPPzNwNSjA
	 j/AOvNZiNijwXR9tMb/f1iUowHFhqEGkH3GRMh/tcV9zbY3YQhmFbC4LnvbyLNR79L
	 J4oMUy7jsmjPg==
Received: by pali.im (Postfix)
	id 36D14213C; Sun,  9 Apr 2023 02:09:19 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v3 7/8] powerpc/86xx: mpc86xx_hpcn: Call uli_init() instead of explicit ppc_md assignment
Date: Sun,  9 Apr 2023 02:08:11 +0200
Message-Id: <20230409000812.18904-8-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230409000812.18904-1-pali@kernel.org>
References: <20230409000812.18904-1-pali@kernel.org>
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

