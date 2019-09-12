Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A12B084C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 07:35:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TSCd3qkczF3pj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 15:35:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="j79sRjCz"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TS5T6MbHzF3b4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 15:30:05 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id d10so12804531pgo.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 22:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O5EMa9kSRkhIyRCU3y1Xg4+aVx6UvLBrGnvCaJ64bKI=;
 b=j79sRjCzx/pNFsZLKHhjaLxbDJOZV/vQ/jJZth15EMtFBLhe7Ou91glfXBCCw7zWQw
 AwLBO/1ILUSATiYBr6VUJZM2esSipa6+Skz8Ncf2kQEYDGNvOP8Rpqx+8sl8fDNknBWx
 9y9A8SFt5qu5mnIVLHAOrGwZZdBGJ5yFsNjZ+1lJ6Q64L8YNWne6R6x7GBibIXHhJ+wS
 LxRNcvXsC2HaFz42GTw/kASUS67kPqUbxSlgp0c9MCIzDV/l79Dt38kRS5jgZLqMTE9k
 JJNNe4O0HYRqTcpKXb86z/VwsWmRIIzPGKyU58CXO+VvgAY+QKLvVnzxtvU5hMHSM1Hn
 pp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O5EMa9kSRkhIyRCU3y1Xg4+aVx6UvLBrGnvCaJ64bKI=;
 b=msZmsySG1/ai4LYPNkcdVe2frVo37LuYY5TvI1l3NoSE7k3hIr4qCHol9LSHw56AeI
 WfYytwrF5rklYwyUzlrQU1X8M/0I2uyVzFqa85f7SKKSNXPk45j7n65L3Kd0bsetnZrC
 DdYmqU/59I0qenWCxe6i8aQyGmTyPAYDB8ydYAmjFpiwL+GuyON/22bsBy1+BA2Qk+EG
 lozTXzKLGgscR/bwOqIbxo4LcgvYXPV58GJz8D8ZYB/Zs6ifFFcfp3FvQRsaG3w5Quf1
 5rBv/ksCRwJEYS4zl7ZyVrqINcCtsBQZpPtJE8XHhckwBzfHztJ0fNbW7ztifvGOqZWD
 XpWg==
X-Gm-Message-State: APjAAAV8oRTxs7aeu6rAn5JtbHsn4ccwuaIU53NBc7ju3djeLzGb77Cy
 YkXFb9iC9/IrnTSKjWBq70ouezop
X-Google-Smtp-Source: APXvYqxFAg7wY7IgNMZlyupKtDqPWKRHIR0KRh0Uvvzum3la2oRoelK17PHJqLaJiq8/oVOXoY/zQg==
X-Received: by 2002:a65:5183:: with SMTP id h3mr36531388pgq.250.1568266203140; 
 Wed, 11 Sep 2019 22:30:03 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id n66sm35884386pfn.90.2019.09.11.22.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 22:30:02 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] powernv/pci: Add a debugfs entry to dump PHB's IODA PE
 state
Date: Thu, 12 Sep 2019 15:29:45 +1000
Message-Id: <20190912052945.12589-3-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190912052945.12589-1-oohall@gmail.com>
References: <20190912052945.12589-1-oohall@gmail.com>
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

Add a debugfs entry to dump the state of the active IODA PEs. The IODA PE
state reflects how the PHB's internal concept of a PE is configured. This
is separate to the EEH PE state and is managed power the PowerNV PCI
backend rather than the EEH core.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index f684d3a..941902b 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -3061,6 +3061,33 @@ static int pnv_pci_diag_data_set(void *data, u64 val)
 DEFINE_SIMPLE_ATTRIBUTE(pnv_pci_diag_data_fops, NULL,
 			pnv_pci_diag_data_set, "%llu\n");
 
+static int pnv_pci_ioda_pe_dump(void *data, u64 val)
+{
+	struct pnv_phb *phb = data;
+	int pe_num;
+
+	for (pe_num = 0; pe_num < phb->ioda.total_pe_num; pe_num++) {
+		struct pnv_ioda_pe *pe = &phb->ioda.pe_array[pe_num];
+
+		if (!test_bit(pe_num, phb->ioda.pe_alloc))
+			continue;
+
+		pe_warn(pe, "rid: %04x dev count: %2d flags: %s%s%s%s%s%s\n",
+			pe->rid, pe->device_count,
+			(pe->flags & PNV_IODA_PE_DEV) ? "dev " : "",
+			(pe->flags & PNV_IODA_PE_BUS) ? "bus " : "",
+			(pe->flags & PNV_IODA_PE_BUS_ALL) ? "all " : "",
+			(pe->flags & PNV_IODA_PE_MASTER) ? "master " : "",
+			(pe->flags & PNV_IODA_PE_SLAVE) ? "slave " : "",
+			(pe->flags & PNV_IODA_PE_VF) ? "vf " : "");
+	}
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(pnv_pci_ioda_pe_dump_fops, NULL,
+			pnv_pci_ioda_pe_dump, "%llu\n");
+
 #endif /* CONFIG_DEBUG_FS */
 
 static void pnv_pci_ioda_create_dbgfs(void)
@@ -3086,6 +3113,8 @@ static void pnv_pci_ioda_create_dbgfs(void)
 
 		debugfs_create_file("dump_diag_regs", 0200, phb->dbgfs, phb,
 				    &pnv_pci_diag_data_fops);
+		debugfs_create_file("dump_ioda_pe_state", 0200, phb->dbgfs, phb,
+				    &pnv_pci_ioda_pe_dump_fops);
 	}
 #endif /* CONFIG_DEBUG_FS */
 }
-- 
2.9.5

