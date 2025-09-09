Return-Path: <linuxppc-dev+bounces-11974-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B01AEB5076E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 22:48:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLwsH3Dk7z30Jc;
	Wed, 10 Sep 2025 06:48:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757450931;
	cv=none; b=cRhqL72FiIn1Fbzl881rkdcv2fLuC6w4FdOJoS/yPon3uDj3ITjeSp9oKxMUducZ27PIHrQg+q/toA15Y88N+xz92mgum7n7wGJt5QoiU7QMR6H3m5VDLKNmfuBhZC+OwffIQXp3LPFS+oR2h4RTRrCNZv4WaZuK+JdKx9qSrjCmimitDm4K+I6GVIxHV96vhxGLDkvxzTP6CuJSEStYcD2vyLaywYZBy2O36QyhJ3GZg4l29NV0wE5hR7rOctnQEmfowukWrWzxHnmb9PlaW8vh9S8zB+MQiljr/mVLUAnhaPyRpmVZN+nWiBRzPAPxxoqWUvJ5ipmQA6umoM5HDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757450931; c=relaxed/relaxed;
	bh=aHB5DXkErjn2E5tn1hQOECXYgRXXDEcJQb4TCKOHPKY=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=JmTMh7XVXNLJXPh3WDady/m/jUPuLUuvEab9ZtnarPltCc3SLE3+IUuSnR8N2XU8vIMWk2suPW4orFkhH4KQxOlyivvjKSw4sHOUzUghRXTpoB+CsqubVkHUb7sOTGSp9ODYpy+5D0X+PkzGvZRrMn0Srr7CGLWjmUGHYxDqvV+AId6wCIIcjoG6WQ5ZWjXTEoAavjS3N2mjZfqITjJhsmempWVgbrBOZZIuJ22s3EOYyhgTH/kpl4ZuMCeuWfmUbQGDnPqKrS/rTGUVC9y5BnKyGl4SCsf/r9e0ObQNlbm0aA9mGj0ZZa6+/TzieY6TQC1hxG6qKyXA2Rf8dDblcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=vHUt4pHm; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=vHUt4pHm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLwsG3fJjz2ymg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 06:48:50 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 12F378287DA8;
	Tue,  9 Sep 2025 15:48:48 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id jAc376xn005e; Tue,  9 Sep 2025 15:48:47 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 5FBE58287DE2;
	Tue,  9 Sep 2025 15:48:47 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 5FBE58287DE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1757450927; bh=aHB5DXkErjn2E5tn1hQOECXYgRXXDEcJQb4TCKOHPKY=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=vHUt4pHmyzEeERDA/vZRWNpHMRm9WD2860IVhEZ1SwCwQoRoc8v2xAmlDSGd2tuoY
	 +7X70xJ8D2ffJcyZTx4KJwZKLX7SqxF4bKgmpAscvqeWEs3kSDPrTYdPDiRSDhGZGr
	 ptSnybrUVuF+n2MmY3kszhjw4D80HIYK4AGOYMs4=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id cD_RFPt7wzuY; Tue,  9 Sep 2025 15:48:47 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 263888287DA8;
	Tue,  9 Sep 2025 15:48:47 -0500 (CDT)
Date: Tue, 9 Sep 2025 15:48:46 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: kvm <kvm@vger.kernel.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <663798478.1707537.1757450926706.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH] vfio/pci: Fix INTx handling on legacy DisINTx- PCI devices
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
Thread-Index: R10GhsXRj6kdi6znKwcsfy1REC69Aw==
Thread-Topic: vfio/pci: Fix INTx handling on legacy DisINTx- PCI devices
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PCI devices prior to PCI 2.3 both use level interrupts and do not support
interrupt masking, leading to a failure when passed through to a KVM guest on
at least the ppc64 platform, which does not utilize the resample IRQFD. This
failure manifests as receiving and acknowledging a single interrupt in the guest
while leaving the host physical device VFIO IRQ pending.

Level interrupts in general require special handling due to their inherently
asynchronous nature; both the host and guest interrupt controller need to
remain in synchronization in order to coordinate mask and unmask operations.
When lazy IRQ masking is used on DisINTx- hardware, the following sequence
occurs:

 * Level IRQ assertion on host
 * IRQ trigger within host interrupt controller, routed to VFIO driver
 * Host EOI with hardware level IRQ still asserted
 * Software mask of interrupt source by VFIO driver
 * Generation of event and IRQ trigger in KVM guest interrupt controller
 * Level IRQ deassertion on host
 * Guest EOI
 * Guest IRQ level deassertion
 * Removal of software mask by VFIO driver

Note that no actual state change occurs within the host interrupt controller,
unlike what would happen with either DisINTx+ hardware or message interrupts.
The host EOI is not fired with the hardware level IRQ deasserted, and the
level interrupt is not re-armed within the host interrupt controller, leading
to an unrecoverable stall of the device.

Work around this by disabling lazy IRQ masking for DisINTx- INTx devices.

---
 drivers/vfio/pci/vfio_pci_intrs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/vfio/pci/vfio_pci_intrs.c b/drivers/vfio/pci/vfio_pci_intrs.c
index 123298a4dc8f..011169ca7a34 100644
--- a/drivers/vfio/pci/vfio_pci_intrs.c
+++ b/drivers/vfio/pci/vfio_pci_intrs.c
@@ -304,6 +304,9 @@ static int vfio_intx_enable(struct vfio_pci_core_device *vdev,
 
 	vdev->irq_type = VFIO_PCI_INTX_IRQ_INDEX;
 
+	if (is_intx(vdev) && !vdev->pci_2_3)
+		irq_set_status_flags(pdev->irq, IRQ_DISABLE_UNLAZY);
+
 	ret = request_irq(pdev->irq, vfio_intx_handler,
 			  irqflags, ctx->name, ctx);
 	if (ret) {
@@ -351,6 +354,8 @@ static void vfio_intx_disable(struct vfio_pci_core_device *vdev)
 	if (ctx) {
 		vfio_virqfd_disable(&ctx->unmask);
 		vfio_virqfd_disable(&ctx->mask);
+		if (!vdev->pci_2_3)
+			irq_clear_status_flags(pdev->irq, IRQ_DISABLE_UNLAZY);
 		free_irq(pdev->irq, ctx);
 		if (ctx->trigger)
 			eventfd_ctx_put(ctx->trigger);
-- 
2.39.5

