Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 155626D6FD8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 00:05:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrhfH6QFbz3fdm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 08:05:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=<UNKNOWN>)
X-Greylist: delayed 477 seconds by postgrey-1.36 at boromir; Wed, 05 Apr 2023 08:03:56 AEST
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrhcD69PRz30Kr
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Apr 2023 08:03:56 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 590169200C4; Tue,  4 Apr 2023 23:56:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 54C299200C3;
	Tue,  4 Apr 2023 22:56:18 +0100 (BST)
Date: Tue, 4 Apr 2023 22:56:18 +0100 (BST)
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
Subject: [PATCH v7 5/7] net/mlx5: Rely on `link_active_reporting'
In-Reply-To: <alpine.DEB.2.21.2304042200040.37565@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2304042241010.37565@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2304042200040.37565@angie.orcam.me.uk>
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

Use `link_active_reporting' to determine whether Data Link Layer Link 
Active Reporting is available rather than re-retrieving the capability.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
NB this has been compile-tested only with PPC64LE and x86-64 
configurations.

Changes from v6:

- Regenerate against 6.3-rc5.

New change in v6.
---
 drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

linux-pcie-link-active-reporting-mlx5.diff
Index: linux-macro/drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c
===================================================================
--- linux-macro.orig/drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c
+++ linux-macro/drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c
@@ -307,7 +307,6 @@ static int mlx5_pci_link_toggle(struct m
 	unsigned long timeout;
 	struct pci_dev *sdev;
 	int cap, err;
-	u32 reg32;
 
 	/* Check that all functions under the pci bridge are PFs of
 	 * this device otherwise fail this function.
@@ -346,11 +345,8 @@ static int mlx5_pci_link_toggle(struct m
 		return err;
 
 	/* Check link */
-	err = pci_read_config_dword(bridge, cap + PCI_EXP_LNKCAP, &reg32);
-	if (err)
-		return err;
-	if (!(reg32 & PCI_EXP_LNKCAP_DLLLARC)) {
-		mlx5_core_warn(dev, "No PCI link reporting capability (0x%08x)\n", reg32);
+	if (!bridge->link_active_reporting) {
+		mlx5_core_warn(dev, "No PCI link reporting capability\n");
 		msleep(1000);
 		goto restore;
 	}
