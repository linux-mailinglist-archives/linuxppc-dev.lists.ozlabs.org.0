Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7996725A430
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 05:57:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh9Bn0by6zDqcM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 13:57:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KdcQ4l7d; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh93Y2NLKzDqf6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 13:51:36 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id w7so2091649pfi.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Sep 2020 20:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QEokR90sV8IAWQ7JwMcce8PzaEOzPPIQ0YkmdqEIwBk=;
 b=KdcQ4l7dPSX5BBxmyoBNHiGAygHNYHI8K8i4xt+l71MxgxVXuxuOSVuAEo8se0yFSc
 UKSsxeB1H+2I/xKtwCE9txyP0UMIxm0eeIuEDmx8wgzJy+c6BuWT8yP9C4kwK0rjz9JW
 oCcs1xeETtobCCHX04Sbw6Njy9BpRyP8frVQOuVQhKsZFRrzCBcfPj2gvdn64YdMnHX3
 SeUOQZRE1uGh8zd5mXsiaVcbXkfM+OZuTfTgcubUjyxaaj0U4T8FgJgJw4dGlmbnM8jn
 zAVTUFo06SFXgg5fTg1ifYfUiJOsVKm4A52KAnSkQwS/1sorfeSiPNBIYNvBmElfGpUF
 L2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QEokR90sV8IAWQ7JwMcce8PzaEOzPPIQ0YkmdqEIwBk=;
 b=DhbSW3Xce6AvBTuWVNolqiLv6aVWtzUGckrnn2e6tWMjf7SjKfDd4UZZVzOgLC9gWd
 Klrh+pDWeg17HYP6Nw9dEHnxCLSz5K0s9LEf52B6mk1nLTkNz7xAKtNeItlUaWROpEy5
 qKBdS9ZpSSKadU+YBHX1hWvXDMGNGnkB2IkfZcUmj8K8P++rKdBGjw2sAcfduRd0n2mM
 CD7AaDSVBeiKiCtzSYgOtJfkDHJUjT+SRd6d5Bl5ml688QUe96fjGfp8kW7r7thOnipZ
 1pbtfevzGK6Kxkb86OjiCTla2aOkuomRNswDmRaMH9+VOf9Z9Hor6hsPBZadEn4DsfoG
 iGiA==
X-Gm-Message-State: AOAM532rpE4dvKAscxQd0CxBLgVND4+tHZZWjhS6lkTk7QV9Ha+hP1UJ
 CbNdr3tffJmjlxGmq4C6p3PxbWrObJ6o7Q==
X-Google-Smtp-Source: ABdhPJy1rqM6FDniV/N+cNqqKaioy4Ad5X2dXoOPIpr29+/niR3UmFgCyVHV81r7OE+d77HfsGtdyg==
X-Received: by 2002:aa7:947b:: with SMTP id t27mr1415247pfq.240.1599018693084; 
 Tue, 01 Sep 2020 20:51:33 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id y8sm3794112pfr.23.2020.09.01.20.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 20:51:32 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pci: Delete traverse_pci_dn()
Date: Wed,  2 Sep 2020 13:51:21 +1000
Message-Id: <20200902035121.1762475-1-oohall@gmail.com>
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

Nothing uses it.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/include/asm/ppc-pci.h |  3 ---
 arch/powerpc/kernel/pci_dn.c       | 40 ------------------------------
 2 files changed, 43 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-pci.h b/arch/powerpc/include/asm/ppc-pci.h
index 0745422a8e57..2b9edbf6e929 100644
--- a/arch/powerpc/include/asm/ppc-pci.h
+++ b/arch/powerpc/include/asm/ppc-pci.h
@@ -28,9 +28,6 @@ struct pci_dn;
 void *pci_traverse_device_nodes(struct device_node *start,
 				void *(*fn)(struct device_node *, void *),
 				void *data);
-void *traverse_pci_dn(struct pci_dn *root,
-		      void *(*fn)(struct pci_dn *, void *),
-		      void *data);
 extern void pci_devs_phb_init_dynamic(struct pci_controller *phb);
 
 /* From rtas_pci.h */
diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
index e99b7c547d7e..54e240597fd9 100644
--- a/arch/powerpc/kernel/pci_dn.c
+++ b/arch/powerpc/kernel/pci_dn.c
@@ -443,46 +443,6 @@ void *pci_traverse_device_nodes(struct device_node *start,
 }
 EXPORT_SYMBOL_GPL(pci_traverse_device_nodes);
 
-static struct pci_dn *pci_dn_next_one(struct pci_dn *root,
-				      struct pci_dn *pdn)
-{
-	struct list_head *next = pdn->child_list.next;
-
-	if (next != &pdn->child_list)
-		return list_entry(next, struct pci_dn, list);
-
-	while (1) {
-		if (pdn == root)
-			return NULL;
-
-		next = pdn->list.next;
-		if (next != &pdn->parent->child_list)
-			break;
-
-		pdn = pdn->parent;
-	}
-
-	return list_entry(next, struct pci_dn, list);
-}
-
-void *traverse_pci_dn(struct pci_dn *root,
-		      void *(*fn)(struct pci_dn *, void *),
-		      void *data)
-{
-	struct pci_dn *pdn = root;
-	void *ret;
-
-	/* Only scan the child nodes */
-	for (pdn = pci_dn_next_one(root, pdn); pdn;
-	     pdn = pci_dn_next_one(root, pdn)) {
-		ret = fn(pdn, data);
-		if (ret)
-			return ret;
-	}
-
-	return NULL;
-}
-
 static void *add_pdn(struct device_node *dn, void *data)
 {
 	struct pci_controller *hose = data;
-- 
2.26.2

