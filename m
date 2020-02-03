Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4051502C6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 09:46:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48B1d61bjnzDqQ0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 19:46:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kNTxH/k+; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48B1PD15QnzDqMG
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Feb 2020 19:35:44 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id k29so7171786pfp.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Feb 2020 00:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LKwdH09SzNxjHkeVTudGCGhAfB8aqi4KXW8CPYLAVOI=;
 b=kNTxH/k+iiYELgUrFy/g/SMqLgD7Qp7xQ5Tz8G8OdQNdx6mBHsjSS6PGloUPHZpHGw
 fJE3HIVlY1KEFlekvm0/53vkeCfRIs4c7qgpAuHo0xDF2VKHnElHbvFXPzuoR24PgBR9
 35Nvc763MGasdH0fwKhMC8NZFomb3TRe2MvrYI+U5Kf6Hk5jKTLDi52GHtV7NRjSk+dK
 L+qfg12Lr3AGb9EHC1nup2Pu42N4OL4xZkV4d+lBX2+FH2SM+QkDjWjaGVa60OLOmNZp
 gmV4IDKfgHdYbPtgmRMQJWwO7LkbnioH6vmwuRFmJkqtil/ZW0UTMcCsfdJ27jgNJRq5
 tYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LKwdH09SzNxjHkeVTudGCGhAfB8aqi4KXW8CPYLAVOI=;
 b=Fy9d9chpKlqwqS3m6N+yI9QtLXfixcz91Gr/DR9wUkGeZe4tLCOKyHWkLnimJsFPP0
 7nq4bGenXWOxcJd8OxubE7/pKAht9z0VYpA5YvSevHH4eCXqj15ppQVKQ8ohsgkXvVwO
 onzzeZaG+NgdqeJBcPvcP6Aa8E4P8XQw52uoXAotSJnt2MzDyTnYIV2W5qtUqKiGfIzR
 w/XDQLVXTKvkPc7Amq3RtWeNFI9cAzhcposszSlPa5uohhD0x7sXb0rizWKXgvZanPNo
 h55VXF1Ygb01wJ5XZfpV00NfBMCJUq6kwc6U+n3aZaCKVms0UwWiABtxt5XANqikzabY
 5Nqg==
X-Gm-Message-State: APjAAAV6BOW/zHKYAEvx35S5zqpjrcLKr7wu1BUkI9E+cxb0KGBBOYU0
 DaUVKU7EM91PCyPh7qANdGxvaVQk
X-Google-Smtp-Source: APXvYqxjUSCN7E/swn2sE0E2Sfo72PMXaESHUCbPildgY24n94W+OZ6WkfSGba9Ysl0dNsi9Wxu3og==
X-Received: by 2002:a63:e74f:: with SMTP id j15mr19335684pgk.20.1580718942299; 
 Mon, 03 Feb 2020 00:35:42 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id q63sm19849132pfb.149.2020.02.03.00.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 00:35:41 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/6] powerpc/eeh: Remove PHB check in probe
Date: Mon,  3 Feb 2020 19:35:19 +1100
Message-Id: <20200203083521.16549-5-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200203083521.16549-1-oohall@gmail.com>
References: <20200203083521.16549-1-oohall@gmail.com>
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
Cc: sbobroff@linux.ibm.com, tyreld@linux.ibm.com,
 Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This check for a missing PHB has existing in various forms since the
initial PPC64 port was upstreamed in 2002. The idea seems to be that we
need to guard against creating pci-specific data structures for the non-pci
children of a PCI device tree node (e.g. USB devices). However, we only
create pci_dn structures for DT nodes that correspond to PCI devices so
there's not much point in doing this check in the eeh_probe path.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/eeh.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 9cb3370..a9e4ca7 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1120,7 +1120,6 @@ core_initcall_sync(eeh_init);
  */
 void eeh_add_device_early(struct pci_dn *pdn)
 {
-	struct pci_controller *phb = pdn ? pdn->phb : NULL;
 	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
 
 	if (!edev)
@@ -1129,11 +1128,6 @@ void eeh_add_device_early(struct pci_dn *pdn)
 	if (!eeh_has_flag(EEH_PROBE_MODE_DEVTREE))
 		return;
 
-	/* USB Bus children of PCI devices will not have BUID's */
-	if (NULL == phb ||
-	    (eeh_has_flag(EEH_PROBE_MODE_DEVTREE) && 0 == phb->buid))
-		return;
-
 	eeh_ops->probe(pdn, NULL);
 }
 
-- 
2.9.5

