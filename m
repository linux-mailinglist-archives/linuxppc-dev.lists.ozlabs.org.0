Return-Path: <linuxppc-dev+bounces-4203-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 673609F356B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 17:10:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBlKf24rcz305m;
	Tue, 17 Dec 2024 03:10:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734365446;
	cv=none; b=g9DOz3w0Z5DBC4fMqEkW6FhctoDN8QfmZwQ2/hBKYAcJZVlVAh2PzujsTaSvNxyv4MYMTbtlXmiA4HV1JZ6swbHta0TFKkPe3FgMycqN5yQvWh6fpc1bZQ1vj28nPGYJ9P5ZT7vQf33RC4BO7puLVNUNoGbOjh+HYGXuECoBQiEhJ8ppWZFCVPLXUYMBONeIABukeYY0qiBkmybdIlxWTtvKuo8/s1M3zYAIcawn3vFNETaER77S+QUcGa4tLfqhIIXqAyrumIzRYT/7aN3/GR+2DbvYGA1VXSlb+9ZKCwUGKT3vOIOSHm3buiz+xrNYXsRaQOZXsdTxCNv6J/goCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734365446; c=relaxed/relaxed;
	bh=q02g2hmIDWuzyAVMZ79AFfJ53i3H2qjO6KyTqbXRvjQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=na+GeeK3ZtgnEEJ3IHiwNtH5RaPcdN7eoSkMUVLkF5PFGlB6o3sJKq1D4yp1IevN8zETG0EzVaud//JmGXeZCHfu5lVk5hVIb+R/U5WVoyMSvRzVDwGI3eRu/jUEOyySDQJghEU2nsCyIG6fLQgZUg9nC5WAW8ZDNLHi4nah5zCFEvE5tjCCdJeGsBS0HA2dHW4GkkWzjvzabjkVQ5quIdFDFQON9Q8DqBv1kRNvRASgeyfTKBYA3ppugE7RmAchU1C32pegqHcekwJNIz333mBdAj9WD7uCP+9LX8vOTCM0bB9AMNtxIEFq21fMu8qIvd6ZtJAj/lUr2qa5kfuhbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gZUP1DBW; dkim-atps=neutral; spf=none (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gZUP1DBW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBlKd2MTnz302D
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 03:10:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734365445; x=1765901445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3pgiIp1ZgAgTA1StdehyboBWAMBtoT+jkzi2UeAtxoE=;
  b=gZUP1DBW8u8PWdfV/RNuGbjQ2v55CGGpKdRu2wnwuZl9TY1UoxDSM7rM
   8559RcHppcYF7NjGkwaDx/sK36vcPclceIL1tSI+SKAIqbPtEb3CTgoE8
   6qoUzoGFCxJwWHF+g8XUE/tPA7Fk1jAMg0rZfrXzY7gDS6RYNqUszKTWF
   oZRq5QyTW921cEw8ckePOUOphAREMJ6MMgg9fRDgri9wWabHCtNToIr2n
   TzdZvS9rUq9X/0SpN/HOnmHTQAkn4SdDfEaxT9Sn2NdrQpXeE48zvyw1c
   z+EUgKHoRXqicwLVxet3ICrwcajHkNi3bDGr45v8QklKa9hg9m5XH93XQ
   A==;
X-CSE-ConnectionGUID: nKdFfv84RE2rtHOhf37Gbw==
X-CSE-MsgGUID: slxuEU9ITLyRXw68APmU9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45761364"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45761364"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 08:10:44 -0800
X-CSE-ConnectionGUID: FIKKxg6uQFidlzOQxQBWDA==
X-CSE-MsgGUID: 7mBoGB7gQVuGvk/jIrgGow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="97015516"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.29])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 08:10:42 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 3/4] PCI: shpchp: Cleanup logging and debug wrappers
Date: Mon, 16 Dec 2024 18:10:11 +0200
Message-Id: <20241216161012.1774-4-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241216161012.1774-1-ilpo.jarvinen@linux.intel.com>
References: <20241216161012.1774-1-ilpo.jarvinen@linux.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The shpchp hotplug driver defines logging wrappers ctrl_*() and another
set of wrappers with generic names which are just duplicates of
existing generic printk() wrappers. Only the former are useful to
preserve as they handle the controller dereferencing (the latter are
also unused).

The "shpchp_debug" module parameter is used to enable debug logging.
The generic ability to turn on/off debug prints dynamically covers this
usecase already so there is no need to module specific debug handling.
The ctrl_dbg() wrapper also uses a low-level pci_printk() despite
always using KERN_DEBUG level.

Convert ctrl_dbg() to use the pci_dbg() and remove "shpchp_debug" check
from it.

Removing the non-ctrl variants of logging wrappers and "shpchp_debug"
module parameter as they are no longer used.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/hotplug/shpchp.h      | 18 +-----------------
 drivers/pci/hotplug/shpchp_core.c |  3 ---
 2 files changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/pci/hotplug/shpchp.h b/drivers/pci/hotplug/shpchp.h
index f0e2d2d54d71..f9e57dce010b 100644
--- a/drivers/pci/hotplug/shpchp.h
+++ b/drivers/pci/hotplug/shpchp.h
@@ -33,24 +33,8 @@ extern bool shpchp_poll_mode;
 extern int shpchp_poll_time;
 extern bool shpchp_debug;
 
-#define dbg(format, arg...)						\
-do {									\
-	if (shpchp_debug)						\
-		printk(KERN_DEBUG "%s: " format, MY_NAME, ## arg);	\
-} while (0)
-#define err(format, arg...)						\
-	printk(KERN_ERR "%s: " format, MY_NAME, ## arg)
-#define info(format, arg...)						\
-	printk(KERN_INFO "%s: " format, MY_NAME, ## arg)
-#define warn(format, arg...)						\
-	printk(KERN_WARNING "%s: " format, MY_NAME, ## arg)
-
 #define ctrl_dbg(ctrl, format, arg...)					\
-	do {								\
-		if (shpchp_debug)					\
-			pci_printk(KERN_DEBUG, ctrl->pci_dev,		\
-					format, ## arg);		\
-	} while (0)
+	pci_dbg(ctrl->pci_dev, format, ## arg);
 #define ctrl_err(ctrl, format, arg...)					\
 	pci_err(ctrl->pci_dev, format, ## arg)
 #define ctrl_info(ctrl, format, arg...)					\
diff --git a/drivers/pci/hotplug/shpchp_core.c b/drivers/pci/hotplug/shpchp_core.c
index a10ce7be7f51..0c341453afc6 100644
--- a/drivers/pci/hotplug/shpchp_core.c
+++ b/drivers/pci/hotplug/shpchp_core.c
@@ -22,7 +22,6 @@
 #include "shpchp.h"
 
 /* Global variables */
-bool shpchp_debug;
 bool shpchp_poll_mode;
 int shpchp_poll_time;
 
@@ -33,10 +32,8 @@ int shpchp_poll_time;
 MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
 
-module_param(shpchp_debug, bool, 0644);
 module_param(shpchp_poll_mode, bool, 0644);
 module_param(shpchp_poll_time, int, 0644);
-MODULE_PARM_DESC(shpchp_debug, "Debugging mode enabled or not");
 MODULE_PARM_DESC(shpchp_poll_mode, "Using polling mechanism for hot-plug events or not");
 MODULE_PARM_DESC(shpchp_poll_time, "Polling mechanism frequency, in seconds");
 
-- 
2.39.5


