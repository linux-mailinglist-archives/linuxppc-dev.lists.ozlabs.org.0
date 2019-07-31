Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8B57B932
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 07:42:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45z2Q23rQnzDqWd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 15:42:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45z2LL1VJ3zDqRn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 15:39:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.b="b5pQngrz"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45z2LK2Lj7z9s00
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 15:39:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1564551577;
 bh=sgXYi5fI7TF5NEALgYQ30J/hnSjdd6G8sfmK+XN6XF8=;
 h=Date:From:To:Subject:From;
 b=b5pQngrz/vIziosb1bpaN6WyaTCXQyu8k/JyyaxV+b0SK7eDweGrJ43n3cO5BYOHm
 2YgsMg4AyopNXxRmg9Qzo61s4v9OQOXTPaYoU5oBedG5r1H+qrbm9IjeSE9p70vfTY
 Eb5IQGaSJAAhIw0KkVJu7SzwMRG9GuP2m5M6Gyy7t6p1xYluKPXrbO/mspS11SsCdN
 mLCiwUg45y6w17YdKI4e6zetjHmP5r8tRuoL3OEckFVBvgEyqjKCOTiXnx+XwZ4bm7
 +xH18IyEzei3KjCtNom+MSqBQEq1f7xoBR83HEC4XQ5TbKaTx+ICMI+JLai/wvCd2X
 UHTRAR7JOSnug==
Date: Wed, 31 Jul 2019 15:39:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: ppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: DTS build warnings
Message-ID: <20190731153936.02083439@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dhrT+=CACCtA37ds2G2yVbz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/dhrT+=CACCtA37ds2G2yVbz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

I have been getting the following warnings from a couple of powerpc
builds for quite a while now.  I was hoping someone might have time to
look at them and maybe even fix them up :-)

arch/powerpc/boot/dts/virtex440-ml510.dts:335.37-439.6: Warning (pci_bridge=
): /plb@0/plbv46-pci@85e00000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/virtex440-ml510.dtb: Warning (pci_device_bus_num): Fa=
iled prerequisite 'pci_bridge'
arch/powerpc/boot/dts/katmai.dts:322.26-361.5: Warning (pci_bridge): /plb/p=
ciex@d00000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/katmai.dts:363.26-402.5: Warning (pci_bridge): /plb/p=
ciex@d20000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/katmai.dts:404.26-443.5: Warning (pci_bridge): /plb/p=
ciex@d40000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/katmai.dtb: Warning (pci_device_bus_num): Failed prer=
equisite 'pci_bridge'
arch/powerpc/boot/dts/icon.dts:318.26-357.5: Warning (pci_bridge): /plb/pci=
ex@d00000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/icon.dts:359.26-398.5: Warning (pci_bridge): /plb/pci=
ex@d20000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/icon.dtb: Warning (pci_device_bus_num): Failed prereq=
uisite 'pci_bridge'
arch/powerpc/boot/dts/virtex440-ml510.dts:335.37-439.6: Warning (pci_bridge=
): /plb@0/plbv46-pci@85e00000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/virtex440-ml510.dtb: Warning (pci_device_bus_num): Fa=
iled prerequisite 'pci_bridge'
arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /pc=
i@f0000d00: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/o2mnt.dtb: Warning (pci_device_bus_num): Failed prere=
quisite 'pci_bridge'
arch/powerpc/boot/dts/mpc5200b.dtsi:182.18-186.5: Warning (spi_bus_bridge):=
 /soc5200@f0000000/psc@2000: node name for SPI buses should be 'spi'
  also defined at arch/powerpc/boot/dts/o2d.dtsi:32.12-43.5
arch/powerpc/boot/dts/o2mnt.dtb: Warning (spi_bus_reg): Failed prerequisite=
 'spi_bus_bridge'
arch/powerpc/boot/dts/makalu.dts:271.25-310.5: Warning (pci_bridge): /plb/p=
ciex@a0000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/makalu.dts:312.25-351.5: Warning (pci_bridge): /plb/p=
ciex@c0000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/makalu.dtb: Warning (pci_device_bus_num): Failed prer=
equisite 'pci_bridge'
arch/powerpc/boot/dts/mgcoge.dts:230.14-234.7: Warning (spi_bus_reg): /soc@=
f0000000/cpm@119c0/spi@11aa0/ds3106@1: SPI bus unit address format error, e=
xpected "0"
arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /pc=
i@f0000d00: missing ranges for PCI bridge (or not a bridge)
  also defined at arch/powerpc/boot/dts/motionpro.dts:84.15-86.4
