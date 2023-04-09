Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EA16DBE2A
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Apr 2023 02:10:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PvCD32HcMz3fbh
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Apr 2023 10:10:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U07AaPok;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U07AaPok;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PvCC85NXpz3cjL
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Apr 2023 10:09:24 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 98E3360A77;
	Sun,  9 Apr 2023 00:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9F2C4339B;
	Sun,  9 Apr 2023 00:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680998961;
	bh=0pyF5BprYbz87qK2AZkPwODALXJFq6DUsJqadpHT440=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U07AaPokjtBAc0C4wIr+iJMgavSe0ByRUzmmXqJlDdYCbUJSH38NDgqI0nNzbcz3w
	 xRLhvM3KoZGuNoHiKe7j/w77n8Lk9Xv1kYOQhBICBAiUXPHqE/KEc5xYZ24P4253Dc
	 T58A45KCBunC2OGxMpLLjAJXh2kS1yG3yXLDs4hmolj+wG/3ALNnhPKmje/Guspry4
	 fqn3bKiQvC1+E2hZ8PGrOO7hpseGM2jWQa0s0HBgYTa0wslyDJ4b126Q+ouOU5pk0h
	 Cntrs68Ij/Nek/GDWz8h6ISC7/NnTXnn0fM0V3Mt7UVtMQ34m/wfeXRUob+OoZLnU0
	 fDa1zssTDuViQ==
Received: by pali.im (Postfix)
	id 3944F1C97; Sun,  9 Apr 2023 02:09:18 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v3 2/8] powerpc/85xx: mpc85xx_ds: Simplify mpc85xx_exclude_device() function
Date: Sun,  9 Apr 2023 02:08:06 +0200
Message-Id: <20230409000812.18904-3-pali@kernel.org>
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

Function mpc85xx_exclude_device() is installed and used only when
pci_with_uli is fsl_pci_primary. So replace check for pci_with_uli by
fsl_pci_primary in mpc85xx_exclude_device() and move pci_with_uli variable
declaration into function mpc85xx_ds_uli_init() where it is used.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/platforms/85xx/mpc85xx_ds.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
index ed7b71d55b10..0c905a838942 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
@@ -108,12 +108,10 @@ void __init mpc85xx_ds_pic_init(void)
 }
 
 #ifdef CONFIG_PCI
-static struct device_node *pci_with_uli;
-
 static int mpc85xx_exclude_device(struct pci_controller *hose,
 				   u_char bus, u_char devfn)
 {
-	if (hose->dn == pci_with_uli)
+	if (hose->dn == fsl_pci_primary)
 		return uli_exclude_device(hose, bus, devfn);
 
 	return PCIBIOS_SUCCESSFUL;
@@ -124,6 +122,7 @@ static void __init mpc85xx_ds_uli_init(void)
 {
 #ifdef CONFIG_PCI
 	struct device_node *node;
+	struct device_node *pci_with_uli;
 
 	/* See if we have a ULI under the primary */
 
-- 
2.20.1

