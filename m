Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 454CF344946
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 16:33:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3z6p1kKgz30HR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:33:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3z6T47zjz2yyW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 02:33:21 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 69F4568BEB; Mon, 22 Mar 2021 16:33:15 +0100 (CET)
Date: Mon, 22 Mar 2021 16:33:14 +0100
From: Christoph Hellwig <hch@lst.de>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH 02/10] ARM: disable CONFIG_IDE in footbridge_defconfig
Message-ID: <20210322153314.GA3440@lst.de>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-3-hch@lst.de>
 <20210319170753.GV1463@shell.armlinux.org.uk>
 <20210319175311.GW1463@shell.armlinux.org.uk> <20210322145403.GA30942@lst.de>
 <20210322151503.GX1463@shell.armlinux.org.uk> <20210322151823.GA2764@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322151823.GA2764@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Jens Axboe <axboe@kernel.dk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 22, 2021 at 04:18:23PM +0100, Christoph Hellwig wrote:
> On Mon, Mar 22, 2021 at 03:15:03PM +0000, Russell King - ARM Linux admin wrote:
> > It gets worse than that though - due to a change to remove
> > pcibios_min_io from the generic code, moving it into the ARM
> > architecture code, this has caused a regression that prevents the
> > legacy resources being registered against the bus resource. So even
> > if they are there, they cause probe failures. I haven't found a
> > reasonable way to solve this yet, but until there is, there is no
> > way that the PATA driver can be used as the "legacy mode" support
> > is effectively done via the PCI code assigning virtual IO port
> > resources.
> > 
> > I'm quite surprised that the CY82C693 even works on Alpha - I've
> > asked for a lspci for that last week but nothing has yet been
> > forthcoming from whoever responded to your patch for Alpha - so I
> > can't compare what I'm seeing with what's happening with Alpha.
> 
> That sounds like something we could fix with a quirk for function 2
> in the PCI resource assignment code.  Can you show what vendor and
> device ID function 2 has so that I could try to come up with one?

Something like this:


diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 953f15abc850ac..851918206c4f2d 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1855,7 +1855,7 @@ int pci_setup_device(struct pci_dev *dev)
 		 * addresses. These are not always echoed in BAR0-3, and
 		 * BAR0-3 in a few cases contain junk!
 		 */
-		if (class == PCI_CLASS_STORAGE_IDE) {
+		if (class == PCI_CLASS_STORAGE_IDE && !dev->no_legacy_ide_bars) {
 			u8 progif;
 			pci_read_config_byte(dev, PCI_CLASS_PROG, &progif);
 			if ((progif & 1) == 0) {
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 653660e3ba9ef1..c661462d894a5b 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -5612,3 +5612,16 @@ static void apex_pci_fixup_class(struct pci_dev *pdev)
 }
 DECLARE_PCI_FIXUP_CLASS_HEADER(0x1ac1, 0x089a,
 			       PCI_CLASS_NOT_DEFINED, 8, apex_pci_fixup_class);
+
+/*
+ * CY82C693 splits the primary and secondar IDE channels over 2 functions, which
+ * causes the PCI resource assignment algorithm to assign the legacy IDE I/O
+ * regions to both of them.  Disable that assignment for function 2 here.
+ */
+static void quirk_cy82c693_legacy_resources(struct pci_dev *pdev)
+{
+	if (PCI_FUNC(pdev->devfn) == 2)
+		pdev->no_legacy_ide_bars = 1;
+}
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_CONTAQ, PCI_DEVICE_ID_CONTAQ_82C693,
+		quirk_cy82c693_legacy_resources);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 86c799c97b7796..7ca3f5ebbfade7 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -453,6 +453,7 @@ struct pci_dev {
 	unsigned int	link_active_reporting:1;/* Device capable of reporting link active */
 	unsigned int	no_vf_scan:1;		/* Don't scan for VFs after IOV enablement */
 	unsigned int	no_command_memory:1;	/* No PCI_COMMAND_MEMORY */
+	unsigned int	no_legacy_ide_bars:1;	/* do not assign legacy IDE BARs */
 	pci_dev_flags_t dev_flags;
 	atomic_t	enable_cnt;	/* pci_enable_device has been called */
 
