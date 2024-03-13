Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E108D87A8D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 14:57:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E7wskHd8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvsXC4k6Lz3vXf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 00:57:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E7wskHd8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvsWV3r05z3bfS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 00:56:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710338215; x=1741874215;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GB0XhLkoXhj91tZjk/utBUz3p/nRmxqnPNcYk6PNq9w=;
  b=E7wskHd8FFKbbVa3YH6cbIbV4L5eYILFpb/zzGbmI4UN38CarhHPopcW
   RSj5YpWsjJ4mPj17ZorbD2vr8ppJ/o2JWXCnM1cF7OWiLhV2K13N7Zg1z
   bst21AguvIZXvnhnnTOC5OXLllR79En448xvYSuYPizhSJl4yvv4qW2ha
   Ts96MtYf6p3VTqkwN112mW9snihn3OGeY7uboryRCUpgiXwEgmBAZZm0Q
   t+22bh8DklW5UqqcSdJSC450JgEBoS9jgiccnvpSFD9YGTH+c6m9I0CQE
   EyE1WuZkR9dSkbD/KNh27AMA7SFmrfoQCJ515qP7InH3pWmIH3QXpf+oH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5710553"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="5710553"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 06:56:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="937054151"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="937054151"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2024 06:56:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 95C2A4EB; Wed, 13 Mar 2024 15:56:46 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rob Herring <robh@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] powerpc/52xx: Replace of_gpio.h by proper one
Date: Wed, 13 Mar 2024 15:56:45 +0200
Message-ID: <20240313135645.2066362-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Anatolij Gustschin <agust@denx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

of_gpio.h is deprecated and subject to remove.
The driver doesn't use it directly, replace it
with what is really being used.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/powerpc/platforms/52xx/mpc52xx_common.c | 2 --
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c    | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/mpc52xx_common.c b/arch/powerpc/platforms/52xx/mpc52xx_common.c
index b4938e344f71..253421ffb4e5 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_common.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_common.c
@@ -12,12 +12,10 @@
 
 #undef DEBUG
 
-#include <linux/gpio.h>
 #include <linux/kernel.h>
 #include <linux/spinlock.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
-#include <linux/of_gpio.h>
 #include <linux/export.h>
 #include <asm/io.h>
 #include <asm/mpc52xx.h>
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index 581059527c36..2bd6abcdc113 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -48,6 +48,7 @@
  * the output mode.  This driver does not change the output mode setting.
  */
 
+#include <linux/gpio/driver.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -56,7 +57,6 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/kernel.h>
 #include <linux/property.h>
-- 
2.43.0.rc1.1.gbec44491f096

