Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC171031A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:36:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hmyv65GkzDqfB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:36:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TKmN4fL2"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlWF149FzDqgr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:30:33 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id z4so13324737pfn.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Vqp0maBKu5UtDguZIEL6Xs9ElBMEwvHJ4eFcubBGMg=;
 b=TKmN4fL2Xpuu04tfCASX/lWWDvK15yHV6rQ7BQYDw3EDVIVe4Vj2ivxJZPi6yYJLrB
 IHqAWevbG6yLnEbmTj6f2ucnOzxgJSZfFVVVcctgd4B3jSeuNXPKc3BkvxJEF4zOlCsa
 QiFCeS7eBU4B0AFSaKojVja51AStStUj1ZeHpxz+Qd9zgWsB1kzzXTGdtZqeGSbdq3wI
 J57Tfdvs2pr2k/5cK6l+nlPenIkz6rmOhmgqus8SrNoG14z9rnzv5Is2AMk5wvEYZdGn
 XM09GgjkdWXthODcidoKQiabQWviVA+gNj3ZaNfZQpYGm4Dcv4+2a/S7NXN46QsooIbf
 GMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Vqp0maBKu5UtDguZIEL6Xs9ElBMEwvHJ4eFcubBGMg=;
 b=gUEc5QaLcfdIU3uIukV4Qy3IVR+RcSHOlPIWkL4mnnCok/h0yee9sv4xm8A8sv3wHd
 ab4zUO9JA+Z1iCmTLhAJQ55WMLt965McwCVriXG1pYOK5dz+NO4r+QoqDEn8F3bzMM4j
 ClLbDDiiWXa7dUjTLWtxAmWwzL8hE5NGxvLKRMKDHC4+AiJ+/TP+kHGtCWE3EQN6p+85
 q7z8qF6t1j91MZdjTD13xU6SeBoKp8jwJM/fSTMgVn3ZXqPczaIStBtGsdd9+ojlkkK0
 rCauu6AmSZKcAlPjcZ7rO8ghKZGAbRvBQ9YPqvLh6Zeq11KKfm+Xn+ESl1GBB/VKTx34
 kjrw==
X-Gm-Message-State: APjAAAVwevRXsqVZR3Euh72D09swQvwM8rLNyaS8F+JLYbHzI3tc0KCs
 HN2SgQzhKDWI/V+u4o7m45DrFzSa
X-Google-Smtp-Source: APXvYqxy+6Ceox34Bsh5nKaDv62zKURvE7ze9ibytYTWBtqt4lQicx/nNNh+Cqaxq299zghqWnFq3w==
X-Received: by 2002:a63:ec03:: with SMTP id j3mr193845pgh.212.1574213430517;
 Tue, 19 Nov 2019 17:30:30 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:30:30 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 33/46] powernv/pci: Remove open-coded PE lookup in iommu
 notifier
Date: Wed, 20 Nov 2019 12:28:46 +1100
Message-Id: <20191120012859.23300-34-oohall@gmail.com>
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

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 5b1f4677cdce..0eeea8652426 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -943,23 +943,22 @@ static int pnv_tce_iommu_bus_notifier(struct notifier_block *nb,
 {
 	struct device *dev = data;
 	struct pci_dev *pdev;
-	struct pci_dn *pdn;
 	struct pnv_ioda_pe *pe;
 	struct pnv_phb *phb;
 
 	switch (action) {
 	case BUS_NOTIFY_ADD_DEVICE:
 		pdev = to_pci_dev(dev);
-		pdn = pci_get_pdn(pdev);
 		phb = pci_bus_to_pnvhb(pdev->bus);
 
 		WARN_ON_ONCE(!phb);
-		if (!pdn || pdn->pe_number == IODA_INVALID_PE || !phb)
+		if (!phb)
 			return 0;
 
-		pe = &phb->ioda.pe_array[pdn->pe_number];
-		if (!pe->table_group.group)
+		pe = pnv_ioda_get_pe(pdev);
+		if (!pe || !pe->table_group.group)
 			return 0;
+
 		iommu_add_device(&pe->table_group, dev);
 		return 0;
 	case BUS_NOTIFY_DEL_DEVICE:
-- 
2.21.0

