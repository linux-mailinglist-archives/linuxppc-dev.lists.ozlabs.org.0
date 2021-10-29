Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1A64404E5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 23:25:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgwST529vz3c61
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 08:25:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=YzQegZ9q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ixit.cz
 (client-ip=94.230.151.217; helo=ixit.cz; envelope-from=david@ixit.cz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim
 header.b=YzQegZ9q; dkim-atps=neutral
X-Greylist: delayed 8398 seconds by postgrey-1.36 at boromir;
 Sat, 30 Oct 2021 03:31:05 AEDT
Received: from ixit.cz (ixit.cz [94.230.151.217])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hgnx51hm2z2xg6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Oct 2021 03:31:03 +1100 (AEDT)
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz
 [89.176.96.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id BBC6A23D91;
 Fri, 29 Oct 2021 14:17:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1635509868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=s8yyxqFVKattkdAGWNseuY/v4m4uzmy/l55j6/y5LeA=;
 b=YzQegZ9qN5lglFzeFSWB42tjsfLKW3WN/Ho+1q+viXsQuPhI42/ZLa8Q1Av4lgcRot/TMI
 0qEeQwSr6rddHyGwYkNDuEbfoud/BV6lrUyQbSKftkBz1XBoN+bQGqJRy6Zpa+D9mjFPWn
 yKREl06TTFlIm5Poz8eo/Rwf/l1Cm2E=
From: David Heidelberg <david@ixit.cz>
To: Rob Herring <robh+dt@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: [PATCH] powerpc/fsl: fix the schema check errors for fsl,
 tmu-calibration
Date: Fri, 29 Oct 2021 14:17:33 +0200
Message-Id: <20211029121733.46849-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 30 Oct 2021 08:24:41 +1100
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 ~okias/devicetree@lists.sr.ht, David Heidelberg <david@ixit.cz>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

fsl,tmu-calibration is in u32-matrix format. Use matching property syntax.
No functional changes. Fixes warnings as:
$ make dtbs_check
...
arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dt.yaml: tmu@30260000: fsl,tmu-calibration:0: Additional items are not allowed (1, 41, 2, 47, 3, 53, 4, 61, 5, 67, 6, 75, 7, 81, 8, 87, 9, 95, 10, 103, 11, 111
, 65536, 27, 65537, 35, 65538, 43, 65539, 51, 65540, 59, 65541, 67, 65542, 75, 65543, 85, 65544, 93, 65545, 103, 65546, 112, 131072, 23, 131073, 35, 131074, 45, 131075, 55, 131076, 65, 131077, 75, 131078, 87, 13
1079, 99, 131080, 111, 196608, 21, 196609, 33, 196610, 45, 196611, 57, 196612, 69, 196613, 83, 196614, 95, 196615, 113 were unexpected)
        From schema: Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
...

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/powerpc/boot/dts/fsl/t1023si-post.dtsi | 79 +++++++++++----------
 arch/powerpc/boot/dts/fsl/t1040si-post.dtsi | 71 +++++++++---------
 2 files changed, 76 insertions(+), 74 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi b/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
index d552044c5afc..aa5152ca8120 100644
--- a/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
@@ -367,45 +367,46 @@ tmu: tmu@f0000 {
 		reg = <0xf0000 0x1000>;
 		interrupts = <18 2 0 0>;
 		fsl,tmu-range = <0xb0000 0xa0026 0x80048 0x30061>;
-		fsl,tmu-calibration = <0x00000000 0x0000000f
-				       0x00000001 0x00000017
-				       0x00000002 0x0000001e
-				       0x00000003 0x00000026
-				       0x00000004 0x0000002e
-				       0x00000005 0x00000035
-				       0x00000006 0x0000003d
-				       0x00000007 0x00000044
-				       0x00000008 0x0000004c
-				       0x00000009 0x00000053
-				       0x0000000a 0x0000005b
-				       0x0000000b 0x00000064
-
-				       0x00010000 0x00000011
-				       0x00010001 0x0000001c
-				       0x00010002 0x00000024
-				       0x00010003 0x0000002b
-				       0x00010004 0x00000034
-				       0x00010005 0x00000039
-				       0x00010006 0x00000042
-				       0x00010007 0x0000004c
-				       0x00010008 0x00000051
-				       0x00010009 0x0000005a
-				       0x0001000a 0x00000063
-
-				       0x00020000 0x00000013
-				       0x00020001 0x00000019
-				       0x00020002 0x00000024
-				       0x00020003 0x0000002c
-				       0x00020004 0x00000035
-				       0x00020005 0x0000003d
-				       0x00020006 0x00000046
-				       0x00020007 0x00000050
-				       0x00020008 0x00000059
-
-				       0x00030000 0x00000002
-				       0x00030001 0x0000000d
-				       0x00030002 0x00000019
-				       0x00030003 0x00000024>;
+		fsl,tmu-calibration =
+				<0x00000000 0x0000000f>,
+				<0x00000001 0x00000017>,
+				<0x00000002 0x0000001e>,
+				<0x00000003 0x00000026>,
+				<0x00000004 0x0000002e>,
+				<0x00000005 0x00000035>,
+				<0x00000006 0x0000003d>,
+				<0x00000007 0x00000044>,
+				<0x00000008 0x0000004c>,
+				<0x00000009 0x00000053>,
+				<0x0000000a 0x0000005b>,
+				<0x0000000b 0x00000064>,
+
+				<0x00010000 0x00000011>,
+				<0x00010001 0x0000001c>,
+				<0x00010002 0x00000024>,
+				<0x00010003 0x0000002b>,
+				<0x00010004 0x00000034>,
+				<0x00010005 0x00000039>,
+				<0x00010006 0x00000042>,
+				<0x00010007 0x0000004c>,
+				<0x00010008 0x00000051>,
+				<0x00010009 0x0000005a>,
+				<0x0001000a 0x00000063>,
+
+				<0x00020000 0x00000013>,
+				<0x00020001 0x00000019>,
+				<0x00020002 0x00000024>,
+				<0x00020003 0x0000002c>,
+				<0x00020004 0x00000035>,
+				<0x00020005 0x0000003d>,
+				<0x00020006 0x00000046>,
+				<0x00020007 0x00000050>,
+				<0x00020008 0x00000059>,
+
+				<0x00030000 0x00000002>,
+				<0x00030001 0x0000000d>,
+				<0x00030002 0x00000019>,
+				<0x00030003 0x00000024>;
 		#thermal-sensor-cells = <1>;
 	};
 
diff --git a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
index f58eb820eb5e..27e6985d8bde 100644
--- a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
@@ -447,41 +447,42 @@ tmu: tmu@f0000 {
 		reg = <0xf0000 0x1000>;
 		interrupts = <18 2 0 0>;
 		fsl,tmu-range = <0xa0000 0x90026 0x8004a 0x1006a>;
-		fsl,tmu-calibration = <0x00000000 0x00000025
-				       0x00000001 0x00000028
-				       0x00000002 0x0000002d
-				       0x00000003 0x00000031
-				       0x00000004 0x00000036
-				       0x00000005 0x0000003a
-				       0x00000006 0x00000040
-				       0x00000007 0x00000044
-				       0x00000008 0x0000004a
-				       0x00000009 0x0000004f
-				       0x0000000a 0x00000054
-
-				       0x00010000 0x0000000d
-				       0x00010001 0x00000013
-				       0x00010002 0x00000019
-				       0x00010003 0x0000001f
-				       0x00010004 0x00000025
-				       0x00010005 0x0000002d
-				       0x00010006 0x00000033
-				       0x00010007 0x00000043
-				       0x00010008 0x0000004b
-				       0x00010009 0x00000053
-
-				       0x00020000 0x00000010
-				       0x00020001 0x00000017
-				       0x00020002 0x0000001f
-				       0x00020003 0x00000029
-				       0x00020004 0x00000031
-				       0x00020005 0x0000003c
-				       0x00020006 0x00000042
-				       0x00020007 0x0000004d
-				       0x00020008 0x00000056
-
-				       0x00030000 0x00000012
-				       0x00030001 0x0000001d>;
+		fsl,tmu-calibration =
+				<0x00000000 0x00000025>,
+				<0x00000001 0x00000028>,
+				<0x00000002 0x0000002d>,
+				<0x00000003 0x00000031>,
+				<0x00000004 0x00000036>,
+				<0x00000005 0x0000003a>,
+				<0x00000006 0x00000040>,
+				<0x00000007 0x00000044>,
+				<0x00000008 0x0000004a>,
+				<0x00000009 0x0000004f>,
+				<0x0000000a 0x00000054>,
+
+				<0x00010000 0x0000000d>,
+				<0x00010001 0x00000013>,
+				<0x00010002 0x00000019>,
+				<0x00010003 0x0000001f>,
+				<0x00010004 0x00000025>,
+				<0x00010005 0x0000002d>,
+				<0x00010006 0x00000033>,
+				<0x00010007 0x00000043>,
+				<0x00010008 0x0000004b>,
+				<0x00010009 0x00000053>,
+
+				<0x00020000 0x00000010>,
+				<0x00020001 0x00000017>,
+				<0x00020002 0x0000001f>,
+				<0x00020003 0x00000029>,
+				<0x00020004 0x00000031>,
+				<0x00020005 0x0000003c>,
+				<0x00020006 0x00000042>,
+				<0x00020007 0x0000004d>,
+				<0x00020008 0x00000056>,
+
+				<0x00030000 0x00000012>,
+				<0x00030001 0x0000001d>;
 		#thermal-sensor-cells = <1>;
 	};
 
-- 
2.33.0

