Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ECF23A084
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 09:56:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKqvK30qrzDqVn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 17:55:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gAoVQFoU; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKqsg2NNBzDqRW
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 17:54:29 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id f9so10900560pju.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 00:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=urHRrEW9xaswf5+COQGZ2OwCE7r40XuL103ZeRNtx0E=;
 b=gAoVQFoUI8MZmDmvpn5Maiqxoz5xzQrJh5acOB03oH28o7JbaNeY4vxFnPTysJ83jN
 vdYujh43jX9/EGcpBc9AFsO5/vQU/Pw3eGhRnTMCuwVSJCe+y9JB00uIN0gC1dA7Ds/C
 /ANLvKK+S2CrqZ5jfpvNhG/ENzc835gLMPdXDa8DEh7OhAFIdMnJ4Rl9C0H8Jy+/elct
 aIvCoJ3kEwZ35cm62vN6lydLpvqx0zX7DxC3+lHvg9OTm0q+VS8fZtdQEaXl+i8ltDzF
 4GJ/D8SfSzaISZ+OYXRhwQpC9WJmFAxdmhMqaBtdVZm0erYjGlcJGEyNdr3b7+7Re6+J
 9wJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=urHRrEW9xaswf5+COQGZ2OwCE7r40XuL103ZeRNtx0E=;
 b=V43UKitHgaCuRqFXxtyuBHSJMXq3bbRXFfaqk80Zk+hs8oBIZmmCOeoizDuyUfAUYA
 Wsq6+m2MZ/OM5cOnu1h3ow7XBf7bGrW8yVASj17s+KZSx43lrkOH3orfvGNRkCYFndZw
 iiK0NwN8xm7eXUy7fJmVX+001U1fJTEZyhSVs0RZBMHnM5kgMhZhuC64QmyByvjnP9yS
 dlbVDTrRtMSJnQlHWY4myYBZV0qeTo4k9uaFQzDw3mcLmUlQ9d1Uz9D3PupksiYnCUPc
 n9ZAR6BLEWoSkxBLgkJzcNG9oO3z8GnTcVUGCGbZgncBzkFQjaJXrfE9WGmB76KxNhss
 DZqQ==
X-Gm-Message-State: AOAM530m9IpLUDHX4pEyORSYpMVU61vDvFj2vIdUA6vkAKXiuQtpg+M+
 TNHOOAvPIXX/79OScOb6HQKW/MrS
X-Google-Smtp-Source: ABdhPJyeu4pyTwOepmqzcyMx+frMs0xVPnnOtam9a8CM0M5pWYuKJ92WfaN8JTbl8Ekd7x0M12KVLw==
X-Received: by 2002:a17:902:8a93:: with SMTP id
 p19mr12640798plo.275.1596441266021; 
 Mon, 03 Aug 2020 00:54:26 -0700 (PDT)
Received: from localhost.ibm.com ([120.17.231.114])
 by smtp.gmail.com with ESMTPSA id q83sm19175797pfc.31.2020.08.03.00.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 00:54:25 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/powernv/sriov: Fix use of uninitialised variable
Date: Mon,  3 Aug 2020 17:54:08 +1000
Message-Id: <20200803075408.132601-1-oohall@gmail.com>
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
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Initialising the value before using it is generally regarded as a good
idea so do that.

Fixes: 4c51f3e1e870 ("powerpc/powernv/sriov: Make single PE mode a per-BAR setting")
Reported-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-sriov.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index 7894745fd4f8..c4434f20f42f 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -253,9 +253,9 @@ void pnv_pci_ioda_fixup_iov(struct pci_dev *pdev)
 resource_size_t pnv_pci_iov_resource_alignment(struct pci_dev *pdev,
 						      int resno)
 {
+	resource_size_t align = pci_iov_resource_size(pdev, resno);
 	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
 	struct pnv_iov_data *iov = pnv_iov_get(pdev);
-	resource_size_t align;
 
 	/*
 	 * iov can be null if we have an SR-IOV device with IOV BAR that can't
@@ -266,8 +266,6 @@ resource_size_t pnv_pci_iov_resource_alignment(struct pci_dev *pdev,
 	if (!iov)
 		return align;
 
-	align = pci_iov_resource_size(pdev, resno);
-
 	/*
 	 * If we're using single mode then we can just use the native VF BAR
 	 * alignment. We validated that it's possible to use a single PE
-- 
2.26.2

