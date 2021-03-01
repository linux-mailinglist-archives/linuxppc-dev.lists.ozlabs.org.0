Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A3F3276A3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 05:21:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DpnC15tMnz3ckp
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 15:21:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com;
 envelope-from=chenjun102@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 997 seconds by postgrey-1.36 at boromir;
 Mon, 01 Mar 2021 13:34:01 AEDT
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dpkpx3G0Zz30N8
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Mar 2021 13:33:58 +1100 (AEDT)
Received: from dggeml405-hub.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4DpkNH0z2rz140Vj;
 Mon,  1 Mar 2021 10:14:23 +0800 (CST)
Received: from DGGEML509-MBX.china.huawei.com ([169.254.1.252]) by
 dggeml405-hub.china.huawei.com ([10.3.17.49]) with mapi id 14.03.0509.000;
 Mon, 1 Mar 2021 10:16:55 +0800
From: "chenjun (AM)" <chenjun102@huawei.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Rob Herring
 <robh+dt@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [Reoprt] Some compile warning on ppc dts
Thread-Topic: [Reoprt] Some compile warning on ppc dts
Thread-Index: AdcOQPNGmFy3U3BrTyOQctVQlk5NMQ==
Date: Mon, 1 Mar 2021 02:16:55 +0000
Message-ID: <CE1E7D7EFA066443B6454A6A5063B50220CCBBE4@dggeml509-mbx.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.178.53]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 01 Mar 2021 15:21:17 +1100
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
Cc: "Xiangrui \(Euler\)" <rui.xiang@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi=0A=
=0A=
After run the following commands=0A=
make distclean=0A=
make allmodconfig ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc64-linux-gnu-=0A=
make oldconfig ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc64-linux-gnu-=0A=
make -j64 ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc64-linux-gnu-=0A=
=0A=
I get some warning:=0A=
arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): =0A=
/pci@f0000d00: missing ranges for PCI bridg=0A=
e (or not a bridge)=0A=
arch/powerpc/boot/dts/o2dnt2.dtb: Warning (pci_device_bus_num): Failed =0A=
prerequisite 'pci_bridge'=0A=
arch/powerpc/boot/dts/mpc5200b.dtsi:182.18-186.5: Warning =0A=
(spi_bus_bridge): /soc5200@f0000000/psc@2000: node name f=0A=
or SPI buses should be 'spi'=0A=
   also defined at arch/powerpc/boot/dts/o2d.dtsi:32.12-43.5=0A=
arch/powerpc/boot/dts/o2dnt2.dtb: Warning (spi_bus_reg): Failed =0A=
prerequisite 'spi_bus_bridge'=0A=
...=0A=
=0A=
For the problem about "node name for SPI buses should be 'spi'":=0A=
Rename the psc@2000 to spi@2000 in arch/powerpc/boot/dts/o2d.dtsi can =0A=
fix it.=0A=
diff --git a/arch/powerpc/boot/dts/o2d.dtsi b/arch/powerpc/boot/dts/o2d.dts=
i=0A=
index 6661955a2be4..cd3dc70cd72e 100644=0A=
--- a/arch/powerpc/boot/dts/o2d.dtsi=0A=
+++ b/arch/powerpc/boot/dts/o2d.dtsi=0A=
@@ -29,7 +29,7 @@ rtc@800 {=0A=
  >------>------->-------status =3D "disabled";=0A=
  >------>-------};=0A=
-=0A=
->------>-------psc@2000 {>----->-------// PSC1=0A=
+>------>-------spi@2000 {>----->-------// PSC1=0A=
  >------>------->-------compatible =3D =0A=
"fsl,mpc5200b-psc-spi","fsl,mpc5200-psc-spi";=0A=
  >------>------->-------#address-cells =3D <1>;=0A=
  >------>------->-------#size-cells =3D <0>;=0A=
---=0A=
=0A=
For the problem about "missing ranges for PCI bridge (or not a bridge)":=0A=
Ranges should be add in arch/powerpc/boot/dts/mpc5200b.dtsi.=0A=
 >-------pci: pci@f0000d00 {=0A=
 >------->-------#interrupt-cells =3D <1>;=0A=
 >------->-------#size-cells =3D <2>;=0A=
 >------->-------#address-cells =3D <3>;=0A=
 >------->-------device_type =3D "pci";=0A=
 >------->-------compatible =3D "fsl,mpc5200b-pci","fsl,mpc5200-pci";=0A=
 >------->-------reg =3D <0xf0000d00 0x100>;=0A=
 >------->-------// interrupt-map-mask =3D need to add=0A=
 >------->-------// interrupt-map =3D need to add=0A=
 >------->-------clock-frequency =3D <0>; // From boot loader=0A=
 >------->-------interrupts =3D <2 8 0 2 9 0 2 10 0>;=0A=
 >------->-------bus-range =3D <0 0>;=0A=
 >------->-------// ranges =3D need to add=0A=
 >-------};=0A=
I think the ranges should be add by someone who knows the mpc5200 better.=
=0A=
=0A=
Can anyone fix this?=0A=
=0A=
-- =0A=
Regards=0A=
Chen Jun=0A=
