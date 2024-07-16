Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C7A93288F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 16:28:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VhBKtF6o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNhJc6NVcz3ftD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2024 00:28:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VhBKtF6o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNhGz4YkGz3fsc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2024 00:27:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9CB3BCE12A3;
	Tue, 16 Jul 2024 14:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F384EC4AF12;
	Tue, 16 Jul 2024 14:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721140041;
	bh=Q5oPOfaPPMtVbJo9sOz517kdeGlVdwhnoDlCg22S/Pg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VhBKtF6oBPEgrSuVdgqyzjhTDIqZauHYTjfmzfl/wBUvT9LsJ2AOq6CJ58xez1HT3
	 wNroLeS3fJp+hLWN2YQ3iPON2m7XidCuzxIW2j2z+unkepw+eKtWXVOLtN07Bka0mF
	 KtcMJzwMXTfQB5erKLf8RqKeO3tFVFmQFaDOUOeYiG+Z1NGEsOXSyEXTsK3nsQQkQg
	 cgKDJrp/sdaA7WTAhF5g6jHqJZ7Y3Iu+hJm8yUncRkhtKz6gbe5oXtzJAQ6XtjuxJN
	 uIf3g8fMgt2AURGHNNDb2kG6eSVDxV2Ws4c8BVMHvFdiBWvZ/rjgyTyQ3TlDKcJkyx
	 o4TZDVPrpwpFw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 03/18] powerpc/eeh: avoid possible crash when edev->pdev changes
Date: Tue, 16 Jul 2024 10:26:38 -0400
Message-ID: <20240716142713.2712998-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716142713.2712998-1-sashal@kernel.org>
References: <20240716142713.2712998-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.40
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org, Ganesh Goudar <ganeshgr@linux.ibm.com>, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ganesh Goudar <ganeshgr@linux.ibm.com>

[ Upstream commit a1216e62d039bf63a539bbe718536ec789a853dd ]

If a PCI device is removed during eeh_pe_report_edev(), edev->pdev
will change and can cause a crash, hold the PCI rescan/remove lock
while taking a copy of edev->pdev->bus.

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://msgid.link/20240617140240.580453-1-ganeshgr@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/eeh_pe.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index e0ce812796241..7d1b50599dd6c 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -849,6 +849,7 @@ struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe)
 {
 	struct eeh_dev *edev;
 	struct pci_dev *pdev;
+	struct pci_bus *bus = NULL;
 
 	if (pe->type & EEH_PE_PHB)
 		return pe->phb->bus;
@@ -859,9 +860,11 @@ struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe)
 
 	/* Retrieve the parent PCI bus of first (top) PCI device */
 	edev = list_first_entry_or_null(&pe->edevs, struct eeh_dev, entry);
+	pci_lock_rescan_remove();
 	pdev = eeh_dev_to_pci_dev(edev);
 	if (pdev)
-		return pdev->bus;
+		bus = pdev->bus;
+	pci_unlock_rescan_remove();
 
-	return NULL;
+	return bus;
 }
-- 
2.43.0

