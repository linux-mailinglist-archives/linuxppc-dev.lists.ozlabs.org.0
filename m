Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 032EB54F804
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 14:59:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPfJh6TMJz3chG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 22:59:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ygkdf/zm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ygkdf/zm;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPfGs68sVz3bp8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 22:58:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D47EA61FD3;
	Fri, 17 Jun 2022 12:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C10C341C0;
	Fri, 17 Jun 2022 12:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655470691;
	bh=rNm86lHtdCfu2hQjLvtPm7z28Z3EUdsosPvVob2uK6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ygkdf/zmdk71Eb66/cIYABaIOydmHLb3jlIiJJptXcoAXufQUr7tMhsRsDheMPdqH
	 e5ISxCjZXTcX2qiIvNdBEqXlzWuz8zHsn9AWHWWu8jPURpKbbjdmESq0vjmndUGCcy
	 DQBV4ioVojLmkogSB/lPkKgwp8LeVczpRMkUlBmkhxN8O9sUoXeOf40ucejA3cNd35
	 900omwI5Kek+tndhSBesQTJZErc3Y3T5GS60URdgKDhTpbd5D1XhrVgrJDmhzSFxeN
	 K9FpTujgf4rZlaLsXk5SKGKqVVgFUGo3uAZjKQsfVpjYpXBp+WF8b477RootiIo8D4
	 B7PEYAt29rg5g==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] scsi: BusLogic remove bus_to_virt
Date: Fri, 17 Jun 2022 14:57:49 +0200
Message-Id: <20220617125750.728590-3-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220617125750.728590-1-arnd@kernel.org>
References: <20220617125750.728590-1-arnd@kernel.org>
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
Cc: linux-arch@vger.kernel.org, Miquel van Smoorenburg <mikevs@xs4all.net>, linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, "Maciej W . Rozycki" <macro@orcam.me.uk>, linux-m68k@lists.linux-m68k.org, Denis Efremov <efremov@linux.com>, Mark Salyzyn <salyzyn@android.com>, Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org, Matt Wang <wwentao@vmware.com>, linux-alpha@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Khalid Aziz <khalid@gonehiking.org>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

The BusLogic driver is the last remaining driver that relies on the
deprecated bus_to_virt() function, which in turn only works on a few
architectures, and is incompatible with both swiotlb and iommu support.

Before commit 391e2f25601e ("[SCSI] BusLogic: Port driver to 64-bit."),
the driver had a dependency on x86-32, presumably because of this
problem. However, the change introduced another bug that made it still
impossible to use the driver on any 64-bit machine.

This was in turn fixed in commit 56f396146af2 ("scsi: BusLogic: Fix
64-bit system enumeration error for Buslogic"), 8 years later, which
shows that there are not a lot of users.

Maciej is still using the driver on 32-bit hardware, and Khalid mentioned
that the driver works with the device emulation used in VirtualBox
and VMware. Both of those only emulate it for Windows 2000 and older
operating systems that did not ship with the better LSI logic driver.

Do a minimum fix that searches through the list of descriptors to find
one that matches the bus address. This is clearly as inefficient as
was indicated in the code comment about the lack of a bus_to_virt()
replacement. A better fix would likely involve changing out the entire
descriptor allocation for a simpler one, but that would be much
more invasive.

Cc: Maciej W. Rozycki <macro@orcam.me.uk>
Cc: Matt Wang <wwentao@vmware.com>
Cc: Khalid Aziz <khalid@gonehiking.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/scsi/BusLogic.c | 27 ++++++++++++++++-----------
 drivers/scsi/Kconfig    |  2 +-
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/scsi/BusLogic.c b/drivers/scsi/BusLogic.c
index a897c8f914cf..d057abfcdd5c 100644
--- a/drivers/scsi/BusLogic.c
+++ b/drivers/scsi/BusLogic.c
@@ -2515,12 +2515,26 @@ static int blogic_resultcode(struct blogic_adapter *adapter,
 	return (hoststatus << 16) | tgt_status;
 }
 
+/*
+ * turn the dma address from an inbox into a ccb pointer
+ * This is rather inefficient.
+ */
+static struct blogic_ccb *
+blogic_inbox_to_ccb(struct blogic_adapter *adapter, struct blogic_inbox *inbox)
+{
+	struct blogic_ccb *ccb;
+
+	for (ccb = adapter->all_ccbs; ccb; ccb = ccb->next_all)
+		if (inbox->ccb == ccb->dma_handle)
+			break;
+
+	return ccb;
+}
 
 /*
   blogic_scan_inbox scans the Incoming Mailboxes saving any
   Incoming Mailbox entries for completion processing.
 */
-
 static void blogic_scan_inbox(struct blogic_adapter *adapter)
 {
 	/*
@@ -2540,16 +2554,7 @@ static void blogic_scan_inbox(struct blogic_adapter *adapter)
 	enum blogic_cmplt_code comp_code;
 
 	while ((comp_code = next_inbox->comp_code) != BLOGIC_INBOX_FREE) {
-		/*
-		   We are only allowed to do this because we limit our
-		   architectures we run on to machines where bus_to_virt(
-		   actually works.  There *needs* to be a dma_addr_to_virt()
-		   in the new PCI DMA mapping interface to replace
-		   bus_to_virt() or else this code is going to become very
-		   innefficient.
-		 */
-		struct blogic_ccb *ccb =
-			(struct blogic_ccb *) bus_to_virt(next_inbox->ccb);
+		struct blogic_ccb *ccb = blogic_inbox_to_ccb(adapter, adapter->next_inbox);
 		if (comp_code != BLOGIC_CMD_NOTFOUND) {
 			if (ccb->status == BLOGIC_CCB_ACTIVE ||
 					ccb->status == BLOGIC_CCB_RESET) {
diff --git a/drivers/scsi/Kconfig b/drivers/scsi/Kconfig
index cf75588a2587..56bdc08d0b77 100644
--- a/drivers/scsi/Kconfig
+++ b/drivers/scsi/Kconfig
@@ -513,7 +513,7 @@ config SCSI_HPTIOP
 
 config SCSI_BUSLOGIC
 	tristate "BusLogic SCSI support"
-	depends on PCI && SCSI && VIRT_TO_BUS
+	depends on PCI && SCSI
 	help
 	  This is support for BusLogic MultiMaster and FlashPoint SCSI Host
 	  Adapters. Consult the SCSI-HOWTO, available from
-- 
2.29.2

