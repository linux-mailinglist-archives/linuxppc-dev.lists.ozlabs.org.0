Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E078B1A7186
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 05:10:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491VqY6QQszDqJ8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 13:10:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=jasowang@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=iWmGQtqq; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491VJ871HTzDqQW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 12:47:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586832421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=1JQT2Xm0ZoYwsGUbbr9yEBymLjUdcqLv7hF40ghU85w=;
 b=iWmGQtqqGR7nOj067FqfP6wUT1sMvOY8I9JTSxcEfm85EdAfh/xEV71fOK2aIeM76Rv2ib
 TEaYefth8Nj1H2D2CxJcjmIJUict6y3Jy16mc3RZDWcZn4y1t6nWSDcWEWGTdtwsQ8+PPD
 l/LzrhErvywcW41W9WE/7RwUEMrZKx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-DsspG1W7MT6P3LkdYibTNg-1; Mon, 13 Apr 2020 22:44:52 -0400
X-MC-Unique: DsspG1W7MT6P3LkdYibTNg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 359E6107ACC4;
 Tue, 14 Apr 2020 02:44:49 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-119.pek2.redhat.com [10.72.13.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 199AB60BE1;
 Tue, 14 Apr 2020 02:44:40 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH] vhost: do not enable VHOST_MENU by default
Date: Tue, 14 Apr 2020 10:44:38 +0800
Message-Id: <20200414024438.19103-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: linux-s390@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vasily Gorbik <gor@linux.ibm.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-mips@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, geert@linux-m68k.org,
 netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We try to keep the defconfig untouched after decoupling CONFIG_VHOST
out of CONFIG_VIRTUALIZATION in commit 20c384f1ea1a
("vhost: refine vhost and vringh kconfig") by enabling VHOST_MENU by
default. Then the defconfigs can keep enabling CONFIG_VHOST_NET
without the caring of CONFIG_VHOST.

But this will leave a "CONFIG_VHOST_MENU=3Dy" in all defconfigs and even
for the ones that doesn't want vhost. So it actually shifts the
burdens to the maintainers of all other to add "CONFIG_VHOST_MENU is
not set". So this patch tries to enable CONFIG_VHOST explicitly in
defconfigs that enables CONFIG_VHOST_NET and CONFIG_VHOST_VSOCK.

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 arch/mips/configs/malta_kvm_defconfig  |  1 +
 arch/powerpc/configs/powernv_defconfig |  1 +
 arch/powerpc/configs/ppc64_defconfig   |  1 +
 arch/powerpc/configs/pseries_defconfig |  1 +
 arch/s390/configs/debug_defconfig      |  1 +
 arch/s390/configs/defconfig            |  1 +
 drivers/vhost/Kconfig                  | 18 +++++-------------
 7 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/arch/mips/configs/malta_kvm_defconfig b/arch/mips/configs/ma=
lta_kvm_defconfig
index 8ef612552a19..06f0c7a0ca87 100644
--- a/arch/mips/configs/malta_kvm_defconfig
+++ b/arch/mips/configs/malta_kvm_defconfig
@@ -18,6 +18,7 @@ CONFIG_PCI=3Dy
 CONFIG_VIRTUALIZATION=3Dy
 CONFIG_KVM=3Dm
 CONFIG_KVM_MIPS_DEBUG_COP0_COUNTERS=3Dy
+CONFIG_VHOST=3Dm
 CONFIG_VHOST_NET=3Dm
 CONFIG_MODULES=3Dy
 CONFIG_MODULE_UNLOAD=3Dy
diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/config=
s/powernv_defconfig
index 71749377d164..404245b4594d 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -346,5 +346,6 @@ CONFIG_CRYPTO_DEV_VMX=3Dy
 CONFIG_VIRTUALIZATION=3Dy
 CONFIG_KVM_BOOK3S_64=3Dm
 CONFIG_KVM_BOOK3S_64_HV=3Dm
+CONFIG_VHOST=3Dm
 CONFIG_VHOST_NET=3Dm
 CONFIG_PRINTK_TIME=3Dy
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/=
ppc64_defconfig
index 7e68cb222c7b..4599fc7be285 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -61,6 +61,7 @@ CONFIG_ELECTRA_CF=3Dy
 CONFIG_VIRTUALIZATION=3Dy
 CONFIG_KVM_BOOK3S_64=3Dm
 CONFIG_KVM_BOOK3S_64_HV=3Dm
