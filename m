Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B76BFB0847
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 07:31:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TS7S72fYzF43t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 15:31:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zd2Lf+mk"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TS5T6834zF3Zj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 15:30:03 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id i1so6353165pfa.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 22:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lbWc9+TuaRY4n68McU2wLXih77pXzw4y1YZkzM7cfos=;
 b=Zd2Lf+mkIN14//GZpd+r7lkT6wymQxXKTUmgogApuDQrP47I0BQtbGF0aiZ5DXgbbs
 m7KQUqHXGDxZ4ZOvAHCY4xS6Api4kyDWsuqKQf0+FfjeABWZCgdccZ51/QKGf+vDS3rc
 dwmpM4cZGoC4aODkhYPCE/3q7jAcdGpWR7frIWDYkldcQIzbmPXvMZ0xEDktJZ5WVm8k
 MtqCy5JRXzJJLN50xe/kHGbyMTc4eyxUklydAGFmaxggfQIr8X/8sWNGORWq0EMSdEU0
 nJtMgOUQC3E5y1ZLRodHuNKhYe1hEcxHxtwnR0ZcsrRUxBZ5uTpEH9ZJbS6erI4nnJXG
 KlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lbWc9+TuaRY4n68McU2wLXih77pXzw4y1YZkzM7cfos=;
 b=i64bYwKI8wHm03nQaNlrTfQBaNYsXdkNxAmbDytApRlW9sXatjQI/ALmtnVjz7wLhc
 curCPDijjaTxp3UOInt5RwIRjMDyjhortRnVMVqu00pELhRDaAY0Dt29FRNj1PXrBQzf
 o+pgIfnmDzH/c/KT/MisaD2U6aDq8oli9LaEXvzxycX8VTkRwNts87KVoCO6iK3Suhyi
 ikjr8pzSimJMokul4IaB6Kk6hfZ0JbiNfYgMOnAa/Lfdefn78GjAsEET8UZld02ToJaR
 8ks7+kjhFPwsGMuYz4t4ccYKi2+4ccNE0apYCRKflEwjILR0rXBDi3VH8jVV70ZIlTkq
 yIfQ==
X-Gm-Message-State: APjAAAVZVmxv7JQL1SmJee6tcuPWk93CscuIomnmw5n8M6a/PuPIBBvr
 etxA5Sy9tspOJ1V3FT+SJgWVND7t
X-Google-Smtp-Source: APXvYqxKgtQ3c8Tzbckv3vzKhkhY0/VTTnEbWZIrl09EV2aiaZU/EQRFyak7Id37uzN2aZ88jBkVaQ==
X-Received: by 2002:a17:90a:3387:: with SMTP id
 n7mr9341971pjb.26.1568266199641; 
 Wed, 11 Sep 2019 22:29:59 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id n66sm35884386pfn.90.2019.09.11.22.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 22:29:58 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powernv/pci: Use pnv_phb as the private data for debugfs
 entries
Date: Thu, 12 Sep 2019 15:29:43 +1000
Message-Id: <20190912052945.12589-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
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

Use the pnv_phb structure as the private data pointer for the debugfs
files.  This lets us delete some code and an open-coded use of
hose->private_data.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 2f650e1..b24339b 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -3044,19 +3044,12 @@ static void pnv_ioda_setup_pe_seg(struct pnv_ioda_pe *pe)
 #ifdef CONFIG_DEBUG_FS
 static int pnv_pci_diag_data_set(void *data, u64 val)
 {
-	struct pci_controller *hose;
-	struct pnv_phb *phb;
+	struct pnv_phb *phb = data;
 	s64 ret;
 
 	if (val != 1ULL)
 		return -EINVAL;
 
-	hose = (struct pci_controller *)data;
-	if (!hose || !hose->private_data)
-		return -ENODEV;
-
-	phb = hose->private_data;
-
 	/* Retrieve the diag data from firmware */
 	ret = opal_pci_get_phb_diag_data2(phb->opal_id, phb->diag_data,
 					  phb->diag_data_size);
@@ -3094,7 +3087,7 @@ static void pnv_pci_ioda_create_dbgfs(void)
 			continue;
 		}
 
-		debugfs_create_file("dump_diag_regs", 0200, phb->dbgfs, hose,
+		debugfs_create_file("dump_diag_regs", 0200, phb->dbgfs, phb,
 				    &pnv_pci_diag_data_fops);
 	}
 #endif /* CONFIG_DEBUG_FS */
-- 
2.9.5

