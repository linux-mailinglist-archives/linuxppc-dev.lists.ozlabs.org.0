Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D917821296
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 05:39:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454vDQ4rxTzDqNC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 13:39:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454vBs37TWzDqN9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 13:38:12 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 06A0B200065;
 Fri, 17 May 2019 05:38:09 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 54977200014;
 Fri, 17 May 2019 05:38:03 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 1B70C402BF;
 Fri, 17 May 2019 11:37:56 +0800 (SGT)
From: Ran Wang <ran.wang_1@nxp.com>
To: Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH V2 2/3] Documentation: dt: binding: fsl: Add 'little-endian'
 and update Chassis define
Date: Fri, 17 May 2019 11:39:45 +0800
Message-Id: <20190517033946.30763-2-ran.wang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517033946.30763-1-ran.wang_1@nxp.com>
References: <20190517033946.30763-1-ran.wang_1@nxp.com>
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
Cc: Len Brown <len.brown@intel.com>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Ran Wang <ran.wang_1@nxp.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

By default, QorIQ SoC's RCPM register block is Big Endian. But
there are some exceptions, such as LS1088A and LS2088A, are Little
Endian. So add this optional property to help identify them.

Actually LS2021A and other Layerscapes won't totally follow Chassis
2.1, so separate them from powerpc SoC.

Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
---
Change in v2:
	- None.

 Documentation/devicetree/bindings/soc/fsl/rcpm.txt |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
index e284e4e..058154c 100644
--- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
+++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
@@ -20,6 +20,7 @@ Required properites:
 	* "fsl,qoriq-rcpm-1.0": for chassis 1.0 rcpm
 	* "fsl,qoriq-rcpm-2.0": for chassis 2.0 rcpm
 	* "fsl,qoriq-rcpm-2.1": for chassis 2.1 rcpm
+	* "fsl,qoriq-rcpm-2.1+": for chassis 2.1+ rcpm
 
 All references to "1.0" and "2.0" refer to the QorIQ chassis version to
 which the chip complies.
@@ -27,7 +28,12 @@ Chassis Version		Example Chips
 ---------------		-------------------------------
 1.0				p4080, p5020, p5040, p2041, p3041
 2.0				t4240, b4860, b4420
-2.1				t1040, ls1021
+2.1				t1040,
+2.1+			ls1021a, ls1012a, ls1043a, ls1046a
+
+Optional properties:
+ - little-endian : RCPM register block is Little Endian. Without it RCPM
+   will be Big Endian (default case).
 
 Example:
 The RCPM node for T4240:
-- 
1.7.1

