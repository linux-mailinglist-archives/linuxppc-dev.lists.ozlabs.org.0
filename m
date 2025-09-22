Return-Path: <linuxppc-dev+bounces-12520-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A9AB92631
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 19:18:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVqZr0fSfz2yr1;
	Tue, 23 Sep 2025 03:18:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758561523;
	cv=none; b=icixR+REe3guYvC6oSMXjs85+a5T0+6l6Qd8oVSdZjEb1MzHuiG9RK+WUlMThq4oFXejRuKjseqGRORof2u1EdFWCaFXuYT0dtIEevoMlgVA1KzwRybGES0ho2+oN05LZtvniBSY8xZG3uNZIlNlV4bS2QpyCg/y+cFkBh01RdRnjNBvEe5vsjtpdLBS5uh0DmBSNknjRvY/lxBg1EUqx5Qi1o4RkQ4586ca0l4U0T43GhAMFTE1ryqMvhKljDZQIYEVwOWWf7lKU9YQYoMxZVaG6XovRi3yRE7XMcOaoaYKivHkhebLwtmcx0qlsEFA5f+4if7da6q4KGysicPurA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758561523; c=relaxed/relaxed;
	bh=etKuEBh9PTwlPDUpZ/Kmvx/1sfJtHGqZ+HNXo8z9Z1w=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=Z4zlIPLR4K5FaITsL0YDxY2tw/IWFvpBrOUPgOLKrGy4PqQioc/TC7osKrpd5ZAT3/6xjpK5Ee9+KDaDSJOyPtcpWf4PzWUJYy9UfzXz0ImFoKztypj0TCJbfBhVt6BsLZXIoi68FdYWqnvBBw1CsO9zAKM4yfr6gGnyVwiDsqubFeFrdd5npPK9e9aBbH3/J5kRCg/qyLFS4oyJmdZIHUy2DZ3nmdHgH3jpBKgkj8MQN7q2HA/rP5imoM46yO0OFswR+rInmOVhuVMrMreH/LYGpod1Y1XslbW80pkONGv+IjpsinKDzFu9lxwObVk+/mkJpAvZw1FaR07Gq39I4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=d6kWCsn9; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=d6kWCsn9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVqZp5hYzz2xnt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 03:18:42 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id D284C82877C8;
	Mon, 22 Sep 2025 12:18:40 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id H1vkj8gCDAoU; Mon, 22 Sep 2025 12:18:38 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 368648287877;
	Mon, 22 Sep 2025 12:18:38 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 368648287877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1758561518; bh=etKuEBh9PTwlPDUpZ/Kmvx/1sfJtHGqZ+HNXo8z9Z1w=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=d6kWCsn9jHa7gm1K5at7x1QwTLP3+rwvxP12nUz95sZL327Iq01NGVA0dLMt/Cv1J
	 S0wQUwvZcvLJUoyRE3d0ezVY0tGMpWxEe4EPCq30b5z2DEPNHm+pIx2Y3/Ebawwh3l
	 yQvs6bWvBRSj4TzeX+GN4InNyJWXNa+NXaQ1FSm8=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gHE7IdQJ-tQD; Mon, 22 Sep 2025 12:18:38 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 0442782877C8;
	Mon, 22 Sep 2025 12:18:37 -0500 (CDT)
Date: Mon, 22 Sep 2025 12:18:34 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: kvm <kvm@vger.kernel.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Alex Williamson <alex.williamson@redhat.com>
Message-ID: <912864077.1743059.1758561514856.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH v2] vfio/pci: Fix INTx handling on legacy non-PCI 2.3
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
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC139 (Linux)/8.5.0_GA_3042)
Thread-Index: c8lDpJ7aN2oHNLjLTs3DAIyu1mwHfA==
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
 * Host interrupt controller sees still-active INTX, reasserts IRQ
 * Host kernel ignores disabled IRQ
 * Guest processes IRQ and clears device interrupt
 * Software mask removed by VFIO driver

The behavior is now platform-dependent.  Some platforms (amd64) will continue
to spew IRQs for as long as the INTX line remains asserted, therefore the IRQ
will be handled by the host as soon as the mask is dropped.  Others (ppc64) will
only send the one request, and if it is not handled no further interrupts will
be sent.  The former behavior theoretically leaves the system vulnerable to
interrupt storm, and the latter will result in the device stalling after
receiving exactly one interrupt in the guest.

Work around this by disabling lazy IRQ masking for DisINTx- INTx devices.
---
 drivers/vfio/pci/vfio_pci_intrs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/vfio/pci/vfio_pci_intrs.c b/drivers/vfio/pci/vfio_pci_intrs.c
index 123298a4dc8f..d8637b53d051 100644
--- a/drivers/vfio/pci/vfio_pci_intrs.c
+++ b/drivers/vfio/pci/vfio_pci_intrs.c
@@ -304,6 +304,9 @@ static int vfio_intx_enable(struct vfio_pci_core_device *vdev,
 
 	vdev->irq_type = VFIO_PCI_INTX_IRQ_INDEX;
 
+	if (!vdev->pci_2_3)
+		irq_set_status_flags(pdev->irq, IRQ_DISABLE_UNLAZY);
+
 	ret = request_irq(pdev->irq, vfio_intx_handler,
 			  irqflags, ctx->name, ctx);
 	if (ret) {
@@ -352,6 +355,8 @@ static void vfio_intx_disable(struct vfio_pci_core_device *vdev)
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

