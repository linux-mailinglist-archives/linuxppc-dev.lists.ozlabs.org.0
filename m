Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 219BD1C9D86
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 23:38:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49J6KV1mGwzDqvd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 07:38:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=stevens-zone.net (client-ip=212.227.126.135;
 helo=mout.kundenserver.de; envelope-from=darren@stevens-zone.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=stevens-zone.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49J6Bs18vVzDqj4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 07:33:07 +1000 (AEST)
Received: from Cyrus.lan ([80.189.87.220]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.163]) with ESMTPA (Nemesis) id
 1MTAJr-1jhPoE2dBv-00UYN8; Thu, 07 May 2020 23:32:57 +0200
Date: Thu, 7 May 2020 22:12:30 +0100
From: Darren Stevens <darren@stevens-zone.net>
To: linuxppc-dev@lists.ozlabs.org, oss@buserror.net
Subject: [PATCH 1/5] powerpc/mpc85xx: Define ethernet port aliases in board
 dts file
Message-ID: <20200507221230.7950125c@Cyrus.lan>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; powerpc-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:4QH9YlspBVO89hg+QRiyYoQRIdhdf9JSyjF2xKgqrdjzXDVLWlo
 e22GRec3iSrQyaCiS6k4aC48nF3AKEn6PxBv+0n9gVcUpRpRDenbNwV5DBnbU61zuvX3Ir/
 fX2gDdNtSPmAPE0vgGs2eRujTtg9jYQgEOQw2iTuilcVlIAlPjkRaV06oYWt9itbWuncRuF
 bCE7RkM1AWwjDF0HGwRGg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:frMB1f22umM=:INPabHWjk0mL2dLfcXl4Km
 tbg0NUsEfegDtCuyfp+lujLfEsd5WyvfHndICvWPT0k2whP9lEUwG9169USV40ndwtDxHrjKe
 o6ETU32ZieUfO6g3JIggFLt23C27qieVDwcDK/zit5LFDeGEuVdRZ899+usJsMim+VkbrAjd4
 x70oE9Nhif7LhzGFfde5KmNA49YDhI+wMFfWuMjWVdut47/XQyd80gqVfc6qxlv7NmSM6VBMb
 JG9ygJKNSRrMoqQr98gZPtF2T5alr4nqH5oDS5xTujRCkvV23l8ND5hOaMtjRehurPa5GaCHs
 H2AEB+gk5ac4OH97TXwg8CrlkS/WEM87ExzdugdLeYEB8XUcueBd8js9SGdFjd3ut7mQmfVrD
 QqgG8448k+h4IDWcApVpE3U5lWxGWhjg4KHtGvTjMImCxxuO2WI45un4NzP1NF+48EoOuUarX
 HF7Xn/pme3cASIWwcFy0wjQzOPPSmb6Mm9Ei5gyb5i5C9Q3W9TvLr5WRyqqGb7ROdQnJdc1Vn
 fcdxcA5TeDJZn/MKbzUDFn1Cb0efQPv7TNqWbRP+1NtjlKHDmtVks1SwFwGjysqhAZYqnGFjV
 tfiHI/oHHnyy8tSLnfW5PMijCk+bhy4zMND64mEjO/RpwmaEN5s07d3w8cvTxXHRfUhQSNoys
 O5khGXhLF8rTY5iV6DVO7naAREodLuEeT/ojhUTzr5Ns668ir2MjLUD3IwBloLZaUcOPP4o6R
 Y5hII/wMfqSTXne4CnSppF/t9Y4t/l65eHQ26uAvqFg11JdIqScTDS2jNtZyA0ZjdyF4edNNX
 mWuvBoxpFXKhXC8TaCZfhjQIOHX0BfVKIXm599637eHC2zbRFP3JGapsCx1sE2UAFX94Ny7
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

in patch da414bb923d9 (Add FSL Qoriq DPAA FMan support to the SoC
device tree(s)) we added aliases for all ethernet ports, and linked
them to specific hardware devices, but we put them in the pre.dtsi
include file meaning any board wishing to use this file is stuck with
this port layout, even if it don't match the boards hardware. The Cyrus
5020 and 5040 boards are examples, they are based on the p5020 ref
design, but only have 2 ethernet ports.
Fix the problem by moving the ethernet aliases to the boards dts file
where we define the phy aliases.

