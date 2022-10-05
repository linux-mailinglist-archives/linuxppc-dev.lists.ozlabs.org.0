Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 524665F5691
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 16:39:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjHJN1gStz3c3W
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 01:39:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MPIKb3Hv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MPIKb3Hv;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjHHN6PMzz3bj8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 01:38:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664980689; x=1696516689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uI6x+OuIX8Zsde+No42SImigImxqe3gZvNiHUYWU+j8=;
  b=MPIKb3Hv7aTsuUjMK1+lkY3p2+IQuWUP4qhqhDNDvgwzw8VxUgFbRyO9
   tuX6foYek4pF+JZDHuxWQwKiTb/CtavluL2lXKOUfXl/9nMUMMx2dQpxN
   hlcJ1dHGweqTYd/kj3KnQWXMpwRYKtxO8jFIK/9+sM6cuVZ+ibeuEDjr/
   /y37LMOIUOHYj0kdGNyMSpCpLDGqkY3YXA9NK/tuNDUahkDeqZGNn7Omj
   Svk1bK4LTWsJNyaQAcSa2qh1j0RwogG0WxH7Z0wp5PBcbxbltObhR9ovG
   wbKKdTXLJKtd6w/8TLjR8BMztdcivdW5GgNgThcqBewBBOpE/DuxvqyaR
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="282889735"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; 
   d="scan'208";a="282889735"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2022 07:38:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="619481343"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; 
   d="scan'208";a="619481343"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 05 Oct 2022 07:38:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6221A155; Wed,  5 Oct 2022 17:38:21 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v1 2/2] soc: fsl: qe: Switch to use fwnode instead of of_node
Date: Wed,  5 Oct 2022 17:38:12 +0300
Message-Id: <20221005143812.33503-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221005143812.33503-1-andriy.shevchenko@linux.intel.com>
References: <20221005143812.33503-1-andriy.shevchenko@linux.intel.com>
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
Cc: Daniel Scally <djrscally@gmail.com>, Li Yang <leoyang.li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The OF node in the GPIO library is deprecated and soon
will be removed.

GPIO library now accepts fwnode as a firmware node, so
switch the driver to use it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/soc/fsl/qe/gpio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 99f7de43c3c6..9abb45ab138b 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -19,6 +19,8 @@
 #include <linux/gpio.h>
 #include <linux/slab.h>
 #include <linux/export.h>
+#include <linux/property.h>
+
 #include <soc/fsl/qe/qe.h>
 
 struct qe_gpio_chip {
@@ -179,7 +181,7 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
 		goto err0;
 	}
 
-	if (!of_device_is_compatible(gc->of_node, "fsl,mpc8323-qe-pario-bank")) {
+	if (!fwnode_device_is_compatible(gc->fwnode, "fsl,mpc8323-qe-pario-bank")) {
 		pr_debug("%s: tried to get a non-qe pin\n", __func__);
 		err = -EINVAL;
 		goto err0;
-- 
2.35.1

