Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 275296DBE2F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Apr 2023 02:14:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PvCJj6vxrz3fnd
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Apr 2023 10:14:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oL+sTbXS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oL+sTbXS;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PvCCB50ZKz3fSm
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Apr 2023 10:09:26 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 33F24616B6;
	Sun,  9 Apr 2023 00:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF80C4339E;
	Sun,  9 Apr 2023 00:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680998961;
	bh=1B1bdtjGi0qphccKaW9xvXzqnYHpNRSwmcqFmuJLGRY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oL+sTbXSdCweznn7Npv8YVUuK1KpdoGzqqK4xL61LuzJzJULj+zasB/Rp+Nh8H77O
	 4I32hkqjHG+ejhR27pnXyOPQn+fCZuVUI95u8TOp7ZTINga3kcmbmSXn3Yc4w/MPbV
	 49OVkUr5wP6/NRl3mjJhqig1UO5wjFdyZIkfXLmoPw3+dl0CSa5NpJu8TAmPsqpHIc
	 XKMw9Qp4Y7VokscxJtrBf4obHW5k0ytXnsaIexR+g1Vmxiwi4JA3GUDUAhGEs9qILf
	 5yDrPa2m7ghOyUSIP4bM4s7v2clKQEAPNDkNZ+xkROL0FQfbl/PafZpseGCYGlr6EE
	 ysOhySnLLW9Ig==
Received: by pali.im (Postfix)
	id C63C920A8; Sun,  9 Apr 2023 02:09:18 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v3 5/8] powerpc/85xx: mpc85xx_rdb: Do not automatically select FSL_ULI1575
Date: Sun,  9 Apr 2023 02:08:09 +0200
Message-Id: <20230409000812.18904-6-pali@kernel.org>
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

Boards provided by CONFIG_MPC85xx_RDB option do not initialize
fsl_uli1575.c driver. So remove explicit select dependency on it.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/platforms/85xx/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/85xx/Kconfig b/arch/powerpc/platforms/85xx/Kconfig
index b92cb2b4d54d..a8ce6616fd0a 100644
--- a/arch/powerpc/platforms/85xx/Kconfig
+++ b/arch/powerpc/platforms/85xx/Kconfig
@@ -90,7 +90,6 @@ config MPC85xx_RDB
 	bool "Freescale P102x MBG/UTM/RDB and P2020 RDB"
 	select PPC_I8259
 	select DEFAULT_UIMAGE
-	select FSL_ULI1575 if PCI
 	select SWIOTLB
 	help
 	  This option enables support for the P1020 MBG PC, P1020 UTM PC,
-- 
2.20.1

