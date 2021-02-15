Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF1931B6BF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Feb 2021 10:52:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DfKCB5lGnz3cGT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Feb 2021 20:52:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=205.139.111.44;
 helo=us-smtp-delivery-44.mimecast.com; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 334 seconds by postgrey-1.36 at boromir;
 Mon, 15 Feb 2021 20:52:04 AEDT
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DfKBr5fL7z30H7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Feb 2021 20:52:04 +1100 (AEDT)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-ZB_QKXmkNjamOMswugvV1Q-1; Mon, 15 Feb 2021 04:45:11 -0500
X-MC-Unique: ZB_QKXmkNjamOMswugvV1Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 753B91934100;
 Mon, 15 Feb 2021 09:45:09 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-119.ams2.redhat.com [10.36.113.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA8A4682AC;
 Mon, 15 Feb 2021 09:45:07 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2] powerpc/pseries: Don't enforce MSI affinity with kdump
Date: Mon, 15 Feb 2021 10:45:06 +0100
Message-Id: <20210215094506.1196119-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: lvivier@redhat.com, Greg Kurz <groug@kaod.org>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Depending on the number of online CPUs in the original kernel, it is
likely for CPU #0 to be offline in a kdump kernel. The associated IRQs
in the affinity mappings provided by irq_create_affinity_masks() are
thus not started by irq_startup(), as per-design with managed IRQs.

This can be a problem with multi-queue block devices driven by blk-mq :
such a non-started IRQ is very likely paired with the single queue
enforced by blk-mq during kdump (see blk_mq_alloc_tag_set()). This
causes the device to remain silent and likely hangs the guest at
some point.

This is a regression caused by commit 9ea69a55b3b9 ("powerpc/pseries:
Pass MSI affinity to irq_create_mapping()"). Note that this only happens
with the XIVE interrupt controller because XICS has a workaround to bypass
affinity, which is activated during kdump with the "noirqdistrib" kernel
parameter.

The issue comes from a combination of factors:
- discrepancy between the number of queues detected by the multi-queue
  block driver, that was used to create the MSI vectors, and the single
  queue mode enforced later on by blk-mq because of kdump (i.e. keeping
  all queues fixes the issue)
- CPU#0 offline (i.e. kdump always succeed with CPU#0)

Given that I couldn't reproduce on x86, which seems to always have CPU#0
online even during kdump, I'm not sure where this should be fixed. Hence
going for another approach : fine-grained affinity is for performance
and we don't really care about that during kdump. Simply revert to the
previous working behavior of ignoring affinity masks in this case only.

Fixes: 9ea69a55b3b9 ("powerpc/pseries: Pass MSI affinity to irq_create_mapp=
ing()")
Cc: lvivier@redhat.com
Cc: stable@vger.kernel.org
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Greg Kurz <groug@kaod.org>
---

v2: - added missing #include <linux/crash_dump.h>

 arch/powerpc/platforms/pseries/msi.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/=
pseries/msi.c
index b3ac2455faad..637300330507 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -4,6 +4,7 @@
  * Copyright 2006-2007 Michael Ellerman, IBM Corp.
  */
=20
+#include <linux/crash_dump.h>
 #include <linux/device.h>
 #include <linux/irq.h>
 #include <linux/msi.h>
@@ -458,8 +459,28 @@ static int rtas_setup_msi_irqs(struct pci_dev *pdev, i=
nt nvec_in, int type)
 =09=09=09return hwirq;
 =09=09}
=20
-=09=09virq =3D irq_create_mapping_affinity(NULL, hwirq,
-=09=09=09=09=09=09   entry->affinity);
+=09=09/*
+=09=09 * Depending on the number of online CPUs in the original
+=09=09 * kernel, it is likely for CPU #0 to be offline in a kdump
+=09=09 * kernel. The associated IRQs in the affinity mappings
+=09=09 * provided by irq_create_affinity_masks() are thus not
+=09=09 * started by irq_startup(), as per-design for managed IRQs.
+=09=09 * This can be a problem with multi-queue block devices driven
+=09=09 * by blk-mq : such a non-started IRQ is very likely paired
+=09=09 * with the single queue enforced by blk-mq during kdump (see
+=09=09 * blk_mq_alloc_tag_set()). This causes the device to remain
+=09=09 * silent and likely hangs the guest at some point.
+=09=09 *
+=09=09 * We don't really care for fine-grained affinity when doing
+=09=09 * kdump actually : simply ignore the pre-computed affinity
+=09=09 * masks in this case and let the default mask with all CPUs
+=09=09 * be used when creating the IRQ mappings.
+=09=09 */
+=09=09if (is_kdump_kernel())
+=09=09=09virq =3D irq_create_mapping(NULL, hwirq);
+=09=09else
+=09=09=09virq =3D irq_create_mapping_affinity(NULL, hwirq,
+=09=09=09=09=09=09=09   entry->affinity);
=20
 =09=09if (!virq) {
 =09=09=09pr_debug("rtas_msi: Failed mapping hwirq %d\n", hwirq);
--=20
2.26.2

