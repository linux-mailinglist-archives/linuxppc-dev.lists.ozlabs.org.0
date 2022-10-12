Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0A25FC66F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 15:29:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnYQr341pz3dqW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 00:29:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RHHgYvEM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnYPt4YlQz2yR9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 00:28:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RHHgYvEM;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MnYPq2t9xz4x1G;
	Thu, 13 Oct 2022 00:28:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1665581313;
	bh=9E6D8SfUt/XvbCtYk6H79eLF5Z0a8VLBf3dbm5xgnlU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RHHgYvEMnEbCBFnzD18P+zJmb66XY27lFmS0KJ8KUqFVam8bV7++FxLIykwgZpM/S
	 FiBTpasGKgc4Upb01vtGUerSG6up/lXQMe090W03pZ1gmjOVpSYg2vuz0r9lwE9EaH
	 nPqvbKpIktgReSHQQVIIsx9vuUd7T26IIBp7sx/Ug4gb5mLGMBkdlSvT2E6Zimumhr
	 VWasrOgScYJaSBz9IGFstoG13WLv+UD/l0Kp0YJkmY1BMAl37gPZRm+rB1wtZyzYYe
	 21IqN5MPO+DWz2YaSMuMqRd9RzsPAA+tPSMk6qmHZOV7hS2uVpYymn6LQtqiBePpA4
	 tf35f+0SCmUZg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [GIT PULL] virtio: fixes, features
In-Reply-To: <20221012070532-mutt-send-email-mst@kernel.org>
References: <20221010132030-mutt-send-email-mst@kernel.org>
 <87r0zdmujf.fsf@mpe.ellerman.id.au>
 <20221012070532-mutt-send-email-mst@kernel.org>
Date: Thu, 13 Oct 2022 00:28:25 +1100
Message-ID: <87mta1marq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: xiujianfeng@huawei.com, kvm@vger.kernel.org, alvaro.karsz@solid-run.com, netdev@vger.kernel.org, jasowang@redhat.com, wangdeming@inspur.com, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, virtualization@lists.linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>, angus.chen@jaguarmicro.com, Bjorn Helgaas <bhelgaas@google.com>, lingshan.zhu@intel.com, linuxppc-dev@lists.ozlabs.org, gavinl@nvidia.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[ Cc += Bjorn & linux-pci ]

"Michael S. Tsirkin" <mst@redhat.com> writes:
> On Wed, Oct 12, 2022 at 05:21:24PM +1100, Michael Ellerman wrote:
>> "Michael S. Tsirkin" <mst@redhat.com> writes:
...
>> > ----------------------------------------------------------------
>> > virtio: fixes, features
>> >
>> > 9k mtu perf improvements
>> > vdpa feature provisioning
>> > virtio blk SECURE ERASE support
>> >
>> > Fixes, cleanups all over the place.
>> >
>> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>> >
>> > ----------------------------------------------------------------
>> > Alvaro Karsz (1):
>> >       virtio_blk: add SECURE ERASE command support
>> >
>> > Angus Chen (1):
>> >       virtio_pci: don't try to use intxif pin is zero
>> 
>> This commit breaks virtio_pci for me on powerpc, when running as a qemu
>> guest.
>> 
>> vp_find_vqs() bails out because pci_dev->pin == 0.
>> 
>> But pci_dev->irq is populated correctly, so vp_find_vqs_intx() would
>> succeed if we called it - which is what the code used to do.
>> 
>> I think this happens because pci_dev->pin is not populated in
>> pci_assign_irq().
>> 
>> I would absolutely believe this is bug in our PCI code, but I think it
>> may also affect other platforms that use of_irq_parse_and_map_pci().
>
> How about fixing this in of_irq_parse_and_map_pci then?
> Something like the below maybe?
> 
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index 196834ed44fe..504c4d75c83f 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -446,6 +446,8 @@ static int of_irq_parse_pci(const struct pci_dev *pdev, struct of_phandle_args *
>  	if (pin == 0)
>  		return -ENODEV;
>  
> +	pdev->pin = pin;
> +
>  	/* Local interrupt-map in the device node? Use it! */
>  	if (of_get_property(dn, "interrupt-map", NULL)) {
>  		pin = pci_swizzle_interrupt_pin(pdev, pin);

That doesn't fix it in all cases, because there's an early return if
there's a struct device_node associated with the pci_dev, before we even
read the pin.

Also the pci_dev is const, and removing the const would propagate to a
few other places.

The other obvious place to fix it would be in pci_assign_irq(), as
below. That fixes this bug for me, but is otherwise very lightly tested.

cheers


diff --git a/drivers/pci/setup-irq.c b/drivers/pci/setup-irq.c
index cc7d26b015f3..0135413b33af 100644
--- a/drivers/pci/setup-irq.c
+++ b/drivers/pci/setup-irq.c
@@ -22,6 +22,15 @@ void pci_assign_irq(struct pci_dev *dev)
 	int irq = 0;
 	struct pci_host_bridge *hbrg = pci_find_host_bridge(dev->bus);
 
+	/* Make sure dev->pin is populated */
+	pci_read_config_byte(dev, PCI_INTERRUPT_PIN, &pin);
+
+	/* Cope with illegal. */
+	if (pin > 4)
+		pin = 1;
+
+	dev->pin = pin;
+
 	if (!(hbrg->map_irq)) {
 		pci_dbg(dev, "runtime IRQ mapping not provided by arch\n");
 		return;
@@ -34,11 +43,6 @@ void pci_assign_irq(struct pci_dev *dev)
 	 * time the interrupt line passes through a PCI-PCI bridge we must
 	 * apply the swizzle function.
 	 */
-	pci_read_config_byte(dev, PCI_INTERRUPT_PIN, &pin);
-	/* Cope with illegal. */
-	if (pin > 4)
-		pin = 1;
-
 	if (pin) {
 		/* Follow the chain of bridges, swizzling as we go. */
 		if (hbrg->swizzle_irq)
