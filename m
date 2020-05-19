Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF0E1D8EC2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 06:31:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R2yy186YzDqsQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 14:31:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49R2xH15LzzDqn1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 14:30:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=h1VgzYYa; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 49R2xG2w7qz9sRK;
 Tue, 19 May 2020 14:30:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1589862626;
 bh=Ry4Kir+nyo4RZ/f/ABNxUjEY0VN07dFy5BB7JTMO8gw=;
 h=From:To:Cc:Subject:Date:From;
 b=h1VgzYYaf75RICEtX8CcEwwCO0A5S0XDJY51hfUXlWap7WBhl0XE+gWdc66mnfLsW
 9rrJeOKSsb8fLN5x79iCQrKwTZkDFAYVg8YwYtMdK8XQbNcsZnZ/+vRJIBJGpbmctz
 SIHLvK70duGfYddep8fTP3Xann0L8M6o7d9RwOoKznHPhPlAcPF6RK0yHKkngy9s44
 Z4+Dy8oPkWAb8+wo/svRt/132erRsUgrTDCF5OnzvU/TmJnCIeba7yCWyQOv110L3a
 U1gh7VSNn0Y2yer4sL8yMshsYs8Kz5Omb9xgdE+NtGXxVag0qNwTAly95afapOz68z
 AYusfWgEfMcGw==
Received: by neuling.org (Postfix, from userid 1000)
 id 058812C04C2; Tue, 19 May 2020 14:30:26 +1000 (AEST)
From: Michael Neuling <mikey@neuling.org>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/configs: Add LIBNVDIMM to ppc64_defconfig
Date: Tue, 19 May 2020 14:30:09 +1000
Message-Id: <20200519043009.3081885-1-mikey@neuling.org>
X-Mailer: git-send-email 2.26.2
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
Cc: Michael Neuling <mikey@neuling.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This gives us OF_PMEM which is useful in mambo.

This adds 153K to the text of ppc64le_defconfig which 0.8% of the
total text.

  LIBNVDIMM text     data    bss     dec      hex
  Without   18574833 5518150 1539240 25632223 1871ddf
  With      18727834 5546206 1539368 25813408 189e1a0

Signed-off-by: Michael Neuling <mikey@neuling.org>
---
 arch/powerpc/configs/ppc64_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index bae8170d74..0a92549924 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -281,6 +281,7 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_DS1307=y
 CONFIG_VIRTIO_PCI=m
 CONFIG_VIRTIO_BALLOON=m
+CONFIG_LIBNVDIMM=y
 CONFIG_RAS=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
-- 
2.26.2

