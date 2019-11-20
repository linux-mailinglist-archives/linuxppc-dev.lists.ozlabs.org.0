Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B17103172
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:14:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HmTR70HPzDqmh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:14:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eI2ka/tx"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlVk1QMGzDqfk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:30:06 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id h13so12999946plr.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=df2zryI1IkuATx51yJJcACHqUyifcNXGdNB9+Xhv0fU=;
 b=eI2ka/txmLlgFbBYj3ITAUe230DP+a3qufXybJ0pq8xTDELjukf16Y0QBY4qbLdDj0
 QXy1WHj11H6J/MFuPE3t42c6Y44xorspEjv57kmjPaScKypv76hUGcm5oJZQzuGkxtVK
 ZvlHKajlqN98ghN0e5fu8w8RKX9EUfDqTJjyUbajwvqp2P0LTIoO8Rw3NtvkZ5GTDJWG
 6f0U5YSUELjBTjGghCvAT5amVASScpM83UE9wqjgVVY5gxYee6JfCWa2X+7gF2/mjm6L
 3Org8+ROzL9Qc33ifvA/67bifs4btPrRpLWSETLNaX7T9suWK5Krq6KtEWbyhXj4s7gn
 qXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=df2zryI1IkuATx51yJJcACHqUyifcNXGdNB9+Xhv0fU=;
 b=FI7D5SgmF19h4Odb+AdsivhlEXI4YwVP8OqzD5ZUVzGiZbFAj79ZlrbPT7/j0vyDyY
 vxtj/3nFE4ps3Vxas6Fm8kX51OcU2EWtbEoNvePRPz5qt1ZCdCoc5rHE6Y4mqo4rmFSO
 Cef2jufV17JNDWxctw4+9IYp1/Q4JhyST8Gacn82W4YmXq0IbyfIF6Ly3KWFeI8qFQoG
 8PIuyXdFTIlW9x/N7HOKThnwG34wCPISLOTyX4s/uwlT/DBzkF7iayWTZ3BkSPFWkSg+
 l8VJrLZszCwB1+Pg9cKYJnLMzFFVP9D7Z5nzS3n5oKR5HHH5/XDk1bppJzBAtBMA1BIk
 vqzQ==
X-Gm-Message-State: APjAAAWsU800Y2Jk6ZnsSI4QoPsiNcHyyxQOz/VJM6LXVRwsDmmzyrnm
 Y7yyFQqTgcd+LKnc85cMuqTGkwAU
X-Google-Smtp-Source: APXvYqzrK2D1ZakdkEUwOzVmcZrb4Cn9gmMGXKregvIDs0PI7f10X1GVCRdG4Cby6lGuh7oLQdardw==
X-Received: by 2002:a17:902:5ace:: with SMTP id
 g14mr224436plm.73.1574213403919; 
 Tue, 19 Nov 2019 17:30:03 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:30:03 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 22/46] powernv/eeh: Allocate eeh_dev's when needed
Date: Wed, 20 Nov 2019 12:28:35 +1100
Message-Id: <20191120012859.23300-23-oohall@gmail.com>
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

Have the PowerNV EEH backend allocate the eeh_dev if needed rather than using
the one attached to the pci_dn. This gets us most of the way towards decoupling
pci_dn from the PowerNV EEH code.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
We should probably be free()ing the eeh_dev somewhere. The pci_dev release
function is the right place for it.
---
 arch/powerpc/platforms/powernv/eeh-powernv.c | 22 ++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 1cd80b399995..7aba18e08996 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -366,10 +366,9 @@ static int pnv_eeh_write_config(struct eeh_dev *edev,
  */
 static struct eeh_dev *pnv_eeh_probe_pdev(struct pci_dev *pdev)
 {
-	struct pci_dn *pdn = pci_get_pdn(pdev);
-	struct pci_controller *hose = pdn->phb;
-	struct pnv_phb *phb = hose->private_data;
-	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
+	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
+	struct pci_controller *hose = phb->hose;
+	struct eeh_dev *edev;
 	uint32_t pcie_flags;
 	int ret;
 	int config_addr = (pdev->bus->number << 8) | (pdev->devfn);
@@ -415,12 +414,27 @@ static struct eeh_dev *pnv_eeh_probe_pdev(struct pci_dev *pdev)
 	if ((pdev->class >> 8) == PCI_CLASS_BRIDGE_ISA)
 		return NULL;
 
+	/* otherwise allocate and initialise a new eeh_dev */
+	edev = kzalloc(sizeof(*edev), GFP_KERNEL);
+	if (!edev) {
+		pr_err("%s: out of memory lol\n", __func__);
+		return NULL;
+	}
+
 	/* Initialize eeh device */
+	edev->bdfn       = config_addr;
+	edev->controller = phb->hose;
+
 	edev->class_code = pdev->class;
 	edev->pcix_cap = pci_find_capability(pdev, PCI_CAP_ID_PCIX);
 	edev->pcie_cap = pci_find_capability(pdev, PCI_CAP_ID_EXP);
 	edev->af_cap   = pci_find_capability(pdev, PCI_CAP_ID_AF);
 	edev->aer_cap  = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_ERR);
+
+	/* TODO: stash the vf_index in here? */
+	if (pdev->is_virtfn)
+		edev->physfn = pdev->physfn;
+
 	if ((pdev->class >> 8) == PCI_CLASS_BRIDGE_PCI) {
 		edev->mode |= EEH_DEV_BRIDGE;
 		if (edev->pcie_cap) {
-- 
2.21.0

