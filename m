Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 572E71CA3AA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 08:21:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JKw43k2FzDr7Z
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 16:21:08 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JKK36F03zDqt0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 15:54:10 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B4BDA1A1312;
 Fri,  8 May 2020 07:54:07 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2947D1A13CA;
 Fri,  8 May 2020 07:54:03 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 36EF1402DB;
 Fri,  8 May 2020 13:53:57 +0800 (SGT)
From: Biwen Li <biwen.li@oss.nxp.com>
To: leoyang.li@nxp.com, robh+dt@kernel.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com
Subject: [PATCH 2/3] dts: ppc: t4240rdb: add uie_unsupported property to drop
 warning
Date: Fri,  8 May 2020 13:49:24 +0800
Message-Id: <20200508054925.48237-2-biwen.li@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508054925.48237-1-biwen.li@oss.nxp.com>
References: <20200508054925.48237-1-biwen.li@oss.nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Fri, 08 May 2020 16:18:03 +1000
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

This adds uie_unsupported property to drop warning as follows:
    - $ hwclock.util-linux
      hwclock.util-linux: select() to /dev/rtc0
      to wait for clock tick timed out

My case:
    - RTC ds1374's INT pin is connected to VCC on T4240RDB,
      then the RTC cannot inform cpu about the alarm interrupt

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 arch/powerpc/boot/dts/fsl/t4240rdb.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/fsl/t4240rdb.dts b/arch/powerpc/boot/dts/fsl/t4240rdb.dts
index a56a705d41f7..ccdd10202e56 100644
--- a/arch/powerpc/boot/dts/fsl/t4240rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t4240rdb.dts
@@ -144,7 +144,11 @@
 			rtc@68 {
 				compatible = "dallas,ds1374";
 				reg = <0x68>;
-				interrupts = <0x1 0x1 0 0>;
+				// The ds1374's INT pin isn't
+				// connected to cpu's INT pin,
+				// so the rtc cannot synchronize
+				// clock tick per second.
+				uie_unsupported;
 			};
 		};
 
-- 
2.17.1

