Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA48685D4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 10:59:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nHXm5wKrzDqQT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 18:59:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PQQudcCY"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nHSr5RGMzDqQn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 18:56:27 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id i2so7972546plt.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 01:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tPda7gPSdqwWVcRAT6/H4iPhUo7uiT7B8qZSeaWNhFY=;
 b=PQQudcCYIthEFvsjyPr/G9LE9ZSZFXwG0Pu6QqgIpdxY5zY2i0VFmvHz/N/kot9fKX
 bfrGpSXQytdfzur9v2jb7UwPVVhmizm1KHahwywpfssYlur9dWrKIRTptJze4MHpYWUc
 dkLSSiV/GwVxGVt4FbtG/5X5TqtI93s4wHUvlYxGc6PLlxZAvnfuj+JcSPM3IvQGn18z
 OUhpxQCJGFrHWPbZqE8EIZ6RLv4N4ZlbnKsHkOs2zgIpAQUxL5PeHwXVU/U14J62VjrJ
 uy++wxRPbz99ytrwFxbQZqvkjpUtzisKRG5tGMn+hT5Ynm94bJrNG0mB05mx+c8KuwlY
 ZAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tPda7gPSdqwWVcRAT6/H4iPhUo7uiT7B8qZSeaWNhFY=;
 b=XEWPlrUCyKn5t56/idsl7FO4rST7BwqUL+US1qS9DAVeEUHu6KmK6X8jyvYfnzKOBs
 qiGAWHEAkFFhz1uXjigxUtLFQVo9Eu744C9L1fjanXQ8l6NLFrf/upgLzn61dzLWIoZU
 85lqR+mZ11TH3M13JE+DkG3/v7BmSLeqTguj7U6T+H4ETvIaodwXhWuFTP28h2DsrcVh
 v3YfXmNKkn1ebfOKPVCiGlGZJMueOBlOE7S0bJDwzbV233I/ltSAhRrULsUTxhv8WkUz
 PlhcAuBtpxwFCgW0SkB9TDhyYu+Rlku+wydfHjW5rxB35bNqxXE2d4K6Akx9DP88d5aO
 T/2Q==
X-Gm-Message-State: APjAAAVQPhucu+N7jPSnLsZBx3UlSxZG+tkEBXhz7HHC74MaZMKRFjo2
 aWCs3TCVW5LF13HolQCIRaw3pKGZBSQ=
X-Google-Smtp-Source: APXvYqztEKewgkpEppoid+GYzcawvreBxhWaff06LIJ6AixEPyY7A9CtFNZ4l6S4n0cQepeKjEhaiA==
X-Received: by 2002:a17:902:1125:: with SMTP id
 d34mr27142286pla.40.1563180985223; 
 Mon, 15 Jul 2019 01:56:25 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id d14sm22514815pfo.154.2019.07.15.01.56.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 01:56:24 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/5] powerpc/eeh_cache: Don't use pci_dn when inserting new
 ranges
Date: Mon, 15 Jul 2019 18:56:08 +1000
Message-Id: <20190715085612.8802-2-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190715085612.8802-1-oohall@gmail.com>
References: <20190715085612.8802-1-oohall@gmail.com>
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
Cc: sbobroff@linux.ibm.com, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At the point where we start inserting ranges into the EEH address cache the
binding between pci_dev and eeh_dev has already been set up. Instead of
consulting the pci_dn tree we can retrieve the eeh_dev directly using
pci_dev_to_eeh_dev().

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/eeh_cache.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_cache.c b/arch/powerpc/kernel/eeh_cache.c
index 3204723..908ba69 100644
--- a/arch/powerpc/kernel/eeh_cache.c
+++ b/arch/powerpc/kernel/eeh_cache.c
@@ -156,18 +156,10 @@ eeh_addr_cache_insert(struct pci_dev *dev, resource_size_t alo,
 
 static void __eeh_addr_cache_insert_dev(struct pci_dev *dev)
 {
-	struct pci_dn *pdn;
 	struct eeh_dev *edev;
 	int i;
 
-	pdn = pci_get_pdn_by_devfn(dev->bus, dev->devfn);
-	if (!pdn) {
-		pr_warn("PCI: no pci dn found for dev=%s\n",
-			pci_name(dev));
-		return;
-	}
-
-	edev = pdn_to_eeh_dev(pdn);
+	edev = pci_dev_to_eeh_dev(dev);
 	if (!edev) {
 		pr_warn("PCI: no EEH dev found for %s\n",
 			pci_name(dev));
-- 
2.9.5

