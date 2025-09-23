Return-Path: <linuxppc-dev+bounces-12541-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F77B96E70
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Sep 2025 19:04:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cWRD944FXz3000;
	Wed, 24 Sep 2025 03:04:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758647081;
	cv=none; b=UaXt9SmV8hdfvo1RT7C2RCP+RfakS2dwzUxAE9pdinQAiSElt2t8CqhLbnIXggb/6+QOJ02ZcTOr2Ojs3hb2ItGn1jfueMQ4tXvF4/zh+xTwBojnGI+vf+N40fLTNpTiwBl3pwY5nNUxWhdBeNi//n6D9IYTq6uNCFAAXWJLSkQnDXxMl8LrgIr3LtWVMS/F9hIxmyEMTZ/7cxeZV7HPHr79yDRd3+aP6xnfPGvNg4YD2qOaagP+asMURzIIoc9Dl7JPIkR14HoTcQJfJX0WC1Em0l+c1Gb/HKGby7/SEPCotFjDMuuA30PaQProDP3Od4QQo8kiKD5IU/eL6jKbsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758647081; c=relaxed/relaxed;
	bh=XsHXAr26uFmYtgxTEGLWtr8ER0vhVE7qa73NnCyYLIA=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=UcSmtS5Jp4RnrJKN3o2PcUGqfhPnVun/qZI6D95DCxTQ1gFeTFCDhSQ0+Oms2ELA9RnPxSgfYHmoIpIqwjrEYQ7gbrdUv90bCse7YehMVLJ6q3Jpde4xC/E/EGriS1rKUOBWmRtwyY9VmEasMsJNv+PWTZLlyPOVsH1fngFKSVsaA9m+TbXLoyUXD9XBEtjxsB2afbxEcCZdJyEIqTXup+fQ2+FPwH6D8xE4KPFQKc46yVy6iUzDW/aOjwO0/uPtjE5nOvt45P9BmOmceydgvSgMO3aFzYRxcVJBBUzXW30C34789Bc5vIYbopdJWb/Uu9uIfcX4kL4b7oRZtwKqoQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=u6BocjFx; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=u6BocjFx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cWRD64nYfz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Sep 2025 03:04:38 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 9D65B82889AD;
	Tue, 23 Sep 2025 12:04:34 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id cbeJ3-IlNVw4; Tue, 23 Sep 2025 12:04:33 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id A87378288A28;
	Tue, 23 Sep 2025 12:04:33 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com A87378288A28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1758647073; bh=XsHXAr26uFmYtgxTEGLWtr8ER0vhVE7qa73NnCyYLIA=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=u6BocjFxh6gHY9s10Dy0DmzkDWpBeJjKC3jyk4QcUHfqN+1N0wG7RLxCvnH6NQ7IW
	 10aOmBhx+OXRyEkPiEwv2wvWS7UP59Z+tMzHTg1lXO11bTYqPuR0Bzb4jb5J98uO6D
	 jwOrI3PwXmUvaBIPi2fb7/vm3QxS2JYJNG75T70w=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id kG_iOPuhvPfI; Tue, 23 Sep 2025 12:04:33 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 77FEF82889AD;
	Tue, 23 Sep 2025 12:04:33 -0500 (CDT)
Date: Tue, 23 Sep 2025 12:04:33 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: kvm <kvm@vger.kernel.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Alex Williamson <alex.williamson@redhat.com>, 
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>
Message-ID: <333803015.1744464.1758647073336.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH v4] vfio/pci: Fix INTx handling on legacy non-PCI 2.3
 devices
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC140 (Linux)/8.5.0_GA_3042)
Thread-Index: W8Zeg2QdRz9DmmY8boDuhMyhWXGeBA==
Thread-Topic: vfio/pci: Fix INTx handling on legacy non-PCI 2.3 devices
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PCI devices prior to PCI 2.3 both use level interrupts and do not support
interrupt masking, leading to a failure when passed through to a KVM guest on
at least the ppc64 platform. This failure manifests as receiving and
acknowledging a single interrupt in the guest, while the device continues to
assert the level interrupt indicating a need for further servicing.

When lazy IRQ masking is used on DisINTx- (non-PCI 2.3) hardware, the following
sequence occurs:

 * Level IRQ assertion on device
 * IRQ marked disabled in kernel
 * Host interrupt handler exits without clearing the interrupt on the device
 * Eventfd is delivered to userspace
 * Guest processes IRQ and clears device interrupt
 * Device de-asserts INTx, then re-asserts INTx while the interrupt is masked
 * Newly asserted interrupt acknowledged by kernel VMM without being handled
 * Software mask removed by VFIO driver
 * Device INTx still asserted, host controller does not see new edge after EOI

The behavior is now platform-dependent.  Some platforms (amd64) will continue
to spew IRQs for as long as the INTX line remains asserted, therefore the IRQ
will be handled by the host as soon as the mask is dropped.  Others (ppc64) will
only send the one request, and if it is not handled no further interrupts will
be sent.  The former behavior theoretically leaves the system vulnerable to
interrupt storm, and the latter will result in the device stalling after
receiving exactly one interrupt in the guest.

Work around this by disabling lazy IRQ masking for DisINTx- INTx devices.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 drivers/vfio/pci/vfio_pci_intrs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/vfio/pci/vfio_pci_intrs.c b/drivers/vfio/pci/vfio_pci_intrs.c
index 123298a4dc8f..61d29f6b3730 100644
--- a/drivers/vfio/pci/vfio_pci_intrs.c
+++ b/drivers/vfio/pci/vfio_pci_intrs.c
@@ -304,9 +304,14 @@ static int vfio_intx_enable(struct vfio_pci_core_device *vdev,
 
 	vdev->irq_type = VFIO_PCI_INTX_IRQ_INDEX;
 
+	if (!vdev->pci_2_3)
+		irq_set_status_flags(pdev->irq, IRQ_DISABLE_UNLAZY);
+
 	ret = request_irq(pdev->irq, vfio_intx_handler,
 			  irqflags, ctx->name, ctx);
 	if (ret) {
+		if (!vdev->pci_2_3)
+			irq_clear_status_flags(pdev->irq, IRQ_DISABLE_UNLAZY);
 		vdev->irq_type = VFIO_PCI_NUM_IRQS;
 		kfree(name);
 		vfio_irq_ctx_free(vdev, ctx, 0);
@@ -352,6 +357,8 @@ static void vfio_intx_disable(struct vfio_pci_core_device *vdev)
 		vfio_virqfd_disable(&ctx->unmask);
 		vfio_virqfd_disable(&ctx->mask);
 		free_irq(pdev->irq, ctx);
+		if (!vdev->pci_2_3)
+			irq_clear_status_flags(pdev->irq, IRQ_DISABLE_UNLAZY);
 		if (ctx->trigger)
 			eventfd_ctx_put(ctx->trigger);
 		kfree(ctx->name);
-- 
2.39.5