arch/powerpc/boot/dts/motionpro.dtb: Warning (pci_device_bus_num): Failed p=
rerequisite 'pci_bridge'
arch/powerpc/boot/dts/fsl/p2020rdb.dts:251.22-254.4: Warning (pci_bridge): =
/pcie@ffe08000: missing ranges for PCI bridge (or not a bridge)
  also defined at arch/powerpc/boot/dts/fsl/p2020si-post.dtsi:43.7-68.3
arch/powerpc/boot/dts/fsl/p2020si-post.dtsi:52.9-67.4: Warning (pci_bridge)=
: /pcie@ffe08000/pcie@0: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/fsl/p2020rdb.dtb: Warning (pci_device_bus_num): Faile=
d prerequisite 'pci_bridge'
arch/powerpc/boot/dts/fsl/mvme7100.dts:135.22-137.4: Warning (pci_bridge): =
/pcie@f1008000: missing ranges for PCI bridge (or not a bridge)
  also defined at arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:92.7-117.3
arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:102.9-116.4: Warning (pci_bri=
dge): /pcie@f1008000/pcie@0: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/fsl/mvme7100.dts:139.22-141.4: Warning (pci_bridge): =
/pcie@f1009000: missing ranges for PCI bridge (or not a bridge)
  also defined at arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:119.7-144.3
arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:129.9-143.4: Warning (pci_bri=
dge): /pcie@f1009000/pcie@0: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/fsl/mvme7100.dtb: Warning (pci_device_bus_num): Faile=
d prerequisite 'pci_bridge'
arch/powerpc/boot/dts/fsl/mvme7100.dts:30.11-32.6: Warning (i2c_bus_reg): /=
soc@f1000000/i2c@3000/rtc@68: missing or empty reg property
arch/powerpc/boot/dts/glacier.dts:492.26-532.5: Warning (pci_bridge): /plb/=
pciex@d00000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/glacier.dts:534.26-574.5: Warning (pci_bridge): /plb/=
pciex@d20000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/glacier.dtb: Warning (pci_device_bus_num): Failed pre=
requisite 'pci_bridge'
arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi:38.2-25: Warning (interrupts_proper=
ty): /soc@fffe00000/mdio@24000/ethernet-phy@0:#interrupt-cells: size is (8)=
, expected multiple of 16
arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi:38.2-25: Warning (interrupts_proper=
ty): /soc@fffe00000/mdio@24000/ethernet-phy@1:#interrupt-cells: size is (8)=
, expected multiple of 16
arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi:38.2-25: Warning (interrupts_proper=
ty): /soc@fffe00000/mdio@24000/ethernet-phy@0:#interrupt-cells: size is (8)=
, expected multiple of 16
arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi:38.2-25: Warning (interrupts_proper=
ty): /soc@fffe00000/mdio@24000/ethernet-phy@1:#interrupt-cells: size is (8)=
, expected multiple of 16
arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi:38.2-25: Warning (interrupts_proper=
ty): /soc@ffe00000/mdio@24000/ethernet-phy@0:#interrupt-cells: size is (8),=
 expected multiple of 16
arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi:38.2-25: Warning (interrupts_proper=
ty): /soc@ffe00000/mdio@24000/ethernet-phy@1:#interrupt-cells: size is (8),=
 expected multiple of 16
arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /pc=
i@f0000d00: missing ranges for PCI bridge (or not a bridge)
  also defined at arch/powerpc/boot/dts/uc101.dts:100.15-102.4
arch/powerpc/boot/dts/uc101.dtb: Warning (pci_device_bus_num): Failed prere=
quisite 'pci_bridge'
arch/powerpc/boot/dts/fsl/p1020rdb-pd.dts:189.11-193.6: Warning (spi_bus_re=
g): /soc@ffe00000/spi@7000/slic@0: SPI bus unit address format error, expec=
ted "1"
arch/powerpc/boot/dts/fsl/p1020rdb-pd.dts:195.11-199.6: Warning (spi_bus_re=
g): /soc@ffe00000/spi@7000/slic@1: SPI bus unit address format error, expec=
ted "2"
arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /pc=
i@f0000d00: missing ranges for PCI bridge (or not a bridge)
  also defined at arch/powerpc/boot/dts/a3m071.dts:135.15-137.4
