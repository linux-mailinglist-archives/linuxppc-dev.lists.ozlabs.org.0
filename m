Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4A05F5695
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 16:39:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjHKN4Msjz3c74
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 01:39:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dqJZRu+7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dqJZRu+7;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjHHQ5Htzz3bj8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 01:38:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664980690; x=1696516690;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2SPqUsjF5qBIF1pomEqZowlFagnMO4IU7LXTD0kTMtM=;
  b=dqJZRu+7BrxnRtR5aASmcCbGOgEHGUDavbEJJ8Z9FBoPO+PC7+QRk41N
   B3AIiBPCOdEB4MieOse8b+zkD/QsrHAavYhBb8LVOnUPg4Hqs5fkXQvo/
   b/uBtgZD+gruY4XC6W3iuVB5a6fBw03yhhgaQ40BdHsjpCzIqp4f09XZ2
   +pSlt+qVqe9Yk97zEL+57mMzsCMhksGoCssJIU9wwBdrmepUswcT7zdzv
   1cZRUu6gEMePLce/NZacYNC0syyNfEz1KFk5wWTxQ07sbQXieE7UZHt0J
   DMTKSTgeIMOLOuRtbzEKaM0p7925K+qXbEpD4PO8r8uJPHjN258Bjd3c9
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="389465421"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; 
   d="scan'208";a="389465421"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2022 07:38:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="869420640"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; 
   d="scan'208";a="869420640"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 05 Oct 2022 07:37:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 585C0155; Wed,  5 Oct 2022 17:38:17 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v1 1/2] device property: Introduce fwnode_device_is_compatible() helper
Date: Wed,  5 Oct 2022 17:38:11 +0300
Message-Id: <20221005143812.33503-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
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

The fwnode_device_is_compatible() helper searches for the
given string in the "compatible" string array property and,
if found, returns true.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/property.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/property.h b/include/linux/property.h
index 1c26d263d5e4..4948a890b153 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -56,6 +56,11 @@ int device_property_match_string(struct device *dev,
 				 const char *propname, const char *string);
 
 bool fwnode_device_is_available(const struct fwnode_handle *fwnode);
+bool fwnode_device_is_compatible(const struct fwnode_handle *fwnode, const char *compat)
+{
+	return fwnode_property_match_string(fwnode, "compatible", compat) >= 0;
+}
+
 bool fwnode_property_present(const struct fwnode_handle *fwnode,
 			     const char *propname);
 int fwnode_property_read_u8_array(const struct fwnode_handle *fwnode,
-- 
2.35.1

