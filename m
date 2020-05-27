Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5061E36B7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 05:51:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Wxj8251bzDqJH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 13:51:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=biwen.li@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=oss.nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WxcN05XPzDqJc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 13:47:45 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 02B251A05E9;
 Wed, 27 May 2020 05:47:42 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 76C441A060C;
 Wed, 27 May 2020 05:47:37 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 816D5402BC;
 Wed, 27 May 2020 11:47:31 +0800 (SGT)
From: Biwen Li <biwen.li@oss.nxp.com>
To: leoyang.li@nxp.com, robh+dt@kernel.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com
Subject: [v3 2/2] dts: ppc: t1024rdb: remove interrupts property
Date: Wed, 27 May 2020 11:42:28 +0800
Message-Id: <20200527034228.23793-2-biwen.li@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200527034228.23793-1-biwen.li@oss.nxp.com>
References: <20200527034228.23793-1-biwen.li@oss.nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Biwen Li <biwen.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Biwen Li <biwen.li@nxp.com>

Since the interrupt pin for RTC DS1339 is not connected
to the CPU on T1024RDB, remove the interrupt property
from the device tree.

This also fix the following warning for hwclock.util-linux:
$ hwclock.util-linux
hwclock.util-linux: select() to /dev/rtc0
to wait for clock tick timed out

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 arch/powerpc/boot/dts/fsl/t1024rdb.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/fsl/t1024rdb.dts b/arch/powerpc/boot/dts/fsl/t1024rdb.dts
index 645caff98ed1..605ceec66af3 100644
--- a/arch/powerpc/boot/dts/fsl/t1024rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1024rdb.dts
@@ -161,7 +161,6 @@
 			rtc@68 {
 				compatible = "dallas,ds1339";
 				reg = <0x68>;
-				interrupts = <0x1 0x1 0 0>;
 			};
 		};
 
-- 
2.17.1

