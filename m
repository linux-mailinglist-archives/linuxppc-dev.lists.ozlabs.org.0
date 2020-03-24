Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E022F191C14
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 22:44:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48n4Xb1VWJzDqnF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 08:44:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=202.36.163.20;
 helo=gate2.alliedtelesis.co.nz; envelope-from=chrisp@alliedtelesis.co.nz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=alliedtelesis.co.nz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=PJ+d9JXL; 
 dkim-atps=neutral
X-Greylist: delayed 413 seconds by postgrey-1.36 at bilbo;
 Wed, 25 Mar 2020 08:43:09 AEDT
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48n4Vj3ybdzDqf2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 08:43:09 +1100 (AEDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id EFD3080237;
 Wed, 25 Mar 2020 10:36:14 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1585085774;
 bh=ygbzvsrszuyiwFOJ6DWF6cMbXhOt/OKPVtDodTTPLdQ=;
 h=From:To:Cc:Subject:Date;
 b=PJ+d9JXLbGDYteYWKsRRXzfnrDkOVeWl15ZYMaedcDI7PJYkc6+1k6cLNc74/9Ju2
 dcKfXcM+dZ/xt5xVdbYirqnFKQuJiJXPoGOnx9Qbqsjchr/w78nYURVEwVdeHfSbTx
 xjCmSml6u43crzbmm6Y1yfJtqculaLWl9RQb04Lt5yS+gw3k6Bd20/jKEOvnBtpL9S
 Zy2ls1UfOfnaN4Um8mNUoaxjwFT67GBfgJeqXyJkZsS6I3x2H+ya5zw0Z1V1X+/z7+
 qlR5rFD8QAk1t+9OZPnxd0lewOR0OfVMUKREtsu0sPvsCSPsZRt60SUHTuX9WL7cih
 EBxHAuysnACYQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5e7a7d4f0000>; Wed, 25 Mar 2020 10:36:15 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
 by smtp (Postfix) with ESMTP id 419BE13EEB7;
 Wed, 25 Mar 2020 10:36:14 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
 id BEBB428006C; Wed, 25 Mar 2020 10:36:14 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: mpe@ellerman.id.au, robh+dt@kernel.org, mark.rutland@arm.com,
 paulus@samba.org, benh@kernel.crashing.org
Subject: [PATCH] powerpc/fsl: Add cache properties for T2080/T2081
Date: Wed, 25 Mar 2020 10:36:12 +1300
Message-Id: <20200324213612.31614-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
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
Cc: devicetree@vger.kernel.org,
 Hamish Martin <hamish.martin@alliedtelesis.co.nz>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add the d-cache/i-cache properties for the T208x SoCs. The L1 cache on
these SoCs is 32KiB and is split into 64 byte blocks (lines).

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi b/arch/powerpc/bo=
ot/dts/fsl/t208xsi-pre.dtsi
index 3f745de44284..2ad27e16ac16 100644
--- a/arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi
@@ -81,6 +81,10 @@ cpus {
 		cpu0: PowerPC,e6500@0 {
 			device_type =3D "cpu";
 			reg =3D <0 1>;
+			d-cache-line-size =3D <64>;
+			i-cache-line-size =3D <64>;
+			d-cache-size =3D <32768>;
+			i-cache-size =3D <32768>;
 			clocks =3D <&clockgen 1 0>;
 			next-level-cache =3D <&L2_1>;
 			fsl,portid-mapping =3D <0x80000000>;
@@ -88,6 +92,10 @@ cpu0: PowerPC,e6500@0 {
 		cpu1: PowerPC,e6500@2 {
 			device_type =3D "cpu";
 			reg =3D <2 3>;
+			d-cache-line-size =3D <64>;
+			i-cache-line-size =3D <64>;
+			d-cache-size =3D <32768>;
+			i-cache-size =3D <32768>;
 			clocks =3D <&clockgen 1 0>;
 			next-level-cache =3D <&L2_1>;
 			fsl,portid-mapping =3D <0x80000000>;
@@ -95,6 +103,10 @@ cpu1: PowerPC,e6500@2 {
 		cpu2: PowerPC,e6500@4 {
 			device_type =3D "cpu";
 			reg =3D <4 5>;
+			d-cache-line-size =3D <64>;
+			i-cache-line-size =3D <64>;
+			d-cache-size =3D <32768>;
+			i-cache-size =3D <32768>;
 			clocks =3D <&clockgen 1 0>;
 			next-level-cache =3D <&L2_1>;
 			fsl,portid-mapping =3D <0x80000000>;
@@ -102,6 +114,10 @@ cpu2: PowerPC,e6500@4 {
 		cpu3: PowerPC,e6500@6 {
 			device_type =3D "cpu";
 			reg =3D <6 7>;
+			d-cache-line-size =3D <64>;
+			i-cache-line-size =3D <64>;
+			d-cache-size =3D <32768>;
+			i-cache-size =3D <32768>;
 			clocks =3D <&clockgen 1 0>;
 			next-level-cache =3D <&L2_1>;
 			fsl,portid-mapping =3D <0x80000000>;
--=20
2.25.1

