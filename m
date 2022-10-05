Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CA35F5791
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 17:31:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjJSj2cBsz3drg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 02:31:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nOET4rbo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nOET4rbo;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjJQp4sFrz30Ky
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 02:29:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664983778; x=1696519778;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kjLtd57mMK+EVcgFbt6pO20kW/y/VllWb3uvAku8dxQ=;
  b=nOET4rbowcWuBQuVpaJOYdbmfJWIcxtl4cr1LtjGX3qn+dRZvvdBncu7
   svhgX7PSh3iwXYsNLAPmpDHNoVjL6fISs+pS/aXGHNV1IR7cUcitRembr
   qhFKADAk3Tw1Cbv8QZF7EKJmGCY0/5GWXXGG8iHXRwb4weIWEK+2A2xTg
   zkIfkAdV1xPPgL5v02R8Kun/n8Nfa2tu2yqqURopFaNo0+/LBbhrMscDJ
   Sh5/U930yyzn1C4XRxiqNSm70zrnj/dWtEc8onBZHU8rJJAAairVjyt1v
   Vs/sDbxvdObd735iBv1vdRzJ7ktgmOWuIFIv84NseFwAUpI2+iDjx93zX
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="304170124"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; 
   d="scan'208";a="304170124"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2022 08:29:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="626609384"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; 
   d="scan'208";a="626609384"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 05 Oct 2022 08:29:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0E7E97C; Wed,  5 Oct 2022 18:29:51 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v2 1/2] device property: Introduce fwnode_device_is_compatible() helper
Date: Wed,  5 Oct 2022 18:29:46 +0300
Message-Id: <20221005152947.71696-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221005152947.71696-1-andriy.shevchenko@linux.intel.com>
References: <20221005152947.71696-1-andriy.shevchenko@linux.intel.com>
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
 include/linux/property.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/linux/property.h b/include/linux/property.h
index 1c26d263d5e4..701570423943 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -55,7 +55,6 @@ int device_property_read_string(struct device *dev, const char *propname,
 int device_property_match_string(struct device *dev,
 				 const char *propname, const char *string);
 
-bool fwnode_device_is_available(const struct fwnode_handle *fwnode);
 bool fwnode_property_present(const struct fwnode_handle *fwnode,
 			     const char *propname);
 int fwnode_property_read_u8_array(const struct fwnode_handle *fwnode,
@@ -77,6 +76,15 @@ int fwnode_property_read_string(const struct fwnode_handle *fwnode,
 				const char *propname, const char **val);
 int fwnode_property_match_string(const struct fwnode_handle *fwnode,
 				 const char *propname, const char *string);
+
+bool fwnode_device_is_available(const struct fwnode_handle *fwnode);
+
+static inline
+bool fwnode_device_is_compatible(const struct fwnode_handle *fwnode, const char *compat)
+{
+	return fwnode_property_match_string(fwnode, "compatible", compat) >= 0;
+}
+
 int fwnode_property_get_reference_args(const struct fwnode_handle *fwnode,
 				       const char *prop, const char *nargs_prop,
 				       unsigned int nargs, unsigned int index,
-- 
2.35.1

