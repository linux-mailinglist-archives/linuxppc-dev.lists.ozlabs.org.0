Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCFF8D5597
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:41:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.a=rsa-sha256 header.s=default2211 header.b=k4I/tL93;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr1TG5ZTNz3frW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:41:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.a=rsa-sha256 header.s=default2211 header.b=k4I/tL93;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=geanix.com (client-ip=188.40.30.78; helo=www530.your-server.de; envelope-from=esben@geanix.com; receiver=lists.ozlabs.org)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqpxL2bkrz2xPc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 00:47:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=ghtoP556IbQ/4WNCjbdXYdl4SF/fbsBPebHF32JHF24=; b=k4
	I/tL93vaUznDzldj8OIPU2ha2h+e6lf/zM1QEjKjHd2quynoZiN1zahEuzRAZ4+bHOgWq6Tbcs9fw
	WDm+F+bs7JNE35wJf32IceQHAa2k1bYDmfWo+pV1TMAMzOdTngeDMadfuXhAt7PFC/RBhnwTzSX8T
	wHNFXEfLZF+PEC6vTMV7D9qZoO472Z/18NA/Aotrm8RUpFMHDVJ5LikAlBhiB9QYzA1THkfYr95No
	ZeWt5QiDAPIPMwc+SiEFIl8T+fp3u1YZwLBdY+aPN4ew7GLvZ39Ie7N5M+K4R8bgRhbLoAwhs4djm
	wMe4Y08hGige7WNGIuBmJ8nOelEK7RAA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sCh3B-000CAW-Cu; Thu, 30 May 2024 16:46:41 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sCh3A-000N5A-1R;
	Thu, 30 May 2024 16:46:40 +0200
From: Esben Haabendal <esben@geanix.com>
Subject: [PATCH v3 0/3] memory: fsl_ifc: Make FSL_IFC config visible and
 selectable
Date: Thu, 30 May 2024 16:46:35 +0200
Message-Id: <20240530-fsl-ifc-config-v3-0-1fd2c3d233dd@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEuRWGYC/3WMQQ6CMBAAv0J6dk0p0oIn/2E8QLuFTbQlrWkwh
 L9bOGmMx5lkZmERA2Fk52JhARNF8i5DdSiYHjs3IJDJzAQXJ16LCmy8A1kN2jtLA+hGqZaLXrQ
 KWY6mgJbmfXi9ZR4pPn147f9UbvbvKpVQgkRrVdUbrVBeBuwczUftH2x7JfHZNz+9AA61NapHJ
 WXNzVe/rusbKHPTy+0AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717080399; l=1363;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=hec9jZ8GWjjsOhfEAzSjDoHUwtpSRvZqlBCq8AeIrFo=;
 b=buzvR/qD7i5oCABreVm4NXVrvG2Yrha5/9sV9qT58rBe0Y1V0HlLMjxj016UsCkarlgM2PV1D
 qnXPPLMay4qDek66RR3yRO4bP1kvryYBpWSCZwqM67gmus4KuCWQaIZ
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

Changes in v3:
- Refresh arm64 defconfig.
- Link to v2: https://lore.kernel.org/r/20240528-fsl-ifc-config-v2-0-5fd7be76650d@geanix.com

Changes in v2:
- CONFIG_MTD_NAND_FSL_IFC depends on CONFIG_FSL_IFC instead of select.
- Refresh powerpc config snippet accordingly.
- Link to v1: https://lore.kernel.org/r/20240523-fsl-ifc-config-v1-1-6eff73bdc7e6@geanix.com

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
Esben Haabendal (3):
      memory: fsl_ifc: Make FSL_IFC config visible and selectable
      powerpc/configs: Update defconfig with now user-visible CONFIG_FSL_IFC
      arm64/configs: Update defconfig with now user-visible CONFIG_FSL_IFC

 arch/arm64/configs/defconfig        | 1 +
 arch/powerpc/configs/85xx-hw.config | 2 ++
 drivers/memory/Kconfig              | 2 +-
 drivers/mtd/nand/raw/Kconfig        | 3 +--
 4 files changed, 5 insertions(+), 3 deletions(-)
---
base-commit: a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
change-id: 20240523-fsl-ifc-config-c877902b297e

Best regards,
-- 
Esben Haabendal <esben@geanix.com>

