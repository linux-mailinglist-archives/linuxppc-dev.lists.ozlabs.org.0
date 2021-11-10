Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8865C44BFC2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 12:03:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hq25X3jYGz3c90
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 22:03:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 124 seconds by postgrey-1.36 at boromir;
 Wed, 10 Nov 2021 22:03:04 AEDT
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hq2544Xntz2x9N
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 22:03:04 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="232891453"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="232891453"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 02:59:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="452260777"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga003.jf.intel.com with ESMTP; 10 Nov 2021 02:59:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id B755A155; Wed, 10 Nov 2021 12:59:56 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/3] soc: fsl: Correct MAINTAINERS database (SOC)
Date: Wed, 10 Nov 2021 12:59:51 +0200
Message-Id: <20211110105952.62013-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211110105952.62013-1-andriy.shevchenko@linux.intel.com>
References: <20211110105952.62013-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

MAINTAINERS lacks of proper coverage for FSL headers. Fix it accordingly.

Fixes: 1b48706f027c ("MAINTAINERS: add entry for Freescale SoC drivers")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: new patch
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a35e4d9e52b8..8748328fdc63 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7689,6 +7689,7 @@ F:	Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml
 F:	Documentation/devicetree/bindings/soc/fsl/
 F:	drivers/soc/fsl/
 F:	include/linux/fsl/
+F:	include/soc/fsl/
 
 FREESCALE SOC FS_ENET DRIVER
 M:	Pantelis Antoniou <pantelis.antoniou@gmail.com>
-- 
2.33.0

