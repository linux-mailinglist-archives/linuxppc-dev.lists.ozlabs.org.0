Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8C98D5561
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:30:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.a=rsa-sha256 header.s=default2211 header.b=aTYiduIz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr1Cb757Bz3fq1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:30:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.a=rsa-sha256 header.s=default2211 header.b=aTYiduIz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=geanix.com (client-ip=188.40.30.78; helo=www530.your-server.de; envelope-from=esben@geanix.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 957 seconds by postgrey-1.37 at boromir; Tue, 28 May 2024 22:45:28 AEST
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VpXL05MZ0z3gKX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2024 22:45:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=caMKrdEi8GmeDybKcQjT0Mo+9mRU5xyYPBFpLgpU7mA=; b=aT
	YiduIzrgX0rBg2aMeQudM1FDfvFKJ343fVanRBJ5VkuasUeYrUlWDdIsD6/xoXz/QB4G60zOBfQSF
	/rvQ1Zt9PUVklV9jwsCCC6HdP4j5KgUZTq/UXUFbFT3Dx+ZUnW0/LALiZA86anaMDv3mj9Oq7UibS
	28bHw0MonA9UHaD47MazwUFnhNgozYSk7bSFSUe5ZZmnxP+lwu3ARBh0U1kdRAR9aueBK/1t3C1IM
	iIXmq/Ju5+V5GlTv+qrF8173SGRGeBYZs6NsY9Lnt0tzmoTuJfopVqyTI18t0HzpOj9pn5PMOzYER
	Wt3YYzACaE8zomu1gJlCzPvymMiHXU4g==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sBvwt-000G8p-HX; Tue, 28 May 2024 14:29:03 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sBvws-000C97-0D;
	Tue, 28 May 2024 14:29:02 +0200
From: Esben Haabendal <esben@geanix.com>
Subject: [PATCH v2 0/2] memory: fsl_ifc: Make FSL_IFC config visible and
 selectable
Date: Tue, 28 May 2024 14:28:51 +0200
Message-Id: <20240528-fsl-ifc-config-v2-0-5fd7be76650d@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAPOVWYC/3XMQQ7CIBCF4as0s3YMUC3WlfcwXbR0oJMoGDCkp
 uHuYvcu/5e8b4NEkSnBtdkgUubEwddQhwbMMnpHyHNtUEKdxFm1aNMD2Ro0wVt2aC5a90JNqtc
 E9fSKZHndwftQe+H0DvGz+1n+1r9UliixI2t1O81GU3dzNHpejyY8YSilfAHeNOeYrQAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716899341; l=1744;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=rvbdUN0VgLOxYODsqTBZc4SNyjK2yjGwIGw8fwwSIhg=;
 b=1H0rFqG0iwRxc9arIZ+939vI/XBypQXHYkFazli6NBy3csijY7hcf/xVFDS1azQUvTdjmRH/k
 u/XdQsx/uStBk4lCFDMcFLzKhAE/3SrU/borh93m1ZnEBh8C1JPn7+w
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

While use of fsl_ifc driver with NAND flash is fine, as the fsl_ifc_nand
driver selects FSL_IFC automatically, we need the CONFIG_FSL_IFC option to
be selectable for platforms using fsl_ifc with NOR flash.
    
Fixes: ea0c0ad6b6eb ("memory: Enable compile testing for most of the drivers")
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <mwalle@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Naveen N. Rao <naveen.n.rao@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Esben Haabendal <esben@geanix.com>

Changes in v2:
- CONFIG_MTD_NAND_FSL_IFC depends on CONFIG_FSL_IFC instead of select.
- Refresh powerpc config snippet accordingly.
- Link to v1: https://lore.kernel.org/r/20240523-fsl-ifc-config-v1-1-6eff73bdc7e6@geanix.com

---
Esben Haabendal (2):
      memory: fsl_ifc: Make FSL_IFC config visible and selectable
      powerpc/configs: Update defconfig with now user-visible CONFIG_FSL_IFC

 arch/powerpc/configs/85xx-hw.config | 2 ++
 drivers/memory/Kconfig              | 2 +-
 drivers/mtd/nand/raw/Kconfig        | 3 +--
 3 files changed, 4 insertions(+), 3 deletions(-)
---
base-commit: a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
change-id: 20240523-fsl-ifc-config-c877902b297e

Best regards,
-- 
Esben Haabendal <esben@geanix.com>

