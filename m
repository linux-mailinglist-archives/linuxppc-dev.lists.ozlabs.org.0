Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A88103198
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:32:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HmtQ5tXyzDqWX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:32:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BNBzgYyT"; 
 dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlW84ggczDqgF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:30:28 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id f7so3437936pjw.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KVsaYDD4bsPn/x/wFgS9NN65OdAuwEIeGr8okzXhdms=;
 b=BNBzgYyTKj7vSV8sRPIAjyLM3fv5iNPvuiBhbW6NlFVhCgf9UwVyoYHXPCbg2D+DP5
 GoGxtg21L7VZIbJZDD0bo3+TnX0iPR9wCGTPnKVTD8QNDbAEfsUy8ZBf2xHR+tbuF6cl
 6zV3HDuqvoPGccrtebliJhQd/DeVNLBz1CU1J/KmCzbykPkS5T/++PhdCscajyuUc04k
 YBCWofPENtZ2bO5MaiIQ1TQiWYK0Uafk0AQ8OgOqGIPfZ++sLhpZtKu76xBxbhFsMeAi
 0i01xTvUBXxphSHuFhBArzyXPZdDjSYkblW50vhog+36tqJnvdbExwO8bOZi8Mfg8qkC
 jtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KVsaYDD4bsPn/x/wFgS9NN65OdAuwEIeGr8okzXhdms=;
 b=HRpZZp/Y0mz5pzLRaiFBAyerIFV3Rx6MQobLLxJtgURpWWk44h6KYdb1xmqh/gbQj1
 TqcKOLDnXm3AuBWksZfWw6oHXdf46fsB21yZwKXKOY/9cXadxvUecqKvV8YBVQohI0J6
 IG2FynDz3p1xHBzf7mOpnilxNIa1Lty5WTi2FBaOJXCU+r56orOfaHVwUzdFNEpEwN1J
 3lKvSOl41RrmWliGict6ySoGhcojbn/6EdBfbD8ZOh2bwm/MbAeMLmehiMlXTFlK5Ofz
 QlK7Gu3hgAJgJaHyzsjymeZeA8ZBi0OnC8ciaKWDFlOhGK1hgSnPUhDbgzkyoYdAkTmH
 RxFg==
X-Gm-Message-State: APjAAAVgZq+vNAoivZLEhVzP3xzylFVzDMPxGjvGcYT17LRkPstLiDlK
 DigQbxVuSPs9c8KwgRxCgv+mohJm
X-Google-Smtp-Source: APXvYqzDjl8j3SfgzxU6CCw+q20M85OdJZA5JjIxwj5gS7wn19RohpS0CvG2VQBwtWSnJ94qxqqj1w==
X-Received: by 2002:a17:902:778b:: with SMTP id
 o11mr273089pll.66.1574213425663; 
 Tue, 19 Nov 2019 17:30:25 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:30:25 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 31/46] powernv/pci: Remove open-coded PE lookup in
 pnv_pci_ioda_dma_dev_setup()
Date: Wed, 20 Nov 2019 12:28:44 +1100
Message-Id: <20191120012859.23300-32-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191120012859.23300-1-oohall@gmail.com>
References: <20191120012859.23300-1-oohall@gmail.com>
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
Cc: alistair@popple.id.au, Oliver O'Halloran <oohall@gmail.com>,
 s.miroshnichenko@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the helper to look up the pnv_ioda_pe for the device we're configuring DMA
for. In the VF case there's no need set pdn->pe_number since nothing looks at
it any more.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index d4b5ee926222..98d858999a2d 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1709,10 +1709,9 @@ int pnv_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 
 static void pnv_pci_ioda_dma_dev_setup(struct pnv_phb *phb, struct pci_dev *pdev)
 {
-	struct pci_dn *pdn = pci_get_pdn(pdev);
 	struct pnv_ioda_pe *pe;
 
-	pe = &phb->ioda.pe_array[pdn->pe_number];
+	pe = pnv_ioda_get_pe(pdev);
 	WARN_ON(get_dma_ops(&pdev->dev) != &dma_iommu_ops);
 	pdev->dev.archdata.dma_offset = pe->tce_bypass_base;
 	set_iommu_table_base(&pdev->dev, pe->table_group.tables[0]);
-- 
2.21.0