arch/powerpc/boot/dts/a3m071.dtb: Warning (pci_device_bus_num): Failed prer=
equisite 'pci_bridge'
arch/powerpc/boot/dts/fsl/mpc8555cds.dts:330.3-21: Warning (pci_device_bus_=
num): /pci@e0008000/i8259@19000:bus-range: PCI bus number 1 out of range, e=
xpected (0 - 0)
arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /pc=
i@f0000d00: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/o2d.dtb: Warning (pci_device_bus_num): Failed prerequ=
isite 'pci_bridge'
arch/powerpc/boot/dts/mpc5200b.dtsi:182.18-186.5: Warning (spi_bus_bridge):=
 /soc5200@f0000000/psc@2000: node name for SPI buses should be 'spi'
  also defined at arch/powerpc/boot/dts/o2d.dtsi:32.12-43.5
arch/powerpc/boot/dts/o2d.dtb: Warning (spi_bus_reg): Failed prerequisite '=
spi_bus_bridge'
arch/powerpc/boot/dts/mpc5121.dtsi:397.13-406.5: Warning (spi_bus_bridge): =
/soc@80000000/psc@11400: node name for SPI buses should be 'spi'
  also defined at arch/powerpc/boot/dts/ac14xx.dts:305.19-326.5
arch/powerpc/boot/dts/mpc5121.dtsi:409.13-418.5: Warning (spi_bus_bridge): =
/soc@80000000/psc@11500: node name for SPI buses should be 'spi'
  also defined at arch/powerpc/boot/dts/ac14xx.dts:329.19-344.5
arch/powerpc/boot/dts/ac14xx.dtb: Warning (spi_bus_reg): Failed prerequisit=
e 'spi_bus_bridge'
arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /pc=
i@f0000d00: missing ranges for PCI bridge (or not a bridge)
  also defined at arch/powerpc/boot/dts/cm5200.dts:70.15-72.4
arch/powerpc/boot/dts/cm5200.dtb: Warning (pci_device_bus_num): Failed prer=
equisite 'pci_bridge'
arch/powerpc/boot/dts/mpc5121.dtsi:457.13-466.5: Warning (spi_bus_bridge): =
/soc@80000000/psc@11900: node name for SPI buses should be 'spi'
  also defined at arch/powerpc/boot/dts/pdm360ng.dts:172.13-185.5
arch/powerpc/boot/dts/pdm360ng.dtb: Warning (spi_bus_reg): Failed prerequis=
ite 'spi_bus_bridge'
arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi:38.2-25: Warning (interrupts_proper=
ty): /soc@ffe00000/mdio@24000/ethernet-phy@0:#interrupt-cells: size is (8),=
 expected multiple of 16
arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi:38.2-25: Warning (interrupts_proper=
ty): /soc@ffe00000/mdio@24000/ethernet-phy@1:#interrupt-cells: size is (8),=
 expected multiple of 16
arch/powerpc/boot/dts/haleakala.dts:240.25-279.5: Warning (pci_bridge): /pl=
b/pciex@a0000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/haleakala.dtb: Warning (pci_device_bus_num): Failed p=
rerequisite 'pci_bridge'
arch/powerpc/boot/dts/bluestone.dts:328.26-368.5: Warning (pci_bridge): /pl=
b/pciex@d00000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/bluestone.dtb: Warning (pci_device_bus_num): Failed p=
rerequisite 'pci_bridge'
arch/powerpc/boot/dts/bluestone.dts:272.13-277.7: Warning (i2c_bus_reg): /p=
lb/opb/i2c@ef600700/sttm@4C: I2C bus unit address format error, expected "4=
c"
arch/powerpc/boot/dts/fsl/gef_sbc610.dts:209.22-211.4: Warning (pci_bridge)=
: /pcie@fef09000: missing ranges for PCI bridge (or not a bridge)
  also defined at arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:119.7-144.3
arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:129.9-143.4: Warning (pci_bri=
dge): /pcie@fef09000/pcie@0: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: Warning (pci_device_bus_num): Fai=
led prerequisite 'pci_bridge'
arch/powerpc/boot/dts/katmai.dts:322.26-361.5: Warning (pci_bridge): /plb/p=
ciex@d00000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/katmai.dts:363.26-402.5: Warning (pci_bridge): /plb/p=
ciex@d20000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/katmai.dts:404.26-443.5: Warning (pci_bridge): /plb/p=
ciex@d40000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/katmai.dtb: Warning (pci_device_bus_num): Failed prer=
equisite 'pci_bridge'
arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /pc=
i@f0000d00: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/o2i.dtb: Warning (pci_device_bus_num): Failed prerequ=
isite 'pci_bridge'
arch/powerpc/boot/dts/mpc5200b.dtsi:182.18-186.5: Warning (spi_bus_bridge):=
 /soc5200@f0000000/psc@2000: node name for SPI buses should be 'spi'
  also defined at arch/powerpc/boot/dts/o2d.dtsi:32.12-43.5
arch/powerpc/boot/dts/o2i.dtb: Warning (spi_bus_reg): Failed prerequisite '=
spi_bus_bridge'
arch/powerpc/boot/dts/currituck.dts:125.28-161.5: Warning (pci_bridge): /pl=
b/pciex@10100000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/currituck.dts:163.28-198.5: Warning (pci_bridge): /pl=
b/pciex@30100000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/currituck.dts:200.28-235.5: Warning (pci_bridge): /pl=
b/pciex@38100000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/currituck.dtb: Warning (pci_device_bus_num): Failed p=
rerequisite 'pci_bridge'
arch/powerpc/boot/dts/xpedite5200.dts:135.11-138.6: Warning (i2c_bus_reg): =
/soc@ef000000/i2c@3000/dtt@48: I2C bus unit address format error, expected =
"34"
arch/powerpc/boot/dts/akebono.dts:251.28-289.5: Warning (pci_bridge): /plb/=
pciex@10100000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/akebono.dts:291.28-329.5: Warning (pci_bridge): /plb/=
pciex@20100000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/akebono.dts:331.28-369.5: Warning (pci_bridge): /plb/=
pciex@18100000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/akebono.dts:371.28-409.5: Warning (pci_bridge): /plb/=
pciex@28100000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/akebono.dtb: Warning (pci_device_bus_num): Failed pre=
requisite 'pci_bridge'
arch/powerpc/boot/dts/mpc8610_hpcd.dts:420.3-21: Warning (pci_device_bus_nu=
m): /pcie@e000a000/pcie@0:bus-range: PCI bus number 0 out of range, expecte=
d (1 - 1)
arch/powerpc/boot/dts/canyonlands.dts:464.26-504.5: Warning (pci_bridge): /=
plb/pciex@d00000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/canyonlands.dts:506.26-546.5: Warning (pci_bridge): /=
plb/pciex@d20000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/canyonlands.dtb: Warning (pci_device_bus_num): Failed=
 prerequisite 'pci_bridge'
arch/powerpc/boot/dts/stxssa8555.dts:329.3-21: Warning (pci_device_bus_num)=
: /pci@e0008000/i8259@19000:bus-range: PCI bus number 1 out of range, expec=
ted (0 - 0)
arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /pc=
i@f0000d00: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/o2dnt2.dtb: Warning (pci_device_bus_num): Failed prer=
equisite 'pci_bridge'
arch/powerpc/boot/dts/mpc5200b.dtsi:182.18-186.5: Warning (spi_bus_bridge):=
 /soc5200@f0000000/psc@2000: node name for SPI buses should be 'spi'
  also defined at arch/powerpc/boot/dts/o2d.dtsi:32.12-43.5
arch/powerpc/boot/dts/o2dnt2.dtb: Warning (spi_bus_reg): Failed prerequisit=
e 'spi_bus_bridge'
arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:211.22-213.4: Warning (pci_bridge):=
 /pcie@fef09000: missing ranges for PCI bridge (or not a bridge)
  also defined at arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:119.7-144.3
arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:129.9-143.4: Warning (pci_bri=
dge): /pcie@fef09000/pcie@0: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: Warning (pci_device_bus_num): Fail=
ed prerequisite 'pci_bridge'
arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /pc=
i@f0000d00: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/o3dnt.dtb: Warning (pci_device_bus_num): Failed prere=
quisite 'pci_bridge'
arch/powerpc/boot/dts/mpc5200b.dtsi:182.18-186.5: Warning (spi_bus_bridge):=
 /soc5200@f0000000/psc@2000: node name for SPI buses should be 'spi'
  also defined at arch/powerpc/boot/dts/o2d.dtsi:32.12-43.5
