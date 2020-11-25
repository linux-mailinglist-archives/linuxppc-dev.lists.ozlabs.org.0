Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 616832C42B9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 16:15:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch4FK1pnmzDqN6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 02:15:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=lvivier@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=aRIYRxfH; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=aRIYRxfH; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch47K1RHpzDqpk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 02:09:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606316985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KjQv5P7PRIrY0L8Xs58Fh8UAYQad1MiPuDtp8tpbsOc=;
 b=aRIYRxfH5mWGkMuxUntlfc3nlNGcTAKSGATC0nA8OO+rNRfm9Jxu9B6GVMHVaSaGbTMkPv
 OvY1cIDcXbNROITN+KVzwbZDki8AOqVIOWjB0m0MycOsa55vY6y1bnsDAFmAl6TZFm9zMF
 JQIJWoCZPSAzq7a/RsyAetwrpRCRrwI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606316985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KjQv5P7PRIrY0L8Xs58Fh8UAYQad1MiPuDtp8tpbsOc=;
 b=aRIYRxfH5mWGkMuxUntlfc3nlNGcTAKSGATC0nA8OO+rNRfm9Jxu9B6GVMHVaSaGbTMkPv
 OvY1cIDcXbNROITN+KVzwbZDki8AOqVIOWjB0m0MycOsa55vY6y1bnsDAFmAl6TZFm9zMF
 JQIJWoCZPSAzq7a/RsyAetwrpRCRrwI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-q316MsHQNwq40zLS7Z4FTQ-1; Wed, 25 Nov 2020 10:09:40 -0500
X-MC-Unique: q316MsHQNwq40zLS7Z4FTQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14AA3107AFA9;
 Wed, 25 Nov 2020 15:09:39 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-113-83.ams2.redhat.com [10.36.113.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 099ED5C1B4;
 Wed, 25 Nov 2020 15:09:32 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] powerpc/pseries: fix MSI/X IRQ affinity on pseries
Date: Wed, 25 Nov 2020 16:09:30 +0100
Message-Id: <20201125150932.1150619-1-lvivier@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Laurent Vivier <lvivier@redhat.com>, Marc Zyngier <maz@kernel.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, linux-pci@vger.kernel.org,
 Greg Kurz <groug@kaod.org>, linux-block@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With virtio, in multiqueue case, each queue IRQ is normally=0D
bound to a different CPU using the affinity mask.=0D
=0D
This works fine on x86_64 but totally ignored on pseries.=0D
=0D
This is not obvious at first look because irqbalance is doing=0D
some balancing to improve that.=0D
=0D
It appears that the "managed" flag set in the MSI entry=0D
is never copied to the system IRQ entry.=0D
=0D
This series passes the affinity mask from rtas_setup_msi_irqs()=0D
to irq_domain_alloc_descs() by adding an affinity parameter to=0D
irq_create_mapping().=0D
=0D
The first patch adds the parameter (no functional change), the=0D
second patch passes the actual affinity mask to irq_create_mapping()=0D
in rtas_setup_msi_irqs().=0D
=0D
For instance, with 32 CPUs VM and 32 queues virtio-scsi interface:=0D
=0D
... -smp 32 -device virtio-scsi-pci,id=3Dvirtio_scsi_pci0,num_queues=3D32=0D
=0D
for IRQ in $(grep virtio2-request /proc/interrupts |cut -d: -f1); do=0D
    for file in /proc/irq/$IRQ/ ; do=0D
        echo -n "IRQ: $(basename $file) CPU: " ; cat $file/smp_affinity_lis=
t=0D
    done=0D
done=0D
=0D
Without the patch (and without irqbalanced)=0D
=0D
IRQ: 268 CPU: 0-31=0D
IRQ: 269 CPU: 0-31=0D
IRQ: 270 CPU: 0-31=0D
IRQ: 271 CPU: 0-31=0D
IRQ: 272 CPU: 0-31=0D
IRQ: 273 CPU: 0-31=0D
IRQ: 274 CPU: 0-31=0D
IRQ: 275 CPU: 0-31=0D
IRQ: 276 CPU: 0-31=0D
IRQ: 277 CPU: 0-31=0D
IRQ: 278 CPU: 0-31=0D
IRQ: 279 CPU: 0-31=0D
IRQ: 280 CPU: 0-31=0D
IRQ: 281 CPU: 0-31=0D
IRQ: 282 CPU: 0-31=0D
IRQ: 283 CPU: 0-31=0D
IRQ: 284 CPU: 0-31=0D
IRQ: 285 CPU: 0-31=0D
IRQ: 286 CPU: 0-31=0D
IRQ: 287 CPU: 0-31=0D
IRQ: 288 CPU: 0-31=0D
IRQ: 289 CPU: 0-31=0D
IRQ: 290 CPU: 0-31=0D
IRQ: 291 CPU: 0-31=0D
IRQ: 292 CPU: 0-31=0D
IRQ: 293 CPU: 0-31=0D
IRQ: 294 CPU: 0-31=0D
IRQ: 295 CPU: 0-31=0D
IRQ: 296 CPU: 0-31=0D
IRQ: 297 CPU: 0-31=0D
IRQ: 298 CPU: 0-31=0D
IRQ: 299 CPU: 0-31=0D
=0D
With the patch:=0D
=0D
IRQ: 265 CPU: 0=0D
IRQ: 266 CPU: 1=0D
IRQ: 267 CPU: 2=0D
IRQ: 268 CPU: 3=0D
IRQ: 269 CPU: 4=0D
IRQ: 270 CPU: 5=0D
IRQ: 271 CPU: 6=0D
IRQ: 272 CPU: 7=0D
IRQ: 273 CPU: 8=0D
IRQ: 274 CPU: 9=0D
IRQ: 275 CPU: 10=0D
IRQ: 276 CPU: 11=0D
IRQ: 277 CPU: 12=0D
IRQ: 278 CPU: 13=0D
IRQ: 279 CPU: 14=0D
IRQ: 280 CPU: 15=0D
IRQ: 281 CPU: 16=0D
IRQ: 282 CPU: 17=0D
IRQ: 283 CPU: 18=0D
IRQ: 284 CPU: 19=0D
IRQ: 285 CPU: 20=0D
IRQ: 286 CPU: 21=0D
IRQ: 287 CPU: 22=0D
IRQ: 288 CPU: 23=0D
IRQ: 289 CPU: 24=0D
IRQ: 290 CPU: 25=0D
IRQ: 291 CPU: 26=0D
IRQ: 292 CPU: 27=0D
IRQ: 293 CPU: 28=0D
IRQ: 294 CPU: 29=0D
IRQ: 295 CPU: 30=0D
IRQ: 299 CPU: 31=0D
=0D
This matches what we have on an x86_64 system.=0D
=0D
v3: update changelog of PATCH 1 with comments from Thomas Gleixner and=0D
    Marc Zyngier.=0D
v2: add a wrapper around original irq_create_mapping() with the=0D
    affinity parameter. Update comments=0D
=0D
Laurent Vivier (2):=0D
  genirq/irqdomain: Add an irq_create_mapping_affinity() function=0D
  powerpc/pseries: pass MSI affinity to irq_create_mapping()=0D
=0D
 arch/powerpc/platforms/pseries/msi.c |  3 ++-=0D
 include/linux/irqdomain.h            | 12 ++++++++++--=0D
 kernel/irq/irqdomain.c               | 13 ++++++++-----=0D
 3 files changed, 20 insertions(+), 8 deletions(-)=0D
=0D
-- =0D
2.28.0=0D
=0D

