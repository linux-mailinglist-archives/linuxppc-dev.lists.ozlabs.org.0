Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E913E8D5567
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:30:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.a=rsa-sha256 header.s=default2211 header.b=UQ9yPSY0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr1DT1G1Cz3d40
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:30:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.a=rsa-sha256 header.s=default2211 header.b=UQ9yPSY0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=geanix.com (client-ip=188.40.30.78; helo=www530.your-server.de; envelope-from=esben@geanix.com; receiver=lists.ozlabs.org)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VpXX91gVRz793P
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2024 22:54:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=B+JyFuDIfoWyU83fEPu16Ax2iAw7y4/ySQU7Tr5AVHs=; b=UQ9yPSY0+xZ4W22mwhQYbJvR1s
	qCsqBrSouHS0jViyms/odzKQ20L4VqruYJtzS7RxlVxjnKgkmTHRocWRJaPoBd6HwZXrmgwtrzyJa
	deBKI0ANan3PDDVkXZ/xU+JKvIr5X/DYSqJJumjW8Ugjcr/jZW6vX/g2tP9uTmlGNknyUnLlefAkh
	LnB37nBF5/C6ZSfEo6kp6a3u7oP+p4T03Uf2eAZhpmyDBjgR1cUfTF/19188EsyaXQwDC/BXtSGPC
	750TZqv5a5lOH42ZyvMNb0Bq1KoWW6lAIX5vzWZle8eqgJwTEowfcJWtPsBwVfYqCHvQ8h3j+WAVq
	nF57NIXg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sBvwu-000G8z-MP; Tue, 28 May 2024 14:29:04 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sBvwt-000CIK-01;
	Tue, 28 May 2024 14:29:03 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Tue, 28 May 2024 14:28:53 +0200
Subject: [PATCH v2 2/2] powerpc/configs: Update defconfig with now
 user-visible CONFIG_FSL_IFC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-fsl-ifc-config-v2-2-5fd7be76650d@geanix.com>
References: <20240528-fsl-ifc-config-v2-0-5fd7be76650d@geanix.com>
In-Reply-To: <20240528-fsl-ifc-config-v2-0-5fd7be76650d@geanix.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716899341; l=963;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=iKUhFoSSSMrh/cb1S2LQj5ELm2cHsPctZeIgLvA69wo=;
 b=8RQGE9EgZX/SGIcrQldXMqMU13oeIlcOwvNVNNpAutnOUf/hrhuSWlbCBqC4Wd+OISRChAkGA
 TPZ4RMCgBSBDQ26tXtYu91XvX/Yyz7zk/0N05SBLuQpWsr4sRyG2OOd
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27289/Tue May 28 10:30:59 2024)
X-Mailman-Approved-At: Fri, 31 May 2024 08:19:55 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, Esben Haabendal <esben@geanix.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With CONFIG_FSL_IFC now being user-visible, and thus changed from a select
to depends in CONFIG_MTD_NAND_FSL_IFC, the dependencies needs to be
selected in config snippets.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 arch/powerpc/configs/85xx-hw.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/configs/85xx-hw.config b/arch/powerpc/configs/85xx-hw.config
index 524db76f47b7..8aff83217397 100644
--- a/arch/powerpc/configs/85xx-hw.config
+++ b/arch/powerpc/configs/85xx-hw.config
@@ -24,6 +24,7 @@ CONFIG_FS_ENET=y
 CONFIG_FSL_CORENET_CF=y
 CONFIG_FSL_DMA=y
 CONFIG_FSL_HV_MANAGER=y
+CONFIG_FSL_IFC=y
 CONFIG_FSL_PQ_MDIO=y
 CONFIG_FSL_RIO=y
 CONFIG_FSL_XGMAC_MDIO=y
@@ -58,6 +59,7 @@ CONFIG_INPUT_FF_MEMLESS=m
 CONFIG_MARVELL_PHY=y
 CONFIG_MDIO_BUS_MUX_GPIO=y
 CONFIG_MDIO_BUS_MUX_MMIOREG=y
+CONFIG_MEMORY=y
 CONFIG_MMC_SDHCI_OF_ESDHC=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI=y

-- 
2.45.1