+CONFIG_VHOST=3Dm
 CONFIG_VHOST_NET=3Dm
 CONFIG_OPROFILE=3Dm
 CONFIG_KPROBES=3Dy
diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/config=
s/pseries_defconfig
index 6b68109e248f..4cad3901b5de 100644
--- a/arch/powerpc/configs/pseries_defconfig
+++ b/arch/powerpc/configs/pseries_defconfig
@@ -321,5 +321,6 @@ CONFIG_CRYPTO_DEV_VMX=3Dy
 CONFIG_VIRTUALIZATION=3Dy
 CONFIG_KVM_BOOK3S_64=3Dm
 CONFIG_KVM_BOOK3S_64_HV=3Dm
+CONFIG_VHOST=3Dm
 CONFIG_VHOST_NET=3Dm
 CONFIG_PRINTK_TIME=3Dy
diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_=
defconfig
index 0c86ba19fa2b..6ec6e69630d1 100644
--- a/arch/s390/configs/debug_defconfig
+++ b/arch/s390/configs/debug_defconfig
@@ -57,6 +57,7 @@ CONFIG_PROTECTED_VIRTUALIZATION_GUEST=3Dy
 CONFIG_CMM=3Dm
 CONFIG_APPLDATA_BASE=3Dy
 CONFIG_KVM=3Dm
+CONFIG_VHOST=3Dm
 CONFIG_VHOST_NET=3Dm
 CONFIG_VHOST_VSOCK=3Dm
 CONFIG_OPROFILE=3Dm
diff --git a/arch/s390/configs/defconfig b/arch/s390/configs/defconfig
index 6b27d861a9a3..d1b3bf83d687 100644
--- a/arch/s390/configs/defconfig
+++ b/arch/s390/configs/defconfig
@@ -57,6 +57,7 @@ CONFIG_PROTECTED_VIRTUALIZATION_GUEST=3Dy
 CONFIG_CMM=3Dm
 CONFIG_APPLDATA_BASE=3Dy
 CONFIG_KVM=3Dm
+CONFIG_VHOST=3Dm
 CONFIG_VHOST_NET=3Dm
 CONFIG_VHOST_VSOCK=3Dm
 CONFIG_OPROFILE=3Dm
diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
index e79cbbdfea45..14d296dc18cd 100644
--- a/drivers/vhost/Kconfig
+++ b/drivers/vhost/Kconfig
@@ -12,23 +12,18 @@ config VHOST_RING
 	  This option is selected by any driver which needs to access
 	  the host side of a virtio ring.
=20
-config VHOST
-	tristate
+menuconfig VHOST
+	tristate "Vhost Devices"
 	select VHOST_IOTLB
 	help
-	  This option is selected by any driver which needs to access
-	  the core of vhost.
-
-menuconfig VHOST_MENU
-	bool "VHOST drivers"
-	default y
+	  Enable option to support host kernel or hardware accelerator
+	  for virtio device.
=20
-if VHOST_MENU
+if VHOST
=20
 config VHOST_NET
 	tristate "Host kernel accelerator for virtio net"
 	depends on NET && EVENTFD && (TUN || !TUN) && (TAP || !TAP)
-	select VHOST
 	---help---
 	  This kernel module can be loaded in host kernel to accelerate
 	  guest networking with virtio_net. Not to be confused with virtio_net
@@ -40,7 +35,6 @@ config VHOST_NET
 config VHOST_SCSI
 	tristate "VHOST_SCSI TCM fabric driver"
 	depends on TARGET_CORE && EVENTFD
-	select VHOST
 	default n
 	---help---
 	Say M here to enable the vhost_scsi TCM fabric module
@@ -49,7 +43,6 @@ config VHOST_SCSI
 config VHOST_VSOCK
 	tristate "vhost virtio-vsock driver"
 	depends on VSOCKETS && EVENTFD
-	select VHOST
 	select VIRTIO_VSOCKETS_COMMON
 	default n
 	---help---
@@ -63,7 +56,6 @@ config VHOST_VSOCK
 config VHOST_VDPA
 	tristate "Vhost driver for vDPA-based backend"
 	depends on EVENTFD
-	select VHOST
 	depends on VDPA
 	help
 	  This kernel module can be loaded in host kernel to accelerate
--=20
2.20.1

