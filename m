Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B31B2291D2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 09:12:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBRVk54hlzDqlr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 17:12:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KgpWj2xr; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBR9h3dH7zDqvr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 16:57:44 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id d7so470654plq.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 23:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bJw0iqXmNmr9DtxXpaTA8LhlkH6t9S6k9Omt08nMv0g=;
 b=KgpWj2xrE3gjkYPYhwTtTh7bxk5HT1nZd30g9BfX7BJOLXq+0VOEPQCmTFhWvHnAr4
 1U4jx/1DeXPNd2Y8FqqT/Me/3DhhMP21RBtZvw9mntNG4S4ewyODqlyo4eZXyjvM9CAq
 nFAlXFHVfXwsWMLTzwvgH2AF5CGb9w1dpcKXezhEFR+NVQ/VtZS4mUIhPSH/Vh3C5s0n
 k4+d9TisAWToksUPYh6ERtzURDItdT4a2GdyQAU6RlX75qNJFuTKC/skR72U8zRtDfYW
 j4K+L15pC68poQUsqb6RnJuDp8DDnQWojNYVQf9tzR0QQnFxqI90Hk98yfpzu2WPaWvG
 +4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bJw0iqXmNmr9DtxXpaTA8LhlkH6t9S6k9Omt08nMv0g=;
 b=nz0pRr7lCdFhXFwaSXe9wzkTdsK6UBUI9EMizdBCemOuRbLXbpC4AhM9X5SD/uw1go
 j05dPbhM22OA2LmzbpGiooJBn5GcFU5jdXnm1HzTkI6uV1XVkF/WJnuSXw3U+rN9VueF
 DCiLN3CloghpOVfPq98/tVDD31ALddEZnvIgSonlJtv1Nhf8ap7zXgQLzYC6Q9xVlqIV
 QkhZx6Ar0pycDYkQqdKqJ74WRtLKU5DexZh6Xr4mlHfV+ExpZXJTCv+zgCa9nMMM939U
 KB8oeQB/oVS4PrLJybMkSkR8AwFlKLEdXIamnIVd0rHfKZtt4AGA/K63uEoy+MkiiQay
 6y8Q==
X-Gm-Message-State: AOAM532xwMuSgyETc4KX5YyE5QX8p0oh8923HAxT0WkuV0ur2HXkLSYK
 jL6MF1o+kapWkS+xzvlAAoww1Ou3k+E=
X-Google-Smtp-Source: ABdhPJyPQTNk9jsCGbt3+21sy4ApDUkGaCXCXRwsyo3nBT/kDnqGfjwTEnSUDYQI2fIbXJzILBwSuw==
X-Received: by 2002:a17:90a:62c1:: with SMTP id
 k1mr7939400pjs.168.1595401061864; 
 Tue, 21 Jul 2020 23:57:41 -0700 (PDT)
Received: from localhost.ibm.com (203-219-159-24.tpgi.com.au. [203.219.159.24])
 by smtp.gmail.com with ESMTPSA id c14sm22645104pfj.82.2020.07.21.23.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 23:57:41 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 07/16] powerpc/powernv/sriov: Rename truncate_iov
Date: Wed, 22 Jul 2020 16:57:06 +1000
Message-Id: <20200722065715.1432738-7-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200722065715.1432738-1-oohall@gmail.com>
References: <20200722065715.1432738-1-oohall@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This prevents SR-IOV being used by making the SR-IOV BAR resources
unallocatable. Rename it to reflect what it actually does.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
v2: no changes
---
 arch/powerpc/platforms/powernv/pci-sriov.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index f4c74ab1284d..216ceeff69b0 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -155,7 +155,7 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
 
 	iov = kzalloc(sizeof(*iov), GFP_KERNEL);
 	if (!iov)
-		goto truncate_iov;
+		goto disable_iov;
 	pdev->dev.archdata.iov_data = iov;
 
 	total_vfs = pci_sriov_get_totalvfs(pdev);
@@ -170,7 +170,7 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
 			dev_warn(&pdev->dev, "Don't support SR-IOV with"
 					" non M64 VF BAR%d: %pR. \n",
 				 i, res);
-			goto truncate_iov;
+			goto disable_iov;
 		}
 
 		total_vf_bar_sz += pci_iov_resource_size(pdev,
@@ -209,7 +209,8 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
 		 * mode is 32MB.
 		 */
 		if (iov->m64_single_mode && (size < SZ_32M))
-			goto truncate_iov;
+			goto disable_iov;
+
 		dev_dbg(&pdev->dev, " Fixing VF BAR%d: %pR to\n", i, res);
 		res->end = res->start + size * mul - 1;
 		dev_dbg(&pdev->dev, "                       %pR\n", res);
@@ -220,8 +221,8 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
 
 	return;
 
-truncate_iov:
-	/* To save MMIO space, IOV BAR is truncated. */
+disable_iov:
+	/* Save ourselves some MMIO space by disabling the unusable BARs */
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
 		res = &pdev->resource[i + PCI_IOV_RESOURCES];
 		res->flags = 0;
-- 
2.26.2

