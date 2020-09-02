Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9067525A433
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 06:01:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh9HB3tjZzDqf9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 14:01:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qUl1WJIk; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh94G6vNWzDqMb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 13:52:14 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id c15so1647992plq.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Sep 2020 20:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3mE+hpo4ICBWbEi7xh+FqBBZwpmRS766avAgmm2Lrbc=;
 b=qUl1WJIkCNIPS5SXX8cu5XFs+SL2nkCV/M0MUuEiDzXKZwyXW28pSZm9+dNC31gxEd
 Kvigxj7sNSz5YHWCRZFj1k/tD6ct3AT0VxNWt1WhEqJyS/goTgTHuKSW0baBsbJsDwhd
 +/yuQiECn4HvhXqdCt2EAacdOktsG1Td4D+HOUfA7SC1h8m0RYeQ/Gv9YWKun8dQjZ41
 oNNv13ApQJOkr0abFCO2kUGlRpoF1XFX8LGQoElcjzRyXtHmI5AnsOjs7e6icYYFoC3O
 uXrFuYUUcrXsR92x6bg4AYQ4bwdiREKq9pncu+N6sVoWSaxI9UAu0IQmfYaUCHtDGwXu
 YwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3mE+hpo4ICBWbEi7xh+FqBBZwpmRS766avAgmm2Lrbc=;
 b=Ubi/kPW4lfpHh5ZWFc57pxeDy7v9On7KRAI6T+Xi4a7Vd6ii+W9t3vG+/0ZGdb/293
 WxUfdoZPGjgXmId0ZtpOpTKXnrPt77PxKSkROl3zhtX1/O3ozbVE3SyzwrTYION7BVUV
 DRiHaaq2Q8FCz8JF65xYgXJ1FAt3WKFgCIrnizRpHFrJFracjVl3Y7RYAD5e7zfvEoAo
 lfIwZVXLzncYM+O8IgKCRfChKKf23IPNnppas4jU+GpnP0gcNH2vO97ykkuFacST0o6P
 a0nEXR/VfJQPrmOrCrTH4HLv2KSudNOMJl/6r9888oIf+VizWhORSfC0mw72eu1G2vb1
 B02w==
X-Gm-Message-State: AOAM5333QYRc1dv0HlozG24zolZgXriIJZ4k/DfBrD1pXHNZHN/NTEIX
 6rbyz9SZzC77H9uqw2HnoWayhVIHJrV2Qw==
X-Google-Smtp-Source: ABdhPJwKaILmv1YUvv6LW/tbntYJ/eNgtpRK6xglMAnP1djBNiYd7cUt9Ml591092/AaYpk57qjXbQ==
X-Received: by 2002:a17:90a:9382:: with SMTP id
 q2mr456385pjo.118.1599018731352; 
 Tue, 01 Sep 2020 20:52:11 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id n128sm3790510pfd.29.2020.09.01.20.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 20:52:10 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/powernv/pci: Drop VF MPS fixup
Date: Wed,  2 Sep 2020 13:51:59 +1000
Message-Id: <20200902035159.1762596-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The MPS field in the VF config space is marked as reserved in current
versions of the SR-IOV spec. In other words, this fixup doesn't do
anything.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/eeh-powernv.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 9af8c3b98853..0cabe4e632e3 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -1689,24 +1689,6 @@ static struct eeh_ops pnv_eeh_ops = {
 	.notify_resume		= NULL
 };
 
-#ifdef CONFIG_PCI_IOV
-static void pnv_pci_fixup_vf_mps(struct pci_dev *pdev)
-{
-	struct pci_dn *pdn = pci_get_pdn(pdev);
-	int parent_mps;
-
-	if (!pdev->is_virtfn)
-		return;
-
-	/* Synchronize MPS for VF and PF */
-	parent_mps = pcie_get_mps(pdev->physfn);
-	if ((128 << pdev->pcie_mpss) >= parent_mps)
-		pcie_set_mps(pdev, parent_mps);
-	pdn->mps = pcie_get_mps(pdev);
-}
-DECLARE_PCI_FIXUP_HEADER(PCI_ANY_ID, PCI_ANY_ID, pnv_pci_fixup_vf_mps);
-#endif /* CONFIG_PCI_IOV */
-
 /**
  * eeh_powernv_init - Register platform dependent EEH operations
  *
-- 
2.26.2

