Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9E472B341
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jun 2023 19:24:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QfMBx2bZ6z3c4R
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 03:24:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QfM5C3Czdz2y1W
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 03:19:59 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id E73559200C7; Sun, 11 Jun 2023 19:19:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id E0F309200C0;
	Sun, 11 Jun 2023 18:19:57 +0100 (BST)
Date: Sun, 11 Jun 2023 18:19:57 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Bjorn Helgaas <bhelgaas@google.com>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
    Christophe Leroy <christophe.leroy@csgroup.eu>, 
    Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
    "David S. Miller" <davem@davemloft.net>, 
    Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
    Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v9 11/14] PCI: Use `pcie_wait_for_link_status' in
 `pcie_wait_for_link_delay'
In-Reply-To: <alpine.DEB.2.21.2305310024400.59226@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2306111611170.64925@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2305310024400.59226@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, David Abdurachmanov <david.abdurachmanov@gmail.com>, linux-rdma@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Lukas Wunner <lukas@wunner.de>, linux-pci@vger.kernel.org, Stefan Roese <sr@denx.de>, Jim Wilson <wilson@tuliptree.org>, netdev@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove a DLLLA status bit polling loop from `pcie_wait_for_link_delay' 
and call almost identical code in `pcie_wait_for_link_status' instead.  
This reduces the lower bound on the polling interval from 10ms to 1ms, 
possibly increasing the CPU load on the system in favour to reducing 
the wait time.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
New change in v9.
---
 drivers/pci/pci.c |   17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

linux-pcie-wait-for-link-delay-status.diff
Index: linux-macro/drivers/pci/pci.c
===================================================================
--- linux-macro.orig/drivers/pci/pci.c
+++ linux-macro/drivers/pci/pci.c
@@ -4889,16 +4889,14 @@ static bool pcie_wait_for_link_status(st
 static bool pcie_wait_for_link_delay(struct pci_dev *pdev, bool active,
 				     int delay)
 {
-	int timeout = PCIE_LINK_RETRAIN_TIMEOUT_MS;
 	bool ret;
-	u16 lnk_status;
 
 	/*
 	 * Some controllers might not implement link active reporting. In this
 	 * case, we wait for 1000 ms + any delay requested by the caller.
 	 */
 	if (!pdev->link_active_reporting) {
-		msleep(timeout + delay);
+		msleep(PCIE_LINK_RETRAIN_TIMEOUT_MS + delay);
 		return true;
 	}
 
@@ -4913,20 +4911,11 @@ static bool pcie_wait_for_link_delay(str
 	 */
 	if (active)
 		msleep(20);
-	for (;;) {
-		pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnk_status);
-		ret = !!(lnk_status & PCI_EXP_LNKSTA_DLLLA);
-		if (ret == active)
-			break;
-		if (timeout <= 0)
-			break;
-		msleep(10);
-		timeout -= 10;
-	}
+	ret = pcie_wait_for_link_status(pdev, false, active);
 	if (active && ret)
 		msleep(delay);
 
-	return ret == active;
+	return ret;
 }
 
 /**
