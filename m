Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D005F5789
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 17:30:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjJRh2Q6vz3cBS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 02:30:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WIpfaAMu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WIpfaAMu;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjJQn34fXz30Ky
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 02:29:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664983777; x=1696519777;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DzvXpY92dl8nC6GNWGmVSLtEet2B9qn61IBFwM95YnI=;
  b=WIpfaAMuJ6XKn61dqYhniFrbb6mZ5GUaluLMsOWAZLhKBObOdy+QvwuC
   KxnXJ1wXqbqeFWvPpGKLU9Cb5dviOdcMSkdOmZTkz5Dljf6CTdnQqenfI
   VE0b0ddXTZKlUzSw1jQN77KkUtwcTrQWl/ox+UihQRrEdK+dGamtcxR9K
   eNrQObOyf62keOIepa8ir2doKzgnIvAN4+1d2n4C3iycbnlIeQsCSo6eS
   tIwUmMV5K5YcI5UDRHTJ+fAPZFRcIxp7LRdszUyaqWoA3gKOT9/xUH7oy
   etRigSFdfDD7higVwCzM1x4KUpo4JIQDvhr45CNERIpGW+le+PIV4K9xW
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="290432488"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; 
   d="scan'208";a="290432488"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2022 08:29:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="686993833"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; 
   d="scan'208";a="686993833"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 05 Oct 2022 08:29:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 05724155; Wed,  5 Oct 2022 18:29:50 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v2 0/2] gpiolib: more cleanups to get rid of of_node
Date: Wed,  5 Oct 2022 18:29:45 +0300
Message-Id: <20221005152947.71696-1-andriy.shevchenko@linux.intel.com>
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

One more user outside of GPIO library and pin control folders needs
to be updated to use fwnode instead of of_node. To make this easier
introduce a helper in property.h and convert the user.

Note, the helper will be useful not only for the current users,
but any future ones that want to replace of_device_is_compatible()
with analogous fwnode API.

Changelog v2:
- placed new helper correctly in the property.h

Andy Shevchenko (2):
  device property: Introduce fwnode_device_is_compatible() helper
  soc: fsl: qe: Switch to use fwnode instead of of_node

 drivers/soc/fsl/qe/gpio.c |  4 +++-
 include/linux/property.h  | 10 +++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.35.1

