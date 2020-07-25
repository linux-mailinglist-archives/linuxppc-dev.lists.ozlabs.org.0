Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B000F22D61F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 10:36:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BDKCw0nTbzDqdT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 18:36:12 +1000 (AEST)
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
 header.s=20161025 header.b=UlJzYEsI; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BDJjQ4J8bzF157
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 18:13:14 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id s26so6504102pfm.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 01:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kz+sWFCiw6ZUnAP90a0JiohaJtz7QQMbMbQaLAycNK4=;
 b=UlJzYEsIdFCoGwDVUbsSUGHO5mXXJBNzLfa2faFPcGXrLB+Tp0daSefgA938xV/Sby
 b5xvca4M50jp36HIVP8IFZuBvFGlP1cYrFPGQEbk5UqMMJvRa0Rds2rORGdIerevB4GP
 q3/WzL5aRQ5+wAUnebzvUq0GXXqOihzmM9csI5x+FGV0PTsRro/o+7xTfpx73J4SiFmM
 DWN0EXNZfkwDRb8m5UFLeD3iyr6GAH9KrwCjEefvzcd29O2z1zvI9gdsTQLhq2R0PMKv
 iMUNzhoMobMDhxTjtAz6ZGaBtkPtslaMLG5H+Wxn7vwJL/bVotSKQ6UjVJyYuDjtr9MB
 39yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kz+sWFCiw6ZUnAP90a0JiohaJtz7QQMbMbQaLAycNK4=;
 b=cSXIbMEfccludkXDW7NH7Uy5D2arkzHYifqpIPXgvF2NiQM6PEJ68q3Vrwq9+/p5d9
 cNJ53v8+9ztMsWtPM0yFay70nqCBk5sMIyEezOCJ0d+iL/2SzLCEu2BSyb5D7P65hupI
 MQO5kc6t8saL0fQGFaNB+/xeJ7MVN2pUejCngaE6RK4ZC1DctslZLCHY1/dHScoyxO5m
 2hEij8ZWSd+4s2I1PHF3S9mUckl2hLPjHqUCyhu4405rC+73/NgHr6Sy30UKbhlYvvUO
 96EHaLXDM/zcAQmLCXZeUSK471uLuluETxpC4AH5ATBoH4v1NlsOZErL37Hp61RpdoC1
 t0ag==
X-Gm-Message-State: AOAM533vYM/gYrbqSQNCK4D0sYxsGus3t74kO47vrkaDSWOn/V1mgdRN
 884XCe0YOQjqOkJvEo+VgUHysN2IuD0=
X-Google-Smtp-Source: ABdhPJxvwjDfnSmF68xRl0ntO7RYxEAwNoic3RReTctwKdxDMZPdRnzjTQtr20meKe7xHA89qBDdOQ==
X-Received: by 2002:a65:6250:: with SMTP id q16mr6409049pgv.149.1595664792036; 
 Sat, 25 Jul 2020 01:13:12 -0700 (PDT)
Received: from localhost.localdomain ([118.210.60.180])
 by smtp.gmail.com with ESMTPSA id a26sm8647360pgm.20.2020.07.25.01.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 01:13:11 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 13/14] powerpc/eeh: Drop pdn use in eeh_pe_tree_insert()
Date: Sat, 25 Jul 2020 18:12:30 +1000
Message-Id: <20200725081231.39076-13-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200725081231.39076-1-oohall@gmail.com>
References: <20200725081231.39076-1-oohall@gmail.com>
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

This is mostly just to make the subsequent diffs less noisy. No functional
changes.

One thing that needs calling out is the removal of the "config_addr"
variable and replacing it with edev->bdfn. The contents of edev->bdfn are
the same, however it's worth pointing out that what RTAS calls a
"config_addr" isn't the same as the bdfn. The config_addr is supposed to
be: <bus><devfn><reg> with each field being an 8 bit number. Various parts
of the EEH code use BDFN and "config_addr" as interchangeable quantities
even though they aren't really.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
v2: no changes
v3: no changes
---
 arch/powerpc/kernel/eeh_pe.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index 97bf09db2ecd..898205829a8f 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -366,9 +366,8 @@ static struct eeh_pe *eeh_pe_get_parent(struct eeh_dev *edev)
  */
 int eeh_pe_tree_insert(struct eeh_dev *edev)
 {
+	struct pci_controller *hose = edev->controller;
 	struct eeh_pe *pe, *parent;
-	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
-	int config_addr = (pdn->busno << 8) | (pdn->devfn);
 
 	/* Check if the PE number is valid */
 	if (!eeh_has_flag(EEH_VALID_PE_ZERO) && !edev->pe_config_addr) {
@@ -382,7 +381,7 @@ int eeh_pe_tree_insert(struct eeh_dev *edev)
 	 * PE should be composed of PCI bus and its subordinate
 	 * components.
 	 */
-	pe = eeh_pe_get(pdn->phb, edev->pe_config_addr, config_addr);
+	pe = eeh_pe_get(hose, edev->pe_config_addr, edev->bdfn);
 	if (pe) {
 		if (pe->type & EEH_PE_INVALID) {
 			list_add_tail(&edev->entry, &pe->edevs);
@@ -416,15 +415,15 @@ int eeh_pe_tree_insert(struct eeh_dev *edev)
 
 	/* Create a new EEH PE */
 	if (edev->physfn)
-		pe = eeh_pe_alloc(pdn->phb, EEH_PE_VF);
+		pe = eeh_pe_alloc(hose, EEH_PE_VF);
 	else
-		pe = eeh_pe_alloc(pdn->phb, EEH_PE_DEVICE);
+		pe = eeh_pe_alloc(hose, EEH_PE_DEVICE);
 	if (!pe) {
 		pr_err("%s: out of memory!\n", __func__);
 		return -ENOMEM;
 	}
 	pe->addr	= edev->pe_config_addr;
-	pe->config_addr	= config_addr;
+	pe->config_addr	= edev->bdfn;
 
 	/*
 	 * Put the new EEH PE into hierarchy tree. If the parent
@@ -434,10 +433,10 @@ int eeh_pe_tree_insert(struct eeh_dev *edev)
 	 */
 	parent = eeh_pe_get_parent(edev);
 	if (!parent) {
-		parent = eeh_phb_pe_get(pdn->phb);
+		parent = eeh_phb_pe_get(hose);
 		if (!parent) {
 			pr_err("%s: No PHB PE is found (PHB Domain=%d)\n",
-				__func__, pdn->phb->global_number);
+				__func__, hose->global_number);
 			edev->pe = NULL;
 			kfree(pe);
 			return -EEXIST;
-- 
2.26.2