arch/powerpc/boot/dts/o3dnt.dtb: Warning (spi_bus_reg): Failed prerequisite=
 'spi_bus_bridge'
arch/powerpc/boot/dts/redwood.dts:238.26-277.5: Warning (pci_bridge): /plb/=
pciex@d00000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/redwood.dts:279.26-318.5: Warning (pci_bridge): /plb/=
pciex@d20000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/redwood.dts:320.26-359.5: Warning (pci_bridge): /plb/=
pciex@d40000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/redwood.dtb: Warning (pci_device_bus_num): Failed pre=
requisite 'pci_bridge'
arch/powerpc/boot/dts/xpedite5200_xmon.dts:139.11-142.6: Warning (i2c_bus_r=
eg): /soc@ef000000/i2c@3000/dtt@48: I2C bus unit address format error, expe=
cted "34"
arch/powerpc/boot/dts/fsl/oca4080.dts:132.23-134.4: Warning (pci_bridge): /=
pcie@ffe200000: missing ranges for PCI bridge (or not a bridge)
  also defined at arch/powerpc/boot/dts/fsl/p4080si-post.dtsi:58.7-84.3
arch/powerpc/boot/dts/fsl/p4080si-post.dtsi:68.9-83.4: Warning (pci_bridge)=
: /pcie@ffe200000/pcie@0: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/fsl/oca4080.dts:136.23-138.4: Warning (pci_bridge): /=
pcie@ffe201000: missing ranges for PCI bridge (or not a bridge)
  also defined at arch/powerpc/boot/dts/fsl/p4080si-post.dtsi:87.7-113.3
arch/powerpc/boot/dts/fsl/p4080si-post.dtsi:97.9-112.4: Warning (pci_bridge=
): /pcie@ffe201000/pcie@0: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/fsl/oca4080.dts:140.23-142.4: Warning (pci_bridge): /=
pcie@ffe202000: missing ranges for PCI bridge (or not a bridge)
  also defined at arch/powerpc/boot/dts/fsl/p4080si-post.dtsi:116.7-142.3
arch/powerpc/boot/dts/fsl/p4080si-post.dtsi:126.9-141.4: Warning (pci_bridg=
e): /pcie@ffe202000/pcie@0: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/fsl/oca4080.dtb: Warning (pci_device_bus_num): Failed=
 prerequisite 'pci_bridge'
arch/powerpc/boot/dts/fsl/ppa8548.dts:34.22-37.4: Warning (pci_bridge): /pc=
i@fe0008000: missing ranges for PCI bridge (or not a bridge)
  also defined at arch/powerpc/boot/dts/fsl/mpc8548si-post.dtsi:43.7-51.3
arch/powerpc/boot/dts/fsl/ppa8548.dts:39.22-42.4: Warning (pci_bridge): /pc=
i@fe0009000: missing ranges for PCI bridge (or not a bridge)
  also defined at arch/powerpc/boot/dts/fsl/mpc8548si-post.dtsi:54.7-62.3
arch/powerpc/boot/dts/fsl/ppa8548.dts:44.23-47.4: Warning (pci_bridge): /pc=
ie@fe000a000: missing ranges for PCI bridge (or not a bridge)
  also defined at arch/powerpc/boot/dts/fsl/mpc8548si-post.dtsi:65.7-90.3
arch/powerpc/boot/dts/fsl/mpc8548si-post.dtsi:74.9-89.4: Warning (pci_bridg=
e): /pcie@fe000a000/pcie@0: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/fsl/ppa8548.dtb: Warning (pci_device_bus_num): Failed=
 prerequisite 'pci_bridge'
arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dts:59.23-62.4: Warning (pci_brid=
ge): /pcie@fffe08000: missing ranges for PCI bridge (or not a bridge)
  also defined at arch/powerpc/boot/dts/fsl/p2020si-post.dtsi:100.7-126.3
arch/powerpc/boot/dts/fsl/p2020si-post.dtsi:109.9-125.4: Warning (pci_bridg=
e): /pcie@fffe08000/pcie@0: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: Warning (pci_device_bus_num)=
: Failed prerequisite 'pci_bridge'
arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /pc=
i@f0000d00: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/o2d300.dtb: Warning (pci_device_bus_num): Failed prer=
equisite 'pci_bridge'
arch/powerpc/boot/dts/mpc5200b.dtsi:182.18-186.5: Warning (spi_bus_bridge):=
 /soc5200@f0000000/psc@2000: node name for SPI buses should be 'spi'
  also defined at arch/powerpc/boot/dts/o2d.dtsi:32.12-43.5
