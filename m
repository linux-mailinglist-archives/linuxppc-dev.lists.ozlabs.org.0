Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F6A10317A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:18:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HmZF5bkjzDqlW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:18:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ccsv9HaE"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlVp5t4KzDqgF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:30:10 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id d7so12988649pls.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MNtY5fYOoodyy8Wlv13vynlTEmBZuTLGtx22Ed9x1yo=;
 b=ccsv9HaEMav1W9TyBNipBEoFNXr3KB01qYH8Xxo7vjI953di0daO0Qx+c+Eno1oEkP
 +Oi9P9+Z8aERaIUMoecoOyFIfobjvwmn1pNot6jwQfcS6qeQut5h3TJcrDTfxctLx6On
 XXDsXT6UVPY9Crr3iHzuAw3AEprbQHWeAbv/+6AaQmkrfd0m0Q88uMwI8agzet+mXW9D
 T+KF1C8aYtCZhkXE6WCIQ5FG+LjmGEUcWwssv85/dGDjnA2yRkH/14TyHzlmy0PfK6A8
 Vf9s6EioJDInks1kv9jKEez9fM2kSHLlo8gs78RPoOdQsRFceRGDgGrwKyFlEpb+gzoy
 baww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MNtY5fYOoodyy8Wlv13vynlTEmBZuTLGtx22Ed9x1yo=;
 b=CXHNKRKQQLPcQUU+mEkvHB62JFEtWW7EIPHYhSexTW8vEp4/4F+9cboaRunOuAWtaA
 MQSSh64AaK9Ry369O/+IXzih6HcH9RxfpNa0WcbuXPcCpHXrfgO8ouPgvVung+kDuZ2t
 0S2SuNj1TnMvHmE1nb4GJQ1BWMoW4dBZaeC4YvU9qDHzE08HsfHz8Gys1Dp7MSuPNlXb
 SfrfISWMgG9XCvhZT1hPmSmxDx+Gb3fik47fwcDm4QqVueFvo0QZajEzNA9b/nQ4CyVm
 rrNPIZnlbh+y9ZWp/I4v4+jVCypXNbDWN8OuAeWaFiEbs4qjNxxbse5AQj6TdJ9MA/1p
 SmdA==
X-Gm-Message-State: APjAAAVNTMTQJt9rwMkXy6ZpbBcAC77BOXRG405oVmrosR45Jbqgr2iE
 UKWh6w0xggYlNqTLaHrcNVA/uren
X-Google-Smtp-Source: APXvYqxfR8oOFKEyNI+UVzYz5BMs0yv6OCwqacyRXDkRXTdPvtwV+wBLhuVZ0uwmC/aajok2HPl2lw==
X-Received: by 2002:a17:90a:1db:: with SMTP id 27mr676206pjd.57.1574213408570; 
 Tue, 19 Nov 2019 17:30:08 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:30:08 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 24/46] powernv/pci: Make the pre-cfg EEH freeze check use
 eeh_dev rather than pci_dn
Date: Wed, 20 Nov 2019 12:28:37 +1100
Message-Id: <20191120012859.23300-25-oohall@gmail.com>
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

Squash another usage in preperation for making the config accessors pci_dn.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
We might want to move this into eeh-powernv.c
---
 arch/powerpc/platforms/powernv/pci.c | 37 +++++++++++++---------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index d36dde9777aa..6170677bfdc7 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -708,30 +708,23 @@ int pnv_pci_cfg_write(struct pci_dn *pdn,
 }
 
 #if CONFIG_EEH
-static bool pnv_pci_cfg_check(struct pci_dn *pdn)
+bool pnv_eeh_pre_cfg_check(struct eeh_dev *edev)
 {
-	struct eeh_dev *edev = NULL;
-	struct pnv_phb *phb = pdn->phb->private_data;
-
-	/* EEH not enabled ? */
-	if (!(phb->flags & PNV_PHB_FLAG_EEH))
+	if (!edev || !edev->pe)
 		return true;
 
-	/* PE reset or device removed ? */
-	edev = pdn->edev;
-	if (edev) {
-		if (edev->pe &&
-		    (edev->pe->state & EEH_PE_CFG_BLOCKED))
-			return false;
+	/* PE in reset? */
+	if (edev->pe->state & EEH_PE_CFG_BLOCKED)
+		return false;
 
-		if (edev->mode & EEH_DEV_REMOVED)
-			return false;
-	}
+	/* Device removed? */
+	if (edev->mode & EEH_DEV_REMOVED)
+		return false;
 
 	return true;
 }
 #else
-static inline pnv_pci_cfg_check(struct pci_dn *pdn)
+static inline pnv_pci_cfg_check(struct eeh_dev *edev)
 {
 	return true;
 }
@@ -743,6 +736,7 @@ static int pnv_pci_read_config(struct pci_bus *bus,
 {
 	struct pci_dn *pdn;
 	struct pnv_phb *phb;
+	struct eeh_dev *edev;
 	int ret;
 
 	*val = 0xFFFFFFFF;
@@ -750,14 +744,15 @@ static int pnv_pci_read_config(struct pci_bus *bus,
 	if (!pdn)
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
-	if (!pnv_pci_cfg_check(pdn))
+	edev = pdn_to_eeh_dev(pdn);
+	if (!pnv_eeh_pre_cfg_check(edev))
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
 	ret = pnv_pci_cfg_read(pdn, where, size, val);
 	phb = pdn->phb->private_data;
-	if (phb->flags & PNV_PHB_FLAG_EEH && pdn->edev) {
+	if (phb->flags & PNV_PHB_FLAG_EEH && edev) {
 		if (*val == EEH_IO_ERROR_VALUE(size) &&
-		    eeh_dev_check_failure(pdn->edev))
+		    eeh_dev_check_failure(edev))
                         return PCIBIOS_DEVICE_NOT_FOUND;
 	} else {
 		pnv_pci_config_check_eeh(pdn);
@@ -772,13 +767,15 @@ static int pnv_pci_write_config(struct pci_bus *bus,
 {
 	struct pci_dn *pdn;
 	struct pnv_phb *phb;
+	struct eeh_dev *edev;
 	int ret;
 
 	pdn = pci_get_pdn_by_devfn(bus, devfn);
 	if (!pdn)
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
-	if (!pnv_pci_cfg_check(pdn))
+	edev = pdn_to_eeh_dev(pdn);
+	if (!pnv_eeh_pre_cfg_check(edev))
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
 	ret = pnv_pci_cfg_write(pdn, where, size, val);
-- 
2.21.0

