Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 381DE7F5CE2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 11:50:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jb28IYZu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbZdl0kvXz3vfj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 21:50:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jb28IYZu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbZb65ctTz3dK4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 21:48:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2343061EDC;
	Thu, 23 Nov 2023 10:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65959C433C9;
	Thu, 23 Nov 2023 10:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700736496;
	bh=XewRPhT99Y03FufuA1LV3jWgAM7RX4SOby0kMRaZJ00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jb28IYZuVzwcLrvrvdnukKAYmz06zPlRup1+ZlrHUkGDRNnKhK/LnDE6VdgbLpj+m
	 7nGH2w6Z1wEvV1o01yirEafTzIchxEfH4n2wh7+t8IoMcGHOFAP/SKIzyt37JchohU
	 ib2t6BeZZQ86+vnPtZ+l1dn7dxrBqkZmLsRPiASWYcgVIFUmk5vGvqSqP1M1fKyprv
	 WtPDeYK0T522Y3EVQc2uUKBE+AX0HUsdGJvTOEm3AvSFnWESX7NOSJgufEHOEpjU/O
	 JVbzAaHZKimJUay/NoPr4L/SKxigHhRfZtozFHHOguviIMwsJd6aOJ0UukOcKdgPZy
	 H1T4gcKWtWZTQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 2/3] powerpc: pasemi: mark pas_shutdown() static
Date: Thu, 23 Nov 2023 11:48:00 +0100
Message-Id: <20231123104801.15537-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231123104801.15537-1-arnd@kernel.org>
References: <20231123104801.15537-1-arnd@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

Allmodconfig builds show a warning about one function that is accidentally
marked global:

arch/powerpc/platforms/pasemi/setup.c:67:6: error: no previous prototype for 'pas_shutdown' [-Werror=missing-prototypes]

Fixes: 656fdf3ad8e0 ("powerpc/pasemi: Add Nemo board device init code.")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/platforms/pasemi/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pasemi/setup.c b/arch/powerpc/platforms/pasemi/setup.c
index ef985ba2bf21..0761d98e5be3 100644
--- a/arch/powerpc/platforms/pasemi/setup.c
+++ b/arch/powerpc/platforms/pasemi/setup.c
@@ -64,7 +64,7 @@ static void __noreturn pas_restart(char *cmd)
 }
 
 #ifdef CONFIG_PPC_PASEMI_NEMO
-void pas_shutdown(void)
+static void pas_shutdown(void)
 {
 	/* Set the PLD bit that makes the SB600 think the power button is being pressed */
 	void __iomem *pld_map = ioremap(0xf5000000,4096);
-- 
2.39.2

