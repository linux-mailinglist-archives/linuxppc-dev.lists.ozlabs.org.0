Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F5D106496
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 07:18:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47K5pt3NdmzDr6d
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 17:18:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="CDzEDFNF"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47K5CV1FF0zDr1g
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 16:51:34 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D35E20726;
 Fri, 22 Nov 2019 05:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574401891;
 bh=NxGRVXtjD/aXIsPUuHL37B5BbTj3nmk8XEn0YOKo7Kc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CDzEDFNFrxQAGO7Dcjn04273De5jXJx5+uGNpGumGTMczJuTfuwjq4l9dV1U//Guj
 w/ZHbL4GmjL1K9sFhGszdcDss32niFyYN0PuLsJmce1UshgwBbA92eo3iJhz/l2Oke
 YJOSF9SM1xbfa6VwJSNIdgBHJeEL3tuNyHUHGDVE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 124/219] powerpc/powernv/eeh/npu: Fix
 uninitialized variables in opal_pci_eeh_freeze_status
Date: Fri, 22 Nov 2019 00:47:36 -0500
Message-Id: <20191122054911.1750-117-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122054911.1750-1-sashal@kernel.org>
References: <20191122054911.1750-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Sam Bobroff <sbobroff@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Sasha Levin <sashal@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alexey Kardashevskiy <aik@ozlabs.ru>

[ Upstream commit c20577014f85f36d4e137d3d52a1f61225b4a3d2 ]

The current implementation of the OPAL_PCI_EEH_FREEZE_STATUS call in
skiboot's NPU driver does not touch the pci_error_type parameter so
it might have garbage but the powernv code analyzes it nevertheless.

This initializes pcierr and fstate to zero in all call sites.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/powernv/eeh-powernv.c | 8 ++++----
 arch/powerpc/platforms/powernv/pci-ioda.c    | 4 ++--
 arch/powerpc/platforms/powernv/pci.c         | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 3c1beae29f2d8..9dd5b8909178b 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -578,8 +578,8 @@ static void pnv_eeh_get_phb_diag(struct eeh_pe *pe)
 static int pnv_eeh_get_phb_state(struct eeh_pe *pe)
 {
 	struct pnv_phb *phb = pe->phb->private_data;
-	u8 fstate;
-	__be16 pcierr;
+	u8 fstate = 0;
+	__be16 pcierr = 0;
 	s64 rc;
 	int result = 0;
 
@@ -617,8 +617,8 @@ static int pnv_eeh_get_phb_state(struct eeh_pe *pe)
 static int pnv_eeh_get_pe_state(struct eeh_pe *pe)
 {
 	struct pnv_phb *phb = pe->phb->private_data;
-	u8 fstate;
-	__be16 pcierr;
+	u8 fstate = 0;
+	__be16 pcierr = 0;
 	s64 rc;
 	int result;
 
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 326ca6288bb12..ee63749a2d47e 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -605,8 +605,8 @@ static int pnv_ioda_unfreeze_pe(struct pnv_phb *phb, int pe_no, int opt)
 static int pnv_ioda_get_pe_state(struct pnv_phb *phb, int pe_no)
 {
 	struct pnv_ioda_pe *slave, *pe;
-	u8 fstate, state;
-	__be16 pcierr;
+	u8 fstate = 0, state;
+	__be16 pcierr = 0;
 	s64 rc;
 
 	/* Sanity check on PE number */
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 13aef2323bbca..db230a35609bf 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -602,8 +602,8 @@ static void pnv_pci_handle_eeh_config(struct pnv_phb *phb, u32 pe_no)
 static void pnv_pci_config_check_eeh(struct pci_dn *pdn)
 {
 	struct pnv_phb *phb = pdn->phb->private_data;
-	u8	fstate;
-	__be16	pcierr;
+	u8	fstate = 0;
+	__be16	pcierr = 0;
 	unsigned int pe_no;
 	s64	rc;
 
-- 
2.20.1