arch/powerpc/boot/dts/o2d300.dtb: Warning (spi_bus_reg): Failed prerequisit=
e 'spi_bus_bridge'
arch/powerpc/boot/dts/kilauea.dts:325.25-364.5: Warning (pci_bridge): /plb/=
pciex@a0000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/kilauea.dts:366.25-405.5: Warning (pci_bridge): /plb/=
pciex@c0000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/kilauea.dtb: Warning (pci_device_bus_num): Failed pre=
requisite 'pci_bridge'
arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dts:59.22-62.4: Warning (pci_brid=
ge): /pcie@ffe08000: missing ranges for PCI bridge (or not a bridge)
  also defined at arch/powerpc/boot/dts/fsl/p2020si-post.dtsi:100.7-126.3
arch/powerpc/boot/dts/fsl/p2020si-post.dtsi:109.9-125.4: Warning (pci_bridg=
e): /pcie@ffe08000/pcie@0: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: Warning (pci_device_bus_num)=
: Failed prerequisite 'pci_bridge'
arch/powerpc/boot/dts/fsl/mpc8541cds.dts:330.3-21: Warning (pci_device_bus_=
num): /pci@e0008000/i8259@19000:bus-range: PCI bus number 1 out of range, e=
xpected (0 - 0)
arch/powerpc/boot/dts/fsl/kmcent2.dts:259.23-261.4: Warning (pci_bridge): /=
pcie@ffe250000: missing ranges for PCI bridge (or not a bridge)
  also defined at arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:85.7-109.3
arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:93.9-108.4: Warning (pci_bridge=
): /pcie@ffe250000/pcie@0: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/fsl/kmcent2.dts:263.23-265.4: Warning (pci_bridge): /=
pcie@ffe260000: missing ranges for PCI bridge (or not a bridge)
  also defined at arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:111.7-135.3
arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:119.9-134.4: Warning (pci_bridg=
e): /pcie@ffe260000/pcie@0: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/fsl/kmcent2.dts:267.23-269.4: Warning (pci_bridge): /=
pcie@ffe270000: missing ranges for PCI bridge (or not a bridge)
  also defined at arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:137.7-161.3
arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:145.9-160.4: Warning (pci_bridg=
e): /pcie@ffe270000/pcie@0: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/fsl/kmcent2.dtb: Warning (pci_device_bus_num): Failed=
 prerequisite 'pci_bridge'
arch/powerpc/boot/dts/fsl/kmcoge4.dts:196.23-198.4: Warning (pci_bridge): /=
pcie@ffe201000: missing ranges for PCI bridge (or not a bridge)
  also defined at arch/powerpc/boot/dts/fsl/p2041si-post.dtsi:87.7-113.3
arch/powerpc/boot/dts/fsl/p2041si-post.dtsi:97.9-112.4: Warning (pci_bridge=
): /pcie@ffe201000/pcie@0: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/fsl/kmcoge4.dtb: Warning (pci_device_bus_num): Failed=
 prerequisite 'pci_bridge'

--=20
Cheers,
Stephen Rothwell

--Sig_/dhrT+=CACCtA37ds2G2yVbz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1BKZgACgkQAVBC80lX
0Gx3aAf8D0q0D4nuEo2wZNbgM9LM4aYBweRLISsjZ2P7eniBBLJADIl/K5vg4mIF
BVk76+2W4OO1aMAtkS7rYefQ283izmKkZ+4qFVULQRSqoE/0p0jo/v0zSnhlHK8y
4fjgh2cbKyI+gvdrL8uZc879yJNwTE0D5JMjokmlvGAfxrgjaBvNn8uamc0YOBMr
n41h+ShSWw93S4u+1etJfq+UQQuGMUh7jzAmIs85BqzcFiaqVGChJOxrNRNAQdJl
cCJxRo1POSt7+Sy2HxKjVcDcDwjRxFUsP6fW/Mgm2df6JYUFdhftcClnmIJ4nDF+
GWEpg+/YwoO+63X7eyENXarFUhPNaQ==
=WTlH
-----END PGP SIGNATURE-----

--Sig_/dhrT+=CACCtA37ds2G2yVbz--
