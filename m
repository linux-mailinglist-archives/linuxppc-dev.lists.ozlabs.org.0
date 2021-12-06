Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FD846AC11
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 23:31:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7J6r3Xxbz3dbq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 09:31:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tdR1Yo1b;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rM6g+Z9D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=tdR1Yo1b; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=rM6g+Z9D; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7J2t5DBgz2ymP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Dec 2021 09:27:34 +1100 (AEDT)
Message-ID: <20211206210224.103502021@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638829652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=aL/VIL4bKAOk4G3UXRaDbYDCQCUHomOCFOLYCw7n0T4=;
 b=tdR1Yo1b4L979PReLtRwSr9KoFKCjaxkig8tEe2FBIPXHXjOv7Mc2jnpFy5d5ujcRG9zf2
 YANt+QuUbpnUYaWhnBtSHaKqGvAj3EA/vWxXcC93VD/psiez55uaqQuMXahn3k2wcp7TIs
 dzvgsa3MguKW/H/7qISbFdepvIsonMp+pcJQTxLy0Tq8xqNv4AzIHYrBlQjpabukLMoAQH
 +8WoxFZhtgRRZ0BM+5uKEmfxHrc+cg3hLFITAABCGn+9ztS/P7IusvhBD0BzMAiM5V91it
 NZB9Ix02RBqpBYkaQPqR4J0ny70Kpv7PWUnkultE1cGpFyC/CxWO/mhIGaySJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638829652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=aL/VIL4bKAOk4G3UXRaDbYDCQCUHomOCFOLYCw7n0T4=;
 b=rM6g+Z9DTE4BADbMORMbZP61UuPqp6XkB7syFu8ZEotroMrF5V2TzTS9qjDZR3MfVEmuj2
 pW0Kwnn6e9i/AjBg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 05/23] genirq/msi: Fixup includes
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:27:31 +0100 (CET)
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
Cc: linux-hyperv@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Ashok Raj <ashok.raj@intel.com>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
 Kevin Tian <kevin.tian@intel.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Cedric Le Goater <clg@kaod.org>,
 Kalle Valo <kvalo@codeaurora.org>, Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Marc Zygnier <maz@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove the kobject.h include from msi.h as it's not required and add a
sysfs.h include to the core code instead.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 include/linux/msi.h |    2 +-
 kernel/irq/msi.c    |    1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -2,7 +2,7 @@
 #ifndef LINUX_MSI_H
 #define LINUX_MSI_H
 
-#include <linux/kobject.h>
+#include <linux/cpumask.h>
 #include <linux/list.h>
 #include <asm/msi.h>
 
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -14,6 +14,7 @@
 #include <linux/irqdomain.h>
 #include <linux/msi.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 #include <linux/pci.h>
 
 #include "internals.h"

