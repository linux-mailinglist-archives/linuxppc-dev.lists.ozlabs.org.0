Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EC61219F7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 20:33:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cBJD5VrXzDqPn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 06:33:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ch.abb.com (client-ip=138.225.1.74; helo=inet10.abb.com;
 envelope-from=holger.brunck@ch.abb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ch.abb.com
X-Greylist: delayed 2862 seconds by postgrey-1.36 at bilbo;
 Mon, 16 Dec 2019 21:38:22 AEDT
Received: from inet10.abb.com (inet10.abb.com [138.225.1.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47byRL0k3LzDqHW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2019 21:38:21 +1100 (AEDT)
Received: from gitsiv.ch.abb.com ([10.41.156.251])
 by inet10.abb.com (8.14.7/8.14.7) with SMTP id xBG9oFsC017728;
 Mon, 16 Dec 2019 10:50:15 +0100
Received: from ch10641.keymile.net (ch10641.keymile.net [172.31.40.7])
 by gitsiv.ch.abb.com (Postfix) with ESMTP id 0E09A6353815;
 Mon, 16 Dec 2019 10:50:14 +0100 (CET)
From: Holger Brunck <holger.brunck@ch.abb.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/83xx: update kmeter1 defconfig and dts
Date: Mon, 16 Dec 2019 10:50:06 +0100
Message-Id: <20191216095006.13590-1-holger.brunck@ch.abb.com>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 17 Dec 2019 06:30:54 +1100
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
Cc: Matteo Ghidoni <matteo.ghidoni@ch.abb.com>,
 Holger Brunck <holger.brunck@ch.abb.com>, Heiko Schocher <hs@denx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Matteo Ghidoni <matteo.ghidoni@ch.abb.com>

The defconfig is synchronized and the missing
MTD_PHYSMAP, DEVTMPFS and I2C MUX support are switched on.

Additionally the I2C mux device is added to the DTS with
its attached temperature sensors and I2C clock frequency
is lowered.

Signed-off-by: Matteo Ghidoni <matteo.ghidoni@ch.abb.com>
Signed-off-by: Holger Brunck <holger.brunck@ch.abb.com>
CC: Heiko Schocher <hs@denx.de>
CC: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/boot/dts/kmeter1.dts           | 40 +++++++++++++++++++++++=
+++++-
 arch/powerpc/configs/83xx/kmeter1_defconfig | 20 +++++++++------
 2 files changed, 51 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/boot/dts/kmeter1.dts b/arch/powerpc/boot/dts/km=
eter1.dts
index 154f5d293fd3..bc33f3ad19a3 100644
--- a/arch/powerpc/boot/dts/kmeter1.dts
+++ b/arch/powerpc/boot/dts/kmeter1.dts
@@ -70,7 +70,45 @@
 			reg =3D <0x3000 0x100>;
 			interrupts =3D <14 0x8>;
 			interrupt-parent =3D <&ipic>;
-			clock-frequency =3D <400000>;
+			clock-frequency =3D <100000>;
+
+			mux@70 {
+				compatible =3D "nxp,pca9547";
+				reg =3D <0x70>;
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				i2c@2 {
+					reg =3D <2>;
+					#address-cells =3D <1>;
+					#size-cells =3D <0>;
+
+					/* Temperature sensors */
+					temp@48 {
+						label =3D "Top";
+						compatible =3D "national,lm75";
+						reg =3D <0x48>;
+					};
+
+					temp@49 {
+						label =3D "Control";
+						compatible =3D "national,lm75";
+						reg =3D <0x49>;
+					};
+
+					temp@4a {
+						label =3D "Power";
+						compatible =3D "national,lm75";
+						reg =3D <0x4a>;
+					};
+
+					temp@4b {
+						label =3D "Front";
+						compatible =3D "national,lm75";
+						reg =3D <0x4b>;
+					};
+				};
+			};
 		};
=20
 		serial0: serial@4500 {
diff --git a/arch/powerpc/configs/83xx/kmeter1_defconfig b/arch/powerpc/c=
onfigs/83xx/kmeter1_defconfig
index 648c6b3dccf9..72abd8ae654a 100644
--- a/arch/powerpc/configs/83xx/kmeter1_defconfig
+++ b/arch/powerpc/configs/83xx/kmeter1_defconfig
@@ -3,22 +3,20 @@ CONFIG_SYSVIPC=3Dy
 CONFIG_POSIX_MQUEUE=3Dy
 CONFIG_NO_HZ=3Dy
 CONFIG_HIGH_RES_TIMERS=3Dy
+CONFIG_PREEMPT=3Dy
 CONFIG_LOG_BUF_SHIFT=3D14
 CONFIG_EXPERT=3Dy
 CONFIG_SLAB=3Dy
-CONFIG_MODULES=3Dy
-CONFIG_MODULE_UNLOAD=3Dy
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_PARTITION_ADVANCED=3Dy
-# CONFIG_MSDOS_PARTITION is not set
-# CONFIG_IOSCHED_DEADLINE is not set
-# CONFIG_IOSCHED_CFQ is not set
 # CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_83xx=3Dy
 CONFIG_KMETER1=3Dy
-CONFIG_PREEMPT=3Dy
 # CONFIG_SECCOMP is not set
+CONFIG_MODULES=3Dy
+CONFIG_MODULE_UNLOAD=3Dy
+# CONFIG_BLK_DEV_BSG is not set
+CONFIG_PARTITION_ADVANCED=3Dy
+# CONFIG_MSDOS_PARTITION is not set
 CONFIG_NET=3Dy
 CONFIG_PACKET=3Dy
 CONFIG_UNIX=3Dy
@@ -29,12 +27,15 @@ CONFIG_IP_PNP=3Dy
 CONFIG_TIPC=3Dy
 CONFIG_BRIDGE=3Dm
 CONFIG_VLAN_8021Q=3Dy
+CONFIG_DEVTMPFS=3Dy
+CONFIG_DEVTMPFS_MOUNT=3Dy
 CONFIG_MTD=3Dy
 CONFIG_MTD_CMDLINE_PARTS=3Dy
 CONFIG_MTD_BLOCK=3Dy
 CONFIG_MTD_CFI=3Dy
 CONFIG_MTD_CFI_INTELEXT=3Dy
 CONFIG_MTD_CFI_AMDSTD=3Dy
+CONFIG_MTD_PHYSMAP=3Dy
 CONFIG_MTD_PHYSMAP_OF=3Dy
 CONFIG_MTD_PHRAM=3Dy
 CONFIG_MTD_UBI=3Dy
@@ -57,7 +58,10 @@ CONFIG_SERIAL_8250_CONSOLE=3Dy
 CONFIG_HW_RANDOM=3Dy
 CONFIG_I2C=3Dy
 CONFIG_I2C_CHARDEV=3Dy
+CONFIG_I2C_MUX=3Dy
+CONFIG_I2C_MUX_PCA954x=3Dy
 CONFIG_I2C_MPC=3Dy
+CONFIG_GPIOLIB=3Dy
 # CONFIG_HWMON is not set
 # CONFIG_USB_SUPPORT is not set
 CONFIG_UIO=3Dy
--=20
2.11.1

