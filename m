Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C429328B0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 16:30:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bLpqc8xu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNhLH2Tmcz3fqs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2024 00:30:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bLpqc8xu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNhJN1jFhz3frF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2024 00:28:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 63F5561295;
	Tue, 16 Jul 2024 14:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A65C4AF0E;
	Tue, 16 Jul 2024 14:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721140114;
	bh=60SeZ4m4xDv43jZaIxH9z3C6iKXcxRIqNZpQS0Brq18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bLpqc8xui4ehk3l9SLulwJA2YKof5lc5574Fl/n/70imxmD3nhHXgV+W5XoLGIZIy
	 GQ841UpOUds0R+buLTigzRXfdSbeoHg/eX1Djg7dnTe1V4xlJV0yoNvnurEhw/DhQK
	 tfePM+iYUEJo2kYPN2oPaG/dbyyw1WwLw7hixxnrAdx/WMb5kfzQYU54gSHbKO+KoO
	 bv+6XSD4G2pN4Hi567W3qyNM6BfyQnuzqHdWP+NtDM94zTQFB1NnsXEEoqI6gF0/6J
	 ryCTAwsOB9dc2i7dlPIiyMmYNHCjptAdJdeUKR0aafu+OImOrfqqcbhLnbCAFAOszY
	 UWxiqsD6kUvHw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 03/15] powerpc/eeh: avoid possible crash when edev->pdev changes
Date: Tue, 16 Jul 2024 10:28:00 -0400
Message-ID: <20240716142825.2713416-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716142825.2713416-1-sashal@kernel.org>
References: <20240716142825.2713416-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.99
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
index d2873d17d2b15..e4624d7896294 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -850,6 +850,7 @@ struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe)
 {
 	struct eeh_dev *edev;
 	struct pci_dev *pdev;
+	struct pci_bus *bus = NULL;
 
 	if (pe->type & EEH_PE_PHB)
 		return pe->phb->bus;
@@ -860,9 +861,11 @@ struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe)
 
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

