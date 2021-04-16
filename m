Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4021F361E77
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 13:12:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMD8G1cj8z3c43
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 21:12:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Hs85lksD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Hs85lksD; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMD7t6Mswz2yyK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 21:12:26 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FMD7j5Z7bz9sW4; Fri, 16 Apr 2021 21:12:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618571537;
 bh=3Rlyv9Vg7qoH6KqBUiP7QqB19FryoGIXO4RgKUFMc/c=;
 h=From:To:Subject:Date:From;
 b=Hs85lksD6qugUVTBJ2tO3oOMtiTE4gAMvjTTkwjhsLjqqfRvPa6piqgLI9XOyAZrl
 ME/xTurjHqI2fSvKDNmWNQPJ5390nAP0Z7+w/Z7/WmU1bJXakXhZfsGYtc6mMhjjZw
 pjlPaiOfZvHQQ7ydYgYz+MsO8sPHCjZ/vTJhVHc69PsPBIEaPxNF4SMQsGP6bE80iS
 mAfaRxOZESTutp6cUzlVeZIUvsOxBAlW2NJRB357GLeSbXSyL9xlx32uiplR3JiMyf
 XXkD0hNHNO7Jgx3LA9f18TV8vqX7n5pTM39ECLdYaWvTQV1eXd5u6Ba5tKpyRUtf3B
 aUf1/5liIFkHA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/configs: Add PAPR_SCM to pseries_defconfig
Date: Fri, 16 Apr 2021 21:12:08 +1000
Message-Id: <20210416111209.765444-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a pseries only driver, it should be built by default as part of
pseries_defconfig to get some build coverage.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/pseries_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/configs/pseries_defconfig
index 777221775c83..968095d7682c 100644
--- a/arch/powerpc/configs/pseries_defconfig
+++ b/arch/powerpc/configs/pseries_defconfig
@@ -41,6 +41,7 @@ CONFIG_DTL=y
 CONFIG_SCANLOG=m
 CONFIG_PPC_SMLPAR=y
 CONFIG_IBMEBUS=y
+CONFIG_PAPR_SCM=m
 CONFIG_PPC_SVM=y
 # CONFIG_PPC_PMAC is not set
 CONFIG_RTAS_FLASH=m
-- 
2.25.1

