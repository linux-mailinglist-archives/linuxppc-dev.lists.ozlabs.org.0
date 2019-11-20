Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2343310314D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 02:52:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hm0G3FjKzDqkJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 12:52:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HD8vvVuF"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlVD1mbvzDqgr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:29:40 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id p24so13358157pfn.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8J1U7F6iJr1/Ztii/PsYyPiukTK0bPwqh4xoT8ULUTU=;
 b=HD8vvVuFokQGnHfg30tYnx4aiUlxb+pm7HTnphW/ve4fukOiMvKPwjANm62reU3VqU
 Jr+oLtpKFjMvPhk8FQhwLkP1gAM3Q3HHg1bEJqn4vjz9C62z/CqNsXKUKWKvNWGhRwgB
 KDdunOE1qbyhnbKQFPwy+Z+aN9KD/AP/fMCyng9ocnLzA1mdtQr99UiICM4aZsjWGyAN
 ifeK9sfU+aNcyGwXha8qtoJA9uMXg1to9kKJgyrbtwxTvoKb/+nBDSe/CYPUFkzwgM0A
 cyrOv7EsPYcmzTP0S3qTxD/YH3TU1h3km/TYHm5RmurqGDm3+0DO/JK/CRUEJrnzdVA8
 Rlsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8J1U7F6iJr1/Ztii/PsYyPiukTK0bPwqh4xoT8ULUTU=;
 b=t2FxuahR4PfbCGh0+wsBmlB/i5ZaA1OQ05pHHXpS6jh+4GTie4eLZqIidlP3otr9Fq
 3+Dq5fLwYtdUgYrSzCEWTw8CykoULNpuZim46EypbCV5JnkxJUx0WLiQdQ3eeD2iBkVt
 /nbN9SixqZl/tnUqHmlrfVLYIYzOoa+SHnl4Gc3fTdEKe/z35WEivp4Y9Ol61X7MAqSH
 uNh89OgXiCpX0ipM1jtkErpJolW6na6LC2gZoC8OnqTdWTQCjy5OEAajWJrpZW708uAO
 J1/sZtumit6lWVaoMN0RI62u68Bo5SBhGkLn06COf1zjyStZ4ekQHSQhe9dT9pOkTkzT
 LwAw==
X-Gm-Message-State: APjAAAXfm2MpaNTzFLEdKaNkzP5g4KHgDJumV7N3Vjs5hSiG0TlUVIFp
 T2pgapzNqlBpQZSGeuR74qkhHgcF
X-Google-Smtp-Source: APXvYqxL8ARS5NvkmBbjOcH/tOq4gOT+qqPioJYACz81eqI8zMW9LYgegJfLTNyXfbzqeOLvPLv41g==
X-Received: by 2002:a63:a5b:: with SMTP id z27mr176611pgk.416.1574213378097;
 Tue, 19 Nov 2019 17:29:38 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:29:37 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 11/46] powerpc/eeh: Convert various printfs to use edev,
 not pci_dn
Date: Wed, 20 Nov 2019 12:28:24 +1100
Message-Id: <20191120012859.23300-12-oohall@gmail.com>
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

We use the pci_dn to retrieve the domain, bus, device, and function numbers for
an EEH device. We now have that in the eeh_dev so covert the various printk()s
we have around the place to source that information from the eeh_dev.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/eeh.c    | 14 ++++----------
 arch/powerpc/kernel/eeh_pe.c | 14 ++++++--------
 2 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 63500e34e329..c8039fdb23ba 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -167,23 +167,17 @@ void eeh_show_enabled(void)
  */
 static size_t eeh_dump_dev_log(struct eeh_dev *edev, char *buf, size_t len)
 {
-	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
 	u32 cfg;
 	int cap, i;
 	int n = 0, l = 0;
 	char buffer[128];
 
-	if (!pdn) {
-		pr_warn("EEH: Note: No error log for absent device.\n");
-		return 0;
-	}
-
 	n += scnprintf(buf+n, len-n, "%04x:%02x:%02x.%01x\n",
-		       pdn->phb->global_number, pdn->busno,
-		       PCI_SLOT(pdn->devfn), PCI_FUNC(pdn->devfn));
+			edev->pe->phb->global_number, edev->bdfn >> 8,
+			PCI_SLOT(edev->bdfn), PCI_FUNC(edev->bdfn));
 	pr_warn("EEH: of node=%04x:%02x:%02x.%01x\n",
-		pdn->phb->global_number, pdn->busno,
-		PCI_SLOT(pdn->devfn), PCI_FUNC(pdn->devfn));
+		edev->pe->phb->global_number, edev->bdfn >> 8,
+		PCI_SLOT(edev->bdfn), PCI_FUNC(edev->bdfn));
 
 	eeh_ops->read_config(edev, PCI_VENDOR_ID, 4, &cfg);
 	n += scnprintf(buf+n, len-n, "dev/vend:%08x\n", cfg);
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index 634963aa4a77..831f363f1732 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -366,9 +366,8 @@ static struct eeh_pe *eeh_pe_get_parent(struct eeh_dev *edev)
  */
 int eeh_add_to_parent_pe(struct eeh_dev *edev)
 {
+	int config_addr = edev->bdfn;
 	struct eeh_pe *pe, *parent;
-	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
-	int config_addr = (pdn->busno << 8) | (pdn->devfn);
 
 	/* Check if the PE number is valid */
 	if (!eeh_has_flag(EEH_VALID_PE_ZERO) && !edev->pe_config_addr) {
@@ -382,7 +381,7 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 	 * PE should be composed of PCI bus and its subordinate
 	 * components.
 	 */
-	pe = eeh_pe_get(pdn->phb, edev->pe_config_addr, config_addr);
+	pe = eeh_pe_get(edev->controller, edev->pe_config_addr, config_addr);
 	if (pe) {
 		if (pe->type & EEH_PE_INVALID) {
 			list_add_tail(&edev->entry, &pe->edevs);
@@ -416,9 +415,9 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 
 	/* Create a new EEH PE */
 	if (edev->physfn)
-		pe = eeh_pe_alloc(pdn->phb, EEH_PE_VF);
+		pe = eeh_pe_alloc(edev->controller, EEH_PE_VF);
 	else
-		pe = eeh_pe_alloc(pdn->phb, EEH_PE_DEVICE);
+		pe = eeh_pe_alloc(edev->controller, EEH_PE_DEVICE);
 	if (!pe) {
 		pr_err("%s: out of memory!\n", __func__);
 		return -ENOMEM;
@@ -434,10 +433,10 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 	 */
 	parent = eeh_pe_get_parent(edev);
 	if (!parent) {
-		parent = eeh_phb_pe_get(pdn->phb);
+		parent = eeh_phb_pe_get(edev->controller);
 		if (!parent) {
 			pr_err("%s: No PHB PE is found (PHB Domain=%d)\n",
-				__func__, pdn->phb->global_number);
+				__func__, edev->controller->global_number);
 			edev->pe = NULL;
 			kfree(pe);
 			return -EEXIST;
@@ -698,7 +697,6 @@ void eeh_pe_state_clear(struct eeh_pe *root, int state, bool include_passed)
  */
 static void eeh_bridge_check_link(struct eeh_dev *edev)
 {
-	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
 	int cap;
 	uint32_t val;
 	int timeout = 0;
-- 
2.21.0

