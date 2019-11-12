Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCF2F9A1A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 20:58:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CJTp3QrLzF440
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 06:58:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.65; helo=mail-wm1-f65.google.com;
 envelope-from=valentin.longchamp@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=longchamp.me
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CJRF07BfzF5Zy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 06:56:34 +1100 (AEDT)
Received: by mail-wm1-f65.google.com with SMTP id j18so3139293wmk.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 11:56:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=utN0GLYPOCBjFYy3SF19oKUFCOFWWXRO+a2ccEr7M3U=;
 b=d1FMgkWcQvv2o14JY8prciyacYzEyvreOvfL4R4//TiW+5kvFoOTMkfwC4znTgg0yc
 ZynK3iJnqoBKwAKrv2KG1nyGUaXnxU1rJPtC+dxknnchVO5lVyyq45PssB6tUZfZZl2k
 cGnHxuVcO32jYavy0lttGsRu/tH70QQEvK0Ls/IpUB/ZyZHT0nxZC9SKkPMuBIAo4wwH
 vAhcaOf0qFO6sUY1sQ/Oe+LWQTP/Kg4DVeEAmRZPgaxU/wwEYNshSW+VXgzyHssy6FvJ
 nt4OcwMQIaYUQwhDCommWMdj1CIVpdoXvXijRBkHS9pTzeQgkkNzYDydhGe1lbKXCoHr
 xlQw==
X-Gm-Message-State: APjAAAWxPqsT/011qYiOUBQaDfyE/g9YkMCy8ziBWXSudR4s0qtcUAZL
 ZcSRCa2z7wJqRJR7zCxV5DhyjPWIUHseDw==
X-Google-Smtp-Source: APXvYqw0ispQu/pLwDZK9aX3eH0t6Z6Qo+zTYfY51vjb58Mm423Or+ItGu/mxCwECc9S6C9sKoiLrg==
X-Received: by 2002:a1c:ab0a:: with SMTP id u10mr6015295wme.0.1573588590354;
 Tue, 12 Nov 2019 11:56:30 -0800 (PST)
Received: from zenbook-val.home (bbcs-121-200.pub.wingo.ch. [144.2.121.200])
 by smtp.gmail.com with ESMTPSA id l4sm4028813wml.33.2019.11.12.11.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 11:56:29 -0800 (PST)
From: Valentin Longchamp <valentin@longchamp.me>
To: linuxppc-dev@lists.ozlabs.org,
	oss@buserror.net
Subject: [PATCH] powerpc/kmcent2: add ranges to the pci bridges
Date: Tue, 12 Nov 2019 20:56:23 +0100
Message-Id: <20191112195623.238-1-valentin@longchamp.me>
X-Mailer: git-send-email 2.17.1
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
Cc: Valentin Longchamp <valentin@longchamp.me>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This removes the warnings about the fact that the 4 pci bridges (i.e.
the 4 pci hosts) don't have any ranges.

Signed-off-by: Valentin Longchamp <valentin@longchamp.me>
---
 arch/powerpc/boot/dts/fsl/kmcent2.dts | 36 +++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/powerpc/boot/dts/fsl/kmcent2.dts b/arch/powerpc/boot/dts/fsl/kmcent2.dts
index 48b7f9797124..5731928e9264 100644
--- a/arch/powerpc/boot/dts/fsl/kmcent2.dts
+++ b/arch/powerpc/boot/dts/fsl/kmcent2.dts
@@ -258,14 +258,50 @@
 
 	pci1: pcie@ffe250000 {
 		status = "disabled";
+		reg = <0xf 0xfe250000 0 0x10000>;
+		ranges = <0x02000000 0 0xe0000000 0xc 0x10000000 0 0x10000000
+			  0x01000000 0 0 0xf 0xf8010000 0 0x00010000>;
+		pcie@0 {
+			ranges = <0x02000000 0 0xe0000000
+				  0x02000000 0 0xe0000000
+				  0 0x10000000
+
+				  0x01000000 0 0x00000000
+				  0x01000000 0 0x00000000
+				  0 0x00010000>;
+		};
 	};
 
 	pci2: pcie@ffe260000 {
 		status = "disabled";
+		reg = <0xf 0xfe260000 0 0x10000>;
+		ranges = <0x02000000 0 0xe0000000 0xc 0x20000000 0 0x10000000
+			  0x01000000 0 0x00000000 0xf 0xf8020000 0 0x00010000>;
+		pcie@0 {
+			ranges = <0x02000000 0 0xe0000000
+				  0x02000000 0 0xe0000000
+				  0 0x10000000
+
+				  0x01000000 0 0x00000000
+				  0x01000000 0 0x00000000
+				  0 0x00010000>;
+		};
 	};
 
 	pci3: pcie@ffe270000 {
 		status = "disabled";
+		reg = <0xf 0xfe270000 0 0x10000>;
+		ranges = <0x02000000 0 0xe0000000 0xc 0x30000000 0 0x10000000
+			  0x01000000 0 0x00000000 0xf 0xf8030000 0 0x00010000>;
+		pcie@0 {
+			ranges = <0x02000000 0 0xe0000000
+				  0x02000000 0 0xe0000000
+				  0 0x10000000
+
+				  0x01000000 0 0x00000000
+				  0x01000000 0 0x00000000
+				  0 0x00010000>;
+		};
 	};
 
 	qe: qe@ffe140000 {
-- 
2.17.1

