Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABE41C9D90
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 23:40:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49J6Mf67F1zDqsK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 07:40:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=stevens-zone.net (client-ip=212.227.126.187;
 helo=mout.kundenserver.de; envelope-from=darren@stevens-zone.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=stevens-zone.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49J6Bs15xdzDqgS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 07:33:07 +1000 (AEST)
Received: from Cyrus.lan ([80.189.87.220]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.163]) with ESMTPA (Nemesis) id
 1MmDAW-1iougF0Pse-00iDsL; Thu, 07 May 2020 23:32:59 +0200
Date: Thu, 7 May 2020 22:30:25 +0100
From: Darren Stevens <darren@stevens-zone.net>
To: linuxppc-dev@lists.ozlabs.org, oss@buserror.net
Subject: [PATCH 5/5] powerpc/mpc85xx: Add Cyrus P5040 device tree source
Message-ID: <20200507223025.0164b95b@Cyrus.lan>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; powerpc-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:GXtaYXOv1B/RabyQVXjZJBu5bQ20FowCrgPra/IS9+5pbXQc/PL
 uqwfn8dmizwenabUpWtaalXHPlMPLNr5DTjE2uDdvMLxLbdC+talbh7DxLumj7p1rhWG96e
 i8GwILazlCcoe5Dr0x0DoevdbqWX9kxB6VOlNz4wwSXcspChosPljkcpoqM2XrNroT13fxI
 ylpRLQACRSDeUu/Ph5rkw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Os9PIwNHjRI=:SHyTx+5XYS3Ja7uDgZo3sb
 j5fDwx9HvvJQkesq0JX2yNFIfA8mPkk4RC3nd73uOPl0b7YEsAM+VFjStc1YCUIaQk17kzSE6
 Tocpbf9ZVa7HdazF8ovbDu6Y6LICAmpJANioN6GXibVoz/OyW8ZF/ojfS/Wue5A733GV0ACpi
 XnIfm5NOacQdYV71tVy2qKnVaTACzrJPzgaNO+keqUQuxFCY4aUYBMwtkJGL/RfD6Ym9VVucC
 3pi5UTJcbD+nPqC/Orz3KaEa8hqep/OaE0Q6B82KHGew0D9L61ysHafsWUE0cvGRIbVpZgvMB
 2/5eBPCN91oiOd/JbtzBloTxh4QjqZt+1SgVaQwmfEQS6Enk2FBKOXpsEVnVr4ha4aigSp5hh
 6LKgdsj2Pb6TVLTjUPirvXFKGB49rK7hS5zRFEGhdB4rTUWV/2BNNhwleRYbODX4OKULrpgt8
 8b7vAqc08bXd1uNeoeaNNuwd9wkX28iOcF4S7NxIHzJq5u11t+U8CdqYEKNDplIwWOtGok0A9
 8CIf5g4/2ngt5q8fi9RojgeY+jbpVdEOATMzT0fIyn8Q6xSftVHU7aJJzVf0ya6A4c9RXW1/E
 8ClNNcEYcy5fcscltmVqlcZQOC0S/INMDcZzdKz8FIJMiUn958ICrxx4Z+enD1bj2ZbUfVGob
 4oApczP2iCqkBgm02BanM2JZsErHBV+VAw+assFCfLCI+lc+ldN5XGOCYkXZPu1kagSKxR6kT
 Kdn8q6ghGexwfbKWLzBah5bTGeF6E4eNog4JcvzwY5sx5A6vPTilMMEVXuIY6+KcPj9MqFpYY
 y2hNhfTeuFy01f6QycQioKBzYz/ZbmShT+zUAkbX2nWUadtAJqtSGJeG1fLWG77gnAM0HbK
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
Cc: chzigotzky@xenosoft.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The Cyrus P5040 does not currently have a dts file in Linux, Add one.

Signed-off-by: Darren Stevens <darren@stevens-zone.net>
Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>

---
 arch/powerpc/boot/dts/fsl/cyrus_p5040.dts | 235 ++++++++++++++++++++++++++++++
 1 file changed, 235 insertions(+)