Signed-off-by: Darren Stevens <darren@stevens-zone.net>

---

Only patched the p5020ds and p5040ds as they are the boards I work
with. Others may need looking at.

 arch/powerpc/boot/dts/fsl/p5020ds.dts      |  7 +++++++
 arch/powerpc/boot/dts/fsl/p5020si-pre.dtsi |  6 ------
 arch/powerpc/boot/dts/fsl/p5040ds.dts      | 13 +++++++++++++
 arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi | 12 ------------
 4 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/p5020ds.dts
b/arch/powerpc/boot/dts/fsl/p5020ds.dts index b24adf9..cdf0559 100644
--- a/arch/powerpc/boot/dts/fsl/p5020ds.dts
+++ b/arch/powerpc/boot/dts/fsl/p5020ds.dts
@@ -53,6 +53,13 @@
 		emi1_rgmii = &hydra_mdio_rgmii;
 		emi1_sgmii = &hydra_mdio_sgmii;
 		emi2_xgmii = &hydra_mdio_xgmii;
+
+		ethernet0 = &enet0;
+		ethernet1 = &enet1;
+		ethernet2 = &enet2;
+		ethernet3 = &enet3;
+		ethernet4 = &enet4;
+		ethernet5 = &enet5;
 	};
 
 	memory {
diff --git a/arch/powerpc/boot/dts/fsl/p5020si-pre.dtsi
b/arch/powerpc/boot/dts/fsl/p5020si-pre.dtsi index 2d74ea8..8bc7a75
100644 --- a/arch/powerpc/boot/dts/fsl/p5020si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p5020si-pre.dtsi
@@ -81,12 +81,6 @@
 		raideng_jr3 = &raideng_jr3;
 
 		fman0 = &fman0;
-		ethernet0 = &enet0;
-		ethernet1 = &enet1;
-		ethernet2 = &enet2;
-		ethernet3 = &enet3;
-		ethernet4 = &enet4;
-		ethernet5 = &enet5;
 	};
 
 	cpus {
diff --git a/arch/powerpc/boot/dts/fsl/p5040ds.dts
b/arch/powerpc/boot/dts/fsl/p5040ds.dts index 30850b3..bffbba5 100644
--- a/arch/powerpc/boot/dts/fsl/p5040ds.dts
+++ b/arch/powerpc/boot/dts/fsl/p5040ds.dts
@@ -65,6 +65,19 @@
 		hydra_sg_slot6 = &hydra_sg_slot6;
 		hydra_xg_slot1 = &hydra_xg_slot1;
 		hydra_xg_slot2 = &hydra_xg_slot2;
+
+		ethernet0 = &enet0;
+		ethernet1 = &enet1;
+		ethernet2 = &enet2;
+		ethernet3 = &enet3;
+		ethernet4 = &enet4;
+		ethernet5 = &enet5;
+		ethernet6 = &enet6;
+		ethernet7 = &enet7;
+		ethernet8 = &enet8;
+		ethernet9 = &enet9;
+		ethernet10 = &enet10;
+		ethernet11 = &enet11;
 	};
 
 	memory {
diff --git a/arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi
b/arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi index ed89dbb..bc4e0bc
100644 --- a/arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi
@@ -81,18 +81,6 @@
 
 		fman0 = &fman0;
 		fman1 = &fman1;
-		ethernet0 = &enet0;
-		ethernet1 = &enet1;
-		ethernet2 = &enet2;
-		ethernet3 = &enet3;
-		ethernet4 = &enet4;
-		ethernet5 = &enet5;
-		ethernet6 = &enet6;
-		ethernet7 = &enet7;
-		ethernet8 = &enet8;
-		ethernet9 = &enet9;
-		ethernet10 = &enet10;
-		ethernet11 = &enet11;
 	};
 
 	cpus {
