Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E46072B326
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jun 2023 19:21:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QfM6S6xR9z30Xb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 03:21:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=2001:4190:8020::34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QfM4X5ssJz3009
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 03:19:24 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 69A929200BF; Sun, 11 Jun 2023 19:19:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 637809200B3;
	Sun, 11 Jun 2023 18:19:23 +0100 (BST)
Date: Sun, 11 Jun 2023 18:19:23 +0100 (BST)
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
Subject: [PATCH v9 03/14] PCI: Execute `quirk_enable_clear_retrain_link'
 earlier
In-Reply-To: <alpine.DEB.2.21.2305310024400.59226@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2305310049000.59226@angie.orcam.me.uk>
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

Make `quirk_enable_clear_retrain_link' `pci_fixup_early' so that any later 
fixups can rely on `clear_retrain_link' to have been already initialised.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
No change from v8.

Changes from v7:

- Reorder from 2/7.

No change from v6.

No change from v5.

New change in v5.
---
 drivers/pci/quirks.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

linux-pcie-clear-retrain-link-early.diff
Index: linux-macro/drivers/pci/quirks.c
===================================================================
--- linux-macro.orig/drivers/pci/quirks.c
+++ linux-macro/drivers/pci/quirks.c
@@ -2407,9 +2407,9 @@ static void quirk_enable_clear_retrain_l
 	dev->clear_retrain_link = 1;
 	pci_info(dev, "Enable PCIe Retrain Link quirk\n");
 }
-DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_PERICOM, 0xe110, quirk_enable_clear_retrain_link);
-DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_PERICOM, 0xe111, quirk_enable_clear_retrain_link);
-DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_PERICOM, 0xe130, quirk_enable_clear_retrain_link);
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_PERICOM, 0xe110, quirk_enable_clear_retrain_link);
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_PERICOM, 0xe111, quirk_enable_clear_retrain_link);
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_PERICOM, 0xe130, quirk_enable_clear_retrain_link);
 
 static void fixup_rev1_53c810(struct pci_dev *dev)
 {
