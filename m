Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 147AD43429
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 10:37:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PcYF3F8vzDrCH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 18:37:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PcWR2PQHzDr9P
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 18:35:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="EFa+4WGp"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45PcWR1Qhjz8vR9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 18:35:31 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45PcWR143tz9sDX; Thu, 13 Jun 2019 18:35:31 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="EFa+4WGp"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45PcWQ605Fz9s9y
 for <linuxppc-dev@ozlabs.org>; Thu, 13 Jun 2019 18:35:28 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 113D120B7C;
 Thu, 13 Jun 2019 08:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560414926;
 bh=r/cQdU2vJehPtLKTUxVZzWc4VnWDJsWbAZXWsJZuhBw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EFa+4WGpWJc/koTHSq43Y2epWdWtqq6OPfQdBjI93XPa0fCROqOA0ZcftSPb9/zv+
 OrrYvPIsQ2VQXCzdqxf96yCxTdvLucUspu0vkq8t17ozG45wbShSQeL1jox4WczzNV
 QArYef2uYKZavSA/CedT2pY32wqzpMIgNdffaUck=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4.14 23/81] EDAC/mpc85xx: Prevent building as a module
Date: Thu, 13 Jun 2019 10:33:06 +0200
Message-Id: <20190613075650.845289943@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190613075649.074682929@linuxfoundation.org>
References: <20190613075649.074682929@linuxfoundation.org>
User-Agent: quilt/0.66
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
Cc: Sasha Levin <sashal@kernel.org>, Borislav Petkov <bp@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, stable@vger.kernel.org,
 linuxppc-dev@ozlabs.org, morbidrsa@gmail.com,
 James Morse <james.morse@arm.com>, Johannes Thumshirn <jth@kernel.org>,
 linux-edac <linux-edac@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[ Upstream commit 2b8358a951b1e2a534a54924cd8245e58a1c5fb8 ]

The mpc85xx EDAC driver can be configured as a module but then fails to
build because it uses two unexported symbols:

  ERROR: ".pci_find_hose_for_OF_device" [drivers/edac/mpc85xx_edac_mod.ko] undefined!
  ERROR: ".early_find_capability" [drivers/edac/mpc85xx_edac_mod.ko] undefined!

We don't want to export those symbols just for this driver, so make the
driver only configurable as a built-in.

This seems to have been broken since at least

  c92132f59806 ("edac/85xx: Add PCIe error interrupt edac support")

(Nov 2013).

 [ bp: make it depend on EDAC=y so that the EDAC core doesn't get built
   as a module. ]

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Borislav Petkov <bp@suse.de>
Acked-by: Johannes Thumshirn <jth@kernel.org>
Cc: James Morse <james.morse@arm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-edac <linux-edac@vger.kernel.org>
Cc: linuxppc-dev@ozlabs.org
Cc: morbidrsa@gmail.com
Link: https://lkml.kernel.org/r/20190502141941.12927-1-mpe@ellerman.id.au
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/edac/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 96afb2aeed18..aaaa8ce8d3fd 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -246,8 +246,8 @@ config EDAC_PND2
 	  micro-server but may appear on others in the future.
 
 config EDAC_MPC85XX
-	tristate "Freescale MPC83xx / MPC85xx"
-	depends on FSL_SOC
+	bool "Freescale MPC83xx / MPC85xx"
+	depends on FSL_SOC && EDAC=y
 	help
 	  Support for error detection and correction on the Freescale
 	  MPC8349, MPC8560, MPC8540, MPC8548, T4240
-- 
2.20.1



