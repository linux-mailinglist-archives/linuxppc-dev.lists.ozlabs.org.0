Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCAE1A8170
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 17:08:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491plS31MlzDqg6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 01:08:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=uxpH/vrm; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491nqQ55sHzDqkX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 00:26:42 +1000 (AEST)
Received: from kozik-lap.mshome.net (unknown [194.230.155.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DDC06206D5;
 Tue, 14 Apr 2020 14:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586874399;
 bh=Lg63bhefJlO92twb2XXVp+1t8BwepRn5XnGnurXtetQ=;
 h=From:To:Cc:Subject:Date:From;
 b=uxpH/vrmPABKmIKPEaXtjZRXOWqmXB7aJg1kyMsfQwLf3BH71MoyWyHJ6WWObYhRZ
 co//xuRia8Oomk9lg9TB2YoqWRLvV8PBGuY6TH6OACuukY5Nj8Z9DpaD/YeRi0iP6y
 gX+kh1B4WnpB+e8Rb6vhPqgGBfLcRl5kfotrslEA=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joerg Roedel <joro@8bytes.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH] iommu: spapr_tce: Disable compile testing to fix build on
 book3s_32 config
Date: Tue, 14 Apr 2020 16:26:30 +0200
Message-Id: <20200414142630.21153-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
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
Cc: virtualization@lists.linux-foundation.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Although SPAPR_TCE_IOMMU itself can be compile tested on certain PowerPC
configurations, its presence makes arch/powerpc/kvm/Makefile to select
modules which do not build in such configuration.

The arch/powerpc/kvm/ modules use kvm_arch.spapr_tce_tables which exists
only with CONFIG_PPC_BOOK3S_64.  However these modules are selected when
COMPILE_TEST and SPAPR_TCE_IOMMU are chosen leading to build failures:

    In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20:0,
                     from arch/powerpc/kvm/book3s_64_vio_hv.c:22:
    arch/powerpc/include/asm/book3s/64/pgtable.h:17:0: error: "_PAGE_EXEC" redefined [-Werror]
     #define _PAGE_EXEC  0x00001 /* execute permission */

    In file included from arch/powerpc/include/asm/book3s/32/pgtable.h:8:0,
                     from arch/powerpc/include/asm/book3s/pgtable.h:8,
                     from arch/powerpc/include/asm/pgtable.h:18,
                     from include/linux/mm.h:95,
                     from arch/powerpc/include/asm/io.h:29,
                     from include/linux/io.h:13,
                     from include/linux/irq.h:20,
                     from arch/powerpc/include/asm/hardirq.h:6,
                     from include/linux/hardirq.h:9,
                     from include/linux/kvm_host.h:7,
                     from arch/powerpc/kvm/book3s_64_vio_hv.c:12:
    arch/powerpc/include/asm/book3s/32/hash.h:29:0: note: this is the location of the previous definition
     #define _PAGE_EXEC 0x200 /* software: exec allowed */

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Fixes: e93a1695d7fb ("iommu: Enable compile testing for some of drivers")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/iommu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 58b4a4dbfc78..3532b1ead19d 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -362,7 +362,7 @@ config IPMMU_VMSA
 
 config SPAPR_TCE_IOMMU
 	bool "sPAPR TCE IOMMU Support"
-	depends on PPC_POWERNV || PPC_PSERIES || (PPC && COMPILE_TEST)
+	depends on PPC_POWERNV || PPC_PSERIES
 	select IOMMU_API
 	help
 	  Enables bits of IOMMU API required by VFIO. The iommu_ops
-- 
2.17.1

