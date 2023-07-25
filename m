Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0DB761666
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 13:39:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rYevm7rH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9FRc59MCz3cCt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 21:39:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rYevm7rH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9FQp0xZmz3bpp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 21:38:25 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3134E61682;
	Tue, 25 Jul 2023 11:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76338C433C8;
	Tue, 25 Jul 2023 11:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1690285103;
	bh=D3z+YbSLBYG4Wv37bcVW08oLAUKHiJDVBFfasBFqiJI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rYevm7rHLzaGmV531XrS7f9dO0l+X73HqPVafM+A5+yr/+bvg5XZLRrVR9kEt7T/p
	 2f6lA8sUvdIQbWZb7M50fPYs0poR99aM9TrhDgdrG0buas6IJ/1BcW6jV3crMumCuS
	 f9SPgQbQGEKR+JnzRMjo6CIo7DUsCsW0qRSKE71I=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 5.4 084/313] soc/fsl/qe: fix usb.c build errors
Date: Tue, 25 Jul 2023 12:43:57 +0200
Message-ID: <20230725104524.595666943@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725104521.167250627@linuxfoundation.org>
References: <20230725104521.167250627@linuxfoundation.org>
User-Agent: quilt/0.67
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
Cc: Sasha Levin <sashal@kernel.org>, Kumar Gala <galak@kernel.crashing.org>, kernel test robot <lkp@intel.com>, Nicolas Schier <nicolas@jasle.eu>, Masahiro Yamada <masahiroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, patches@lists.linux.dev, Leo Li <leoyang.li@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Qiang Zhao <qiang.zhao@nxp.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-arm-kernel@lists.infradead.org, Nicolas Schier <nicolas@fjasle.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 7b1a78babd0d2cd27aa07255dee0c2d7ac0f31e3 ]

Fix build errors in soc/fsl/qe/usb.c when QUICC_ENGINE is not set.
This happens when PPC_EP88XC is set, which selects CPM1 & CPM.
When CPM is set, USB_FSL_QE can be set without QUICC_ENGINE
being set. When USB_FSL_QE is set, QE_USB deafults to y, which
causes build errors when QUICC_ENGINE is not set. Making
QE_USB depend on QUICC_ENGINE prevents QE_USB from defaulting to y.

Fixes these build errors:

drivers/soc/fsl/qe/usb.o: in function `qe_usb_clock_set':
usb.c:(.text+0x1e): undefined reference to `qe_immr'
powerpc-linux-ld: usb.c:(.text+0x2a): undefined reference to `qe_immr'
powerpc-linux-ld: usb.c:(.text+0xbc): undefined reference to `qe_setbrg'
powerpc-linux-ld: usb.c:(.text+0xca): undefined reference to `cmxgcr_lock'
powerpc-linux-ld: usb.c:(.text+0xce): undefined reference to `cmxgcr_lock'

Fixes: 5e41486c408e ("powerpc/QE: add support for QE USB clocks routing")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/all/202301101500.pillNv6R-lkp@intel.com/
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Leo Li <leoyang.li@nxp.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Kumar Gala <galak@kernel.crashing.org>
Acked-by: Nicolas Schier <nicolas@jasle.eu>
Signed-off-by: Li Yang <leoyang.li@nxp.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/fsl/qe/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
index cfa4b2939992c..3ed0838607647 100644
--- a/drivers/soc/fsl/qe/Kconfig
+++ b/drivers/soc/fsl/qe/Kconfig
@@ -38,6 +38,7 @@ config QE_TDM
 
 config QE_USB
 	bool
+	depends on QUICC_ENGINE
 	default y if USB_FSL_QE
 	help
 	  QE USB Controller support
-- 
2.39.2



