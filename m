Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A9A21AEE1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 07:44:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B326s3wZzzDrNm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 15:44:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oUm/2j4A; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B31gN052KzDrHy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 15:24:15 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id f18so4587810wrs.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 22:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yjFBAfMSdSR2RLDZl/53A4AuXVN4BJQAVTP8K1aAgMs=;
 b=oUm/2j4AoPGrtuPrYNcl7ONb/z69zR0XRjLaWGeSAUvz/p2UJrua90xhvB/4eVLxqj
 VBAQJ519DDVRVLI+tVu61a/Ej8QVkKjchKexYbG/GXYBhNN9QNQ1TuZJn7mAf+SmIkhl
 QZhTz+jX0Q8usvHjINyZYZGZ2lbHU150I0V/9ukcuoxRtT6umbKVKDN/lIR82RvfDQkS
 VI4FV5GJufi9d24CwVswM17dhuMzH1ZhDS09f1A0OuJxlanQL4Ho5UhEmmtUsCYd1Gli
 ka3NyBQRgxVlSVlmxdMLao8JtvHJzrEZXjY2tH5Qog1C+E22JZPdqgFNI78u+keSmNOL
 bG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yjFBAfMSdSR2RLDZl/53A4AuXVN4BJQAVTP8K1aAgMs=;
 b=tI7OjoFeOgHEenqb4n8uZ/F4BeAKpWCfCnH1pzWRJC44nSy+2MtVdxKzKaiumoP49X
 IslQ3QhXYghJ0XWY/hlpk91M1mu2Xds3RXyr+uDEIDPmt3/rIE8UpSNfToKMCpPOhlPT
 bnZiiyhqbJZg4gYo6AzDavSkwxgcUAe4c5GI5wiqyuYENqfNeAW74NnjcNtDCxdHS2DW
 x+Ob/QsSAyOdSq+FL4qXV13gKklkwj3P6C4mhBPa50VlYF9Bqr83r0hRyz9yB+Rw/er0
 Rx5gGyFKxYaN1eMWmCuBbEA++AWUuhW3ilsIPPJYJoSWTkklOyThlR4W2WDnk0fwu7RO
 +hSQ==
X-Gm-Message-State: AOAM5338Ag0V/5QtNY2xT4ORXDuwUywog9WxTl52u+VYG64uYsK9SLoE
 zeJ433EmG5S9RhehnICPlIpYZ5px5HM=
X-Google-Smtp-Source: ABdhPJzDQsAFDHm199IO9Dk7WFaKLCDfKUQYh2J5nCXmKYJiKIQEstnM2j+P8G2ZGTvcyJcRgSXPCw==
X-Received: by 2002:a5d:444e:: with SMTP id x14mr63305893wrr.279.1594358652197; 
 Thu, 09 Jul 2020 22:24:12 -0700 (PDT)
Received: from 192-168-1-18.tpgi.com.au ([220.240.245.68])
 by smtp.gmail.com with ESMTPSA id 92sm9090941wrr.96.2020.07.09.22.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 22:24:11 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 07/15] powerpc/powernv/sriov: Rename truncate_iov
Date: Fri, 10 Jul 2020 15:23:32 +1000
Message-Id: <20200710052340.737567-8-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200710052340.737567-1-oohall@gmail.com>
References: <20200710052340.737567-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This prevents SR-IOV being used by making the SR-IOV BAR resources
unallocatable. Rename it to reflect what it actually does.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
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

