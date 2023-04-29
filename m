Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BBE6F22F1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Apr 2023 06:36:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q7cBV2LXCz3f3x
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Apr 2023 14:36:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iNPC4REh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iNPC4REh;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q7c8r5wltz3f5Q
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Apr 2023 14:35:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=bKr3wYG2niHqpoV2pFVL8uxWHOO4mQ21NZMP7Olit1I=; b=iNPC4REhngjEc0OQslhySER/Sk
	j1v6o1c91VKnIMMCtkFJCCd94DPHi9hSmIOY6szKGFNOnQOTCx2szcLjqUhz6gwuPbLKnKSAm5FS8
	xOxTG8O1B3DLc0CLJyNjsj+Dri9RMPmuTi7faLuxSYgptoNEQ31THz5VNXqV2Newe0f7HQm0OO7sO
	ZUU+KNEeMWmna1Rvw8ETROQgpInYlDncu4lqfRRwIxyJB5QXgCFoa6RPC7QpAor3r4vNpFsVzH+ei
	nCijojfl6zIELTEwx17ch94qYNyaWAj6n9BIbu+1q+b94d69F+YrUabMhPEV7D9ttVlhffgVmMcMI
	ldeXAPKA==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pscIp-00CE8G-2X;
	Sat, 29 Apr 2023 04:35:19 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH -next?] powerpc/fsl_uli1575: fix kconfig warnings and build errors
Date: Fri, 28 Apr 2023 21:35:19 -0700
Message-Id: <20230429043519.19807-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.40.1
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
Cc: Randy Dunlap <rdunlap@infradead.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Neither FSL_SOC_BOOKE nor PPC_86xx enables CONFIG_PCI by
default, so it may be unset in some randconfigs.
When that happens, FSL_ULI1575 may be set when it should not be
since it is a PCI driver. When it is set, there are 3 kconfig
warnings and a slew of build errors

WARNING: unmet direct dependencies detected for PCI_QUIRKS
  Depends on [n]: PCI [=n]
  Selected by [y]:
  - FSL_PCI [=y]

WARNING: unmet direct dependencies detected for GENERIC_ISA_DMA
  Depends on [n]: ISA_DMA_API [=n]
  Selected by [y]:
  - FSL_ULI1575 [=y] && (FSL_SOC_BOOKE [=n] || PPC_86xx [=y])

WARNING: unmet direct dependencies detected for PPC_INDIRECT_PCI
  Depends on [n]: PCI [=n]
  Selected by [y]:
  - FSL_PCI [=y]

and 30+ build errors.

Fixes: 22fdf79171e8 ("powerpc/fsl_uli1575: Allow to disable FSL_ULI1575 support")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Pali Rohár <pali@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/platforms/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff -- a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -265,6 +265,7 @@ config CPM2
 config FSL_ULI1575
 	bool "ULI1575 PCIe south bridge support"
 	depends on FSL_SOC_BOOKE || PPC_86xx
+	depends on PCI
 	select FSL_PCI
 	select GENERIC_ISA_DMA
 	help
