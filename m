Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 428CF8D559A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:42:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.a=rsa-sha256 header.s=default2211 header.b=NFkC4yAB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr1V63cgtz3g4r
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:42:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.a=rsa-sha256 header.s=default2211 header.b=NFkC4yAB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=geanix.com (client-ip=188.40.30.78; helo=www530.your-server.de; envelope-from=esben@geanix.com; receiver=lists.ozlabs.org)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqpxL5mHGz3cLQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 00:47:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=DR+biPGlYSGpZ+eEYjKOY4OeXDd2KnIrfa/0OCmMW9E=; b=NFkC4yABayuL0SL1hIBI8W1du+
	T3MZqaBFNXMYIdsiFGnY4t4vN9zt4JV+Jc59ebpDaVe/2p6AYg24lNsQOe6P3bFtHhviXITU/3Jym
	h0bqtqnit8ThM/AaX/+wIdYRH4WABYTpkpAorGlNwwjhS5rZIbG8nOLkExJfN3TUTec98kaHV8Im/
	uKOdSsStbBiLacIkvQklyxZSCcSuGdksCBKkmxNR/H5RwwFnWQY6TVIyOWoKkyaR7QRtf7XBScKTa
	Bb32PLsKgUVTsFxQlMR6OrkICUSsA2BHc1xFmTBlfrkDGAILcz1HtwnGkaWZQQlsWUG06eINLP69a
	E17EGdGw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sCh3B-000CAe-KS; Thu, 30 May 2024 16:46:41 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sCh3A-000N8Q-2m;
	Thu, 30 May 2024 16:46:40 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Thu, 30 May 2024 16:46:36 +0200
Subject: [PATCH v3 1/3] memory: fsl_ifc: Make FSL_IFC config visible and
 selectable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-fsl-ifc-config-v3-1-1fd2c3d233dd@geanix.com>
References: <20240530-fsl-ifc-config-v3-0-1fd2c3d233dd@geanix.com>
In-Reply-To: <20240530-fsl-ifc-config-v3-0-1fd2c3d233dd@geanix.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717080399; l=1542;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=lSsBHROKQmgg5+ha1ztlFWTe4EVHhL1T/vXqe+WJJUE=;
 b=Rw8YFVh+YnzoP3xy0ZD/Bc+ulic0bj3eu4xdUcK3o3H1+HBhui0PwPmFajMBmrtRx9Eht24PV
 +fUCrwijTW9Cduj9aWfNCo5qv2Rc5g5IJfiSRFY0iLWhM9mmcc4Alna
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27291/Thu May 30 10:29:52 2024)
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
Cc: linuxppc-dev@lists.ozlabs.org, Esben Haabendal <esben@geanix.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While use of fsl_ifc driver with NAND flash is fine, as the fsl_ifc_nand
driver selects FSL_IFC automatically, we need the CONFIG_FSL_IFC option to
be selectable for platforms using fsl_ifc with NOR flash.

Fixes: ea0c0ad6b6eb ("memory: Enable compile testing for most of the drivers")
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/memory/Kconfig       | 2 +-
 drivers/mtd/nand/raw/Kconfig | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index 8efdd1f97139..c82d8d8a16ea 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -167,7 +167,7 @@ config FSL_CORENET_CF
 	  represents a coherency violation.
 
 config FSL_IFC
-	bool "Freescale IFC driver" if COMPILE_TEST
+	bool "Freescale IFC driver"
 	depends on FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1021A || COMPILE_TEST
 	depends on HAS_IOMEM
 
diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index cbf8ae85e1ae..614257308516 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -234,8 +234,7 @@ config MTD_NAND_FSL_IFC
 	tristate "Freescale IFC NAND controller"
 	depends on FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1021A || COMPILE_TEST
 	depends on HAS_IOMEM
-	select FSL_IFC
-	select MEMORY
+	depends on FSL_IFC
 	help
 	  Various Freescale chips e.g P1010, include a NAND Flash machine
 	  with built-in hardware ECC capabilities.

-- 
2.45.1

