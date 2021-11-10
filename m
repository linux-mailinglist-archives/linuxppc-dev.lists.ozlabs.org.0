Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A99444BF96
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 12:01:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hq23C3GTmz2ywF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 22:01:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hq22h5q6xz2yLg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 22:00:59 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="231370305"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="231370305"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 02:59:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="545970351"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 10 Nov 2021 02:59:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id C735027B; Wed, 10 Nov 2021 12:59:56 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/3] soc: fsl: Replace kernel.h with the necessary
 inclusions
Date: Wed, 10 Nov 2021 12:59:52 +0200
Message-Id: <20211110105952.62013-3-andriy.shevchenko@linux.intel.com>
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

When kernel.h is used in the headers it adds a lot into dependency hell,
especially when there are circular dependencies are involved.

Replace kernel.h inclusion with the list of what is really being used.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: updated Cc list based on previous changes to MAINTAINERS
 include/soc/fsl/dpaa2-fd.h    | 3 ++-
 include/soc/fsl/qe/immap_qe.h | 3 ++-
 include/soc/fsl/qe/qe_tdm.h   | 4 +++-
 include/soc/fsl/qe/ucc_fast.h | 2 +-
 include/soc/fsl/qe/ucc_slow.h | 2 +-
 5 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/soc/fsl/dpaa2-fd.h b/include/soc/fsl/dpaa2-fd.h
index 90ae8d191f1a..bae490cac0aa 100644
--- a/include/soc/fsl/dpaa2-fd.h
+++ b/include/soc/fsl/dpaa2-fd.h
@@ -7,7 +7,8 @@
 #ifndef __FSL_DPAA2_FD_H
 #define __FSL_DPAA2_FD_H
 
-#include <linux/kernel.h>
+#include <linux/byteorder/generic.h>
+#include <linux/types.h>
 
 /**
  * DOC: DPAA2 FD - Frame Descriptor APIs for DPAA2
diff --git a/include/soc/fsl/qe/immap_qe.h b/include/soc/fsl/qe/immap_qe.h
index 7614fee532f1..edd601f53f5d 100644
--- a/include/soc/fsl/qe/immap_qe.h
+++ b/include/soc/fsl/qe/immap_qe.h
@@ -13,7 +13,8 @@
 #define _ASM_POWERPC_IMMAP_QE_H
 #ifdef __KERNEL__
 
-#include <linux/kernel.h>
+#include <linux/types.h>
+
 #include <asm/io.h>
 
 #define QE_IMMAP_SIZE	(1024 * 1024)	/* 1MB from 1MB+IMMR */
diff --git a/include/soc/fsl/qe/qe_tdm.h b/include/soc/fsl/qe/qe_tdm.h
index b6febe225071..43ea830cfe1f 100644
--- a/include/soc/fsl/qe/qe_tdm.h
+++ b/include/soc/fsl/qe/qe_tdm.h
@@ -10,8 +10,8 @@
 #ifndef _QE_TDM_H_
 #define _QE_TDM_H_
 
-#include <linux/kernel.h>
 #include <linux/list.h>
+#include <linux/types.h>
 
 #include <soc/fsl/qe/immap_qe.h>
 #include <soc/fsl/qe/qe.h>
@@ -19,6 +19,8 @@
 #include <soc/fsl/qe/ucc.h>
 #include <soc/fsl/qe/ucc_fast.h>
 
+struct device_node;
+
 /* SI RAM entries */
 #define SIR_LAST	0x0001
 #define SIR_BYTE	0x0002
diff --git a/include/soc/fsl/qe/ucc_fast.h b/include/soc/fsl/qe/ucc_fast.h
index 9696a5b9b5d1..ad60b87a3c69 100644
--- a/include/soc/fsl/qe/ucc_fast.h
+++ b/include/soc/fsl/qe/ucc_fast.h
@@ -10,7 +10,7 @@
 #ifndef __UCC_FAST_H__
 #define __UCC_FAST_H__
 
-#include <linux/kernel.h>
+#include <linux/types.h>
 
 #include <soc/fsl/qe/immap_qe.h>
 #include <soc/fsl/qe/qe.h>
diff --git a/include/soc/fsl/qe/ucc_slow.h b/include/soc/fsl/qe/ucc_slow.h
index 11a216e4e919..7548ce8a202d 100644
--- a/include/soc/fsl/qe/ucc_slow.h
+++ b/include/soc/fsl/qe/ucc_slow.h
@@ -11,7 +11,7 @@
 #ifndef __UCC_SLOW_H__
 #define __UCC_SLOW_H__
 
-#include <linux/kernel.h>
+#include <linux/types.h>
 
 #include <soc/fsl/qe/immap_qe.h>
 #include <soc/fsl/qe/qe.h>
-- 
2.33.0