diff --git a/arch/powerpc/boot/dts/fsl/cyrus_p5040.dts b/arch/powerpc/boot/dts/fsl/cyrus_p5040.dts
new file mode 100644
index 0000000..596ee19
--- /dev/null
+++ b/arch/powerpc/boot/dts/fsl/cyrus_p5040.dts
@@ -0,0 +1,235 @@
+/*
+ * Cyrus 5040 Device Tree Source, based on p5040ds.dts
+ *
+ * Copyright 2020 Darren Stevens
+ *
+ * p5040ds.dts Copyright 2012 - 2015 Freescale Semiconductor Inc.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are met:
+ *     * Redistributions of source code must retain the above copyright
+ *       notice, this list of conditions and the following disclaimer.
+ *     * Redistributions in binary form must reproduce the above copyright
+ *       notice, this list of conditions and the following disclaimer in the
+ *       documentation and/or other materials provided with the distribution.
+ *     * Neither the name of Freescale Semiconductor nor the
+ *       names of its contributors may be used to endorse or promote products
+ *       derived from this software without specific prior written permission.
+ *
+ *
+ * ALTERNATIVELY, this software may be distributed under the terms of the
+ * GNU General Public License ("GPL") as published by the Free Software
+ * Foundation, either version 2 of that License or (at your option) any
+ * later version.
+ *
+ * This software is provided by Freescale Semiconductor "as is" and any
+ * express or implied warranties, including, but not limited to, the implied
+ * warranties of merchantability and fitness for a particular purpose are
+ * disclaimed. In no event shall Freescale Semiconductor be liable for any
+ * direct, indirect, incidental, special, exemplary, or consequential damages
+ * (including, but not limited to, procurement of substitute goods or services;
+ * loss of use, data, or profits; or business interruption) however caused and
+ * on any theory of liability, whether in contract, strict liability, or tort
+ * (including negligence or otherwise) arising in any way out of the use of this
+ * software, even if advised of the possibility of such damage.
+ */
+
+/include/ "p5040si-pre.dtsi"
+
+/ {
+	model = "varisys,CYRUS5040";
+	compatible = "varisys,CYRUS";
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&mpic>;
+
+	aliases{
+		ethernet0 = &enet4;
+		ethernet1 = &enet10;
+	};
+
+	memory {
+		device_type = "memory";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		bman_fbpr: bman-fbpr {
+			size = <0 0x1000000>;
+			alignment = <0 0x1000000>;
+		};
+		qman_fqd: qman-fqd {
+			size = <0 0x400000>;
+			alignment = <0 0x400000>;
+		};
+		qman_pfdr: qman-pfdr {
+			size = <0 0x2000000>;
+			alignment = <0 0x2000000>;
+		};
+	};
+
+	dcsr: dcsr@f00000000 {
+		ranges = <0x00000000 0xf 0x00000000 0x01008000>;
+	};
+
+	bportals: bman-portals@ff4000000 {
+		ranges = <0x0 0xf 0xf4000000 0x200000>;
+	};
+
+	qportals: qman-portals@ff4200000 {
+		ranges = <0x0 0xf 0xf4200000 0x200000>;
+	};
+
+	soc: soc@ffe000000 {
+		ranges = <0x00000000 0xf 0xfe000000 0x1000000>;
+		reg = <0xf 0xfe000000 0 0x00001000>;
+		spi@110000 {
+		};
+
+		i2c@118100 {
+		};
+
+		i2c@119100 {
+			rtc@6f {
+				compatible = "microchip,mcp7941x";
+				reg = <0x6f>;
+			};
+		};
+
+		gpio-poweroff {
+			compatible = "gpio-poweroff";
+			gpios = <&gpio0 3 1>;
+		};
+
+		gpio-restart {
+			compatible = "gpio-restart";
+			gpios = <&gpio0 2 1>;
+		};
+
+		leds {
+			compatible = "gpio-leds";
+			hdd {
+				label = "Disk activity";
+				gpios = <&gpio0 5 0>;
+				linux,default-trigger = "disk-activity";
+			};
+		};
+
+		fman@400000 {
+			mdio@e1120 {
+				phy3: ethernet-phy@3 {
+					reg = <0x3>;
+				};
+
+				phy7: ethernet-phy@7 {
+					reg = <0x7>;
+				};
+			};
+
+			ethernet@e0000 {
+				status = "disabled";
+			};
+
+			ethernet@e2000 {
+				status = "disabled";
+			};
+
+			ethernet@e4000 {
+				status = "disabled";
+			};
+
+			ethernet@e6000 {
+				status = "disabled";
+			};
+
+			ethernet@e8000 {
+				phy-handle = <&phy3>;
+				phy-connection-type = "rgmii";
+			};
+
+		};
+
+		fman@500000 {
+			ethernet@e0000 {
+				status = "disabled";
+			};
+
+			ethernet@e2000 {
+				status = "disabled";
+			};
+
+			ethernet@e4000 {
+				status = "disabled";
+			};
+
+			ethernet@e6000 {
+				status = "disabled";
+			};
+
+			ethernet@e8000 {
+				phy-handle = <&phy7>;
+				phy-connection-type = "rgmii";
+			};
+
+		};
+
+	};
+
+	lbc: localbus@ffe124000 {
+		reg = <0xf 0xfe124000 0 0x1000>;
+		ranges = <0 0 0xf 0xe8000000 0x08000000
+			  2 0 0xf 0xffa00000 0x00040000
+			  3 0 0xf 0xffdf0000 0x00008000>;
+
+	};
+
+	pci0: pcie@ffe200000 {
+		reg = <0xf 0xfe200000 0 0x1000>;
+		ranges = <0x02000000 0 0xe0000000 0xc 0x00000000 0x0 0x20000000
+			  0x01000000 0 0x00000000 0xf 0xf8000000 0x0 0x00010000>;
+		pcie@0 {
+			ranges = <0x02000000 0 0xe0000000
+				  0x02000000 0 0xe0000000
+				  0 0x20000000
+
+				  0x01000000 0 0x00000000
+				  0x01000000 0 0x00000000
+				  0 0x00010000>;
+		};
+	};
+
+	pci1: pcie@ffe201000 {
+		reg = <0xf 0xfe201000 0 0x1000>;
+		ranges = <0x02000000 0x0 0xe0000000 0xc 0x20000000 0x0 0x20000000
+			  0x01000000 0x0 0x00000000 0xf 0xf8010000 0x0 0x00010000>;
+		pcie@0 {
+			ranges = <0x02000000 0 0xe0000000
+				  0x02000000 0 0xe0000000
+				  0 0x20000000
+
+				  0x01000000 0 0x00000000
+				  0x01000000 0 0x00000000
+				  0 0x00010000>;
+		};
+	};
+
+	pci2: pcie@ffe202000 {
+		reg = <0xf 0xfe202000 0 0x1000>;
+		ranges = <0x02000000 0 0xe0000000 0xc 0x40000000 0 0x20000000
+			  0x01000000 0 0x00000000 0xf 0xf8020000 0 0x00010000>;
+		pcie@0 {
+			ranges = <0x02000000 0 0xe0000000
+				  0x02000000 0 0xe0000000
+				  0 0x20000000
+
+				  0x01000000 0 0x00000000
+				  0x01000000 0 0x00000000
+				  0 0x00010000>;
+		};
+	};
+};
+
+/include/ "p5040si-post.dtsi"
